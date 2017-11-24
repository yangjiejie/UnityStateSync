module("AckSceneEnter", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckSceneEnter})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.player = nil
end


function decode(self, pack)
	self.player = MsgScenePlayer.new():decode(pack)
	return self
end


function getPlayer(self)
	return self.player
end

