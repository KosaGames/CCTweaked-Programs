local ui = require("utils/ui")
local guis = {}

function guis.drawHomeScreen(monitor)
    local gui = ui.createGUI(monitor, 1, colors.black, colors.white, colors.white, colors.black)
    local grid = ui.createGrid(gui, 2, 5, 1)

    grid:centerText("-- KOPFGELD SYSTEM --", 1, 1, 2, 1)

    grid:createButton("bet", "Kopfgeld setzen", 1, 2, 2, 2)
    grid:createButton("stats", "Aktuelle Kopfgelder", 1, 4, 2, 2)
    -- grid:createButton("shop", "SHOP", 2, 4, 1, 2)

    return gui
end

function guis.drawBet(monitor, players)
    local gui = ui.createGUI(monitor, 1, colors.black, colors.white, colors.white, colors.black)
    local rows = 5
    local cols = 4
    local grid = ui.createGrid(gui, cols, rows, 1)

    grid:centerText("-- KOPFGELD SETZEN --", 1, 1, 4, 1)

    for iNum, player in pairs(players) do
        local i = tonumber(iNum) - 1
        local col = i % cols + 1
        local row = math.floor(i / rows) + 1
        local colSpan = cols - (math.floor(i / cols) + 1)
        local rowSpan = 1
        grid:createButton(player.name, player.name, col, row, colSpan, rowSpan)
    end
end

return guis