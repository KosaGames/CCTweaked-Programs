local db = {}

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function db.init(nbt_storage)
    db.nbt_storage = nbt_storage
    db.data = db.nbt_storage.read()
end

function db:hasTable(name)
    for k, _ in pairs(db.data) do
        if(k == name) then
            return true
        end
    end

    return false
end

function db:createTable(name, data)
    local dbTable = {}
    dbTable.name = name
    dbTable.data = data

    function dbTable:readFromDB()
        return db.data[name]
    end

    function dbTable:writeVal(value)
        dbTable.data = value
    end

    function dbTable:contains(value)
        for _, v in pairs(dbTable.data) do
            if(v == value) then return true end
        end

        return false
    end

    function dbTable:insertVal(value)
        if(not dbTable:contains(value)) then
            table.insert(dbTable.data, value)
            return true
        end
        return false
    end

    function dbTable:getIndexOfVal(value)
        for i, v in ipairs(dbTable.data) do
            if(v == value) then return i end
        end
    end

    function dbTable:deleteVal(value)
        local index = dbTable:getIndexOfVal(value)

        if not (index == nil) then
            table.remove(dbTable.data, index)
            return true
        end

        return false
    end

    function dbTable:saveChanges()
        if(not db:hasTable(dbTable.name)) then
            table.insert(db.data, {[dbTable.name] = {}})
        end

        db.data[dbTable.name] = dbTable.data
        db.nbt_storage.writeTable(db.data)
    end

    return dbTable
end

function db:findTable(name)
    for k, v in pairs(db.data) do
        if(k == name) then return db:createTable(k, v) end
    end
end

function db:printData()
    dump(db.data)
end

return db