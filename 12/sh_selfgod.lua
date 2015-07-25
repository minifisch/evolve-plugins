/*-------------------------------------------------------------------------------------------------------------------------
	Enable godmode for a player without ability to god/ungod others.
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Self Godmode"
PLUGIN.Description = "Player can god/ungod Him/Herself"
PLUGIN.Author = "Hemirox"
PLUGIN.ChatCommand = "selfgod"
PLUGIN.Usage = "[1/0]"
PLUGIN.Privileges = { "Self God" }
local enabled
function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Self God" ) ) then
		enabled = !enabled

	if ( enabled ) then ply:GodEnable() else ply:GodDisable() end
	ply.EV_GodMode = enabled
		
	if ( enabled ) then
		evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has enabled godmode for ", evolve.colors.red, "Him/Herself", evolve.colors.white, "." )
	else
		evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has disabled godmode for ", evolve.colors.red, "Him/Herself", evolve.colors.white, "." )
	end
		
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

function PLUGIN:PlayerSpawn( ply )
	if ( ply.EV_GodMode ) then ply:GodEnable() end
end

evolve:RegisterPlugin( PLUGIN )