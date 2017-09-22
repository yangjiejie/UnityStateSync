-module(server).

-include("common.hrl").

-compile(export_all).


start() ->
	{ok, ListenSocket} = gen_tcp:listen(?LISTEN_PORT, ?TCP_OPTIONS),
	accept(ListenSocket).

accept(ListenSocket) ->
	{ok, Socket} = gen_tcp:accept(ListenSocket),
	Pid = spawn(?MODULE, recv, [Socket]),
	gen_tcp:controlling_process(Socket, Pid),
	accept(ListenSocket).

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

dispatch(?P_C_TEST_X_X, Socket, Bin) ->
	?PRINT("Bin: ~w~n", [Bin]),
    ReqTestXX 	= pb:req_test_x_x(Bin),
    ?PRINT("ReqTestXX : ~w~n", [ReqTestXX]),

    AckTestXX   = #ack_test_x_x{id_u8=100,id_u16=10000,id_u32=100000,repeat_id_u8=[255,255],optional_id_u8=222},
    BinMsg      = pb:ack_test_x_x(AckTestXX),
    pb_msg:send(Socket, BinMsg);
dispatch(?P_C_TEST_SEND, Socket, Bin) ->
	?PRINT("Bin: ~w~n", [Bin]),
    ReqTestSend = pb:req_test_send(Bin),
    ?PRINT("ReqTestSend : ~p~n", [ReqTestSend]),

    AckTestSend = #ack_test_send_ok{
        id_u8 = ReqTestSend#req_test_send.id_u8,
        id_f32 = ReqTestSend#req_test_send.id_f32,
        id_op_u8 = ReqTestSend#req_test_send.id_op_u8,
        role_base = ReqTestSend#req_test_send.role_base,
        op_role_base = ReqTestSend#req_test_send.op_role_base
    },
    BinMsg      = pb:ack_test_send_ok(AckTestSend),
    pb_msg:send(Socket, BinMsg);
dispatch(PacketId, _Socket, Bin) ->
	?PRINT("Unknow PacketId: ~w Bin: ~w~n", [PacketId, Bin]).
