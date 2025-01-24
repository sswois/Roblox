local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function IsAlive(Player)
    if Player and Player.Character then
        local Character = Player.Character
        local Head = Character:FindFirstChild("Head")
        local Humanoid = Character:FindFirstChild("Humanoid")
        return Head and Humanoid and Humanoid.Health > 0
    end
    return false
end

local function IsEnemy(Player)
    return Player ~= LocalPlayer and (Player.Neutral or LocalPlayer.Neutral or Player.Team ~= LocalPlayer.Team)
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
    IsEnemy = IsEnemy,
    MouseDistanceToPoint = MouseDistanceToPoint,
}
