SMODS.Atlas {
    key = "funkyGuys",
    px = 71,
    py = 95,
    path = 'Jokers_Funky.png' -- 3x2 grid; 0,0 is a placeholder
}

SMODS.Joker {

    key = "firstBrother",
    loc_txt = {
        name = "El Primero Hermano",
        text = {"The oldest.", "{C:red}X1{} mult for each Brother Joker you have", "(Currently {C:red}X#1#{})"}
    },
    atlas = "funkyGuys",
    pos = { -- 0,0 placeholder
        x = 1,
        y = 0
    },
    cost = 1,
    discovered = true,
    config = {
        extra = {
            Xmult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        card.ability.extra.xMult = next(find_joker('secondBrother'))
    end
}
SMODS.Joker {
    key = "secondBrother",
    loc_txt = {
        name = "The Second Brother",
        text = {"this is a description of all time.", "second line"}
    },
    atlas = "funkyGuys",
    pos = { -- 0,0 placeholder
        x = 2,
        y = 0
    },
    cost = 1,
    discovered = true
}
-- SMODS.Joker {
--     key = "thirdBrother",
--     loc_txt = {
--         name = "Der Dritte Bruder",
--         text = {"this is a description of all time.", "second line"}
--     },
--     atlas = "funkyGuys",
--     pos = { -- 0,0 placeholder
--         x = 0,
--         y = 1
--     },
--     cost = 1,
--     discovered = true
-- }
-- SMODS.Joker {
--     key = "fourthBrother",
--     loc_txt = {
--         name = "Le quatrième frère",
--         text = {"this is a description of all time.", "second line"}
--     },
--     atlas = "funkyGuys",
--     pos = { -- 0,0 placeholder
--         x = 1,
--         y = 1
--     },
--     cost = 1,
--     discovered = true
-- }
-- SMODS.Joker {
--     key = "fifthBrother",
--     loc_txt = {
--         name = "Den femte brodern",
--         text = {"this is a description of all time.", "second line"}
--     },
--     atlas = "funkyGuys",
--     pos = { -- 0,0 placeholder
--         x = 2,
--         y = 1
--     },
--     cost = 1,
--     discovered = true
-- }

