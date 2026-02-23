local chatbox = peripheral.find("chatbox")
local nbCommand = "//nightbot"

local function sendChat(message)
    chatbox.sendMessage(message, "$aNightBot$r", "<>")
end

local function sendFormattedChat(messageJSON)
    chatbox.sendFormattedMessage(textutils.serializeJSON(messageJSON), "$aNightBot$r", "<>")
end

local function switch(value, cases)
    local func = cases[value] or cases.default
    if func then
        return func()
    end
end

local function createHelpLine(command, description)
    return "§a"..nbCommand.." "..command.."§r".." §7// "..description.."§r\n"
end

function help()
    return {
        {text = "§bAktuelle Commands§r\n"},
        {text = createHelpLine("weapon early|mid|end", "Anleitungen zu starken Waffen je nach Fortschritt")},
        {text = createHelpLine("AE2 storage|crafting|subnet", "Anleitungen zu einem starken ME System")},
        {text = createHelpLine("tipp", "Random Tipp")},
        {text = createHelpLine("energy transfer|storage|wireless", "Tipps rund um Energie")},
        {text = createHelpLine("chunkloading", "Wie loade ich Chunks?")}
    }
end

while true do
    local event, username, message, uuid, isHidden, messageUFT8 = os.pullEvent("chat")

    if(string.sub(message, 1, #nbCommand) == nbCommand) then
        local command = string.sub(message, #nbCommand + 2, #message)

        switch(command, {
            ["help"] = sendFormattedChat(help()),
            default = sendChat("§cCommand wurde nicht erkannt.§r")
        })
    end
end