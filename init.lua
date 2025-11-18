---@diagnostic disable: redefined-local

---@class Blip
Blip = {}
Blip.__index = Blip

-- Constructor function
---@return Blip object
function Blip:new(data)
    local self = setmetatable({}, Blip)
    self.handle = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)

    if data.sprite then SetBlipSprite(self.handle, data.sprite) end
    if data.color then SetBlipColour(self.handle, data.color) end
    if data.scale then SetBlipScale(self.handle, data.scale) end

    SetBlipAlpha(self.handle, data.alpha or 255)
    SetBlipDisplay(self.handle, data.display or 2)
    SetBlipAsShortRange(self.handle, data.range ~= nil and data.range or true)

    self:label(data.label)

    return self
end

-- Function to set the blip label
---@param label string
function Blip:label(label)
    if not self.handle or not label then
        return
    end

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(label)
    EndTextCommandSetBlipName(self.handle)
end

-- Function to move the blip [EXPERIMENTAL]
---@param coords vector3
function Blip:move(coords)
    if not self.handle or not coords then
        return
    end

    SetBlipCoords(self.handle, coords.x, coords.y, coords.z)
end

-- Function to delete the blip
function Blip:delete()
    if not self.handle then
        return
    end

    RemoveBlip(self.handle)
    self.handle = nil
end