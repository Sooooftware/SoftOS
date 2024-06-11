/*
"Open Source" Lua Script made for Gmod 
         Made by Software
             Credits 
        NCMD for Checkboxes and vars
*/

--- Vars

local vars = {
   Bhop = true,
}

--- Locals Colors and Fonts

surface.CreateFont("Font", {
    font = "Arial",
    extended = true,
    size = 24
})

surface.CreateFont("IconFont", {
    font = "Arial",
    extended = true,
    size = 15
})

local black = Color(40, 40, 40, 255) 
local under = Color(20, 20, 90, 240) 
local fadeblack = Color(40, 40, 40, 200) 

local function checkbox( name, tooltip, val, x, y, parent )
    local checkbox = vgui.Create( "DCheckBoxLabel", parent )
    checkbox:SetText( name )
    checkbox:SetPos( x, y )
    checkbox:SetChecked( vars[val] )
    if isstring( tooltip ) then
        checkbox:SetTooltip( tooltip )
    end
    function checkbox:OnChange(bval)
            vars[val] = bval
    end
    function checkbox:PaintOver()
    draw.RoundedBox( 0, 0, 0, 15, 15, Color( 255, 255, 255 ) )
        if checkbox:GetChecked() then
    draw.RoundedBox( 0, 2.5, 2.5, 10, 10, Color( 0, 0, 100 ) )
        end
    end
end



--- The Menu
--- Main Menu
local function Menu()
	local SoftOS = vgui.Create("DFrame")
	SoftOS:SetSize(900, 650) 
	SoftOS:Center() 
	SoftOS:SetTitle("") 
	SoftOS:SetDraggable(true) 
	SoftOS:ShowCloseButton(false) 
	SoftOS:MakePopup()

	
	SoftOS.Paint = function(self, w, h) --- overrides paint on main frame	  
	    draw.RoundedBox(2, 0, 0, w, h, under)
	    draw.SimpleText("SoftOS ", "Font", 45, 8, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	    draw.SimpleText( (os.date("%B %d %H:%M")), "IconFont", 420, 20, color_white )
	    draw.RoundedBox(2, 0, 40, 70, 610, fadeblack)
	    draw.SimpleText("Combat", "IconFont", 15, 110, color_white)
	    draw.SimpleText("Visuals", "IconFont", 17, 180, color_white)
	    draw.SimpleText("HvH", "IconFont", 23, 250, color_white)
	    draw.SimpleText("Misc", "IconFont", 21, 320, color_white)
	    draw.SimpleText("Exploits", "IconFont", 15, 390, color_white)
	end
	
	local power = vgui.Create( "DImageButton", SoftOS)
        power:SetPos( 861, 5 )	
        power:SetSize( 30, 30 )			
        power:SetImage( "power.png" )
        power.DoClick = function()
	 SoftOS:Close()
	end
	
	  local Wallpaper = vgui.Create( "DImage", SoftOS)
        Wallpaper:SetPos( 70, 40 )	
        Wallpaper:SetSize( 830, 625 )			
        Wallpaper:SetImage( "wallpapero.png" )
        
	
	local icon = vgui.Create( "DImageButton", SoftOS)
        icon:SetPos( 0, 50 )	
        icon:SetSize( 70, 70 )			
        icon:SetImage( "icono.png" )
        icon.DoClick = function()
	 RunConsoleCommand("Combat")
	end
        
        local icon1 = vgui.Create( "DImageButton", SoftOS)
        icon1:SetPos( 0, 120 )	
        icon1:SetSize( 70, 70 )			
        icon1:SetImage( "icono.png" )
        
        local icon2 = vgui.Create( "DImageButton", SoftOS)
        icon2:SetPos( 0, 190 )	
        icon2:SetSize( 70, 70 )			
        icon2:SetImage( "icono.png" )
        
        local icon3 = vgui.Create( "DImageButton", SoftOS)
        icon3:SetPos( 0, 260 )	
        icon3:SetSize( 70, 70 )			
        icon3:SetImage( "icono.png" )
        icon3.DoClick = function()
	 RunConsoleCommand("Misc")
	end
        
        local icon4 = vgui.Create( "DImageButton", SoftOS)
        icon4:SetPos( 0, 330 )	
        icon4:SetSize( 70, 70 )			
        icon4:SetImage( "icono.png" )
        
         local icon5 = vgui.Create( "DImageButton", SoftOS)
        icon5:SetPos( 0, 570 )	
        icon5:SetSize( 70, 70 )			
        icon5:SetImage( "settings.png" )
        
	
	
              		
end

hook.Add("Think", "menu", function() --- makes the menu open with insert
	if(input.IsKeyDown(KEY_INSERT) && !insdown) then
		if(pMenu) then
			pMenu:Close()
			pMenu = nil
		else
			pMenu = Menu()
		end
end
 
	insdown = input.IsKeyDown(KEY_INSERT)
end)


---- Start of the Extra menus for the icons

--- Combat Menu
concommand.Add( "Combat", function()
	local Sub1 = vgui.Create("DFrame") 
	Sub1:SetSize(500, 300) 
	Sub1:Center()
	Sub1:SetTitle("") 
	Sub1:SetDraggable(true) 
	Sub1:MakePopup() 

	
	Sub1.Paint = function(self, w, h)	   
	    draw.RoundedBox(2, 0, 0, w, h, black)
	    draw.RoundedBox(2, 0, 0, w, 30, under)
	    draw.SimpleText("Combat", "Font", 60, 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	end
end )


--- Misc Menu
concommand.Add( "Misc", function()
	local Sub2 = vgui.Create("DFrame") 
	Sub2:SetSize(500, 300) 
	Sub2:Center()
	Sub2:SetTitle("") 
	Sub2:SetDraggable(true) 
	Sub2:MakePopup() 

	
	Sub2.Paint = function(self, w, h)	   
	    draw.RoundedBox(2, 0, 0, w, h, black)
	    draw.RoundedBox(2, 0, 0, w, 30, under)
	    draw.SimpleText("Misc", "Font", 60, 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	end
	
	
  checkbox("Bhop","Toggles Bunnyhop", "Bhop", 10, 40, Sub2)
 
  
end )



--- The Scripts

  --- bhop

local ply = LocalPlayer() 
local function Bhop() 

    if vars.Bhop and input.IsKeyDown( KEY_SPACE ) and ply:IsOnGround() and ply:IsTyping() == false then 
      RunConsoleCommand("+jump") 
      else
      RunConsoleCommand("-jump") 
    end
end

timer.Create( "Bhopper", 0, 0.01, Bhop) 


