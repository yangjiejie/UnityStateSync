public class P2P
{
	public static System.Object PacketToProtocol(ushort packetId, Packet packet)
	{
		switch (packetId)
		{
			case 1510:
				ReqChatSend reqChatSend = new ReqChatSend(packet);
				return reqChatSend;
			case 1530:
				ReqChatGm reqChatGm = new ReqChatGm(packet);
				return reqChatGm;
			case 1010:
				ReqRoleLogin reqRoleLogin = new ReqRoleLogin(packet);
				return reqRoleLogin;
			case 1020:
				ReqRoleCreate reqRoleCreate = new ReqRoleCreate(packet);
				return reqRoleCreate;
			case 1030:
				ReqRoleRandName reqRoleRandName = new ReqRoleRandName(packet);
				return reqRoleRandName;
			case 2010:
				ReqSceneEnterFly reqSceneEnterFly = new ReqSceneEnterFly(packet);
				return reqSceneEnterFly;
			case 2020:
				ReqSceneEnter reqSceneEnter = new ReqSceneEnter(packet);
				return reqSceneEnter;
			case 2030:
				ReqSceneMove reqSceneMove = new ReqSceneMove(packet);
				return reqSceneMove;
			case 2070:
				ReqSceneReqPlayers reqSceneReqPlayers = new ReqSceneReqPlayers(packet);
				return reqSceneReqPlayers;
			case 40010:
				ReqTestSend reqTestSend = new ReqTestSend(packet);
				return reqTestSend;
			case 40040:
				ReqTestXX reqTestXX = new ReqTestXX(packet);
				return reqTestXX;
			case 40060:
				ReqTestPhp reqTestPhp = new ReqTestPhp(packet);
				return reqTestPhp;
		}

		return null;
	}
}
