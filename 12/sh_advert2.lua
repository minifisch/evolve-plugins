local PLUGIN = {}
PLUGIN.Title = "Advert"
PLUGIN.Description = "Places a advert every x mins/seconds in chat."
PLUGIN.Author = "TheCreeper-client frontend by SariaFace"
PLUGIN.ChatCommand = "advert"
PLUGIN.Usage = "[message][interval][r][g][b]"
PLUGIN.Privileges = { "Advert" }

local interval = 300
local message = "Insert your advertisement message here!"
local colour = Color( 0, 0, 255, 255 )

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Advert" ) ) then
		local numargs = #args
		if (numargs > 5 ) then
			message = table.concat(args, " ", 1, numargs - 4)
		else
			message = args[1]
		end
		interval = tonumber(args[numargs - 3])
		colour = Color( tonumber(args[numargs - 2]), tonumber(args[numargs - 1]), tonumber(args[numargs]), 255 )
		if ( interval > 0) then
			timer.Remove("AdTimer")
			timer.Create("AdTimer", interval,  0, function() evolve:Notify( colour, message ) end)
			evolve:Notify(ply, colour, "Advert message set to " .. message .. " at a " .. tostring(interval) .. " second interval." )
		else
			timer.Remove("AdTimer")
			evolve:Notify( colour, "Advert message has been deactivated" )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end



evolve:RegisterPlugin( PLUGIN )