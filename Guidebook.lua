guidewindow = cLuaWindow(0,6,9,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()

Bottomrow = cItems()

function openguide(plr)
  LOG("Guide opened by ".. plr:GetName())
  guidewindow:SetOnClicked(guideclicked)
  plr:OpenWindow(guidewindow)
end

function addcategory()
  
  end
function initguide()
  
  --First, set up the guide buttons.
  
  
  
end 

function guideclicked(win,plr,SlotNum,ClickAct,Clkitem)
  return true
  end 