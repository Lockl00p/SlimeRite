function clkincat(win,plr,SlotNum,ClickAct,Clkitem)
  --Checks against a few conditions to see if it should just return true
  if win:IsSlotInPlayerInventory(SlotNum) == true or Clkitem.m_CustomName == "-" or Clkitem.m_CustomName == "" or Clkitem.m_CustomName == "Left" or Clkitem.m_CustomName == "Right" then
    return true
  end
  
  
  --Logs the itemname for debug purposes
  LOG(Clkitem.m_CustomName)
  --Converts the json file to a table for use in here
  CraftTable = jsontotable(const.Itemfolder..Clkitem.m_CustomName:gsub(" ","_")..".json")
  local isitem = true
    
  if CraftTable == "err" then
    LOG("test")
    CraftTable = jsontotable(const.Machinefolder..Clkitem.m_CustomName:gsub(" ","_")..".json")
    isitem = false
    if CraftTable == "err" then
      return true
    end
    LOG("Machine Loaded")
  end
  --Sets up window
  LOG(CraftTable.RecipeName)
  window,wincontents = setupguidewindow(plr,0,9,6,CraftTable.RecipeName)
  window:SetOnClicked(reclk)
  --Loads recipe based on whether its an item or not
  if isitem then
    return loaditrecipe(CraftTable,wincontents)
  else return loadmcrecipe(CraftTable,wincontents)
  end
  return true
end
function nl(x)
  end
function tstcrft(tbl,n)
  LOG("Does this work?")
  if n == 1 then 
    nl(tbl.top_left)
  elseif n == 2 then
    nl(tbl.top_mid)
  elseif n == 3 then
    nl(tbl.top_right)
  elseif n == 4 then
    nl(tbl.mid_left)
  elseif n == 5 then
    nl(tbl.mid_mid)
  elseif n == 6 then
    nl(tbl.mid_right)
  elseif n == 7 then
    nl(tbl.bottom_left)
  elseif n == 8 then
    nl(tbl.bottom_mid)
  elseif n == 9 then
    nl(tbl.bottom_right)
  end
  LOG("Does this work?")
  return true
  end
function loaditrecipe(tbl,itgrid)
  --top (pcall returns false if there is an error)
  
  itgrid:SetSlot(3,1,cItem(tbl.top_left[1],tbl.top_left[2],tbl.top_left[3],tbl.top_left[5],tbl.top_left[4]))



  itgrid:SetSlot(4,1,cItem(tbl.top_mid[1],tbl.top_mid[2],tbl.top_mid[3],tbl.top_mid[5],tbl.top_mid[4]))



  itgrid:SetSlot(5,1,cItem(tbl.top_right[1],tbl.top_right[2],tbl.top_right[3],tbl.top_right[5],tbl.top_right[4]))

  --mid
  

  itgrid:SetSlot(3,2,cItem(tbl.mid_left[1],tbl.mid_left[2],tbl.mid_left[3],tbl.mid_left[5],tbl.mid_left[4]))



  itgrid:SetSlot(4,2,cItem( tbl.mid_mid[1],tbl.mid_mid[2],tbl.mid_mid[3],tbl.mid_mid[5],tbl.mid_mid[4]))



  itgrid:SetSlot(5,2,cItem( tbl.mid_right[1],tbl.mid_right[2],tbl.mid_right[3],tbl.mid_right[5],tbl.mid_right[4]))


  --bottom

  itgrid:SetSlot(3,3,cItem( tbl.bottom_left[1],tbl.bottom_left[2],tbl.bottom_left[3],tbl.bottom_left[5],tbl.bottom_left[4]))



  itgrid:SetSlot(4,3,cItem( tbl.bottom_mid[1],tbl.bottom_mid[2],tbl.bottom_mid[3],tbl.bottom_mid[5],tbl.bottom_mid[4]))



  itgrid:SetSlot(5,3,cItem( tbl.bottom_right[1],tbl.bottom_right[2],tbl.bottom_right[3],tbl.bottom_right[5],tbl.bottom_right[4]))
 
  
  itgrid:SetSlot(7,2,cItem(tbl.Result[1],tbl.Result[2],tbl.Result[3],tbl.Result[5],tbl.Result[4]))
  
  if tbl.Enhanced == true then itgrid:SetSlot(0,2,58,1,0) end
  
  return true
  end
function reclk(win,plr,SlotNum,ClickAct,Clkitem)
  return true
end
function loadmcrecipe(tbl,itgrid)
  i = 0
  --iterates through all coord tables and places the related item down
  for x, z in ipairs(tbl.coords) do
    i = i + 1
    itgrid:SetSlot(tbl.coords[i][1],tbl.coords[i][2],cItem(tbl.items[i][1],tbl.items[i][2],tbl.items[i][3], tbl.items[i][4],tbl.items[i][5]))
  end
  
  end