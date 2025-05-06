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
        card.ability.extra.xmult = 1 + #SMODS.find_card('j_dexjok_firstBrother') +
                                       #SMODS.find_card('j_dexjok_secondBrother') +
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
        x = 0,
        y = 1
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
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('fish_school')),
                center = G.P_CENTERS.c_base
            }, G.playing_cards, true, nil, {G.C.SECONDARY_SET.Enhanced}, true)
            _card:set_enhancement("m_dexjok_fish")
        end
    end
}
SMODS.Joker {
    key = "BOGO",
    loc_txt = {
        name = "BOGO the Clown",
        text = {"Using a consumable from a booster pack gives you", "a copy in your consumable slots"}
    },
    rarity = 1,
    discovered = true,
    config = {
        extra = {
            bogo = true
        }
    },
    blueprint_compat = true,
    atlas = "dexsJokers",
    pos = {
        x = 2,
        y = 1
    }
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
        x = 3,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 1
    },
    calculate = function(self, card, context)
        -- if context.cardarea == G.play and context.main_scoring
        -- will be useful for when Loki is a playing card instead of a joker
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
    end
}
SMODS.Joker {
    key = "Dexterity",
    loc_txt = {
        name = "Dexterity",
        text = {"+X0.2 Mult per unique hand played.", "Keeps track of the past three hand types",
                "Last played hands are"}
    },
    rarity = 4,
    cost = 10,
    discovered = true,
    config = {
        extra = {
            mult = 2
        }
    },
    blueprint_compat = false,
    atlas = "dexsJokers",
    pos = {
        x = 4,
        y = 0
    },
    soul_pos = {
        x = 4,
        y = 1
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Enhancement {
    key = "fish",
    loc_txt = {
        name = "Fish",
        text = {"{C:blue}+0{} chips", "no rank or suit"}
    },
    no_rank = true,
    no_suit = true,
    replace_base_card = true,
    always_scores = true,
    chips = 0,
    atlas = "dexsJokers",
    pos = {
        x = 1,
        y = 1
    }
}
