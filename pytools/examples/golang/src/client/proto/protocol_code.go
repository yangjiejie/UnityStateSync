package proto

const (
	// 发送聊天信息
	P_REQ_CHAT_SEND                uint16 = 1510

	// 聊天信息返回
	P_ACK_CHAT_SEND_OK             uint16 = 1520

	// GM命令
	P_REQ_CHAT_GM                  uint16 = 1530

	// 角色登录
	P_REQ_ROLE_LOGIN               uint16 = 1010

	// 角色创建
	P_REQ_ROLE_CREATE              uint16 = 1020

	// 请求随机名字
	P_REQ_ROLE_RAND_NAME           uint16 = 1030

	// 随机名字返回
	P_ACK_ROLE_RAND_NAME_OK        uint16 = 1040

	// 登录成功
	P_ACK_ROLE_LOGIN_OK            uint16 = 1050

	// 登录成功(无角色)
	P_ACK_ROLE_LOGIN_OK_NO_ROLE    uint16 = 1060

	// 请求进入场景(飞)
	P_REQ_SCENE_ENTER_FLY          uint16 = 2010

	// 请求进入场景
	P_REQ_SCENE_ENTER              uint16 = 2020

	// 行走数据
	P_REQ_SCENE_MOVE               uint16 = 2030

	// 进入场景成功
	P_ACK_SCENE_ENTER              uint16 = 2040

	// 场景玩家列表
	P_ACK_SCENE_PLAYERS            uint16 = 2050

	// 退出场景成功
	P_ACK_SCENE_EXIT               uint16 = 2060

	// 请求玩家列表
	P_REQ_SCENE_REQ_PLAYERS        uint16 = 2070

	// 行走数据
	P_ACK_SCENE_MOVE               uint16 = 2080

	// 测试发送
	P_REQ_TEST_SEND                uint16 = 40010

	// 测试返回
	P_ACK_TEST_SEND_OK             uint16 = 40020

	// 
	P_REQ_TEST_X_X                 uint16 = 40040

	// 
	P_ACK_TEST_X_X                 uint16 = 40050

	// 
	P_REQ_TEST_PHP                 uint16 = 40060

	// 
	P_ACK_TEST_PHP_OK              uint16 = 40070
)
