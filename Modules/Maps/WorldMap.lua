
local addon, ns = ...
local L = ns.L

--------------------------------------------------------------------------------
-- # MODULES > MAPS > WORLD MAP
--------------------------------------------------------------------------------

-- # COORDINATES
--------------------------------------------------------------------------------

local coords = CreateFrame('Frame', 'CoordsFrame', WorldMapFrame)
coords:SetFrameLevel(WorldMapFrame.BorderFrame.TitleContainer:GetFrameLevel() + 2)
coords:SetFrameStrata(WorldMapFrame.BorderFrame.TitleContainer:GetFrameStrata())

coords.PlayerText = coords:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
coords.PlayerText:SetPoint('TOPLEFT', WorldMapFrame.BorderFrame.TitleContainer, 'TOPLEFT', 50, -5)
coords.PlayerText:SetJustifyH('LEFT')
coords.PlayerText:SetText(UnitName('player')..': 0, 0')

coords.MouseText = coords:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
coords.MouseText:SetJustifyH('LEFT')
coords.MouseText:SetPoint('TOPLEFT', coords.PlayerText, 'TOPRIGHT', 10, 0)
coords.MouseText:SetText(L.MAP_CURSOR..': 0, 0')

local mapRects, tempVec2D = {}, CreateVector2D(0, 0)
local function GetPlayerMapPos(mapID)
	tempVec2D.x, tempVec2D.y = UnitPosition('player')
	if not tempVec2D.x then return end

	local mapRect = mapRects[mapID]
	if not mapRect then
		local _, pos1 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(0, 0))
		local _, pos2 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(1, 1))
		if not pos1 or not pos2 then return end
		mapRect = {pos1, pos2}
		mapRect[2]:Subtract(mapRect[1])
		mapRects[mapID] = mapRect
	end
	tempVec2D:Subtract(mapRect[1])

	return (tempVec2D.y/mapRect[2].y), (tempVec2D.x/mapRect[2].x)
end

local int = 0
WorldMapFrame:HookScript('OnUpdate', function()
	int = int + 1
	if int >= 3 then
		local unitMap = C_Map.GetBestMapForUnit('player')
		local x, y = 0, 0

		if unitMap then
			x, y = GetPlayerMapPos(unitMap)
		end

		if x and y and x >= 0 and y >= 0 then
			coords.PlayerText:SetFormattedText('|cff1994ff%s:|r %.2f, %.2f', UnitName('player'), x * 100, y * 100)
		else
			coords.PlayerText:SetText('|cff1994ff'..UnitName('player')..':|r '..'|cffff0000'..L.MAP_BOUNDS..'|r')
		end

		if WorldMapFrame.ScrollContainer:IsMouseOver() then
			local mouseX, mouseY = WorldMapFrame.ScrollContainer:GetNormalizedCursorPosition()
			if mouseX and mouseY and mouseX >= 0 and mouseY >= 0 then
				coords.MouseText:SetFormattedText('|cff1994ff%s:|r %.2f, %.2f', L.MAP_CURSOR, mouseX * 100, mouseY * 100)
			else
				coords.MouseText:SetText('|cff1994ff'..L.MAP_CURSOR..':|r |cffff0000'..L.MAP_BOUNDS..'|r')
			end
		else
			coords.MouseText:SetText('|cff1994ff'..L.MAP_CURSOR..':|r |cffff0000'..L.MAP_BOUNDS..'|r')
		end

		int = 0
	end
end)
