local Core = exports.vorp_core:GetCore()

local function DebugPrint(msg)
    if Config.Debug then
        print("^3[DEBUG]^7 " .. msg)
    end
end

-- 🔗 Discord Webhook
local function SendWebhook(playerName, charName, state)
    if Config.Webhook == "" then return end

    local color = state and 65280 or 16711680
    local status = state and "ON" or "OFF"

    local embed = {
        {
            ["color"] = color,
            ["title"] = "Ghost Mode",
            ["description"] = ("**Player:** %s\n**Character:** %s\n**State:** %s")
                :format(playerName, charName, status),
            ["footer"] = {
                ["text"] = os.date("%d.%m.%Y %H:%M:%S")
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function() end, "POST", json.encode({
        username = "Ghost Logger",
        embeds = embed
    }), { ["Content-Type"] = "application/json" })
end

RegisterCommand(Config.Command, function(source)
    local User = Core.getUser(source)
    if not User then return end

    local Character = User.getUsedCharacter
    if not Character then return end

    -- 🔒 ADMIN CHECK
    if Character.group ~= Config.RequiredGroup then
        DebugPrint("Kein Zugriff: " .. GetPlayerName(source))
        return
    end

    local playerName = GetPlayerName(source)
    local charName = Character.firstname .. " " .. Character.lastname

    local state = Player(source).state
    local newState = not state.ghostmode

    state:set("ghostmode", newState, true)

    DebugPrint(playerName .. " -> " .. tostring(newState))

    SendWebhook(playerName, charName, newState)
end, false)