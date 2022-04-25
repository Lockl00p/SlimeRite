--told ya I'm making a click detection function. Well, I didn't but shut up. (bx = block x, bf = block face, cx = cursor x coord on the block.)
guide = cItem(E_ITEM_BOOK,1,0,"","SlimeRite Guide")
function onRClick(plr,bx,by,bz,bf,cx,cy,cz)
  BlockCoords=Vector3i(bx,by,bz)
  plrinv = plr:GetInventory()
  if plrinv:GetEquippedItem() == guide then
    openguide(plr)
  
  end