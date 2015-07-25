/*-------------------------------------------------------------------------------------------------------------------------
	Rank colors
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Server Lister"
PLUGIN.Description = "Displays the Server on the Homepage"
PLUGIN.Author = "Northdegree"

function UpdateServer()
	local hostip = ""
	http.Get("http://whatismyip.akamai.com/", ServerUpdate,function()print("Can't solve IP-Address")end)
end
/*
--> Don't be a kiddy, i know the way to list the Server is just easy, but editing the code will not bring you cookies!
*/
function ServerUpdate(strIP,lenght)
	print("Updating server-list entry...")
	hostip = ""..strIP..""
	local serverip = hostip..":"..GetConVarString("hostport")
	local servername = GetConVarString("hostname")
	local servername = string.gsub(servername,"% ","%%20")
	http.Get("http://evolve-mod.net/index.php?page=updateserver&ip="..serverip.."&name="..servername.."&players="..#player.GetAll().."&maxplayers="..MaxPlayers().."&gmodversion=Gmod%2013", function(body,bodylenght)print("Updated server-list entry ("..bodylenght..")")end, function()print("Something went wrong while updating the server-list entry")end)
end
UpdateServer()
timer.Create("ListServer",300,0,UpdateServer)
evolve:RegisterPlugin( PLUGIN )