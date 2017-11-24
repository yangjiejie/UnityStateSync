#include <iostream>
#include <cstring>
#include <cstdlib>

#include <pb_type.hpp>


class PacketUtil
{
public:
	static U8 GetU8(BYTE* buff)
	{
		U8 data;

		data = (U8)(buff[0]);

		return data;
	}

	static I8 GetI8(BYTE* buff)
	{
		I8 data;

		data = (I8)(buff[0]);

		return data;
	}

	static U16 GetU16(BYTE* buff)
	{
		U16 data;

		data = (U16)(buff[0] << 8);
		data |= (U16)(buff[1]);

		return data;
	}

	static I16 GetI16(BYTE* buff)
	{
		I16 data;

		data = (I16)(buff[0] << 8);
		data |= (I16)(buff[1]);

		return data;
	}

	static U32 GetU32(BYTE* buff)
	{
		U32 data;

		data = (U32)(buff[0] << 24);
		data |= (U32)(buff[1] << 16);
		data |= (U32)(buff[2] << 8);
		data |= (U32)(buff[3]);

		return data;
	}

	static I32 GetI32(BYTE* buff)
	{
		I32 data;

		data = (I32)(buff[0] << 24);
		data |= (I32)(buff[1] << 16);
		data |= (I32)(buff[2] << 8);
		data |= (I32)(buff[3]);

		return data;
	}

	static U64 GetU64(BYTE* buff)
	{
		U64 data = *(U64*)buff;

		return data;
	}

	static I64 GetI64(BYTE* buff)
	{
		I64 data = *(I64*)buff;

		return data;
	}

	
	static BYTE* GetBytes(U8 val)
	{
		BYTE* bytes = new BYTE[1];

		bytes[0] = (BYTE)val;

		return bytes;
	}

	static BYTE* GetBytes(I8 val)
	{
		BYTE* bytes = new BYTE[1];

		bytes[0] = (BYTE)val;

		return bytes;
	}

	static BYTE* GetBytes(U16 val)
	{
		BYTE* bytes = new BYTE[2];

		bytes[0] = (BYTE)(val >> 8);
		bytes[1] = (BYTE)(val);

		return bytes;
	}

	static BYTE* GetBytes(I16 val)
	{
		BYTE* bytes = new BYTE[2];

		bytes[0] = (BYTE)(val >> 8);
		bytes[1] = (BYTE)(val);

		return bytes;
	}

	static BYTE* GetBytes(U32 val)
	{
		BYTE* bytes = new BYTE[4];

		bytes[0] = (BYTE)(val >> 24);
		bytes[1] = (BYTE)(val >> 16);
		bytes[2] = (BYTE)(val >> 8);
		bytes[3] = (BYTE)(val);

		return bytes;
	}

	static BYTE* GetBytes(I32 val)
	{
		BYTE* bytes = new BYTE[4];

		bytes[0] = (BYTE)(val >> 24);
		bytes[1] = (BYTE)(val >> 16);
		bytes[2] = (BYTE)(val >> 8);
		bytes[3] = (BYTE)(val);

		return bytes;
	}

	static BYTE* GetBytes(U64 val)
	{
		BYTE* bytes = new BYTE[8];

		bytes[0] = (BYTE)(val >> 56);
		bytes[1] = (BYTE)(val >> 48);
		bytes[2] = (BYTE)(val >> 40);
		bytes[3] = (BYTE)(val >> 32);
		bytes[4] = (BYTE)(val >> 24);
		bytes[5] = (BYTE)(val >> 16);
		bytes[6] = (BYTE)(val >> 8);
		bytes[7] = (BYTE)(val);

		return bytes;
	}

	static BYTE* GetBytes(I64 val)
	{
		BYTE* bytes = new BYTE[8];

		bytes[0] = (BYTE)(val >> 56);
		bytes[1] = (BYTE)(val >> 48);
		bytes[2] = (BYTE)(val >> 40);
		bytes[3] = (BYTE)(val >> 32);
		bytes[4] = (BYTE)(val >> 24);
		bytes[5] = (BYTE)(val >> 16);
		bytes[6] = (BYTE)(val >> 8);
		bytes[7] = (BYTE)(val);

		return bytes;
	}
	
};
