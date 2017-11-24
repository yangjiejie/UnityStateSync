package proto

import (
	"packet"
)

type AckSceneEnter struct {
	player                   *MsgScenePlayer
}

func (this *AckSceneEnter) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteBytes(this.player.Encode())

	return pack.Encode(P_ACK_SCENE_ENTER)
}

func (this *AckSceneEnter) SetPlayer(player *MsgScenePlayer) {
	this.player = player
}
