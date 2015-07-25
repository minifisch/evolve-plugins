
local PLUGIN = {};

PLUGIN.Title = "Spawnpoint";
PLUGIN.Description = "Set your spawnpoint.";
PLUGIN.Author = "DarKSunrise";
PLUGIN.ChatCommand = "spawnpoint";
PLUGIN.Usage = "[reset, type anything to reset spawnpoint]";
PLUGIN.Privileges = {"Set and reset spawnpoint",}

PLUGIN.spawnpoints = {};

function PLUGIN:Call(ply, args)
	if(not ply:EV_HasPrivilege("Set and reset spawnpoint")) then
		evolve:Notify(ply, evolve.colors.red, evolve.constants.notallowed);
		return;
	end
	
	if(table.concat(args, " ") == "") then
		evolve:Notify(ply, evolve.colors.white, "Your ", evolve.colors.blue, "spawnpoint ", evolve.colors.white, "has been ", evolve.colors.blue, "set", evolve.colors.white, "!");
		
		self.spawnpoints[ply] = {
			pos = ply:GetPos(),
			ang = ply:EyeAngles()
		};
	else
		evolve:Notify(ply, evolve.colors.white, "Your ", evolve.colors.blue, "spawnpoint ", evolve.colors.white, "has been ", evolve.colors.red, "reset", evolve.colors.white, "!");
		
		self.spawnpoints[ply] = nil;
	end
end

function PLUGIN:PlayerSpawn(ply)
	if(self.spawnpoints[ply] and ply:EV_HasPrivilege("Set and reset spawnpoint")) then
		ply:SetPos(self.spawnpoints[ply].pos);
		ply:SetEyeAngles(self.spawnpoints[ply].ang);
	end
end

evolve:RegisterPlugin(PLUGIN);