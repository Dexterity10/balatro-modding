return {
    descriptions = {
        Joker = {
            j_dxd_firstBrother = {
                name = "The Oldest",
                text = {"{C:white,X:mult}X1{} mult per Brother Joker you have", "(Currently {C:white,X:mult}X#1#{})"}
            },
            j_dxd_secondBrother = {
                name = "The Middle",
                text = {"Gain {C:mult}+3{} Mult per Brother joker", "(Currently {C:mult}+#1#{})"}
            },
            j_dxd_thirdBrother = {
                name = "The Youngest",
                text = {"Gain +#2# chips", "when a Joker procs", "Currently #1#"}
                -- will be changed to be only on Brother joker, but for now, it must be all jokers.
            },
            j_dxd_schoolOfFish = {
                name = "School of Fish",
                text = {"Adds 1 Fish to your deck", "{C:mult}+#1#{} mult per fish in your deck",
                        "(Currently {C:mult}+#2#{})"}
            },
            j_dxd_BOGO = {
                name = "BOGO the Clown",
                text = {"Using a consumable from a booster pack gives you", "a copy in your consumable slots"}
            },
            j_dxd_Loki = {
                name = "Loki",
                text = {"Selecting a blind moves Loki into your deck.",
                        "Playing Loki gives {X:dark_edition,C:white}+^1{} Mult.", "Always {C:dark_edition}Negative{}."}
            },
            j_dxd_Dexterity = {
                name = "Dexterity",
                text = {"Gain {C:white,X:mult}X#1#{} Mult if poker hand is not one of the previous 3 poker hands.",
                        "(Currently {C:white,X:mult}X#2#{})", "#3#"}
            },
            j_dxd_bag = {
                name = "Bag",
                text = {"{C:green}#1# in #2#{} chance for", "+#3# Joker slot every Ante"}
            },
            j_dxd_squire = {
                name = "Squire",
                text = {"{C:mult}+#1#{} Mult every hand played",
                        "{C:mult}#2#{}{C:green} in #3#{} chance to collapse and die"}
            },
            j_dxd_knight = {
                name = "Knight",
                text = {"{C:mult}+#1#{} Mult", "{C:white,X:mult}X#2#{} Mult",
                        "+{C:white,X:mult}X#3#{} after defeating boss blind"}
            },
            j_dxd_anthill = {
                name = "Anthill",
                text = {"{C:white,X:mult}X#1#{}", "+{C:white,X:mult}X#2#{} per card played",
                        "+{C:white,X:mult}X#3#{} per card scored"}
            },
            j_dxd_potOfGreed = {
                name = "Pot of Greed",
                text = {"#1# Hand size per round", "X#2# Hand size"}
            },
            j_dxd_Kirby = {
                name = "Kirby",
                text = {"Consume the Joker to the right", "Randomly select one Joker", "to proc during each hand",
                        "{C:green}1{} in #1# chance to proc another Joker", "Keeps rerolling until failure"}
            },
            -- multiple description box example
            j_mod_multi_joker = {
                name = 'Name',
                text = {{'First line of box 1', 'Second line of box 1'}, {'First line of box 2', 'Second line of box 2'}}
            }
        }
    }
}
