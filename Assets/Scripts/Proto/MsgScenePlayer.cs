using System.Collections;
using System.Collections.Generic;


public class MsgScenePlayer
{
	private uint _uid;
	private string _uname;
	private MsgScenePosRot _scene_pos_rot;


	public Packet Encode()
	{
		Packet packet = new Packet();
		packet.WriteUint(this._uid);
		packet.WriteString(this._uname);
		packet.WriteBuffer(this._scene_pos_rot.GetBuffer());
		return packet;
	}

	public MsgScenePlayer()
	{
	}

	public MsgScenePlayer(Packet packet)
	{
		this._uid = packet.ReadUint();
		this._uname = packet.ReadString();
		this._scene_pos_rot = new MsgScenePosRot(packet);
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

	public string uname
	{
		get { return this._uname; }
		set { this._uname = value; }
	}

	public MsgScenePosRot scene_pos_rot
	{
		get { return this._scene_pos_rot; }
		set { this._scene_pos_rot = value; }
	}

}
