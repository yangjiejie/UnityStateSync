package main

import (
	"client/proto"
	"fmt"
	"net"
	"os"
	"packet"
)

func main() {
	conn, err := net.Dial("tcp", "127.0.0.1:8888")
	checkError(err)
	defer conn.Close()

	req := proto.ReqTestXX{}
	req.SetIdU8(10)
	req.SetIdU16(20)
	req.SetIdU32(30)
	req.SetOptionalIdU8(60)

	conn.Write(req.Encode())

	reqTestSend := proto.ReqTestSend{}
	reqTestSend.SetIdU8(255)
	idF32 := []float32{1.23, 1.24}
	reqTestSend.SetIdF32(idF32)
	reqTestSend.SetIdOpU8(222)
	msgRoleBase := &proto.MsgRoleBase{}
	msgRoleBase.SetUid(12306)
	msgRoleBase.SetUname("mirahs")
	reqTestSend.SetRoleBase(msgRoleBase)
	reqTestSend.SetOpRoleBase(msgRoleBase)

	conn.Write(reqTestSend.Encode())
}

func checkError(err error) {
	if err != nil {
		fmt.Fprintf(os.Stderr, "Fatal error: %s", err)
		os.Exit(1)
	}
}

func do(packetId uint16, buf []byte) {
	println("packetId: ", packetId)
	packet := packet.NewReadBuff(buf)
	switch packetId {
	case proto.P_ACK_TEST_X_X:
		ackTestXX := proto.AckTestXXDecode(packet)
		fmt.Println(ackTestXX)
	default:
		fmt.Println("unknown packetId:", packetId)
	}
}
