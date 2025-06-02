SMODS.Atlas {
    key = "dexsJokers",
    px = 71,
    py = 95,
    path = 'DexsJokers.png' -- 3x2 grid; 0,0 is a placeholder
}

assert(SMODS.load_file("jokers.lua"))()
assert(SMODS.load_file("enhancements.lua"))()

