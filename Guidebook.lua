guidewindow = cLuaWindow(0,6,9,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()

function openguide(plr)
  LOG("Guide opened by ".. plr:GetName())
  guidewindow:SetOnClicked()
  plr:OpenWindow(guidewindow)
end

function initguide()
  for x in pairs(cJson:Parse(const.))
  
end

function 