--- STEAMODDED HEADER
--- MOD_NAME: Dark and Colorful Suits
--- MOD_ID: darkandcolorfulsuits
--- PREFIX: dacsuits
--- MOD_AUTHOR: [DaLuigi]
--- MOD_DESCRIPTION: Turns your decks and cards into darker and more saturated cards.
--- VERSION: 1.0.0


----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.DecColors()

    local deck_mod = SMODS.findModByID("darkandcolorfulsuits")
    local sprite_card = SMODS.Sprite:new("cards_1", deck_mod.path, "8BitDeck.png", 71, 95, "asset_atli")
	local sprite2card = SMODS.Sprite:new("cards_2", deck_mod.path, "8BitDeck.png", 71, 95, "asset_atli")
	local ebacks_card = SMODS.Sprite:new("centers", deck_mod.path, "Enhancers.png", 71, 95, "asset_atli")
	local ui_asset = SMODS.Sprite:new("ui_1", deck_mod.path, "ui_assets.png", 18, 18, "asset_atli")
	local ui2asset = SMODS.Sprite:new("ui_2", deck_mod.path, "ui_assets.png", 18, 18, "asset_atli")

    sprite_card:register()
	sprite2card:register()
	ebacks_card:register()
	ui_asset:register()
	ui2asset:register()
	
	G.C.SO_1.Clubs = HEX("00911a")
	G.C.SO_2.Clubs = HEX("00911a")
	G.C.SUITS.Clubs = HEX("00911a")
	
	G.C.SO_1.Diamonds = HEX("ffc900")
	G.C.SO_2.Diamonds = HEX("ffc900")
	G.C.SUITS.Diamonds = HEX("ffc900")
	
	G.C.SO_1.Hearts = HEX("ff0037")
	G.C.SO_2.Hearts = HEX("ff0037")
	G.C.SUITS.Hearts = HEX("ff0037")
	
	G.C.SO_1.Spades = HEX("2b74ff")
	G.C.SO_2.Spades = HEX("2b74ff")
	G.C.SUITS.Spades = HEX("2b74ff")
	
end

----------------------------------------------
------------MOD CODE END----------------------
