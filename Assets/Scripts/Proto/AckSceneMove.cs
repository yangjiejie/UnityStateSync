using System.Collections;
using System.Collections.Generic;


public class AckSceneMove
{
	private MsgSceneRotPos _scene_rot_pos;
	private MsgSceneVector3 _forward;
	private string _ani_name;
	private short _x_axis;
	private uint _uid;


	public AckSceneMove(Packet packet)
	{
		this._scene_rot_pos = new MsgSceneRotPos(packet);
		this._forward = new MsgSceneVector3(packet);
		this._ani_name = packet.ReadString();
		this._x_axis = packet.ReadShort();
		this._uid = packet.ReadUint();
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

	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

}
