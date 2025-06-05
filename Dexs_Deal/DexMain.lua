SMODS.Atlas {
    key = "placeholder",
    px = 71,
    py = 95,
    path = "Placeholder.png"
}
SMODS.Atlas {
    key = "Joker",
    px = 71,
    py = 95,
    path = 'Jokers.png' -- 3x2 grid; 0,0 is a placeholder
}
SMODS.Atlas {
    key = "Deck",
    px = 71,
    py = 95,
    path = "Decks.png"
}

assert(SMODS.load_file("Decks.lua"))()
assert(SMODS.load_file("Jokers.lua"))()
assert(SMODS.load_file("Enhancements.lua"))()
assert(SMODS.load_file("Consumables.lua"))()

