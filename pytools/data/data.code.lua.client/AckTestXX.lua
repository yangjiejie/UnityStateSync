module("AckTestXX", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckTestXX})
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


function decode(self, pack)
	self.id_u8 = pack:readU8()
	self.id_u16 = pack:readU16()
	self.id_u32 = pack:readU32()
	repeat_id_u8_count = pack:readU16()
	for i = 1, repeat_id_u8_count do
		table.insert(self.repeat_id_u8, pack:readU8())
	end
	self.optional_id_u8_flag = pack:readU8()
	if self.optional_id_u8_flag then
		self.optional_id_u8 = pack:readU8()
	end
	return self
end


function getIdU8(self)
	return self.id_u8
end

function getIdU16(self)
	return self.id_u16
end

function getIdU32(self)
	return self.id_u32
end

function getRepeatIdU8(self)
	return self.repeat_id_u8
end

function getOptionalIdU8(self)
	return self.optional_id_u8
end

