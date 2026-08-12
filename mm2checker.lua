local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local weaponValues = {
    ["Alienbeam"] = 1875,
    ["Darkshot"] = 1750,
    ["Darksword"] = 1725,
    ["Raygun"] = 1650,
    ["Blossom"] = 1350,
    ["Sakura"] = 1340,
    ["Pixel"] = 17,
    ["Gemstone"] = 15,
    ["Iceflake"] = 15,
    ["Old Glory"] = 15,
    ["Plasmablade"] = 15,
    ["Slasher"] = 15,
    ["Vampire's Edge"] = 15,
    ["Cookiecane"] = 13,
    ["Deathshard"] = 13,
    ["Eternalcane"] = 13,
    ["Gingerblade"] = 13,
    ["Jinglegun"] = 13,
    ["Lugercane"] = 13,
    ["Minty"] = 13,
    ["Pumpking"] = 7,
    ["Saw"] = 7,
    ["Xmas"] = 7,
    ["Eggblade"] = 5,
    ["Flames"] = 5,
    ["Snowflake"] = 5,
    ["Winter's Edge"] = 5,
    ["Peppermint"] = 4,
    ["Cookieblade"] = 3,
    ["Blue Seer"] = 3,
    ["Purple Seer"] = 3,
    ["Red Seer"] = 3,
    ["Seer"] = 3,
    ["Orange Seer"] = 2,
    ["Ornament"] = 30,
    ["Chroma"] = 5000,
    ["Chroma Darkbringer"] = 6500,
    ["Chroma Lightbringer"] = 6200,
    ["Chroma Gemstone"] = 5500,
    ["Chroma Heat"] = 5200,
    ["Chroma Laser"] = 4900,
    ["Chroma Saw"] = 4600,
    ["Chroma Old Glory"] = 4300,
    ["Chroma Amerilaser"] = 4100,
    ["Chroma Blaster"] = 3900,
    ["Darkbringer"] = 4000,
    ["Lightbringer"] = 3800,
    ["Heat"] = 2800,
    ["Laser"] = 2500,
    ["Amerilaser"] = 1800,
    ["Blaster"] = 1600,
    ["Knife"] = 100,
    ["Gun"] = 120,
    ["Sword"] = 150,
    ["Axe"] = 130,
    ["Bow"] = 140,
    ["Bat"] = 110,
    ["Hammer"] = 125,
}

local function getWeaponValue(weaponName)
    for name, value in pairs(weaponValues) do
        if string.find(weaponName, name) or string.find(name, weaponName) then
            return value
        end
    end
    return 0
end

local function getPlayerCurrency(plr)
    local ls = plr:FindFirstChild("leaderstats")
    if ls then
        local cash = ls:FindFirstChild("Coins") or ls:FindFirstChild("Cash") or ls:FindFirstChild("Money")
        if cash then return cash.Value end
    end
    return 0
end

local function getInventoryWeapons(plr)
    local weapons = {}
    local backpack = plr:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name
                local value = getWeaponValue(name)
                table.insert(weapons, {name = name, value = value})
            end
        end
    end
    local character = plr.Character
    if character then
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name
                local value = getWeaponValue(name)
                table.insert(weapons, {name = name, value = value})
            end
        end
    end
    return weapons
end

local function createTradeInfoGUI(tradePartner)
    local playerGui = player:WaitForChild("PlayerGui")
    local old = playerGui:FindFirstChild("TradeInfoGUI")
    if old then old:Destroy() end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TradeInfoGUI"
    screenGui.Parent = playerGui
    screenGui.ResetOnSpawn = false

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.75
    bg.Parent = screenGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 850, 0, 600)
    frame.Position = UDim2.new(0.5, -425, 0.5, -300)
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 28)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(100, 100, 255)
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 45)
    title.Text = "🔥 MM2 TRADE CHECKER — SUPREME VALUES"
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.BackgroundTransparency = 1
    title.Parent = frame

    local myCurrency = getPlayerCurrency(player)
    local partnerCurrency = getPlayerCurrency(tradePartner)
    
    local myCurLabel = Instance.new("TextLabel")
    myCurLabel.Size = UDim2.new(0, 370, 0, 32)
    myCurLabel.Position = UDim2.new(0, 10, 0, 50)
    myCurLabel.Text = "💰 " .. player.Name .. ": " .. myCurrency .. " монет"
    myCurLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    myCurLabel.TextScaled = true
    myCurLabel.BackgroundTransparency = 1
    myCurLabel.Font = Enum.Font.GothamBold
    myCurLabel.Parent = frame

    local partnerCurLabel = Instance.new("TextLabel")
    partnerCurLabel.Size = UDim2.new(0, 370, 0, 32)
    partnerCurLabel.Position = UDim2.new(0, 10, 0, 82)
    partnerCurLabel.Text = "💰 " .. tradePartner.Name .. ": " .. partnerCurrency .. " монет"
    partnerCurLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    partnerCurLabel.TextScaled = true
    partnerCurLabel.BackgroundTransparency = 1
    partnerCurLabel.Font = Enum.Font.GothamBold
    partnerCurLabel.Parent = frame

    local myInvFrame = Instance.new("Frame")
    myInvFrame.Size = UDim2.new(0, 400, 0, 220)
    myInvFrame.Position = UDim2.new(0, 10, 0, 120)
    myInvFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    myInvFrame.BorderSizePixel = 1
    myInvFrame.BorderColor3 = Color3.fromRGB(80, 80, 200)
    myInvFrame.Parent = frame

    local myInvTitle = Instance.new("TextLabel")
    myInvTitle.Size = UDim2.new(1, 0, 0, 28)
    myInvTitle.Text = "🧰 " .. player.Name .. " (инвентарь)"
    myInvTitle.TextColor3 = Color3.fromRGB(100, 255, 100)
    myInvTitle.TextScaled = true
    myInvTitle.BackgroundTransparency = 1
    myInvTitle.Font = Enum.Font.GothamBold
    myInvTitle.Parent = myInvFrame

    local myScroll = Instance.new("ScrollingFrame")
    myScroll.Size = UDim2.new(1, -10, 1, -38)
    myScroll.Position = UDim2.new(0, 5, 0, 32)
    myScroll.BackgroundTransparency = 1
    myScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    myScroll.Parent = myInvFrame

    local partnerInvFrame = Instance.new("Frame")
    partnerInvFrame.Size = UDim2.new(0, 400, 0, 220)
    partnerInvFrame.Position = UDim2.new(0, 440, 0, 120)
    partnerInvFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    partnerInvFrame.BorderSizePixel = 1
    partnerInvFrame.BorderColor3 = Color3.fromRGB(200, 150, 80)
    partnerInvFrame.Parent = frame

    local partnerInvTitle = Instance.new("TextLabel")
    partnerInvTitle.Size = UDim2.new(1, 0, 0, 28)
    partnerInvTitle.Text = "🧰 " .. tradePartner.Name .. " (инвентарь)"
    partnerInvTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
    partnerInvTitle.TextScaled = true
    partnerInvTitle.BackgroundTransparency = 1
    partnerInvTitle.Font = Enum.Font.GothamBold
    partnerInvTitle.Parent = partnerInvFrame

    local partnerScroll = Instance.new("ScrollingFrame")
    partnerScroll.Size = UDim2.new(1, -10, 1, -38)
    partnerScroll.Position = UDim2.new(0, 5, 0, 32)
    partnerScroll.BackgroundTransparency = 1
    partnerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    partnerScroll.Parent = partnerInvFrame

    local function fillInventory(scroll, plr, color)
        local weapons = getInventoryWeapons(plr)
        local totalValue = 0
        local y = 0
        if #weapons == 0 then
            local empty = Instance.new("TextLabel")
            empty.Size = UDim2.new(1, 0, 0, 25)
            empty.Text = "❌ Нет оружий"
            empty.TextColor3 = Color3.fromRGB(150, 150, 150)
            empty.TextScaled = true
            empty.BackgroundTransparency = 1
            empty.Font = Enum.Font.Gotham
            empty.Parent = scroll
            y = 30
        else
            for _, data in ipairs(weapons) do
                totalValue = totalValue + data.value
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 25)
                label.Position = UDim2.new(0, 0, 0, y)
                label.Text = "⚔ " .. data.name .. " — " .. data.value .. " монет"
                label.TextColor3 = color
                label.TextScaled = true
                label.BackgroundTransparency = 1
                label.Font = Enum.Font.Gotham
                label.Parent = scroll
                y = y + 28
            end
        end
        scroll.CanvasSize = UDim2.new(0, 0, 0, y)
        return totalValue
    end

    local myTotal = fillInventory(myScroll, player, Color3.fromRGB(100, 255, 100))
    local partnerTotal = fillInventory(partnerScroll, tradePartner, Color3.fromRGB(255, 200, 100))

    local totalLabel = Instance.new("TextLabel")
    totalLabel.Size = UDim2.new(0, 700, 0, 40)
    totalLabel.Position = UDim2.new(0.5, -350, 0.9, 0)
    totalLabel.Text = "💎 ОБЩАЯ СТОИМОСТЬ: " .. player.Name .. " = " .. myTotal .. " | " .. tradePartner.Name .. " = " .. partnerTotal .. " монет"
    totalLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    totalLabel.TextScaled = true
    totalLabel.BackgroundTransparency = 1
    totalLabel.Font = Enum.Font.GothamBold
    totalLabel.Parent = frame

    local diff = myTotal - partnerTotal
    local diffLabel = Instance.new("TextLabel")
    diffLabel.Size = UDim2.new(0, 300, 0, 30)
    diffLabel.Position = UDim2.new(0.5, -150, 0.96, 0)
    if diff > 0 then
        diffLabel.Text = "📈 Вы в плюсе на " .. diff .. " монет"
        diffLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    elseif diff < 0 then
        diffLabel.Text = "📉 Вы в минусе на " .. math.abs(diff) .. " монет"
        diffLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    else
        diffLabel.Text = "⚖️ Равная стоимость"
        diffLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    diffLabel.TextScaled = true
    diffLabel.BackgroundTransparency = 1
    diffLabel.Font = Enum.Font.GothamBold
    diffLabel.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 120, 0, 35)
    closeBtn.Position = UDim2.new(0.88, 0, 0.01, 0)
    closeBtn.Text = "✖ ЗАКРЫТЬ"
    closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    closeBtn.BorderSizePixel = 0
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextScaled = true
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local refreshBtn = Instance.new("TextButton")
    refreshBtn.Size = UDim2.new(0, 120, 0, 35)
    refreshBtn.Position = UDim2.new(0.76, 0, 0.01, 0)
    refreshBtn.Text = "🔄 ОБНОВИТЬ"
    refreshBtn.TextColor3 = Color3.fromRGB(100, 200, 255)
    refreshBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 80)
    refreshBtn.BorderSizePixel = 0
    refreshBtn.Font = Enum.Font.GothamBold
    refreshBtn.TextScaled = true
    refreshBtn.Parent = frame
    refreshBtn.MouseButton1Click:Connect(function()
        createTradeInfoGUI(tradePartner)
    end)

    return screenGui
end

local function detectTradeWindow()
    local playerGui = player:WaitForChild("PlayerGui")
    local tradeGui = nil
    
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and (string.find(gui.Name, "Trade") or string.find(gui.Name, "trade")) then
            tradeGui = gui
            break
        end
    end
    
    if tradeGui then
        local partnerName = nil
        for _, label in ipairs(tradeGui:GetDescendants()) do
            if label:IsA("TextLabel") or label:IsA("TextButton") then
                local text = label.Text or ""
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= player and string.find(text, plr.Name) then
                        partnerName = plr.Name
                        break
                    end
                end
            end
            if partnerName then break end
        end
        
        if partnerName then
            local partner = Players:FindFirstChild(partnerName)
            if partner then
                createTradeInfoGUI(partner)
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    local playerGui = player:FindFirstChild("PlayerGui")
    if playerGui then
        local hasTrade = false
        for _, gui in ipairs(playerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and (string.find(gui.Name, "Trade") or string.find(gui.Name, "trade")) then
                hasTrade = true
                break
            end
        end
        if hasTrade then
            if not playerGui:FindFirstChild("TradeInfoGUI") then
                detectTradeWindow()
            end
        else
            local infoGui = playerGui:FindFirstChild("TradeInfoGUI")
            if infoGui then
                infoGui:Destroy()
            end
        end
    end
end)

print("✅ MM2 TRADE CHECKER ACTIVATED")
print("📌 Открывай трейд — всё покажется автоматически")
print("💎 Загружено оружий:", #weaponValues)
