package proto

import (
	"packet"
)

type AckRoleLoginOkNoRole struct {
}

func AckRoleLoginOkNoRoleDecode(pack *packet.Packet) *AckRoleLoginOkNoRole {
	ackRoleLoginOkNoRole := &AckRoleLoginOkNoRole{}

	return ackRoleLoginOkNoRole
}
