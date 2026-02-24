local playerLib = {}

function playerLib.create(name, rewards)
    local player = {}

    player.name = name
    player.rewards = rewards

    function player:isInTable(dbTable)
        for _, v in pairs(dbTable.data) do
            if(v.name == player.name) then
                return true
            end
        end

        return false
    end

    function player:findInTable(dbTable)
        for k, v in pairs(dbTable.data) do
            if(v.name == player.name) then
                return k, v
            end
        end
    end

    function player:toDbObj()
        local dbObj = {}

        dbObj.name = player.name
        dbObj.rewards = player.rewards

        return dbObj
    end

    return player
end

return playerLib