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
        text = {"The oldest.", "{C:white,X:mult}X1{} mult for each Brother Joker you have",
                "(Currently {C:white,X:mult}X#1#{})"}
    },
    atlas = "dexsJokers",
    pos = {
        x = 0,
        y = 1
    },
    cost = 2,
    discovered = true,
    config = {
        extra = {
            xmult = 1
        }
    },
    blueprint_compat = true,
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
    pos = {
        x = 1,
        y = 1
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
    pos = {
        x = 2,
        y = 1
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
        x = 1,
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
    rarity = 3,
    discovered = true,
    config = {
        extra = {
            bogo = true
        }
    },
    blueprint_compat = true,
    atlas = "dexsJokers",
    pos = {
        x = 4,
        y = 0
    },
    calculate = function(self, card, context)
        if context.using_consumeable and G.booster_pack and not G.booster_pack.REMOVED and SMODS.OPENED_BOOSTER and
            G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            G.E_MANAGER:add_event(Event({
                func = function(self)
                    SMODS.add_card({
                        key = context.consumeable.config.center.key,
                        edition = "e_negative"
                    })
                    return true
                end
            }))
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
    blueprint_compat = false,
    atlas = "dexsJokers",
    pos = {
        x = 3,
        y = 1
    },
    soul_pos = {
        x = 3,
        y = 2
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                emult = 2
            }
        end
    end,
    set_ability = function(self, card, intial, delay_sprites)
        card:set_edition('e_negative')
    end
}
SMODS.Joker {
    key = "Dexterity",
    loc_txt = {
        name = "Dexterity",
        text = {"Gain {C:white,X:mult}X#1#{} Mult if poker hand is not one of the previous 3 poker hands.",
                "Currently {C:white,X:mult}X#2#{}", "Last played hands are", "#3#, #4#, #5#"}
    },
    rarity = 4,
    cost = 10,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local lp = card.ability.extra.lastPlayed
        return {
            vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult, lp[#lp - 2], lp[#lp - 1], lp[#lp]}
        }
    end,
    config = {
        extra = {
            xmult_gain = 0.2,
            xmult = 1,
            lastPlayed = {}
        }
    },
    blueprint_compat = true,
    atlas = "dexsJokers",
    pos = {
        x = 4,
        y = 1
    },
    soul_pos = {
        x = 4,
        y = 2
    },
    calculate = function(self, card, context)

        local lastPlayed = card.ability.extra.lastPlayed
        local scored = context.scoring_name
        if context.before and context.main_eval then
            lastPlayed[scored] = lastPlayed[scored] or 0
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            for key, value in pairs(lastPlayed) do
                if lastPlayed[key] == scored then
                    -- reset
                    card.ability.extra.xmult = 1
                    break
                end
            end
            -- end check for if Dexterity should add a value/reset xmult
            table.insert(lastPlayed, scored) -- add latest hand played
            if #lastPlayed > 3 then
                table.remove(lastPlayed, 1) -- remove the 3rd most recent played
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                lastPlayed = {}
            }
        end
    end
}
SMODS.Joker {
    key = "Bag",
    loc_txt = {
        name = "Bag",
        text = {"{C:green}#1# in #2#{} chance for", "+#3# Joker slot every Ante"}
    },
    rarity = 2,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.gain_slots}
        }
    end,
    config = {
        extra = {
            gain_slots = 1,
            odds = 8
        }
    },
    blueprint_compat = true,
    atlas = "dexsJokers",
    pos = {
        x = 0,
        y = 2
    },
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(card.ability.extra.gain_slots))
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if pseudorandom("bagjoker") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    -- copied from an example mod on smods... might be not correct coding for what I want lol
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit +
                                                                        to_big(card.ability.extra.gain_slots))
                        return true
                    end

                }))
                return true
            end
            return {
                message = "Bagged!"
            }
        end
    end
}
SMODS.Joker {
    key = "squire",
    loc_txt = {
        name = "Squire",
        text = {"{C:red}+#1#{} Mult every hand played", "{C:red}#2#{}{C:green} in #3#{} chance to collapse and die"}
    },
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            mult = 0,
            mult_gain = 5,
            odds = 200
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult_gain, card.ability.extra.mult, card.ability.extra.odds}
        }
    end,
    atlas = "dexsJokers",
    pos = {
        x = 1,
        y = 2
    },
    calculate = function(self, card, context)
        local cardmultgain = card.ability.extra.mult_gain
        if context.before then
            card.ability.extra.mult = card.ability.extra.mult + cardmultgain
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.repetition then
            if pseudorandom('squire') < card.ability.extra.mult / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = 'Collapsed!'
                }
            else
                return {
                    message = 'Safe!'
                }
            end
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
