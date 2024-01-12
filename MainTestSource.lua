local UIS = game:GetService("UserInputService")
local Plrs = game:GetService("Players")
local RunService = game:GetService("RunService")

local SilentAimRange = 200
local Camera = workspace.CurrentCamera

local gmt = getrawmetatable(game)
setreadonly(gmt, false)

local namecall = gmt.__namecall

local function ClosestPlr()
    local Mouse = UIS:GetMouseLocation()
    local Dist = {math.huge}
    for i, Target in pairs(Plrs:GetPlayers()) do
        if Target.Team == Plrs.LocalPlayer.Team then
            continue
        end
        local chr = Target.Character
        if not chr then
            continue
        end
        local Position, onScreen = Camera:WorldToScreenPoint(chr.HumanoidRootPart.Position)
        local Distance = (Mouse - Vector2.new(Position.X, Position.Y)).Magnitude
        if Distance < Dist[1] and Distance < SilentAimRange then
            Dist[1] = Distance
            Dist[2] = chr 
        end
    end

    return Dist[2]
end

local function KillChr(Character)
    local args = {
        [1] = Character.Head.Position,
    }
    game.Players.LocalPlayer.Character.Sniper.Damage:FireServer(unpack(args))
end

gmt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if tostring(method) == "FireServer" and tostring(self) == "ShotTarget" then
        local Closest = ClosestPlr()
        if Closest then
            KillChr(Closest)
        end
    end
    return namecall(self, ...)
end)
