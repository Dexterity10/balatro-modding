--- STEAMODDED HEADER
--- MOD_NAME: Wild Deck
--- MOD_ID: wildDeck
--- MOD_AUTHOR: [itiseren]
--- MOD_DESCRIPTION: wild deck

----------------------------------------------
------------MOD CODE -------------------------

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
	Backapply_to_runRef(arg_56_0)

	if arg_56_0.effect.config.wildonly then
		G.E_MANAGER:add_event(Event({
			func = function()
				for iter_57_0 = #G.playing_cards, 1, -1 do
					sendDebugMessage(G.playing_cards[iter_57_0].base.id)

					G.playing_cards[iter_57_0]:set_ability(G.P_CENTERS.m_wild)
				end

				return true
			end
		}))
	end
end

local loc_def = {
	["name"]="Wild Deck",
	["text"]={
		[1]="Start with a Deck",
		[2]="full of",
		[3]="wild cards"
	},
}

local wilddeck = SMODS.Deck:new("Wild Deck", "wildDeck", {wildonly = true}, {x = 3, y = 1}, loc_def)
wilddeck:register()

----------------------------------------------
------------MOD CODE END----------------------
