using System;


public class Msg
{
	//角色登录
	public static ushort P_REQ_ROLE_LOGIN                       = 1010;

	//登录成功
	public static ushort P_ACK_ROLE_LOGIN_OK                    = 1020;

	//请求玩家列表
	public static ushort P_REQ_SCENE_REQ_PLAYERS                = 2010;

	//场景玩家列表
	public static ushort P_ACK_SCENE_PLAYERS                    = 2020;

	//玩家进入场景
	public static ushort P_ACK_SCENE_ENTER                      = 2030;

	//玩家退出场景
	public static ushort P_ACK_SCENE_EXIT                       = 2040;

	//位置和旋转
	public static ushort P_REQ_SCENE_POS_ROT                    = 2050;

	//位置和旋转
	public static ushort P_ACK_SCENE_POS_ROT_OK                 = 2060;

	//动画-行走
	public static ushort P_REQ_SCENE_ANIM_MOVE                  = 2070;

	//动画-行走
	public static ushort P_ACK_SCENE_ANIM_MOVE_OK               = 2080;

	//场景玩家旋转和位置信息
	public static ushort P_MSG_SCENE_POS_ROT                    = 50020;

	//场景玩家旋转和位置信息
	public static ushort P_MSG_SCENE_PLAYER                     = 50030;
}
