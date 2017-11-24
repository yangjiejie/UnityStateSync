package proto

import (
	"packet"
)

type AckSceneExit struct {
	uid                      uint32
}

func AckSceneExitDecode(pack *packet.Packet) *AckSceneExit {
	ackSceneExit := &AckSceneExit{}

	ackSceneExit.uid = pack.ReadUint32()
	return ackSceneExit
}

func (this *AckSceneExit) GetUid() uint32 {
	return this.uid
}
