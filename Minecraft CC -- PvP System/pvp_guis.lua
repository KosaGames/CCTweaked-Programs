local ui = require("utils/ui")
local guis = {}

function guis.drawHomeScreen(monitor)
    local gui = ui.createGUI(monitor, 1, colors.black, colors.white, colors.white, colors.black)
    local grid = ui.createGrid(gui, 2, 5, 1)

    grid:centerText("-- KOPFGELD SYSTEM --", 1, 1, 2, 1)

    grid:createButton("bet", "Kopfgeld setzen", 1, 2, 2, 2)
    grid:createButton("stats", "Aktuelle Kopfgelder", 1, 4, 1, 2)
    grid:createButton("shop", "SHOP", 2, 4, 1, 2)

    return gui
end

return guis