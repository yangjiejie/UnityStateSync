ReqRoleRandName = {}
setmetatable(ReqRoleRandName, {__index = _G})
local _ENV = ReqRoleRandName


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqRoleRandName})
	tab_obj:init()
	return tab_obj
end

function init(self)
end


function decode(self, pack)
	return self
end


