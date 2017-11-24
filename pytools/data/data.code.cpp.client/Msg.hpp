#ifndef _MSG_
#define _MSG_

#include <pb_type.hpp>


class Msg
{
public:
	// 发送聊天信息
	static const U16 P_REQ_CHAT_SEND                        = 1510;
	// 聊天信息返回
	static const U16 P_ACK_CHAT_SEND_OK                     = 1520;
	// GM命令
	static const U16 P_REQ_CHAT_GM                          = 1530;
	// 角色登录
	static const U16 P_REQ_ROLE_LOGIN                       = 1010;
	// 角色创建
	static const U16 P_REQ_ROLE_CREATE                      = 1020;
	// 请求随机名字
	static const U16 P_REQ_ROLE_RAND_NAME                   = 1030;
	// 随机名字返回
	static const U16 P_ACK_ROLE_RAND_NAME_OK                = 1040;
	// 登录成功
	static const U16 P_ACK_ROLE_LOGIN_OK                    = 1050;
	// 登录成功(无角色)
	static const U16 P_ACK_ROLE_LOGIN_OK_NO_ROLE            = 1060;
	// 请求进入场景(飞)
	static const U16 P_REQ_SCENE_ENTER_FLY                  = 2010;
	// 请求进入场景
	static const U16 P_REQ_SCENE_ENTER                      = 2020;
	// 行走数据
	static const U16 P_REQ_SCENE_MOVE                       = 2030;
	// 进入场景成功
	static const U16 P_ACK_SCENE_ENTER                      = 2040;
	// 场景玩家列表
	static const U16 P_ACK_SCENE_PLAYERS                    = 2050;
	// 退出场景成功
	static const U16 P_ACK_SCENE_EXIT                       = 2060;
	// 请求玩家列表
	static const U16 P_REQ_SCENE_REQ_PLAYERS                = 2070;
	// 行走数据
	static const U16 P_ACK_SCENE_MOVE                       = 2080;
	// 玩家基础信息
	static const U16 P_MSG_ROLE_BASE                        = 50000;
	// 添加好友基础信息
	static const U16 P_MSG_FRIEND_BASE_ADD                  = 50010;
	// 场景玩家旋转和位置信息
	static const U16 P_MSG_SCENE_ROT_POS                    = 50020;
	// 场景玩家旋转和位置信息
	static const U16 P_MSG_SCENE_PLAYER                     = 50030;
	// 场景Vector3信息
	static const U16 P_MSG_SCENE_VECTOR_3                   = 50040;
	// 
	static const U16 P_MSG_TEST_X_X                         = 59990;
	// 测试发送
	static const U16 P_REQ_TEST_SEND                        = 40010;
	// 测试返回
	static const U16 P_ACK_TEST_SEND_OK                     = 40020;
	// 测试信息块
	static const U16 P_MSG_TEST_SEND                        = 40030;
	// 
	static const U16 P_REQ_TEST_X_X                         = 40040;
	// 
	static const U16 P_ACK_TEST_X_X                         = 40050;
	// 
	static const U16 P_REQ_TEST_PHP                         = 40060;
	// 
	static const U16 P_ACK_TEST_PHP_OK                      = 40070;
	// 
	static const U16 P_MSG_TEST_PHP                         = 40080;
};

#endif
