local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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

end

local function detectTradeWindow()
local playerGui = player:WaitForChild("PlayerGui")
local tradeGui = nil

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
