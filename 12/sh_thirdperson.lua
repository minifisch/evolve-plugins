local PLUGIN = {}
PLUGIN.Title = "Third Person"
PLUGIN.Description = "Allows players to toggle third person view."
PLUGIN.Author = "Alan Edwardes"
PLUGIN.ChatCommand = "thirdperson"
PLUGIN.Usage = "[1/0]"
PLUGIN.Privileges = { "Third Person" }

function PLUGIN:CalcView( ply, pos, angles, fov )
	if ply.EV_ThirdPerson then
		return {
			origin = pos-(angles:Forward()*100),
			angles = angles,
			fov = fov
		}
	end
end

function PLUGIN:ShouldDrawLocalPlayer( ply )
	if ply.EV_ThirdPerson then return true end
end

function PLUGIN:PlayerInitialSpawn( ply )
	timer.Create("SetThirdPersonViewLoadIn", 5, 1, function()
		--[[
			For some reason you can't add to the player
			table before the player has completely loaded
			in, so delay it 5 seconds.
		]]--
		self:SetThirdPersonView( ply, ply:GetProperty( "ThirdPersonView" ) )
	end )
end

function PLUGIN:SetThirdPersonView( ply, setting )
	if setting ~= nill then
		ply:SendLua("LocalPlayer().EV_ThirdPerson = " .. tostring(setting) )
	end
end

function PLUGIN:Call( ply, args )
	if ply:EV_HasPrivilege( "Third Person" ) then
		if args[1] == "0" then
			ply:SetProperty( "ThirdPersonView", false )
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " switched to first person view." )
			self:SetThirdPersonView( ply, false )
		else
			ply:SetProperty( "ThirdPersonView", true )
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " switched to third person view." )
			self:SetThirdPersonView( ply, true )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )

local PLUGIN = {}
PLUGIN.Title = "First Person"
PLUGIN.Description = "So players can just type !firstperson to return to normal."
PLUGIN.Author = "Alan Edwardes"
PLUGIN.ChatCommand = "firstperson"

function PLUGIN:Call( ply, args )
	ply:SetProperty( "ThirdPersonView", false )
	evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " switched to first person view." )
	ply:SendLua( "LocalPlayer().EV_ThirdPerson = false" )
end

evolve:RegisterPlugin( PLUGIN )