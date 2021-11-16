local ev = require "samp.events"
require 'ruleta.utils'
require 'ruleta.functii'

local color_status = ""
local state = ""

function ev.onServerMessage(color, text)
	if activated == 1 then
		if color == -1 then
			if string.match(text, "The roulette landed") then
				if string.match(text, "red") then
					color_status = "red"
				elseif string.match(text, "green") then
					color_status = "green"
				elseif string.match(text, "black") then
					color_status = "black"
				end
			end
		end
		if color == 1303194623 then 
			if string.match(text, "You won") then
				state = "Won"
			elseif string.match(text, "You lost") then
				state = "Lost"
			end
			insert_data(color_status, state, split_string(text, " ")[4])
		end
	end
end
