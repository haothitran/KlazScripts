local addon, ns = ...
local L = {}
ns.L = L

--------------------------------------------------------------------------------
-- # CORE > LOCALIZATION
--------------------------------------------------------------------------------

-- ## ENGLISH
--------------------------------------------------------------------------------

L['COMMAND_PATCH_NUMBER'] = 'Patch:'
L['COMMAND_CLEAR_CHAT'] = 'Cleared text in all chat frames.'

L['CONFIG_BUTTON_RELOAD'] = 'Reload'
L['CONFIG_TEXT_RELOAD'] = 'Changes require a reload to take effect.'

L['AUTO_REPAIR'] = 'Repair cost'
L['AUTO_REPAIR_GUILD'] = 'Repaired using guild funds'
L['AUTO_REPAIR_BROKE'] = 'You do not have enough gold to auto repair.'

L['MAP_CURSOR'] = 'Cursor'
L['MAP_PLAYER'] = 'Player'
L['MAP_BOUNDS'] = 'Out of bounds!'

local locale = GetLocale()
if locale == 'en_GB' or locale == 'enUS' then return end -- Great Britain, United States

-- ## OTHER
--------------------------------------------------------------------------------

-- if locale == 'zhCN' then return end  -- CHINESE (SIMPLIFIED)
-- if locale == 'zhTW' then return end  -- CHINESE (TRADITIONAL)
-- if locale == 'frFR' then return end  -- FRENCH
-- if locale == 'deDE' then return end  -- GERMAN
-- if locale == 'it_IT' then return end -- ITALIAN
-- if locale == 'ko_KR' then return end -- KOREAN
-- if locale == 'pt_BR' then return end -- PORTUGEUSE
-- if locale == 'ruRU' then return end  -- RUSSIAN
-- if locale == 'esES' then return end  -- SPANISH (SPAIN)
-- if locale == 'esMX' then return end  -- SPANISH (MEXICO)
