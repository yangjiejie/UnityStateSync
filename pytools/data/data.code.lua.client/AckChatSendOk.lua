module("AckChatSendOk", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckChatSendOk})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.channel = 0
	self.uid = 0
	self.uname = 0
	self.content = 0
end


function decode(self, pack)
	self.channel = pack:readU8()
	self.uid = pack:readU32()
	self.uname = pack:readString()
	self.content = pack:readString()
	return self
end


function getChannel(self)
	return self.channel
end

function getUid(self)
	return self.uid
end

function getUname(self)
	return self.uname
end

function getContent(self)
	return self.content
end

