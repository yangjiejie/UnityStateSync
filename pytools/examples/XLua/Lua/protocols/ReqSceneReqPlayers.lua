ReqSceneReqPlayers = {}
setmetatable(ReqSceneReqPlayers, {__index = _G})
local _ENV = ReqSceneReqPlayers


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneReqPlayers})
	tab_obj:init()
	return tab_obj
end

function init(self)
end


function encode(self)
	pack = packet.new()
	return pack:encode(Msg.P_REQ_SCENE_REQ_PLAYERS)
end


