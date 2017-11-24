package proto

import (
	"packet"
)

type AckRoleLoginOk struct {
	uname                    string
}

func AckRoleLoginOkDecode(pack *packet.Packet) *AckRoleLoginOk {
	ackRoleLoginOk := &AckRoleLoginOk{}

	ackRoleLoginOk.uname = pack.ReadString()
	return ackRoleLoginOk
}

func (this *AckRoleLoginOk) GetUname() string {
	return this.uname
}
