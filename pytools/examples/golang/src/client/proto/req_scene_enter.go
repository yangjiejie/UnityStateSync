package proto

import (
	"packet"
)

type ReqSceneEnter struct {
	doorId                   uint32
}

func (this *ReqSceneEnter) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.doorId)

	return pack.Encode(P_REQ_SCENE_ENTER)
}

func (this *ReqSceneEnter) SetDoorId(doorId uint32) {
	this.doorId = doorId
}
