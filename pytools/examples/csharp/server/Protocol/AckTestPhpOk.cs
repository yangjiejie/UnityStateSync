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


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUlong(this._u64);
		packet.WriteString(this._strxx);
		packet.WriteBuffer(this._msg_req.GetBuffer());
		packet.WriteByte(msg_opt_flag);
		if (this.msg_opt_flag == 1)
		{
			packet.WriteBuffer(this._msg_opt.GetBuffer());
		}
		ushort msg_rep_count = (ushort)this._msg_rep.Count;
		packet.WriteUshort(msg_rep_count);
		for (ushort i = 0; i < msg_rep_count; i++)
		{
			MsgTestPhp xxx = this._msg_rep[i];
			packet.WriteBuffer(xxx.GetBuffer());
		}
		packet.Encode(Msg.P_ACK_TEST_PHP_OK);
		return packet;
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
