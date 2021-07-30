--[[
    ██████╗ ██████╗ ██╗   ██╗██╗  ██╗
    ██╔══██╗██╔══██╗██║   ██║██║  ██║
    ██████╔╝██████╔╝██║   ██║███████║
    ██╔══██╗██╔══██╗██║   ██║██╔══██║
    ██████╔╝██║  ██║╚██████╔╝██║  ██║
    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
]]

local surface = require 'gamesense/surface'
local ffi = require 'ffi'

local weaponNames = {
    [1] = "Desert Eagle",
    [2] = "Dual Berettas",
    [3] = "Five-Seven",
    [4] = "Glock-18",
    [7] = "AK-47",
    [8] = "AUG",
    [9] = "AWP",
    [10] = "FAMAS",
    [11] = "G3SG1",
    [13] = "Galil AR",
    [14] = "M249",
    [16] = "M4A4",
    [17] = "MAC-10",
    [19] = "P90",
    [23] = "MP5-SD",
    [24] = "UMP-45",
    [25] = "XM1014",
    [26] = "PP-Bizon",
    [27] = "MAG-7",
    [28] = "Negev",
    [29] = "Sawed-Off",
    [30] = "Tec-9",
    [32] = "P2000",
    [33] = "MP7",
    [34] = "MP9",
    [35] = "Nova",
    [36] = "P250",
    [38] = "SCAR-20",
    [39] = "SG 553",
    [40] = "SSG 08",
    [42] = "Knife",
    [43] = "Flashbang",
    [44] = "Smoke Grenade",
    [45] = "HE Grenade",
    [46] = "Molotov",
    [48] = "incendiary",
    [49] = "C4 Explosive",
    [59] = "Knife",
    [60] = "M4A1-S",
    [61] = "USP-S",
    [63] = "CZ75-Auto",
    [64] = "R8 Revolver",
    [500] = "Bayonet",
    [503] = "Classic Knife",
    [505] = "Flip Knife",
    [506] = "Gut Knife",
    [507] = "Karambit",
    [508] = "M9 Bayonet",
    [509] = "Huntsman Knife",
    [512] = "Falchion Knife",
    [514] = "Bowie Knife",
    [515] = "Butterfly Knife",
    [516] = "Shadow Daggers",
    [517] = "Paracord Knife",
    [518] = "Survival Knife",
    [519] = "Ursus Knife",
    [520] = "Navaja Knife",
    [521] = "Nomad Knife",
    [522] = "Stiletto Knife",
    [523] = "Talon Knife",
    [525] = "Skeleton Knife",
    [31] = "Zeus x27",
}

local fonts = {
    esp = surface.create_font('Segoe UI', 14, 14, 0x010),
    flags = surface.create_font('Smallest Pixel-7', 10, 1, 0x200)
}

local esp = {
    box = ui.new_checkbox('visuals', 'player esp', 'Bounding box'),
    boxcolour = ui.new_color_picker('visuals', 'player esp', 'Bounding box', 255,255,255,255),
    name = ui.new_checkbox('visuals', 'player esp', 'Name'),
    namecolour = ui.new_color_picker('visuals', 'player esp', 'Name', 255,255,255,255),
    health = ui.new_checkbox('visuals', 'player esp', 'Health bar'),
    healthcolour = ui.new_color_picker('visuals', 'player esp', 'Health bar', 255,255,255,255),
    flags = ui.new_checkbox('visuals', 'player esp', 'Flags'),
    flagselect = ui.new_multiselect('visuals', 'player esp', '...', 'Money', 'Armour', 'Scoped', 'Defuser', 'Bomb carrier', 'Fake duck'),
    weaponnames = ui.new_checkbox('visuals', 'player esp', 'Weapon names'),
    weaponnamescolour = ui.new_color_picker('visuals', 'player esp', 'Weapon names', 255,255,255,255),
}

local playerHealth = {}

local function includes(table, key)
    for i=1, #table do
        if table[i] == key then
            return true
        end
    end
    return false
end

local function getPlayerInfo()
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 then return end
        playerHealth[i] = entity.get_prop(i, 'm_iHealth')
    end
end

local function drawName()
    if not ui.get(esp.name) then return end
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 or playerHealth[i] == 0 or i == entity.get_local_player() or not entity.is_enemy(i) or entity.get_prop(entity.get_local_player(), "m_hObserverTarget") == i then goto stop end
        local x1, y1, x2, y2, alpha = entity.get_bounding_box(i)
        local name = entity.get_player_name(i)
        local r,g,b = ui.get(esp.namecolour)
        if x1 then
            local nameAlpha = entity.is_dormant(i) and 150 or 255
            local centering = surface.get_text_size(fonts.esp, name)
            if not name then return end
            surface.draw_text(x1+((x2-x1)/2)-(centering/2), y1-15, r,g,b,nameAlpha, fonts.esp, name)
        end
        ::stop::
    end
end

local function drawHealth()
    if not ui.get(esp.health) then return end
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 or playerHealth[i] == 0 or i == entity.get_local_player() or not entity.is_enemy(i) or entity.get_prop(entity.get_local_player(), "m_hObserverTarget") == i then goto stop end
        local x1, y1, x2, y2, alpha = entity.get_bounding_box(i)
        if x2 then
            local health = playerHealth[i]/100
            local healthAlpha = entity.is_dormant(i) and 150 or 255
            local r,g,b = ui.get(esp.healthcolour)
            surface.draw_filled_rect(x1-11, y1-1, 4, (y2-y1)+4, 13, 13, 13, healthAlpha)
            surface.draw_filled_rect(x1-10, y1-((y2-y1)*health)+(y2-y1), 2, math.ceil(((y2-y1)+2)*health), r,g,b, healthAlpha)
            if playerHealth[i] < 95 then
                local centering = surface.get_text_size(fonts.esp, tostring(playerHealth[i]))
                surface.draw_text(x1-10-centering/2, y1+(y2-y1)-((y2-y1)*health)-12, 255,255,255,healthAlpha, fonts.esp, tostring(playerHealth[i]))
            end
        end
        ::stop::
    end
end

local function drawFlags()
    if not ui.get(esp.flags) then return end
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 or playerHealth[i] == 0 or i == entity.get_local_player() or not entity.is_enemy(i) or entity.get_prop(entity.get_local_player(), "m_hObserverTarget") == i then goto stop end
        local x1, y1, x2, y2, alpha = entity.get_bounding_box(i)
        local helm, kev = entity.get_prop(i, 'm_bHasHelmet') == 1, entity.get_prop(i, 'm_ArmorValue') ~= 0
        local scoped = entity.get_prop(i, 'm_bIsScoped') == 1
        local duckamt = entity.get_prop(i, 'm_flDuckAmount')
        local defuser = entity.get_prop(i, 'm_bHasDefuser')
        local carrier = entity.get_prop(i, "m_iPlayerC4")
        local money = '$' .. entity.get_prop(i, "m_iAccount")
        if x1 then
            local flagsmult = 1
            local flagAlpha = entity.is_dormant(i) and 150 or 255
            if includes(ui.get(esp.flagselect), 'Money') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 115,119,87,flagAlpha, fonts.flags, money)
                flagsmult = flagsmult + 1
            end
            if helm and kev and includes(ui.get(esp.flagselect), 'Armour') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 255,255,255,flagAlpha, fonts.flags, 'HK')
                flagsmult = flagsmult + 1
            elseif kev and includes(ui.get(esp.flagselect), 'Armour') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 255,255,255,flagAlpha, fonts.flags, 'K')
                flagsmult = flagsmult + 1
            end
            if scoped and includes(ui.get(esp.flagselect), 'Scoped') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 56,97,147,flagAlpha, fonts.flags, 'ZOOM')
                flagsmult = flagsmult + 1
            end
            if defuser and includes(ui.get(esp.flagselect), 'Defuser') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 88,113,105,flagAlpha, fonts.flags, 'KIT')
                flagsmult = flagsmult + 1
            end  
            if carrier and includes(ui.get(esp.flagselect), 'Bomb carrier') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 255,255,255,flagAlpha, fonts.flags, 'C4')
                flagsmult = flagsmult + 1
            end
            if duckamt > 0 and duckamt < 1 and includes(ui.get(esp.flagselect), 'Fake duck') then
                surface.draw_text(x1+((x2-x1))+10, y1-9+(9*flagsmult), 255,255,255,flagAlpha, fonts.flags, 'FD')
                flagsmult = flagsmult + 1
            end
        end
        ::stop::
    end
end

local function drawWeaponNames()
    if not ui.get(esp.weaponnames) then return end
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        local r,g,b = ui.get(esp.weaponnamescolour)
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 or playerHealth[i] == 0 or i == entity.get_local_player() or not entity.is_enemy(i) or entity.get_prop(entity.get_local_player(), "m_hObserverTarget") == i then goto stop end
        local x1, y1, x2, y2, alpha = entity.get_bounding_box(i)
        if x1 then
            local weapon_ent = entity.get_player_weapon(i)
            local weapon = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
            local nameAlpha = entity.is_dormant(i) and 150 or 255
            local centering = surface.get_text_size(fonts.flags, weaponNames[weapon])
            if not weaponNames[weapon] then return end
            surface.draw_text(x1+((x2-x1)/2)-(centering/2), y2, r,g,b,nameAlpha, fonts.flags, weaponNames[weapon])
        end
        ::stop::
    end
end

local function drawBoxes()
    if not ui.get(esp.box) then return end
    local players = globals.maxplayers()
    for i = 1, players do
        local resource = entity.get_player_resource()
        local r,g,b = ui.get(esp.boxcolour)
        if not entity.get_prop(resource, 'm_bConnected', i) == 1 or playerHealth[i] == 0 or i == entity.get_local_player() or not entity.is_enemy(i) or entity.get_prop(entity.get_local_player(), "m_hObserverTarget") == i then goto stop end
        local x1, y1, x2, y2, alpha = entity.get_bounding_box(i)
        if x1 then
            local boxAlpha = entity.is_dormant(i) and 150 or 255
            renderer.rectangle(x1-5, y1, x2-x1+10, 1, r, g, b, boxAlpha)
            renderer.rectangle(x2+5, y1, 1, y2-y1, r, g, b, boxAlpha)
            renderer.rectangle(x1-5, y2, x2-x1+10, 1, r, g, b, boxAlpha)
            renderer.rectangle(x1-5, y1, 1, y2-y1, r, g, b, boxAlpha)
        end
        ::stop::
    end
end

client.set_event_callback('paint_ui', function()
    ui.set_visible(esp.flagselect, ui.get(esp.flags))
end)

client.set_event_callback('paint', getPlayerInfo)
client.set_event_callback('paint', drawName)
client.set_event_callback('paint', drawHealth)
client.set_event_callback('paint', drawFlags)
client.set_event_callback('paint', drawWeaponNames)
client.set_event_callback('paint', drawBoxes)
