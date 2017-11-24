package proto

import (
	"packet"
)

type MsgSceneVector3 struct {
	x                        int16
	y                        int16
	z                        int16
}

func (this *MsgSceneVector3) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteInt16(this.x)
	pack.WriteInt16(this.y)
	pack.WriteInt16(this.z)

	return pack.ReadBytes()
}

func MsgSceneVector3Decode(pack *packet.Packet) *MsgSceneVector3 {
	msgSceneVector3 := &MsgSceneVector3{}

	msgSceneVector3.x = pack.ReadInt16()
	msgSceneVector3.y = pack.ReadInt16()
	msgSceneVector3.z = pack.ReadInt16()
	return msgSceneVector3
}

func (this *MsgSceneVector3) SetX(x int16) {
	this.x = x
}

func (this *MsgSceneVector3) GetX() int16 {
	return this.x
}

func (this *MsgSceneVector3) SetY(y int16) {
	this.y = y
}

func (this *MsgSceneVector3) GetY() int16 {
	return this.y
}

func (this *MsgSceneVector3) SetZ(z int16) {
	this.z = z
}

func (this *MsgSceneVector3) GetZ() int16 {
	return this.z
}
