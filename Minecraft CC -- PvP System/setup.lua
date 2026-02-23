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

download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/ui.lua?token=GHSAT0AAAAAADWEUVWYU4BAQZKNBDK5WVJU2M4TKVA", "utils/ui.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/utils/db.lua?token=GHSAT0AAAAAADWEUVWZIDEL7PI234RUK5V42M4TKMQ", "utils/db.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/pvp_guis.lua?token=GHSAT0AAAAAADWEUVWYR4HKAANIVUK7YKRC2M4TJHA", "pvp_guis.lua")
download("https://raw.githubusercontent.com/KosaGames/CCTweaked-Programs/refs/heads/main/Minecraft%20CC%20--%20PvP%20System/startup.lua?token=GHSAT0AAAAAADWEUVWZXRJWKOIROKX7JEJG2M4TJYA", "startup.lua")

print("Installation abgeschlossen!")