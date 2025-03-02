
function query(query_string)
	local luasql = require "luasql.mysql"
	local env = assert (luasql.mysql())

	local conn = env:connect("rottakp","Darksinga","Norrath123!","mariadb","3306")
	local cursor = conn:execute(query_string)
	local row = cursor:fetch ({}, "a")

	cursor:close()
	conn:close()
	env:close()
	return row
end