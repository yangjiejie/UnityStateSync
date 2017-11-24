package proto

import (
	"packet"
)

type AckTestXX struct {
	idU8                     uint8
	idU16                    uint16
	idU32                    uint32
	repeatIdU8               []uint8
	optionalIdU8Flag         uint8
	optionalIdU8             uint8
}

func AckTestXXDecode(pack *packet.Packet) *AckTestXX {
	ackTestXX := &AckTestXX{}

	ackTestXX.idU8 = pack.ReadUint8()
	ackTestXX.idU16 = pack.ReadUint16()
	ackTestXX.idU32 = pack.ReadUint32()
	repeatIdU8Count := pack.ReadUint16()
	for ;repeatIdU8Count > 0; repeatIdU8Count-- {
		ackTestXX.repeatIdU8 = append(ackTestXX.repeatIdU8, pack.ReadUint8())
	}
	ackTestXX.optionalIdU8Flag = pack.ReadUint8()
	if ackTestXX.optionalIdU8Flag == 1 {
		ackTestXX.optionalIdU8 = pack.ReadUint8()
	}
	return ackTestXX
}

func (this *AckTestXX) GetIdU8() uint8 {
	return this.idU8
}

func (this *AckTestXX) GetIdU16() uint16 {
	return this.idU16
}

func (this *AckTestXX) GetIdU32() uint32 {
	return this.idU32
}

func (this *AckTestXX) GetRepeatIdU8() []uint8 {
	return this.repeatIdU8
}

func (this *AckTestXX) GetOptionalIdU8() uint8 {
	return this.optionalIdU8
}
