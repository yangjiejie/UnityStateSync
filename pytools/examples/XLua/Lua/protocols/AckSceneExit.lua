AckSceneExit = {}
setmetatable(AckSceneExit, {__index = _G})
local _ENV = AckSceneExit


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckSceneExit})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uid = 0
end


function decode(self, pack)
	self.uid = pack:readU32()
	return self
end


function getUid(self)
	return self.uid
end

