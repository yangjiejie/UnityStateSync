using System.Collections;
using System.Collections.Generic;


public class ReqSceneMove
{
	private MsgSceneRotPos _scene_rot_pos;
	private MsgSceneVector3 _forward;
	private string _ani_name;
	private short _x_axis;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteBuffer(this._scene_rot_pos.GetBuffer());
		packet.WriteBuffer(this._forward.GetBuffer());
		packet.WriteString(this._ani_name);
		packet.WriteShort(this._x_axis);
		packet.Encode(Msg.P_REQ_SCENE_MOVE);
		return packet;
	}


	public MsgSceneRotPos scene_rot_pos
	{
		get { return this._scene_rot_pos; }
		set { this._scene_rot_pos = value; }
	}

	public MsgSceneVector3 forward
	{
		get { return this._forward; }
		set { this._forward = value; }
	}

	public string ani_name
	{
		get { return this._ani_name; }
		set { this._ani_name = value; }
	}

	public short x_axis
	{
		get { return this._x_axis; }
		set { this._x_axis = value; }
	}

}
