--told ya I'm making a click detection function. Well, I didn't but shut up. (bx = block x, bf = block face, cx = cursor x coord on the block.)

function onRClick(plr,bx,by,bz,bf,cx,cy,cz)
  --Declarations
  
  
  local BlockCoords=Vector3i(bx,by,bz)
  local plrinv = plr:GetInventory()
  
  --Act based on Equipped item
  if ItemToFullString(plrinv:GetEquippedItem()) == ItemToFullString(const.guide) then
    
    openguide(plr)
    
    
  end
end