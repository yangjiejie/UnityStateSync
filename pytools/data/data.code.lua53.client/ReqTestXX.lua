ReqTestXX = {}
setmetatable(ReqTestXX, {__index = _G})
local _ENV = ReqTestXX


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqTestXX})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.id_u8 = 0
	self.id_u16 = 0
	self.id_u32 = 0
	self.repeat_id_u8 = {}
	self.optional_id_u8_flag = 0
	self.optional_id_u8 = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU8(self.id_u8)
	pack:writeU16(self.id_u16)
	pack:writeU32(self.id_u32)
	repeat_id_u8_count = #self.repeat_id_u8
	pack:writeU16(repeat_id_u8_count)
	for i = 1, repeat_id_u8_count do
		pack:writeU8(table.remove(self.repeat_id_u8))
	end
	pack:writeU8(self.optional_id_u8_flag)
	if self.optional_id_u8_flag then
		pack:writeU8(self.optional_id_u8)
	end
	return pack:encode(Msg.P_REQ_TEST_X_X)
end


function setIdU8(self, id_u8)
	self.id_u8 = id_u8
end

function setIdU16(self, id_u16)
	self.id_u16 = id_u16
end

function setIdU32(self, id_u32)
	self.id_u32 = id_u32
end

function setRepeatIdU8(self, repeat_id_u8)
	self.repeat_id_u8 = repeat_id_u8
end

function setOptionalIdU8(self, optional_id_u8)
	self.optional_id_u8_flag = 1
	self.optional_id_u8 = optional_id_u8
end

