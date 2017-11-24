package proto

import (
	"packet"
)

type ReqChatSend struct {
	channel                  uint8
	destUid                  uint32
	content                  string
}

func (this *ReqChatSend) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint8(this.channel)
	pack.WriteUint32(this.destUid)
	pack.WriteString(this.content)

	return pack.Encode(P_REQ_CHAT_SEND)
}

func (this *ReqChatSend) SetChannel(channel uint8) {
	this.channel = channel
}

func (this *ReqChatSend) SetDestUid(destUid uint32) {
	this.destUid = destUid
}

func (this *ReqChatSend) SetContent(content string) {
	this.content = content
}
