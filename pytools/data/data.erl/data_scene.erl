-module(data_scene).

-include("common.hrl").

-export([get/1, keys/0]).

%% get(MapId);
%% 场景数据
get(1000) ->
	#d_scene{
		type         = 1,               % 地图类型
		id           = 1000             % 地图id
	};
get(_) ->
	?null.

keys() ->
	[1000].