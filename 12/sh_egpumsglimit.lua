/*-------------------------------------------------------------------------------------------------------------------------
	Kick a player
-------------------------------------------------------------------------------------------------------------------------*/
-----------------------------------------------------------------------------
local PLUGIN = {}
PLUGIN.Title = "EGP UMSG Limiter"
PLUGIN.Description = "Change the amount of UMSG's per secound from an EGP screen."
PLUGIN.Author = "Northdegree"
PLUGIN.ChatCommand = "maxegpumsg"
PLUGIN.Usage = "<Amount of UMSGs/s>"
PLUGIN.Privileges = { "EGPUMsgLimit" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "EGPUMsgLimit" ) ) then
		local egpumsglimit = tonumber(args[1])
		if egpumsglimit then
			if egpumsglimit >= 10 then
				RunConsoleCommand("wire_egp_max_umsg_per_sec", egpumsglimit)
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has set the EGP UMSG limit to ".. egpumsglimit .."!")
			else
				evolve:Notify( ply, evolve.colors.red, "The number of User messages must be equal or higher 10!")
			end
		else
			evolve:Notify( ply, evolve.colors.red, "The number of User messages must be a number!")
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )