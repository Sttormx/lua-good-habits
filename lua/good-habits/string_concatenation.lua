--[[	String Concatenation

	? In Lua, The garbage collector always runs when there is a lot of memory in use by the code.

	? When using the concatenation operator (..) and at the same time reassigning a value from an old string to a new variable (str = str .. "example"), the result will be a new string and an old one will become the memory garbage.

	? When working with many concatenations, we must use the table.concat function. This function uses a C implementation rather than Lua
]]

--	Incorrect Mode
local txtResult = ""

for line in io.lines('file.txt') do
    txtResult = txtResult .. line 	-- Old variable 'result' is now memory garbage.
end

--	Corret Mode
local strConcat = {}

for line in io.lines('file.txt') do
    table.insert(strConcat, line)
end

local txtResult = table.concat(strConcat, "\n")