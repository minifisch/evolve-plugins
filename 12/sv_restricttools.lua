local Plugin = {}
Plugin.Title = "Tool Restricter"
Plugin.Description = "Restricts certain tools from users who don't have the permissions"
Plugin.Author = "Tom"
Plugin.Privileges = { "Use Restricted Tools" }

//READ ME!!!!!!!!!!!!!!!!!!!!!!!!!
//For this to display the grey color, you need to go to ev_framework.lua in the Evolve
//folder under addons, and add this piece of code under evolve.colors.red:
//evolve.colors.grey = Color( 125, 131, 125, 255 )

//It should look like this:

/*

evolve.colors.blue = Color( 98, 176, 255, 255 )
evolve.colors.red = Color( 255, 62, 62, 255 )
evolve.colors.grey = Color( 125, 131, 125, 255 )
evolve.colors.white = color_white

*/

//ENJOY THE PLUGIN!

local RestrictedTools = {
"ignite",
"rtcamera" //You can change these.
}

function Plugin:CanTool( ply, tr, tool )
	if table.HasValue( RestrictedTools, tool ) then
		if !( ply:EV_HasPrivilege( "Use Restricted Tools" ) then
			evolve:Notify( ply, evolve.colors.grey, "You lack the required permissions to use this tool." )
			return false
		else
			return true
		end
	end
end

evolve:RegisterPlugin( Plugin )