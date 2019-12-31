local webhook = "Get your own damn webhook" -- Paste webhook link here
local discord_name = "Twitter" -- Discord0 "bot" name
local discord_image = "https://i.imgur.com/VXWFs8b.png" -- Default is the twitter logo

RegisterCommand("tweet", function(source, args, raw)
    local name = GetPlayerName(source)
    local message = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, "Twitter | " .. name, { 30, 144, 255 }, message)
    sendToDiscord("@" .. name .. " Tweeted:", " " .. message .. " ", 65280)
end, false)



function sendToDiscord(name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "The 100% Real Official Twitter",
            },
        }
    }
  PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.discord_name, embeds = connect, avatar_url = Config.discord_image}), { ['Content-Type'] = 'application/json' })
end