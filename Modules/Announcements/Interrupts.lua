local addon, ns = ...
local T = ns.T

-- --------------------------------------------------------------------------------
-- -- # MODULES > ANNOUNCEMENTS > INTERRUPTS
-- --------------------------------------------------------------------------------

local announceSelf = true
local announceParty = false
local announceRaid = false

local f = CreateFrame('Frame')
f:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
f:SetScript('OnEvent', function()
  local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
  if not (event == 'SPELL_INTERRUPT' and sourceGUID == UnitGUID('player')) then return end

  -- check instant difficulty
  local _, _, difficultyID = GetInstanceInfo()
  -- do not announce interrupts in open world content
  if difficultyID == 0 then return end

  -- check instance type
  local _, instanceType = IsInInstance()
  -- do not announce interrupts in pvp content
  if instanceType == 'pvp' or instanceType == 'arena' then return end

  if instanceType == 'raid' and announceRaid == true then
    SendChatMessage(INTERRUPTED..' '..destName..': '..GetSpellLink(spellID), T.ChatChannel())
  elseif (instanceType == 'party' or 'scenario') and announceParty == true then
    SendChatMessage(INTERRUPTED..' '..destName..': '..GetSpellLink(spellID), T.ChatChannel())
  elseif announceSelf == true then
    print('|cff1994ff'..INTERRUPTED..' '..destName..':|r '..GetSpellLink(spellID))
  end
end)
