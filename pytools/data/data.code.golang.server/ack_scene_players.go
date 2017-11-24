package proto

import (
	"packet"
)

type AckScenePlayers struct {
	players                  []*MsgScenePlayer
}

func (this *AckScenePlayers) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	playersCount := uint16(len(this.players))
	pack.WriteUint16(playersCount)
	for i := uint16(0); i < playersCount; i++ {
		pack.WriteBytes(this.players[i].Encode())
	}

	return pack.Encode(P_ACK_SCENE_PLAYERS)
}

func (this *AckScenePlayers) SetPlayers(players []*MsgScenePlayer) {
	this.players = players
}
