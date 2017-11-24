public class P2P
{
	public static System.Object PacketToProtocol(ushort packetId, Packet packet)
	{
		switch (packetId)
		{
			case 1520:
				AckChatSendOk ackChatSendOk = new AckChatSendOk(packet);
				return ackChatSendOk;
			case 1040:
				AckRoleRandNameOk ackRoleRandNameOk = new AckRoleRandNameOk(packet);
				return ackRoleRandNameOk;
			case 1050:
				AckRoleLoginOk ackRoleLoginOk = new AckRoleLoginOk(packet);
				return ackRoleLoginOk;
			case 1060:
				AckRoleLoginOkNoRole ackRoleLoginOkNoRole = new AckRoleLoginOkNoRole(packet);
				return ackRoleLoginOkNoRole;
			case 2040:
				AckSceneEnter ackSceneEnter = new AckSceneEnter(packet);
				return ackSceneEnter;
			case 2050:
				AckScenePlayers ackScenePlayers = new AckScenePlayers(packet);
				return ackScenePlayers;
			case 2060:
				AckSceneExit ackSceneExit = new AckSceneExit(packet);
				return ackSceneExit;
			case 2080:
				AckSceneMove ackSceneMove = new AckSceneMove(packet);
				return ackSceneMove;
			case 40020:
				AckTestSendOk ackTestSendOk = new AckTestSendOk(packet);
				return ackTestSendOk;
			case 40050:
				AckTestXX ackTestXX = new AckTestXX(packet);
				return ackTestXX;
			case 40070:
				AckTestPhpOk ackTestPhpOk = new AckTestPhpOk(packet);
				return ackTestPhpOk;
		}

		return null;
	}
}
