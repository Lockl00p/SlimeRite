local const = {}
const.pathseparator = cFile:GetPathSeparator()

const.pdatapath = cPluginManager:GetPluginsPath().. const.pathseparator.."SlimeRite"..const.pathseparator.. "playerdata"..const.pathseparator

const.pluginpath = cPluginManager:GetPluginsPath()..

const.pathseparator.."SlimeRite"..const.pathseparator

const.guide = cItem(E_ITEM_BOOK,1,0,"","SlimeRite Guide")

const.emptyitem = cItem(160,1,15,"","-")

const.plrdatatemplate = cJson:Serialize({uname = "", categoriesunlocked = "0,1,2", ItemsUnlocked = "0-1,"},{indentation = "   "})

return const