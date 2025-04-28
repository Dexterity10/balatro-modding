local prefix = "MW"
-- local allRanks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace"}

SMODS.Atlas {
    key = prefix .. "_lc",
    path = prefix .. "_lc.png",
    px = 71,
    py = 95
}

SMODS.DeckSkin {
    key = "mouthwash",
    suit = "Hearts",
    loc_txt = "Mouthwashing",
    palettes = {{
        key = "lc",
        ranks = {"Jack", "Queen", "King"},
        display_ranks = {"King", "Queen", "Jack"},
        atlas = prefix .. "_lc",
        pos_style = "collab"
    }}
}
