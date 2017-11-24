package protocol;


public class Msg
{
	public static final int P_REQ_CHAT_SEND                 = 1510;

	public static final int P_ACK_CHAT_SEND_OK              = 1520;

	public static final int P_REQ_CHAT_GM                   = 1530;

	public static final int P_REQ_ROLE_LOGIN                = 1010;

	public static final int P_REQ_ROLE_CREATE               = 1020;

	public static final int P_REQ_ROLE_RAND_NAME            = 1030;

	public static final int P_ACK_ROLE_RAND_NAME_OK         = 1040;

	public static final int P_ACK_ROLE_LOGIN_OK             = 1050;

	public static final int P_ACK_ROLE_LOGIN_OK_NO_ROLE     = 1060;

	public static final int P_REQ_SCENE_ENTER_FLY           = 2010;

	public static final int P_REQ_SCENE_ENTER               = 2020;

	public static final int P_REQ_SCENE_MOVE                = 2030;

	public static final int P_ACK_SCENE_ENTER               = 2040;

	public static final int P_ACK_SCENE_PLAYERS             = 2050;

	public static final int P_ACK_SCENE_EXIT                = 2060;

	public static final int P_REQ_SCENE_REQ_PLAYERS         = 2070;

	public static final int P_ACK_SCENE_MOVE                = 2080;

	public static final int P_MSG_ROLE_BASE                 = 50000;

	public static final int P_MSG_FRIEND_BASE_ADD           = 50010;

	public static final int P_MSG_SCENE_ROT_POS             = 50020;

	public static final int P_MSG_SCENE_PLAYER              = 50030;

	public static final int P_MSG_SCENE_VECTOR_3            = 50040;

	public static final int P_MSG_TEST_X_X                  = 59990;

	public static final int P_REQ_TEST_SEND                 = 40010;

	public static final int P_ACK_TEST_SEND_OK              = 40020;

	public static final int P_MSG_TEST_SEND                 = 40030;

	public static final int P_REQ_TEST_X_X                  = 40040;

	public static final int P_ACK_TEST_X_X                  = 40050;

	public static final int P_REQ_TEST_PHP                  = 40060;

	public static final int P_ACK_TEST_PHP_OK               = 40070;

	public static final int P_MSG_TEST_PHP                  = 40080;
}
