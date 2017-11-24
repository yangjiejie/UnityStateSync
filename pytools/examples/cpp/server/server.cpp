#include <iostream>
#include <string>
#include <cstring>
#include <list>

using namespace std;

#include <Socket.hpp>

#include <pb.hpp>
#include <PacketUtil.hpp>


#define PORT	8888


void send(Socket::TCP socket, Packet packet)
{
	U32 len = 0;
	BYTE* buff = packet.ReadBytes(&len);

	socket.send(buff, len);

	delete(buff);
}


void dispatch(Socket::TCP client, U16 packetId, Packet* packet)
{
	cout << "packetId: " << packetId << endl;
	
	switch (packetId)
	{
		case Msg::P_REQ_TEST_X_X:
		{
			ReqTestXX reqTestXX(packet);

			printf("reqTestXX.GetIdU8(): %d\n", reqTestXX.GetIdU8());
			printf("reqTestXX.GetIdU16(): %d\n", reqTestXX.GetIdU16());
			printf("reqTestXX.GetIdU32(): %d\n", reqTestXX.GetIdU32());
			printf("reqTestXX.GetOptionalIdU8(): %d\n", reqTestXX.GetOptionalIdU8());


			AckTestXX ackTestXX;
			ackTestXX.SetIdU8(255);
			ackTestXX.SetIdU16(65535);
			ackTestXX.SetIdU32(65535666);
			list<U8> ridu8;
			ridu8.push_back(253);
			ridu8.push_back(254);
			ackTestXX.SetRepeatIdU8(ridu8);
			ackTestXX.SetOptionalIdU8(255);
			send(client, ackTestXX.Encode());

			break;
		}
		case Msg::P_REQ_TEST_SEND:
		{
			ReqTestSend reqTestSend(packet);

			printf("reqTestSend.GetIdU8(): %d\n", reqTestSend.GetIdU8());
			printf("reqTestSend.GetRoleBase()->GetUid(): %d\n", reqTestSend.GetRoleBase()->GetUid());
			printf("reqTestSend.GetRoleBase()->GetUname(): %s\n", reqTestSend.GetRoleBase()->GetUname().c_str());
			printf("reqTestSend.GetIdOpU8(): %d\n", reqTestSend.GetIdOpU8());
			printf("reqTestSend.GetOpRoleBase()->GetUid(): %d\n", reqTestSend.GetOpRoleBase()->GetUid());
			printf("reqTestSend.GetOpRoleBase()->GetUname(): %s\n", reqTestSend.GetOpRoleBase()->GetUname().c_str());
			list<F32> id_f32 = reqTestSend.GetIdF32();
			U16 id_f32_count = (U16)id_f32.size();
			for (list<F32>::iterator i = id_f32.begin(); i != id_f32.end(); i++)
			{
				printf("reqTestSend.id_f32: %.2f\n", (F32)*i);
			}


			AckTestSendOk ackTestSendOk;
			ackTestSendOk.SetIdU8(255);
			MsgRoleBase* msgRoleBase = new MsgRoleBase();
			msgRoleBase->SetUid(100);
			msgRoleBase->SetUname("mirahs");
			ackTestSendOk.SetRoleBase(msgRoleBase);
			list<F32> ridu8;
			ridu8.push_back(12.3);
			ridu8.push_back(12.4);
			ackTestSendOk.SetIdF32(ridu8);
			ackTestSendOk.SetIdOpU8(255);
			ackTestSendOk.SetOpRoleBase(msgRoleBase);
			send(client, ackTestSendOk.Encode());

			break;
		}
	}
}


int main(void)
{
	try
	{
		Socket::TCP server;

		server.listen_on_port(PORT);

		while (true)
		{
			Socket::TCP client = server.accept_client();

			U16	header_len 		= 2;
			U16	max_buffer_len 	= 51200;
			U16	tmp_buffer_len 	= 512;
			U16	buffer_len		= 0;	

			BYTE* buffer	= new BYTE[max_buffer_len];
			BYTE* tmp_buffer= new BYTE[tmp_buffer_len];

			while (true)
			{
				int n = client.receive(tmp_buffer, tmp_buffer_len);
				if (n <= 0) { cout << "client.receive error" << endl; break; }
				memcpy(buffer + buffer_len, tmp_buffer, n);
				buffer_len += n;
				if (buffer_len <= header_len) { continue; }
				while (true)
				{
					U16 package_len = PacketUtil::GetU16(buffer);
					if (buffer_len < package_len + header_len) { break; }
					buffer_len -= (package_len + header_len);

					BYTE* packet_id_buff= new BYTE[2];
					BYTE* packet_buff 	= new BYTE[package_len - 2];
					memcpy(packet_id_buff, buffer + 2, 2);
					memcpy(packet_buff, buffer + 2 + 2, package_len - 2);
					memcpy(buffer, buffer + 2 + package_len, buffer_len);

					U16 packet_id = PacketUtil::GetU16(packet_id_buff);
					Packet* packet = new Packet(packet_buff);
					dispatch(client, packet_id, packet);
				}
			}
		}
	}
	catch (Socket::SocketException& e)
	{
		cout << "SocketException: " << e << endl;
	}


	return 0;
}
