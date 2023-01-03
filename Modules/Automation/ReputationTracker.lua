--------------------------------------------------------------------------------
-- # MODULES > REPUTATION TRACKER
--------------------------------------------------------------------------------
-- switch reputation tracker to most recently earned reputation
-- ignores guild reputation


local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_TEXT_UPDATE')
f:SetScript('OnEvent', function(_, event, arg1)

  local lastupdate = 0
  local lastamount = 0

  if (event == 'COMBAT_TEXT_UPDATE' and arg1 == 'FACTION') then
		local faction, amount = GetCurrentCombatTextEventInfo()
		--print(faction);
		if (faction ~= 'Guild') then
			if (amount > lastamount) or (time() > lastupdate) then
				for i=1,GetNumFactions() do
					if faction == GetFactionInfo(i) then
						--print(i);
						SetWatchedFactionIndex(i);
					end
				end
			end
			lastamount = amount
			lastupdate = time()
		end
	end
end)
