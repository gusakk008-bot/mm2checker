loadstring([[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- ВСЕ ДРЕВНИЕ (GODLY) ИЗ PDF (точные цены)
local weaponValues = {
    ["Traveler's Gun"] = 5600,
    ["Evergun"] = 3450,
    ["Constellation"] = 2700,
    ["Evergreen"] = 2500,
    ["Turkey"] = 2450,
    ["Vampire's Gun"] = 1950,
    ["Alienbeam"] = 1875,
    ["Darkshot"] = 1750,
    ["Darksword"] = 1725,
    ["Raygun"] = 1650,
    ["Blossom"] = 1350,
    ["Sakura"] = 1340,
    ["Sunrise"] = 1125,
    ["Snowcannon"] = 850,
    ["Bauble"] = 825,
    ["Sunset"] = 625,
    ["Soul"] = 615,
    ["Spirit"] = 605,
    ["Rainbow Gun"] = 420,
    ["Flora"] = 410,
    ["Rainbow"] = 410,
    ["Bloom"] = 400,
    ["Heart Wand"] = 340,
    ["Ocean"] = 285,
    ["Waves"] = 280,
    ["Xenoknife"] = 280,
    ["Xenoshot"] = 280,
    ["Flowerwood Gun"] = 265,
    ["Blizzard"] = 260,
    ["Flowerwood"] = 260,
    ["Snowstorm"] = 260,
    ["Snow Dagger"] = 250,
    ["Watergun"] = 250,
    ["Icecream"] = 160,
    ["Treat"] = 155,
    ["Beachy"] = 150,
    ["Sands"] = 150,
    ["Sweet"] = 150,
    ["Borealis"] = 145,
    ["Australis"] = 140,
    ["Bat"] = 120,
    ["Pearlshine"] = 85,
    ["Pearl"] = 80,
    ["Candy"] = 80,
    ["Heartblade"] = 65,
    ["Luger"] = 40,
    ["Red Luger"] = 37,
    ["Phantom"] = 35,
    ["Spectre"] = 35,
    ["Candleflame"] = 33,
    ["Darkbringer"] = 33,
    ["Elderwood Blade"] = 33,
    ["Elderwood Revolver"] = 33,
    ["Iceblaster"] = 33,
    ["Lightbringer"] = 33,
    ["Makeshift"] = 33,
    ["Sugar"] = 32,
    ["Ornament"] = 30,
    ["Green Luger"] = 23,
    ["Amerilaser"] = 22,
    ["Laser"] = 22,
    ["Hallowgun"] = 20,
    ["Nightblade"] = 20,
    ["Shark"] = 20,
    ["Icebeam"] = 18,
    ["Plasmabeam"] = 18,
    ["Swirly Gun"] = 18,
    ["Battleaxe II"] = 17,
    ["Blaster"] = 17,
    ["Ginger Luger"] = 17,
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
    ["Nebula"] = 13,
    ["Virtual"] = 13,
    ["Battleaxe"] = 12,
    ["Gingermint"] = 12,
    ["Swirly Blade"] = 12,
    ["Chill"] = 10,
    ["Clockwork"] = 10,
    ["Fang"] = 10,
    ["Frostsaber"] = 10,
    ["Heat"] = 10,
    ["Spider"] = 10,
    ["Tides"] = 10,
    ["Bioblade"] = 8,
    ["Eternal III"] = 8,
    ["Eternal IV"] = 8,
    ["Hallow's Blade"] = 8,
    ["Hallow's Edge"] = 8,
    ["Handsaw"] = 8,
    ["Boneblade"] = 7,
    ["Eternal"] = 7,
    ["Eternal II"] = 7,
    ["Frostbite"] = 7,
    ["Ghostblade"] = 7,
    ["Ice Dragon"] = 7,
    ["Ice Shard"] = 7,
    ["Prismatic"] = 7,
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
}

-- СОСТОЯНИЯ (из PDF)
local weaponStability = {
    ["Traveler's Gun"] = "Stable",
    ["Evergun"] = "Stable",
    ["Constellation"] = "Stable",
    ["Evergreen"] = "Stable",
    ["Turkey"] = "Stable",
    ["Vampire's Gun"] = "Stable",
    ["Alienbeam"] = "Improving",
    ["Darkshot"] = "Doing Well",
    ["Darksword"] = "Doing Well",
    ["Raygun"] = "Overpaid For",
    ["Blossom"] = "Doing Well",
    ["Sakura"] = "Doing Well",
    ["Sunrise"] = "Stable",
    ["Snowcannon"] = "Stable",
    ["Bauble"] = "Stable",
    ["Sunset"] = "Stable",
    ["Soul"] = "Stable",
    ["Spirit"] = "Stable",
    ["Rainbow Gun"] = "Stable",
    ["Flora"] = "Stable",
    ["Rainbow"] = "Stable",
    ["Bloom"] = "Stable",
    ["Heart Wand"] = "Stable",
    ["Ocean"] = "Stable",
    ["Waves"] = "Stable",
    ["Xenoknife"] = "Stable",
    ["Xenoshot"] = "Stable",
    ["Flowerwood Gun"] = "Stable",
    ["Blizzard"] = "Stable",
    ["Flowerwood"] = "Stable",
    ["Snowstorm"] = "Stable",
    ["Snow Dagger"] = "Stable",
    ["Watergun"] = "Stable",
    ["Icecream"] = "Fluctuating",
    ["Treat"] = "Stable",
    ["Beachy"] = "Fluctuating",
    ["Sands"] = "Fluctuating",
    ["Sweet"] = "Stable",
    ["Borealis"] = "Stable",
    ["Australis"] = "Stable",
    ["Bat"] = "Fluctuating",
    ["Pearlshine"] = "Stable",
    ["Pearl"] = "Stable",
    ["Candy"] = "Stable",
    ["Heartblade"] = "Stable",
    ["Luger"] = "Stable",
    ["Red Luger"] = "Stable",
    ["Phantom"] = "Stable",
    ["Spectre"] = "Stable",
    ["Candleflame"] = "Stable",
    ["Darkbringer"] = "Stable",
    ["Elderwood Blade"] = "Stable",
    ["Elderwood Revolver"] = "Stable",
    ["Iceblaster"] = "Stable",
    ["Lightbringer"] = "Stable",
    ["Makeshift"] = "Stable",
    ["Sugar"] = "Stable",
    ["Ornament"] = "Fluctuating",
    ["Green Luger"] = "Stable",
    ["Amerilaser"] = "Stable",
    ["Laser"] = "Stable",
    ["Hallowgun"] = "Stable",
    ["Nightblade"] = "Stable",
    ["Shark"] = "Stable",
    ["Icebeam"] = "Stable",
    ["Plasmabeam"] = "Stable",
    ["Swirly Gun"] = "Stable",
    ["Battleaxe II"] = "Stable",
    ["Blaster"] = "Stable",
    ["Ginger Luger"] = "Stable",
    ["Pixel"] = "Stable",
    ["Gemstone"] = "Stable",
    ["Iceflake"] = "Stable",
    ["Old Glory"] = "Stable",
    ["Plasmablade"] = "Stable",
    ["Slasher"] = "Stable",
    ["Vampire's Edge"] = "Stable",
    ["Cookiecane"] = "Stable",
    ["Deathshard"] = "Stable",
    ["Eternalcane"] = "Stable",
    ["Gingerblade"] = "Stable",
    ["Jinglegun"] = "Stable",
    ["Lugercane"] = "Stable",
    ["Minty"] = "Stable",
    ["Nebula"] = "Stable",
    ["Virtual"] = "Stable",
    ["Battleaxe"] = "Stable",
    ["Gingermint"] = "Stable",
    ["Swirly Blade"] = "Stable",
    ["Chill"] = "Stable",
    ["Clockwork"] = "Stable",
    ["Fang"] = "Stable",
    ["Frostsaber"] = "Stable",
    ["Heat"] = "Stable",
    ["Spider"] = "Stable",
    ["Tides"] = "Stable",
    ["Bioblade"] = "Stable",
    ["Eternal III"] = "Stable",
    ["Eternal IV"] = "Stable",
    ["Hallow's Blade"] = "Stable",
    ["Hallow's Edge"] = "Stable",
    ["Handsaw"] = "Stable",
    ["Boneblade"] = "Stable",
    ["Eternal"] = "Stable",
    ["Eternal II"] = "Stable",
    ["Frostbite"] = "Stable",
    ["Ghostblade"] = "Stable",
    ["Ice Dragon"] = "Stable",
    ["Ice Shard"] = "Stable",
    ["Prismatic"] = "Stable",
    ["Pumpking"] = "Stable",
    ["Saw"] = "Stable",
    ["Xmas"] = "Stable",
    ["Eggblade"] = "Stable",
    ["Flames"] = "Stable",
    ["Snowflake"] = "Stable",
    ["Winter's Edge"] = "Stable",
    ["Peppermint"] = "Stable",
    ["Cookieblade"] = "Stable",
    ["Blue Seer"] = "Stable",
    ["Purple Seer"] = "Stable",
    ["Red Seer"] = "Stable",
    ["Seer"] = "Stable",
    ["Orange Seer"] = "Stable",
}

local function getWeaponValue(weaponName)
    for name, value in pairs(weaponValues) do
        if string.find(weaponName, name) or string.find(name, weaponName) then
            return value
        end
    end
    return 0
end

local function getWeaponStability(weaponName)
    for name, stability in pairs(weaponStability) do
        if string.find(weaponName, name) or string.find(name, weaponName) then
            return stability
        end
    end
    return "Unknown"
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
                local stability = getWeaponStability(name)
                table.insert(weapons, {name = name, value = value, stability = stability})
            end
        end
    end
    local character = plr.Character
    if character then
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name
                local value = getWeaponValue(name)
                local stability = getWeaponStability(name)
                table.insert(weapons, {name = name, value = value, stability = stability})
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
    bg.BackgroundTransparency = 0.5
    bg.Parent = screenGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 580, 0, 440)
    frame.Position = UDim2.new(0.5, -290, 0.5, -220)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(60, 60, 150)
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Text = "⚡ MM2 GODLY CHECKER (SUPREME VALUES)"
    title.TextColor3 = Color3.fromRGB(255, 200, 50)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.BackgroundTransparency = 1
    title.Parent = frame

    local myCurLabel = Instance.new("TextLabel")
    myCurLabel.Size = UDim2.new(0, 200, 0, 20)
    myCurLabel.Position = UDim2.new(0, 5, 0, 32)
    myCurLabel.Text = "💰 " .. player.Name .. ": " .. getPlayerCurrency(player)
    myCurLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    myCurLabel.TextScaled = true
    myCurLabel.BackgroundTransparency = 1
    myCurLabel.Font = Enum.Font.GothamBold
    myCurLabel.Parent = frame

    local partnerCurLabel = Instance.new("TextLabel")
    partnerCurLabel.Size = UDim2.new(0, 200, 0, 20)
    partnerCurLabel.Position = UDim2.new(0, 300, 0, 32)
    partnerCurLabel.Text = "💰 " .. tradePartner.Name .. ": " .. getPlayerCurrency(tradePartner)
    partnerCurLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    partnerCurLabel.TextScaled = true
    partnerCurLabel.BackgroundTransparency = 1
    partnerCurLabel.Font = Enum.Font.GothamBold
    partnerCurLabel.Parent = frame

    local myInvFrame = Instance.new("Frame")
    myInvFrame.Size = UDim2.new(0, 275, 0, 240)
    myInvFrame.Position = UDim2.new(0, 5, 0, 60)
    myInvFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    myInvFrame.BorderSizePixel = 1
    myInvFrame.BorderColor3 = Color3.fromRGB(70, 70, 180)
    myInvFrame.Parent = frame

    local myInvTitle = Instance.new("TextLabel")
    myInvTitle.Size = UDim2.new(1, 0, 0, 20)
    myInvTitle.Text = "🧰 " .. player.Name .. " (инвентарь)"
    myInvTitle.TextColor3 = Color3.fromRGB(100, 255, 100)
    myInvTitle.TextScaled = true
    myInvTitle.BackgroundTransparency = 1
    myInvTitle.Font = Enum.Font.GothamBold
    myInvTitle.Parent = myInvFrame

    local myScroll = Instance.new("ScrollingFrame")
    myScroll.Size = UDim2.new(1, -5, 1, -25)
    myScroll.Position = UDim2.new(0, 2, 0, 22)
    myScroll.BackgroundTransparency = 1
    myScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    myScroll.Parent = myInvFrame

    local partnerInvFrame = Instance.new("Frame")
    partnerInvFrame.Size = UDim2.new(0, 275, 0, 240)
    partnerInvFrame.Position = UDim2.new(0, 300, 0, 60)
    partnerInvFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    partnerInvFrame.BorderSizePixel = 1
    partnerInvFrame.BorderColor3 = Color3.fromRGB(180, 130, 70)
    partnerInvFrame.Parent = frame

    local partnerInvTitle = Instance.new("TextLabel")
    partnerInvTitle.Size = UDim2.new(1, 0, 0, 20)
    partnerInvTitle.Text = "🧰 " .. tradePartner.Name .. " (инвентарь)"
    partnerInvTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
    partnerInvTitle.TextScaled = true
    partnerInvTitle.BackgroundTransparency = 1
    partnerInvTitle.Font = Enum.Font.GothamBold
    partnerInvTitle.Parent = partnerInvFrame

    local partnerScroll = Instance.new("ScrollingFrame")
    partnerScroll.Size = UDim2.new(1, -5, 1, -25)
    partnerScroll.Position = UDim2.new(0, 2, 0, 22)
    partnerScroll.BackgroundTransparency = 1
    partnerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    partnerScroll.Parent = partnerInvFrame

    local function fillInventory(scroll, plr, color)
        local weapons = getInventoryWeapons(plr)
        local totalValue = 0
        local y = 0
        if #weapons == 0 then
            local empty = Instance.new("TextLabel")
            empty.Size = UDim2.new(1, 0, 0, 20)
            empty.Text = "❌ Нет оружий"
            empty.TextColor3 = Color3.fromRGB(150, 150, 150)
            empty.TextScaled = true
            empty.BackgroundTransparency = 1
            empty.Font = Enum.Font.Gotham
            empty.Parent = scroll
            y = 25
        else
            for _, data in ipairs(weapons) do
                totalValue = totalValue + data.value
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0, 18)
                label.Position = UDim2.new(0, 0, 0, y)
                local stabilityIcon = "⚖️"
                if data.stability == "Improving" then stabilityIcon = "📈"
                elseif data.stability == "Doing Well" then stabilityIcon = "✅"
                elseif data.stability == "Overpaid For" then stabilityIcon = "🔥"
                elseif data.stability == "Fluctuating" then stabilityIcon = "📊"
                end
                label.Text = "⚔ " .. data.name .. "  [" .. data.value .. "] " .. stabilityIcon
                label.TextColor3 = color
                label.TextScaled = true
                label.BackgroundTransparency = 1
                label.Font = Enum.Font.Gotham
                label.Parent = scroll
                y = y + 20
            end
        end
        scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
        return totalValue
    end

    local myTotal = fillInventory(myScroll, player, Color3.fromRGB(100, 255, 100))
    local partnerTotal = fillInventory(partnerScroll, tradePartner, Color3.fromRGB(255, 200, 100))

    local totalLabel = Instance.new("TextLabel")
    totalLabel.Size = UDim2.new(0, 450, 0, 25)
    totalLabel.Position = UDim2.new(0.5, -225, 0.88, 0)
    totalLabel.Text = "💎 " .. player.Name .. " = " .. myTotal .. "  |  " .. tradePartner.Name .. " = " .. partnerTotal
    totalLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    totalLabel.TextScaled = true
    totalLabel.BackgroundTransparency = 1
    totalLabel.Font = Enum.Font.GothamBold
    totalLabel.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 60, 0, 25)
    closeBtn.Position = UDim2.new(0.92, 0, 0.01, 0)
    closeBtn.Text = "✖"
    closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    closeBtn.BorderSizePixel = 0
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextScaled = true
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    return screenGui
end

local function detectTradeWindow()
    local playerGui = player:WaitForChild("PlayerGui")
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and (string.find(gui.Name, "Trade") or string.find(gui.Name, "trade")) then
            local partnerName = nil
            for _, label in ipairs(gui:GetDescendants()) do
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
            break
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

print("✅ MM2 GODLY CHECKER ACTIVATED (SUPREME VALUES)")
print("📌 Все древние из PDF загружены")
print("💎 Всего оружий:", #weaponValues)
]])()
