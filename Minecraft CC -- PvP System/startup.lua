local pvp_guis = require("pvp_guis")
local dbLib = require("utils/db")
local playerLib = require("player")

local monitor = peripheral.find("monitor")
local storage = peripheral.find("nbt_storage")
local db = dbLib.init(storage)
local chatbox = peripheral.find("chat_box")
local detector = peripheral.find("player_detector")

local currentGui = {}

local function intersect(x1, y1, x2, y2, xClicked, yClicked)
    return (math.min(x1, x2) <= xClicked and math.max(x1, x2) >= xClicked) and 
    (math.min(y1, y2) <= yClicked and math.max(y1, y2) >= yClicked)
end

local function getTouchedButton(x, y)
    if currentGui.buttons == nil then error("No Button was drawn. Use drawButton first", 2) end

    for _, button in pairs(currentGui.buttons) do
        if intersect(button.x1, button.y1, button.x2, button.y2, x, y) then
            return button
        end
    end
end

local function monitorResize()
    os.pullEvent("monitor_resize")
    currentGui = pvp_guis.drawHomeScreen(monitor)
end

local function playerJoined()
    local event, username, dimension = os.pullEvent("playerJoin")

    if db == nil then return end

    local players = db:findTable("Players")
    local player = playerLib.create(username, {})

    if not(player:isInTable(players)) then
        players:insert(player:toDbObj())
        players:saveChanges()
    else
        local index, player = player:findInTable(players)

        print(player.name)
    end
end

local function monitorTouched()
    local event, side, x, y = os.pullEvent("monitor_touch")
    local button = getTouchedButton(x, y)

    if button == nil then return end

    if button == "bet" then
        currentGui = pvp_guis.drawBet(monitor, db:findTable("Players").data)
    end
end

currentGui = pvp_guis.drawHomeScreen(monitor)

while true do
    local event = parallel.waitForAny(monitorResize, monitorTouched, playerJoined)
end