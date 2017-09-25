-module(server).

-include("common.hrl").

-define(ETS_ONLINE, ets_online).

-define(ROLE_POS_X, 121.62).
-define(ROLE_POS_Y, 0.21).
-define(ROLE_POS_Z, -2.96).

-compile(export_all).


start() ->
	ets:new(?ETS_ONLINE, [named_table, public, {keypos, #ets_online.uid}]),
	{ok, ListenSocket} = gen_tcp:listen(?LISTEN_PORT, ?TCP_OPTIONS),
	accept(ListenSocket, 1).

accept(ListenSocket, Uid) ->
	{ok, Socket} = gen_tcp:accept(ListenSocket),
	Pid = spawn(?MODULE, recv, [Socket, Uid]),
	gen_tcp:controlling_process(Socket, Pid),
	accept(ListenSocket, Uid + 1).

recv(Socket, Uid) ->
	recv(Socket, Uid, <<>>).

recv(Socket, Uid, Bin) ->
	receive
		{tcp, Socket, BinRecv} ->
			Bin2 = work(Socket, Uid, <<Bin/binary,BinRecv/binary>>),
			recv(Socket, Uid, Bin2);
		{send, BinMsg} ->
			pb_msg:send(Socket, BinMsg),
			recv(Socket, Uid, Bin);
		{tcp_closed, Socket} ->
			?PRINT("socket closed"),
			BinSceneExit = pb:ack_scene_exit(#ack_scene_exit{uid = Uid}),
			broadcast(BinSceneExit, Uid),
			online_del(Uid),
			gen_tcp:close(Socket);
		_Error ->
			?PRINT("_Error: ~p", [_Error]),
			recv(Socket, Uid, Bin)
	end.

work(Socket, Uid, <<Length:16/big-integer-unsigned, BinData:Length/binary, BinAcc/binary>>) ->
	<<PacketId:16/big-integer-unsigned, Bin/binary>> = BinData,
	dispatch(PacketId, Socket, Uid, Bin),
	work(Socket, Uid, BinAcc);
work(_Socket, _Uid, BinAcc) ->
	BinAcc.

dispatch(?P_C_ROLE_LOGIN, Socket, Uid, Bin) ->
    #req_role_login{uname = Uname} 	= pb:req_role_login(Bin),
    ?PRINT("P_C_ROLE_LOGIN Uname : ~p~n", [Uname]),

    Online	= #ets_online{uid = Uid, pid = self(), socket = Socket, uname = Uname, pos_x = ?ROLE_POS_X, pos_y = ?ROLE_POS_Y, pos_z = ?ROLE_POS_Z},
	ets:insert(?ETS_ONLINE, Online),
    BinMsg	= pb:ack_role_login_ok(#ack_role_login_ok{uid = Uid, uname = Uname, pos_x = ?ROLE_POS_X, pos_y = ?ROLE_POS_Y, pos_z = ?ROLE_POS_Z}),

	PlayerScene		= #msg_scene_player{uid = Uid, uname = Uname, scene_pos_rot = #msg_scene_pos_rot{
		pos_x = Online#ets_online.pos_x, pos_y = Online#ets_online.pos_y, pos_z = Online#ets_online.pos_z,
		rot_x = Online#ets_online.rot_x, rot_y = Online#ets_online.rot_y, rot_z = Online#ets_online.rot_z
	}},
	BinSceneEnter	= pb:ack_scene_enter(#ack_scene_enter{player = PlayerScene}),
	broadcast(BinSceneEnter, Uid),

    pb_msg:send(Socket, BinMsg);


dispatch(?P_C_SCENE_REQ_PLAYERS, Socket, Uid, _Bin) ->
	?PRINT("P_C_SCENE_REQ_PLAYERS ~n", []),
	OnLines = [Online|| Online = #ets_online{uid = OnUid} <- ets:tab2list(?ETS_ONLINE), OnUid =/= Uid],
	BinPlayers = scene_pb_players_ok(OnLines),
	pb_msg:send(Socket, BinPlayers);
dispatch(?P_C_SCENE_POS_ROT, _Socket, Uid, Bin) ->
	?PRINT("P_C_SCENE_POS_ROT Uid : ~p~n", [Uid]),
	#req_scene_pos_rot{posrot = PosRot} = pb:req_scene_pos_rot(Bin),
	Online = online_get(Uid),
	online_set(Online#ets_online{
		pos_x = PosRot#msg_scene_pos_rot.pos_x, pos_y = PosRot#msg_scene_pos_rot.pos_y, pos_z = PosRot#msg_scene_pos_rot.pos_z,
		rot_x = PosRot#msg_scene_pos_rot.rot_x, rot_y = PosRot#msg_scene_pos_rot.rot_y, rot_z = PosRot#msg_scene_pos_rot.rot_z
	}),
	BinScenePosRot = pb:ack_scene_pos_rot_ok(#ack_scene_pos_rot_ok{uid = Uid, posrot = PosRot}),
	broadcast(BinScenePosRot, Uid);
dispatch(?P_C_SCENE_ANIM_MOVE, _Socket, Uid, Bin) ->
	?PRINT("P_C_SCENE_ANIM_MOVE Uid : ~p~n", [Uid]),
	#req_scene_anim_move{is_move = IsMove} = pb:req_scene_anim_move(Bin),
	BinSceneAnimMove = pb:ack_scene_anim_move_ok(#ack_scene_anim_move_ok{uid = Uid, is_move = IsMove}),
	broadcast(BinSceneAnimMove, Uid);
dispatch(?P_C_SCENE_ANIM, _Socket, Uid, Bin) ->
	?PRINT("P_C_SCENE_ANIM Uid : ~p~n", [Uid]),
	#req_scene_anim{skill1 = Skill1, skill2 = Skill2, skill3 = Skill3} = pb:req_scene_anim(Bin),
	BinSceneAnim = pb:ack_scene_anim_ok(#ack_scene_anim_ok{uid = Uid, skill1 = Skill1, skill2 = Skill2, skill3 = Skill3}),
	broadcast(BinSceneAnim, Uid);


dispatch(PacketId, _Socket, _Uid, Bin) ->
	?PRINT("Unknow PacketId: ~w Bin: ~w~n", [PacketId, Bin]).


broadcast(BinMsg) ->
	broadcast(BinMsg, 0).
broadcast(BinMsg, ExceptUid) ->
	[Pid ! {send, BinMsg} || #ets_online{pid = Pid, uid = Uid} <-  ets:tab2list(?ETS_ONLINE), Uid =/= ExceptUid].

online_get(Uid) ->
	[Online] = ets:lookup(?ETS_ONLINE, Uid),
	Online.
online_set(Online) ->
	ets:insert(?ETS_ONLINE, Online).
online_del(Uid) ->
	ets:delete(?ETS_ONLINE, Uid).

scene_pb_players_ok(OnLines) ->
	PbOnLines = lists:map(
		fun(#ets_online{uid = Uid, uname = Uname, pos_x = PosX, pos_y = PosY, pos_z = PosZ, rot_x = RotX, rot_y = RotY, rot_z = RotZ}) ->
			PosRot = #msg_scene_pos_rot{pos_x = PosX, pos_y = PosY, pos_z = PosZ, rot_x = RotX, rot_y = RotY, rot_z = RotZ},
			#msg_scene_player{uid = Uid, uname = Uname, scene_pos_rot = PosRot}
		end, OnLines),
	pb:ack_scene_players(#ack_scene_players{players = PbOnLines}).
