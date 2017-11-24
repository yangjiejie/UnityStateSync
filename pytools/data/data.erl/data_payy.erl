-module(data_payy).

-include("common.hrl").

-export([get/2]).

%% get(RmbSum);
%% 充值数据;
%% 充值
get(1, 25) ->
	#d_payy{
		days         = 30,              % 月卡生效天数
		value        = 300,             % 元宝数量
		rmb          = 25,              % 充值数量
		second       = 0,               % 第二次开始赠送元宝
		type         = 2,               % 充值类型
		id           = 1,               % id
		first        = 0                % 第一次赠送元宝
	};
get(2, 6) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 60,              % 元宝数量
		rmb          = 6,               % 充值数量
		second       = 60,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 2,               % id
		first        = 60               % 第一次赠送元宝
	};
get(3, 30) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 300,             % 元宝数量
		rmb          = 30,              % 充值数量
		second       = 15,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 3,               % id
		first        = 15               % 第一次赠送元宝
	};
get(4, 98) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 980,             % 元宝数量
		rmb          = 98,              % 充值数量
		second       = 80,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 4,               % id
		first        = 80               % 第一次赠送元宝
	};
get(5, 198) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 1980,            % 元宝数量
		rmb          = 198,             % 充值数量
		second       = 240,             % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 5,               % id
		first        = 240              % 第一次赠送元宝
	};
get(6, 328) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 3280,            % 元宝数量
		rmb          = 328,             % 充值数量
		second       = 600,             % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 6,               % id
		first        = 600              % 第一次赠送元宝
	};
get(7, 648) ->
	#d_payy{
		days         = 0,               % 月卡生效天数
		value        = 6480,            % 元宝数量
		rmb          = 648,             % 充值数量
		second       = 6480,            % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		id           = 7,               % id
		first        = 6480             % 第一次赠送元宝
	};
get(_, _) ->
	?null.