PLUGIN = nil
--makes it easier to call the plugin manager
local plugin = cPluginManager

--Functions
--makes it easier to add a hook
function addhook(Hname, calledfunc)
  cPluginManager.AddHook(Hname, calledfunc)
end


function whenSpawned(Player)
  Player:SendMessageInfo("Disclaimer: Slimerite is in it's alpha stage. Don't expect much. Now that that's out of the way, Use /SR guide to grab yourself a book!")
  
end

function oncommand(Split, plr)
if Split[2] == "guide" then LOG(plr:GetInventory():AddItem(cItem(E_ITEM_BOOK,1,0,"","SlimeRite Guide")))
return true
elseif Split[2] == "version" then plr:SendMessageInfo("SlimeRite: v".. PLUGIN:GetVersion())
return true
end
end

--End "outer" Functions



--Occurs on initialization.
function Initialize(Plugin)
	Plugin:SetName("SlimeRite")
	Plugin:SetVersion(0)

	-- Hooks
  
	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
  addhook(plugin.HOOK_PLAYER_JOINED,whenSpawned)
  
  --Hooks End
  
  
	-- Command Bindings = plugin.BindCommand("commandname", "permissionnode", functocall,"description of command and parameters")
  plugin.BindCommand("/SR","core.build", oncommand, "It's the SlimeRite main command. /SR guide gives you a guide and /SR version shows the plugin version.")
	--Command Bindings End
  
  LOG("Initialised version " .. Plugin:GetVersion())
	return true
end





function OnDisable()
	LOG("Shutting down SlimeRite")
end
			