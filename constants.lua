local const = {}
const.pathseparator = cFile:GetPathSeparator()

const.pdatapath = cPluginManager:GetPluginsPath().. const.pathseparator.."SlimeRite"..const.pathseparator.. "playerdata"..const.pathseparator

const.pluginpath = cPluginManager:GetPluginsPath().. const.pathseparator.."SlimeRite"..const.pathseparator

const.guide = cItem(E_ITEM_BOOK,1,0,"","SlimeRite Guide")

const.emptyitem = cItem(160,1,15,"","-")

const.plrdatatemplate = cFile:ReadWholeFile(const.pluginpath.."PdataTemplate.json")
const.Catfolder = const.pluginpath.."Categories"..const.pathseparator
const.Itemfolder = const.pluginpath.."Items"..const.pathseparator
const.Machinefolder = const.pluginpath.."Machines"..const.pathseparator



return const