-module(client).

-include("common.hrl").

-compile(export_all).


start() ->
	{ok, Socket}   = gen_tcp:connect(?HOST, ?PORT, [binary, {packet,0},{active,true}]),
	send(Socket),
	recv(Socket).

send(Socket) ->
	ReqTestXX 	= #req_test_x_x{id_u8=123,id_u16=1234,id_u32=12345,repeat_id_u8=[123,123],optional_id_u8=233},
	BinMsg		= pb:req_test_x_x(ReqTestXX),

	MsgRoleBase	= #msg_role_base{uid=1111,uname= <<"mirahs">>},
	ReqTestSend	= #req_test_send{id_u8=123,id_f32=[1.23,12.3,123.4],id_op_u8=111,role_base=MsgRoleBase,op_role_base=MsgRoleBase},
	BinTestSend	= pb:req_test_send(ReqTestSend),
	pb_msg:send(Socket, <<BinMsg/binary,BinTestSend/binary>>).


recv(Socket) ->
	recv(Socket, <<>>).

recv(Socket, Bin) ->
	receive
		{tcp, Socket, BinRecv} ->
			Bin2 = work(Socket, <<Bin/binary,BinRecv/binary>>),
			recv(Socket, Bin2);
		{tcp_closed, Socket} ->
			gen_tcp:close(Socket);
		_ ->
			recv(Socket, Bin)
	end.

work(Socket, <<Length:16/big-integer-unsigned, BinData:Length/binary, BinAcc/binary>>) ->
	<<PacketId:16/big-integer-unsigned, Bin/binary>> = BinData,
	dispatch(PacketId, Socket, Bin),
	work(Socket, BinAcc);
work(_Socket, BinAcc) ->
	BinAcc.

dispatch(?P_S_TEST_X_X, _Socket, Bin) ->
	AckTestXX = pb:ack_test_x_x(Bin),
	?PRINT("AckTestXX: ~p~n", [AckTestXX]);
dispatch(?P_S_TEST_SEND_OK, _Socket, Bin) ->
	AckTestSendOk = pb:ack_test_send_ok(Bin),
	?PRINT("AckTestSendOk: ~p~n", [AckTestSendOk]);
dispatch(PacketId, _Socket, Bin) ->
	?PRINT("Unknow PacketId: ~w Bin: ~w~n", [PacketId, Bin]).
