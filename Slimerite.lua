PLUGIN = nil


--makes it easier to call the plugin manager

plugin = cPluginManager

const = require("constants")

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
  initguide()
	-- Hooks
  
	PLUGIN = Plugin -- NOTE: only needed if you want OnDisable() to use GetName() or something like that
  addhook(plugin.HOOK_PLAYER_JOINED,whenSpawned)
  addhook(plugin.HOOK_PLAYER_RIGHT_CLICK,onRClick)
  addhook(plugin.HOOK_TAKE_DAMAGE,OnTakeDamage)
  --Hooks End
  
  
  
	-- Command Bindings = plugin.BindCommand("commandname", "permissionnode", functocall,"description of command and parameters")
  plugin.BindCommand("/SR","core.build", oncommand, "It's the SlimeRite main command. /SR guide gives you a guide and /SR version shows the plugin version.")
	--Command Bindings End
  
  LOG("Initialised version " .. Plugin:GetVersion())
  LOG("Thanks, TheBusyBiscuit for creating the original slimefun!")
  LOG("In respect to TBB, here's the link to official SF4: https://github.com/Slimefun/Slimefun4")
	return true
end

--For the sake of I don't wanna make this a complicated hellhole, I'm about to use other lua files.
--Also, Ifeel like ruining someone
function OnTakeDamage(Receiver, TDI)
	LOG("Damage: Raw ".. TDI.RawDamage .. ", Final:" .. TDI.FinalDamage);

	-- If the attacker is a spider, make it deal 999 points of damage (insta-death spiders):
	if ((TDI.Attacker ~= nil) and TDI.Attacker:IsA("cWither")) then
		TDI.FinalDamage = 15;
	end
end


function OnDisable()
	LOG("Shutting down SlimeRite")
end
			