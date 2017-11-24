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

func (this *ReqRoleCreate) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)
	pack.WriteUint32(this.uuid)
	pack.WriteUint16(this.sid)
	pack.WriteUint16(this.cid)
	pack.WriteString(this.os)
	pack.WriteString(this.version)
	pack.WriteString(this.uname)
	pack.WriteString(this.source)
	pack.WriteString(this.sourceSub)
	pack.WriteUint32(this.loginTime)

	return pack.Encode(P_REQ_ROLE_CREATE)
}

func (this *ReqRoleCreate) SetUid(uid uint32) {
	this.uid = uid
}

func (this *ReqRoleCreate) SetUuid(uuid uint32) {
	this.uuid = uuid
}

func (this *ReqRoleCreate) SetSid(sid uint16) {
	this.sid = sid
}

func (this *ReqRoleCreate) SetCid(cid uint16) {
	this.cid = cid
}

func (this *ReqRoleCreate) SetOs(os string) {
	this.os = os
}

func (this *ReqRoleCreate) SetVersion(version string) {
	this.version = version
}

func (this *ReqRoleCreate) SetUname(uname string) {
	this.uname = uname
}

func (this *ReqRoleCreate) SetSource(source string) {
	this.source = source
}

func (this *ReqRoleCreate) SetSourceSub(sourceSub string) {
	this.sourceSub = sourceSub
}

func (this *ReqRoleCreate) SetLoginTime(loginTime uint32) {
	this.loginTime = loginTime
}
