SMODS.Atlas {
    key = "dexsJokers",
    px = 71,
    py = 95,
    path = 'DexsJokers.png' -- 3x2 grid; 0,0 is a placeholder
}

SMODS.Joker {

    key = "firstBrother",
    loc_txt = {
        name = "El Primero Hermano",
        text = {"The oldest.", "{C:red}X1{} mult for each Brother Joker you have", "(Currently {C:red}X#1#{})"}
    },
    atlas = "dexsJokers",
    pos = { -- 0,0 placeholder
        x = 0,
        y = 0
    },
    cost = 1,
    discovered = true,
    config = {
        extra = {
            xmult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        card.ability.extra.xmult = 2 + #SMODS.find_card('j_dexjok_secondBrother') +
                                       #SMODS.find_card('j_dexjok_thirdBrother')
    end
}
SMODS.Joker {
    key = "secondBrother",
    loc_txt = {
        name = "The Second Brother",
        text = {"this is a description of all time.", "second line"}
    },
    atlas = "dexsJokers",
    pos = { -- 0,0 placeholder
        x = 1,
        y = 0
    },
    cost = 1,
    discovered = true
}
SMODS.Joker {
    key = "thirdBrother",
    loc_txt = {
        name = "Der Dritte Bruder",
        text = {"this is a description of all time.", "second line"}
    },
    atlas = "dexsJokers",
    pos = { -- 0,0 placeholder
        x = 2,
        y = 0
    },
    cost = 1,
    discovered = true
}

SMODS.Joker {
    key = "schoolOfFish",
    loc_txt = {
        name = "School of Fish",
        text = {"Adds 1 Fish to your deck", "{C:red}+1{} mult per fish in your deck", "(Currently {C:red}+#1#{})"}
    },
    atlas = "dexsJokers",
    pos = {
        x = 3,
        y = 0
    },
    cost = 3,
    discovered = true,
    config = {
        extra = {
            mult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card({
                set = "default",
                area = G.deck,
                legendary = false,
                skip_materialize = true,
                soulable = false,
                enhancement = "m_dexjok_fish"
            })
        end
        -- card.ability.extra.mult = 17
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker {
    key = "Loki",
    loc_txt = {
        name = "Loki",
        text = {"Selecting a blind moves Loki into your deck.", "Playing Loki gives {X:dark_edition,C:white}^2{} Mult.",
                "Always {C:dark_edition}Negative{}."}
    },
    rarity = 4,
    cost = 10,
    discovered = true,
    config = {
        extra = {
            xmult = 100
        }
    },
    blueprint_compat = false,
    atlas = "dexsJokers",
    pos = {
        x = 0,
        y = 1
    },
    soul_pos = {
        x = 1,
        y = 1
    },
    calculate = function(self, card, context)
        G.E_MANAGER:add_event(Event({
            func = function(self)
                if context.card_added then
                    card:set_edition('e_negative')
                end
                return true
            end
        }))
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    loc_vars = function(self, info_queue, card)

        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    end
}

SMODS.Enhancement {
    key = "fish",
    loc_txt = {
        name = "fish.",
        text = {"{C:blue}+0{} chips", "no rank or suit"}
    },
    no_rank = true,
    no_suit = true,
    chips = 0,
    atlas = "dexsJokers",
    pos = {
        x = 4,
        y = 0
    }
}
