/*-------------------------------------------------------------------------------------------------------------------------
	Player Info
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Reserved Slot"
PLUGIN.Description = "Kick a player if he doesn't have Slot rights and uses a reserved Slot."
PLUGIN.Author = "Northdegree"
PLUGIN.Privileges = { "Rslotaccess" }

function PLUGIN:PlayerSpawn( ply )
	local ReservedSlots = 2    -- Set the reserved Slots here
	local MaxSlots = game.MaxPlayers()
	if MaxSlots >= 3 then
		local CurPlayers = #player.GetAll()
		local GetMaxPlayers = MaxSlots - ReservedSlots
		if CurPlayers > GetMaxPlayers then
			if not ( ply:EV_HasPrivilege( "Rslotaccess" ) ) then
				ply:Kick("Sorry, you are using a reserved Slot. You were Kicked.")
			end
		end
	else
		MsgN("The Reserved Slot Plugin is now deactivated. You must have 3 or more Slots")
	end
end

evolve:RegisterPlugin( PLUGIN )