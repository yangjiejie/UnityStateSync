package proto

import (
	"packet"
)

type ReqRoleCreate struct {
	uid                      uint32
	uuid                     uint32
	sid                      uint16
	cid                      uint16
	os                       string
	version                  string
	uname                    string
	source                   string
	sourceSub                string
	loginTime                uint32
}

func ReqRoleCreateDecode(pack *packet.Packet) *ReqRoleCreate {
	reqRoleCreate := &ReqRoleCreate{}

	reqRoleCreate.uid = pack.ReadUint32()
	reqRoleCreate.uuid = pack.ReadUint32()
	reqRoleCreate.sid = pack.ReadUint16()
	reqRoleCreate.cid = pack.ReadUint16()
	reqRoleCreate.os = pack.ReadString()
	reqRoleCreate.version = pack.ReadString()
	reqRoleCreate.uname = pack.ReadString()
	reqRoleCreate.source = pack.ReadString()
	reqRoleCreate.sourceSub = pack.ReadString()
	reqRoleCreate.loginTime = pack.ReadUint32()
	return reqRoleCreate
}

func (this *ReqRoleCreate) GetUid() uint32 {
	return this.uid
}

func (this *ReqRoleCreate) GetUuid() uint32 {
	return this.uuid
}

func (this *ReqRoleCreate) GetSid() uint16 {
	return this.sid
}

func (this *ReqRoleCreate) GetCid() uint16 {
	return this.cid
}

func (this *ReqRoleCreate) GetOs() string {
	return this.os
}

func (this *ReqRoleCreate) GetVersion() string {
	return this.version
}

func (this *ReqRoleCreate) GetUname() string {
	return this.uname
}

func (this *ReqRoleCreate) GetSource() string {
	return this.source
}

func (this *ReqRoleCreate) GetSourceSub() string {
	return this.sourceSub
}

func (this *ReqRoleCreate) GetLoginTime() uint32 {
	return this.loginTime
}
