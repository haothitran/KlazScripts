local addon, ns = ...
local T = {}
ns.T = T


local function addAuraSource(self, func, unit, index, filter, instanceID)
	local srcUnit
	if instanceID then
		local aura = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, index)
		srcUnit = aura and aura.sourceUnit
	else
		srcUnit = select(7, func(unit, index, filter))
	end
	if srcUnit then
		local src = GetUnitName(srcUnit, true)
		if srcUnit == 'pet' or srcUnit == 'vehicle' then
			src = format('%s (|cff%02x%02x%02x%s|r)', src, T.ClassColor.r * 255, T.ClassColor.g * 255, T.ClassColor.b * 255, GetUnitName('player', true))
		else
			local partypet = srcUnit:match('^partypet(%d+)$')
			local raidpet = srcUnit:match('^raidpet(%d+)$')
			if partypet then
				src = format('%s (%s)', src, GetUnitName('party'..partypet, true))
			elseif raidpet then
				src = format('%s (%s)', src, GetUnitName('raid'..raidpet, true))
			end
		end
		if UnitIsPlayer(srcUnit) then
			local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass(srcUnit))]
			if color then
				src = format('|cff%02x%02x%02x%s|r', color.r * 255, color.g * 255, color.b * 255, src)
			end
		else
			local color = UnitReaction(self.unit, 'player')
			if color then
				src = format('|cff%02x%02x%02x%s|r', color[1] * 255, color[2] * 255, color[3] * 255, src)
			end
		end
		self:AddLine(DONE_BY..' '..src)
		self:Show()
	end
end

local funcs = {
	SetUnitAura = UnitAura,
	SetUnitBuff = UnitBuff,
	SetUnitDebuff = UnitDebuff,
	SetUnitBuffByAuraInstanceID = UnitBuff,
	SetUnitDebuffByAuraInstanceID = UnitDebuff,
}

for k, v in pairs(funcs) do
	if k == 'SetUnitBuffByAuraInstanceID' or k == 'SetUnitBuffByAuraInstanceID' then
		hooksecurefunc(GameTooltip, k, function(self, unit, index, filter)
			addAuraSource(self, v, unit, index, filter, true)
		end)
	else
		hooksecurefunc(GameTooltip, k, function(self, unit, index, filter)
			addAuraSource(self, v, unit, index, filter)
		end)
	end
end