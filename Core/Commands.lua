local addon, ns = ...
local L = ns.L

--------------------------------------------------------------------------------
-- # CORE > COMMANDS
--------------------------------------------------------------------------------

-- reload user interface
SlashCmdList['RELOADUI'] = function()
  ReloadUI()
end
SLASH_RELOADUI1 = '/rl'

-- print client patch version
SlashCmdList['PATCHNUMBER'] = function()
  print('Klaz|cff1994ffScripts|r — |cnNORMAL_FONT_COLOR:'..L.COMMAND_PATCH_NUMBER..'|r |cnGREEN_FONT_COLOR:'..select(4, GetBuildInfo())..'|r')
end
SLASH_PATCHNUMBER1 = '/patch'

-- clear text in all chat frames
SlashCmdList['CLEARCHAT'] = function()
  for i = 1, NUM_CHAT_WINDOWS do
    _G[format('ChatFrame%d', i)]:Clear()
  end
  print('Klaz|cff1994ffScripts|r — |cnNORMAL_FONT_COLOR:'..L.COMMAND_CLEAR_CHAT..'|r')
end
SLASH_CLEARCHAT1 = '/clearchat'
SLASH_CLEARCHAT2 = '/cc'

-- teleport in/out of instance
SlashCmdList['TELEPORT'] = function()
  if IsInInstance() then
    LFGTeleport(true)
  else
    LFGTeleport()
  end
end
SLASH_TELEPORT1 = '/teleport'
SLASH_TELEPORT2 = '/tp'

-- leave party/raid group
SlashCmdList['LEAVEGROUP'] = function()
  C_PartyInfo.LeaveParty()
end
SLASH_LEAVEGROUP1 = '/leaveparty'
SLASH_LEAVEGROUP2 = '/lp'

-- reset instances
SlashCmdList['RESETINSTANCES'] = function()
  ResetInstances()
end
SLASH_RESETINSTANCES1 = '/resetinstances'
SLASH_RESETINSTANCES2 = '/ri'

-- open great vault
SlashCmdList['GREATVAULT'] = function()
  LoadAddOn('Blizzard_WeeklyRewards')
	WeeklyRewardsFrame:Show()
end
SLASH_GREATVAULT1 = '/gv'
