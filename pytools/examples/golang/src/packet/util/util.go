package util

import (
	"encoding/binary"
)

func ReadU16(buff []byte) uint16 {
	return binary.BigEndian.Uint16(buff)
}
