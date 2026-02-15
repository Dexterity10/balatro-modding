-- SMODS.Joker{
--     key = "",
--     atlas = "Joker",
--     pos = {x= ,y= },
--     soul_pos ={x= ,y= },
--     rarity = ,
--     discovered = true,
--     config = {extra = {}},
--     loc_vars= function(self,info_queue,card)
--     end,
--     calculate = function(self,card,context)
--     end
-- }
SMODS.Joker {
    key = "firstBrother",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = nil,
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self, card, context)
        local sumBrothers = #SMODS.find_card('j_dxd_firstBrother') + #SMODS.find_card('j_dxd_secondBrother') +
                                #SMODS.find_card('j_dxd_thirdBrother')
        card.ability.extra.xmult = sumBrothers
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    calculate = function(self, card, from_debuff)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
} -- First Brother
SMODS.Joker {
    key = "secondBrother",
    atlas = "Joker",
    pos = {
        x = 1,
        y = 0
    },
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
    function(self, card, intial, delay_sprites)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
} -- Second Brother
SMODS.Joker {
    key = "thirdBrother",
    atlas = "Joker",
    pos = {
        x = 2,
        y = 0
    },
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
    function(self, card, intial, delay_sprites)
        if G.STAGE == G.STAGES.RUN and SMODS.find_card('j_dxd_firstBrother') and SMODS.find_card('j_dxd_secondBrother') and
            SMODS.find_card('j_dxd_thirdBrother') then
            card:set_edition('e_negative')
        end
    end
} -- Third Brother
SMODS.Joker {
    key = "schoolOfFish",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 0
    },
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            mult = 0,
            mult_gain = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        local toMult = 0
        for _, v in pairs(G.playing_cards or {}) do
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
                func = function()
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
            for _, v in pairs(G.playing_cards or {}) do
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
} -- School of Fish
SMODS.Joker {
    key = "BOGO",
    atlas = "Joker",
    pos = {
        x = 4,
        y = 0
    },
    rarity = 3,
    discovered = true,
    config = {
        extra = {
            bogo = true
        }
    },
    loc_vars = function(self, info_queue, card)
    end,
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
} -- BOGO the Clown
SMODS.Joker {
    key = "bag",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 1
    },
    soul_pos = {
        x = 0,
        y = 2
    },
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            gain_slots = 1,
            odds = 8
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.gain_slots}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if SMODS.pseudorandom_probability(card, 'bag', 1, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
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
} -- Bag
SMODS.Joker {
    key = "squire",
    atlas = "Joker",
    pos = {
        x = 1,
        y = 1
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
            if SMODS.pseudorandom_probability(card, 'bloodlust', card.ability.extra.mult, card.ability.extra.odds) then
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
} -- Squire
SMODS.Joker {
    key = "knight",
    atlas = "Joker",
    pos = {
        x = 2,
        y = 1
    },

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
    calculate = function(self, card, context)
        local cardmultgain = card.ability.extra.xmult_gain
        if context.end_of_round and not context.game_over and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.xmult = card.ability.extra.xmult + cardmultgain
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        return G.GAME.pool_flags.squire_extinct
    end
} -- Knight
SMODS.Joker {
    key = "anthill",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 1
    },
    rarity = 3,
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
} -- Anthil
SMODS.Joker {
    key = "potOfGreed",
    atlas = "Joker",
    pos = {
        x = 4,
        y = 1
    },
    rarity = 2,
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
    calculate = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.hand_gain)
        G.hand:change_size(G.hand.config.card_limit * (card.ability.extra.hand_xgain - 1))
    end
} -- Pot of Greed
SMODS.Joker {
    key = 'sixShooter',
    atlas = "Joker",
    pos = {
        x = 2,
        y = 2
    },
    rarity = 1,
    discovered = true,
    config = {
        extra = {
            max_ammo = 6,
            current_ammo = 6,
            mult = 12
        }
    },
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
} -- Six Shooter
SMODS.Joker {
    key = "sniper",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 2
    },
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
} -- Sniper Rifle
SMODS.Joker {
    key = "mirror",
    atlas = "Joker",
    pos = {
        x = 4,
        y = 2
    },
    rarity = 2,
    discovered = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
    end,
    function(self, card, context)
        if context.joker_main then
            return {
                message = "Working!"
            }
        end
    end
} -- Mirror
SMODS.Joker {
    key = "bloodlust",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 3
    },
    -- soul_pos ={x= ,y= },
    rarity = 1,
    discovered = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.hand_gain}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
            SMODS.pseudorandom_probability(card, 'bloodlust', 1, card.ability.extra.odds) then
            ease_hands_played(card.ability.extra.hand_gain)
        end
    end
} -- Bloodlust
SMODS.Joker {
    key = "sharpTeeth",
    atlas = "Joker",
    pos = {
        x = 1,
        y = 3
    },
    rarity = 2,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}
        }
    end,
    calculate = function(self, card, context)
        if context.discard then
            if SMODS.pseudorandom_probability(card, 'sharpTeeth', 1, card.ability.extra.odds) then
                return {
                    remove = true
                }
            end
        end
    end
} -- Sharp Teeth
SMODS.Joker {
    key = "throneButt",
    atlas = "Joker",
    pos = {
        x = 2,
        y = 3
    },
    rarity = 2,
    discovered = true,
    config = {
        extra = {
            xmult = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult}
        }
    end,
    calculate = function(self, card, context)
        local isFaces = true
        if context.joker_main then
            for k, v in pairs(context.scoring_hand or {}) do
                isFaces = v:is_face()
            end
            return {
                xmult = card.ability.extra.xmult ^ (isFaces and 1 or 0)
            }
        end
    end
} -- Throne Butt
SMODS.Joker {
    key = "scarierFace",
    atlas = "Joker",
    pos = {
        x = 3,
        y = 3
    },
    rarity = 3,
    discovered = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {G.GAME.current_round.hands_left}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = G.GAME.chips * (1 + G.GAME.current_round.hands_left / 100)
            }
        end
    end
} -- Scarier Face
