--- STEAMODDED HEADER
--- MOD_NAME: Dark and Colorful
--- MOD_ID: darkandcolorful
--- PREFIX: dac
--- MOD_AUTHOR: [DaLuigi]
--- MOD_DESCRIPTION: Turns your decks and cards into darker and more saturated cards.
--- VERSION: 1.0.0
--- DEPENDENCIES: [malverk]

AltTexture({
    key = 'planets_tex',
    set = 'Planet',
    path = 'Tarots.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Planets'
    }
})

AltTexture({
    key = 'tarots_tex',
    set = 'Tarot',
    path = 'Tarots.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Tarots'
    }
})

AltTexture({
    key = 'stake_tex',
    set = 'Stake',
    path = 'chips.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Stakes'
    }
})

AltTexture({
    key = 'back_tex',
    set = 'Back',
    path = 'Enhancers.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Backs'
    }
})

AltTexture({
    key = 'enhancement_tex',
    set = 'Enhanced',
    path = 'Enhancers.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Enhancements'
    }
})

AltTexture({
    key = 'spectrals_tex',
    set = 'Spectral',
    path = 'Tarots.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Spectrals'
    }
})

AltTexture({
    key = 'tags_tex',
    set = 'Tag',
    path = 'tags.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Tags'
    }
})

AltTexture({
    key = 'voucher_tex',
    set = 'Voucher',
    path = 'Vouchers.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Vouchers'
    }
})

AltTexture({
    key = 'booster_tex',
    set = 'Booster',
    path = 'boosters.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Boosters'
    }
})

AltTexture({
    key = 'seal_tex',
    set = 'Seal',
    path = 'Enhancers.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Seals'
    }
})

AltTexture({
    key = 'soul_tex',
    set = 'Spectral',
    path = 'Tarots.png',
	keys = {'c_soul'},
	soul = 'Enhancers.png',
    original_sheet = 'true',
    loc_txt = {
      name = 'DaC Soul'
    }
})

TexturePack({
    key = 'dac_deck',
    textures = {
      'dac_planets_tex',
	  'dac_tarots_tex',
	  'dac_back_tex',
	  'dac_enhancement_tex',
	  'dac_spectrals_tex',
	  'dac_soul_tex',
	  'dac_voucher_tex',
	  'dac_tags_tex',
	  'dac_booster_tex',
	  'dac_seal_tex',
	  'dac_stake_tex',
    },
    loc_txt = {
      name = 'Dark and Colorful',
      text = {'So dark, yet so colorful!'}
    }
})

