using System.Collections;
using System.Collections.Generic;


public class MsgTestPhp
{
	private ushort _u16;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUshort(this._u16);
		return packet;
	}

	public MsgTestPhp()
	{
	}

	public MsgTestPhp(Packet packet)
	{
		this._u16 = packet.ReadUshort();
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public ushort u16
	{
		get { return this._u16; }
		set { this._u16 = value; }
	}

}
