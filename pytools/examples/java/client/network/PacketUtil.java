package network;


public class PacketUtil
{
	public static int readUByte(byte[] buffer)
	{
		Packet packet = new Packet(buffer);
		byte len = packet.readByte();
		return len & 0xff;
	}

	public static int readUByte(byte value)
	{
		return value & 0xff;
	}

	public static int readUShort(byte[] buffer)
	{
		Packet packet = new Packet(buffer);
		short len = packet.readShort();
		return len & 0xffff;
	}

	public static int readUShort(short value)
	{
		return value & 0xffff;
	}

	public static long readUInt(byte[] buffer)
	{
		Packet packet = new Packet(buffer);
		int len = packet.readInt();
		return len & 0xffffffff;
	}

	public static long readUInt(int value)
	{
		return value & 0xffffffff;
	}
}
