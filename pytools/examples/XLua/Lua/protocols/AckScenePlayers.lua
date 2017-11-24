AckScenePlayers = {}
setmetatable(AckScenePlayers, {__index = _G})
local _ENV = AckScenePlayers


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckScenePlayers})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.players = {}
end


function decode(self, pack)
	players_count = pack:readU16()
	for i = 1, players_count do
		table.insert(self.players, MsgScenePlayer.new():decode(pack))
	end
	return self
end


function getPlayers(self)
	return self.players
end

