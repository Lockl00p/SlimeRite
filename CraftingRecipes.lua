#Crafting recipes using cCraftingRecipe
function setuprecipe(table)
  --This imports the Custom Item files
  items = const.CustomItems()
  
  --This will go through all items one by one adding their recipe
  for x, z in ipairs(items) do
    fornow = cJson:Parse(items[x+1])
    --wait, actually, I think imma start working on playerdata first
end
end