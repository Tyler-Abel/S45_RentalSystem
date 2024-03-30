fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'Shizter45 - A re-creation of Abel Gaming\'s rental system'
author 'Shizter45'
version 'v1.0'

client_scripts {
  'config.lua',
  'client/*.lua'
}

server_scripts {
  'config.lua',
  'server/main.lua'
}

dependencies {
  'nh-context'
}
