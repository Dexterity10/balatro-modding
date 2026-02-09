SMODS.Atlas {
    key = "Joker",
    px = 71,
    py = 95,
    path = 'Jokers.png'
}
SMODS.Atlas {
    key = "Legendary",
    px = 71,
    py = 95,
    path = "Legendaries.png"
}
SMODS.Atlas {
    key = "Deck",
    px = 71,
    py = 95,
    path = "Decks.png"
}
SMODS.Atlas {
    key = "Enhancement",
    px = 71,
    py = 95,
    path = "Enhancements.png"
}

assert(SMODS.load_file("Decks.lua"))()
assert(SMODS.load_file("Jokers.lua"))()
assert(SMODS.load_file("Legendaries.lua"))()
assert(SMODS.load_file("Enhancements.lua"))()
-- assert(SMODS.load_file("Consumables.lua"))()
