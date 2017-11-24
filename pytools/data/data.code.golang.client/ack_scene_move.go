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

func AckSceneMoveDecode(pack *packet.Packet) *AckSceneMove {
	ackSceneMove := &AckSceneMove{}

	ackSceneMove.sceneRotPos = MsgSceneRotPosDecode(pack)
	ackSceneMove.forward = MsgSceneVector3Decode(pack)
	ackSceneMove.aniName = pack.ReadString()
	ackSceneMove.xAxis = pack.ReadInt16()
	ackSceneMove.uid = pack.ReadUint32()
	return ackSceneMove
}

func (this *AckSceneMove) GetSceneRotPos() *MsgSceneRotPos {
	return this.sceneRotPos
}

func (this *AckSceneMove) GetForward() *MsgSceneVector3 {
	return this.forward
}

func (this *AckSceneMove) GetAniName() string {
	return this.aniName
}

func (this *AckSceneMove) GetXAxis() int16 {
	return this.xAxis
}

func (this *AckSceneMove) GetUid() uint32 {
	return this.uid
}
