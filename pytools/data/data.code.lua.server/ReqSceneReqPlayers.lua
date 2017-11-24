module("ReqSceneReqPlayers", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneReqPlayers})
	tab_obj:init()
	return tab_obj
end

function init(self)
end


function decode(self, pack)
	return self
end


