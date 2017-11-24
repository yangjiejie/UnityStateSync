MsgTestSend = {}
setmetatable(MsgTestSend, {__index = _G})
local _ENV = MsgTestSend


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = MsgTestSend})
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
	return pack:readBytes()
end

function decode(self, pack)
	self.id_u8 = pack:readU8()
	self.role_base = MsgRoleBase.new():decode(pack)
	id_f32_count = pack:readU16()
	for i = 1, id_f32_count do
		table.insert(self.id_f32, pack:readF32())
	end
	self.id_op_u8_flag = pack:readU8()
	if self.id_op_u8_flag then
		self.id_op_u8 = pack:readU8()
	end
	self.op_role_base_flag = pack:readU8()
	if self.op_role_base_flag then
		self.op_role_base = MsgRoleBase.new():decode(pack)
	end
	return self
end

function getBytes(self)
	return self:encode()
end


function setIdU8(self, id_u8)
	self.id_u8 = id_u8
end
function getIdU8(self)
	return self.id_u8
end

function setRoleBase(self, role_base)
	self.role_base = role_base
end
function getRoleBase(self)
	return self.role_base
end

function setIdF32(self, id_f32)
	self.id_f32 = id_f32
end
function getIdF32(self)
	return self.id_f32
end

function setIdOpU8(self, id_op_u8)
	self.id_op_u8_flag = 1
	self.id_op_u8 = id_op_u8
end
function getIdOpU8(self)
	return self.id_op_u8
end

function setOpRoleBase(self, op_role_base)
	self.op_role_base_flag = 1
	self.op_role_base = op_role_base
end
function getOpRoleBase(self)
	return self.op_role_base
end

