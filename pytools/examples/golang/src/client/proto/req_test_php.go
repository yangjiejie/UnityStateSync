package proto

import (
	"packet"
)

type ReqTestPhp struct {
	u64                      uint64
	strxx                    string
	msgReq                   *MsgTestPhp
	msgOptFlag               uint8
	msgOpt                   *MsgTestPhp
	msgRep                   []*MsgTestPhp
}

func (this *ReqTestPhp) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint64(this.u64)
	pack.WriteString(this.strxx)
	pack.WriteBytes(this.msgReq.Encode())
	pack.WriteUint8(this.msgOptFlag)
	if this.msgOptFlag == 1 {
		pack.WriteBytes(this.msgOpt.Encode())
	}
	msgRepCount := uint16(len(this.msgRep))
	pack.WriteUint16(msgRepCount)
	for i := uint16(0); i < msgRepCount; i++ {
		pack.WriteBytes(this.msgRep[i].Encode())
	}

	return pack.Encode(P_REQ_TEST_PHP)
}

func (this *ReqTestPhp) SetU64(u64 uint64) {
	this.u64 = u64
}

func (this *ReqTestPhp) SetStrxx(strxx string) {
	this.strxx = strxx
}

func (this *ReqTestPhp) SetMsgReq(msgReq *MsgTestPhp) {
	this.msgReq = msgReq
}

func (this *ReqTestPhp) SetMsgOpt(msgOpt *MsgTestPhp) {
	this.msgOptFlag = 1
	this.msgOpt = msgOpt
}

func (this *ReqTestPhp) SetMsgRep(msgRep []*MsgTestPhp) {
	this.msgRep = msgRep
}
