package proto

import (
	"packet"
)

type ReqChatGm struct {
	content                  string
}

func ReqChatGmDecode(pack *packet.Packet) *ReqChatGm {
	reqChatGm := &ReqChatGm{}

	reqChatGm.content = pack.ReadString()
	return reqChatGm
}

func (this *ReqChatGm) GetContent() string {
	return this.content
}
