function query(query_string)
	local luasql = require "luasql.mysql"
	local env = assert (luasql.mysql())

	local Settings = eq.GetSettings()
	local db = Settings["server"]["database"]["db"]
	local host = Settings["server"]["database"]["host"]
	local user = Settings["server"]["database"]["username"]
	local pass = Settings["server"]["database"]["password"]
	local port = Settings["server"]["database"]["port"]

	local conn = env:connect(db,user,pass,host,port)
	local cursor = conn:execute(query_string)
	local row = cursor:fetch ({}, "a")

	cursor:close()
	conn:close()
	env:close()
	return row
end