/*-------------------------------------------------------------------------------------------------------------------------
	Enable flyclip for someone
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Flyclip"
PLUGIN.Description = "Enable fly for a player."
PLUGIN.Author = "Dr.Kleiner; Spirit"
PLUGIN.ChatCommand = "flyclip"
PLUGIN.Usage = "[players] [1/0]"
PLUGIN.Privileges = { "fly", "flyclip access" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Noclip" ) ) then
		local players = evolve:FindPlayer( args, ply, true )
		local enabled = ( tonumber( args[ #args ] ) or 1 ) > 0
		
		for _, pl in ipairs( players ) do
			if ( enabled ) then pl:SetMoveType( MOVETYPE_FLY ) else pl:SetMoveType( MOVETYPE_WALK ) end
		end
		
		if ( #players > 0 ) then
			if ( enabled ) then
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has flyed ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, "." )
			else
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has un-flyed ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, "." )
			end
		else
			evolve:Notify( ply, evolve.colors.red, evolve.constants.noplayers )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

function PLUGIN:Menu( arg, players )
	if ( arg ) then
		table.insert( players, arg )
		RunConsoleCommand( "ev", "flyclip", unpack( players ) )
	else
		return "Fly", evolve.category.actions, { { "Enable", 1 }, { "Disable", 0 } }
	end
end

function PLUGIN:PlayerNoClip( ply )
	if ( SERVER and !ply:EV_HasPrivilege( "flyclip access" ) ) then return false end
end

evolve:RegisterPlugin( PLUGIN )