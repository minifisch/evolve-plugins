/*-------------------------------------------------------------------------------------------------------------------------
	GeoIP
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "GeoIP"
PLUGIN.Description = "Gives you a player's country based on their IP address when they load in."
PLUGIN.Author = "Alan Edwardes" -- alanedwardes.com/contact
PLUGIN.ChatCommand = nil

function PLUGIN:PlayerGeoIP( ply )
	http.Get("http://api.hostip.info/get_html.php?ip=" .. ply:IPAddress(), "",
		function ( args, contents, size )
			ply = args[1]
			for line in contents:gmatch( "[^\r\n]+" ) do
				Country = line:gsub( "Country:", "" )
				-- Just grab the first line. Couldn't find an easier way to do that.
				break
			end
			-- Remove all text between brackets
			Country = Country:gsub( "%b()", "" )
			-- Make Title Case: http://lua-users.org/wiki/StringRecipes
			Country = Country:gsub( "(%a)([%w_']*)", function( first, rest )
				return first:upper() .. rest:lower()
			end )
			-- Trim whitespace
			Country = Country:gsub( "^%s*(.-)%s*$", "%1" )
			if Country ~= '' then
				-- Because the string was trimmed, if we haven't got a country name we will have an empty stirng. Don't echo if so.
				evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " is from ", evolve.colors.red, Country, evolve.colors.white, "." )
			end
		end
	, ply )
end

function PLUGIN:PlayerSpawn( ply )
	if ( ply.EV_GeoIP_Pending ) then
		-- Prevent the check firing on every spawn (i.e. after death)
		self:PlayerGeoIP( ply )
		ply.EV_GeoIP_Pending = false
	end
end

function PLUGIN:PlayerInitialSpawn( ply )
	ply.EV_GeoIP_Pending = true
end

evolve:RegisterPlugin( PLUGIN )