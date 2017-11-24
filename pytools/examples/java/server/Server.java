import network.TcpServer;


public class Server
{
	public static void main(String[] args)
	{
		TcpServer tcpServer = new TcpServer(8888);
		tcpServer.start();
	}
	
}
