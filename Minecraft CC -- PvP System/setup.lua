local function download(url, path)
    print("Lade " .. path .. " ...")
    local response = http.get(url)

    if response then
        local file = fs.open(path, "w")
        file.write(response.readAll())
        file.close()
        response.close()
        print("Fertig!")
    else
        print("Fehler beim Laden von " .. url)
    end
end

write("Token: ")
local token = read()

download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/ui.lua?token="..token, "utils/ui.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/db.lua?token="..token, "utils/db.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/pvp_guis.lua?token="..token, "pvp_guis.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/startup.lua?token="..token, "startup.lua")

print("Installation abgeschlossen!")