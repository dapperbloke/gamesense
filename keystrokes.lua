---
--- epic minecraft keystroke
--- Created by slxyx#9149.
--- DateTime: 09/12/2020 20:00
---

--- menu functions
local menu = {
    checkbox = ui.new_checkbox("LUA", "A", "Enable keystrokes"),
    bgcolorlabel = ui.new_label("LUA", "A", "Background colour"),
    bgcolor = ui.new_color_picker("LUA", "A", "Backgroundcolor", 16, 16, 16, 255),
    rainbowbg = ui.new_checkbox("LUA", "A", "Rainbow background colour"),
    ovcolorlabel = ui.new_label("LUA", "A", "Key press colour"),
    ovcolor = ui.new_color_picker("LUA", "A", "Keypresscolor", 255, 255, 255, 160),
    rainbowov = ui.new_checkbox("LUA", "A", "Rainbow key press colour"),
    txtcolorlbl = ui.new_label("LUA", "A", "Text colour"),
    txtcolor = ui.new_color_picker("LUA", "A", "Textcolor", 255, 255, 255, 255),
    rainbowtxt = ui.new_checkbox("LUA", "A", "Rainbow text colour"),
}

-- rainbow shit
-- rainbow
local function hsv_to_rgb(h, s, v, a)
    local r, g, b

    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);

    i = i % 6

    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end

    return r * 255, g * 255, b * 255, a * 255
end

local function rgb_rainbow(frequency, rgb_split_ratio)
    local r, g, b, a = hsv_to_rgb(globals.realtime() * frequency, 1, 1, 1)

    r = r * rgb_split_ratio
    g = g * rgb_split_ratio
    b = b * rgb_split_ratio
    return r, g, b
end

-- switch between rainbow and colour
function switchcolour()
    if ui.get(menu.rainbowbg) then
        bg1, bg2, bg3 = rgb_rainbow(15/100,1)
        bga = 255
    else
        bg1, bg2, bg3, bga = ui.get(menu.bgcolor)
    end
    if ui.get(menu.rainbowov) then
        ov1, ov2, ov3 = rgb_rainbow(15/100,1)
        ova = 160
    else
        ov1, ov2, ov3, ova = ui.get(menu.ovcolor)
    end
    if ui.get(menu.rainbowtxt) then
        tx1, tx2, tx3 = rgb_rainbow(15/100,1)
        txa = 255
    else
        tx1, tx2, tx3, txa = ui.get(menu.txtcolor)
    end
end

-- to move the keystrokes
posx = 200
posy = 500
function movekeystrokes()
    mouseposx, mouseposy = ui.mouse_position()
    if client.key_state(0x01) then
        if mouseposy <= posy+235 and mouseposy >= posy-100 then
            if mouseposx <= posx+300 and mouseposx >= posx-100 then
                posx = mouseposx - 30
                posy = mouseposy - 17
            end
        end
    end
end

-- drawing the keystrokes
function keystrokes()
    if ui.get(menu.checkbox) then
        renderer.rectangle(posx, posy, 50, 50, bg1, bg2, bg3, bga)
        renderer.rectangle(posx, posy+55, 50, 50, bg1, bg2, bg3, bga)
        renderer.rectangle(posx-55, posy+55, 50, 50, bg1, bg2, bg3, bga)
        renderer.rectangle(posx+55, posy+55, 50, 50 , bg1, bg2, bg3, bga)
        renderer.rectangle(posx-55, posy+110, 160, 45, bg1, bg2, bg3, bga)
        if client.key_state(0x57) then
            renderer.rectangle(posx, posy, 50, 50, ov1, ov2, ov3, ova)
        end
        if client.key_state(0x53) then
            renderer.rectangle(posx, posy+55, 50, 50, ov1, ov2, ov3, ova)
        end
        if client.key_state(0x41) then
            renderer.rectangle(posx-55, posy+55, 50, 50, ov1, ov2, ov3, ova)
        end
        if client.key_state(0x44) then
            renderer.rectangle(posx+55, posy+55, 50, 50, ov1, ov2, ov3, ova)
        end
        if client.key_state(0x20) then
            renderer.rectangle(posx-55, posy+110, 160, 45, ov1, ov2, ov3, ova)
        end
        renderer.text(posx+25, posy+25, tx1, tx2, tx3, txa, "cb+", 0, "W")
        renderer.text(posx+24, posy+25+55, tx1, tx2, tx3, txa, "cb+", 0, "S")
        renderer.text(posx+24-55, posy+25+55, tx1, tx2, tx3, txa, "cb+", 0, "A")
        renderer.text(posx+24+55, posy+25+55, tx1, tx2, tx3, txa, "cb+", 0, "D")
        renderer.text(posx+24, posy+25+50+55, tx1, tx2, tx3, txa, "cb+", 0, "SPACE")
    end
end

function visibility()
    if ui.get(menu.checkbox) then
        ui.set_visible(menu.rainbowov, true)
        ui.set_visible(menu.rainbowbg, true)
        ui.set_visible(menu.rainbowtxt, true)
        if ui.get(menu.rainbowbg) then
            ui.set_visible(menu.bgcolorlabel, false)
            ui.set_visible(menu.bgcolor, false)
        else
            ui.set_visible(menu.bgcolorlabel, true)
            ui.set_visible(menu.bgcolor, true)
        end
        if ui.get(menu.rainbowov) then
            ui.set_visible(menu.ovcolorlabel, false)
            ui.set_visible(menu.ovcolor, false)
        else
            ui.set_visible(menu.ovcolorlabel, true)
            ui.set_visible(menu.ovcolor, true)
        end
        if ui.get(menu.rainbowtxt) then
            ui.set_visible(menu.txtcolorlbl, false)
            ui.set_visible(menu.txtcolor, false)
        else
            ui.set_visible(menu.txtcolorlbl, true)
            ui.set_visible(menu.txtcolor, true)
        end
    else
        ui.set_visible(menu.txtcolorlbl, false)
        ui.set_visible(menu.txtcolor, false)
        ui.set_visible(menu.ovcolorlabel, false)
        ui.set_visible(menu.ovcolor, false)
        ui.set_visible(menu.bgcolorlabel, false)
        ui.set_visible(menu.bgcolor, false)
        ui.set_visible(menu.rainbowov, false)
        ui.set_visible(menu.rainbowbg, false)
        ui.set_visible(menu.rainbowtxt, false)
    end
end
client.set_event_callback("paint", keystrokes)
client.set_event_callback("paint", movekeystrokes)
client.set_event_callback("paint", switchcolour)
client.set_event_callback("paint_ui", visibility)
