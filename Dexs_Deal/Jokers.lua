SMODS.Joker {
    key = "firstBrother",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 2,
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
        local sumBrothers = #SMODS.find_card('j_dxd_firstBrother') + #SMODS.find_card('j_dxd_secondBrother') +
                                #SMODS.find_card('j_dxd_thirdBrother')
        card.ability.extra.xmult = sumBrothers
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
}
SMODS.Joker {
    key = "secondBrother",
    atlas = "Joker",
    pos = {
        x = 1,
        y = 0
    },
    cost = 3,
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            mult = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.mult_gain}
        }
    end,
    calculate = function(self, card, context)
        local sumBrothers = #SMODS.find_card('j_dxd_firstBrother') + #SMODS.find_card('j_dxd_secondBrother') +
                                #SMODS.find_card('j_dxd_thirdBrother')
        card.ability.extra.mult = sumBrothers * 3
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    add_to_deck = function(self, card, intial, delay_sprites)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
}
SMODS.Joker {
    key = "thirdBrother",
    atlas = "Joker",
    pos = {
        x = 2,
        y = 0
    },
    cost = 3,
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            chips = 30,
            chips_gain = 30
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chips, card.ability.extra.chips_gain}
        }
    end,
    calculate = function(self, card, context)
        if context.post_trigger then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    add_to_deck = function(self, card, intial, delay_sprites)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
}
SMODS.Joker {
    key = "schoolOfFish",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 0
    },
    cost = 3,
    discovered = true,
    config = {
        extra = {
            mult = 0,
            mult_gain = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        local toMult = 0
        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_dxd_fish') then
                toMult = toMult + card.ability.extra.mult_gain
            end
        end
        card.ability.extra.mult = toMult ^ 2
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local fish_card = create_playing_card({
                center = G.P_CENTERS.m_dxd_fish
            }, G.discard, true, false, nil, true)
            fish_card.config.center:setChips(fish_card, pseudorandom("fish", 1, 10))
            G.E_MANAGER:add_event(Event({
                func = function()
                    fish_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                    G.play:emplace(fish_card)
                    return true
                end
            }))
            return {
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function() -- This is for timing purposes, everything here runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({
                        playing_card_added = true,
                        cards = {fish_card}
                    })
                end
            }
        end
        if context.joker_main then
            card:add_to_deck()
            G.jokers:emplace(card)
            local toMult = 0
            for k, v in pairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, 'm_dxd_fish') then
                    toMult = toMult + card.ability.extra.mult_gain
                end
            end
            card.ability.extra.mult = toMult ^ 2
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker {
    key = "BOGO",
    rarity = 3,
    discovered = true,
    config = {
        extra = {
            bogo = true
        }
    },
    blueprint_compat = true,
    atlas = "Joker",
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
    key = "bag",
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
    atlas = "Joker",
    pos = {
        x = 0,
        y = 1
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
    atlas = "Joker",
    pos = {
        x = 1,
        y = 1
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
                G.GAME.pool_flags.squire_extinct = true
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
SMODS.Joker {
    key = "knight",
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            mult = 3,
            xmult = 1,
            xmult_gain = 0.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.xmult_gain}
        }
    end,
    atlas = "Joker",
    pos = {
        x = 2,
        y = 1
    },
    calculate = function(self, card, context)
        local cardmultgain = card.ability.extra.xmult_gain
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.xmult = card.ability.extra.xmult + cardmultgain
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.squire_extinct
    end
}
SMODS.Joker {
    key = "anthill",
    rarity = 3,
    cost = 5,
    discovered = true,
    config = {
        extra = {
            xmult = 0.5,
            gain_played = 0.01,
            gain_scored = 0.02
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.gain_played, card.ability.extra.gain_scored}
        }
    end,
    atlas = "Joker",
    pos = {
        x = 3,
        y = 1
    },
    calculate = function(self, card, context)
        if context.before then
            local total = #context.full_hand * card.ability.extra.gain_played
            card.ability.extra.xmult = card.ability.extra.xmult + total
            return {
                message = "+X" .. total
            }
        end
        if context.individual then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain_scored
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
SMODS.Joker {
    key = "potOfGreed",
    rarity = 2,
    cost = 5,
    discovered = true,
    config = {
        extra = {
            hand_gain = -1,
            hand_xgain = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.hand_gain, card.ability.extra.hand_xgain}
        }
    end,
    atlas = "Joker",
    pos = {
        x = 4,
        y = 1
    },
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.hand_gain)
        G.hand:change_size(G.hand.config.card_limit * (card.ability.extra.hand_xgain - 1))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_gain)
        G.hand:change_size(-G.hand.config.card_limit / (card.ability.extra.hand_xgain))
    end
}

SMODS.Joker {
    key = "florble",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 2
    },
    cost = 1,
    rarity = 3,
    discovered = true,
    config = {
        extra = {
            chip_points = 1, -- chips
            mult_points = 1, -- mult
            coefficient = 1
        }
    },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chip_points, card.ability.extra.mult_points,
                    (card.ability.extra.coefficient * card.ability.extra.chip_points ^ 0.5),
                    (card.ability.extra.coefficient * math.log(card.ability.extra.mult_points)),
                    card.ability.extra.coefficient}
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        local florble_list = {}
        for _, v in pairs(G.jokers and G.jokers.cards or {}) do
            if v.config.center.key == "j_dxd_florble" then
                table.insert(florble_list, v)
            end
        end
        local parentB = pseudorandom_element(florble_list, "florble") or card
        card.ability.extra.chip_points = ((card.ability.extra.chip_points ^ 2 + parentB.ability.extra.chip_points ^ 2) ^
                                             0.5 - 0.5)
        card.ability.extra.mult_points = ((card.ability.extra.mult_points ^ 2 + parentB.ability.extra.mult_points ^ 2) ^
                                             0.5 - 0.5)
        card.ability.extra.coefficient = math.max(1,
            (card.ability.extra.coefficient + parentB.ability.extra.coefficient) / 2 + pseudorandom("florble") - 0.4)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if #G.jokers.cards < G.jokers.config.card_limit then
                        local florble_list = {}
                        for _, v in pairs(G.jokers and G.jokers.cards or {}) do
                            if v.config.center.key == "j_dxd_florble" then
                                table.insert(florble_list, v)
                            end
                        end
                        local parentA = pseudorandom_element(florble_list, "florble") or card
                        local copied = copy_card(parentA)
                        copied:add_to_deck()
                        G.jokers:emplace(copied)
                    end
                    return true
                end
            }))
            return {
                chips = (card.ability.extra.coefficient * card.ability.extra.chip_points ^ 0.5),
                mult = (card.ability.extra.coefficient * math.log(card.ability.extra.mult_points))
            }
        end
    end
}
SMODS.Joker {
    key = "slots",
    atlas = "Joker",
    pos = {
        x = 1,
        y = 2
    },
    cost = 1,
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            xmult = 1,
            xmult_coeff = 0.2,
            xmult_pow = 1.5
        }
    },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult}
        }
    end,
    calculate = function(self, card, context)
        local extra = card.ability.extra
        local slot = 0
        if context.joker_main then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    slot = slot + i
                    if G.jokers.cards[i] > 5 then
                        slot = slot ^ extra.mult_pow
                    else
                        break
                    end
                end
            end
            slot = 1 + extra.mult_coeff * slot
            return {
                xmult = slot
            }
        end
    end
}
SMODS.Joker {
    key = "sixshooter",
    atlas = "Joker",
    pos = {
        x = 2,
        y = 2
    },
    cost = 1,
    rarity = 1,
    discovered = true,
    config = {
        extra = {
            max_ammo = 6,
            current_ammo = 6,
            mult = 12
        }
    },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.current_ammo, card.ability.extra.max_ammo}
        }
    end,
    calculate = function(self, card, context)
        local extra = card.ability.extra
        if context.joker_main then
            if extra.current_ammo <= 0 then
                extra.current_ammo = extra.max_ammo
                return {
                    message = "Reloading..."
                }
            else
                extra.current_ammo = extra.current_ammo - 1
                return {
                    mult = extra.mult
                }
            end
        end
    end
}
SMODS.Joker {
    key = "sniper",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 2
    },
    cost = 1,
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            max_ammo = 3,
            current_ammo = 3,
            xmult = 3,
            type = 'Three of a Kind'
        }
    },
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult, card.ability.extra.current_ammo, card.ability.extra.max_ammo}
        }
    end,
    calculate = function(self, card, context)
        local extra = card.ability.extra
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            if extra.current_ammo <= 0 then
                extra.current_ammo = extra.max_ammo
                return {
                    message = "Reloading..."
                }
            else
                extra.current_ammo = extra.current_ammo - 1
                return {
                    xmult = extra.xmult
                }
            end
        end
    end
}
SMODS.Joker {
    key = "mirror",
    atlas = "Joker",
    pos = {
        x = 4,
        y = 2
    },
    cost = 1,
    rarity = 2,
    discovered = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = "Working!"
            }
        end
    end
}
