package proto

import (
	"packet"
)

type AckRoleRandNameOk struct {
	uname                    string
}

func (this *AckRoleRandNameOk) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteString(this.uname)

	return pack.Encode(P_ACK_ROLE_RAND_NAME_OK)
}

func (this *AckRoleRandNameOk) SetUname(uname string) {
	this.uname = uname
}
