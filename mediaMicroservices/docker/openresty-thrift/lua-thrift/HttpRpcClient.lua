--
----Author: xiajun
----Date: 20151020
----
local TSocket = require "TSocket"
local THttpTransport = require "THttpTransport"
local TBinaryProtocol = require "TBinaryProtocol"
local Object = require "Object"

local HttpRpcClient = Object:new({
	__type = 'RpcClient',
	timeout = 1001,
	readTimeout = 500
})

--初始化RPC连接
function HttpRpcClient:init(ip,port)
	local socket = TSocket:new{
		host = ip,
		port = port,
		readTimeout = self.readTimeout
	 }
	socket:setTimeout(self.timeout)
	local transport = THttpTransport:new{
		trans = socket
	}
	local protocol = TBinaryProtocol:new{
		trans = transport
        }
	transport:open()
	return protocol;
end
--创建RPC客户端
function HttpRpcClient:createClient(thriftClient)end
return HttpRpcClient
