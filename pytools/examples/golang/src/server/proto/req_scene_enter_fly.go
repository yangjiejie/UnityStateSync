package proto

import (
	"packet"
)

type ReqSceneEnterFly struct {
	mapId                    uint32
}

func ReqSceneEnterFlyDecode(pack *packet.Packet) *ReqSceneEnterFly {
	reqSceneEnterFly := &ReqSceneEnterFly{}

	reqSceneEnterFly.mapId = pack.ReadUint32()
	return reqSceneEnterFly
}

func (this *ReqSceneEnterFly) GetMapId() uint32 {
	return this.mapId
}
