local blipClass = lib.load('init')
local blips = lib.load('config.config')

local blipList = {}

local function CreateBlip(blipId, data)
    local newBlip = blipClass:new()
    
    newBlip:set(data)
    blipList[blipId] = newBlip
end

local function CreateMultiBlips(blipId, data)
    local num = 1
    for _, point in ipairs(data.points) do
        local uniqueId = ('%s%d'):format(blipId, num)
        
        CreateBlip(uniqueId, {
            coords = point,
            alpha = data.alpha,
            sprite = data.sprite,
            color = data.color,
            range = data.range,
            display = data.display,
            scale = data.scale,
            label = data.label,
        })
        
        num += 1
    end
end

---@deprecated
local function DeleteBlip(blipId)
    local blipCache = blipList[blipId]
    if not blipCache then return end
    
    blipCache:delete()
    blipList[blipId] = nil
end

for id, data in pairs(blips) do
    if data.coords then
        CreateBlip(id, data)
    elseif data.points then
        CreateMultiBlips(id, data)
    end
end