local const = {}
const.pathseparator = cFile:GetPathSeparator()

const.featurepath = cPluginManager:GetPluginsPath().. const.pathseparator.."SlimeRiteThings" 

const.pluginpath = cPluginManager:GetPluginsPath()..

const.pathseparator.."SlimeRite"..const.pathseparator

const.guide = cItem(E_ITEM_BOOK,1,0,"","SlimeRite Guide")
return const