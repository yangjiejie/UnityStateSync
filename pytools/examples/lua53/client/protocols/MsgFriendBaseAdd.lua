MsgFriendBaseAdd = {}
setmetatable(MsgFriendBaseAdd, {__index = _G})
local _ENV = MsgFriendBaseAdd


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = MsgFriendBaseAdd})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uid = 0
	self.uname = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU32(self.uid)
	pack:writeString(self.uname)
	return pack:readBytes()
end

function decode(self, pack)
	self.uid = pack:readU32()
	self.uname = pack:readString()
	return self
end

function getBytes(self)
	return self:encode()
end


function setUid(self, uid)
	self.uid = uid
end
function getUid(self)
	return self.uid
end

function setUname(self, uname)
	self.uname = uname
end
function getUname(self)
	return self.uname
end

