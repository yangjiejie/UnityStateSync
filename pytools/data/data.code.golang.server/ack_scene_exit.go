package proto

import (
	"packet"
)

type AckSceneExit struct {
	uid                      uint32
}

func (this *AckSceneExit) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)

	return pack.Encode(P_ACK_SCENE_EXIT)
}

func (this *AckSceneExit) SetUid(uid uint32) {
	this.uid = uid
}
