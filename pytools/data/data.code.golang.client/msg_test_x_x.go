package proto

import (
	"packet"
)

type MsgTestXX struct {
	idU8                     uint8
	idF32                    []float32
	idOpU8Flag               uint8
	idOpU8                   uint8
}

func (this *MsgTestXX) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint8(this.idU8)
	idF32Count := uint16(len(this.idF32))
	pack.WriteUint16(idF32Count)
	for i := uint16(0); i < idF32Count; i++ {
		pack.WriteFloat32(this.idF32[i])
	}
	pack.WriteUint8(this.idOpU8Flag)
	if this.idOpU8Flag == 1 {
		pack.WriteUint8(this.idOpU8)
	}

	return pack.ReadBytes()
}

func MsgTestXXDecode(pack *packet.Packet) *MsgTestXX {
	msgTestXX := &MsgTestXX{}

	msgTestXX.idU8 = pack.ReadUint8()
	idF32Count := pack.ReadUint16()
	for ;idF32Count > 0; idF32Count-- {
		msgTestXX.idF32 = append(msgTestXX.idF32, pack.ReadFloat32())
	}
	msgTestXX.idOpU8Flag = pack.ReadUint8()
	if msgTestXX.idOpU8Flag == 1 {
		msgTestXX.idOpU8 = pack.ReadUint8()
	}
	return msgTestXX
}

func (this *MsgTestXX) SetIdU8(idU8 uint8) {
	this.idU8 = idU8
}

func (this *MsgTestXX) GetIdU8() uint8 {
	return this.idU8
}

func (this *MsgTestXX) SetIdF32(idF32 []float32) {
	this.idF32 = idF32
}

func (this *MsgTestXX) GetIdF32() []float32 {
	return this.idF32
}

func (this *MsgTestXX) SetIdOpU8(idOpU8 uint8) {
	this.idOpU8Flag = 1
	this.idOpU8 = idOpU8
}

func (this *MsgTestXX) GetIdOpU8() uint8 {
	return this.idOpU8
}
