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


function encode(self)
	pack = packet.new()
	players_count = #self.players
	pack:writeU16(players_count)
	for i = 1, players_count do
		pack:writeBytes(table.remove(self.players):getBytes())
	end
	return pack:encode(Msg.P_ACK_SCENE_PLAYERS)
end


function setPlayers(self, players)
	self.players = players
end

