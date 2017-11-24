ReqRoleCreate = {}
setmetatable(ReqRoleCreate, {__index = _G})
local _ENV = ReqRoleCreate


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


function decode(self, pack)
	self.uid = pack:readU32()
	self.uuid = pack:readU32()
	self.sid = pack:readU16()
	self.cid = pack:readU16()
	self.os = pack:readString()
	self.version = pack:readString()
	self.uname = pack:readString()
	self.source = pack:readString()
	self.source_sub = pack:readString()
	self.login_time = pack:readU32()
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

function getOs(self)
	return self.os
end

function getVersion(self)
	return self.version
end

function getUname(self)
	return self.uname
end

function getSource(self)
	return self.source
end

function getSourceSub(self)
	return self.source_sub
end

function getLoginTime(self)
	return self.login_time
end

