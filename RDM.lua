local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear listed in Precast set

local ninSJMaxMP = 1044 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 1122 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 1155 -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = 1065 -- The Max MP you have when /drk in your idle set

-- Disabled on horizon_safe_mode
local fencersRingForced = false
local fencersRingMaxHP = 907

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local blue_cotehardie = {
    -- Body = 'Blue Cotehardie',
}
local blue_cotehardie_plus_one = {
    -- Body = 'Blue Cotehard. +1',
}
local dilation_ring = {
    -- Ring2 = 'Dilation Ring',
}
local tp_fencers_ring = {
    -- Ring1 = 'Fencer\'s Ring',
}

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Head = { Name = 'Dls. Chapeau +1', Priority = 100 },
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Nashira Manteel',
        -- Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Tamas Ring',
        -- Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        Legs = { Name = 'Crimson Cuisses', Priority = 100 },
        -- Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
    },
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
        Range = 'displaced',
        Ammo = 'Dream Sand',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
        Body = 'Dualist Tabard',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        Back = 'Altruistic Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Mahatma Pigaches',
    },
    Resting = {
	    Main = 'Pluto\'s Staff',
		Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
		Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
		Hands = 'Hydra Gloves',
		Legs = 'Hydra Brais',
		Feet = 'Hydra gaiters',
        Waist = 'Duelist\'s Belt',
    },
    Town = {
        Head = 'Dream Ribbon',
    },
    Movement = {
        Head = 'Dream Ribbon',
        Legs = 'Crimson Cuisses',
    },

    DT = {
        Main = 'Terra\'s Staff', -- 20
        -- Range = 'Arco de Velocidad',
        -- Ammo = 'displaced',
        Head = { Name = 'Dls. Chapeau +1', Priority = 100 },
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        --Body = 'Dst. Harness +1', -- 4
        -- Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Merman\'s Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        -- Back = 'Umbra Cape', -- 6
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        Legs = 'Crimson Cuisses', -- 3
        -- Feet = 'Dst. Leggings +1', -- 2
    },
    DTNight = {
        Main = 'Terra\'s Staff', -- 20
        -- Range = 'Arco de Velocidad',
        -- Ammo = 'displaced',
        Head = { Name = 'Dls. Chapeau +1', Priority = 100 },
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        --Body = 'Dst. Harness +1', -- 4
        -- Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Merman\'s Ring', -- 5
        Ring2 = 'Merman\'s Ring', -- 5
        -- Back = 'Umbra Cape', -- 6
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        Legs = 'Crimson Cuisses', -- 3
        -- Feet = 'Dst. Leggings +1', -- 2 
    },
    MDT = {
    },
    FireRes = { -- 149
        Main = 'Neptune\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Scp. Breastplate', -- 9
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 145
        Main = 'Vulcan\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 133
        Main = 'Terra\'s Staff', -- 20
        Range = 'Lightning Bow +1', -- 7
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 144
        Main = 'Auster\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Gaia Doublet', -- 10
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 139
        Main = 'Aquilo\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle +1', -- 8
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 137
        Main = 'Jupiter\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Cor. Scale Mail +1', -- 6
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {},

    Precast = {
        Head = 'Warlock\'s Chapeau',
        Ear1 = 'Loquac. Earring',
        Body = 'Dls. Tabard +1',
    },
    Casting = { -- Default SIRD used for Idle sets
        Main = { Name = 'Hermit\'s Wand', Priority = 100 }, -- 25
        Sub = 'Genbu\'s Shield',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
		Ear2 = 'Magnetic Earring',
        Body = { Name = 'Warlock\'s Tabard', Priority = 90 }, -- 10
        --Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        -- Back = 'Umbra Cape',
        -- Waist = 'Silver Obi +1', -- 8
        -- Legs = 'Dst. Subligar +1',
        -- Feet = 'Mountain Gaiters', -- 5
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
        Main = { Name = 'Hermit\'s Wand', Priority = 100 }, -- 25
        Sub = 'Genbu\'s Shield',
        Range = 'displaced',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
		Ear2 = 'Magnetic Earring',
        Body = { Name = 'Warlock\'s Tabard', Priority = 90 }, -- 10
        --Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        -- Back = 'Umbra Cape',
        -- Waist = 'Silver Obi +1', -- 8
        -- Legs = 'Dst. Subligar +1',
        -- Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Warlock\'s Chapeau',
        Ear1 = 'Loquac. Earring',
        Body = { Name = 'Dualist Tabard', Priority = -1 },
        Hands = 'Nashira Gages',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        -- Back = 'Maledictor\'s Shawl',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
        Ammo = 'Phtm. Tathlum',
        Head = 'Rival Ribbon', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Hades Earring +1', -- 2
        Body = 'Dls. Tabard +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Mermaid Ring', -- 2
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Toreador\'s Cape', -- 4
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Nashira Seraweels',
        Feet = 'Heroic Boots', -- 1
    },
    Cheat_C3HPDown = {
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Ammo = 'Tiphia Sting',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Serket Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C4HPDown = {
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Ammo = 'Tiphia Sting',
        Head = 'Zenith Crown +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Wlk. Tabard +1', -- 12
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Umbra Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Mahatma Pigaches',
    },
    Cheat_HPUp = {
        Main = 'Apollo\'s Staff',
        Sub = 'remove',
        Ammo = 'Happy Egg',
        Head = 'Rival Ribbon', -- 2
        Neck = 'Harmonia\'s Torque', -- 3
        Ear1 = 'Eris\' Earring', -- 2
        Ear2 = 'Hades Earring +1', -- 2
        Body = 'Dls. Tabard +1',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Toreador\'s Cape', -- 4
        Waist = 'Warwolf Belt', -- 3
        Legs = 'Blood Cuisses',
        Feet = 'Heroic Boots', -- 1
    },

    Cure = {
        Ammo = 'Dream Sand',
        Head = 'Hydra Beret', -- 8
        --Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
		Ear2 = 'Magnetic Earring',
        Body = { Name = 'Hydra Doublet', Priority = 100 }, -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Back = { Name = 'Mahatma Cape', Priority = 100 }, -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Body = 'Dualist Tabard',
        -- Legs = 'Wlk. Tights +1',
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Head = { Name = 'Warlock\'s Chapeau', Priority = 100 },
        Neck = 'Enhancing Torque',
        Ear1 = { Name = 'Loquac. Earring', Priority = 100 },
        Ear2 = { Name = 'Magnetic Earring', Priority = 100 },
        -- Body = 'Glamor Jupon',
        Hands = { Name = 'Duelist Gloves', Priority = 100 },
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Back = { Name = 'Merciful Cape', Priority = 100 },
        Waist = 'Swift Belt',
        Legs = { Name = 'Warlock\'s Tights', Priority = 100 },
        Feet = 'Nashira Crackows',
    },
    Stoneskin = {
        Main = 'Hermit\'s Wand',
        -- Sub = 'Genbu\'s Shield',
        Ammo = 'Dream Sand',
        -- Neck = 'Stone Gorget',
        Body = 'Errant Hpl.',
        Hands = 'Nashira Gages',
        Back = 'Prism Cape',
    },
    Spikes = {
        Main = 'Aquilo\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = { Name = 'Warlock\'s Chapeau', Priority = 100 },
        Neck = 'Enhancing Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dualist Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        --Back = { Name = 'Merciful Cape', Priority = 100 },
        --Waist = 'Penitent\'s Rope',
        Legs = { Name = 'Warlock\'s Tights', Priority = 100 },
        Feet = { Name = 'Dls. Boots +1', Priority = 100 },
    },

    Enfeebling = {
        Head = 'Dls. Chapeau +1',
        Body = 'Errant Hpl.',
        Back = 'Prism Cape',
        Waist = { Name = 'Dualist\'s Belt', Priority = 100 },
        Legs = 'Mahatma Slops',
        Hands = 'Nashira Gages',
        Feet = 'Nashira Crackows',
    },
    EnfeeblingMND = {
        Ammo = { Name = 'Hedgehog Bomb', Priority = 100 },
        Neck = 'Faith Torque',
        Ear1 = 'Static Earring',
        --Ear2 = 'Cmn. Earring',
        -- Hands = { Name = 'Dvt. Mitts +1', Priority = 100 },
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Feet = 'Mahatma Pigaches',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Cunning Earring',
        Hands = { Name = 'Errant Cuffs', Priority = 100 },
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        -- Feet = 'Wise Pigaches +1',
    },
    EnfeeblingACC = {
        Neck = 'Enfeebling Torque',
        Body = { Name = 'Warlock\'s Tabard', Priority = 100 },
        -- Ear2 = 'Enfeebling Earring',
        Back = { Name = 'Altruistic Cape', Priority = 100 },
        Legs = 'Nashira Seraweels',
    },

    Divine = {},
    Banish = {},
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        -- Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        -- Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        -- Hands = { Name = 'Blood Fng. Gnt.', Priority = 100 },
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        -- Back = { Name = 'Merciful Cape', Priority = 100 },
        Waist = 'Duelist\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = { Name = 'Warlock\'s Chapeau', Priority = 100 },
        Neck = 'Elemental Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = { Name = 'Zenith Mitts', Priority = 100 },
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = { Name = 'Prism Cape', Priority = 100 },
        Waist = 'Duelist\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = { Name = 'Duelist\'s Boots', Priority = 100 },
    },
    NukeACC = {
        -- Back = { Name = 'Merciful Cape', Priority = 100 },
        Legs = { Name = 'Duelist\'s Tights', Priority = 100 },
        Feet = 'Nashira Crackows',
    },
    NukeDOT = {
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Cunning Earring',
        Hands = { Name = 'Errant Cuffs', Priority = 100 },
        -- Back = { Name = 'Merciful Cape', Priority = 100 },
        Legs = { Name = 'Duelist\'s Tights', Priority = 100 },
        Feet = 'Nashira Crackows',
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Light Staff',
        -- Ammo = 'Hedgehog Bomb',
        -- Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
        -- Body = 'Hydra Doublet',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        --Back = 'Mahatma Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Duelist\'s Boots',
    },
    ConvertOOR = { -- Out of Region Convert Set
        Main = 'Light Staff',
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Faerie Hairpin',
        --Neck = 'Rep.Gold Medal',
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
        --Body = 'Hydra Doublet',
        Hands = 'Zenith Mitts',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        --Back = 'Mahatma Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Duelist\'s Boots',
    },

    Stun = {
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        -- Neck = 'Dark Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Dualist\\ Tabard',
        Hands = 'Nashira Gages',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        -- Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat.
        Main = 'Jupiter\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Dark Earring',
        Body = 'Nashira Manteel',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Snow Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Nashira Crackows',
    },

    TP = {
        Head = 'Dls. Chapeau +1',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Nashira Manteel',
        Hands = 'Nashira Gages',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Head = 'Optical Hat',
        Hands = 'Hydra Gloves',
        -- Back = 'Commander\'s Cape',
        -- Waist = 'Life Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    TP_NIN = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },

    WS = {
        Head = 'Optical Hat',
        Ear2 = 'Merman\'s Earring',
        -- Body = 'Assault Jerkin',
        -- Hands = 'Tarasque Mitts +1',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brais',
        -- Feet = 'Rutter Sabatons',
    },
    WS_HighAcc = {
        -- Body = 'Hydra Doublet',
        Hands = 'Hydra Gloves',
        -- Waist = 'Life Belt',
        Feet = 'Hydra Gaiters',
    },
    WS_Soil = {
        Neck = 'Soil Gorget',
    },
    WS_Evisceration = {
        -- Hands = 'Custom M Gloves',
    },
    WS_Spirits = {},
    WS_Energy = {
        Head = 'Zenith Crown',
        Ear1 = 'Static Earring',
        Neck = 'Faith Torque',
        Body = 'Errant Hpl.',
        -- Hands = 'Dvt. Mitts +1',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    Weapon_Loadout_1 = {
        Main = 'Blau Dolch',
        Sub = 'Octave Club',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
    },
    Weapon_Loadout_2 = {
        -- Main = 'Blau Dolch',
        Main = 'Justice Sword',
        -- Main = 'Justice Sword',
        -- Sub = 'Octave Club',
        -- Range = 'Lightning Bow +1',
        -- Ammo = 'displaced',
        Ammo = 'Virtue Stone',
    },
    Weapon_Loadout_3 = {
        Main = 'Joyeuse',
        Sub = 'Genbu\'s Shield',
        Range = 'Lightning Bow +1',
        Ammo = 'displaced',
    },

    -- Disabled on horizon_safe_mode
    FencersRingHPDown = { -- 899 - Set to force HP to or below fencersRingMaxHP
        Range = 'Lightning Bow +1',
        Head = 'Zenith Crown +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Novia Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Assault Jerkin',
        -- Body = 'Dalmatica',
        Hands = 'Zenith Mitts +1',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Umbra Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Mahatma Pigaches',
    },
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.blue_cotehardie = blue_cotehardie
sets.blue_cotehardie_plus_one = blue_cotehardie_plus_one
sets.dilation_ring = dilation_ring
sets.tp_fencers_ring = tp_fencers_ring
profile.Sets = gcmage.AppendSets(sets)

local nextFencersRingCheck = 0

profile.HandleAbility = function()
    gcmage.DoAbility()
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()

    if (action.Name == 'Savage Blade') or (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS_Soil)
    end

    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Soil)
        gFunc.EquipSet(sets.WS_Evisceration)
    end

    if (action.Name == 'Energy Drain') or (action.Name == 'Energy Steal') then
        gFunc.EquipSet(sets.WS_Energy)
    end

    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args, sets)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    if (not gcinclude.horizon_safe_mode) then
        if (fencersRingForced and gcdisplay.GetCycle('TP') ~= 'Off' and player.HP > fencersRingMaxHP and player.Status == 'Engaged') then
            local time = os.clock()
            if (time > nextFencersRingCheck) then
                nextFencersRingCheck = time + 2 -- only recheck again after 2 seconds to prevent spam if set up incorrectly
                gFunc.ForceEquipSet('FencersRingHPDown')
                gFunc.ForceEquipSet('TP')
            end
        end
    end

    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    if (player.MP <= 40) then
        gFunc.EquipSet('blue_cotehardie')
    end
    if (player.MP <= 50) then
        gFunc.EquipSet('blue_cotehardie_plus_one')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(sets, fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Name == 'Haste' or action.Name == 'Refresh') then
        gFunc.EquipSet('dilation_ring') -- Haste is technically MP inefficient but I prefer to just always use it anyway
    end
end

return profile
