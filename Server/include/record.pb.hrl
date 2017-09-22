%% 发送聊天信息
-record(req_chat_send, {
	channel         = 0,          % 聊天频道(世界|国家|军团|私聊|系统)
	dest_uid        = 0,          % 私聊玩家uid
	content         = <<>>        % 聊天内容
}).

%% 聊天信息返回
-record(ack_chat_send_ok, {
	channel         = 0,          % 聊天频道(世界|国家|军团|私聊|系统)
	uid             = 0,          % 玩家uid
	uname           = <<>>,       % 玩家昵称
	content         = <<>>        % 聊天内容
}).

%% GM命令
-record(req_chat_gm, {
	content         = <<>>        % GM内容
}).

%% 角色登录
-record(req_role_login, {
	uid             = 0,          % 玩家uid
	uuid            = 0,          % 账号uuid
	sid             = 0,          % 服务器id
	cid             = 0,          % 平台id
	login_time      = 0,          % 登录时间
	pwd             = <<>>,       % 校验码
	relink          = 0,          % 是否重连
	debug           = 0,          % 是否调试
	os              = <<>>,       % 操作系统
	version         = <<>>        % 版本号
}).

%% 角色创建
-record(req_role_create, {
	uid             = 0,          % 玩家uid
	uuid            = 0,          % 账号uuid
	sid             = 0,          % 服务器id
	cid             = 0,          % 平台id
	os              = <<>>,       % 操作系统
	version         = <<>>,       % 版本号
	uname           = <<>>,       % 玩家昵称
	source          = <<>>,       % 来源
	source_sub      = <<>>,       % 子来源
	login_time      = 0           % 登录时间
}).

%% 请求随机名字
-record(req_role_rand_name, {

}).

%% 随机名字返回
-record(ack_role_rand_name_ok, {
	uname           = <<>>        % 玩家名字
}).

%% 登录成功
-record(ack_role_login_ok, {
	uname           = <<>>        % 玩家名字
}).

%% 登录成功(无角色)
-record(ack_role_login_ok_no_role, {

}).

%% 请求进入场景(飞)
-record(req_scene_enter_fly, {
	map_id          = 0           % 地图ID
}).

%% 请求进入场景
-record(req_scene_enter, {
	door_id         = 0           % 传送门ID
}).

%% 行走数据
-record(req_scene_move, {
	scene_rot_pos   = 0,          % 旋转和位置信息
	forward         = 0,          % 方向向量
	ani_name        = <<>>,       % 当前动画
	x_axis          = 0           % 鼠标左右旋转
}).

%% 进入场景成功
-record(ack_scene_enter, {
	player          = 0           % 玩家信息
}).

%% 场景玩家列表
-record(ack_scene_players, {
	players         = []          % 玩家列表
}).

%% 退出场景成功
-record(ack_scene_exit, {
	uid             = 0           % 玩家ID
}).

%% 请求玩家列表
-record(req_scene_req_players, {

}).

%% 行走数据
-record(ack_scene_move, {
	scene_rot_pos   = 0,          % 旋转和位置信息
	forward         = 0,          % 方向向量
	ani_name        = <<>>,       % 当前动画
	x_axis          = 0,          % 鼠标左右旋转
	uid             = 0           % 玩家ID
}).

%% 玩家基础信息
-record(msg_role_base, {
	uid             = 0,          % 玩家uid
	uname           = <<>>        % 玩家昵称
}).

%% 添加好友基础信息
-record(msg_friend_base_add, {
	uid             = 0,          % 玩家uid
	uname           = <<>>        % 玩家昵称
}).

%% 场景玩家旋转和位置信息
-record(msg_scene_rot_pos, {
	rot_x           = 0,          % 旋转x
	rot_y           = 0,          % 旋转y
	rot_z           = 0,          % 旋转z
	pos_x           = 0,          % 位置x
	pos_y           = 0,          % 位置y
	pos_z           = 0           % 位置z
}).

%% 场景玩家旋转和位置信息
-record(msg_scene_player, {
	uid             = 0,          % 玩家ID
	scene_rot_pos   = 0           % 旋转和位置信息
}).

%% 场景Vector3信息
-record(msg_scene_vector_3, {
	x               = 0,          % x
	y               = 0,          % y
	z               = 0           % z
}).

%% 
-record(msg_test_x_x, {
	id_u8           = 0,          % 
	id_f32          = [],         % 
	id_op_u8        = undefined   % 
}).

%% 测试发送
-record(req_test_send, {
	id_u8           = 0,          % 
	role_base       = 0,          % 
	id_f32          = [],         % 
	id_op_u8        = undefined,  % 
	op_role_base    = undefined   % 
}).

%% 测试返回
-record(ack_test_send_ok, {
	id_u8           = 0,          % 
	role_base       = 0,          % 
	id_f32          = [],         % 
	id_op_u8        = undefined,  % 
	op_role_base    = undefined   % 
}).

%% 测试信息块
-record(msg_test_send, {
	id_u8           = 0,          % 
	role_base       = 0,          % 
	id_f32          = [],         % 
	id_op_u8        = undefined,  % 
	op_role_base    = undefined   % 
}).

%% 
-record(req_test_x_x, {
	id_u8           = 0,          % 
	id_u16          = 0,          % 
	id_u32          = 0,          % 
	repeat_id_u8    = [],         % 
	optional_id_u8  = undefined   % 
}).

%% 
-record(ack_test_x_x, {
	id_u8           = 0,          % 
	id_u16          = 0,          % 
	id_u32          = 0,          % 
	repeat_id_u8    = [],         % 
	optional_id_u8  = undefined   % 
}).

%% 
-record(req_test_php, {
	u64             = 0,          % 
	strxx           = <<>>,       % 
	msg_req         = 0,          % 
	msg_opt         = undefined,  % 
	msg_rep         = []          % 
}).

%% 
-record(ack_test_php_ok, {
	u64             = 0,          % 
	strxx           = <<>>,       % 
	msg_req         = 0,          % 
	msg_opt         = undefined,  % 
	msg_rep         = []          % 
}).

%% 
-record(msg_test_php, {
	u16             = 0           % 
}).
