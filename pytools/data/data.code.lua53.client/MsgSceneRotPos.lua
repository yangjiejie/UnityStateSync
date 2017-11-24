MsgSceneRotPos = {}
setmetatable(MsgSceneRotPos, {__index = _G})
local _ENV = MsgSceneRotPos


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = MsgSceneRotPos})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.rot_x = 0
	self.rot_y = 0
	self.rot_z = 0
	self.pos_x = 0
	self.pos_y = 0
	self.pos_z = 0
end


function encode(self)
	pack = packet.new()
	pack:writeI16(self.rot_x)
	pack:writeI16(self.rot_y)
	pack:writeI16(self.rot_z)
	pack:writeI16(self.pos_x)
	pack:writeI16(self.pos_y)
	pack:writeI16(self.pos_z)
	return pack:readBytes()
end

function decode(self, pack)
	self.rot_x = pack:readI16()
	self.rot_y = pack:readI16()
	self.rot_z = pack:readI16()
	self.pos_x = pack:readI16()
	self.pos_y = pack:readI16()
	self.pos_z = pack:readI16()
	return self
end

function getBytes(self)
	return self:encode()
end


function setRotX(self, rot_x)
	self.rot_x = rot_x
end
function getRotX(self)
	return self.rot_x
end

function setRotY(self, rot_y)
	self.rot_y = rot_y
end
function getRotY(self)
	return self.rot_y
end

function setRotZ(self, rot_z)
	self.rot_z = rot_z
end
function getRotZ(self)
	return self.rot_z
end

function setPosX(self, pos_x)
	self.pos_x = pos_x
end
function getPosX(self)
	return self.pos_x
end

function setPosY(self, pos_y)
	self.pos_y = pos_y
end
function getPosY(self)
	return self.pos_y
end

function setPosZ(self, pos_z)
	self.pos_z = pos_z
end
function getPosZ(self)
	return self.pos_z
end

