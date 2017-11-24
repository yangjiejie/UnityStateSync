using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Collections;


public class PacketUtil
{
    public static void WriteByte(List<byte> buffer, byte v)
    {
       	byte[] bytes = TypeConvert.GetBytes(v);
       	buffer.AddRange(bytes);
    }

    public static void WriteSbyte(List<byte> buffer, sbyte v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }
	
	public static void WriteUshort(List<byte> buffer, ushort v)
	{
		byte[] bytes = TypeConvert.GetBytes(v);
		buffer.AddRange(bytes);
	}

    public static void WriteShort(List<byte> buffer, short v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }
		
	public static void WriteUint(List<byte> buffer, uint v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }

    public static void WriteInt(List<byte> buffer, int v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }

    public static void WriteUlong(List<byte> buffer, ulong v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }

    public static void WriteLong(List<byte> buffer, long v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }

    public static void WriteFloat(List<byte> buffer, float v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }

    public static void WriteDouble(List<byte> buffer, double v)
    {
        byte[] bytes = TypeConvert.GetBytes(v);
        buffer.AddRange(bytes);
    }
		
    public static void WriteString(List<byte> buffer, string val)
    {
		if (string.IsNullOrEmpty(val))
		{
            ushort length = 0;
			buffer.AddRange(TypeConvert.GetBytes(length));
		}
		else
		{
        	byte[] bytes  = Encoding.UTF8.GetBytes(val);
            ushort length = (ushort)bytes.GetLength(0);

        	buffer.AddRange(TypeConvert.GetBytes(length));
        	buffer.AddRange(bytes);
		}
    }
	

    public static byte ReadByte(byte[] bytes)
    {
        return (byte)TypeConvert.GetByte(bytes);
    }

    public static sbyte ReadSbyte(byte[] bytes)
    {
        return (sbyte)TypeConvert.GetSbyte(bytes);
    }
	
	public static ushort ReadUshort(byte[] bytes)
    {
        return (ushort)TypeConvert.GetUshort(bytes);
    }

    public static short ReadShort(byte[] bytes)
    {
        return (short)TypeConvert.GetShort(bytes);
    }
	
	public static uint ReadUint(byte[] bytes)
    {
        return (uint)TypeConvert.GetUint(bytes);
    }

    public static int ReadInt(byte[] bytes)
    {
        return (int)TypeConvert.GetInt(bytes);
    }

    public static ulong ReadUlong(byte[] bytes)
    {
        return (ulong)TypeConvert.GetUlong(bytes);
    }

    public static long ReadLong(byte[] bytes)
    {
        return (long)TypeConvert.GetLong(bytes);
    }

    public static float ReadFloat(byte[] bytes)
    {
        return (float)TypeConvert.GetFloat(bytes);
    }

    public static double ReadDouble(byte[] bytes)
    {
        return (double)TypeConvert.GetDouble(bytes);
    }
    
    public static string ReadString(byte[] bytes)
    {
		return Encoding.UTF8.GetString(bytes);
    } 

}
