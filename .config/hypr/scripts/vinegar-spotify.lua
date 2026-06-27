local Trigerred = false

hl.on("window.open", function(NewWindow)
    if NewWindow.class == "robloxstudiobeta.exe" then
        if Trigerred then return end
        Trigerred = true
        hl.exec_cmd('notify-send "SpotifyPlayer" "Vinegar detected: turning on"')
        hl.exec_cmd("spotify --uri=spotify:playlist:7ojgtMOqHj88q8M4cs606g & sleep 1 && playerctl --player=spotify open spotify:playlist:7ojgtMOqHj88q8M4cs606g")
    end
end)

hl.on("window.close", function(RemovingWindow)
    if RemovingWindow.class == "robloxstudiobeta.exe" then
        Trigerred = false
    end
end)
