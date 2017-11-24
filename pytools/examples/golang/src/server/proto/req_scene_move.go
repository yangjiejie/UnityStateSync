package proto

import (
	"packet"
)

type ReqSceneMove struct {
	sceneRotPos              *MsgSceneRotPos
	forward                  *MsgSceneVector3
	aniName                  string
	xAxis                    int16
}

func ReqSceneMoveDecode(pack *packet.Packet) *ReqSceneMove {
	reqSceneMove := &ReqSceneMove{}

	reqSceneMove.sceneRotPos = MsgSceneRotPosDecode(pack)
	reqSceneMove.forward = MsgSceneVector3Decode(pack)
	reqSceneMove.aniName = pack.ReadString()
	reqSceneMove.xAxis = pack.ReadInt16()
	return reqSceneMove
}

func (this *ReqSceneMove) GetSceneRotPos() *MsgSceneRotPos {
	return this.sceneRotPos
}

func (this *ReqSceneMove) GetForward() *MsgSceneVector3 {
	return this.forward
}

func (this *ReqSceneMove) GetAniName() string {
	return this.aniName
}

func (this *ReqSceneMove) GetXAxis() int16 {
	return this.xAxis
}
