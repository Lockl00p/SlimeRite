function clkincat(win,plr,SlotNum,ClickAct,Clkitem)
  --Checks against a few conditions to see if it should just return true
  if win:IsSlotInPlayerInventory(SlotNum) == true or Clkitem.m_CustomName == "-" or Clkitem.m_CustomName == "" or Clkitem.m_CustomName == "Left" or Clkitem.m_CustomName == "Right" then
    return true
  end
  
  
  --Logs the itemname for debug purposes
  LOG(Clkitem.m_CustomName)
  --Converts the json file to a table for use in here
  CraftTable = jsontotable(const.Itemfolder..Clkitem.m_CustomName:gsub(" ","_")..".json")
  
  return true
end

