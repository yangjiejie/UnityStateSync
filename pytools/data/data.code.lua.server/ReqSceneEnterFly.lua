module("ReqSceneEnterFly", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneEnterFly})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.map_id = 0
end


function decode(self, pack)
	self.map_id = pack:readU32()
	return self
end


function getMapId(self)
	return self.map_id
end

