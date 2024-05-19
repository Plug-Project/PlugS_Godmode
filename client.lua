vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())

godModeC = {}
Tunnel.bindInterface(GetCurrentResourceName(), godModeC)
Proxy.addInterface(GetCurrentResourceName(), godModeC)
godModeS = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

local peds = {}

function godModeC.changeGodmode(player)
    local ped = PlayerPedId(player)
    local isPlayerInArray = false

    -- Check if the player is already in the god mode array
    for i, storedPed in ipairs(peds) do
        if storedPed == ped then
            isPlayerInArray = true
            table.remove(peds, i) -- Remove player from the god mode array
            vRP.notify({"갓모드 꺼짐"})
            break
        end
    end

    -- If the player is not in the god mode array, add them
    if not isPlayerInArray then
        table.insert(peds, ped) -- Add player to the god mode array
        vRP.notify({"갓모드 켜짐"})
    end
end


function godModeC.getMode(ped)
    local isPlayerInArray = false

    for _, storedPed in ipairs(peds) do
        if storedPed == ped then
            isPlayerInArray = true
            break
        end
    end

    return isPlayerInArray
end


Citizen.CreateThread(function() -- Godmode for specific peds
    while true do
        Citizen.Wait(1)

        for _, ped in ipairs(peds) do
            SetEntityHealth(ped, 200)
            SetEntityInvincible(ped, true)
            SetPlayerInvincible(PlayerId(), true)
            SetPedCanRagdoll(ped, not true)
            ClearPedBloodDamage(ped)
            ResetPedVisibleDamage(ped)
            ClearPedLastWeaponDamage(ped)
            SetEntityProofs(ped, true, true, true, true, true, true, true, true)
            SetEntityOnlyDamagedByPlayer(ped, not true)
            SetEntityCanBeDamaged(ped, not true)
        end
    end
end)
