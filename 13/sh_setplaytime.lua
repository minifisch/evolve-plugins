/*-------------------------------------------------------------------------------------------------------------------------
	Set the frags of a player
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "SetPlayTime"
PLUGIN.Description = "Set the play time of a player in hours."
PLUGIN.Author = "Wrex"
PLUGIN.ChatCommand = "playtime"
PLUGIN.Usage = "<players> [ammount]"
PLUGIN.Privileges = { "Setplaytime" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Setplaytime" ) ) then
		local players = evolve:FindPlayer( args, ply, true )
		local startamount = tonumber( args[ #args ] ) or 0
		local amount = startamount * 3600
		
		
		
		for _, pl in ipairs( players ) do
			pl:SetProperty( "PlayTime" , amount)
			pl:SetNWInt( "EV_PlayTime", amount or 0 )
		end
		
		if ( #players > 0 ) then
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has set the play time of ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, " to " .. startamount .. " hour(s)." )
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
		RunConsoleCommand( "ev", "playtime", unpack( players ) )
	else
		args = {}
		for i = 0, 20 do
			args[i+1] = { i }
		end
		return "PlayTime", evolve.category.actions, args
	end
end

evolve:RegisterPlugin( PLUGIN )