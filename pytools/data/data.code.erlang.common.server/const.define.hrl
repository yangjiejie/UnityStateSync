%% get(RmbSum);
%% 充值数据;
%% 充值

-define(CONST_TRUE,                     1). % 各种true
-define(CONST_FALSE,                    0). % 各种false
-define(CONST_PERCENT,                  10000). % 万分比
-define(CONST_BAD_HEART,                30). % 心跳容错次数上限
-define(CONST_TSP_INTERVAL,             60). % 时间同步协议频率（秒）
-define(CONST_INTERVAL_HEART,           3000). % 心跳间隔时间（毫秒）PS：300毫秒容错

-define(CONST_SEX_GG,                   1). % 性别--男
-define(CONST_SEX_MM,                   2). % 性别--女

-define(CONST_PLAYER,                   1). % 人物类型--玩家
-define(CONST_PARTNER,                  2). % 人物类型--伙伴



-define(CONST_ROLE_LV,                  1). % 等级
-define(CONST_ROLE_NAME,                2). % 昵称

-define(CONST_ROLE_CURRENCY_EXP,        41). % 货币-经验
-define(CONST_ROLE_CURRENCY_RMB,        42). % 货币-元宝（充值）
-define(CONST_ROLE_CURRENCY_RMB_BIND,   43). % 货币-元宝（绑定）（游戏内）
-define(CONST_ROLE_CURRENCY_GOLD,       44). % 货币-铜钱



-define(CONST_MAP_TYPE_CITY,            1). % 地图类型--城镇
-define(CONST_MAP_TYPE_COPY,            2). % 地图类型--副本



-define(CONST_FCM_NORMAL,               0). % 防沉迷状态-正常(非沉迷状态)
-define(CONST_FCM_HALF,                 1). % 防沉迷状态-收益减半
-define(CONST_FCM_NOTHING,              2). % 防沉迷状态-收益减为零
-define(CONST_FCM_ERROR_VALUE,          3). % 防沉迷-时间沉余(秒)
-define(CONST_FCM_TIP_INTERVAL,         900). % 防沉迷-超出5小时，每15分钟提示一次
