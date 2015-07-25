local Plugin = {}
Plugin.Title = "Spawn Protection"
Plugin.Description = "Protects a player at spawn for 7 seconds."
Plugin.Author = "Tom"

function Plugin:PlayerSpawn( ply )
	 ply:GodEnable()
   timer.Simple(7, function()
      ply:GodDisable()
    end)
end

evolve:RegisterPlugin( Plugin )