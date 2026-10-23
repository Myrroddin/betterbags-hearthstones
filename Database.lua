--[[
BetterBags_Hearthstones - Adds various hearthing items to BetterBags virtual groups
Copyright © 2024-2026 Paul Vandersypen, All Rights Reserved
]]--

local _, addon = ...

-- need to check game version
local isSoD = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC) and (C_Seasons and C_Seasons.GetActiveSeason() == Enum.SeasonID.SeasonOfDiscovery)
local isForever = WOW_PROJECT_ID == WOW_PROJECT_CAMELOT
local isBCC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local isMists = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
local isStandard = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

local database = {}

-- all game versions have these items
database[6948]		= true	-- Hearthstone
database[9173]		= true	-- Goblin Transponder
database[17191] 	= true	-- Scepter of Celebras
database[17690] 	= true	-- Frostwolf Insignia Rank 1
database[17691] 	= true	-- Stormpike Insignia Rank 1
database[17900] 	= true	-- Stormpike Insignia Rank 2
database[17901] 	= true	-- Stormpike Insignia Rank 3
database[17902] 	= true	-- Stormpike Insignia Rank 4
database[17903] 	= true	-- Stormpike Insignia Rank 5
database[17904] 	= true	-- Stormpike Insignia Rank 6
database[17905] 	= true	-- Frostwolf Insignia Rank 2
database[17906] 	= true	-- Frostwolf Insignia Rank 3
database[17907] 	= true	-- Frostwolf Insignia Rank 4
database[17908] 	= true	-- Frostwolf Insignia Rank 5
database[17909] 	= true	-- Frostwolf Insignia Rank 6
database[18149] 	= true	-- Rune of Recall (Frostwolf Keep)
database[18150] 	= true	-- Rune of Recall (Dun Baldar)
database[18984] 	= true	-- Dimensional Ripper - Everlook
database[18986] 	= true	-- Ultrasafe Transporter - Gadgetzan
database[21711] 	= true	-- Lunar Festival Invitation
database[22589] 	= true	-- Atiesh, Greatstaff of the Guardian (Mage)
database[22630] 	= true	-- Atiesh, Greatstaff of the Guardian (Warlock)
database[22631] 	= true	-- Atiesh, Greatstaff of the Guardian (Priest)
database[22632] 	= true	-- Atiesh, Greatstaff of the Guardian (Druid)

-- add items unique to Season of Discovery
if isSoD then
	database[208425]	= true	-- Shiny Archaic Vestige
	database[216494]	= true	-- Aragriar's Whimsical World Warper
end

-- add items shared by Season of Discovery and Forever
if isSoD or isForever then
	database[213548]	= true	-- Scroll of Liminal Passage
	database[238734]	= true	-- Tinkerbox: Teleport
	database[238781]	= true	-- Semisafe Transporter: New Avalon
end

-- add items unique to Forever
if isForever then
	database[241128]	= true	-- Pile of Portiporters
	database[260819]	= true	-- EZ-Thro Field Transporter: Gadgetzan
	database[260820]	= true	-- SAF-T Emergency Ripper: Everlook
	database[260821]	= true	-- EZ and SAF Field Transporter: Mt. Hyjal
	database[260823]	= true	-- Dimensional Transporter - Mt. Hyjal
	database[260830]	= true	-- SAF-T Teleport
end

-- add items for Burning Crusade Classic, Mists Classic, and retail
if isBCC or isMists or isStandard then
	database[28585] 	= true	-- Ruby Slippers
	database[29796] 	= true	-- Socrethar's Teleportation Stone
	database[30542] 	= true	-- Dimensional Ripper - Area 52
	database[30544] 	= true	-- Ultrasafe Transporter: Toshley's Station
	database[30695] 	= true	-- Legion Teleporter Control
	database[32757] 	= true	-- Blessed Medallion of Karabor
	database[35230] 	= true	-- Darnarian's Scroll of Teleportation
	database[37863] 	= true	-- Direbrew's Remote
	database[184871]	= true	-- Dark Portal (TBC)
end

-- add items shared by Burning Crusade Classic and Mists Classic
if isBCC or isMists then
	database[260221]	= true	-- Naaru's Embrace
end

-- add items for Mists Classic and retail
if isMists or isStandard then
	-- remove inherited items that no longer provide travel
	database[9173]		= nil	-- Goblin Transponder
	database[17191]		= nil	-- Scepter of Celebras

	database[36747] 	= true	-- Surge Needle Teleporter
	database[37118] 	= true	-- Scroll of Recall
	database[38685] 	= true	-- Teleport Scroll: Zul'Farrak
	database[40582] 	= true	-- Scourgestone
	database[40585] 	= true	-- Signet of the Kirin Tor
	database[40586] 	= true	-- Band of the Kirin Tor
	database[43824] 	= true	-- The Schools of Arcane Magic - Mastery (spires atop the Violet Citadel)
	database[44314] 	= true	-- Scroll of Recall II
	database[44315] 	= true	-- Scroll of Recall III
	database[44934] 	= true	-- Loop of the Kirin Tor
	database[44935] 	= true	-- Ring of the Kirin Tor
	database[45688] 	= true	-- Inscribed Band of the Kirin Tor
	database[45689] 	= true	-- Inscribed Loop of the Kirin Tor
	database[45690] 	= true	-- Inscribed Ring of the Kirin Tor
	database[45691] 	= true	-- Inscribed Signet of the Kirin Tor
	database[46874] 	= true	-- Argent Crusader's Tabard
	database[48933] 	= true	-- Wormhole Generator: Northrend
	database[48954] 	= true	-- Etched Band of the Kirin Tor
	database[48955] 	= true	-- Etched Loop of the Kirin Tor
	database[48956] 	= true	-- Etched Ring of the Kirin Tor
	database[48957] 	= true	-- Etched Signet of the Kirin Tor
	database[50287] 	= true	-- Boots of the Bay
	database[51557] 	= true	-- Runed Signet of the Kirin Tor
	database[51558] 	= true	-- Runed Loop of the Kirin Tor
	database[51559] 	= true	-- Runed Ring of the Kirin Tor
	database[51560] 	= true	-- Runed Band of the Kirin Tor
	database[52251] 	= true	-- Jaina's Locket
	database[54452] 	= true	-- Ethereal Portal
	database[58487] 	= true	-- Potion of Deepholm
	database[58964] 	= true	-- Chabal's Fetish
	database[61379] 	= true	-- Gidwin's Hearthstone
	database[62394] 	= true	-- Fire Portal Controller
	database[63206] 	= true	-- Wrap of Unity: Stormwind
	database[63207] 	= true	-- Wrap of Unity: Orgrimmar
	database[63352] 	= true	-- Shroud of Cooperation: Stormwind
	database[63353] 	= true	-- Shroud of Cooperation: Orgrimmar
	database[63378] 	= true	-- Hellscream's Reach Tabard
	database[63379] 	= true	-- Baradin's Wardens Tabard
	database[64457] 	= true	-- The Last Relic of Argus
	database[64488] 	= true	-- The Innkeeper's Daughter
	database[65274] 	= true	-- Cloak of Coordination: Orgrimmar
	database[65360] 	= true	-- Cloak of Coordination: Stormwind
	database[66061] 	= true	-- Bluescale Sigil
	database[68808] 	= true	-- Hero's Hearthstone
	database[68809] 	= true	-- Veteran's Hearthstone
	database[87215] 	= true	-- Wormhole Generator: Pandaria
	database[87548] 	= true	-- Lorewalker's Lodestone
	database[91850] 	= true	-- Orgrimmar Portal Shard
	database[91860] 	= true	-- Stormwind Portal Shard
	database[91861] 	= true	-- Thunder Bluff Portal Shard
	database[91862] 	= true	-- Undercity Portal Shard
	database[91863] 	= true	-- Silvermoon Portal Shard
	database[91864] 	= true	-- Ironforge Portal Shard
	database[91865] 	= true	-- Darnassus Portal Shard
	database[91866] 	= true	-- Exodar Portal Shard
	database[92056] 	= true	-- Portal Fuel: Sparkrocket Outpost
	database[92057] 	= true	-- Portal Fuel: Orgrimmar
	database[92058] 	= true	-- Portal Fuel: Shrine of Two Moons
	database[92430] 	= true	-- Portal Reagents: Shrine of Seven Stars
	database[92431] 	= true	-- Portal Reagents: Stormwind
	database[92432] 	= true	-- Portal Reagents: Skyfire
	database[92510] 	= true	-- Vol'jin's Hearthstone
	database[93672] 	= true	-- Dark Portal (MoP)
	database[95050] 	= true	-- The Brassiest Knuckle (Brawl'gar Arena)
	database[95051] 	= true	-- The Brassiest Knuckle (Bizmo's Brawlpub)
	database[95567] 	= true	-- Kirin Tor Beacon
	database[95568] 	= true	-- Sunreaver Beacon
	database[103678]	= true	-- Time-Lost Artifact (trinket)
	database[104110]	= true	-- Curious Bronze Timepiece (Horde)
	database[104113]	= true	-- Curious Bronze Timepiece (Alliance)
	database[199335]	= true	-- Teleport Scroll: Menethil Harbor
	database[199336]	= true	-- Teleport Scroll: Stormwind Harbor
	database[199777]	= true	-- Teleport Scroll: Orgrimmar Zepplin Tower (Borean Tundra)
	database[199778]	= true	-- Teleport Scroll: Undercity Zepplin Tower (Howling Fjord)
	database[200068]	= true	-- Teleport Scroll: Shattrath City
	database[210046]	= true	-- Teleport Scroll: Northrend (Alliance)
	database[210047]	= true	-- Teleport Scroll: Northrend (Horde)
	database[224452]	= true	-- Teleport Scroll: Stormwind
	database[224458]	= true	-- Teleport Scroll: Orgrimmar
end

-- add everything else for mainline
if isStandard then
	-- remove inherited items unavailable or inactive in Retail
	database[38685] 	= nil	-- Teleport Scroll: Zul'Farrak
	database[40582] 	= nil	-- Scourgestone
	database[184871]	= nil	-- Dark Portal (TBC)
	database[199335]	= nil	-- Teleport Scroll: Menethil Harbor
	database[199336]	= nil	-- Teleport Scroll: Stormwind Harbor
	database[199777]	= nil	-- Teleport Scroll: Orgrimmar Zepplin Tower (Borean Tundra)
	database[199778]	= nil	-- Teleport Scroll: Undercity Zepplin Tower (Howling Fjord)
	database[200068]	= nil	-- Teleport Scroll: Shattrath City
	database[210046]	= nil	-- Teleport Scroll: Northrend (Alliance)
	database[210047]	= nil	-- Teleport Scroll: Northrend (Horde)
	database[224452]	= nil	-- Teleport Scroll: Stormwind
	database[224458]	= nil	-- Teleport Scroll: Orgrimmar

	-- please note that Improved Flightmaster Whistle, itemID: 158897 is not a valid item in the game
	-- Wowhead lists it, yet it shares the same itemID (141605) as the regular Flightmaster Whistle

	-- mainline items
	database[110560]	= true	-- Garrison Hearthstone
	database[112059]	= true	-- Wormhole Centrifuge
	database[117389]	= true	-- Draenor Archaeologist's Lodestone
	database[118662]	= true	-- Bladespire Relic
	database[118663]	= true	-- Relic of Karabor
	database[118907]	= true	-- Pit Fighter's Punching Ring (Bizmo's Brawlpub)
	database[118908]	= true	-- Pit Fighter's Punching Ring (Brawl'gar Arena)
	database[119183]	= true	-- Scroll of Risky Recall
	database[128353]	= true	-- Admiral's Compass
	database[128502]	= true	-- Hunter's Seeking Crystal
	database[128503]	= true	 -- Master Hunter's Seeking Crystal
	database[129276]	= true	-- Beginner's Guide to Dimensional Rifting
	database[129929]	= true	-- Ever-Shifting Mirror
	database[132119]	= true	-- Orgrimmar Portal Stone
	database[132120]	= true	-- Stormwind Portal Stone
	database[132517]	= true	-- Intra-Dalaran Wormhole Generator
	database[132523]	= true	-- Reaves Battery
	database[138448]	= true	-- Emblem of Margoss
	database[139590]	= true	-- Scroll of Teleport: Ravenholdt
	database[139599]	= true	-- Empowered Ring of the Kirin Tor
	database[140192]	= true	-- Dalaran Hearthstone (toy)
	database[140324]	= true	-- Mobile Telemancy Beacon
	database[140493]	= true	-- Adept's Guide to Dimensional Rifting
	database[141013]	= true	-- Scroll of Town Portal: Shala'nir
	database[141014]	= true	-- Scroll of Town Portal: Sashj'tar
	database[141015]	= true	-- Scroll of Town Portal: Kal'delar
	database[141016]	= true	-- Scroll of Town Portal: Faronaar
	database[141017]	= true	-- Scroll of Town Portal: Lian'tril
	database[141324]	= true	-- Talisman of the Shal'dorei
	database[141605]	= true	-- Flight Master's Whistle
	database[142298]	= true	-- Astonishingly Scarlet Slippers
	database[142469]	= true	-- Violet Seal of the Grand Magus
	database[142542]	= true	-- Tome of Town Portal (Diablo 3 event)
	database[142543]	= true	-- Scroll of Town Portal (Diablo 3 event)
	database[144341]	= true	-- Rechargeable Reaves Battery
	database[144391]	= true	-- Pugilist's Powerful Punching Ring (Alliance)
	database[144392]	= true	-- Pugilist's Powerful Punching Ring (Horde)
	database[147870]	= true	-- Strange Dimensional Shard
	database[150733]	= true	-- Scroll of Town Portal (Ar'gorok in Arathi)
	database[151016]	= true	-- Fractured Necrolyte Skull
	database[151652]	= true	-- Wormhole Generator: Argus
	database[159224]	= true	-- Zuldazar Hearthstone
	database[160219]	= true	-- Scroll of Town Portal (Stromgarde in Arathi)
	database[162515]	= true	-- Midnight Salmon
	database[162973]	= true	-- Greatfather Winter's Hearthstone
	database[163045]	= true	-- Headless Horseman's Hearthstone
	database[163073]	= true	-- Conch of Wa'mundi (Alliance)
	database[163694]	= true	-- Scroll of Luxurious Recall
	database[165669]	= true	-- Lunar Elder's Hearthstone
	database[165670]	= true	-- Peddlefeet's Lovely Hearthstone
	database[165802]	= true	-- Noble Gardener's Hearthstone
	database[166559]	= true	-- Commander's Signet of Battle
	database[166560]	= true	-- Captain's Signet of Command
	database[166746]	= true	-- Fire Eater's Hearthstone
	database[166747]	= true	-- Brewfest Reveler's Hearthstone
	database[167075]	= true	-- Ultrasafe Transporter: Mechagon
	database[168807]	= true	-- Wormhole Generator: Kul Tiras
	database[168808]	= true	-- Wormhole Generator: Zandalar
	database[168862]	= true	-- G.E.A.R. Tracking Beacon
	database[168907]	= true	-- Holographic Digitalization Hearthstone
	database[169064]	= true	-- Mountebank's Colorful Cloak
	database[169297]	= true	-- Stormpike Insignia
	database[169298]	= true	-- Frostwolf Insignia
	database[169862]	= true	-- Alluring Bloom
	database[171151]	= true	-- Conch of Wa'mundi (Horde)
	database[172179]	= true	-- Eternal Traveler's Hearthstone
	database[172203]	= true	-- Cracked Hearthstone
	database[172924]	= true	-- Wormhole Generator: Shadowlands
	database[173373]	= true	-- Faol's Hearthstone
	database[173430]	= true	-- Nexus Teleport Scroll
	database[173528]	= true	-- Gilded Hearthstone
	database[173532]	= true	-- Elwynn Forest Scroll
	database[173537]	= true	-- Glowing Hearthstone
	database[173716]	= true	-- Mossy Hearthstone
	database[180290]	= true	-- Night Fae Hearthstone
	database[180817]	= true	-- Cypher of Relocation (Ve'nari's Refuge)
	database[181163]	= true	-- Scroll of Teleport: Theater of Pain
	database[182773]	= true	-- Necrolord's Hearthstone
	database[183716]	= true	-- Venthyr Sinstone
	database[184353]	= true	-- Kyrian Hearthstone
	database[184500]	= true	-- Attendant's Pocket Portal: Bastion
	database[184501]	= true	-- Attendant's Pocket Portal: Revendreth
	database[184502]	= true	-- Attendant's Pocket Portal: Maldraxxus
	database[184503]	= true	-- Attendant's Pocket Portal: Ardenweald
	database[184504]	= true	-- Attendant's Pocket Portal: Oribos
	database[188152]	= true	-- Gateway Control Shard
	database[188952]	= true	-- Dominated Hearthstone
	database[189827]	= true	-- Cartel Xy's Proof of Initiation
	database[190196]	= true	-- Enlightened Hearthstone
	database[190237]	= true	-- Broker Translocation Matrix
	database[190742]	= true	-- Dimensional Enigmatic Footguards
	database[190745]	= true	-- Dimensional Numerus Handguards
	database[190748]	= true	-- Dimensional Cryptic Grips
	database[190751]	= true	-- Dimensional Oracular Wrists
	database[191029]	= true	-- Lilian's Hearthstone
	database[193000]	= true	-- Ring-Bound Hourglass
	database[193588]	= true	-- Timewalker's Hearthstone
	database[198156]	= true	-- Wyrmhole Generator: Dragon Isles
	database[200613]	= true	-- Aylaag Windstone Fragment
	database[200630]	= true	-- Ohn'ir Windsage's Hearthstone
	database[201957]	= true	-- Thrall's Hearthstone
	database[202046]	= true	-- Lucky Tortollan Charm
	database[204481]	= true	-- Morqut Hearth Totem
	database[204802]	= true	-- Scroll of Teleport: Zskera Vaults
	database[205255]	= true	-- Niffen Diggin' Mitts
	database[205456]	= true	-- Lost Dragonscale (1)
	database[205458]	= true	-- Lost Dragonscale (2)
	database[206195]	= true	-- Path of the Naaru
	database[208704]	= true	-- Deepdweller's Earthen Hearthstone
	database[209035]	= true	-- Hearthstone of the Flame
	database[210455]	= true	-- Draenic Hologem
	database[211788]	= true	-- Tess's Peacebloom
	database[212337]	= true	-- Stone of the Hearth
	database[219222]	= true	-- Time-Lost Artifact
	database[221965]	= true	-- Prototype: Wormhole Generator: Khaz Algar
	database[221966]	= true	-- Wormhole Generator: Khaz Algar
	database[223988]	= true	-- Dalaran Hearthstone (1 charge quest item)
	database[226107]	= true	-- Homebrewed Blink Vial
	database[227669]	= true	-- Teleportation Scroll (1 charge quest item)
	database[228940]	= true	-- Notorious Thread's Hearthstone
	database[228996]	= true	-- Relic of Crystal Connections
	database[230850]	= true	-- Delve-O Bot 7001
	database[234389]	= true	-- Gallagio Loyalty Rewards Card: Silver
	database[235016]	= true	-- Redeployment Module
	database[236687]	= true	-- Explosive Hearthstone
	database[238379]	= true	-- Warping Wise
	database[238727]	= true	-- Nostwin's Voucher
	database[239151]	= true	-- Light's Summon
	database[243056]	= true	-- Delver's Mana-Bound Ethergate
	database[245970]	= true	-- P.O.S.T. Master's Express Hearthstone
	database[246565]	= true	-- Cosmic Hearthstone
	database[248131]	= true	-- Key to the Arcantina
	database[248485]	= true	-- Wormhole Generator: Quel'Thalas
	database[249230]	= true	-- Temple of Zin-Malor Scroll
	database[249699]	= true	-- Shadowguard Translocator
	database[250411]	= true	-- Timerunner's Hearthstone
	database[252607]	= true	-- Abundant Beacon
	database[253629]	= true	-- Personal Key to the Arcantina
	database[257736]	= true	-- Lightcalled Hearthstone
	database[258736]	= true	-- Scroll of Town Portal: Masters' Perch
	database[263489]	= true	-- Naaru's Enfold
	database[263933]	= true	-- Preyseeker's Hearthstone
	database[265100]	= true	-- Corewarden's Hearthstone
	database[266370]	= true	-- Dundun's Abundant Travel Method
	database[281615]	= true	-- Shadeweaver's Hearthstone
end

-- return data to main file
addon.db = database
