package proto

import (
	"packet"
)

type AckRoleLoginOk struct {
	uname                    string
}

func (this *AckRoleLoginOk) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteString(this.uname)

	return pack.Encode(P_ACK_ROLE_LOGIN_OK)
}

func (this *AckRoleLoginOk) SetUname(uname string) {
	this.uname = uname
}
