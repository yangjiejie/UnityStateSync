package proto

import (
	"packet"
)

type ReqRoleRandName struct {
}

func ReqRoleRandNameDecode(pack *packet.Packet) *ReqRoleRandName {
	reqRoleRandName := &ReqRoleRandName{}

	return reqRoleRandName
}
