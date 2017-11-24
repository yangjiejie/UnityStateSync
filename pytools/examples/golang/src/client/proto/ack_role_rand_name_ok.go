package proto

import (
	"packet"
)

type AckRoleRandNameOk struct {
	uname                    string
}

func AckRoleRandNameOkDecode(pack *packet.Packet) *AckRoleRandNameOk {
	ackRoleRandNameOk := &AckRoleRandNameOk{}

	ackRoleRandNameOk.uname = pack.ReadString()
	return ackRoleRandNameOk
}

func (this *AckRoleRandNameOk) GetUname() string {
	return this.uname
}
