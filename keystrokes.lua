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
    ovcolorlabel = ui.new_label("LUA", "A", "Key press colour"),
    ovcolor = ui.new_color_picker("LUA", "A", "Keypresscolor", 255, 255, 255, 160),
    txtcolorlbl = ui.new_label("LUA", "A", "Text colour"),
    txtcolor = ui.new_color_picker("LUA", "A", "Textcolor", 255, 255, 255, 255),
}

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
        ui.set_visible(menu.bgcolorlabel, true)
        ui.set_visible(menu.bgcolor, true)
        ui.set_visible(menu.ovcolorlabel, true)
        ui.set_visible(menu.ovcolor, true)
        ui.set_visible(menu.txtcolorlbl, true)
        ui.set_visible(menu.txtcolor, true)
        bg1, bg2, bg3, bga = ui.get(menu.bgcolor)
        ov1, ov2, ov3, ova = ui.get(menu.ovcolor)
        tx1, tx2, tx3, txa = ui.get(menu.txtcolor)
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
    else
        ui.set_visible(menu.bgcolorlabel, false)
        ui.set_visible(menu.bgcolor, false)
        ui.set_visible(menu.ovcolorlabel, false)
        ui.set_visible(menu.ovcolor, false)
        ui.set_visible(menu.txtcolorlbl, false)
        ui.set_visible(menu.txtcolor, false)
    end
end
client.set_event_callback("paint", keystrokes)
client.set_event_callback("paint", movekeystrokes)
