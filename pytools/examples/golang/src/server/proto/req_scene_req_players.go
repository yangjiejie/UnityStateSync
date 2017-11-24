package proto

import (
	"packet"
)

type ReqSceneReqPlayers struct {
}

func ReqSceneReqPlayersDecode(pack *packet.Packet) *ReqSceneReqPlayers {
	reqSceneReqPlayers := &ReqSceneReqPlayers{}

	return reqSceneReqPlayers
}
