#include <iostream>
#include <cstring>
#include <cstdlib>
#include <cstdio>

#include <Packet.hpp>
#include <PacketUtil.hpp>


Packet::Packet()
{
	m_nCursor	= 0;

	m_len 		= 0;
	m_cap		= SLICE_SIZE;

	m_body 		= new BYTE[m_cap];
}

Packet::Packet(BYTE* buff)
{
	m_body = buff;
	m_nCursor = 0;
	m_len = 0;
}

Packet::~Packet()
{
	delete(m_body);
}


void Packet::ReAllocate(U32 size)
{
	U32 new_size = m_len + size;
	if (new_size <= m_cap) { return; }

	m_cap	= ((new_size / SLICE_SIZE) + 1) * SLICE_SIZE;

	BYTE* new_buff = new BYTE[m_cap];
	memcpy(new_buff, m_body, m_len);

	delete(m_body);

	m_body	= new_buff;
}



void Packet::Encode(U16 packetId)
{
	U32 len 		= 0;
	U32 bodyLen 	= 0;

	BYTE* body_buff = ReadBytes(&bodyLen);

	U32 packetLen 	= bodyLen + 2;
	len = packetLen + 2;

	BYTE* len_buff = PacketUtil::GetBytes((U16)packetLen);
	BYTE* packet_id_buff = PacketUtil::GetBytes((U16)packetId);

	BYTE* all_buff = new BYTE[len];

	memcpy(all_buff, len_buff, 2);
	memcpy(all_buff + 2, packet_id_buff, 2);
	memcpy(all_buff + 4, body_buff, bodyLen);

	delete(m_body);

	m_body 		= all_buff;
	m_nCursor	= len;
	m_len		= len;
	m_cap		= len;

	delete(len_buff);
	delete(packet_id_buff);
	delete(body_buff);
}


void Packet::Echo()
{
	printf("Packet body: [");
	U32 last_idx = m_len - 1;
	U8 data = 0;
	for (int i = 0; i < m_len; i++)
	{
		memcpy((void*)(&data), m_body + i, 1);
		if (i == last_idx)
		{
			printf("%d", data);
		}
		else
		{
			printf("%d,", data);
		}
	}
	printf("]\n");
}


void Packet::WriteU8(U8 data)
{  
	ReAllocate(1);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 1);
	delete(bytes);

	m_nCursor 	+= 1;
	m_len		+= 1;
}

void Packet::WriteI8(I8 data)
{
	ReAllocate(1);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 1);
	delete(bytes);

	m_nCursor 	+= 1;
	m_len 		+= 1;
}

void Packet::WriteU16(U16 data)
{
	ReAllocate(2);

	BYTE* bytes 		= PacketUtil::GetBytes((U16)data);
	memcpy(m_body + m_nCursor, bytes, 2);
	delete(bytes);
	
	m_nCursor	+= 2;
	m_len 		+= 2;
}

void Packet::WriteI16(I16 data)
{
	ReAllocate(2);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 2);
	delete(bytes);
	
	m_nCursor	+= 2;
	m_len 		+= 2;
}

void Packet::WriteU32(U32 data)
{
	ReAllocate(4);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 4);
	delete(bytes);
	
	m_nCursor	+= 4;
	m_len 		+= 4;
}

void Packet::WriteI32(I32 data)
{
	ReAllocate(4);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 4);
	delete(bytes);
	
	m_nCursor	+= 4;
	m_len 		+= 4;
}

void Packet::WriteU64(U64 data)
{
	ReAllocate(8);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 8);
	delete(bytes);
	
	m_nCursor	+= 8;
	m_len 		+= 8;
}

void Packet::WriteI64(I64 data)
{
	ReAllocate(8);

	BYTE* bytes 		= PacketUtil::GetBytes(data);
	memcpy(m_body + m_nCursor, bytes, 8);
	delete(bytes);
	
	m_nCursor	+= 8;
	m_len 		+= 8;
}

void Packet::WriteF32(F32 data)
{
	I32 val = *(I32*)(&data);
	WriteI32(val);
}

void Packet::WriteF64(F64 data)
{
	I64 val = *(I64*)(&data);
	WriteI64(val);
}

void Packet::WriteString(String data)
{
	U16 len 	= data.size();

	ReAllocate(len + 2);

	WriteU16(len);

	memcpy(m_body + m_nCursor, data.c_str(), len);
	m_nCursor	+= len;
	m_len 		+= len;
}

void Packet::WriteBytes(BYTE* bytes, U32 len)
{
	ReAllocate(len);

	memcpy(m_body + m_nCursor, bytes, len);

	delete(bytes);

	m_nCursor	+= len;
	m_len 		+= len;
}


U8 Packet::ReadU8()
{
	U8 data = PacketUtil::GetU8(m_body + m_nCursor);
	m_nCursor	+= 1;
	return data;
}

I8 Packet::ReadI8()
{
	I8 data = PacketUtil::GetI8(m_body + m_nCursor);
	m_nCursor	+= 1;

	return data;
}

U16 Packet::ReadU16()
{
	U16 data = PacketUtil::GetU16(m_body + m_nCursor);
	m_nCursor	+= 2;
	return data;
}

I16 Packet::ReadI16()
{
	I16 data = PacketUtil::GetI16(m_body + m_nCursor);
	m_nCursor	+= 2;

	return data;
}

U32 Packet::ReadU32()
{
	U32 data = PacketUtil::GetU32(m_body + m_nCursor);
	m_nCursor	+= 4;
	return data;
}

I32 Packet::ReadI32()
{
	I32 data = PacketUtil::GetI32(m_body + m_nCursor);
	m_nCursor	+= 4;

	return data;
}

U64 Packet::ReadU64()
{
	U64 data = PacketUtil::GetU64(m_body + m_nCursor);
	m_nCursor	+= 8;
	return data;
}

I64 Packet::ReadI64()
{
	I64 data = PacketUtil::GetI64(m_body + m_nCursor);
	m_nCursor	+= 8;

	return data;
}

F32 Packet::ReadF32()
{
	I32 val = ReadI32();
	F32 data = *(F32*)(&val);

	return data;
}

F64 Packet::ReadF64()
{
	I64 val = ReadI64();
	F64 data = *(F64*)(&val);

	return data;
}

String Packet::ReadString()
{
	U16 len = ReadU16();

	I8* data = new I8[len + 1];
	memset(data, '\0', len + 1);
	memcpy(data, m_body + m_nCursor, len);

	m_nCursor	+= len;

	String str(data);
	free(data);

	return str;
}

BYTE* Packet::ReadBytes(U32* len)
{
	*len = GetPacketLen();

	BYTE* buf = new BYTE[*len];
	memcpy(buf, m_body, *len);

	return buf;
}
