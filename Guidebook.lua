guidewindow = cLuaWindow(0,9,6,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()



function openguide(plr)
  guidewindow:SetOnClicked(guideclicked)
  plr:OpenWindow(guidewindow)
  if cFile:IsFile(const.pdatapath..plr:GetName()..".json") == false then
    --Creates Plrdata
    LOG("New Playerdata file created for "..plr.GetName())
    local pdata = io.open(const.pdatapath..plr:GetName()..".json","w")
    pdata:write(const.plrdatatemplate)
    io.close(pdata)
    
end
end
function initguide()
  
  --First, set up the guide buttons.
  guideborder()
  --Now we set up the categories.

end 

function guideclicked(win,plr,SlotNum,ClickAct,Clkitem)
  return true
end 
function guideborder()
    --Top Row
  --as a refresher, first param for for loop is variable made, second is max num of var, 3rd is increment value (default is one)

    for x = 0,7 do
    guidecontents:SetSlot(x,0,const.emptyitem)
  end
  --The Settings Compass
  guidecontents:SetSlot(8,0,cItem(345,1,0,"","Settings"))
  --Top Row End
  
  --Bottom Row
  --This sets up the empty items
  for x = 0,8 do
    --this sets up the buttons
    if x == 1 or x == 7 then
      if x == 1 then
        guidecontents:SetSlot(x,5,cItem(160,1,5,"","Left"))
      else
        guidecontents:SetSlot(x,5,cItem(160,1,5,"","Right"))
      end
    else 
      guidecontents:SetSlot(x,5,const.emptyitem)
    end
  end
end
function categorysetup()
  --y 1 - 5
  for x in 