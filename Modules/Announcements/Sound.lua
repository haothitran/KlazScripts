--------------------------------------------------------------------------------
-- # MODULES > ANNOUNCEMENTS > SOUND
--------------------------------------------------------------------------------

-- push ready check sound through to master channel
hooksecurefunc('ShowReadyCheck', function(self, initiator)
  if initiator ~= 'player' then
    PlaySound(SOUNDKIT.READY_CHECK, 'Master')
  end
end)

-- push other warning sounds through to master channel
local warn = CreateFrame('Frame')
warn:RegisterEvent('UPDATE_BATTLEFIELD_STATUS')
warn:RegisterEvent('PET_BATTLE_QUEUE_PROPOSE_MATCH')
warn:RegisterEvent('LFG_PROPOSAL_SHOW')
warn:RegisterEvent('RESURRECT_REQUEST')
warn:SetScript('OnEvent', function(self, event)
  if event == 'UPDATE_BATTLEFIELD_STATUS' then
    for i = 1, GetMaxBattlefieldID() do
      local status = GetBattlefieldStatus(i)
      if status == 'confirm' then
        PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, 'Master')
        break
      end
      i = i + 1
    end
  elseif event == 'PET_BATTLE_QUEUE_PROPOSE_MATCH' then
    PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, 'Master')
  elseif event == 'LFG_PROPOSAL_SHOW' then
    PlaySound(SOUNDKIT.READY_CHECK, 'Master')
  elseif event == 'RESURRECT_REQUEST' then
    PlaySound(37, 'Master')
  end
end)

-- mute crying emote sound
-- for when player has trinket equipped - Elegy of the Eternals (Shadowlands)
MuteSoundFile(540533) -- female human
MuteSoundFile(539792) -- female dwarf
MuteSoundFile(540273) -- female gnome
MuteSoundFile(540873) -- female night elf
MuteSoundFile(539674) -- female draenei

MuteSoundFile(540736) -- male human
MuteSoundFile(539875) -- male dwarf
MuteSoundFile(540264) -- male gnome
MuteSoundFile(540957) -- male night elf
MuteSoundFile(539609) -- male draenei

MuteSoundFile(541149) -- female orc
MuteSoundFile(542815) -- female tauren
MuteSoundFile(543084) -- female troll
MuteSoundFile(542519) -- female undead
MuteSoundFile(539295) -- female blood elf

MuteSoundFile(541240) -- male orc
MuteSoundFile(542887) -- male tauren
MuteSoundFile(543090) -- male troll
MuteSoundFile(542601) -- male undead
MuteSoundFile(539355) -- male blood elf
