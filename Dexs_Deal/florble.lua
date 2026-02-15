SMODS.Joker {
    key = "florble",
    atlas = "Joker",
    pos = {
        x = 0,
        y = 2
    },

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
