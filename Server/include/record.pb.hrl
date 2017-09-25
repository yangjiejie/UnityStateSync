%% 角色登录
-record(req_role_login, {
	uname           = <<>>        % 玩家昵称
}).

%% 登录成功
-record(ack_role_login_ok, {
	uid             = 0,          % 玩家ID
	uname           = <<>>,       % 玩家名字
	pos_x           = 0,          % 位置x
	pos_y           = 0,          % 位置y
	pos_z           = 0           % 位置z
}).

%% 请求玩家列表
-record(req_scene_req_players, {

}).

%% 场景玩家列表
-record(ack_scene_players, {
	players         = []          % 玩家列表
}).

%% 玩家进入场景
-record(ack_scene_enter, {
	player          = 0           % 玩家信息
}).

%% 玩家退出场景
-record(ack_scene_exit, {
	uid             = 0           % 玩家ID
}).

%% 位置和旋转
-record(req_scene_pos_rot, {
	posrot          = 0           % 位置和旋转
}).

%% 位置和旋转
-record(ack_scene_pos_rot_ok, {
	uid             = 0,          % 玩家ID
	posrot          = 0           % 位置和旋转
}).

%% 动画-行走
-record(req_scene_anim_move, {
	is_move         = 0           % 是否行走
}).

%% 动画-行走
-record(ack_scene_anim_move_ok, {
	uid             = 0,          % 玩家ID
	is_move         = 0           % 是否行走
}).

%% 动画-行走
-record(req_scene_anim, {
	skill1          = 0,          % 技能1
	skill2          = 0,          % 技能2
	skill3          = 0           % 技能3
}).

%% 动画-行走
-record(ack_scene_anim_ok, {
	uid             = 0,          % 玩家ID
	skill1          = 0,          % 技能1
	skill2          = 0,          % 技能2
	skill3          = 0           % 技能3
}).

%% 场景玩家旋转和位置信息
-record(msg_scene_pos_rot, {
	pos_x           = 0,          % 位置x
	pos_y           = 0,          % 位置y
	pos_z           = 0,          % 位置z
	rot_x           = 0,          % 旋转x
	rot_y           = 0,          % 旋转y
	rot_z           = 0           % 旋转z
}).

%% 场景玩家旋转和位置信息
-record(msg_scene_player, {
	uid             = 0,          % 玩家ID
	uname           = <<>>,       % 玩家昵称
	scene_pos_rot   = 0           % 旋转和位置信息
}).
