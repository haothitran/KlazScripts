--------------------------------------------------------------------------------
-- # MODULES > AUTOMATION > SELL JUNK
--------------------------------------------------------------------------------

local sellJunk = true

local f = CreateFrame('Frame')
f:RegisterEvent('MERCHANT_SHOW')
f:SetScript('OnEvent', function()
  if sellJunk ~= true then return end

  local bag, slot
  for bag = 0, 4 do
    for slot = 0, C_Container.GetContainerNumSlots(bag) do
      local item = C_Container.GetContainerItemLink(bag, slot)
      if item and (select(3, GetItemInfo(item)) == 0) then
        C_Container.UseContainerItem(bag, slot)
      end
    end
  end
end)
