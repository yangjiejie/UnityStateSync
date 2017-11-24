package util

import (
	"encoding/binary"
	"fmt"
	"io"
	"math"
	"unicode/utf8"
)

type ByteBuf struct {
	Data []byte
	/** 读字节缓存的偏移量 */
	ReadOfset int
}

func (out *ByteBuf) WriteInt32BE(v int32) {
	binary.Write(out, binary.BigEndian, v)
}

func (in *ByteBuf) Print() string {
	//	fmt.Println(len(in.Data))
	//	str := []string{"Data lenth", strconv.Itoa(), "Data Cap", strconv.Itoa(cap(in.Data)), " ReadOfset", strconv.Itoa(in.ReadOfset)}
	//	temp := strings.Join(str, ",")
	temps := fmt.Sprintf("Data lenth %d Data Cap %d ReadOfset %d", len(in.Data), cap(in.Data), in.ReadOfset)
	return temps
}

func (in *ByteBuf) reset() {
	in.Data = in.Data[0:0]
	in.ReadOfset = 0
	fmt.Println(len(in.Data))
}

// Slice some bytes from buffer.
func (in *ByteBuf) Slice(n int) []byte {
	r := in.Data[in.ReadOfset : in.ReadOfset+n]
	in.ReadOfset += n
	return r
}

// Implement io.Reader interface
func (in *ByteBuf) Read(b []byte) (int, error) {
	if in.ReadOfset == len(in.Data) {
		return 0, io.EOF
	}
	n := len(b)
	if n+in.ReadOfset > len(in.Data) {
		n = len(in.Data) - in.ReadOfset
	}
	copy(b, in.Data[in.ReadOfset:])
	in.ReadOfset += n
	return n, nil
}

// Read some bytes from buffer.
func (in *ByteBuf) ReadBytes(n int) []byte {
	x := make([]byte, n)
	copy(x, in.Slice(n))
	return x
}

// Read a string from buffer.
func (in *ByteBuf) ReadString(n int) string {
	return string(in.Slice(n))
}

// Read a rune from buffer.
func (in *ByteBuf) ReadRune() rune {
	x, size := utf8.DecodeRune(in.Data[in.ReadOfset:])
	in.ReadOfset += size
	return x
}

// Read a uint8 value from buffer.
func (in *ByteBuf) ReadUint8() uint8 {
	return uint8(in.Slice(1)[0])
}

// Read a uint16 value from buffer using little endian byte order.
func (in *ByteBuf) ReadUint16LE() uint16 {
	return binary.LittleEndian.Uint16(in.Slice(2))
}

// Read a uint16 value from buffer using big endian byte order.
func (in *ByteBuf) ReadUint16BE() uint16 {
	return binary.BigEndian.Uint16(in.Slice(2))
}

// Read a uint32 value from buffer using little endian byte order.
func (in *ByteBuf) ReadUint32LE() uint32 {
	return binary.LittleEndian.Uint32(in.Slice(4))
}

// Read a uint32 value from buffer using big endian byte order.
func (in *ByteBuf) ReadUint32BE() uint32 {
	return binary.BigEndian.Uint32(in.Slice(4))
}

// Read a uint64 value from buffer using little endian byte order.
func (in *ByteBuf) ReadUint64LE() uint64 {
	return binary.LittleEndian.Uint64(in.Slice(8))
}

// Read a uint64 value from buffer using big endian byte order.
func (in *ByteBuf) ReadUint64BE() uint64 {
	return binary.BigEndian.Uint64(in.Slice(8))
}

// Read a float32 value from buffer using little endian byte order.
func (in *ByteBuf) ReadFloat32LE() float32 {
	return math.Float32frombits(in.ReadUint32LE())
}

// Read a float32 value from buffer using big endian byte order.
func (in *ByteBuf) ReadFloat32BE() float32 {
	return math.Float32frombits(in.ReadUint32BE())
}

// Read a float64 value from buffer using little endian byte order.
func (in *ByteBuf) ReadFloat64LE() float64 {
	return math.Float64frombits(in.ReadUint64LE())
}

// Read a float64 value from buffer using big endian byte order.
func (in *ByteBuf) ReadFloat64BE() float64 {
	return math.Float64frombits(in.ReadUint64BE())
}

// ReadVarint reads an encoded signed integer from buffer and returns it as an int64.
func (in *ByteBuf) ReadVarint() int64 {
	v, n := binary.Varint(in.Data[in.ReadOfset:])
	in.ReadOfset += n
	return v
}

// ReadUvarint reads an encoded unsigned integer from buffer and returns it as a uint64.
func (in *ByteBuf) ReadUvarint() uint64 {
	v, n := binary.Uvarint(in.Data[in.ReadOfset:])
	in.ReadOfset += n
	return v
}

func (out *ByteBuf) InitWriteBuf(size int) {
	if cap(out.Data) < size {
		out.Data = make([]byte, 0, size)
	} else {
		out.Data = out.Data[0:0]
		out.ReadOfset = 0
	}
}

func (out *ByteBuf) InitReadBuf(size int) {
	if cap(out.Data) < size {
		out.Data = make([]byte, 0, size)
	} else {
		out.Data = out.Data[0:size]
		out.ReadOfset = 0
	}
}

// Append some bytes into buffer.
func (out *ByteBuf) Append(p ...byte) {
	out.Data = append(out.Data, p...)
}

// Implement io.Writer interface.
func (out *ByteBuf) Write(p []byte) (int, error) {
	out.Data = append(out.Data, p...)
	return len(p), nil
}

// Write a byte slice into buffer.
func (out *ByteBuf) WriteBytes(d []byte) {
	out.Append(d...)
}

// Write a string into buffer.
func (out *ByteBuf) WriteString(s string) {
	out.Append([]byte(s)...)
}

// Write a rune into buffer.
func (out *ByteBuf) WriteRune(r rune) {
	p := []byte{0, 0, 0, 0}
	n := utf8.EncodeRune(p, r)
	out.Append(p[:n]...)
}

// Write a uint8 value into buffer.
func (out *ByteBuf) WriteUint8(v uint8) {
	out.Append(byte(v))
}

// Write a uint16 value into buffer using little endian byte order.
func (out *ByteBuf) WriteUint16LE(v uint16) {
	out.Append(byte(v), byte(v>>8))
}

// Write a uint16 value into buffer using big endian byte order.
func (out *ByteBuf) WriteUint16BE(v uint16) {
	out.Append(byte(v>>8), byte(v))
}

// Write a uint32 value into buffer using little endian byte order.
func (out *ByteBuf) WriteUint32LE(v uint32) {
	out.Append(byte(v), byte(v>>8), byte(v>>16), byte(v>>24))
}

// Write a uint32 value into buffer using big endian byte order.
func (out *ByteBuf) WriteUint32BE(v uint32) {
	out.Append(byte(v>>24), byte(v>>16), byte(v>>8), byte(v))
}

// Write a uint64 value into buffer using little endian byte order.
func (out *ByteBuf) WriteUint64LE(v uint64) {
	out.Append(
		byte(v),
		byte(v>>8),
		byte(v>>16),
		byte(v>>24),
		byte(v>>32),
		byte(v>>40),
		byte(v>>48),
		byte(v>>56),
	)
}

// Write a uint64 value into buffer using big endian byte order.
func (out *ByteBuf) WriteUint64BE(v uint64) {
	out.Append(
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

// Write a float32 value into buffer using little endian byte order.
func (out *ByteBuf) WriteFloat32LE(v float32) {
	out.WriteUint32LE(math.Float32bits(v))
}

// Write a float32 value into buffer using big endian byte order.
func (out *ByteBuf) WriteFloat32BE(v float32) {
	out.WriteUint32BE(math.Float32bits(v))
}

// Write a float64 value into buffer using little endian byte order.
func (out *ByteBuf) WriteFloat64LE(v float64) {
	out.WriteUint64LE(math.Float64bits(v))
}

// Write a float64 value into buffer using big endian byte order.
func (out *ByteBuf) WriteFloat64BE(v float64) {
	out.WriteUint64BE(math.Float64bits(v))
}

// Write a uint64 value into buffer.
func (out *ByteBuf) WriteUvarint(v uint64) {
	for v >= 0x80 {
		out.Append(byte(v) | 0x80)
		v >>= 7
	}
	out.Append(byte(v))
}

// Write a int64 value into buffer.
func (out *ByteBuf) WriteVarint(v int64) {
	ux := uint64(v) << 1
	if v < 0 {
		ux = ^ux
	}
	out.WriteUvarint(ux)
}
