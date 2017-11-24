AckRoleLoginOk = {}
setmetatable(AckRoleLoginOk, {__index = _G})
local _ENV = AckRoleLoginOk


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckRoleLoginOk})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uname = 0
end


function decode(self, pack)
	self.uname = pack:readString()
	return self
end


function getUname(self)
	return self.uname
end

