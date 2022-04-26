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
  --as a refresher, first param for for loop is variable made, second is max num of var, 3rd is increment value (default is one)
  for x = 0,7 do
    guidecontents.setslot(x,0,const.emptyitem)
  
  
end 

function guideclicked(win,plr,SlotNum,ClickAct,Clkitem)
  return true
  end 