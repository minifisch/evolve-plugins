/*-------------------------------------------------------------------------------------------------------------------------
	Enable ragdolling for a plyayer without ability to ragdoll/unragdoll others.
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Self Ragdoll"
PLUGIN.Description = "Player can ragdoll/unragdoll Him/Herself"
PLUGIN.Author = "Yabba"
PLUGIN.ChatCommand = "sr"
PLUGIN.Usage = "[1/0]"
PLUGIN.Privileges = { "Self Ragdoll" }
local enabled
function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Self Ragdoll" ) ) then
		enabled = !enabled

	if ( enabled ) then
				if ( !ply.EV_Ragdolled and ply:Alive() ) then
					ply:DrawViewModel( false )
					ply:StripWeapons()
					
					local doll = ents.Create( "prop_ragdoll" )
					doll:SetModel( ply:GetModel() )
					doll:SetPos( ply:GetPos() )
					doll:SetAngles( ply:GetAngles() )
					doll:Spawn()
					doll:Activate()
					
					ply.EV_Ragdoll = doll
					ply:Spectate( OBS_MODE_CHASE )
					ply:SpectateEntity( ply.EV_Ragdoll )
					ply:SetParent( ply.EV_Ragdoll )
					
					ply.EV_Ragdolled = true
				end
			else
				ply:SetNoTarget( false )
				ply:SetParent()
				ply.EV_Ragdolled = false
				ply:Spawn()
			end
			
	if ( enabled ) then
		evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has ragdolled ", evolve.colors.red, "Him/Herself", evolve.colors.white, "." )
	else
		evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has unragdolled ", evolve.colors.red, "Him/Herself", evolve.colors.white, "." )
	end
		
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )