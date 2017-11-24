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

func AckChatSendOkDecode(pack *packet.Packet) *AckChatSendOk {
	ackChatSendOk := &AckChatSendOk{}

	ackChatSendOk.channel = pack.ReadUint8()
	ackChatSendOk.uid = pack.ReadUint32()
	ackChatSendOk.uname = pack.ReadString()
	ackChatSendOk.content = pack.ReadString()
	return ackChatSendOk
}

func (this *AckChatSendOk) GetChannel() uint8 {
	return this.channel
}

func (this *AckChatSendOk) GetUid() uint32 {
	return this.uid
}

func (this *AckChatSendOk) GetUname() string {
	return this.uname
}

func (this *AckChatSendOk) GetContent() string {
	return this.content
}
