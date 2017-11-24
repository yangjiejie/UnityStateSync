module("ReqSceneEnter", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneEnter})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.door_id = 0
end


function decode(self, pack)
	self.door_id = pack:readU32()
	return self
end


function getDoorId(self)
	return self.door_id
end

