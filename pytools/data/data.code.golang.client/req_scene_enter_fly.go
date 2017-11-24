package proto

import (
	"packet"
)

type ReqSceneEnterFly struct {
	mapId                    uint32
}

func (this *ReqSceneEnterFly) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.mapId)

	return pack.Encode(P_REQ_SCENE_ENTER_FLY)
}

func (this *ReqSceneEnterFly) SetMapId(mapId uint32) {
	this.mapId = mapId
}
