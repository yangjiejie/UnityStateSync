require "socket"
require "pack"


-- local M = {}
-- local moduleName = ...
-- _G[moduleName] = M
-- setmetatable(M, {__index = _G})
-- local _ENV = M
net = {}
setmetatable(net, {__index = _G})
local _ENV = net


function new(client)
	local tab = {}
	setmetatable(tab, {__index = net})
	tab:init(client)
	return tab
end

function init(self, client)
	self.client 		= client
	
	self.receive_len	= 1024
	self.pack_header	= 2
	
	self.buffer			= ""
	self.buffer_len		= 0
end


function send(self, buff)
	self.client:send(buff)
end


function doMsg(self, packetId, pack)
	print()
	print("packetId: " .. packetId)
	if packetId == Msg.P_REQ_TEST_X_X then
		local reqTestXX = ReqTestXX.new():decode(pack)

		print("reqTestXX.id_u8: ", reqTestXX:getIdU8())
		print("reqTestXX.id_u16: ", reqTestXX:getIdU16())
		print("reqTestXX.id_u32: ", reqTestXX:getIdU32())
		print("reqTestXX.optional_id_u8: ", reqTestXX:getOptionalIdU8())

		local ackTestXX = AckTestXX.new()
		ackTestXX:setIdU8(110)
		ackTestXX:setIdU16(111)
		ackTestXX:setIdU32(112)
		repU8Table = {}
		table.insert(repU8Table, 12)
		ackTestXX:setRepeatIdU8(repU8Table)
		ackTestXX:setOptionalIdU8(123)
		self:send(ackTestXX:encode())
	elseif packetId == Msg.P_REQ_TEST_SEND then
		local reqTestSend = ReqTestSend.new():decode(pack)

		print("reqTestSend:getRoleBase():getUid(): " .. reqTestSend:getRoleBase():getUid())
		print("reqTestSend:getRoleBase():getUname(): " .. reqTestSend:getRoleBase():getUname())
		print("reqTestSend:getOpRoleBase():getUname(): " .. reqTestSend:getOpRoleBase():getUname())
		print("reqTestSend:getOpRoleBase():getUid(): " .. reqTestSend:getOpRoleBase():getUid())

		local roleBase 	= MsgRoleBase.new()
		roleBase:setUid(110)
		roleBase:setUname("mirahs")
		idF32Table = {}
		table.insert(idF32Table, 12.34)
		local ackTestSendOk = AckTestSendOk.new()
		ackTestSendOk:setIdU8(111)
		ackTestSendOk:setRoleBase(roleBase)
		ackTestSendOk:setIdF32(idF32Table)
		ackTestSendOk:setIdOpU8(123)
		ackTestSendOk:setOpRoleBase(roleBase)
		self:send(ackTestSendOk:encode())
	else
		print("unknown packetId!")
	end
end


function run(self)
	self.client:settimeout(0)

	while true do
		local data
		local buffer, status, overflow = self.client:receive(self.receive_len)
		
		if buffer == nil then
			if status == "closed" then
				return
			end
			data = overflow
		else
			data = buffer
		end
		if data ~= nil then
			dataLen = string.len(data)
			if dataLen ~= 0 then
				self.buffer_len = self.buffer_len + dataLen
				self.buffer = string.pack(">A2", self.buffer, data)
				self:dispatch()
			end
		end
	end
end

function dispatch(self)
	while self.buffer_len > self.pack_header do
		local _next, packLen = string.unpack(self.buffer, ">H")
		local newbuffer_len = self.buffer_len - self.pack_header - packLen
		if (newbuffer_len >= 0) then
			buff = string.sub(self.buffer, self.pack_header + 1, self.pack_header + 1 + packLen)
			self.buffer		= string.sub(self.buffer, self.pack_header + 1 + packLen, -1)
			self.buffer_len = newbuffer_len

			local pack = packet.new(buff)
			local packetId = pack:readU16()
			--print("dispatchEvent packetId: " .. packetId .. "\n")
			self:doMsg(packetId, pack)
		end
	end
end
