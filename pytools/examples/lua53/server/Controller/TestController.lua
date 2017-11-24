-- local M = {}
-- local moduleName = ...
-- _G[moduleName] = M
-- setmetatable(M, {__index = _G})
-- local _ENV = M
TestController = {}
setmetatable(TestController, {__index = _G})
local _ENV = TestController


local instance = nil

function getInstance()
	if not instance then
		instance = TestController.new()
	end
	return instance
end

function new()
	local obj = {}
	setmetatable(obj, {__index = TestController})
	obj:init()
	return obj
end

function init(self)
	self.name = "TestController"

	self:addSocketEvent()
end

function addSocketEvent(self)
	g_net:add_event_listener(Msg.P_ACK_TEST_X_X, onAckTestXX, self)
	g_net:add_event_listener(Msg.P_ACK_TEST_SEND_OK, onAckTestSendOk, self)
end


function onAckTestXX(self, pack)
	local ackTestXX = AckTestXX.new():decode(pack)

	print("ackTestXX.id_u8: ", ackTestXX:getIdU8())
	print("ackTestXX.id_u16: ", ackTestXX:getIdU16())
	print("ackTestXX.id_u32: ", ackTestXX:getIdU32())
	print("ackTestXX.optional_id_u8: ", ackTestXX:getOptionalIdU8())
end

function onAckTestSendOk(self, pack)
	local ackTestSendOk = AckTestSendOk.new():decode(pack)

	print("ackTestSendOk:getRoleBase():getUid(): " .. ackTestSendOk:getRoleBase():getUid())
	print("ackTestSendOk:getRoleBase():getUname(): " .. ackTestSendOk:getRoleBase():getUname())
	print("ackTestSendOk:getOpRoleBase():getUname(): " .. ackTestSendOk:getOpRoleBase():getUname())
	print("ackTestSendOk:getOpRoleBase():getUid(): " .. ackTestSendOk:getOpRoleBase():getUid())
end
