package network;


import java.io.InputStream;
import java.io.OutputStream;


import java.net.ServerSocket;
import java.net.Socket;


public class TcpServer extends Thread
{
	private int port;


	public TcpServer(int port)
	{
		this.port = port;
	}


	public void run()
	{
		ServerSocket serverSocket = null;
		Socket 		 clientSocket = null;

		try
		{
			serverSocket = new ServerSocket(this.port);
			System.out.println("Listen to port: " + this.port);

			while (true)
			{
				clientSocket = serverSocket.accept();
				TcpClient tcpClient = new TcpClient(clientSocket);
				tcpClient.start();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
