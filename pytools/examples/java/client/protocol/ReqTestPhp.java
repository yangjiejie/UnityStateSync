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


	public byte[] encode()
	{
		Packet packet = new Packet();
		packet.writeLong(u64);
		packet.writeString(strxx);
		packet.writeBytes(msg_req.getBytes());
		packet.writeByte(msg_opt_flag);
		if (msg_opt_flag == 1)
		{
			packet.writeBytes(msg_opt.getBytes());
		}
		int msg_rep_count = msg_rep.size();
		packet.writeShort((short)msg_rep_count);
		for (int i = 0; i < msg_rep_count; i++)
		{
			packet.writeBytes(msg_rep.get(i).getBytes());
		}
		return packet.encode((short)Msg.P_REQ_TEST_PHP);
	}



	public void setU64(long u64)
	{
		this.u64 = u64;
	}

	public void setStrxx(String strxx)
	{
		this.strxx = strxx;
	}

	public void setMsgReq(MsgTestPhp msg_req)
	{
		this.msg_req = msg_req;
	}

	public void setMsgOpt(MsgTestPhp msg_opt)
	{
		this.msg_opt_flag = (byte)1;
		this.msg_opt = msg_opt;
	}

	public void setMsgRep(List<Msgtestphp> msg_rep)
	{
		this.msg_rep = msg_rep;
	}

}
