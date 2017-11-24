ReqSceneEnterFly = {}
setmetatable(ReqSceneEnterFly, {__index = _G})
local _ENV = ReqSceneEnterFly


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneEnterFly})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.map_id = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU32(self.map_id)
	return pack:encode(Msg.P_REQ_SCENE_ENTER_FLY)
end


function setMapId(self, map_id)
	self.map_id = map_id
end

