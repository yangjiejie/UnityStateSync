ReqChatSend = {}
setmetatable(ReqChatSend, {__index = _G})
local _ENV = ReqChatSend


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqChatSend})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.channel = 0
	self.dest_uid = 0
	self.content = 0
end


function decode(self, pack)
	self.channel = pack:readU8()
	self.dest_uid = pack:readU32()
	self.content = pack:readString()
	return self
end


function getChannel(self)
	return self.channel
end

function getDestUid(self)
	return self.dest_uid
end

function getContent(self)
	return self.content
end

