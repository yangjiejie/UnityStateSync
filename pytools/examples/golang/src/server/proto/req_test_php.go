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

func ReqTestPhpDecode(pack *packet.Packet) *ReqTestPhp {
	reqTestPhp := &ReqTestPhp{}

	reqTestPhp.u64 = pack.ReadUint64()
	reqTestPhp.strxx = pack.ReadString()
	reqTestPhp.msgReq = MsgTestPhpDecode(pack)
	reqTestPhp.msgOptFlag = pack.ReadUint8()
	if reqTestPhp.msgOptFlag == 1 {
		reqTestPhp.msgOpt = MsgTestPhpDecode(pack)
	}
	msgRepCount := pack.ReadUint16()
	for ;msgRepCount > 0; msgRepCount-- {
		reqTestPhp.msgRep = append(reqTestPhp.msgRep, MsgTestPhpDecode(pack))
	}
	return reqTestPhp
}

func (this *ReqTestPhp) GetU64() uint64 {
	return this.u64
}

func (this *ReqTestPhp) GetStrxx() string {
	return this.strxx
}

func (this *ReqTestPhp) GetMsgReq() *MsgTestPhp {
	return this.msgReq
}

func (this *ReqTestPhp) GetMsgOpt() *MsgTestPhp {
	return this.msgOpt
}

func (this *ReqTestPhp) GetMsgRep() []*MsgTestPhp {
	return this.msgRep
}
