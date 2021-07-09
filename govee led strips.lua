local http = require "gamesense/http"
local ffi = require "ffi"

local native_GetClipboardTextCount = vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
local native_GetClipboardText = vtable_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")
local new_char_arr = ffi.typeof("char[?]")
availableDevices = {"-"}
modelNumber = {"-"}
successfullyAuthed = false

local function CP()
    local len = native_GetClipboardTextCount()
    if len > 0 then
      local char_arr = new_char_arr(len)
      native_GetClipboardText(0, char_arr, len)
      return ffi.string(char_arr, len-1)
    end
end

function matchModel()
    for i = 1, #availableDevices do
        if availableDevices[i] == ui.get(availableDeviceBox) then
            return i
        end
    end
end

authGovee = ui.new_button("LUA", "B", "Authorise", function()
    apiKey = database.read("goveeapikey") or CP()
    local opt = {headers = {["Govee-API-Key"] = apiKey}}
    http.get("https://developer-api.govee.com/v1/devices", opt, function(s,r)
        if r.body then
            goveeDevices = json.parse(r.body)
            print(r.body)
            if goveeDevices.status == 401 then
                print('auth failed')
                successfullyAuthed = false
                if database.read("goveeapikey") then database.write("goveeapikey", nil) end
            elseif goveeDevices.code == 200 then
                print('auth success')
                successfullyAuthed = true
                if not database.read("goveeapikey") then database.write("goveeapikey", apiKey) end
            end
        end
        if successfullyAuthed then
            for i = 1,10 do
                if goveeDevices.data.devices[i] ~= nil then
                    print('adding device '..i)
                    table.insert(availableDevices, goveeDevices.data.devices[i].device)
                    table.insert(modelNumber, goveeDevices.data.devices[i].model)
                    print("added device "..goveeDevices.data.devices[i].device.." model number "..goveeDevices.data.devices[i].model)
                end
                if i == 10 then
                    availableDeviceBox = ui.new_combobox("LUA", "B", "Available devices", availableDevices)
                end
            end
        end
    end)
end)
local normalLabel = ui.new_label("LUA", "B", "Normal Colour")
local normalColour = ui.new_color_picker("LUA", "B", "Normal Colour", 113, 28, 184, 255)
local hitLabel = ui.new_label("LUA", "B", "Hit Colour")
local hitColour = ui.new_color_picker("LUA", "B", "Hit Colour", 20, 255, 20, 255)
local missLabel = ui.new_label("LUA", "B", "Miss Colour")
local missColour = ui.new_color_picker("LUA", "B", "Miss Colour", 255, 0, 0, 255)

function normalSettings()
    local r,g,b = ui.get(normalColour)
    options = {
        body = '{ "device": "'..ui.get(availableDeviceBox)..'", "model": "'..modelNumber[matchModel()]..'", "cmd": { "name": "color", "value": { "r": '..r..', "g": '..g..', "b": '..b..' } } }',
        headers = {
            ["Content-Type"] = "application/json",
            ["Govee-API-Key"] = 'ac309b02-88a3-46fb-a49e-e24f12f6d9f5'
        } 
    }
    sendReq()
end

local function aim_miss()
    local r,g,b = ui.get(missColour)
    options = {
        body = '{ "device": "'..ui.get(availableDeviceBox)..'", "model": "'..modelNumber[matchModel()]..'", "cmd": { "name": "color", "value": { "r": '..r..', "g": '..g..', "b": '..b..' } } }',
        headers = {
            ["Content-Type"] = "application/json",
            ["Govee-API-Key"] = 'ac309b02-88a3-46fb-a49e-e24f12f6d9f5'
        } 
    }
    sendReq()
    client.delay_call(3, normalSettings)
end

local function aim_hit()
    local r,g,b = ui.get(hitColour)
    options = {
        body = '{ "device": "'..ui.get(availableDeviceBox)..'", "model": "'..modelNumber[matchModel()]..'", "cmd": { "name": "color", "value": { "r": '..r..', "g": '..g..', "b": '..b..' } } }',
        headers = {
            ["Content-Type"] = "application/json",
            ["Govee-API-Key"] = 'ac309b02-88a3-46fb-a49e-e24f12f6d9f5'
        } 
    }
    sendReq()
    client.delay_call(3, normalSettings)
end

function sendReq()
    http.put("https://developer-api.govee.com/v1/devices/control", options, function(s, r) end)
end

function visibility()
    ui.set_visible(authGovee, not successfullyAuthed)
    ui.set_visible(hitColour, successfullyAuthed)
    ui.set_visible(missColour, successfullyAuthed)
    ui.set_visible(normalColour, successfullyAuthed)
    ui.set_visible(hitLabel, successfullyAuthed)
    ui.set_visible(missLabel, successfullyAuthed)
    ui.set_visible(normalLabel, successfullyAuthed)
end

client.set_event_callback('aim_miss', aim_miss)
client.set_event_callback('aim_hit', aim_hit)
client.set_event_callback('paint_ui', visibility)
