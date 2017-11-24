package proto

import (
	"packet"
)

type ReqChatGm struct {
	content                  string
}

func (this *ReqChatGm) Encode() []byte {
	pack := packet.NewWriteBuff(64)

	pack.WriteString(this.content)

	return pack.Encode(P_REQ_CHAT_GM)
}

func (this *ReqChatGm) SetContent(content string) {
	this.content = content
}
