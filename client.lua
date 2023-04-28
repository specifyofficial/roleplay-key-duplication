addEvent("key.render", true)
ped = createPed(305, -2035.091796875, -117.4912109375, 1035.171875, 269)
setElementInterior(ped,3)
setElementDimension(ped,60)
setElementData(ped, "talk", 1)
setElementData(ped, "name", "Anahtarcı Sıla", false)
setElementFrozen(ped,true)
local sx, sy = guiGetScreenSize()
local w, h = 325,225
local scrX, scrY = (sx-w)/2, (sy-h)/2

local r,g,b = 15,15,15
local r1,g1,b1 = 15,15,15

local arac = 0
local length = 0
local length1 = 0
local selected = false
local edit = ''

local RobotoB = exports.vrp_fonts:getFont("in-medium", 12)
local RobotoR = exports.vrp_fonts:getFont("in-medium", 10)
local Roboto = exports.vrp_fonts:getFont("in-medium", 12)
local FontAwesome = exports.vrp_fonts:getFont("FontAwesome", 12)

local home = exports.vrp_fonts:getIcon("fa-home")
local car = exports.vrp_fonts:getIcon("fa-car")

addEventHandler("key.render", root, function()
	arac = 0
	wait = 0
	length = 0
	length1 = 0
	r,g,b = 15,15,15
	r1,g1,b1 = 15,15,15
	edit = ''
	selected = false
	showCursor(true)
	addEventHandler("onClientRender", root, anahtarci)
	addEventHandler('onClientCharacter', root, event)
end)

function anahtarci()
	if getKeyState('backspace') and wait+200 <= getTickCount() then
	wait = getTickCount()
	delete()
	end
	dxDrawRoundedRectangle(scrX, scrY, w, h, 10, tocolor(10,10,10,180))
	
	dxDrawText("Anahtarcı Sıla", scrX+110, scrY+15, w, h, tocolor(250,250,250,255), 1, RobotoB, "left", "top")
	dxDrawText("Çıkarılacak anahtar tipi:", scrX+15, scrY+55, w, h, tocolor(250,250,250,255), 1, RobotoR, "left", "top")
	dxDrawText("ID:", scrX+15, scrY+120, w, h, tocolor(250,250,250,255), 1, RobotoR, "left", "top")
	dxDrawText("ID", scrX+25, scrY+147, w, h, tocolor(250,250,250,255), 1, RobotoR, "left", "top")
	
	if arac == 1 then
	length1 = 0
	if length < 100 then
	length = length + 3
	end
	r,g,b = 201,217,56
	r1,g1,b1 = 15,15,15
	elseif arac == 2 then
	length = 0
	if length1 < 100 then
	length1 = length1 + 3
	end
	r1,g1,b1 = 201,217,56
	r,g,b = 15,15,15
	end
	
	if isInBox(scrX+15, scrY+140, w-180, h-195) then
	if getKeyState("mouse1") then
	selected = true
	edit = ''
	end
	dxDrawRoundedRectangle(scrX+15, scrY+140, w-180, h-195, 5, tocolor(25,25,25,150))
	else
	dxDrawRoundedRectangle(scrX+15, scrY+140, w-180, h-195, 5, tocolor(15,15,15,150))
	end
	dxDrawText(edit, scrX+45, scrY+147, w, h, tocolor(250,250,250,230), 1, RobotoR, "left", "top")
	
	if isInBox(scrX+15, scrY+80, w-295+length1, h-195) then
	if getKeyState("mouse1") then
	arac = 2
	end
	dxDrawRoundedRectangle(scrX+15, scrY+80, w-295+length1, h-195, 5, tocolor(201, 217, 56,150))
	else
	dxDrawRoundedRectangle(scrX+15, scrY+80, w-295+length1, h-195, 5, tocolor(r1,g1,b1,150))
	end
	dxDrawText(home, scrX+20, scrY+85, w-295, h-195, tocolor(200,200,200,250), 1, FontAwesome, "left", "top")
	
	if isInBox(scrX+50+length1, scrY+80, w-295+length, h-195) then
	if getKeyState("mouse1") then
	arac = 1
	end
	dxDrawRoundedRectangle(scrX+50+length1, scrY+80, w-295+length, h-195, 5, tocolor(201, 217, 56,150))
	else
	dxDrawRoundedRectangle(scrX+50+length1, scrY+80, w-295+length, h-195, 5, tocolor(r,g,b,150))
	end
	dxDrawText(car, scrX+54+length1, scrY+86, w-295, h-195, tocolor(200,200,200,250), 0.90, FontAwesome, "left", "top")
	
	if isInBox(scrX+15, scrY+185, w-30, h-195) then
	if getKeyState("mouse1") and wait+200 <= getTickCount() then
	wait = getTickCount()
	triggerServerEvent("anahtarcikart", localPlayer, localPlayer, arac, edit)
	end
	dxDrawRoundedRectangle(scrX+15, scrY+185, w-30, h-195, 5, tocolor(201, 217, 56,150))
	else
	dxDrawRoundedRectangle(scrX+15, scrY+185, w-30, h-195, 5, tocolor(15,15,15,150))
	end
	dxDrawText("Seç (500TL)", scrX+133, scrY+192, w, h, tocolor(200,200,200,230), 1, RobotoR, "left", "top")
	
	if isInBox(scrX+285, scrY+14, w-300, h-200) then
	if getKeyState("mouse1") then
	removeEventHandler("onClientRender", root, anahtarci)
	removeEventHandler("onClientCharacter",root,event)
	showCursor(false)
	end
	dxDrawRoundedRectangle(scrX+285, scrY+14, w-300, h-200, 5, tocolor(255,36,10,180))
	end
	dxDrawText("x", scrX+294, scrY+14, w-300, h-200, tocolor(250,250,250,250), 1, Roboto, "left", "top")
	
	if length1 > 90 then
	dxDrawText("Mülk Anahtarı", scrX+50, scrY+87, w, h, tocolor(250,250,250,250), 1, RobotoR, "left", "top")
	elseif length > 90 then
	dxDrawText("Araç Anahtarı", scrX+85, scrY+87, w, h, tocolor(250,250,250,250), 1, RobotoR, "left", "top")
	end
end


function event(...)
    write(...)
end

function write(character)
    if selected == true then
        if #edit < 7 then
		if tonumber(character) then
            edit = edit..character
            char = #edit+1
			end
        end
    end
end

function delete()
    if selected == true then
        if string.len(edit) > 0 then
            local firstPart = edit:sub(0, char-1)
            local lastPart = edit:sub(char+1, #edit)
            edit = firstPart..lastPart
            char = string.len(edit)
        end
    end
end


function dxDrawRoundedRectangle(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end

function isInBox ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end