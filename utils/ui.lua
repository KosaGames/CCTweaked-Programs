local ui = {}

function ui.createGUI(monitor, textScale, backgroundColor, textColor, buttonColorBackground, buttonColorText)
    local gui = {}

    monitor.setTextScale(textScale)
    monitor.setBackgroundColor(backgroundColor)
    monitor.setTextColor(textColor)
    monitor.clear()

    gui.monitor = monitor
    gui.textScale = textScale
    gui.backgroundColor = backgroundColor
    gui.textColor = textColor
    gui.buttonColorBackground = buttonColorBackground
    gui.buttonColorText = buttonColorText
    gui.buttons = {}

    return gui
end

function ui.createGrid(gui, cols, rows, padding) 
    local grid = {}

    grid.cols = cols
    grid.rows = rows
    grid.padding = padding

    function grid:getCell(col, row, colSpan, rowSpan)
        colSpan = colSpan or 1
        rowSpan = rowSpan or 1

        if colSpan < 1 then error("colSpan has to be at least 1") end
        if rowSpan < 1 then error("rowSpan has to be at least 1") end

        local w, h = gui.monitor.getSize()

        local x1 = (col - 1) * math.floor(w / grid.cols) + padding + 1
        local x2 = (col + colSpan - 1) * math.floor(w / grid.cols) - padding + 1

        local y1 = (row - 1) * math.floor(h / grid.rows) + padding + 1
        local y2 = (row + rowSpan - 1) * math.floor(h / grid.rows) - padding + 1

        return x1, y1, x2, y2
    end

    function grid:drawBox(col, row, colSpan, rowSpan, color)
        color = color or gui.backgroundColor

        local x1, y1, x2, y2 = grid:getCell(col, row, colSpan, rowSpan)
        
        gui.monitor.setBackgroundColor(color)

        for i = y1, y2 do
            gui.monitor.setCursorPos(x1, i)
            gui.monitor.write(string.rep(" ", x2 - x1))
        end
    end

    function grid:centerText(text, col, row, colSpan, rowSpan, colorText, colorBg)
        colorText = colorText or gui.textColor
        colorBg = colorBg or gui.backgroundColor

        local x1, y1, x2, y2 = grid:getCell(col, row, colSpan, rowSpan)

        local startX = math.floor((x2 - x1 - #text) / 2) + x1
        local startY = math.floor((y2 - y1) / 2) + y1
        
        gui.monitor.setCursorPos(startX, startY)
        gui.monitor.setBackgroundColor(colorBg)
        gui.monitor.setTextColor(colorText)
        gui.monitor.write(text)
    end

    function grid:createButton(id, text, col, row, colSpan, rowSpan, backgroundColor, textColor)
        local button = {}

        grid:drawBox(col, row, colSpan, rowSpan, backgroundColor or gui.buttonColorBackground)
        grid:centerText(text, col, row, colSpan, rowSpan, textColor or gui.buttonColorText, backgroundColor or gui.buttonColorBackground)

        button.ID = id
        button.text = text
        button.x1, button.y1, button.x2, button.y2 =  grid:getCell(col, row, colSpan, rowSpan)

        table.insert(gui.buttons, button)
    end

    return grid
end

return ui