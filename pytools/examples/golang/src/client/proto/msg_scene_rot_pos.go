package proto

import (
	"packet"
)

type MsgSceneRotPos struct {
	rotX                     int16
	rotY                     int16
	rotZ                     int16
	posX                     int16
	posY                     int16
	posZ                     int16
}

func (this *MsgSceneRotPos) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteInt16(this.rotX)
	pack.WriteInt16(this.rotY)
	pack.WriteInt16(this.rotZ)
	pack.WriteInt16(this.posX)
	pack.WriteInt16(this.posY)
	pack.WriteInt16(this.posZ)

	return pack.ReadBytes()
}

func MsgSceneRotPosDecode(pack *packet.Packet) *MsgSceneRotPos {
	msgSceneRotPos := &MsgSceneRotPos{}

	msgSceneRotPos.rotX = pack.ReadInt16()
	msgSceneRotPos.rotY = pack.ReadInt16()
	msgSceneRotPos.rotZ = pack.ReadInt16()
	msgSceneRotPos.posX = pack.ReadInt16()
	msgSceneRotPos.posY = pack.ReadInt16()
	msgSceneRotPos.posZ = pack.ReadInt16()
	return msgSceneRotPos
}

func (this *MsgSceneRotPos) SetRotX(rotX int16) {
	this.rotX = rotX
}

func (this *MsgSceneRotPos) GetRotX() int16 {
	return this.rotX
}

func (this *MsgSceneRotPos) SetRotY(rotY int16) {
	this.rotY = rotY
}

func (this *MsgSceneRotPos) GetRotY() int16 {
	return this.rotY
}

func (this *MsgSceneRotPos) SetRotZ(rotZ int16) {
	this.rotZ = rotZ
}

func (this *MsgSceneRotPos) GetRotZ() int16 {
	return this.rotZ
}

func (this *MsgSceneRotPos) SetPosX(posX int16) {
	this.posX = posX
}

func (this *MsgSceneRotPos) GetPosX() int16 {
	return this.posX
}

func (this *MsgSceneRotPos) SetPosY(posY int16) {
	this.posY = posY
}

func (this *MsgSceneRotPos) GetPosY() int16 {
	return this.posY
}

func (this *MsgSceneRotPos) SetPosZ(posZ int16) {
	this.posZ = posZ
}

func (this *MsgSceneRotPos) GetPosZ() int16 {
	return this.posZ
}
