--[[
	Developed by `impulse.
]]--

local PLUGIN = {}

PLUGIN.Title = "Event Log"
PLUGIN.Description = "Adds a message to applicable players' console about events such as prop spawning."
PLUGIN.Author = "`impulse"
PLUGIN.Privileges = { "See Event Log" }
	
function PLUGIN:SendLogEvent( ply, text )

	for k, v in pairs( player.GetAll() ) do
	
		if v:EV_HasPrivilege( "See Event Log" ) then
		
			v:PrintMessage( HUD_PRINTCONSOLE, ply:Name() .. " <" .. ply:SteamID() .. "> " .. text )
			
		end
		
	end
	
end

function PLUGIN:PlayerSpawnedProp( ply, model )

	local text = "has spawned a prop with model: " .. model
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnEffect( ply, model )

	local text = "has spawned an effect with model: " .. model
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnNPC( ply, class, weapon )

	local text = "has spawned an NPC with class: " .. class
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnRagdoll( ply, model, ent )

	local text = "has spawned a ragdoll with model: " .. model
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnSENT( ply, class )

	local text = "has spawned a SENT with class: " .. class
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnSWEP( ply, class, wep )

	local text = "has spawned a SWEP with class: " .. class
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerSpawnVehicle( ply, model, class, vehicle )

	local text = "has spawned a vehicle with model: " .. model
	PLUGIN:SendLogEvent( ply, text )
	
end

function PLUGIN:PlayerInitialSpawn( ply )

	local text = "has connected to the server."
	PLUGIN:SendLogEvent( ply, text )
	
end

-- I could've used the PlayerDisconnected hook, but it isn't always called when the player disconnects. This should work fine.
function PLUGIN:EntityRemoved( ent )

	if ent:IsPlayer() then
	
		local text = "has dropped from the server."
		PLUGIN:SendLogEvent( ent, text )
		
	end
	
end

evolve:RegisterPlugin( PLUGIN )