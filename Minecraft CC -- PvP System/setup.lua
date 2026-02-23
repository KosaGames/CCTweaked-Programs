local function download(url, path)
    print("Loading " .. path .. " ...")
    local response = http.get(url)

    if response then
        local file = fs.open(path, "w")
        file.write(response.readAll())
        file.close()
        response.close()
        return true
    else
        return false
    end
end

local links = {
    ["utils/ui.lua"] = "https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/ui.lua",
    ["utils/db.lua"] = "https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/db.lua",
    ["pvp_guis.lua"] = "https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/pvp_guis.lua",
    ["startup.lua"] = "https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/startup.lua"
}

for fileName, link in pairs(links) do
    local success = download(link, fileName)

    if success then
        print(fileName.." was installed.")
    else
        print("ERROR WHILE LOADING \""..fileName.."\"")
    end
    
end

print("Installation abgeschlossen!")