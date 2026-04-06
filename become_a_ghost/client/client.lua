local isGhost = false

local function DebugPrint(msg)
    if Config.Debug then
        print("^2[CLIENT DEBUG]^7 " .. msg)
    end
end

-- STATEBAG SYNC
AddStateBagChangeHandler("ghostmode", nil, function(bagName, key, value)
    local player = GetPlayerFromStateBagName(bagName)
    if player == -1 then return end

    if player == PlayerId() then
        toggleGhost(value)
    else
        local ped = GetPlayerPed(player)
        if value then
            SetEntityAlpha(ped, Config.Alpha, false)
        else
            ResetEntityAlpha(ped)
        end
    end
end)

-- TOGGLE (komplett silent)
function toggleGhost(state)
    local ped = PlayerPedId()
    isGhost = state

    DebugPrint("Ghost: " .. tostring(state))

    if isGhost then
        SetEntityAlpha(ped, Config.Alpha, false)
        SetEntityCollision(ped, true, true)

        if Config.Invincible then
            SetEntityInvincible(ped, true)
        end
    else
        ResetEntityAlpha(ped)
        SetEntityCollision(ped, true, true)
        SetEntityInvincible(ped, false)
    end
end