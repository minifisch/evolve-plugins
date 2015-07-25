/*-------------------------------------------------------------------------------------------------------------------------
	!afk command
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "AFK"
PLUGIN.Description = "Show your status as AFK."
PLUGIN.Author = "Matt J"
PLUGIN.ChatCommand = "afk"
PLUGIN.Privileges = { "afk" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "afk" ) ) then
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " is now AFK.")
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )

/*-------------------------------------------------------------------------------------------------------------------------
     !back command
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Back"
PLUGIN.Description = "Show your status as not being AFK."
PLUGIN.Author = "Matt J"
PLUGIN.ChatCommand = "back"
PLUGIN.Privileges = { "back" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "back" ) ) then
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " is no longer AFK.")
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )