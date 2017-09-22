-module(pb).

-include("common.hrl").

-compile(export_all).


%% 角色登录
req_role_login(Bin0) ->
	{Uname, Bin1} = ?D(string, Bin0),
	#req_role_login{uname=Uname}.

%% 登录成功
ack_role_login_ok(#ack_role_login_ok{uid=Uid,uname=Uname,pos_x=PosX,pos_y=PosY,pos_z=PosZ}) ->
	Bin1 = ?E(u32, Uid),
	Bin2 = ?E(string, Uname),
	Bin3 = ?E(f32, PosX),
	Bin4 = ?E(f32, PosY),
	Bin5 = ?E(f32, PosZ),
	BinData = <<Bin1/binary,Bin2/binary,Bin3/binary,Bin4/binary,Bin5/binary>>,
	?MSG(1020, BinData).

%% 请求玩家列表
req_scene_req_players(Bin0) ->
	#req_scene_req_players{}.

%% 场景玩家列表
ack_scene_players(#ack_scene_players{players=Players}) ->
	FunPlayers = fun(FPlayers, {CountAcc, BinAcc}) ->
			FBin = msg_scene_player_encode(FPlayers),
			{CountAcc + 1, <<BinAcc/binary,FBin/binary>>}
	end,
	{CountPlayers, BinPlayers} = lists:foldl(FunPlayers, {0, <<>>}, Players),
	Bin1 = ?E(u16, CountPlayers),
	Bin2 = BinPlayers,
	BinData = <<Bin1/binary,Bin2/binary>>,
	?MSG(2020, BinData).

%% 玩家进入场景
ack_scene_enter(#ack_scene_enter{player=Player}) ->
	Bin1 = msg_scene_player_encode(Player),
	BinData = <<Bin1/binary>>,
	?MSG(2030, BinData).

%% 玩家退出场景
ack_scene_exit(#ack_scene_exit{uid=Uid}) ->
	Bin1 = ?E(u32, Uid),
	BinData = <<Bin1/binary>>,
	?MSG(2040, BinData).

%% 位置和旋转
req_scene_pos_rot(Bin0) ->
	{Posrot, Bin1} = msg_scene_pos_rot_decode(Bin0),
	#req_scene_pos_rot{posrot=Posrot}.

%% 位置和旋转
ack_scene_pos_rot_ok(#ack_scene_pos_rot_ok{uid=Uid,posrot=Posrot}) ->
	Bin1 = ?E(u32, Uid),
	Bin2 = msg_scene_pos_rot_encode(Posrot),
	BinData = <<Bin1/binary,Bin2/binary>>,
	?MSG(2060, BinData).

%% 动画-行走
req_scene_anim_move(Bin0) ->
	{IsMove, Bin1} = ?D(u8, Bin0),
	#req_scene_anim_move{is_move=IsMove}.

%% 动画-行走
ack_scene_anim_move_ok(#ack_scene_anim_move_ok{uid=Uid,is_move=IsMove}) ->
	Bin1 = ?E(u32, Uid),
	Bin2 = ?E(u8, IsMove),
	BinData = <<Bin1/binary,Bin2/binary>>,
	?MSG(2080, BinData).

%% 场景玩家旋转和位置信息
msg_scene_pos_rot_encode(#msg_scene_pos_rot{pos_x=PosX,pos_y=PosY,pos_z=PosZ,rot_x=RotX,rot_y=RotY,rot_z=RotZ}) ->
	Bin1 = ?E(f32, PosX),
	Bin2 = ?E(f32, PosY),
	Bin3 = ?E(f32, PosZ),
	Bin4 = ?E(f32, RotX),
	Bin5 = ?E(f32, RotY),
	Bin6 = ?E(f32, RotZ),
	<<Bin1/binary,Bin2/binary,Bin3/binary,Bin4/binary,Bin5/binary,Bin6/binary>>.
msg_scene_pos_rot_decode(Bin0) ->
	{PosX, Bin1} = ?D(f32, Bin0),
	{PosY, Bin2} = ?D(f32, Bin1),
	{PosZ, Bin3} = ?D(f32, Bin2),
	{RotX, Bin4} = ?D(f32, Bin3),
	{RotY, Bin5} = ?D(f32, Bin4),
	{RotZ, Bin6} = ?D(f32, Bin5),
	{#msg_scene_pos_rot{pos_x=PosX,pos_y=PosY,pos_z=PosZ,rot_x=RotX,rot_y=RotY,rot_z=RotZ}, Bin6}.

%% 场景玩家旋转和位置信息
msg_scene_player_encode(#msg_scene_player{uid=Uid,uname=Uname,scene_pos_rot=ScenePosRot}) ->
	Bin1 = ?E(u32, Uid),
	Bin2 = ?E(string, Uname),
	Bin3 = msg_scene_pos_rot_encode(ScenePosRot),
	<<Bin1/binary,Bin2/binary,Bin3/binary>>.
msg_scene_player_decode(Bin0) ->
	{Uid, Bin1} = ?D(u32, Bin0),
	{Uname, Bin2} = ?D(string, Bin1),
	{ScenePosRot, Bin3} = msg_scene_pos_rot_decode(Bin2),
	{#msg_scene_player{uid=Uid,uname=Uname,scene_pos_rot=ScenePosRot}, Bin3}.
