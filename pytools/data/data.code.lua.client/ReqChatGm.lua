module("ReqChatGm", package.seeall)


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqChatGm})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.content = 0
end


function encode(self)
	pack = packet.new()
	pack:writeString(self.content)
	return pack:encode(Msg.P_REQ_CHAT_GM)
end


function setContent(self, content)
	self.content = content
end

