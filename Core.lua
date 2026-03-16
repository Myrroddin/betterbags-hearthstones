local BetterBags = LibStub("AceAddon-3.0"):GetAddon("BetterBags")
assert(BetterBags, "BetterBags_Hearthstones requires BetterBags")

local categories = BetterBags:GetModule("Categories")

local L = BetterBags:GetModule("Localization")

local _, addon = ...

-- wipe Teleporters and BearLeeAble's Ultimate catagories, as they do the same thing, just with fewer items in their databases
categories:WipeCategory("Teleporters")
categories:WipeCategory("|cff16A0FFHearthstones|r")

-- create a category and populate with itemIDs
for itemID in pairs(addon.db) do
	categories:AddItemToCategory(itemID, L:G(TUTORIAL_TITLE31))
end