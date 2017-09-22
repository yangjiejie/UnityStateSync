public class P2P
{
	public static System.Object PacketToProtocol(ushort packetId, Packet packet)
	{
		switch (packetId)
		{
			case 1020:
				AckRoleLoginOk ackRoleLoginOk = new AckRoleLoginOk(packet);
				return ackRoleLoginOk;
			case 2020:
				AckScenePlayers ackScenePlayers = new AckScenePlayers(packet);
				return ackScenePlayers;
			case 2030:
				AckSceneEnter ackSceneEnter = new AckSceneEnter(packet);
				return ackSceneEnter;
			case 2040:
				AckSceneExit ackSceneExit = new AckSceneExit(packet);
				return ackSceneExit;
			case 2060:
				AckScenePosRotOk ackScenePosRotOk = new AckScenePosRotOk(packet);
				return ackScenePosRotOk;
			case 2080:
				AckSceneAnimMoveOk ackSceneAnimMoveOk = new AckSceneAnimMoveOk(packet);
				return ackSceneAnimMoveOk;
		}

		return null;
	}
}
