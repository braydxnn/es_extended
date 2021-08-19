fx_version 'cerulean'
game 'gta5'
description 'Overextended'

version 'legacy'

shared_scripts {
	'locale.lua',
	'locales/en.lua',

	'config.lua',
	'config.weapons.lua',

	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

server_scripts {
	'server/common.lua',
	'server/classes/player.lua',
	'server/functions.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/commands.lua',
	'server/onesync.lua',
}

client_scripts {
	'client/common.lua',
	'client/entityiter.lua',
	'client/functions.lua',
	'client/wrapper.lua',
	'client/main.lua',

	'client/modules/death.lua',
	'client/modules/scaleform.lua',
	'client/modules/streaming.lua',
}

ui_page {
	'html/ui.html'
}

files {
	'imports.lua',
	'locale.js',
	'html/ui.html',

	'html/css/app.css',

	'html/js/mustache.min.js',
	'html/js/wrapper.js',
	'html/js/app.js',

	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',

	'html/img/accounts/bank.png',
	'html/img/accounts/black_money.png',
	'html/img/accounts/money.png'
}

dependencies {
	'oxmysql',
	'spawnmanager',
}

exports {
	'getSharedObject'
}

server_exports {
	'getSharedObject'
}
