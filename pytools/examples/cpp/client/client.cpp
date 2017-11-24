#include <iostream>
#include <string>
#include <cstring>
#include <list>

using namespace std;

#include <Socket.hpp>

#include <pb.hpp>
#include <PacketUtil.hpp>


#define IP 		"127.0.0.1"
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
		case Msg::P_ACK_TEST_X_X:
		{
			AckTestXX ackTestXX(packet);

			printf("ackTestXX.GetIdU8(): %d\n", ackTestXX.GetIdU8());
			printf("ackTestXX.GetIdU16(): %d\n", ackTestXX.GetIdU16());
			printf("ackTestXX.GetIdU32(): %d\n", ackTestXX.GetIdU32());
			printf("ackTestXX.GetOptionalIdU8(): %d\n", ackTestXX.GetOptionalIdU8());


			ReqTestSend reqTestSend;
			reqTestSend.SetIdU8(255);
			MsgRoleBase* msgRoleBase = new MsgRoleBase();
			msgRoleBase->SetUid(100);
			msgRoleBase->SetUname("mirahs");
			reqTestSend.SetRoleBase(msgRoleBase);
			list<F32> ridu8;
			ridu8.push_back(12.3);
			ridu8.push_back(12.4);
			reqTestSend.SetIdF32(ridu8);
			reqTestSend.SetIdOpU8(255);
			reqTestSend.SetOpRoleBase(msgRoleBase);
			send(client, reqTestSend.Encode());

			break;
		}
		case Msg::P_ACK_TEST_SEND_OK:
		{
			AckTestSendOk ackTestSendOk(packet);

			printf("ackTestSendOk.GetIdU8(): %d\n", ackTestSendOk.GetIdU8());
			printf("ackTestSendOk.GetRoleBase()->GetUid(): %d\n", ackTestSendOk.GetRoleBase()->GetUid());
			printf("ackTestSendOk.GetRoleBase()->GetUname(): %s\n", ackTestSendOk.GetRoleBase()->GetUname().c_str());
			printf("ackTestSendOk.GetIdOpU8(): %d\n", ackTestSendOk.GetIdOpU8());
			printf("ackTestSendOk.GetOpRoleBase()->GetUid(): %d\n", ackTestSendOk.GetOpRoleBase()->GetUid());
			printf("ackTestSendOk.GetOpRoleBase()->GetUname(): %s\n", ackTestSendOk.GetOpRoleBase()->GetUname().c_str());
			list<F32> id_f32 = ackTestSendOk.GetIdF32();
			U16 id_f32_count = (U16)id_f32.size();
			for (list<F32>::iterator i = id_f32.begin(); i != id_f32.end(); i++)
			{
				printf("ackTestSendOk.id_f32: %.2f\n", (F32)*i);
			}

			break;
		}
	}
}


int main(void)
{
	try
	{
		Socket::TCP client;

		client.connect_to(Socket::Address(IP, PORT));


		ReqTestXX reqTestXX;
		reqTestXX.SetIdU8(255);
		reqTestXX.SetIdU16(65535);
		reqTestXX.SetIdU32(65535666);
		list<U8> ridu8;
		ridu8.push_back(253);
		ridu8.push_back(254);
		reqTestXX.SetRepeatIdU8(ridu8);
		reqTestXX.SetOptionalIdU8(255);
		send(client, reqTestXX.Encode());


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
	catch (Socket::SocketException& e)
	{
		cout << "SocketException: " << e << endl;
	}


	return 0;
}
