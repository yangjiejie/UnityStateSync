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


function encode(self)
	pack = packet.new()
	pack:writeU8(self.channel)
	pack:writeU32(self.uid)
	pack:writeString(self.uname)
	pack:writeString(self.content)
	return pack:encode(Msg.P_ACK_CHAT_SEND_OK)
end


function setChannel(self, channel)
	self.channel = channel
end

function setUid(self, uid)
	self.uid = uid
end

function setUname(self, uname)
	self.uname = uname
end

function setContent(self, content)
	self.content = content
end

