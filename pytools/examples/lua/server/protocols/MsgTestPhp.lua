module("MsgTestPhp", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = MsgTestPhp})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.u16 = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU16(self.u16)
	return pack:readBytes()
end

function decode(self, pack)
	self.u16 = pack:readU16()
	return self
end

function getBytes(self)
	return self:encode()
end


function setU16(self, u16)
	self.u16 = u16
end
function getU16(self)
	return self.u16
end

