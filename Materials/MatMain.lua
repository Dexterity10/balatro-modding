SMODS.current_mod.custom_collection_tabs = function()
    return {{
        button = UIBox_button({
            -- calls `G.FUNCS.Materials` when pressed, define accordingly
            button = 'Materials',
            id = 'mats',
            -- Displayed label on the button (using non-localized strings also works)
            label = 'Materials',
            -- optional; should have numeric 'tally' and 'of' values (for discovery counts)
            count = G.DISCOVER_TALLIES['something'],
            -- optional; minimum width of your button
            minw = 5
        })
    } -- add more buttons here
    }
end
G.FUNCS.Materials = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_Materials() -- this is the actual UI definition function
    }
end
-- define `create_UIBox_Materials()` to create the collection, see 'Building a UI'

-- m_gold, steel, glass, lucky, stone, 
SMODS.Enhancement:take_ownership('m_gold', {
    loc_txt = {
        name = "Test",
        text = {"this is gold, but I'm checking to see if taking ownership works"}
    }
})
