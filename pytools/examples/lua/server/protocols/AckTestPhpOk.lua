module("AckTestPhpOk", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckTestPhpOk})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.u64 = 0
	self.strxx = 0
	self.msg_req = nil
	self.msg_opt_flag = 0
	self.msg_opt = nil
	self.msg_rep = {}
end


function encode(self)
	pack = packet.new()
	pack:writeu64(self.u64)
	pack:writeString(self.strxx)
	pack:writeBytes(self.msg_req:getBytes())
	pack:writeU8(self.msg_opt_flag)
	if self.msg_opt_flag then
		pack:writeBytes(self.msg_opt:getBytes())
	end
	msg_rep_count = table.getn(self.msg_rep)
	pack:writeU16(msg_rep_count)
	for i = 1, msg_rep_count do
		pack:writeBytes(table.remove(self.msg_rep):getBytes())
	end
	return pack:encode(Msg.P_ACK_TEST_PHP_OK)
end


function setU64(self, u64)
	self.u64 = u64
end

function setStrxx(self, strxx)
	self.strxx = strxx
end

function setMsgReq(self, msg_req)
	self.msg_req = msg_req
end

function setMsgOpt(self, msg_opt)
	self.msg_opt_flag = 1
	self.msg_opt = msg_opt
end

function setMsgRep(self, msg_rep)
	self.msg_rep = msg_rep
end

