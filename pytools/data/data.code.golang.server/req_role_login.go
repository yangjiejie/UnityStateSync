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

func ReqRoleLoginDecode(pack *packet.Packet) *ReqRoleLogin {
	reqRoleLogin := &ReqRoleLogin{}

	reqRoleLogin.uid = pack.ReadUint32()
	reqRoleLogin.uuid = pack.ReadUint32()
	reqRoleLogin.sid = pack.ReadUint16()
	reqRoleLogin.cid = pack.ReadUint16()
	reqRoleLogin.loginTime = pack.ReadUint32()
	reqRoleLogin.pwd = pack.ReadString()
	reqRoleLogin.relink = pack.ReadUint8()
	reqRoleLogin.debug = pack.ReadUint8()
	reqRoleLogin.os = pack.ReadString()
	reqRoleLogin.version = pack.ReadString()
	return reqRoleLogin
}

func (this *ReqRoleLogin) GetUid() uint32 {
	return this.uid
}

func (this *ReqRoleLogin) GetUuid() uint32 {
	return this.uuid
}

func (this *ReqRoleLogin) GetSid() uint16 {
	return this.sid
}

func (this *ReqRoleLogin) GetCid() uint16 {
	return this.cid
}

func (this *ReqRoleLogin) GetLoginTime() uint32 {
	return this.loginTime
}

func (this *ReqRoleLogin) GetPwd() string {
	return this.pwd
}

func (this *ReqRoleLogin) GetRelink() uint8 {
	return this.relink
}

func (this *ReqRoleLogin) GetDebug() uint8 {
	return this.debug
}

func (this *ReqRoleLogin) GetOs() string {
	return this.os
}

func (this *ReqRoleLogin) GetVersion() string {
	return this.version
}
