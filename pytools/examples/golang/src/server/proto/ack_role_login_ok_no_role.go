package proto

import (
	"packet"
)

type AckRoleLoginOkNoRole struct {
}

func (this *AckRoleLoginOkNoRole) Encode() []byte {
	pack := packet.NewWriteBuff(64)


	return pack.Encode(P_ACK_ROLE_LOGIN_OK_NO_ROLE)
}
