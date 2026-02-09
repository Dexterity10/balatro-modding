SMODS.Enhancement {
    key = "fish",
    loc_txt = {
        name = "Fish",
        text = {"no rank or suit"}
    },
    no_rank = true,
    no_suit = true,
    replace_base_card = true,
    always_scores = true,
    config = {
        bonus = 0
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.bonus}
        }
    end,
    atlas = "Enhancement",
    pos = {
        x = 0,
        y = 0
    },
    setChips = function(self, card, value)
        card.ability.bonus = value
    end
}

