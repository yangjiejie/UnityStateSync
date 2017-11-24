-module(data_pay).

-include("common.hrl").

-export([get/1, keys/0]).

%% get(RmbSum);
%% 充值数据;
%% 充值
get(25) ->
	#d_pay{
		days         = 30,              % 月卡生效天数
		value        = 300,             % 元宝数量
		rmb          = 25,              % 充值数量
		second       = 0,               % 第二次开始赠送元宝
		type         = 2,               % 充值类型
		first        = 0                % 第一次赠送元宝
	};
get(6) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 60,              % 元宝数量
		rmb          = 6,               % 充值数量
		second       = 60,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 60               % 第一次赠送元宝
	};
get(30) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 300,             % 元宝数量
		rmb          = 30,              % 充值数量
		second       = 15,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 15               % 第一次赠送元宝
	};
get(98) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 980,             % 元宝数量
		rmb          = 98,              % 充值数量
		second       = 80,              % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 80               % 第一次赠送元宝
	};
get(198) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 1980,            % 元宝数量
		rmb          = 198,             % 充值数量
		second       = 240,             % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 240              % 第一次赠送元宝
	};
get(328) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 3280,            % 元宝数量
		rmb          = 328,             % 充值数量
		second       = 600,             % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 600              % 第一次赠送元宝
	};
get(648) ->
	#d_pay{
		days         = 0,               % 月卡生效天数
		value        = 6480,            % 元宝数量
		rmb          = 648,             % 充值数量
		second       = 6480,            % 第二次开始赠送元宝
		type         = 1,               % 充值类型
		first        = 6480             % 第一次赠送元宝
	};
get(_) ->
	?null.

keys() ->
	[25, 6, 30, 98, 198, 328, 648].