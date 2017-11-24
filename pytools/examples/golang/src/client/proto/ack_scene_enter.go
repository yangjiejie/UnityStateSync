package proto

import (
	"packet"
)

type AckSceneEnter struct {
	player                   *MsgScenePlayer
}

func AckSceneEnterDecode(pack *packet.Packet) *AckSceneEnter {
	ackSceneEnter := &AckSceneEnter{}

	ackSceneEnter.player = MsgScenePlayerDecode(pack)
	return ackSceneEnter
}

func (this *AckSceneEnter) GetPlayer() *MsgScenePlayer {
	return this.player
}
