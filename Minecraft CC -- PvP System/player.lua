local playerLib = {}

function playerLib.create(name, rewards)
    local player = {}

    player.name = name
    player.rewards = rewards

    function player:isInTable(table)
        for _, v in pairs(table) do
            if(v.name == player.name) then
                return true
            end
        end

        return false
    end

    function player:findInTable(table)
        for i, v in pairs(table) do
            if(v.name == player.name) then
                return i
            end
        end
    end

    return player
end

return playerLib