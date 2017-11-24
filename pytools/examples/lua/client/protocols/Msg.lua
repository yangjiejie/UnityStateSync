module("Msg", package.seeall)


-- [1510]发送聊天信息
P_REQ_CHAT_SEND                     = 1510

-- [1520]聊天信息返回
P_ACK_CHAT_SEND_OK                  = 1520

-- [1530]GM命令
P_REQ_CHAT_GM                       = 1530

-- [1010]角色登录
P_REQ_ROLE_LOGIN                    = 1010

-- [1020]角色创建
P_REQ_ROLE_CREATE                   = 1020

-- [1030]请求随机名字
P_REQ_ROLE_RAND_NAME                = 1030

-- [1040]随机名字返回
P_ACK_ROLE_RAND_NAME_OK             = 1040

-- [1050]登录成功
P_ACK_ROLE_LOGIN_OK                 = 1050

-- [1060]登录成功(无角色)
P_ACK_ROLE_LOGIN_OK_NO_ROLE         = 1060

-- [2010]请求进入场景(飞)
P_REQ_SCENE_ENTER_FLY               = 2010

-- [2020]请求进入场景
P_REQ_SCENE_ENTER                   = 2020

-- [2030]行走数据
P_REQ_SCENE_MOVE                    = 2030

-- [2040]进入场景成功
P_ACK_SCENE_ENTER                   = 2040

-- [2050]场景玩家列表
P_ACK_SCENE_PLAYERS                 = 2050

-- [2060]退出场景成功
P_ACK_SCENE_EXIT                    = 2060

-- [2070]请求玩家列表
P_REQ_SCENE_REQ_PLAYERS             = 2070

-- [2080]行走数据
P_ACK_SCENE_MOVE                    = 2080

-- [50000]玩家基础信息
P_MSG_ROLE_BASE                     = 50000

-- [50010]添加好友基础信息
P_MSG_FRIEND_BASE_ADD               = 50010

-- [50020]场景玩家旋转和位置信息
P_MSG_SCENE_ROT_POS                 = 50020

-- [50030]场景玩家旋转和位置信息
P_MSG_SCENE_PLAYER                  = 50030

-- [50040]场景Vector3信息
P_MSG_SCENE_VECTOR_3                = 50040

-- [59990]
P_MSG_TEST_X_X                      = 59990

-- [40010]测试发送
P_REQ_TEST_SEND                     = 40010

-- [40020]测试返回
P_ACK_TEST_SEND_OK                  = 40020

-- [40030]测试信息块
P_MSG_TEST_SEND                     = 40030

-- [40040]
P_REQ_TEST_X_X                      = 40040

-- [40050]
P_ACK_TEST_X_X                      = 40050

-- [40060]
P_REQ_TEST_PHP                      = 40060

-- [40070]
P_ACK_TEST_PHP_OK                   = 40070

-- [40080]
P_MSG_TEST_PHP                      = 40080
