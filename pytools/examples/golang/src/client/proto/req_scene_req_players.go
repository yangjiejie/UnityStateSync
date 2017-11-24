package proto

import (
	"packet"
)

type ReqSceneReqPlayers struct {
}

func (this *ReqSceneReqPlayers) Encode() []byte {
	pack := packet.NewWriteBuff(64)


	return pack.Encode(P_REQ_SCENE_REQ_PLAYERS)
}
