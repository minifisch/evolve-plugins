/*-------------------------------------------------------------------------------------------------------------------------
	This command stops serverlags. Very useful if crappy adv-dupe shit was spawned and fucked up the server.
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Stop-Lag"
PLUGIN.Description = "Freezes all props and entitys at once."
PLUGIN.Author = "minifisch"
PLUGIN.ChatCommand = "stoplag"
PLUGIN.Privileges = { "StopLag" }

function PLUGIN:Call( ply )
	if ( ply:EV_HasPrivilege( "StopLag" ) ) then
		local Ent = ents.FindByClass("prop_physics*")
		Ent = table.Add(Ent, ents.FindByClass("prop_vehicle*"))
		Ent = table.Add(Ent, ents.FindByClass("base_gmodentity"))
		Ent = table.Add(Ent, ents.FindByClass("gmod_*"))
		local x = 0
		for _,Ent in pairs(Ent) do
			if Ent:IsValid() then
				local phys = Ent:GetPhysicsObject()
				if( phys:IsValid() && phys:IsMoveable()) then
					phys:EnableMotion( false )
					x = x+1
				end
			end
		end
		evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has frozen " .. tostring(x) .. " entitys on the server." )
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end
evolve:RegisterPlugin( PLUGIN )