local blipClass = {}
blipClass.__index = blipClass

function blipClass:new(data)
    local self = setmetatable({}, blipClass)
    self.handle = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)

    if data.sprite then SetBlipSprite(self.handle, data.sprite) end
    if data.color then SetBlipColour(self.handle, data.color) end
    if data.scale then SetBlipScale(self.handle, data.scale) end
    
    SetBlipAlpha(self.handle, data.alpha or 255)
    SetBlipDisplay(self.handle, data.display or 2)
    SetBlipAsShortRange(self.handle, data.range or true)

    if data.label then
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(data.label)
        EndTextCommandSetBlipName(self.handle)
    end

    return self
end

function blipClass:move(coords)
    if not self.handle or not coords then return end

    SetBlipCoords(self.handle, coords.x, coords.y, coords.z)
end

function blipClass:delete()
    if not self.handle then return end

    RemoveBlip(self.handle)
    self.handle = nil
end

return blipClass