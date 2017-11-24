module("ReqTestSend", package.seeall)


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


function getIdU8(self)
	return self.id_u8
end

function getRoleBase(self)
	return self.role_base
end

function getIdF32(self)
	return self.id_f32
end

function getIdOpU8(self)
	return self.id_op_u8
end

function getOpRoleBase(self)
	return self.op_role_base
end

