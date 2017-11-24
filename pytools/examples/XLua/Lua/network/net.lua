local socket = require "socket"
require "pack"


-- local M = {}
-- local moduleName = ...
-- _G[moduleName] = M
-- setmetatable(M, {__index = _G})
-- local _ENV = M
net = {}
setmetatable(net, {__index = _G})
local _ENV = net


function new(ip, port)
	local tab = {}
	setmetatable(tab, {__index = net})
	tab:init(ip, port)
	return tab
end

function init(self, str_ip, n_port)
	self.ip 			= str_ip
	self.port			= n_port
	self.client 		= nil
	
	self.receive_len	= 1024
	self.pack_header	= 2
	
	self.buffer			= ""
	self.buffer_len		= 0
	
	--消息映射表
	self.msg_handlers	= {}
end


function connect(self)
	self.client	= assert(socket.connect(self.ip, self.port))
	self.client:settimeout(0)

	return self.client
end

function send(self, buff)
	self.client:send(buff)
end



-- 多处 listen 同一个 cmd 的消息都会被调用
-- func_handle 里不应该做太耗时的工作
function add_event_listener(self, n_msgCmd, func_handle, listenerObj)
	local obj_type = type(func_handle)
	if "function" ~= obj_type then 
		print("[Net: add_event_listener() func_handle不是函数 msgCmd: " .. n_msgCmd .. "]")
		return
	end
	
	local msgHandleSet = self.msg_handlers[n_msgCmd]
	
	if msgHandleSet then
		local listenStruct = {}
		listenStruct.listenerObj = listenerObj
		listenStruct.funcHandle = func_handle
		table.insert(msgHandleSet, listenStruct)
	else
		local handleSet = {}
		local listenStruct = {}
		listenStruct.listenerObj = listenerObj
		listenStruct.funcHandle = func_handle
		table.insert(handleSet,listenStruct)
		
		self.msg_handlers[n_msgCmd] = handleSet
	end
end

function removeEventListener(self, n_msgCmd, listenObj)
	local msgHandleSet = self.msg_handlers[n_msgCmd]
	if msgHandleSet then
		local delIndex = nil
		for i, v in ipairs (msgHandleSet) do
			if v.listenerObj == listenObj then
				delIndex = i
				break
			end
		end 
		if delIndex then
			table.remove(msgHandleSet, delIndex)
		end
	end
end

-- 由取消息的定时器调用
function dispatchEvent(self, n_msgCmd, msgPacket)
	local msgHandleSet = self.msg_handlers[n_msgCmd]
	if msgHandleSet then
		for i, listenStruct in ipairs (msgHandleSet) do
			local listenObj  = listenStruct.listenerObj
			local funcHandle = listenStruct.funcHandle
			funcHandle(listenObj, msgPacket)
		end 
	end
end


-- function run(self)
-- 	while true do
-- 		local data
-- 		local buffer, status, overflow = self.client:receive(self.receive_len)
		
-- 		if buffer == nil then
-- 			if status == "closed" then
-- 				return
-- 			end
-- 			data = overflow
-- 		else
-- 			data = buffer
-- 		end
-- 		if data ~= nil then
-- 			dataLen = string.len(data)
-- 			if dataLen ~= 0 then
-- 				self.buffer_len = self.buffer_len + dataLen
-- 				self.buffer = string.pack(">A2", self.buffer, data)
-- 				self:dispatch()
-- 			end
-- 		end
-- 	end
-- end
function ticket(self)
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
			print("dispatchEvent packetId: " .. packetId .. "\n")
			self:dispatchEvent(packetId, pack)
		end
	end
end
