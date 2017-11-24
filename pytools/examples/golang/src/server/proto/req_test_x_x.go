package proto

import (
	"packet"
)

type ReqTestXX struct {
	idU8                     uint8
	idU16                    uint16
	idU32                    uint32
	repeatIdU8               []uint8
	optionalIdU8Flag         uint8
	optionalIdU8             uint8
}

func ReqTestXXDecode(pack *packet.Packet) *ReqTestXX {
	reqTestXX := &ReqTestXX{}

	reqTestXX.idU8 = pack.ReadUint8()
	reqTestXX.idU16 = pack.ReadUint16()
	reqTestXX.idU32 = pack.ReadUint32()
	repeatIdU8Count := pack.ReadUint16()
	for ;repeatIdU8Count > 0; repeatIdU8Count-- {
		reqTestXX.repeatIdU8 = append(reqTestXX.repeatIdU8, pack.ReadUint8())
	}
	reqTestXX.optionalIdU8Flag = pack.ReadUint8()
	if reqTestXX.optionalIdU8Flag == 1 {
		reqTestXX.optionalIdU8 = pack.ReadUint8()
	}
	return reqTestXX
}

func (this *ReqTestXX) GetIdU8() uint8 {
	return this.idU8
}

func (this *ReqTestXX) GetIdU16() uint16 {
	return this.idU16
}

func (this *ReqTestXX) GetIdU32() uint32 {
	return this.idU32
}

func (this *ReqTestXX) GetRepeatIdU8() []uint8 {
	return this.repeatIdU8
}

func (this *ReqTestXX) GetOptionalIdU8() uint8 {
	return this.optionalIdU8
}
