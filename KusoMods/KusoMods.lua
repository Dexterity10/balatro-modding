--- STEAMODDED HEADER
--- MOD_NAME: Kuso Modpack
--- MOD_ID: KusoMods
--- MOD_AUTHOR: [Kusoro]
--- MOD_DESCRIPTION: A collection of mods I've made. Mostly exists so that I can assign multiple custom deck images to custom decks.
----------------------------------------------
------------MOD CODE -------------------------
SMODS.Atlas {
    key = "ksrjkrdeck",
    path = "b_ksrjkrdeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = "ksrflddeck",
    path = "b_ksrflddeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = "ksrcrsdeck",
    path = "b_ksrcrsdeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = "ksrnhldeck",
    path = "b_ksrnhldeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = "ksrssrdeck",
    path = "b_ksrssrdeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = "ksrrpldeck",
    path = "b_ksrrpldeck.png",
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}

SMODS.Back {
    key = 'ksrjkrdeck',
    loc_txt = {
        name = "Joker Deck",
        text = {"Start with two", "random {C:attention}Eternal{} Jokers"}
    },
    name = "Joker Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrjkrdeck',
    config = {},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 2 do
                    local card = nil
                    repeat
                        if card ~= nil then
                            card:start_dissolve()
                        end
                        card = create_card('Joker', G.jokers)
                    until card.config.center.eternal_compat
                    card:set_eternal(true)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end
}
SMODS.Back {
    key = 'ksrflddeck',
    loc_txt = {
        name = "Flood Deck",
        text = {"{C:attention}One{} joker fills {C:attention}all{} slots",
                "Destroying {C:attention}one{} destroys {C:attention}all{}", "Beat ante 10 to win"}
    },
    name = "Flood Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrflddeck',
    config = {},
    apply = function(self)
        G.GAME.starting_params.ksrflood = true
        G.GAME.starting_params.ksrflood_c = 0
        G.GAME.starting_params.ksrflood_neg = false
        -- add_tag(Tag('tag_negative'))
        G.GAME.win_ante = 10
    end
}
SMODS.Back {
    key = 'ksrcrsdeck',
    loc_txt = {
        name = "Curse Deck",
        text = {"Discarded cards get {C:red}-1{} rank,",
                "{C:blue}+1{} discard, {C:red}-1{} discard at ante {C:attention}3/5/7/...{}",
                "{C:red}watch where you click{}"}
    },
    name = "Curse Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrcrsdeck',
    config = {
        discards = 1
    },
    apply = function(self)
        G.GAME.starting_params.ksrcurse = true
    end,
    trigger_effect = function(self, args)
        if args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss and G.GAME.round_resets.ante % 2 == 1 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1;
        end
    end
}
SMODS.Back {
    key = 'ksrnhldeck',
    loc_txt = {
        name = "Nihil Deck",
        text = {"All jokers are {C:dark_edition}Negative{}",
                "{C:blue}+2{} hand size, {C:blue}+2{} hands, {C:blue}+2{} discards", "On joker pickup,",
                "lose a random resource"}
    },
    name = "Nihil Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrnhldeck',
    config = {
        discards = 2,
        hands = 2,
        hand_size = 2
    },
    apply = function(self)
        G.GAME.starting_params.ksrnihil = true
    end
}
SMODS.Back {
    key = 'ksrssrdeck',
    loc_txt = {
        name = "Gacha Deck",
        text = {"More {C:attention}booster packs{} in shop,", "shop only sells booster packs/voucher",
                "Orange stake scales reroll faster instead"}
    },
    name = "Gacha Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrssrdeck',
    config = {},
    apply = function(self)
        G.GAME.starting_params.ksrgacha = true
        change_shop_size(1)
        G.GAME.modifiers.booster_ante_scaling = false
        local banned_stuff = {'tag_uncommon', 'tag_rare', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome',
                              'v_tarot_merchant', 'v_planet_merchant', 'v_tarot_tycoon', 'v_planet_tycoon',
                              'v_magic_trick', 'v_illusion'}
        for _, v in ipairs(banned_stuff) do
            G.GAME.banned_keys[v] = true
        end
    end
}
SMODS.Back {
    key = 'ksrrpldeck',
    loc_txt = {
        name = "Repel Deck",
        text = {"{C:red}Less{} is {C:blue}more{}, earn more per hand,", "{C:red}rapid growth{}"}
    },
    name = "Repel Deck",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'ksrrpldeck',
    config = {
        extra_hand_bonus = 2
    },
    apply = function(self)
        G.GAME.starting_params.ksrrepel = true
        G.E_MANAGER:add_event(Event({
            func = function()
                local card1 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_vampire')
                local card2 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_steel_joker')
                card1:set_eternal(true)
                card2:set_eternal(true)
                card1:add_to_deck()
                card2:add_to_deck()
                G.jokers:emplace(card1)
                G.jokers:emplace(card2)
                card1:start_materialize()
                card2:start_materialize()
                G.GAME.joker_buffer = 0
                return true
            end
        }))
    end,
    trigger_effect = function(self, args)
        if args.context == 'final_scoring_step' then
            local handtext = {'Repelled!', 'Diminished!'}
            local finaltext = nil
            if G.GAME.chips + args.chips * args.mult < G.GAME.blind.chips then
                args.chips = G.GAME.blind.chips - args.chips * args.mult
                args.mult = 1
                finaltext = handtext[1]
            else
                args.chips = math.floor(G.GAME.blind.chips / 10)
                args.mult = 1
                finaltext = handtext[2]
            end
            update_hand_text({
                delay = 0
            }, {
                mult = args.mult,
                chips = args.chips
            })
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local text = finaltext
                    play_sound('gong', 0.94, 0.3)
                    play_sound('gong', 0.94 * 1.5, 0.2)
                    play_sound('tarot1', 1.5)
                    ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
                    ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
                    attention_text({
                        scale = 1.4,
                        text = text,
                        hold = 2,
                        align = 'cm',
                        offset = {
                            x = 0,
                            y = -2.7
                        },
                        major = G.play
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        delay = 4.3,
                        func = (function()
                            ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                            ease_colour(G.C.UI_MULT, G.C.RED, 2)
                            return true
                        end)
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        blockable = false,
                        blocking = false,
                        no_delete = true,
                        delay = 6.3,
                        func = (function()
                            G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1],
                                G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                            G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2],
                                G.C.RED[3], G.C.RED[4]
                            return true
                        end)
                    }))
                    return true
                end)
            }))
            delay(0.6)
            return args.chips, args.mult
        end
    end
}

local ksr_Cardremovefromarea = Card.remove_from_area
function Card.remove_from_area(self)
    if self.ability.set == 'Joker' and self.area == G.jokers and G.GAME.starting_params.ksrflood then
        if #G.jokers.cards == 0 then
            return true
        end
        for i = #G.jokers.cards, 1, -1 do
            local card = G.jokers.cards[i]
            card:start_dissolve()
        end
    end
    ksr_Cardremovefromarea(self)
end

local ksr_cardareaemplace = CardArea.emplace
function CardArea.emplace(self, card, location, stay_flipped)
    if G.GAME.starting_params.ksrflood and self == G.jokers then
        local added_card_index = #G.jokers.cards
        local card_neg = false
        local reditions = {}

        if card.edition ~= nil and card.edition.negative then
            card_neg = true
            reditions = {{
                foil = true
            }, {
                polychrome = true
            }, {
                holo = true
            }}
        end
        for i = added_card_index, G.jokers.config.card_limit - 1, 1 do
            local newcard = copy_card(G.jokers.cards[added_card_index])
            if card_neg then
                newcard:set_edition(pseudorandom_element(reditions, pseudoseed('ksr_fld_editions')))
            end
            newcard:add_to_deck()
            ksr_cardareaemplace(self, newcard, location, stay_flipped)
            newcard:start_materialize()
        end
    end

    if G.GAME.starting_params.ksrgacha and self == G.shop_jokers and card.ability.set ~= 'Booster' then
        card:start_dissolve(nil, true, nil, true)
        local newcard = create_card('Booster', G.shop_jokers)
        card = newcard
        create_shop_card_ui(card, card.ability.set, self)
    end

    ksr_cardareaemplace(self, card, location, stay_flipped)
end

local ksr_Cardaddtodeck = Card.add_to_deck
function Card.add_to_deck(self, from_debuff)
    ksr_Cardaddtodeck(self, from_debuff)
    if self.ability.set == 'Joker' and G.GAME.starting_params.ksrnihil then
        local choice = pseudorandom_element({'hands', 'discards', 'handsize', 'jokerslots', 'dollars'},
            pseudoseed('ksr_nhl_malus'))
        local malus_text = ''
        if choice == 'hands' and G.GAME.round_resets.hands > 1 then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1;
            malus_text = "-1 hand"
        elseif choice == 'discards' and G.GAME.round_resets.discards > 1 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1;
            malus_text = "-1 discard"
        elseif choice == 'handsize' and G.hand.config.card_limit > 5 then
            G.hand.config.card_limit = G.hand.config.card_limit - 1;
            malus_text = "-1 hand size"
        elseif choice == 'jokerslots' and G.jokers.config.card_limit > 0 then
            G.jokers.config.card_limit = G.jokers.config.card_limit - 1;
            malus_text = "-1 joker slot"
        elseif choice == 'dollars' and G.GAME.dollars >= 5 then
            G.GAME.dollars = G.GAME.dollars - 5;
            malus_text = "-5 dollars"
        end
        attention_text({
            scale = 1.4,
            text = malus_text,
            hold = 5,
            align = 'cm',
            offset = {
                x = 0,
                y = -2.7
            },
            major = G.play
        })
    end
end

local ksr_Drawcard = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
    if G.GAME.starting_params.ksrcurse and card and from == G.hand and to == G.discard then
        G.SETTINGS.play_button_pos = math.random(1, 2)
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 1,
            func = function()
                local suit_prefix = string.sub(card.base.suit, 1, 1) .. '_'
                local rank_suffix = card.base.id == 2 and 14 or math.max(card.base.id - 1, 2)
                if rank_suffix < 10 then
                    rank_suffix = tostring(rank_suffix)
                elseif rank_suffix == 10 then
                    rank_suffix = 'T'
                elseif rank_suffix == 11 then
                    rank_suffix = 'J'
                elseif rank_suffix == 12 then
                    rank_suffix = 'Q'
                elseif rank_suffix == 13 then
                    rank_suffix = 'K'
                elseif rank_suffix == 14 then
                    rank_suffix = 'A'
                end
                card:set_base(G.P_CARDS[suit_prefix .. rank_suffix])
                return true
            end
        }))
    end

    if G.GAME.starting_params.ksrrepel and card and from == G.hand and to == G.discard then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 1,
            func = function()
                card:set_edition({
                    polychrome = true
                }, nil, true)
                return true
            end
        }))
    end

    if G.GAME.starting_params.ksrrepel and card and from == G.play and to == G.discard then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 1,
            func = function()
                card:set_ability(G.P_CENTERS['m_steel'])
                return true
            end
        }))
    end

    ksr_Drawcard(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
end

local ksr_cardsetedition = Card.set_edition
function Card.set_edition(self, edition, immediate, silent)
    ksr_cardsetedition(self, edition, immediate, silent)
    if G.GAME.starting_params.ksrnihil and self.ability.set == 'Joker' and (edition == nil or not edition.negative) then
        self:set_edition({
            negative = true
        })
    end
end

local ksr_calculatererollcost = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
    ksr_calculatererollcost(skip_increment)
    if G.GAME.starting_params.ksrgacha and G.GAME.stake >= 7 then
        G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + 1
    end
end

----------------------------------------------
------------MOD CODE END----------------------
