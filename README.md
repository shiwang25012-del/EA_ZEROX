# EA_ZEROX

--[[
    EA_ZEROX
    ENDLESS AURA
    Version 1.0
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local AURA_NAME = "EA_ZEROX"
local AURA_COLOR = Color3.fromRGB(170, 0, 255)
local auraEnabled = true

local function createAura(character)
    local root = character:WaitForChild("HumanoidRootPart")

    local old = root:FindFirstChild(AURA_NAME)
    if old then old:Destroy() end

    local attachment = Instance.new("Attachment")
    attachment.Name = AURA_NAME
    attachment.Parent = root

    local particles = Instance.new("ParticleEmitter")
    particles.Name = "EA_ZEROX_PARTICLES"
    particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particles.Color = ColorSequence.new(AURA_COLOR)
    particles.Rate = 25
    particles.Lifetime = NumberRange.new(1, 2)
    particles.Speed = NumberRange.new(1, 3)
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.Parent = attachment

    local light = Instance.new("PointLight")
    light.Name = "EA_ZEROX_LIGHT"
    light.Color = AURA_COLOR
    light.Brightness = 2
    light.Range = 12
    light.Parent = root
end

local function removeAura(character)
    local root = character:FindFirstChild("HumanoidRootPart")
    if root then
        local aura = root:FindFirstChild(AURA_NAME)
        if aura then aura:Destroy() end

        local light = root:FindFirstChild("EA_ZEROX_LIGHT")
        if light then light:Destroy() end
    end
end

player.CharacterAdded:Connect(function(character)
    if auraEnabled then
        createAura(character)
    end
end)

if player.Character and auraEnabled then
    createAura(player.Character)
end

print("EA_ZEROX | ENDLESS AURA LOADED")
