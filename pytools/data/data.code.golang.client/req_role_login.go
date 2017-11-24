package proto

import (
	"packet"
)

type ReqRoleLogin struct {
	uid                      uint32
	uuid                     uint32
	sid                      uint16
	cid                      uint16
	loginTime                uint32
	pwd                      string
	relink                   uint8
	debug                    uint8
	os                       string
	version                  string
}

func (this *ReqRoleLogin) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)
	pack.WriteUint32(this.uuid)
	pack.WriteUint16(this.sid)
	pack.WriteUint16(this.cid)
	pack.WriteUint32(this.loginTime)
	pack.WriteString(this.pwd)
	pack.WriteUint8(this.relink)
	pack.WriteUint8(this.debug)
	pack.WriteString(this.os)
	pack.WriteString(this.version)

	return pack.Encode(P_REQ_ROLE_LOGIN)
}

func (this *ReqRoleLogin) SetUid(uid uint32) {
	this.uid = uid
}

func (this *ReqRoleLogin) SetUuid(uuid uint32) {
	this.uuid = uuid
}

func (this *ReqRoleLogin) SetSid(sid uint16) {
	this.sid = sid
}

func (this *ReqRoleLogin) SetCid(cid uint16) {
	this.cid = cid
}

func (this *ReqRoleLogin) SetLoginTime(loginTime uint32) {
	this.loginTime = loginTime
}

func (this *ReqRoleLogin) SetPwd(pwd string) {
	this.pwd = pwd
}

func (this *ReqRoleLogin) SetRelink(relink uint8) {
	this.relink = relink
}

func (this *ReqRoleLogin) SetDebug(debug uint8) {
	this.debug = debug
}

func (this *ReqRoleLogin) SetOs(os string) {
	this.os = os
}

func (this *ReqRoleLogin) SetVersion(version string) {
	this.version = version
}
