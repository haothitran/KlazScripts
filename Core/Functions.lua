local addon, ns = ...
local T = {}
ns.T = T

--------------------------------------------------------------------------------
-- # CORE > FUNCTIONS
--------------------------------------------------------------------------------

-- ## CHECK CHAT CHANNEL
--------------------------------------------------------------------------------
-- check which chat channel is appropriate to use

T.ChatChannel = function(warning)
  if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    return 'INSTANCE_CHAT'
  elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
    return 'RAID'
  elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
    return 'PARTY'
  else
    return 'SAY'
  end
end
