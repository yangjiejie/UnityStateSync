#ifndef _PACKET_
#define _PACKET_

#include <pb_type.hpp>


#define  SLICE_SIZE	64
#define  HEAD_LEN	2


class Packet
{
private:
	U32 m_nCursor;
	U32 m_len;
	U32 m_cap;
	BYTE* m_body;

	void ReAllocate(U32 size);


public:
	Packet();
	Packet(BYTE* buff);
    ~Packet();


    void Encode(U16 packetId);
	void CursorReset() { m_nCursor = 0; }
	U32 GetPacketLen() { return m_len; }
	void Echo();

	
	void WriteU8(U8 data);
	void WriteI8(I8 data);
	void WriteU16(U16 data);
	void WriteI16(I16 data);
	void WriteU32(U32 data);
	void WriteI32(I32 data);
	void WriteU64(U64 data);
	void WriteI64(I64 data);
	void WriteF32(F32 data);
	void WriteF64(F64 data);
	void WriteString(String data);
	void WriteBytes(BYTE* bytes, U32 len);


	U8 ReadU8();
	I8 ReadI8();
	U16 ReadU16();
	I16 ReadI16();
	U32 ReadU32();
	I32 ReadI32();
	U64 ReadU64();
	I64 ReadI64();
	F32 ReadF32();
	F64 ReadF64();
	String ReadString();
	BYTE* ReadBytes(U32* len);
};

#endif
