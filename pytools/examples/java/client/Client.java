import network.TcpClient;


public class Client
{
	public static void main(String[] args)
	{
		TcpClient tcpClient = new TcpClient("127.0.0.1", 8888);
		tcpClient.start();
	}

}
