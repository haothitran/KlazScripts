--------------------------------------------------------------------------------
-- # MODULES > AUTOMATION > FAST LOOT
--------------------------------------------------------------------------------

local epoch = 0
local LOOT_DELAY = 0.3

local f = CreateFrame('Frame')
f:RegisterEvent('LOOT_READY')
f:SetScript('OnEvent', function ()
  if GetCVarBool('autoLootDefault') ~= IsModifiedClick('AUTOLOOTTOGGLE') then
    if (GetTime()-epoch) >= LOOT_DELAY then
      for i = GetNumLootItems(), 1, -1 do
        LootSlot(i)
      end
      epoch = GetTime()
    end
  end
end)
