
function insert_data(color, status, money)
	table.insert(array_money, money)
	table.insert(array_state, status)
	table.insert(array_date, os.date("%c"))
	_, charID = sampGetPlayerIdByCharHandle(playerPed)
	table.insert(array_name, sampGetPlayerNickname(charID))
	if color == "red" then
		table.insert(array_color, "red")
	elseif color == "black" then 
		table.insert(array_color, "black")
	elseif color == "green" then 
		table.insert(array_color, "green")
	end
end


function clear_arrays()
	for x=0, #array_date, 1 do
		array_date[x] = nil
	end
	for x=0, #array_color, 1 do
		array_color[x] = nil
	end
	for x=0, #array_name, 1 do
		array_name[x] = nil
	end
	for x=0, #array_state, 1 do
		array_state[x] = nil
	end
	for x=0, #array_money, 1 do
		array_money[x] = nil
	end
end
