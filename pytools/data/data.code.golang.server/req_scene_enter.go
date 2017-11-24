package proto

import (
	"packet"
)

type ReqSceneEnter struct {
	doorId                   uint32
}

func ReqSceneEnterDecode(pack *packet.Packet) *ReqSceneEnter {
	reqSceneEnter := &ReqSceneEnter{}

	reqSceneEnter.doorId = pack.ReadUint32()
	return reqSceneEnter
}

func (this *ReqSceneEnter) GetDoorId() uint32 {
	return this.doorId
}
