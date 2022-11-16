local addon, ns = ...
local L = ns.L

--------------------------------------------------------------------------------
-- # MODULES > AUTOMATION > REPAIR
--------------------------------------------------------------------------------

local autoRepair = true
local autoRepairGuild = true

local f = CreateFrame('Frame')
f:RegisterEvent('MERCHANT_SHOW')
f:SetScript('OnEvent', function()
  if CanMerchantRepair() then
    local cost = GetRepairAllCost()
    if cost > 0 then
      -- using guild funds
      if autoRepairGuild == true and GetGuildBankWithdrawMoney() >= cost then
        RepairAllItems(1)
        print('Klaz|cff1994ffScripts|r — |cnYELLOW_FONT_COLOR:'..L.AUTO_REPAIR_GUILD..':|r '..GetCoinTextureString(cost, 10)) -- print using currency icons
        -- print(format('|cff1994ff'..L.AUTO_MERCHANT_REPAIR_GUILD..': %.1fg|r', cost * 0.0001)) -- print using letter notationg (e.g. gold > g)
        PlaySound(SOUNDKIT.ITEM_REPAIR)
      -- using personal funds
      elseif autoRepair == true and GetMoney() > cost then
        RepairAllItems()
        print('Klaz|cff1994ffScripts|r — |cnYELLOW_FONT_COLOR:'..L.AUTO_REPAIR..':|r '..GetCoinTextureString(cost, 10)) -- print using currency icons
        -- print(format('|cff1994ff'..L.AUTO_MERCHANT_REPAIR..': %.1fg|r', cost * 0.0001)) -- print using letter notationg (e.g. gold > g)
        PlaySound(SOUNDKIT.ITEM_REPAIR)
      -- no money
      else
        print('Klaz|cff1994ffScripts|r — |cnRED_FONT_COLOR:'..L.AUTO_REPAIR_BROKE..'|r')
      end
    end
  end
end)
