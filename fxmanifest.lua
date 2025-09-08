fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'mnr_blips'
description 'The definitive resource for blips management'
author 'IlMelons'
version '1.1.0'
repository 'https://github.com/Monarch-Development/mnr_blips'

files {
    'init.lua',
    'config/*.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}