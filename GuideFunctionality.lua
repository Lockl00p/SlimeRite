LeftOutItemNames = {}
LeftOutItemIDs = {}
function setupguidewindow(plr,tpe,x,y,nm)
  plr:CloseWindow()
  rwin = cLuaWindow(tpe,x,y,nm)
  pborder(rwin:GetContents())
  plr:OpenWindow(rwin)
  return rwin,rwin:GetContents()
end
function ongclick(win,plr,SlotNum,ClickAct,Clkitem) 

  --Currently just prevents an error from occuring
  if Clkitem.m_CustomName == "-" or Clkitem.m_CustomName == "Left" or Clkitem.m_CustomName == "Right" or Clkitem.m_CustomName == "" then
    return true
  end
  --Converts Json to table
  ItemsTable = jsontotable(const.Catfolder..Clkitem.m_CustomName:gsub(" ","_")..".json")
  --Error Prevention
  if ItemsTable == "err" then
  return true
end
--Creates and decorates window. Then opens it for the player
  pwin = cLuaWindow(0,9,6,Clkitem.m_CustomName)
  pwininv = pwin:GetContents()
  pborder(pwininv)
  pwin:SetOnClicked(clkincat)
  plr:CloseWindow()
  guidebuilder(ItemsTable)
  plr:OpenWindow(pwin)
  --Logs ItemName for Debug purposes
  LOG(Clkitem.m_CustomName)
  
  return true
end

function jsontotable(path)
  --Detects if file is there and converts to table
  if cFile:IsFile(path) then
    return cJson:Parse(cFile:ReadWholeFile(path))
  else
    LOG("File "..path.." does not exist. Cannot place Items.")
    return "err"
end
end

function guidebuilder(Ilist)
  --This part is to make sure the border isn't overwritten.
  local Startslot = pwininv:GetSlotNum(0,1)
  local Endslot = pwininv:GetSlotNum(8,4)
  --Places the items in the category
  for x,z in ipairs(Ilist.CategoryNames) do
    if Startslot + x < Endslot then
      pwininv:SetSlot(Startslot + x - 1,cItem(Ilist.CategoryItems[x],1,0,"",z))
    else
      table.insert(LeftOutItemNames,z)
      table.insert(LeftOutItemIds, Ilist.CategoryItems[x+1]) 
    end
  end
  --Currently useless, don't know what I was thinking whipping this one up.
  for x,z in ipairs(LeftOutItemNames) do 
    if Startslot + x < Endslot then
      pwininv:SetSlot(Startslot + x - 1,cItem(LeftOutItemIds[x],1,0,"",z))
    else
      LeftOutItemIds = {}
      LeftOutItemNames = {}
      table.insert(LeftOutItemNames,z)
      table.insert(LeftOutItemIds, Ilist.CategoryItems[x+1]) end
  end
  end
function pborder(pgitemgrid)
    --Top Row
  --as a refresher, first param for for loop is variable made, second is max num of var, 3rd is increment value (default is one)

  for x = 0,7 do
    pgitemgrid:SetSlot(x,0,const.emptyitem)
  end
  --The Settings Compass
  pgitemgrid:SetSlot(8,0,cItem(345,1,0,"","Settings"))
  --Top Row End
  
  --Bottom Row
  --This sets up the empty items
  for x = 0,8 do
    --this sets up the buttons
    if x == 1 or x == 7 then
      if x == 1 then
        pgitemgrid:SetSlot(x,5,cItem(160,1,5,"","Left"))
      else
        pgitemgrid:SetSlot(x,5,cItem(160,1,5,"","Right"))
      end
    else 
      pgitemgrid:SetSlot(x,5,const.emptyitem)
    end
  end
end