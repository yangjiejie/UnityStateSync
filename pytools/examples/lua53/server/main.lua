require "lfs"
local dir		= lfs.currentdir()

local protocols = dir .. "/protocols/"
local path_old	= package.path
package.path 	= string.format("%s?.lua;%s", protocols, path_old)


require "protocols/Protocols"
require "protocols/Msg"

require "network/net"
require "network/packet"

local socket = require "socket"


local host	= "127.0.0.1"
local port 	= "8888"

local server= assert(socket.bind(host, port, 1024))

--server:settimeout(0)

print("Server Start " .. host .. ":" .. port)


while true do
	local conn = server:accept()
	net.new(conn):run()
end
