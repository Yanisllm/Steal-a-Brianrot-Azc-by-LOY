--[[
    💠 AZC Ultimate Script GUI
    📜 Developed by: L O Y
    🛡️ AZC Team © 2025
    🚀 Features: Instant Steal, God Mode, Speed, Fly, Wall Hack, Jump Boost
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

pcall(function() PlayerGui:FindFirstChild("AZC_GUI"):Destroy() end)

local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "AZC_GUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 350, 0, 400)
frame.Position = UDim2.new(0.5, -175, 0.45, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🔹 AZC Panel - By L O Y"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22

-- Button factory
local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, posY, 0)
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 16
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
end

-- Instant Steal (Temporary Teleport)
createButton("📦 Instant Steal", 0.15, function()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local oldPos = hrp.Position
    hrp.CFrame = CFrame.new(Vector3.new(-411.599, -6.5, 52.04))
    task.wait(10)
    hrp.CFrame = CFrame.new(oldPos)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[AZC] تمت السرقة بنجاح";
        Color = Color3.fromRGB(0, 255, 0);
    })
end)

-- God Mode
createButton("💀 God Mode", 0.26, function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.HealthChanged:Connect(function()
        if hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
    end)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[AZC] God Mode مفعل.";
        Color = Color3.fromRGB(0, 255, 0);
    })
end)

-- Speed Boost
createButton("⚡ Speed Boost", 0.37, function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = 100 end
end)

-- Fly
createButton("🚀 Fly (Toggle F)", 0.48, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7Drew7/FE-Fly-GUI/main/FlyGUI.txt"))()
end)

-- Wall Hack (X-ray)
createButton("🔍 Wall Hack", 0.59, function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Transparency < 1 and obj.CanCollide then
            obj.Transparency = 0.5
            obj.Material = Enum.Material.ForceField
        end
    end
end)

-- Jump Boost
createButton("⛏️ Jump Boost", 0.7, function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = 150 end
end)

-- Credits
local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -20)
credit.BackgroundTransparency = 1
credit.Text = "🔐 AZC Team | By L O Y - 2025"
credit.TextColor3 = Color3.fromRGB(160, 160, 160)
credit.Font = Enum.Font.GothamItalic
credit.TextSize = 12
