package proto

import (
	"packet"
)

type ReqChatSend struct {
	channel                  uint8
	destUid                  uint32
	content                  string
}

func ReqChatSendDecode(pack *packet.Packet) *ReqChatSend {
	reqChatSend := &ReqChatSend{}

	reqChatSend.channel = pack.ReadUint8()
	reqChatSend.destUid = pack.ReadUint32()
	reqChatSend.content = pack.ReadString()
	return reqChatSend
}

func (this *ReqChatSend) GetChannel() uint8 {
	return this.channel
}

func (this *ReqChatSend) GetDestUid() uint32 {
	return this.destUid
}

func (this *ReqChatSend) GetContent() string {
	return this.content
}
