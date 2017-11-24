package proto

import (
	"packet"
)

type AckScenePlayers struct {
	players                  []*MsgScenePlayer
}

func AckScenePlayersDecode(pack *packet.Packet) *AckScenePlayers {
	ackScenePlayers := &AckScenePlayers{}

	playersCount := pack.ReadUint16()
	for ;playersCount > 0; playersCount-- {
		ackScenePlayers.players = append(ackScenePlayers.players, MsgScenePlayerDecode(pack))
	}
	return ackScenePlayers
}

func (this *AckScenePlayers) GetPlayers() []*MsgScenePlayer {
	return this.players
}
