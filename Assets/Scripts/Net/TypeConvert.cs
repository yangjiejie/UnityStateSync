using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


public class TypeConvert
{
    public static byte[] GetBytes(byte s)
	{
		byte[] buf = new byte[1];

        buf[0] = (byte)(s);

		return buf;
	}

    public static byte[] GetBytes(sbyte s)
    {
        byte[] buf = new byte[1];

        buf[0] = (byte)(s);

        return buf;
    }

	public static byte[] GetBytes(ushort s)
	{
		byte[] buf = new byte[2];

        buf[0] = (byte)(s >> 8);
        buf[1] = (byte)(s);

        return buf;
	}

    public static byte[] GetBytes(short s)
    {
        byte[] buf = new byte[2];

        buf[0] = (byte)(s >> 8);
        buf[1] = (byte)(s);

        return buf;
    }

	public static byte[] GetBytes(uint s)
	{
		byte[] buf = new byte[4];

        buf[0] = (byte)(s >> 24);
        buf[1] = (byte)(s >> 16);
        buf[2] = (byte)(s >> 8);
        buf[3] = (byte)(s);

		return buf;
	}

    public static byte[] GetBytes(int s)
    {
        byte[] buf = new byte[4];

        buf[0] = (byte)(s >> 24);
        buf[1] = (byte)(s >> 16);
        buf[2] = (byte)(s >> 8);
        buf[3] = (byte)(s);

        return buf;
    }

    public static byte[] GetBytes(ulong s)
    {
        byte[] buf = new byte[8];

        buf[0] = (byte)(s >> 56);
        buf[1] = (byte)(s >> 48);
        buf[2] = (byte)(s >> 40);
        buf[3] = (byte)(s >> 32);
        buf[4] = (byte)(s >> 24);
        buf[5] = (byte)(s >> 16);
        buf[6] = (byte)(s >> 8);
        buf[7] = (byte)(s);

        return buf;
    }

    public static byte[] GetBytes(long s)
    {
        byte[] buf = new byte[8];

        buf[0] = (byte)(s >> 56);
        buf[1] = (byte)(s >> 48);
        buf[2] = (byte)(s >> 40);
        buf[3] = (byte)(s >> 32);
        buf[4] = (byte)(s >> 24);
        buf[5] = (byte)(s >> 16);
        buf[6] = (byte)(s >> 8);
        buf[7] = (byte)(s);

        return buf;
    }

    public static byte[] GetBytes(float s)
    {
        // 本地字节数组是小端(要转大端)
        byte[] bytes =  BitConverter.GetBytes(s);

        Array.Reverse(bytes);

        return bytes;
    }

    public static byte[] GetBytes(double s)
    {
        // 本地字节数组是小端(要转大端)
        byte[] bytes = BitConverter.GetBytes(s);

        Array.Reverse(bytes);

        return bytes;
    }


	public static byte GetByte(byte[] buf)
	{
        byte r = (byte)(buf[0]);
		return r;
	}

    public static sbyte GetSbyte(byte[] buf)
    {
        sbyte r = (sbyte)(buf[0]);

        return r;
    }

	public static ushort GetUshort(byte[] buf)
	{
        ushort r = (ushort)(buf[0] << 8);
        r |= (ushort)(buf[1]);
        return r;
	}

    public static short GetShort(byte[] buf)
    {
        short r = (short)(buf[0] << 8);
        r |= (short)(buf[1]);
        return r;
    }

    public static uint GetUint(byte[] buf)
    {
        uint r = (uint)(buf[0] << 24);
        r |= (uint)(buf[1] << 16);
        r |= (uint)(buf[2] << 8);
        r |= (uint)(buf[3]);
        return r;
    }

    public static int GetInt(byte[] buf)
    {
        int r = (int)(buf[0] << 24);
        r |= (int)(buf[1] << 16);
        r |= (int)(buf[2] << 8);
        r |= (int)(buf[3]);
        return r;
    }

    public static ulong GetUlong(byte[] buf)
    {
        Array.Reverse(buf);

        ulong val = BitConverter.ToUInt64(buf, 0);

        return val;
    }

    public static long GetLong(byte[] buf)
    {
        Array.Reverse(buf);

        long val = BitConverter.ToInt64(buf, 0);

        return val;
    }

    public static float GetFloat(byte[] buf)
    {
        // 网络字节数组是大端(要转小端)
        Array.Reverse(buf);

        return BitConverter.ToSingle(buf, 0);
    }

    public static double GetDouble(byte[] buf)
    {
        // 网络字节数组是大端(要转小端)
        Array.Reverse(buf);
        
        return BitConverter.ToDouble(buf, 0);
    }

}
