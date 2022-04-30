guidewindow = cLuaWindow(0,9,6,"SlimeRite guide!")
guidecontents = guidewindow:GetContents()
local LeftOutNames = {} 
local LeftOutIds = {}

function getpdata(plr)
   
  
  
  if cFile:IsFile(const.pdatapath..plr:GetName().."_ItemsUnlocked.json") == false then
   --Creates Plrdata
    pdata = io.open(const.pdatapath..plr:GetName().."_ItemsUnlocked.json","w")
    LOG("New Playerdata file created for "..plr:GetName())
    
    pdata:write("{'ItemsUnlocked' : [0,1]}")
    io.close(pdata)
  end
  
  
    
    return cJson:Parse(cFile:ReadWholeFile(const.pdatapath..plr:GetName().."_ItemsUnlocked.json"))
  
end


function setpdata(plr,key, awmd) --probably not working
  local pldata = io.open(const.pdatapath..plr:GetName().."_ItemsUnlocked.json","r+")
  local pdata = getpdata(plr)
  if awmd == "w" then 
    LOG("This is a Debug function, do not use it unless you're sure you want to erase the player's data and replace it. If you are sure, next time type in [1,true] for this parameter")
  elseif awmd == {1,true} then
    LOG("Replacing"..plr:GetName() "data.")
    pdata.ItemsUnlocked = key
    pldata:write(cJson:Serialize(pdata))
  else
    table.insert(pdata.ItemsUnlocked,key)
    pldata:write(cJson:Serialize(pdata))
  end
  end
  
  
  
  
function openguide(plr)
  --Sets on clicked event
  guidewindow:SetOnClicked(guideclicked)
  --opens the window
  plr:OpenWindow(guidewindow)
  --gets player data (only really to make sure they have plrdata as of now)
  thispdata = getpdata(plr)

    

end
function initguide()
  
  --First, set up the guide buttons.
  guideborder()
  --Now we set up the categories.
  categorysetup()
  
end 

function guideclicked(win,plr,SlotNum,ClickAct,Clkitem)
  --Passes it off to the next Guidebook lua script because this one is getting too long.
  if win:IsSlotInPlayerInventory(SlotNum) == true then
    return true
  end
  return ongclick(win,plr,SlotNum,ClickAct,Clkitem)
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
  Startslot = guidecontents:GetSlotNum(0,1)
  Endslot = guidecontents:GetSlotNum(8,4)
  --This parses the json into a table.
  categorylist = cattotable()
  LOG("Setting up Categories in guide window Page One")
  guidebuilderI()
  LOG("Set up Categories in Guide window page one.")  
end

function cattotable()
  local categorylist = cJson:Parse(cFile:ReadWholeFile(const.pluginpath.."categories.json"))
  LOG("Loaded Main Categories")
  LOG("Loaded Main Category Items.")
  return categorylist
end
function guidebuilderI()
  --Loops through Category names, storing them in z
  for x,z in ipairs(categorylist.CategoryNames) do
    --Sets up the guide contents, leaving the left out items in their own tables.
    if Startslot + x < Endslot then
      guidecontents:SetSlot(Startslot + x - 1,cItem(categorylist.CategoryItems[x],1,0,"",z))
    else
      table.insert(LeftOutNames,z)
      table.insert(LeftOutIds, categorylist.CategoryItems[x+1]) 
    end
    end
    end