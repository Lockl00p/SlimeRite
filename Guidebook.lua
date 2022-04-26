guidewindow = cLuaWindow(0,9,6,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()

function getpdata(plr)
  local pdata = io.open(const.pdatapath..plr:GetName().."_ItemsUnlocked.json","rw")
  
  
  if cFile:IsFile(const.pdatapath..plr:GetName()..".json") == false then
    --Creates Plrdata
    LOG("New Playerdata file created for "..plr.GetName())
    
    pdata:write(const.plrdatatemplate)
  end
  
  
    io.close(pdata)
    return cJson:Parse(cFile:ReadWholeFile(const.pdatapath..plr:GetName().."_ItemsUnlocked.json","rw"))
  
end


function setpdata(plr,key, awmd)
  local pldata = io.open(const.pdatapath..plr:GetName().."_ItemsUnlocked.json","rw")
  local pdata = getpdata(plr)
  if awmd == "w" then 
    LOG("This is a Debug function, do not use it unless you're sure you want to erase the player's data and replace it. If you are sure, next time type in [1,true] for this parameter")
  elseif awmd == [1,true] then
    LOG("Replacing"..plr:GetName() "data.")
    pdata.ItemsUnlocked = key
    pldata:write(cJson:Serialize(pdata))
  else
    table.insert(pdata.ItemsUnlocked,key)
    pldata:write(cJson:Serialize(pdata))
  end
  end
  
  
  
  
function openguide(plr)
  guidewindow:SetOnClicked(guideclicked)
  plr:OpenWindow(guidewindow)
  thispdata = getpdata

    

end
function initguide()
  
  --First, set up the guide buttons.
  guideborder()
  --Now we set up the categories.
  categorysetup()
  
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
  --This parses the json into a table.
  categorylist = cattotable()
  LOG("Setting up Categories in guide window")
  
  
  
end
function cattotable()
  local categorylist = cJson:Parse(cFile:ReadWholeFile(const.pluginpath.."categories.json"))
  LOG("Loaded Main Categories")
  LOG("Loaded Main Category Items.")
  return categorylist
end