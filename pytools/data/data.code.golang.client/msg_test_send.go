package proto

import (
	"packet"
)

type MsgTestSend struct {
	idU8                     uint8
	roleBase                 *MsgRoleBase
	idF32                    []float32
	idOpU8Flag               uint8
	idOpU8                   uint8
	opRoleBaseFlag           uint8
	opRoleBase               *MsgRoleBase
}

func (this *MsgTestSend) Encode() []byte {
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

	return pack.ReadBytes()
}

func MsgTestSendDecode(pack *packet.Packet) *MsgTestSend {
	msgTestSend := &MsgTestSend{}

	msgTestSend.idU8 = pack.ReadUint8()
	msgTestSend.roleBase = MsgRoleBaseDecode(pack)
	idF32Count := pack.ReadUint16()
	for ;idF32Count > 0; idF32Count-- {
		msgTestSend.idF32 = append(msgTestSend.idF32, pack.ReadFloat32())
	}
	msgTestSend.idOpU8Flag = pack.ReadUint8()
	if msgTestSend.idOpU8Flag == 1 {
		msgTestSend.idOpU8 = pack.ReadUint8()
	}
	msgTestSend.opRoleBaseFlag = pack.ReadUint8()
	if msgTestSend.opRoleBaseFlag == 1 {
		msgTestSend.opRoleBase = MsgRoleBaseDecode(pack)
	}
	return msgTestSend
}

func (this *MsgTestSend) SetIdU8(idU8 uint8) {
	this.idU8 = idU8
}

func (this *MsgTestSend) GetIdU8() uint8 {
	return this.idU8
}

func (this *MsgTestSend) SetRoleBase(roleBase *MsgRoleBase) {
	this.roleBase = roleBase
}

func (this *MsgTestSend) GetRoleBase() *MsgRoleBase {
	return this.roleBase
}

func (this *MsgTestSend) SetIdF32(idF32 []float32) {
	this.idF32 = idF32
}

func (this *MsgTestSend) GetIdF32() []float32 {
	return this.idF32
}

func (this *MsgTestSend) SetIdOpU8(idOpU8 uint8) {
	this.idOpU8Flag = 1
	this.idOpU8 = idOpU8
}

func (this *MsgTestSend) GetIdOpU8() uint8 {
	return this.idOpU8
}

func (this *MsgTestSend) SetOpRoleBase(opRoleBase *MsgRoleBase) {
	this.opRoleBaseFlag = 1
	this.opRoleBase = opRoleBase
}

func (this *MsgTestSend) GetOpRoleBase() *MsgRoleBase {
	return this.opRoleBase
}
