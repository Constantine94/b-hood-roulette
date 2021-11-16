local imgui = require 'imgui'
require 'ruleta.functii'
require 'ruleta.hook'

status = false
activated = 0

array_date = {}
array_color = {}
array_name = {}
array_state = {}
array_money = {}

local title = "B-hood Ruleta"
local winX = 1500
local winY = 430

local listbox_selected = imgui.ImInt(0)
local listbox_selected1 = imgui.ImInt(0)

-- Style
function apply_custom_style()
	local style = imgui.GetStyle()
	style.WindowRounding = 0
	style.WindowPadding = imgui.ImVec2(10, 10)
	style.ScrollbarRounding = 0.0
	style.ScrollbarSize = 15
	local colors = style.Colors
	local st = imgui.Col
	colors[st.TitleBg] = imgui.ImVec4(255, 0, 0 ,1)
	colors[st.TitleBgActive] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.WindowBg] = imgui.ImVec4(0.10, 0.10, 0.10, 1)
	colors[st.Button] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.FrameBg] = imgui.ImVec4(0.18, 0.18, 0.18, 1) 
	colors[st.ScrollbarBg] = imgui.ImVec4(0.10, 0.10, 0.10, 1)
	colors[st.ScrollbarGrab] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.ScrollbarGrabHovered] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.ScrollbarGrabActive] = imgui.ImVec4(150, 0, 0, 1)
	colors[st.Border] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.BorderShadow] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.Separator] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.Header] = imgui.ImVec4(255, 0, 0, 1) -- selected item listbox
	colors[st.HeaderHovered] = imgui.ImVec4(255, 0, 0, 1)
	colors[st.HeaderActive] = imgui.ImVec4(255, 0, 0, 1)
end

apply_custom_style()

function imgui.OnDrawFrame()
	imgui.SetNextWindowSize(imgui.ImVec2(20 + (winX / 2), winY))
	imgui.Begin("B-Hood Roulette Recorder", _, imgui.WindowFlags.NoResize)

	if imgui.Button("Activate", imgui.ImVec2(245, 25)) then 
		activated = 1
		log("Roulette Recorder activated")
	end
	imgui.SameLine()
	if imgui.Button("Dezactivate", imgui.ImVec2(245, 25)) then 
		activated = 0
		log("Roulette Recorder dezactivated")
	end
	imgui.SameLine()
	if imgui.Button("Clear", imgui.ImVec2(245, 25)) then
		clear_arrays()
		log("All lists cleared")
	end
	imgui.Columns(5)
	imgui.TextColored(imgui.ImVec4(225.0, 225.0, 225.0, 1.0), "Data")
	imgui.PushItemWidth(-1)
	imgui.ListBox(" ",  listbox_selected, array_date, 18)
	imgui.PopItemWidth()
	
	imgui.NextColumn()
	imgui.TextColored(imgui.ImVec4(255.0, 225.0, 225.0, 1.0), "Culoare")
	imgui.PushItemWidth(-1)
	imgui.ListBox("  ",  listbox_selected, array_color, 18)
	imgui.PopItemWidth()
	
	imgui.NextColumn()
	imgui.TextColored(imgui.ImVec4(255.0, 225.0, 225.0, 1.0), "Nume Player")
	imgui.PushItemWidth(-1)
	imgui.ListBox("   ",  listbox_selected, array_name, 18)
	imgui.PopItemWidth()


	imgui.NextColumn()
	imgui.TextColored(imgui.ImVec4(255.0, 225.0, 225.0, 1.0), "Status")
	imgui.PushItemWidth(-1)
	imgui.ListBox("    ",  listbox_selected, array_state, 18)
	imgui.PopItemWidth()
	
	imgui.NextColumn()
	imgui.TextColored(imgui.ImVec4(255.0, 225.0, 225.0, 1.0), "Money")
	imgui.PushItemWidth(-1)
	imgui.ListBox("     ",  listbox_selected, array_money, 18)
	imgui.PopItemWidth()
	imgui.End()
end

function main()
	while true do
		wait(0)
		if wasKeyPressed(0x71) then
			status = not status
		end
		imgui.Process = status 
	end
end
