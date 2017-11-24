package proto

import (
	"packet"
)

type MsgFriendBaseAdd struct {
	uid                      uint32
	uname                    string
}

func (this *MsgFriendBaseAdd) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)
	pack.WriteString(this.uname)

	return pack.ReadBytes()
}

func MsgFriendBaseAddDecode(pack *packet.Packet) *MsgFriendBaseAdd {
	msgFriendBaseAdd := &MsgFriendBaseAdd{}

	msgFriendBaseAdd.uid = pack.ReadUint32()
	msgFriendBaseAdd.uname = pack.ReadString()
	return msgFriendBaseAdd
}

func (this *MsgFriendBaseAdd) SetUid(uid uint32) {
	this.uid = uid
}

func (this *MsgFriendBaseAdd) GetUid() uint32 {
	return this.uid
}

func (this *MsgFriendBaseAdd) SetUname(uname string) {
	this.uname = uname
}

func (this *MsgFriendBaseAdd) GetUname() string {
	return this.uname
}
