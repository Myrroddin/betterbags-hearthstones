# BetterBags - Hearthstones
Plugin module for the World of Warcraft AddOn [BetterBags](https://www.curseforge.com/wow/addons/better-bags) that sorts all items that provide "hearthing" mechanics into a virtual group.

## World of Warcraft Supported Versions

- Classic Era. Includes Classic Era, hardcore, and seasons
- Wrath Classic
- Mainline or retail. Currently that is Dragonflight

## Supported Items
Just like [AdiBags_Hearthstones](https://www.curseforge.com/wow/addons/adibags-hearthstones), items are added by WoW expansion to the virtual groups. Items that do not exist because the expansion doesn't support them are not added. The full list can be [viewed online](https://github.com/Myrroddin/betterbags-hearthstones/blob/main/Database.lua) or with any text editor. I suggest [Notepad++](https://notepad-plus-plus.org/) which will maintain readability of the Lua file when reading directly from the AddOn folder.

## Downloads

- Curseforge
- Wago AddOns
- Wowinterface

## Incompatible BetterBags Modules

- BetterBags - Teleports

Use either the Teleports module or the Hearthstones module, not both. The Hearthstones module supports more items and is compatible with all WoW versions. The Hearthstones module will wipe and remove any items added to the Teleports module but does not disable the Teleports module. You must delete your choice of module from the `World of Warcraft\_game_version_\Interface\AddOns\` folder, keeping the module you want. You can use an AddOn manager app to delete the unwanted AddOn.