ReqTestSend = {}
setmetatable(ReqTestSend, {__index = _G})
local _ENV = ReqTestSend


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqTestSend})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.id_u8 = 0
	self.role_base = nil
	self.id_f32 = {}
	self.id_op_u8_flag = 0
	self.id_op_u8 = 0
	self.op_role_base_flag = 0
	self.op_role_base = nil
end


function encode(self)
	pack = packet.new()
	pack:writeU8(self.id_u8)
	pack:writeBytes(self.role_base:getBytes())
	id_f32_count = #self.id_f32
	pack:writeU16(id_f32_count)
	for i = 1, id_f32_count do
		pack:writeF32(table.remove(self.id_f32))
	end
	pack:writeU8(self.id_op_u8_flag)
	if self.id_op_u8_flag then
		pack:writeU8(self.id_op_u8)
	end
	pack:writeU8(self.op_role_base_flag)
	if self.op_role_base_flag then
		pack:writeBytes(self.op_role_base:getBytes())
	end
	return pack:encode(Msg.P_REQ_TEST_SEND)
end


function setIdU8(self, id_u8)
	self.id_u8 = id_u8
end

function setRoleBase(self, role_base)
	self.role_base = role_base
end

function setIdF32(self, id_f32)
	self.id_f32 = id_f32
end

function setIdOpU8(self, id_op_u8)
	self.id_op_u8_flag = 1
	self.id_op_u8 = id_op_u8
end

function setOpRoleBase(self, op_role_base)
	self.op_role_base_flag = 1
	self.op_role_base = op_role_base
end

