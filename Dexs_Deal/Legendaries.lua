SMODS.Joker {
    key = "Dexterity",
    rarity = 4,
    cost = 10,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.xmult_gain, card.ability.extra.xmult, card.ability.extra.lastPlayed[1],
                    card.ability.extra.lastPlayed[2], card.ability.extra.lastPlayed[3]}
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
    atlas = "Legendary",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 0,
        y = 1
    },
    calculate = function(self, card, context)
        local lastPlayed = card.ability.extra.lastPlayed
        local scored = context.scoring_name
        if context.before and context.main_eval and scored ~= nil then
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
                lastPlayed = {},
                message = "X" .. card.ability.extra.xmult
            }
        end
    end
}

-- SMODS.Joker {
--     key = "kirby",
--     rarity = 4,
--     cost = 15,
--     discovered = true,
--     config = {
--         extra = {
--             toProc = {},
--             jokersHeld = {},
--             odds = 2
--         }
--     },
--     atlas = "Placeholder",
--     loc_vars = function(self, infoqueue, card)
--         return {
--             vars = { card.ability.extra.odds, #card.ability.extra.jokersHeld }
--         }
--     end,
--     calculate = function(self, card, context)
--         if context.setting_blind then
--             local my_pos = nil
--             for i = 1, #G.jokers.cards do
--                 if G.jokers.cards[i] == card then
--                     my_pos = i
--                     break
--                 end
--             end
--             if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
--                 local eaten_card = G.jokers.cards[my_pos + 1]
--                 eaten_card.getting_sliced = true -- Make sure to do this on destruction effects
--                 G.GAME.joker_buffer = G.GAME.joker_buffer - 1
--                 G.E_MANAGER:add_event(Event({
--                     func = function()
--                         G.GAME.joker_buffer = 0
--                         -- See note about SMODS Scaling Manipulation on the wiki
--                         table.insert(card.ability.extra.jokersHeld, SMODS.shallow_copy(eaten_card))
--                         card:juice_up(0.8, 0.8)
--                         eaten_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
--                         play_sound('slice1', 0.96 + math.random() * 0.08)
--                         return true
--                     end
--                 }))
--             end
--         end
--         if context.joker_main then
--             local boop = 0
--             local picked = {}
--             while pseudorandom("pick") < G.GAME.probabilities.normal / (1 + boop) do
--                 table.insert(card.ability.extra.toProc, pseudorandom_element(card.ability.extra.jokersHeld, 'pick').key)
--                 boop = boop + 1
--             end
--             local bop = {}
--             bop = SMODS.merge_effects(card.ability.extra.toProc)
--         end
--     end
-- }
