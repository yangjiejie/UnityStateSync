package proto

import (
	"packet"
)

type AckSceneMove struct {
	sceneRotPos              *MsgSceneRotPos
	forward                  *MsgSceneVector3
	aniName                  string
	xAxis                    int16
	uid                      uint32
}

func (this *AckSceneMove) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteBytes(this.sceneRotPos.Encode())
	pack.WriteBytes(this.forward.Encode())
	pack.WriteString(this.aniName)
	pack.WriteInt16(this.xAxis)
	pack.WriteUint32(this.uid)

	return pack.Encode(P_ACK_SCENE_MOVE)
}

func (this *AckSceneMove) SetSceneRotPos(sceneRotPos *MsgSceneRotPos) {
	this.sceneRotPos = sceneRotPos
}

func (this *AckSceneMove) SetForward(forward *MsgSceneVector3) {
	this.forward = forward
}

func (this *AckSceneMove) SetAniName(aniName string) {
	this.aniName = aniName
}

func (this *AckSceneMove) SetXAxis(xAxis int16) {
	this.xAxis = xAxis
}

func (this *AckSceneMove) SetUid(uid uint32) {
	this.uid = uid
}
