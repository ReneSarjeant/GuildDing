local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")

frame:SetScript("OnEvent", function(self, event, level)
    if IsInGuild() then
        local message = "(René) Ding! Level " .. level .. "!"
        if C_ChatInfo and C_ChatInfo.SendChatMessage then
            C_ChatInfo.SendChatMessage(message, "GUILD")
        else
            SendChatMessage(message, "GUILD")
        end
    end
end)
