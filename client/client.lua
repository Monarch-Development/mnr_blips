local blipClass = lib.load('init')
local blips = lib.load('config.config')

local blipList = {}

local function CreateBlip(id, data)
    local blip = blipClass:new(data)

    blipList[id] = blip
end

local function CreateMultiBlips(id, data)
    local num = 1
    for _, point in ipairs(data.points) do
        local uniqueId = ('%s%d'):format(id, num)
        
        CreateBlip(uniqueId, {
            coords = point,
            sprite = data.sprite,
            color = data.color,
            scale = data.scale,
            alpha = data.alpha,
            display = data.display,
            range = data.range,
            label = data.label,
        })
        
        num += 1
    end
end

for id, data in pairs(blips) do
    if data.coords then
        CreateBlip(id, data)
    elseif data.points then
        CreateMultiBlips(id, data)
    end
end