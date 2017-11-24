package proto

import (
	"packet"
)

type ReqTestSend struct {
	idU8                     uint8
	roleBase                 *MsgRoleBase
	idF32                    []float32
	idOpU8Flag               uint8
	idOpU8                   uint8
	opRoleBaseFlag           uint8
	opRoleBase               *MsgRoleBase
}

func (this *ReqTestSend) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint8(this.idU8)
	pack.WriteBytes(this.roleBase.Encode())
	idF32Count := uint16(len(this.idF32))
	pack.WriteUint16(idF32Count)
	for i := uint16(0); i < idF32Count; i++ {
		pack.WriteFloat32(this.idF32[i])
	}
	pack.WriteUint8(this.idOpU8Flag)
	if this.idOpU8Flag == 1 {
		pack.WriteUint8(this.idOpU8)
	}
	pack.WriteUint8(this.opRoleBaseFlag)
	if this.opRoleBaseFlag == 1 {
		pack.WriteBytes(this.opRoleBase.Encode())
	}

	return pack.Encode(P_REQ_TEST_SEND)
}

func (this *ReqTestSend) SetIdU8(idU8 uint8) {
	this.idU8 = idU8
}

func (this *ReqTestSend) SetRoleBase(roleBase *MsgRoleBase) {
	this.roleBase = roleBase
}

func (this *ReqTestSend) SetIdF32(idF32 []float32) {
	this.idF32 = idF32
}

func (this *ReqTestSend) SetIdOpU8(idOpU8 uint8) {
	this.idOpU8Flag = 1
	this.idOpU8 = idOpU8
}

func (this *ReqTestSend) SetOpRoleBase(opRoleBase *MsgRoleBase) {
	this.opRoleBaseFlag = 1
	this.opRoleBase = opRoleBase
}
