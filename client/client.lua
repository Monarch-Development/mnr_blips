local function CreateBlip(data)
    Blip:new(data)
end

local function CreateMultiBlips(data)
    for _, point in ipairs(data.points) do
        CreateBlip({
            coords = point,
            sprite = data.sprite,
            color = data.color,
            scale = data.scale,
            alpha = data.alpha,
            display = data.display,
            range = data.range,
            label = data.label,
        })
    end
end

for _, data in ipairs(config.blips) do
    if data.coords then
        CreateBlip(data)
    elseif data.points then
        CreateMultiBlips(data)
    end
end