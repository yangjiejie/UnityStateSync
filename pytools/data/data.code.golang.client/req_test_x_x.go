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

func (this *ReqTestXX) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint8(this.idU8)
	pack.WriteUint16(this.idU16)
	pack.WriteUint32(this.idU32)
	repeatIdU8Count := uint16(len(this.repeatIdU8))
	pack.WriteUint16(repeatIdU8Count)
	for i := uint16(0); i < repeatIdU8Count; i++ {
		pack.WriteUint8(this.repeatIdU8[i])
	}
	pack.WriteUint8(this.optionalIdU8Flag)
	if this.optionalIdU8Flag == 1 {
		pack.WriteUint8(this.optionalIdU8)
	}

	return pack.Encode(P_REQ_TEST_X_X)
}

func (this *ReqTestXX) SetIdU8(idU8 uint8) {
	this.idU8 = idU8
}

func (this *ReqTestXX) SetIdU16(idU16 uint16) {
	this.idU16 = idU16
}

func (this *ReqTestXX) SetIdU32(idU32 uint32) {
	this.idU32 = idU32
}

func (this *ReqTestXX) SetRepeatIdU8(repeatIdU8 []uint8) {
	this.repeatIdU8 = repeatIdU8
}

func (this *ReqTestXX) SetOptionalIdU8(optionalIdU8 uint8) {
	this.optionalIdU8Flag = 1
	this.optionalIdU8 = optionalIdU8
}
