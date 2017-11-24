package proto

import (
	"packet"
)

type AckTestPhpOk struct {
	u64                      uint64
	strxx                    string
	msgReq                   *MsgTestPhp
	msgOptFlag               uint8
	msgOpt                   *MsgTestPhp
	msgRep                   []*MsgTestPhp
}

func AckTestPhpOkDecode(pack *packet.Packet) *AckTestPhpOk {
	ackTestPhpOk := &AckTestPhpOk{}

	ackTestPhpOk.u64 = pack.ReadUint64()
	ackTestPhpOk.strxx = pack.ReadString()
	ackTestPhpOk.msgReq = MsgTestPhpDecode(pack)
	ackTestPhpOk.msgOptFlag = pack.ReadUint8()
	if ackTestPhpOk.msgOptFlag == 1 {
		ackTestPhpOk.msgOpt = MsgTestPhpDecode(pack)
	}
	msgRepCount := pack.ReadUint16()
	for ;msgRepCount > 0; msgRepCount-- {
		ackTestPhpOk.msgRep = append(ackTestPhpOk.msgRep, MsgTestPhpDecode(pack))
	}
	return ackTestPhpOk
}

func (this *AckTestPhpOk) GetU64() uint64 {
	return this.u64
}

func (this *AckTestPhpOk) GetStrxx() string {
	return this.strxx
}

func (this *AckTestPhpOk) GetMsgReq() *MsgTestPhp {
	return this.msgReq
}

func (this *AckTestPhpOk) GetMsgOpt() *MsgTestPhp {
	return this.msgOpt
}

func (this *AckTestPhpOk) GetMsgRep() []*MsgTestPhp {
	return this.msgRep
}
