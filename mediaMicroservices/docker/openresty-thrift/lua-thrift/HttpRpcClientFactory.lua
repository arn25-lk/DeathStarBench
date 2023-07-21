local HttpRpcClient = require "HttpRpcClient"
--local TestServiceClient = require "resty.thrift.thrift-idl.lua_test_TestService"
local HttpRpcClientFactory = HttpRpcClient:new({
	__type = 'Client'
})
function HttpRpcClientFactory:createClient(thriftClient, ip, port)
    local protocol = self:init(ip, port)
    local client = thriftClient:new{
        iprot = protocol,
        oprot = protocol
    }
    return client
end
return HttpRpcClientFactory
