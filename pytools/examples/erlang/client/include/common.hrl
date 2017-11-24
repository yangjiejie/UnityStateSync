-define(HOST,						"127.0.0.1").
-define(PORT,						8888).


%% 编码解码
-define(E(T,V),						pb_msg:encode(T, V)).
-define(D(T,V),						pb_msg:decode(T, V)).
-define(MSG(MsgId,Data),			pb_msg:msg(MsgId, Data)).
			   		

%% 调试
-define(PRINT(Format, Args),		io:format("PRINT ~p:~p " ++ Format ++ "~n",				[?MODULE,?LINE|Args])	).
-define(PRINT(Format),				io:format("PRINT ~p:~p " ++ Format ++ "~n",				[?MODULE,?LINE])		).


%% Record
-include("const.pb.hrl").
-include("record.pb.hrl").
