local addon, ns = ...
local L = ns.L
local T = ns.T

--------------------------------------------------------------------------------
-- # CORE > CONFIG
--------------------------------------------------------------------------------

-- ## CONFIG PANEL
--------------------------------------------------------------------------------
-- create options panel in Game Menu > Options > AddOns

local configPanel = CreateFrame('Frame', 'KlazScripts Configuration Panel', InterfaceOptionsFramePanelContainer)
configPanel.name = 'Klaz|cff1994ffScripts|r'
InterfaceOptions_AddCategory(configPanel)

local title = configPanel:CreateFontString(nil, nil, 'GameFontHighlightLarge')
title:SetPoint('TOPLEFT', 16, -16 )
title:SetText('Klaz|cff1994ffScripts|r')

-- ## RELOAD
--------------------------------------------------------------------------------

local btnReload = CreateFrame('Button', nil, configPanel, 'UIPanelButtonTemplate')
btnReload:SetPoint('TOPLEFT', title, 'TOPLEFT', 20, -400)
btnReload:SetSize(100, 24)
btnReload:SetText(L.CONFIG_BUTTON_RELOAD)
btnReload:SetScript('OnClick', function(frame)
  ReloadUI()
end)
btnReload:Hide()
btnReload.text = configPanel:CreateFontString(nil, nil, 'GameFontNormal')
btnReload.text:SetPoint('LEFT', btnReload, 'RIGHT', 15, 0)
btnReload.text:SetText('|cnRED_FONT_COLOR:'..L.CONFIG_TEXT_RELOAD..'|r')
btnReload.text:Hide()

-- ## SLASH COMMAND
--------------------------------------------------------------------------------

SlashCmdList['KLAZSCRIPTS'] = function(msg)
  -- called twice to ensure options panel opens
  InterfaceOptionsFrame_OpenToCategory('Klaz|cff1994ffScripts|r')
  InterfaceOptionsFrame_OpenToCategory('Klaz|cff1994ffScripts|r')
end
SLASH_KLAZSCRIPTS1 = '/klazscripts'
SLASH_KLAZSCRIPTS2 = '/kscripts'
