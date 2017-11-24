ReqSceneMove = {}
setmetatable(ReqSceneMove, {__index = _G})
local _ENV = ReqSceneMove


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = ReqSceneMove})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.scene_rot_pos = nil
	self.forward = nil
	self.ani_name = 0
	self.x_axis = 0
end


function encode(self)
	pack = packet.new()
	pack:writeBytes(self.scene_rot_pos:getBytes())
	pack:writeBytes(self.forward:getBytes())
	pack:writeString(self.ani_name)
	pack:writeI16(self.x_axis)
	return pack:encode(Msg.P_REQ_SCENE_MOVE)
end


function setSceneRotPos(self, scene_rot_pos)
	self.scene_rot_pos = scene_rot_pos
end

function setForward(self, forward)
	self.forward = forward
end

function setAniName(self, ani_name)
	self.ani_name = ani_name
end

function setXAxis(self, x_axis)
	self.x_axis = x_axis
end

