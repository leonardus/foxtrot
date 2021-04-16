local config = require("foxtrot.config")
local cqueues = require("cqueues")
local socket = require("cqueues.socket")

config.init(arg[1] or "/etc/foxtrot/foxtrot.toml")

local controller = cqueues.new()

local function main()
	local host, port = config.parsed.net.addr, config.parsed.net.port
	local server = socket.connect(host, port)
	controller:wrap(function()
		while true do
			if socket.type(server) == "closed socket" then
				break
			end
			local line = server:read("*l")
			if line == nil then server:close() break end
		end
	end)
end

controller:wrap(main)
assert(controller:loop())