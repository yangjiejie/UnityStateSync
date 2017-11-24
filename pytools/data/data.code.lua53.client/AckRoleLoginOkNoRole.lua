AckRoleLoginOkNoRole = {}
setmetatable(AckRoleLoginOkNoRole, {__index = _G})
local _ENV = AckRoleLoginOkNoRole


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckRoleLoginOkNoRole})
	tab_obj:init()
	return tab_obj
end

function init(self)
end


function decode(self, pack)
	return self
end


