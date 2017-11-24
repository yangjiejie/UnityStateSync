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

func ReqTestSendDecode(pack *packet.Packet) *ReqTestSend {
	reqTestSend := &ReqTestSend{}

	reqTestSend.idU8 = pack.ReadUint8()
	reqTestSend.roleBase = MsgRoleBaseDecode(pack)
	idF32Count := pack.ReadUint16()
	for ;idF32Count > 0; idF32Count-- {
		reqTestSend.idF32 = append(reqTestSend.idF32, pack.ReadFloat32())
	}
	reqTestSend.idOpU8Flag = pack.ReadUint8()
	if reqTestSend.idOpU8Flag == 1 {
		reqTestSend.idOpU8 = pack.ReadUint8()
	}
	reqTestSend.opRoleBaseFlag = pack.ReadUint8()
	if reqTestSend.opRoleBaseFlag == 1 {
		reqTestSend.opRoleBase = MsgRoleBaseDecode(pack)
	}
	return reqTestSend
}

func (this *ReqTestSend) GetIdU8() uint8 {
	return this.idU8
}

func (this *ReqTestSend) GetRoleBase() *MsgRoleBase {
	return this.roleBase
}

func (this *ReqTestSend) GetIdF32() []float32 {
	return this.idF32
}

func (this *ReqTestSend) GetIdOpU8() uint8 {
	return this.idOpU8
}

func (this *ReqTestSend) GetOpRoleBase() *MsgRoleBase {
	return this.opRoleBase
}
