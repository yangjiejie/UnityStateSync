ReqTestPhp = {}
setmetatable(ReqTestPhp, {__index = _G})
local _ENV = ReqTestPhp


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqTestPhp})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.u64 = 0
	self.strxx = 0
	self.msg_req = nil
	self.msg_opt_flag = 0
	self.msg_opt = nil
	self.msg_rep = {}
end


function decode(self, pack)
	self.u64 = pack:readu64()
	self.strxx = pack:readString()
	self.msg_req = MsgTestPhp.new():decode(pack)
	self.msg_opt_flag = pack:readU8()
	if self.msg_opt_flag then
		self.msg_opt = MsgTestPhp.new():decode(pack)
	end
	msg_rep_count = pack:readU16()
	for i = 1, msg_rep_count do
		table.insert(self.msg_rep, MsgTestPhp.new():decode(pack))
	end
	return self
end


function getU64(self)
	return self.u64
end

function getStrxx(self)
	return self.strxx
end

function getMsgReq(self)
	return self.msg_req
end

function getMsgOpt(self)
	return self.msg_opt
end

function getMsgRep(self)
	return self.msg_rep
end

