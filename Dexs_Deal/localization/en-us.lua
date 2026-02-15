return {
    descriptions = {
        Joker = {
            j_dxd_firstBrother = {
                name = "The Oldest",
                text = {"{C:white,X:mult}X1{} Mult per Brother Joker you have",
                        "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"}
            },
            j_dxd_secondBrother = {
                name = "The Middle",
                text = {"Gain {C:mult}+3{} Mult per Brother joker",
                        "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
            },
            j_dxd_thirdBrother = {
                name = "The Youngest",
                text = {"Gain +#2# chips", "when a Joker procs",
                        "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"}
                -- will be changed to be only on Brother joker, but for now, it must be all jokers.
            },
            j_dxd_schoolOfFish = {
                name = "School of Fish",
                text = {"Adds 1 Fish to your deck", "at the end of the shop", "Gain (2X fish)^2 Mult",
                        "{C:inactive}(Currently {C:mult}+#1#{C:inactive})"}
            },
            j_dxd_BOGO = {
                name = "BOGO the Clown",
                text = {"Using a consumable", "from a booster pack", "gives you a copy", "in your consumable slots"}
            },
            j_dxd_Loki = {
                name = "Loki",
                text = {"Selecting a blind moves Loki into your deck.",
                        "Playing Loki gives {X:dark_edition,C:white}+^1{} Mult.", "+1 Joker slot"}
            },
            j_dxd_Dexterity = {
                name = "Dexterity",
                text = {"Gain {C:white,X:mult}X#1#{} Mult if poker hand is not one of the previous 3 poker hands.",
                        "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive}){}", "#3#"}
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
                text = {"{C:mult}+#1#{} Mult", "+{C:white,X:mult}X#3#{} after defeating boss blind",
                        "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"}
            },
            j_dxd_anthill = {
                name = "Anthill",
                text = {"+{C:white,X:mult}X#2#{} per card played", "+{C:white,X:mult}X#3#{} per card scored",
                        "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"}
            },
            j_dxd_potOfGreed = {
                name = "Pot of Greed",
                text = {"{C:blue}#1#{} Hand size per round", "{X:blue}X#2#{} Hand size"}
            },
            j_dxd_kirby = {
                name = "Kirby",
                text = {"Eat the Joker to the right", "Randomly select one eaten Joker", "to proc during each hand",
                        "{C:green}1 in #1#{} chance to proc another Joker", "{C:inactive}(Currently #2# Jokers){}"}
            },
            -- multiple description box example
            j_mod_multi_joker = {
                name = 'Name',
                text = {{'First line of box 1', 'Second line of box 1'}, {'First line of box 2', 'Second line of box 2'}}
            },
            j_dxd_florble = {
                name = "Florble",
                text = {"Genetics: {C:chips}#1#{}|{C:mult}#2#{}", "Gain {C:chips}#1# Chips{} and {C:mult}#2#{} Mult",
                        "Florbles reproduce every hand", "with stats based on your other florbles"}
            },
            j_dxd_slots = {
                name = "Slots",
                text = {"mult changes based on", "what Joker slot this joker is in",
                        "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"}
            },
            j_dxd_sixShooter = {
                name = "Six Shooter",
                text = {"Fire for {C:mult}+#1#{} Mult", "#2# / #3# ammo remaining"}
            },
            j_dxd_sniper = {
                name = "Sniper Rifle",
                text = {"{C:white,X:mult}X#1#{} Mult if played", "hand contains", "a {C:attention}Three of a Kind{}",
                        "#2#/#3# ammo remaining"}
            },
            j_dxd_mirror = {
                name = "Mirror",
                text = {"Retrigger all scored cards", "in reverse if", "scored cards are palindromic"}
            },
            j_dxd_bloodlust = {
                name = "Bloodlust",
                text = {"{C:green}#1# in #2#{} chance for", "played cards with {C:hearts}Heart{} suit",
                        "to give {C:blue}+#3#{} hand"}
            },
            j_dxd_sharpTeeth = {
                name = "Sharp Teeth",
                text = {"{C:green}#1# in #2#{} chance", "for discarded cards", "to be destroyed"}
            },
            j_dxd_scarierFace = {
                name = "Scarier Face",
                text = {"Adds {C:blue}#1#{}% of {C:attention}Round Score{} to chips", "based on {C:blue}hand{}s left"}
            },
            j_dxd_throneButt = {
                name = "Throne Butt",
                text = {"{C:white,X:mult}X#1#{} Mult", "if scored hand", "is all face cards"}
            }
        }
    }
}
