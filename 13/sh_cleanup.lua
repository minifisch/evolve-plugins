/*-------------------------------------------------------------------------------------------------------------------------
	Vote for a map
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Vote Cleanup"
PLUGIN.Description = "Vote for a map cleanup."
PLUGIN.Author = "Northdegree/Feha"
PLUGIN.ChatCommand = "cleanup"
PLUGIN.Usage = ''
PLUGIN.Privileges = { "Votecleanup" }
PLUGIN.Maps = {}
PLUGIN.Votes = {}
PLUGIN.Voters = {}

-- Initialization
function PLUGIN:Initialize()
	CreateConVar("ev_cleanup_percent","0.6") --How many percent of the players that have to vote foa a server cleanup
	CreateConVar("ev_cleanup_delay","30") --How many seconds after a voted cleanup before it takes evffect
end
function PLUGIN:Call( ply, args )
	if (ply:EV_HasPrivilege( "Votemap" )) then
		if (!timer.Exists( "evolve_cleanup" )) then
			local votesLeft = self:GetVotesNeeded() - self:GetVotes() - 1
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " voted for ", evolve.colors.red, "a server Cleanup (", evolve.colors.red, tostring(votesLeft), evolve.colors.white, " more votes needed.)" )
			self:AddVote()
		else
			evolve:Notify( ply, evolve.colors.red, "Already waiting for a cleanup." )
		end
	end
end
function PLUGIN:PlayerSpawn( ply )
end
function PLUGIN:AddVote()
	if (!ev_cleanupVotes) then
		ev_cleanupVotes = 0
	end
	ev_cleanupVotes = ev_cleanupVotes + 1
	
	self:CheckVote()
end

function PLUGIN:RemoveVote()
	if (!ev_cleanupVotes) then
		ev_cleanupVotes = 0
	end
	
	ev_cleanupVotes = ev_cleanupVotes - 1
end

function PLUGIN:GetVotes()
	if (!ev_cleanupVotes) then
		ev_cleanupVotes = 0
	end
	
	return tonumber(ev_cleanupVotes)
end

function PLUGIN:GetVotesNeeded( )
	return tonumber(math.Round(#player.GetAll() * tonumber(GetConVarString("ev_cleanup_percent"))))
end

function PLUGIN:CheckVote()
	if (ev_cleanupVotes >= PLUGIN:GetVotesNeeded( )) then
		local delay = tonumber(GetConVarString("ev_cleanup_delay"))
		evolve:Notify( evolve.colors.red, "Warning:", evolve.colors.white, " Cleaning up the map in ", evolve.colors.red, tostring(delay), evolve.colors.white, " seconds." )
		timer.Create( "evolve_cleanup", delay, 1, function()
			game.CleanUpMap();
			ev_cleanupVotes=0
		end)
	end
end

evolve:RegisterPlugin( PLUGIN )