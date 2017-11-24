using System.Collections;
using System.Collections.Generic;


public class AckTestPhpOk
{
	private ulong _u64;
	private string _strxx;
	private MsgTestPhp _msg_req;
	private byte msg_opt_flag;
	private MsgTestPhp _msg_opt;
	private List<MsgTestPhp> _msg_rep = new List<MsgTestPhp>();


	public AckTestPhpOk(Packet packet)
	{
		this._u64 = packet.ReadUlong();
		this._strxx = packet.ReadString();
		this._msg_req = new MsgTestPhp(packet);
		this. msg_opt_flag = packet.ReadByte();
		if (this.msg_opt_flag == 1)
		{
			this._msg_opt = new MsgTestPhp(packet);
		}
		this._msg_rep = new List<MsgTestPhp>();
		ushort msg_rep_count = packet.ReadUshort();
		for (ushort i = 0; i < msg_rep_count; i++)
		{
			this._msg_rep.Add(new MsgTestPhp(packet));
		}
	}


	public ulong u64
	{
		get { return this._u64; }
		set { this._u64 = value; }
	}

	public string strxx
	{
		get { return this._strxx; }
		set { this._strxx = value; }
	}

	public MsgTestPhp msg_req
	{
		get { return this._msg_req; }
		set { this._msg_req = value; }
	}

	public MsgTestPhp msg_opt
	{
		get { return this._msg_opt; }
		set { this.msg_opt_flag = 1; this._msg_opt = value; }
	}

	public List<MsgTestPhp> msg_rep
	{
		get { return this._msg_rep; }
		set { this._msg_rep = value; }
	}

}
