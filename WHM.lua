local profile = {}

local fastCastValue = 0.04 -- 4% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = 1024 -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = 1062 -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = nil -- The Max MP you have when /drk in your idle set

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}
local virology_ring = {
    -- Ring2 = 'Virology Ring',
}
local republic_circlet = {
    Head = 'Republic Circlet',
}
local cure_clogs = {
    Feet = 'Cure Clogs',
}
local ruckes_rung = {
    Main = 'Rucke\'s Rung',
}
local medicine_ring = {
    -- Ring1 = 'Medicine Ring',
}
local mjollnir = {
    -- Main = 'Mjollnir',
}
local asklepios = { -- Used for Cures with Mjollnir when /NIN
    -- Sub = 'Asklepios',
}

local sets = {
    Idle = {
	    Main = 'Terra\'s Staff',
        Head = 'Dream Ribbon',
		Body = 'Noble\'s tunic',
        Neck = 'Jeweled Collar',
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Stealth earring',
		Hands = 'Nashira gages',
        Waist = 'Cleric\'s Belt',
		Legs = 'Nashira Seraweels',
		Ring1 = 'Tamas Ring',
		Ring2 = 'Ether ring',
		feet = 'Nashira Crackows',        
    },
    IdleALT = {},
    IdleMaxMP = {
		Ear2 = 'Magnetic Earring',
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
        Waist = 'Cleric\'s Belt',        
    },
    Town = {},
    Movement = {},

    DT = {
        Main = 'Terra\'s Staff',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        -- Ring1 = 'Jelly Ring',
        -- Back = 'Umbra Cape',

    },
    DTNight = {},
    MDT = {
        Main = 'Terra\'s Staff',
        Head = 'Blue Ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        -- Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring', 
        -- Back = 'Hexerei Cape', -- 3
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring', -- 2
        Feet = 'Rostrum Pumps', -- 2        
    },
    Casting = { -- Default SIRD used for Idle sets
        Main = 'Hermit\'s Wand', -- 25
        -- Sub = 'Genbu\'s Shield',
        -- Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        -- Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Mahatma Slops', Priority = 100 },
        -- Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5    
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts regardless of Override set. If you wish to remain in FireRes etc. during casts, leave empty.
        Main = 'Hermit\'s Wand', -- 25
        -- Sub = 'Genbu\'s Shield',
        -- Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        -- Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Mahatma Slops', Priority = 100 },
        -- Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5
   },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
		Head = 'Nashira Turban', --	2
        Ear1 = 'Loquac. Earring', -- 1
        Body = 'Nashira Manteel', -- 3
		Hands = 'Blessed Mitts', -- 5
		Waist = 'Swift belt', -- 4
		Legs = 'Nashira Seraweels', -- 2
        Feet = 'Nashira Crackows', -- 2    
},
    ConserveMP = {
        Ammo = 'Dream Sand',
		Ear2 = 'Magnetic Earring',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
    },
    Cheat_C3HPDown = {},
    Cheat_C4HPDown = {},
    Cheat_HPUp = {},

    Yellow = {},
    Cure = {
		Head = 'Hlr. cap +1',
        Neck = 'Ajari bead necklace',
		Body = 'Noble\'s tunic', 
        Ear1 = 'Novia Earring',
		Ear2 = 'Magnetic Earring',
		Hands = 'Blessed mitts',
		Ring1 = 'Tamas ring',
		Ring2 = 'Aqua ring',
		Back = 'Prism cape',
		Waist = 'Cleric\'s belt',
		Legs = 'Mahatma slops', 
		Feet = 'Mahatma Pigaches',        
    },
    Cure5 = {
		Head = 'Hlr. cap +1',
        Neck = 'Ajari bead necklace',
		Body = 'Noble\'s tunic', 
		Back = 'Prism cape',
		Waist = 'Cleric\'s belt',
        Hands = 'Blessed Mitts', 
		Ring1 = 'Tamas ring',
		Ring2 = 'Aqua ring',
		Legs = 'Mahatma slops', 
		Feet = 'Mahatma Pigaches',        
    },
    Regen = {
        Main = 'Rucke\'s Rung',
        Body = 'Cleric\'s Bliaut',
    },
    Barspell = {
		-- Body = 'Blessed Briault',  100K gil
        Legs = 'Cleric\'s Pantaln.', -- +1 give +22
           
    },
    Cursna = {
		-- Neck = 'Healing Torque',
		-- Ear1 = 'Healing earring',
		Body = 'Nashira Manteel',
		Hands = 'Healer\'s Mitts', 
		Back = 'Altruistic cape',
		Legs = 'Cleric\'s Pantaln.',        
    },

    Enhancing = {
        -- Ammo = 'Hedgehog Bomb',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Ring1 = 'Tamas Ring',
		Feet = 'Cleric\'s duckbills',
    --  Back = 'Merciful Cape',        
    },
    Stoneskin = {
		Main = 'Kirin\'s pole',
		Head = 'Hlr. cap +1',
        Neck = 'Ajari necklace', -- stone gorget 
        Body = 'Errant Hpl.',
        Hands = 'Blessed Mitts', 
        Ring1 = 'Tamas Ring',
		Ring2 = 'Aqua ring',
        Back = 'Prism Cape',
        Waist = 'Cleric\'s belt',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',        
    },
    Spikes = {},

    Enfeebling = {
		Body = 'Healer\'s Bliaut',
		Neck = 'Enfeebling Torque',
		Hands = 'Cleric\'s Mitts',
		Legs = 'Nashira Seraweels',
		Back = 'Altruistic cape',        
    },
    EnfeeblingMND = {
		Head = 'Hlr. cap +1',
        Neck = 'Ajari bead necklace',
		Body = 'Errant Hpl.', 
		Back = 'Prism cape',
		Waist = 'Cleric\'s belt',
		Hands = 'Blessed mitts', 
		Ring1 = 'Tamas ring',
		Ring2 = 'Aqua ring',
		Legs = 'Mahatma slops', 
		Feet = 'Mahatma Pigaches',        
    },
    EnfeeblingINT = {
        Ear1 = 'Cunning Earring',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Feet = 'Rostrum Pumps',

    },
    EnfeeblingACC = {
        Body = 'Nashira Manteel',
        Legs = 'Nashira Seraweels',
    },

    Divine = {
		Head = 'Nashira Turban', 
        Neck = 'Ajari bead necklace',
		Body = 'Errant Hpl.', 
		Hands = 'Nashira gages',
		Ring1 = 'Tamas ring',
		Ring2 = 'Aqua ring',
		Waist = 'Cleric\'s belt',
		Legs = 'Healer\'s Pantaln.',
		Feet = 'Mahatma Pigaches',
		Back = 'Altruistic cape',        
    },
    Banish = {
		Head = 'Nashira Turban', 
        Neck = 'Ajari bead necklace',
		Body = 'Errant Hpl.', 
		Hands = 'Blessed mitts', 
		Ring1 = 'Tamas ring',
		Ring2 = 'Aqua ring',
		Back = 'Prism cape',
		Waist = 'Cleric\'s belt',
		Legs = 'Mahatma slops', 
		Feet = 'Mahatma Pigaches',        
    },
    Dark = {
        Body = 'Nashira Manteel',
        Ear1 = 'Abyssal Earring',
    },

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {},

    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.virology_ring = virology_ring
sets.republic_circlet = republic_circlet
sets.cure_clogs = cure_clogs
sets.ruckes_rung = ruckes_rung
sets.medicine_ring = medicine_ring
sets.mjollnir = mjollnir
sets.asklepios = asklepios
profile.Sets = gcmage.AppendSets(sets)

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
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
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
    gcmage.DoDefault(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')
        or string.match(action.Name, 'Holy')
        or (string.match(action.Name, 'Cure') and gData.GetActionTarget().Type == 'Monster')
    ) then
        if (republic_circlet.Head) then
            if (conquest:GetInsideControl()) then
                print(chat.header('LAC - WHM'):append(chat.message('In Region - Using Republic Circlet')))
                gFunc.EquipSet('republic_circlet')
            end
        end
    elseif (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.EquipSet('virology_ring')
    end
end

return profile
