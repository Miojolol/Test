if game.PlaceId == 9791603388 then
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()





local Window = Fluent:CreateWindow({
    Title = "Cookie Ware // Underground War 2.0 // "..getexecutorname() ,
    SubTitle = "github.com/Miojolol",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftAlt
})


local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "scroll" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    ESP = Window:AddTab({ Title = "ESP", Icon = "users" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}


wait(2)
Fluent:Notify({
    Title = "Cookie Ware",
    Content = "Reach bypass has been activated for this game ",
    SubContent = "", 
    Duration = 8
})
game.RunService.RenderStepped:Connect(function()
	local hellofrombrazillol = game.Players.LocalPlayer
	hellofrombrazillol.Character["L_Optimizations"].Disabled = true
	hellofrombrazillol.Character["L_AntiCheat"].Disabled = true
end)

local WalkSpeedInput = Tabs.Main:AddInput("WalkSpeed", {
    Title = "Walk Speed",
    Default = "",
    Placeholder = "",
    Numeric = true, 
    Finished = true, 
    Callback = function(character,v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

local JumpPowerInput = Tabs.Main:AddInput("Jump Power", {
    Title = "Jump Power",
    Default = "",
    Placeholder = "",
    Numeric = true, 
    Finished = true, 
    Callback = function(character,v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end
})


local EnCFSp = Tabs.Main:AddToggle("Enable CFrame Speed", {Title = "Enable CFrame Speed", Default = false})

    EnCFSp:OnChanged(function(v)
        _G.SpeedCFrameEnabled = v
    end)


local CFrameSpeedInput = Tabs.Main:AddInput("CFrame Speed", {
    Title = "CFrame Speed",
    Default = "",
    Placeholder = "",
    Numeric = true, 
    Finished = true, 
    Callback = function(Speed)
     if _G.SpeedCFrameEnabled then
        game.RunService.RenderStepped:Connect(function()
            _G.CFrameSpeed = Speed
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * _G.CFrameSpeed
        end)
    end
})



end
