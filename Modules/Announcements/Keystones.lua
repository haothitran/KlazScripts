--------------------------------------------------------------------------------
-- # MODULES > ANNOUNCEMENTS > KEYSTONES
--------------------------------------------------------------------------------

local keystoneIDs = {
  [138019] = true, -- Legion
  [158923] = true, -- Battle for Azeroth
  [180653] = true, -- Shadowlands
  [187786] = true, -- Legion (timewalking)
}

local function UpdateKey(type)
  for bag = 0, NUM_BAG_SLOTS do
    for slot = 1, GetContainerNumSlots(bag) do
      local itemLink, _, _, itemID = select(7, GetContainerItemInfo(bag, slot))
      if keystoneIDs[itemID] then
        keystoneIDs[itemID] = itemLink
        if itemLink ~= nil then
          SendChatMessage(itemLink, type)
        else
          return
        end
      end
    end
  end
end

local function PostKey(self, event, ...)
    local msg = ...
    if msg and string.lower(msg) == '!keys' then
      if (event == 'CHAT_MSG_PARTY' or event == 'CHAT_MSG_PARTY_LEADER') then
        UpdateKey('PARTY')
        -- print('|cff1994ffKlazScripts|r — Keystones')
      end
    end
  return false
end

local f = CreateFrame('FRAME')
f:RegisterEvent('CHAT_MSG_GUILD')
f:RegisterEvent('CHAT_MSG_PARTY')
f:RegisterEvent('CHAT_MSG_PARTY_LEADER')
f:SetScript('OnEvent', PostKey)
