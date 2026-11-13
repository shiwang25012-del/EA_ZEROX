-- EA_ZEROX | ENDLESS AURA

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function createAura(character)
    local root = character:WaitForChild("HumanoidRootPart")

    local old = root:FindFirstChild("EA_ZEROX")
    if old then old:Destroy() end

    local attachment = Instance.new("Attachment")
    attachment.Name = "EA_ZEROX"
    attachment.Parent = root

    local particles = Instance.new("ParticleEmitter")
    particles.Name = "EA_ZEROX_AURA"
    particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particles.Rate = 25
    particles.Lifetime = NumberRange.new(1, 2)
    particles.Speed = NumberRange.new(1, 3)
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.Parent = attachment

    local light = Instance.new("PointLight")
    light.Name = "EA_ZEROX_LIGHT"
    light.Color = Color3.fromRGB(170, 0, 255)
    light.Brightness = 2
    light.Range = 12
    light.Parent = root
end

if player.Character then
    createAura(player.Character)
end

player.CharacterAdded:Connect(createAura)

print("EA_ZEROX LOADED SUCCESSFULLY")
