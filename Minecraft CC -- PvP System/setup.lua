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

download("https://raw.githubusercontent.com/USERNAME/REPO/main/main.lua", "main.lua")
download("https://raw.githubusercontent.com/USERNAME/REPO/main/lib/util.lua", "lib/util.lua")

print("Installation abgeschlossen!")