--[[	Binary Search

	- This method reduces the number of lookups in a table.

	- Returns the index of the searched value

	- Feel free to modify the comparator
]]

local function Comparator(a, b)
	if a > b then return -1
	elseif a < b then return 1
	else return 0
	end
end

local function binarySearch(tbl, value, comparator, ...)
	if not comparator then
		comparator = Comparator
	end
	
	local mini = 1
	local maxi = #tbl
	
	while mini <= maxi do
		local mid = math.floor((maxi+mini)/2)
		local tmp_value = comparator(tbl[mid], value, ...)
		
		if tmp_value == 0 then 
			return mid
		elseif tmp_value > 0 then
			mini = mid + 1
		else
			maxi = mid - 1
		end
	end
	return nil	
end

-- Now, example

-- First, we define a table where the search will be done.
local tabela = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 101, 102}

-- Now, arranging the table
table.sort(tabela)

local value = 40 -- Value that will be sought
local result = binarySearch(tabela, value) -- Returns the index of the searched value
print(result)