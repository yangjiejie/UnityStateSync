using System;


public class Msg
{
	//发送聊天信息
	public static ushort P_REQ_CHAT_SEND                        = 1510;

	//聊天信息返回
	public static ushort P_ACK_CHAT_SEND_OK                     = 1520;

	//GM命令
	public static ushort P_REQ_CHAT_GM                          = 1530;

	//角色登录
	public static ushort P_REQ_ROLE_LOGIN                       = 1010;

	//角色创建
	public static ushort P_REQ_ROLE_CREATE                      = 1020;

	//请求随机名字
	public static ushort P_REQ_ROLE_RAND_NAME                   = 1030;

	//随机名字返回
	public static ushort P_ACK_ROLE_RAND_NAME_OK                = 1040;

	//登录成功
	public static ushort P_ACK_ROLE_LOGIN_OK                    = 1050;

	//登录成功(无角色)
	public static ushort P_ACK_ROLE_LOGIN_OK_NO_ROLE            = 1060;

	//请求进入场景(飞)
	public static ushort P_REQ_SCENE_ENTER_FLY                  = 2010;

	//请求进入场景
	public static ushort P_REQ_SCENE_ENTER                      = 2020;

	//行走数据
	public static ushort P_REQ_SCENE_MOVE                       = 2030;

	//进入场景成功
	public static ushort P_ACK_SCENE_ENTER                      = 2040;

	//场景玩家列表
	public static ushort P_ACK_SCENE_PLAYERS                    = 2050;

	//退出场景成功
	public static ushort P_ACK_SCENE_EXIT                       = 2060;

	//请求玩家列表
	public static ushort P_REQ_SCENE_REQ_PLAYERS                = 2070;

	//行走数据
	public static ushort P_ACK_SCENE_MOVE                       = 2080;

	//玩家基础信息
	public static ushort P_MSG_ROLE_BASE                        = 50000;

	//添加好友基础信息
	public static ushort P_MSG_FRIEND_BASE_ADD                  = 50010;

	//场景玩家旋转和位置信息
	public static ushort P_MSG_SCENE_ROT_POS                    = 50020;

	//场景玩家旋转和位置信息
	public static ushort P_MSG_SCENE_PLAYER                     = 50030;

	//场景Vector3信息
	public static ushort P_MSG_SCENE_VECTOR_3                   = 50040;

	//
	public static ushort P_MSG_TEST_X_X                         = 59990;

	//测试发送
	public static ushort P_REQ_TEST_SEND                        = 40010;

	//测试返回
	public static ushort P_ACK_TEST_SEND_OK                     = 40020;

	//测试信息块
	public static ushort P_MSG_TEST_SEND                        = 40030;

	//
	public static ushort P_REQ_TEST_X_X                         = 40040;

	//
	public static ushort P_ACK_TEST_X_X                         = 40050;

	//
	public static ushort P_REQ_TEST_PHP                         = 40060;

	//
	public static ushort P_ACK_TEST_PHP_OK                      = 40070;

	//
	public static ushort P_MSG_TEST_PHP                         = 40080;
}
