package proto

import (
	"packet"
)

type ReqRoleRandName struct {
}

func (this *ReqRoleRandName) Encode() []byte {
	pack := packet.NewWriteBuff(64)


	return pack.Encode(P_REQ_ROLE_RAND_NAME)
}
