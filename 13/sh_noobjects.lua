local PLUGIN = {}
PLUGIN.Title = "No Spawning Entities"
PLUGIN.Description = "Disables spawning of all entities. Good for a minge class."
PLUGIN.Author = "ArchTek"
PLUGIN.Privileges = { "Can Spawn Objects" }

function PLUGIN:PlayerSpawnObject( ply )
	if IsValid(ply) and !ply:EV_HasPrivilege( "Can Spawn Objects" ) then
		return false
	end
end
function PLUGIN:PlayerSpawnSENT( ply )
	if IsValid(ply) and !ply:EV_HasPrivilege( "Can Spawn Objects" ) then
		return false
	end
end
function PLUGIN:PlayerSpawnVehicle( ply )
	if IsValid(ply) and !ply:EV_HasPrivilege( "Can Spawn Objects" ) then
		return false
	end
end
function PLUGIN:PlayerSpawnNPC( ply )
	if IsValid(ply) and !ply:EV_HasPrivilege( "Can Spawn Objects" ) then
		return false
	end
end
evolve:RegisterPlugin( PLUGIN )