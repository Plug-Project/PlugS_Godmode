fx_version 'adamant'

game 'gta5'

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

client_scripts {
	'@vrp/client/Tunnel.lua',
	'@vrp/client/Proxy.lua',
    '@vrp/lib/utils.lua', 
	'client.lua'
}