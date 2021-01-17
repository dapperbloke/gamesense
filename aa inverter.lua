-- Anti aim inverter by slxyx

-- anti aim references
local yaw, yawvalue = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local bodyyaw, bodyyawvalue = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local jitter, jittervalue = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")

-- Inverter key
local aainvert = ui.new_hotkey("AA", "Anti-aimbot angles", "Anti-aim inverter")
local indicator = ui.new_checkbox("AA", "Anti-aimbot angles", "Anti-aim inverter Indicator")

onoff = true

-- anti aim inverter
function inverter() 

-- gets the original aa values
if onoff then
    origyaw = ui.get(yawvalue)
    origbyaw = ui.get(bodyyawvalue)
    origjit = ui.get(jittervalue)
end

-- changes the aa values to opposite
if ui.get(aainvert) then
    onoff = false
    if origyaw >= 1 then
        ui.set(yawvalue, "-" .. origyaw)
    elseif origyaw <= -1 then
        ui.set(yawvalue, tostring(origyaw):gsub("%-", ""))
    end
    if origbyaw >= 1 then
        ui.set(bodyyawvalue, "-" .. origbyaw)
    elseif origbyaw <= -1 then
        ui.set(bodyyawvalue, tostring(origbyaw):gsub("%-", ""))
    end
    if origjit >= 1 then
        ui.set(jittervalue, "-" .. origjit)
    elseif origjit <= -1 then
        ui.set(jittervalue, tostring(origjit):gsub("%-", ""))
    end
else
    onoff = true
    ui.set(jittervalue, origjit)
    ui.set(bodyyawvalue, origbyaw)
    ui.set(yawvalue, origyaw)
end
end

client.set_event_callback("paint_ui", inverter)

function indic()
    if ui.get(indicator) and ui.get(aainvert) then
        renderer.indicator(255, 255, 255, 255, "INVERT")
    end
end
client.set_event_callback("paint", indic)  
