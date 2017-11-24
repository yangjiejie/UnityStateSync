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


function decode(self, pack)
	self.uid = pack:readU32()
	self.uuid = pack:readU32()
	self.sid = pack:readU16()
	self.cid = pack:readU16()
	self.login_time = pack:readU32()
	self.pwd = pack:readString()
	self.relink = pack:readU8()
	self.debug = pack:readU8()
	self.os = pack:readString()
	self.version = pack:readString()
	return self
end


function getUid(self)
	return self.uid
end

function getUuid(self)
	return self.uuid
end

function getSid(self)
	return self.sid
end

function getCid(self)
	return self.cid
end

function getLoginTime(self)
	return self.login_time
end

function getPwd(self)
	return self.pwd
end

function getRelink(self)
	return self.relink
end

function getDebug(self)
	return self.debug
end

function getOs(self)
	return self.os
end

function getVersion(self)
	return self.version
end

