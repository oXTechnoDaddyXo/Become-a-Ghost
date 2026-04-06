--[[
    ╔═══════════════════════════════════════════════════════════════════╗
    ║                                                                   ║
    ║           B E C O M E  A  G H O S T                               ║
    ║           ─────────────────────────                               ║
    ║            VORP Ghost transforming                                ║
    ║            Redemption Script                                      ║
    ║                                                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   Server:    Destiny Flats RP                                     ║
    ║   Creator:   oXTechnoKhaliXo                                      ║
    ║   Discord:   https://discord.gg/djt7QQMkVa                        ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   © 2026 oXTechnoKhaliXo | All Rights Reserved                    ║
    ╚═══════════════════════════════════════════════════════════════════╝
]]
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'oXTechnoKhaliXo'
description 'A lightweight RedM (VORP) script that allows admins to make themselves semi-invisible via command.'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}
