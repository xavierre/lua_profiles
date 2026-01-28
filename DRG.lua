local profile = {}

local fastCastValue = 0.06 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local heal_hp_threshold_whm = 859
local heal_hp_threshold_rdm = 869

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local ethereal_earring = {
    -- Ear2 = 'Ethereal Earring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    Back = 'Warlock\'s Mantle',
}

local fenrirs_stone = { -- Used for hp at day for maxhp cheat
    Ammo = 'Fenrir\'s Stone', 
}

local sets = {
    Idle = {
        Ammo = 'Fenrir\'s Stone',
        Head = 'Dream Ribbon',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cassie Earring',
		Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Homam Gambieras',
    },
    IdleALT = {},
    Resting = {
        Body = 'Wyvern mail',
        Legs = 'Crimson Cuisses',
        Feet = 'Wyrm Greaves',
    },
    Town = {},
    Movement = {
        Legs = 'Crimson Cuisses',
    },

    DT = {
        Head = 'Black Ribbon', -- green ribbon +1 (14K gil)
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        -- Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Merman\'s Ring', -- 4 -- Using this over Shadow Ring for consistency
        Ring2 = 'Merman\'s Ring', -- 4 -- Using this over Shadow Ring for consistency
        -- Back = { Name = 'Hexerei Cape', Priority = 100 }, -- 3
    },
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Ace\'s helm',
        Ear2 = 'Loquac. Earring',
        Hands = 'Homam Manopolas',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Ammo = 'Tiphia Sting',
        Head = 'Ace\'s helm',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cassie Earring',
		Body = 'Wym. mail +1',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s mantle', 
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
		Body = 'Homam Corazza',
        Neck = 'Peacock amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s mantle', 
        Waist = 'Swift Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Homam Gambieras',
    },

    MaxHP = {
        Ammo = 'Happy Egg',
	    Head = 'Drn. Armet +1',
        Neck = 'Shield pendant',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Loquac. Earring',
		Body = 'Wym. mail +1',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        --Back = 'Gigant Mantle',
        --Waist = 'Powerful Rope',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    BreathBonus = {
        Head = 'Wym. Armet +1',
		Body = 'Wyvern Mail',
		-- Hands = 'Ostreger Mitts', 
        Legs = 'Drn. Brais +1',
		Feet = 'Homam Gambieras',
    },
    BreathBonus_NonMage = {
        Head = 'Wym. Armet +1',
		Body = 'Wyvern Mail',
		-- Hands = 'Ostreger Mitts', 
        Legs = 'Drn. Brais +1',
		Feet = 'Homam Gambieras',        
    },
    Stoneskin = {
        Neck = 'Enhancing torque',
    },
    Movement_TP = {
        Legs = 'Crimson Cuisses',
    },
    ['Ancient Circle'] = {
        Legs = 'Drn. Brais +1',
    },
    ['Jump'] = {
        Head = 'Wym. Armet +1',
		Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
		Feet = 'Drn. Greaves +1',    
    },
    ['Jump Accuracy'] = {},
    ['High Jump'] = {
        Head = 'Wym. Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
		Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
		Ring2 = 'Vaulter\'s ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
		Feet = 'Hct. Leggings',
    },
    ['High Jump Accuracy'] = {},
    ['Super Jump'] = {},
    ['Call Wyvern'] = {
        Body = 'Wym. Mail +1',
    },
    ['Spirit Link'] = {
        Head = 'Drn. Armet +1',
		Body = 'Wyvern Mail',
--		Hands = 'Ostreger Mitts', 
        Legs = 'Drn. Brais +1',
		Feet = 'Homam Gambieras',
    },

    WS = {},
    WS_HighAcc = {},

    ['Penta Thrust'] = { --STR 20% / DEX 20%
    	Ammo = 'Tiphia Sting',
        Head = 'Hecatomb Cap',
        Neck = 'Shadow Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cassie Earring',
		Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Toreador\'s ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Wyrm Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',    
    },
    ['Wheeling Thrust'] = { -- STR 80%
		Ammo = 'Tiphia Sting',
        Head = 'Hecatomb Cap',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cassie Earring',
		Body = 'Hecatomb Harness',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Conte Cosciales',
        Feet = 'Hct. Leggings',        
    },
    ['Impulse Drive'] = { -- STR 100%
		Ammo = 'Tiphia Sting',
        Head = 'Hecatomb Cap',
        Neck = 'Spike Necklace',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
		Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',        
    },
    ['Skewer'] = {},
    ['Geirskogul'] = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
sets.fenrirs_stone = fenrirs_stone

profile.Sets = gcmelee.AppendSets(sets)

local JobAbilities = T{
    'Jump',
    'High Jump',
    'Super Jump',
    'Spirit Link',
    'Call Wyvern',
    'Ancient Circle',
}

local WeaponSkills = T{
    'Impulse Drive',
    'Wheeling Thrust',
    'Skewer',
    'Penta Thrust',
    'Geirskogul',
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (JobAbilities:contains(action.Name)) then
        gFunc.EquipSet(sets[action.Name])
    end

    if (gcmelee.GetAccuracyMode() == 'HighAcc') then
        if (action.Name == 'Jump') then
            gFunc.EquipSet('Jump Accuracy')
        elseif (action.Name == 'High Jump') then
            gFunc.EquipSet('High Jump Accuracy')
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')
    local environment = gData.GetEnvironment()

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end
    if (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (isMage) then
        gFunc.EquipSet('ethereal_earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        if (isMage) then
            gFunc.EquipSet(sets.BreathBonus)
        else
            gFunc.EquipSet(sets.BreathBonus_NonMage)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
			if (environment.Time >= 6.00 and environment.Time < 18.00) then
				gFunc.EquipSet(sets.fenrirs_stone)
			end
        end
    end
end

return profile
