local PLUGIN = {}
PLUGIN.Title = "ABAH"
PLUGIN.Description = "A Basic Anti Hack"
PLUGIN.Author = "Clark"
PLUGIN.Usage = nil
PLUGIN.Privileges = nil

function PLUGIN:PlayerInitialSpawn( ply )
	print(" [A] [B]asic [A]nti [H]ack -- loaded " )
	ply:SendLua([[ table.remove(FapHackFiles, 1 ) ]] )
	ply:SendLua([[ table.remove(FapHackFiles, 2 ) ]] )
	ply:SendLua([[ table.remove(FapHackFiles, 3 ) ]] )
	ply:SendLua([[ table.remove(FapHackFiles, 4 ) ]] )
	ply:SendLua([[ table.remove(FapHackFiles, 5 ) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_enabled", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_friendlyfire", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_targetnpcs", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_autofire", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_autoreload", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_bonemode", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_targetfriends", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_targetsteamfriends", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_targetmode", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_maxdistance", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_targetadmins", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_antisnap", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_norecoil", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_antisnapspeed", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_aim_maxangle", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_enabled", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_material", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_drawweapons", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_maxdistance", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_crosshair", false, true, true) ]] )
	ply:SendLua([[ CreateConVar("fap_esp_textinfo", false, true, true) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("esp_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("aimbot_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+aimbot_scan")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+falco_zoom")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+fzoom")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_ESPConfig")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_xray")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_light")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_nightvision")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_xrayvision")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("JBF_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+BUTTFUCK")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+zoom2")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggleradar")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_wallers")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("aa_toggle")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+nBot")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+asb")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("wots_togglewireframe")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("wots_toggleesp")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+wots_spinhack")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_spectate")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+aa")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("Fap_Menu")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("fap_reload")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("fap_aim_toggle")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+fap_aim")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("-fap_aim")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+fap_esp")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("-fap_esp")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("esp_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("aimbot_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+aimbot_scan")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+falco_zoom")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+fzoom")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_ESPConfig")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_xray")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_light")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_nightvision")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_xrayvision")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("JBF_on")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+BUTTFUCK")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+zoom2")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggleradar")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("toggle_wallers")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("aa_toggle")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+nBot")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+asb")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("wots_togglewireframe")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("wots_toggleesp")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+wots_spinhack")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("falco_spectate")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()concommand.Remove("+aa")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","AIMBOT")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","PaintBotNotes")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","BANNANANAPHONEEEEEE")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","NamesOnTEHHeads")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","JBF")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","Cam.DrawRender")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","JS.DrawRadar")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","MawESPOmg")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","gspHUD_DrawRadar")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","PaintCCTV")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","FSpectatePermanentScreens")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove("HUDPaint","RadiusFDetector")end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "CreateMove", "FapHack.Aim" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "HUDPaint", "FapHack.DrawCurrentTarget" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "Think", "FapHack.AutoReload" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "Think", "FapHack.AutoFire" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "Think", "FapHack.NoRecoil" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "OnPlayerChat", "FapHack.Respond" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "HUDPaint", "FapHack.ESP" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "HUDPaint", "FapHack.DrawRadar" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "RenderScreenspaceEffects", "FapHack.RenderTargets" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "PrePlayerDraw", "FapHack.PrePlayerDraw" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "HUDPaint", "FapHack.RenderScreenspaceEffects" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "PostPlayerDraw", "FapHack.PostPlayerDraw" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "CalcView", "FapHack.CorrectView" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "OnEntityCreated", "AddPlayer" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "EntityRemoved", "RemovePlayer" )end) ]] )
	ply:SendLua([[ timer.Create(tostring(math.random(90000)),1,0,function()pcall(function() hook.Remove( "OnEntityCreated", "AddEnt" )end) ]] )
end

evolve:RegisterPlugin( PLUGIN )