if KillAll then KillAll() end

local killw = true

local KillAll = setmetatable(configs or {
	whitelist = {},
	AutoToxic = true, 
		killw = true
end})
getgenv().KillAll = KillAll

local cloneref = cloneref or function(obj) return obj end
local Players = cloneref(game:GetService("Players"))
local lp = cloneref(Players.LocalPlayer)

local function getchar(plr)
	return (plr or lp).Character
end

local function gethumanoid(plr)
	local char = plr and plr:IsA("Model") and plr or getchar(plr)
	return (char and char:FindFirstChildWhichIsA("Humanoid")),char 
end

local function toolget(plr)
	local chr = plr and plr:IsA("Model") and plr or getchar(plr)
	return (char and char:FindFirstChildWhichIsA("Tool")),char 
end

local function GetDamageRemote(Tool)
	return Tool and Tool:FindFirstChildWhichIsA("RemoteEvent",true)
end

local function IsValidMember(obj,plr)
	return obj:IsDescendantOf(plr or game)	
end

local function CheckIfIsAlive(Humanoid)
	return Humanoid and (IsValidMember(Humanoid) and Humanoid.Health > 0)
end

local function GetHum()
	local Humanoids = {}
	for i,v in Players:GetPlayers() do
		if not table.find(KillAll.whitelist,v.Name or v.DisplayName) then
			local Humanoid,chr = gethumanoid(v)
			if CheckIfIsAlive then 
				Humanoids[chr] = Humanoid
			end
		end
	end
	return Humanoids
end
--KillAll
table.insert(KillAll.whitelist,lp.Name)
	while killw do
		for char,Humanoid in GetHum() do
			local DamageRemote = GetDamageRemote(toolget())
			
			if DamageRemote then
				if IsValidMeber(lpchar) and not char:FindFirstChildWhichIsA("ForceField")
				if CheckIfIsAlive(Humanoid) then
					local lp = getchar() 
					local InvalidMember = false
					repeat
						if killw and IsValidMember(lpchar) and IsValidMember(DamageRemote,lpchar) then
							DamageRemote:FireServer(Humanoid)
							task.wait()
						else
							InvalidMember = true
							break
						end
					until not CheckIfIsAlive(Humanoid)
						if not InvalidMember then
							local Player = char.Name
							warn("Sucessfully killed: ",Player)
							else
								warn("DamageRemote not found")
							end
						end
			end
			else
				break
			end
	end
	task.wait()
	end
	
