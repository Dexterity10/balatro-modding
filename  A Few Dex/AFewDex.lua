SMODS.Back {
    key = "multDeck",
    pos = {
        x = 2,
        y = 1
    },
    loc_txt = {
        name = "mult Deck",
        text = {"{C:MULT}+4{} mult", "Added cards also get changed"}
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function(self)
                for _, _card in pairs(G.playing_cards) do
                    sendDebugMessage(_card.base.id)
                    _card:set_ability('m_mult')
                end
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if context.playing_card_added then
            for _, _card in pairs(context.cards) do
                _card:set_ability('m_mult')
            end
        end
    end
}
SMODS.Back {
    key = "polyDeck",
    isPoly = true,
    pos = {
        x = 6,
        y = 1
    },
    loc_txt = {
        name = "Polychrome Deck",
        text = {"Every card is Polychrome", "{C:white,X:mult}X1.5{} Mult on all cards played", "ggez"}
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function(self)
                for i = 1, #G.playing_cards, 1 do
                    sendDebugMessage(G.playing_cards[i].base.id)
                    G.playing_cards[i]:set_edition({"e_polychrome"})
                end
                return true
            end
        }))
    end
}
SMODS.Back {
    key = "glassDeck",
    isGlass = true,
    pos = {
        x = 5,
        y = 1
    },
    loc_txt = {
        name = "Glass Deck",
        text = {"{C:white,X:mult}X2{} Mult", "Everything is brittle.", "Added cards also get changed"}
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function(self)
                for _, _card in pairs(G.playing_cards) do
                    sendDebugMessage(_card.base.id)
                    _card:set_ability('m_glass')
                end
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if context.playing_card_added then
            for _, _card in pairs(context.cards) do
                _card:set_ability('m_glass')
            end
        end
    end
}
