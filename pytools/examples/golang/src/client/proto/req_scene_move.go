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

func (this *ReqSceneMove) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteBytes(this.sceneRotPos.Encode())
	pack.WriteBytes(this.forward.Encode())
	pack.WriteString(this.aniName)
	pack.WriteInt16(this.xAxis)

	return pack.Encode(P_REQ_SCENE_MOVE)
}

func (this *ReqSceneMove) SetSceneRotPos(sceneRotPos *MsgSceneRotPos) {
	this.sceneRotPos = sceneRotPos
}

func (this *ReqSceneMove) SetForward(forward *MsgSceneVector3) {
	this.forward = forward
}

func (this *ReqSceneMove) SetAniName(aniName string) {
	this.aniName = aniName
}

func (this *ReqSceneMove) SetXAxis(xAxis int16) {
	this.xAxis = xAxis
}
