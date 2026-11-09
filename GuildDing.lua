local announcements = {
    "Ding! Level %d!",
    "Made it to %d! The gear might catch up someday.",
    "Level %d. Still pulling one mob too many.",
    "Level %d! That went exactly as planned. There was a plan, right?",
    "Level %d! Save me a seat by the campfire.",
    "Level %d! Tell the trainer to put it on my tab.",
    "Level %d! My bags are full of things I swear I’ll use.",
    "Level %d! Thanks for the company, guildies.",
    "Ding! Hit level %d in %s!",
    "Greetings from %s! I just made it to level %d.",
}

local lastAnnouncement
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")

frame:SetScript("OnEvent", function(self, event, level)
    if not IsInGuild() then
        return
    end

    local zone = GetZoneText and GetZoneText()
    local count = #announcements - 2
    if zone and zone ~= "" then
        count = #announcements
    end

    local choice
    if lastAnnouncement and lastAnnouncement <= count then
        choice = math.random(count - 1)
        if choice >= lastAnnouncement then
            choice = choice + 1
        end
    else
        choice = math.random(count)
    end

    local announcement
    if choice == #announcements then
        announcement = announcements[choice]:format(zone, level)
    else
        announcement = announcements[choice]:format(level, zone)
    end
    local message = "(René) " .. announcement

    if C_ChatInfo and C_ChatInfo.SendChatMessage then
        C_ChatInfo.SendChatMessage(message, "GUILD")
    else
        SendChatMessage(message, "GUILD")
    end
    lastAnnouncement = choice
end)
