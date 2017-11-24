package protocol;


import network.Packet;
import network.PacketUtil;

import java.util.List;
import java.util.ArrayList;


public class ReqTestPhp
{
	private long u64;
	private String strxx;
	private MsgTestPhp msg_req;
	private byte msg_opt_flag;
	private MsgTestPhp msg_opt;
	private List<Msgtestphp> msg_rep = new ArrayList<Msgtestphp>();


	public ReqTestPhp(Packet packet)
	{
		u64 = packet.readLong();
		strxx = packet.readString();
		msg_req = new MsgTestPhp(packet);
		msg_opt_flag = packet.readByte();
		if (msg_opt_flag == 1)
		{
			msg_opt = new MsgTestPhp(packet);
		}
		int msg_rep_count = PacketUtil.readUShort(packet.readShort());
		for (int i = 0; i < msg_rep_count; i++)
		{
			msg_rep.add(new MsgTestPhp(packet));
		}
	}



	public long getU64()
	{
		return this.u64;
	}

	public String getStrxx()
	{
		return this.strxx;
	}

	public MsgTestPhp getMsgReq()
	{
		return this.msg_req;
	}

	public MsgTestPhp getMsgOpt()
	{
		return this.msg_opt;
	}

	public List<Msgtestphp> getMsgRep()
	{
		return this.msg_rep;
	}

}
