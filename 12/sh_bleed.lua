/*-------------------------------------------------------------------------------------------------------------------------
	Bleed a Players Ear
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Bleed"
PLUGIN.Description = "Bleed People's Ears"
PLUGIN.Author = "Vendetta"
PLUGIN.ChatCommand = "bleed"
PLUGIN.Usage = "[players] [1/0]"
PLUGIN.Privileges = { "Bleed" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Bleed" ) ) then
		local players = evolve:FindPlayer( args, ply, true )
		local enabled = ( tonumber( args[ #args ] ) or 1 ) > 0
		
		for _, pl in ipairs( players ) do
			if ( enabled ) then
				pl:ConCommand( "play synth/square_880.wav" )
			else
				pl:ConCommand( "play nothing.wav" )
			end
		end
		
		if ( #players > 0 ) then
			if ( enabled ) then
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " is making ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, " ears bleed!" )
			else
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " stopped ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, " ears from bleeding!" )
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
		RunConsoleCommand( "ev", "bleed", unpack( players ) )
	else
		return "Bleed", evolve.category.punishment, { { "Enable", 1 }, { "Disable", 0 } }
	end
end

evolve:RegisterPlugin( PLUGIN )