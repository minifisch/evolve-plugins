/*-------------------------------------------------------------------------------------------------------------------------
	Run a console command on the server
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Password"
PLUGIN.Description = "Set the server password."
PLUGIN.Author = "Mr.Faul"
PLUGIN.ChatCommand = "pw"
PLUGIN.Usage = "<password>"
PLUGIN.Privileges = { "Password" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Password" ) ) then		
		if ( #args > 0 ) then
			RunConsoleCommand( "sv_password",args[1] )
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " sets password to ", evolve.colors.red, "...???", evolve.colors.white, "." )
		else
			RunConsoleCommand( "sv_password","")
			evolve:Notify( ply, evolve.colors.red, "Password revoked." )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )