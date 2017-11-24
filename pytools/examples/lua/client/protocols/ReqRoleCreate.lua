module("ReqRoleCreate", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqRoleCreate})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uid = 0
	self.uuid = 0
	self.sid = 0
	self.cid = 0
	self.os = 0
	self.version = 0
	self.uname = 0
	self.source = 0
	self.source_sub = 0
	self.login_time = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU32(self.uid)
	pack:writeU32(self.uuid)
	pack:writeU16(self.sid)
	pack:writeU16(self.cid)
	pack:writeString(self.os)
	pack:writeString(self.version)
	pack:writeString(self.uname)
	pack:writeString(self.source)
	pack:writeString(self.source_sub)
	pack:writeU32(self.login_time)
	return pack:encode(Msg.P_REQ_ROLE_CREATE)
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

function setOs(self, os)
	self.os = os
end

function setVersion(self, version)
	self.version = version
end

function setUname(self, uname)
	self.uname = uname
end

function setSource(self, source)
	self.source = source
end

function setSourceSub(self, source_sub)
	self.source_sub = source_sub
end

function setLoginTime(self, login_time)
	self.login_time = login_time
end

