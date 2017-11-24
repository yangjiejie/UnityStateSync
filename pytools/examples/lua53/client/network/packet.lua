-- local M = {}
-- local moduleName = ...
-- _G[moduleName] = M
-- setmetatable(M, {__index = _G})
-- local _ENV = M
packet = {}
setmetatable(packet, {__index = _G})
local _ENV = packet


function new(buff)
	local tab_obj = {}
	setmetatable(tab_obj, {__index = packet})
	tab_obj:init(buff)
	return tab_obj
end

function init(self, buffers)
	buffers = buffers or ""
	self.buffers		= buffers	-- 包内容字节
	self.pos			= 1			-- 包内容解到哪个位置了
end


function encode(self, packetId)
	self.buffers = string.pack(">H>A", packetId, self.buffers)
	local packeLen = string.len(self.buffers)
	self.buffers = string.pack(">H>A", packeLen, self.buffers)

	return self.buffers
end


function writeU8(self, wu8)
	self.buffers = string.pack(">A>b", self.buffers, wu8)
end
function writeI8(self, wi8)
	self.buffers = string.pack(">A>c", self.buffers, wi8)
end

function writeU16(self, wu16)
	self.buffers = string.pack(">A>H", self.buffers, wu16)
end
function writeI16(self, wi16)
	self.buffers = string.pack(">A>h", self.buffers, wi16)
end

function writeU32(self, wu32)
	self.buffers = string.pack(">A>I", self.buffers, wu32)
end
function writeI32(self, wi32)
	self.buffers = string.pack(">A>i", self.buffers, wi32)
end

function writeU64(self, wu64)
	self.buffers = string.pack(">A>L", self.buffers, wu64)
end
function writeI64(self, wi64)
	self.buffers = string.pack(">A>l", self.buffers, wi64)
end

function writeF32(self, wf32)
	self.buffers = string.pack(">A>f", self.buffers, wf32)
end

function writeF64(self, wf64)
	self.buffers = string.pack(">A>d", self.buffers, wf64)
end

function writeString(self, wstring)
	local stringLen = string.len(wstring)
	self.buffers = string.pack(">A>H>A", self.buffers, stringLen, wstring)
end

function writeBytes(self, bytes)
	self.buffers = string.pack(">A2", self.buffers, bytes)
end

	
function readU8(self)
	self.pos, ru8 = string.unpack(self.buffers, ">b", self.pos)
	return tonumber(ru8)
end
function readI8(self)
	self.pos, ri8 = string.unpack(self.buffers, ">c", self.pos)
	return tonumber(ri8)
end
		
function readU16(self)
	self.pos, ru16 = string.unpack(self.buffers, ">H", self.pos)
	return tonumber(ru16)
end
function readI16(self)
	self.pos, ri16 = string.unpack(self.buffers, ">h", self.pos)
	return tonumber(ri16)
end
		
function readU32(self)
	self.pos, ru32 = string.unpack(self.buffers, ">I", self.pos)
	return tonumber(ru32)
end
function readU32(self)
	self.pos, ri32 = string.unpack(self.buffers, ">i", self.pos)
	return tonumber(ri32)
end

function readU64(self)
	self.pos, ru64 = string.unpack(self.buffers, ">L", self.pos)
	return tonumber(ru64)
end
function readI64(self)
	self.pos, ri64 = string.unpack(self.buffers, ">l", self.pos)
	return tonumber(ri64)
end

function readF32(self)
	self.pos, rF32 = string.unpack(self.buffers, ">f", self.pos)
	return tonumber(rF32)
end

function readF64(self)
	self.pos, rF64 = string.unpack(self.buffers, ">d", self.pos)
	return tonumber(rF64)
end
		
function readString(self)
	stringLen	= self:readU16()
	self.pos, rString = string.unpack(self.buffers, ">A" .. tostring(stringLen), self.pos)
	return tostring(rString)
end

function readBytes(self)
	return self.buffers
end
