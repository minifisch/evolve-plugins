-- Remember to create the ev_motd.txt in the data folder and add the contents!!

local PLUGIN = {}
PLUGIN.Title = "MOTD"
PLUGIN.Description = "Server Start Message"
PLUGIN.Author = "Sting"
PLUGIN.ChatCommand = "motd"
PLUGIN.Usage = nil
PLUGIN.Privileges = nil

function PLUGIN:Call( ply, args )
	self:OpenMotd( ply )

end

function PLUGIN:PlayerInitialSpawn( ply )
	timer.Simple( 1, function() ply:ConCommand("evolve_motd") end)


end

function PLUGIN:OpenMotd( ply )
	if (SERVER) then
		ply:ConCommand("evolve_motd")


	end
end

if (SERVER) then 
	if (file.Exists("ev_motd.txt")) then
		resource.AddFile("data/ev_motd.txt")
	else 
		Msg("\n")
		Msg("====================== \n")
		Msg("Missing MOTD file! \n")
		Msg("Make sure the file exists as: ev_motd.txt in data! \n")
		Msg("====================== \n")
		Msg("\n")
		



	end
end


if (CLIENT) then
	function PLUGIN:CreateMenu()
		
		self.MotdPanel = vgui.Create("DFrame")
		self.MotdPanel:SetPos( 100,100 )
		self.MotdPanel:SetSize( 850, 580 )
		self.MotdPanel:SetTitle( "MOTD" )
		self.MotdPanel:SetVisible( false )
		self.MotdPanel:SetDraggable( true )
		self.MotdPanel:ShowCloseButton( true )
		self.MotdPanel:SetDeleteOnClose( false )
		self.MotdPanel:SetScreenLock( true )	
		self.MotdPanel:MakePopup()

		
		self.MotdBox = vgui.Create("HTML",self.MotdPanel)
		self.MotdBox:StretchToParent( 4,25,4,4 )
		self.MotdBox:SetHTML( file.Read( "ev_motd.txt") )



end
	timer.Simple( 0.1, function() PLUGIN:CreateMenu() end)

	concommand.Add("evolve_motd",function(ply,cmd,args)
		PLUGIN.MotdPanel:SetVisible( true )

	end)
	
end

evolve:RegisterPlugin( PLUGIN )