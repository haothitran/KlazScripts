--------------------------------------------------------------------------------
-- # MODULES > AUTOMATION > MAIL MONEY
--------------------------------------------------------------------------------
-- automatically enters subject line when sending/requesting money

local function MailSubject(self)
  if self:GetText() ~= '' and SendMailSubjectEditBox:GetText() == '' then
    SendMailSubjectEditBox:SetText(MONEY)
  end
end

SendMailMoneyGold:HookScript('OnTextChanged', MailSubject)
SendMailMoneySilver:HookScript('OnTextChanged', MailSubject)
SendMailMoneyCopper:HookScript('OnTextChanged', MailSubject)
