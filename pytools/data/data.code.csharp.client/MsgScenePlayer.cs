using System.Collections;
using System.Collections.Generic;


public class MsgScenePlayer
{
	private uint _uid;
	private MsgSceneRotPos _scene_rot_pos;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.WriteBuffer(this._scene_rot_pos.GetBuffer());
		return packet;
	}

	public MsgScenePlayer()
	{
	}

	public MsgScenePlayer(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._scene_rot_pos = new MsgSceneRotPos(packet);
	}

	public List<byte> GetBuffer()
	{
		return this.Encode().GetBuffer();
	}


	public uint uid
	{
		get { return this._uid; }
		set { this._uid = value; }
	}

	public MsgSceneRotPos scene_rot_pos
	{
		get { return this._scene_rot_pos; }
		set { this._scene_rot_pos = value; }
	}

}
