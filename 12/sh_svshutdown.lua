local PLUGIN = {}
PLUGIN.Title = "Server Shutdown"
PLUGIN.Description = "Shuts the server down."
PLUGIN.Author = "Muffin Burglar"
PLUGIN.ChatCommand = "shutdown"
PLUGIN.Usage = ""
PLUGIN.Privileges = { "Server shutdown" }

function PLUGIN:Call( plyer, args )
	if ( plyer:EV_HasPrivilege( "Server shutdown" ) ) then
			RunConsoleCommand( "killserver" )
			evolve:Notify( evolve.colors.blue, plyer:Nick(), evolve.colors.white, " is shutting down the server.")
	else
		evolve:Notify( plyer, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )