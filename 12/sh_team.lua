/*-------------------------------------------------------------------------------------------------------------------------
	Set the health of a player
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Team"
PLUGIN.Description = "Set the team of a player."
PLUGIN.Author = "Dark Herald"
PLUGIN.ChatCommand = "team"
PLUGIN.Usage = "<players> [team]"
PLUGIN.Privileges = { "SetTeam" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "SetTeam" ) ) then
		local players = evolve:FindPlayer( args, ply, true )
		local id = self:GetTeam( args[ #args ] )

		if !id then evolve:Notify( ply, evolve.colors.red, "No found team with index " .. args[ #args ] ) return end
		
		for _, pl in ipairs( players ) do
			pl:SetTeam( id )
		end
		
		if ( #players > 0 ) then
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has set the team of ", evolve.colors.red, evolve:CreatePlayerList( players ), evolve.colors.white, " to ", team.GetColor(id), team.GetName(id), evolve.colors.white, "." )
		else
			evolve:Notify( ply, evolve.colors.red, evolve.constants.noplayers )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

function PLUGIN:GetTeam( arg )
	for ID,Team in pairs(team.GetAllTeams()) do
		if Team.Name == arg or ID == tonumber(arg) then return ID end
	end
	
	return nil
end

function PLUGIN:Menu( arg, players )
	if ( arg ) then
		table.insert( players, arg )
		RunConsoleCommand( "ev", "team", unpack( players ) )
	else
		args = {}
		local i = 1
		for _,team in pairs(team.GetAllTeams()) do
			args[i] = { team.Name }	i = i + 1
		end
		return "Team", evolve.category.actions, args
	end
end

evolve:RegisterPlugin( PLUGIN )