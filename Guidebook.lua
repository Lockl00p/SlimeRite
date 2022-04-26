guidewindow = cLuaWindow(0,9,5,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()



function openguide(plr)
  LOG("Guide opened by ".. plr:GetName())
  guidewindow:SetOnClicked(guideclicked)
  plr:OpenWindow(guidewindow)
end

function addcategory()
  
  end
function initguide()
  
  --First, set up the guide buttons.
  
  --Top Row
  --as a refresher, first param for for loop is variable made, second is max num of var, 3rd is increment value (default is one)
  for x = 0,7 do
    guidecontents:SetSlot(x,0,const.emptyitem)
  end
  guidecontents:SetSlot(8,0,cItem(345,1,0))
  --Top Row End
  
  --Bottom Row
  for x = 0,8 do
    if x == 1 or x == 7 then
      guidecontents:SetSlot(x,5,160,1,5)
    else 
      guidecontents:SetSlot(x,5,const.emptyitem)
    end
  end
end 

function guideclicked(win,plr,SlotNum,ClickAct,Clkitem)
  return true
  end 