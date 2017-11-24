module("ReqRoleLogin", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqRoleLogin})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uid = 0
	self.uuid = 0
	self.sid = 0
	self.cid = 0
	self.login_time = 0
	self.pwd = 0
	self.relink = 0
	self.debug = 0
	self.os = 0
	self.version = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU32(self.uid)
	pack:writeU32(self.uuid)
	pack:writeU16(self.sid)
	pack:writeU16(self.cid)
	pack:writeU32(self.login_time)
	pack:writeString(self.pwd)
	pack:writeU8(self.relink)
	pack:writeU8(self.debug)
	pack:writeString(self.os)
	pack:writeString(self.version)
	return pack:encode(Msg.P_REQ_ROLE_LOGIN)
end


function setUid(self, uid)
	self.uid = uid
end

function setUuid(self, uuid)
	self.uuid = uuid
end

function setSid(self, sid)
	self.sid = sid
end

function setCid(self, cid)
	self.cid = cid
end

function setLoginTime(self, login_time)
	self.login_time = login_time
end

function setPwd(self, pwd)
	self.pwd = pwd
end

function setRelink(self, relink)
	self.relink = relink
end

function setDebug(self, debug)
	self.debug = debug
end

function setOs(self, os)
	self.os = os
end

function setVersion(self, version)
	self.version = version
end

