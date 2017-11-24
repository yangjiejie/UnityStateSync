package proto

import (
	"packet"
)

type MsgScenePlayer struct {
	uid                      uint32
	sceneRotPos              *MsgSceneRotPos
}

func (this *MsgScenePlayer) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint32(this.uid)
	pack.WriteBytes(this.sceneRotPos.Encode())

	return pack.ReadBytes()
}

func MsgScenePlayerDecode(pack *packet.Packet) *MsgScenePlayer {
	msgScenePlayer := &MsgScenePlayer{}

	msgScenePlayer.uid = pack.ReadUint32()
	msgScenePlayer.sceneRotPos = MsgSceneRotPosDecode(pack)
	return msgScenePlayer
}

func (this *MsgScenePlayer) SetUid(uid uint32) {
	this.uid = uid
}

func (this *MsgScenePlayer) GetUid() uint32 {
	return this.uid
}

func (this *MsgScenePlayer) SetSceneRotPos(sceneRotPos *MsgSceneRotPos) {
	this.sceneRotPos = sceneRotPos
}

func (this *MsgScenePlayer) GetSceneRotPos() *MsgSceneRotPos {
	return this.sceneRotPos
}
