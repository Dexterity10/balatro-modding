SMODS.ConsumableType {
    key = 'Chinese_Zodiac',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    -- collection_rows = {5,6},
    shop_rate = 4,
    loc_txt = {
        name = 'Chinese Zodiac', -- used on card type badges
        collection = 'Chinese Zodiac' -- label for the button to access the collection
    }
}
SMODS.Consumable {
    key = "tiger",
    set = "Chinese_Zodiac",
    loc_txt = {
        name = "Tiger",
        text = {"1 in 2 chance to double your money", "Failure sets your money to 0"}
    },
    discovered = true,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                if pseudorandom("tiger") < G.GAME.probabilities.normal / 2 then
                    ease_dollars(math.max(0, G.GAME.dollars), true)
                else
                    ease_dollars(-G.GAME.dollars, true)
                end
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Consumable {
    key = "dragon",
    set = "Chinese_Zodiac",
    loc_txt = {
        name = "Dragon",
        text = {"Select up to #1# playing cards", "to give random seals to"}
    },
    discovered = true,
    config = {
        max_highlighted = 3
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.max_highlighted}
        }
    end,
    use = function(self, card, area)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal('Red', nil, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
