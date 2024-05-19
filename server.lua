local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())

godModeS = {}
Tunnel.bindInterface(GetCurrentResourceName(), godModeS)
godModeC = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())


local sechanGodMode = {
    function(player, choice)
        godModeC.changeGodmode(player)
    end
}


vRP.registerMenuBuilder({"admin", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}

        if vRP.hasPermission({user_id, "admin.sechan"}) then
            choices["*완전 갓모드"] = sechanGodMode
        end
        add(choices)
    end
end})