package proto

import (
	"packet"
)

type MsgTestPhp struct {
	u16                      uint16
}

func (this *MsgTestPhp) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint16(this.u16)

	return pack.ReadBytes()
}

func MsgTestPhpDecode(pack *packet.Packet) *MsgTestPhp {
	msgTestPhp := &MsgTestPhp{}

	msgTestPhp.u16 = pack.ReadUint16()
	return msgTestPhp
}

func (this *MsgTestPhp) SetU16(u16 uint16) {
	this.u16 = u16
}

func (this *MsgTestPhp) GetU16() uint16 {
	return this.u16
}
