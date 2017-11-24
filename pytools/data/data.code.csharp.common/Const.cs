using UnityEngine;
using System;

public class Const
{
	public static uint TRUE                 = 1; // 各种true
	public static uint FALSE                = 0; // 各种false
	public static uint PERCENT              = 10000; // 万分比
	public static uint BAD_HEART            = 30; // 心跳容错次数上限
	public static uint TSP_INTERVAL         = 60; // 时间同步协议频率（秒）
	public static uint INTERVAL_HEART       = 3000; // 心跳间隔时间（毫秒）PS：300毫秒容错

	public static uint SEX_GG               = 1; // 性别--男
	public static uint SEX_MM               = 2; // 性别--女

	public static uint PLAYER               = 1; // 人物类型--玩家
	public static uint PARTNER              = 2; // 人物类型--伙伴



	public static uint ROLE_LV              = 1; // 等级
	public static uint ROLE_NAME            = 2; // 昵称

	public static uint ROLE_CURRENCY_EXP    = 41; // 货币-经验
	public static uint ROLE_CURRENCY_RMB    = 42; // 货币-元宝（充值）
	public static uint ROLE_CURRENCY_RMB_BIND = 43; // 货币-元宝（绑定）（游戏内）
	public static uint ROLE_CURRENCY_GOLD   = 44; // 货币-铜钱



	public static uint MAP_TYPE_CITY        = 1; // 地图类型--城镇
	public static uint MAP_TYPE_COPY        = 2; // 地图类型--副本



	public static uint FCM_NORMAL           = 0; // 防沉迷状态-正常(非沉迷状态)
	public static uint FCM_HALF             = 1; // 防沉迷状态-收益减半
	public static uint FCM_NOTHING          = 2; // 防沉迷状态-收益减为零
	public static uint FCM_ERROR_VALUE      = 3; // 防沉迷-时间沉余(秒)
	public static uint FCM_TIP_INTERVAL     = 900; // 防沉迷-超出5小时，每15分钟提示一次
}
