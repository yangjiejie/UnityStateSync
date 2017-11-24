package packet

import (
	"bytes"
	"encoding/binary"
	"math"
)

type Packet struct {
	data   []byte
	offset int
}

func NewWriteBuff(size int) *Packet {
	pack := &Packet{}
	pack.data = make([]byte, 0, size)
	pack.offset = 0

	return pack
}

func NewReadBuff(buf []byte) *Packet {
	pack := &Packet{}
	pack.data = buf
	pack.offset = 0

	return pack
}

func (pack *Packet) Encode(packetId uint16) []byte {
	msgbuf := make([]byte, 4+len(pack.data))

	binary.BigEndian.PutUint16(msgbuf, uint16(len(pack.data))+2)
	binary.BigEndian.PutUint16(msgbuf[2:4], packetId)
	copy(msgbuf[4:], pack.data)

	return msgbuf
}

func (pack *Packet) Append(p ...byte) {
	pack.data = append(pack.data, p...)
}

func (pack *Packet) Slice(n int) []byte {
	r := pack.data[pack.offset : pack.offset+n]
	pack.offset += n

	return r
}

/**
 * 读数据
 */
func (pack *Packet) ReadUint8() uint8 {
	return uint8(pack.Slice(1)[0])
}

func (pack *Packet) ReadInt8() int8 {
	return int8(pack.Slice(1)[0])
}

func (pack *Packet) ReadUint16() uint16 {
	return binary.BigEndian.Uint16(pack.Slice(2))
}

func (pack *Packet) ReadInt16() int16 {
	var v int16

	buf := pack.Slice(2)
	buffer := bytes.NewBuffer(buf)

	binary.Read(buffer, binary.BigEndian, v)

	return v
}

func (pack *Packet) ReadUint32() uint32 {
	return binary.BigEndian.Uint32(pack.Slice(4))
}

func (pack *Packet) ReadInt32() int32 {
	var v int32

	buf := pack.Slice(4)
	buffer := bytes.NewBuffer(buf)

	binary.Read(buffer, binary.BigEndian, v)

	return v
}

func (pack *Packet) ReadUint64() uint64 {
	return binary.BigEndian.Uint64(pack.Slice(8))
}

func (pack *Packet) ReadInt64() int64 {
	var v int64

	buf := pack.Slice(4)
	buffer := bytes.NewBuffer(buf)

	binary.Read(buffer, binary.BigEndian, v)

	return v
}

func (pack *Packet) ReadFloat32() float32 {
	return math.Float32frombits(pack.ReadUint32())
}

func (pack *Packet) ReadFloat64() float64 {
	return math.Float64frombits(pack.ReadUint64())
}

func (pack *Packet) ReadString() string {
	len := int(pack.ReadUint16())
	return string(pack.Slice(len))
}

func (pack *Packet) ReadBytes() []byte {
	return pack.data
}

/**
 * 写数据
 */
func (pack *Packet) WriteUint8(v uint8) {
	pack.Append(byte(v))
}

func (pack *Packet) WriteInt8(v int8) {
	pack.Append(byte(v))
}

func (pack *Packet) WriteUint16(v uint16) {
	pack.Append(byte(v>>8), byte(v))
}

func (pack *Packet) WriteInt16(v int16) {
	pack.Append(byte(v>>8), byte(v))
}

func (pack *Packet) WriteUint32(v uint32) {
	pack.Append(byte(v>>24), byte(v>>16), byte(v>>8), byte(v))
}

func (pack *Packet) WriteInt32(v int32) {
	pack.Append(byte(v>>24), byte(v>>16), byte(v>>8), byte(v))
}

func (pack *Packet) WriteUint64(v uint64) {
	pack.Append(
		byte(v>>56),
		byte(v>>48),
		byte(v>>40),
		byte(v>>32),
		byte(v>>24),
		byte(v>>16),
		byte(v>>8),
		byte(v),
	)
}

func (pack *Packet) WriteInt64(v int64) {
	pack.Append(
		byte(v>>56),
		byte(v>>48),
		byte(v>>40),
		byte(v>>32),
		byte(v>>24),
		byte(v>>16),
		byte(v>>8),
		byte(v),
	)
}

func (pack *Packet) WriteFloat32(v float32) {
	pack.WriteUint32(math.Float32bits(v))
}

func (pack *Packet) WriteFloat64(v float64) {
	pack.WriteUint64(math.Float64bits(v))
}

func (pack *Packet) WriteString(s string) {
	buf := []byte(s)
	strLen := uint16(len(buf))
	pack.WriteUint16(strLen)
	pack.Append(buf...)
}

func (pack *Packet) WriteBytes(d []byte) {
	pack.Append(d...)
}
