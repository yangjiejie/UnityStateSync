package proto

import (
	"packet"
)

type MsgRoleBase struct {
	uid                      uint32
	uname                    string
}

func (this *MsgRoleBase) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)
	pack.WriteString(this.uname)

	return pack.ReadBytes()
}

func MsgRoleBaseDecode(pack *packet.Packet) *MsgRoleBase {
	msgRoleBase := &MsgRoleBase{}

	msgRoleBase.uid = pack.ReadUint32()
	msgRoleBase.uname = pack.ReadString()
	return msgRoleBase
}

func (this *MsgRoleBase) SetUid(uid uint32) {
	this.uid = uid
}

func (this *MsgRoleBase) GetUid() uint32 {
	return this.uid
}

func (this *MsgRoleBase) SetUname(uname string) {
	this.uname = uname
}

func (this *MsgRoleBase) GetUname() string {
	return this.uname
}
