package proto

import (
	"packet"
)

type AckChatSendOk struct {
	channel                  uint8
	uid                      uint32
	uname                    string
	content                  string
}

func (this *AckChatSendOk) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteUint8(this.channel)
	pack.WriteUint32(this.uid)
	pack.WriteString(this.uname)
	pack.WriteString(this.content)

	return pack.Encode(P_ACK_CHAT_SEND_OK)
}

func (this *AckChatSendOk) SetChannel(channel uint8) {
	this.channel = channel
}

func (this *AckChatSendOk) SetUid(uid uint32) {
	this.uid = uid
}

func (this *AckChatSendOk) SetUname(uname string) {
	this.uname = uname
}

func (this *AckChatSendOk) SetContent(content string) {
	this.content = content
}
