package network;


import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;


public class Packet
{
	private int SLICE_SIZE = 64;

	private int m_len = 0;
	private int m_cap = SLICE_SIZE;

	private ByteBuffer buffers;


	public Packet()
	{
		this.buffers = ByteBuffer.allocate(m_cap);
	}

	public Packet(ByteBuffer buffers)
	{
		this.buffers = buffers;
	}

	public Packet(byte[] bytes)
	{
		this.buffers = ByteBuffer.wrap(bytes);
		flip();
	}


	private void ReAllocate(int size)
	{
		int newSize = m_len + size;

		if (newSize <= m_cap) { return; }

		m_cap = ((newSize / SLICE_SIZE) + 1) * SLICE_SIZE;

		ByteBuffer newBuffers = ByteBuffer.allocate(m_cap);

		newBuffers.put(this.readBytes());

		this.buffers = newBuffers;
	}


	public byte[] encode(short packetId)
	{
		// 包数据的实际长度 + 协议字段长度
		short dataLen = (short)(this.length() + 2);

		flip();

		ByteBuffer bts = ByteBuffer.allocate(dataLen + 2);
		bts.putShort(dataLen);
		bts.putShort(packetId);
		bts.put(this.readBytes());

		if (bts.position() > 0)
		{
			bts.flip();
		}

		return bts.array();
	}


	public int length()
	{
		return this.m_len;
	}

	public void flip()
	{
		if (this.buffers.position() > 0)
		{
			this.buffers.flip();
		}
	}


	public void writeByte(byte value)
	{
		this.ReAllocate(1);

		this.buffers.put(value);
		this.m_len += 1;
	}

	public void writeShort(short value)
	{
		this.ReAllocate(2);

		this.buffers.putShort(value);
		this.m_len += 2;
	}

	public void writeInt(int value)
	{
		this.ReAllocate(4);

		this.buffers.putInt(value);
		this.m_len += 4;
	}

	public void writeLong(long value)
	{
		this.ReAllocate(8);

		this.buffers.putLong(value);
		this.m_len += 8;
	}

	public void writeFloat(float value)
	{
		this.ReAllocate(4);

		this.buffers.putFloat(value);
		this.m_len += 4;
	}

	public void writeDouble(double value)
	{
		this.ReAllocate(8);

		this.buffers.putDouble(value);
		this.m_len += 8;
	}

	public void writeString(String str)
	{
		this.writeString(str, "UTF-8");
	}

	public void writeString(String str, String charset)
	{
		try
		{
			byte[] strBytes = str.getBytes(charset);
			short len = (short)strBytes.length;

			this.ReAllocate(len + 2);

			this.writeShort(len);
			this.writeBytes(strBytes);
		}
		catch (UnsupportedEncodingException e)
		{
			this.writeShort((short)0);
		}
	}

	public void writeBytes(byte[] bytes)
	{
		int len = bytes.length;

		this.ReAllocate(len);

		this.buffers.put(bytes);
		this.m_len += len;
	}


	public byte readByte()
	{
		return this.buffers.get();
	}

	public short readShort()
	{
		return this.buffers.getShort();
	}

	public int readInt()
	{
		return this.buffers.getInt();
	}

	public long readLong()
	{
		return this.buffers.getLong();
	}

	public float readFloat()
	{
		return this.buffers.getFloat();
	}

	public double readDouble()
	{
		return this.buffers.getDouble();
	}

	public String readString()
	{
		return this.readString("UTF-8");
	}

	public String readString(String charset)
	{
		int len = PacketUtil.readUShort(this.buffers.getShort());
		byte[] bytes = new byte[len];
		this.buffers.get(bytes, 0, len);

		try
		{
			return new String(bytes, charset);
		}
		catch (UnsupportedEncodingException e)
		{
			System.out.println("readString出现异常");
		}
		return new String(bytes);
	}

	public byte[] readBytes()
	{
		int len = this.length();
		byte[] bytes = new byte[len];
		this.flip();
		System.arraycopy(this.buffers.array(), 0, bytes, 0, len);
		return bytes;
	}


	public ByteBuffer readBuffers()
	{
		return this.buffers;
	}
}
