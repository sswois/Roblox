local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function IsAlive(Player)
    if Player and Player.Character then
        local Character = Player.Character
        local ForceField = Character:FindFirstChild("ForceField")
        local Humanoid = Character:FindFirstChild("Humanoid")
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        return not ForceField and Humanoid and Humanoid.Health > 0 and HumanoidRootPart
    end
    return false
end

local function MouseDistanceToPoint(Point)
    local ScreenPoint, OnScreen = Camera:WorldToViewportPoint(Point)
    if OnScreen then
        local MousePosition = Vector2.new(Mouse.X, Mouse.Y)
        local ScreenPosition = Vector2.new(ScreenPoint.X, ScreenPoint.Y)
        local Distance = (ScreenPosition - MousePosition).Magnitude
        return Distance < 300 and Distance or math.huge
    else
        return math.huge
    end
end

return {
    IsAlive = IsAlive,
    MouseDistanceToPoint = MouseDistanceToPoint,
}
