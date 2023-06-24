colors = {}
colors["c41e3a"] = {"DK", "Chester", "Milaa", "Kolossal", "Saphe"}
colors["ff7c0a"] = {"Druid", "Worst", "Empyréa", "Hek"}
colors["aad372"] = {"Hunter", "Emyrion"}
colors["3fc7eb"] = {"Mage", "Feu", "Arcane", "Onlyfeu", "Bbrone"}
colors["f48cba"] = {"Paladin","Skoud", "Antea", "SH", "Fraize"}
colors["ffffff"] = {"Priest", "Ravix", "Evenstar"}
colors["fff468"] = {"Rogue", "Sgonna", "Trigoth", "Empire"}
colors["0070dd"] = {"Shaman", "Timaz", "Blyska"}
colors["8788ee"] = {"Warlock", "Dp", "Dépi", "Pardav", "Chlamy", "Klound"}
colors["c69b6d"] = {"Warrior", "Matsu"}

local function color_wrapper(str)
	for color_hex, class_names in pairs(colors) do
		for i, class_name in ipairs(class_names) do
			str = string.gsub(str, class_name, WrapTextInColorCode(class_name, 'ff' .. color_hex))
	  	end
	end

	return str
end

local function add_prio_to_tooltip(tt)
	local itemLink = select(2, tt:GetItem())

	if itemLink then
		local itemID = GetItemInfoFromHyperlink(itemLink)

		if item_priorities[itemID] ~= nil then
			if item_priorities[itemID] and item_priorities[itemID][1] and item_priorities[itemID][1] ~= "" then
				tt:AddDoubleLine('Class prio', color_wrapper(item_priorities[itemID][1]), nil, nil, nil, 1, 1, 1)
			end
			if item_priorities[itemID] and item_priorities[itemID][2] and item_priorities[itemID][2] ~= "" then
				tt:AddDoubleLine('Player prio', color_wrapper(item_priorities[itemID][2]), nil, nil, nil, 1, 1, 1)
			end
		end
	end
end

GameTooltip:HookScript("OnTooltipSetItem", add_prio_to_tooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", add_prio_to_tooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", add_prio_to_tooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", add_prio_to_tooltip)

local f = CreateFrame("Frame")
f:SetScript("OnEvent", f.OnEvent)
