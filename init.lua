local blip = {}
blip.__index = blip

function blip:new(data)
    local self = setmetatable({}, blip)
    self.handle = nil

    return self
end

function blip:set(data)
    if self.handle then return end
    
    self.handle = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    
    if data.alpha ~= nil then SetBlipAlpha(self.handle, data.alpha) end
    if data.sprite ~= nil then SetBlipSprite(self.handle, data.sprite) end
    if data.color ~= nil then SetBlipColour(self.handle, data.color) end
    if data.range ~= nil then SetBlipAsShortRange(self.handle, data.range) end
    if data.display ~= nil then SetBlipDisplay(self.handle, data.display) end
    if data.scale ~= nil then SetBlipScale(self.handle, data.scale) end

    if data.label then
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(data.label)
        EndTextCommandSetBlipName(self.handle)
    end
end

function blip:move(coords)
    if not self.handle or not coords then return end

    SetBlipCoords(self.handle, coords.x, coords.y, coords.z)
end

function blip:delete()
    if not self.handle then return end

    RemoveBlip(self.handle)
    self.handle = nil
end

return blip