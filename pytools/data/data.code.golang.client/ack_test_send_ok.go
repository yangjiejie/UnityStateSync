package proto

import (
	"packet"
)

type AckTestSendOk struct {
	idU8                     uint8
	roleBase                 *MsgRoleBase
	idF32                    []float32
	idOpU8Flag               uint8
	idOpU8                   uint8
	opRoleBaseFlag           uint8
	opRoleBase               *MsgRoleBase
}

func AckTestSendOkDecode(pack *packet.Packet) *AckTestSendOk {
	ackTestSendOk := &AckTestSendOk{}

	ackTestSendOk.idU8 = pack.ReadUint8()
	ackTestSendOk.roleBase = MsgRoleBaseDecode(pack)
	idF32Count := pack.ReadUint16()
	for ;idF32Count > 0; idF32Count-- {
		ackTestSendOk.idF32 = append(ackTestSendOk.idF32, pack.ReadFloat32())
	}
	ackTestSendOk.idOpU8Flag = pack.ReadUint8()
	if ackTestSendOk.idOpU8Flag == 1 {
		ackTestSendOk.idOpU8 = pack.ReadUint8()
	}
	ackTestSendOk.opRoleBaseFlag = pack.ReadUint8()
	if ackTestSendOk.opRoleBaseFlag == 1 {
		ackTestSendOk.opRoleBase = MsgRoleBaseDecode(pack)
	}
	return ackTestSendOk
}

func (this *AckTestSendOk) GetIdU8() uint8 {
	return this.idU8
}

func (this *AckTestSendOk) GetRoleBase() *MsgRoleBase {
	return this.roleBase
}

func (this *AckTestSendOk) GetIdF32() []float32 {
	return this.idF32
}

func (this *AckTestSendOk) GetIdOpU8() uint8 {
	return this.idOpU8
}

func (this *AckTestSendOk) GetOpRoleBase() *MsgRoleBase {
	return this.opRoleBase
}
