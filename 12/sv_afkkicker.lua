/*-------------------------------------------------------------------------------------------------------------------------
	AFK Kicker
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "AFK Kicker"
PLUGIN.Description = "Kicks people who seem to be AFK."
PLUGIN.Author = "Overv"
PLUGIN.Privileges = { "Not AFK kicked" }

function PLUGIN:PlayerSpawn( ply )
	ply.EV_AFKTime = os.time()
end

function PLUGIN:KeyPress( ply )
	ply.EV_AFKTime = os.time()
end

function PLUGIN:PlayerSay( ply )
	ply.EV_AFKTime = os.time()
end

function PLUGIN:Think()
	for _, pl in ipairs( player.GetAll() ) do
		if ( pl:GetAngles() != pl.EV_AFKAngles ) then
			pl.EV_AFKTime = os.time()
			pl.EV_AFKAngles = pl:GetAngles()
		end
		
		if ( !pl:EV_HasPrivilege( "Not AFK kicked" ) and pl.EV_AFKTime and os.time() - pl.EV_AFKTime > 300 ) then
			if ( gatekeeper ) then
				gatekeeper.Drop( pl:UserID(), "AFK" )
			else
				pl:Kick( "AFK" )
			end
		end
	end
end

evolve:RegisterPlugin( PLUGIN )