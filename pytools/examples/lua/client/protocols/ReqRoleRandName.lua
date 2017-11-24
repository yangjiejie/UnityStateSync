module("ReqRoleRandName", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqRoleRandName})
	tab_obj:init()
	return tab_obj
end

function init(self)
end


function encode(self)
	pack = packet.new()
	return pack:encode(Msg.P_REQ_ROLE_RAND_NAME)
end


