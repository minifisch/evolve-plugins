local PLUGIN = {}
PLUGIN.Title = "Sprays"
PLUGIN.Description = "Displays names of players who drew sprays. Allows immediate spraying for players who has privilege."
PLUGIN.Author = "Vigilante"
PLUGIN.Privileges = { "Immediate spraying" }

if CLIENT then
	function PLUGIN:Initialize()
		EV_Sprays = {}
		
		local function UpdateSprays( um )
			EV_Sprays[ um:ReadString() ] = um:ReadVector()
		end
		
		usermessage.Hook( "EV_UpdateSprays", UpdateSprays )
	end
	
	function PLUGIN:HUDPaint()
		for name, position in pairs( EV_Sprays ) do
			if position:Distance( LocalPlayer():GetEyeTrace().HitPos ) < 48 then
				draw.SimpleText( "Sprayed by: " .. name, "Trebuchet24", 10, ScrH() / 2, Color( 255, 0, 0 ), 0, 1 )
				break
			end
		end
	end
end

if SERVER then
	function PLUGIN:PlayerSpray( ply )
		umsg.Start( "EV_UpdateSprays" )
			umsg.String( ply:Name() )
			umsg.Vector( ply:GetEyeTraceNoCursor().HitPos )
		umsg.End()
	end
	
	function PLUGIN:Think()
		for _, ply in pairs( player.GetAll() ) do
			if ply:EV_HasPrivilege( "Immediate spraying" ) then
				ply:AllowImmediateDecalPainting()
			end
		end
	end
end

evolve:RegisterPlugin( PLUGIN )