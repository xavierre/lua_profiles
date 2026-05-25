local profile = {}

local fastCastValue = 0.02 -- 2% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 1000 --you could set this to 0 if you do not wish to ever use regen gear

local kampfer_ring = {
    Ring2 = 'Kampfer Ring',
    Hands = 'Rasetsu Tekko +1',
    Legs = 'Byakko\'s Haidate',
}
local kampfer_earring = {
    Ear1 = 'Brutal Earring',
    Ear2 = 'Kampfer Earring',
    Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
    Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
    Legs = 'Byakko\'s Haidate',
}
local shadow_mantle = {
    -- Back = 'Shadow Mantle',
}

local sets = {
    Idle = {
        Ammo = 'Tiphia Sting',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Body = 'Mel. Cyclas +1',
        -- Hands = 'Dst. Mittens +1',
        Waist = 'Warwolf Belt',
        -- Legs = 'Dst. Subligar +1',
        -- Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    Resting = {
        -- Neck = 'Paisley Scarf',
        -- Ear2 = 'Sanative Earring',
        Body = 'Mel. Cyclas +1',
        -- Hands = 'Dst. Mittens +1',
        Back = 'Melee Cape',
        -- Feet = 'Dst. Leggings +1',
    },
    Town = {
        Head = 'Tpl. Crown +1',
		Neck = 'Faith Torque',
        Hands = 'Mel. Gloves +1',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Melee Gaiters',
    },
    Movement = {},

    Movement_TP = {},

    --[[
    8% Base
    5% Merits
    45% Counterstance
    10% Melee Gaiters
    ]]
    DT = {
        Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        -- Ear2 = 'Avenger\'s Earring', -- 1
        Body = 'Mel. Cyclas +1',
        Hands = 'Mel. Gloves +1',
        Back = 'Melee Cape',
        Waist = 'Black Belt',
        Legs = 'Tpl. Hose +1', -- 3
        -- Feet = 'Rst. Sune-Ate +1', -- 1
    },
    MDT = {
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        -- Back = 'Resentment Cape', (via NM in Yhoator Jungle)
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = { -- Currently using this as an alternate HighAcc set for 2H Zergs. See README.md
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Novia Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Mel. Gloves +1',
        Back = 'Boxer\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Tpl. Hose +1', -- 3
        Feet = 'Melee Gaiters', -- 5
        -- Feet = 'Dune Boots',
    },

    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear2 = { Name = 'Loquac. Earring', Priority = 50 },
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
        Neck = 'Willpower Torque', -- 5
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Mountain Gaiters', -- 5

    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Panther Mask +1',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        --Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Head = 'Maat\'s Cap',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Body = 'Shura Togi',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
    },
    TP_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
    },

    TP_DRG = {
        Head = 'Maat\'s Cap',
        Ear2 = 'Wyvern Earring',
    },
    TP_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    WS = {
        Head = 'Shr. Znr. Kabuto',
        Neck = 'Thunder Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Shura Haidate',
        Feet = 'Creek F Clomps',
    },

    WS_FinalHeaven = {
        Head = 'Genbu\'s Kabuto',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Flame Ring',
        -- Ring1 = 'Begrudging Ring',
        Ring2 = 'Flame Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Shura Haidate',
        Feet = 'Creek F Clomps',
    },

    WS_HighAcc = {
        Ring1 = 'Toreador\'s Ring',
        -- Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
    },

    WS_RagingFists = {
        Neck = 'Faith Torque',
        Body = 'Kirin\'s Osode',
    },

    WS_AsuranFists = {
        Neck = 'Faith Torque',
        Ear1 = 'Merman\'s Earring',
    },
    WS_DragonKick = {
        Neck = 'Thunder Gorget',        
        Legs = 'Byakko\'s Haidate',
    },
    WS_HowlingFist = {
        Head = 'Genbu\'s Kabuto',    
        waist = 'Warwolf Belt',    
    },

    Jump = {
        Head = 'Genbu\'s Kabuto',
        Ear1 = 'Brutal Earring',
        --Ear2 = 'Robust Earring',
        Ring1 = 'Robust Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Wyvern Mantle',
        Legs = 'Shura Haidate',
        Feet = 'Dune Boots',
    },

    Chakra = { -- VIT based
        Ammo = { Name = 'Happy Egg', Priority = 60 },
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = 'Fortitude Torque',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Robust Earring',
        Body = { Name = 'Tpl. Cyclas +1', Priority = 60 },
        Hands = { Name = 'Mel. Gloves +1', Priority = 60 },
        Ring1 = 'Soil Ring',
        Ring2 = 'Soil Ring',
        Back = 'Melee Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Mst. Sitabaki +1',
        Feet = 'Creek F Clomps',
    },

    ChiBlast = { -- MND based
        Head = 'Tpl. Crown +1',
        Neck = 'Faith Torque',
        -- Ear1 = 'Cmn. Earring',
        -- Ear2 = 'Cmn. Earring',
        -- Hands = 'Dvt. Mitts +1',
        Body = 'Kirin\'s Osode',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Melee Cape',
        Legs = 'Tpl. Hose +1',
        Waist = 'Reverend Sash',
        Feet = 'Suzaku\'s Sune-Ate',
    },

    Dodge = {
        Feet = { Name = 'Temple Gaiters', Priority = 60 },
    },
    Boost = {
        Hands = { Name = 'Temple Gloves', Priority = 60 },
    },
    Focus = {
        Head = { Name = 'Tpl. Crown +1', Priority = 60 },
    },
    Counterstance = {
        Feet = { Name = 'Melee Gaiters', Priority = 60 },
    },

    HundredFists = {
        Head = 'Shr. Znr. Kabuto',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Shura Togi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Shura Haidate',
        Feet = 'Creek F Clomps',
    },

    HundredFists_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
    },
    

    Weapon_Loadout_1 = {
        Main = 'Spharai',
    },
    Weapon_Loadout_2 = {
        Main = 'Destroyers',
    },
    Weapon_Loadout_3 = {
        Main = 'Faith Baghnakhs',
        Ammo = 'Virtue Stone',
    },
    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available  
    Ranged = {
        Ammo = 'Pebble',
    },

    Ranged = {
        Ammo = 'Pebble',
    },
    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Mel. Cyclas +1', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Tpl. Hose +1', Priority = 60 },
        Feet = { Name = 'Melee Gaiters', Priority = 60 },
    },    
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 12')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')


sets.kampfer_ring = kampfer_ring
sets.kampfer_earring = kampfer_earring
sets.shadow_mantle = shadow_mantle
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()

    if (action.Name == 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast)
    elseif (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra)
        local environment = gData.GetEnvironment()
        if (environment.DayElement == 'Dark') then
            gFunc.EquipSet('shadow_mantle')
        end
    elseif (action.Name == 'Dodge') then
        gFunc.EquipSet(sets.Dodge)
    elseif (action.Name == 'Boost') then
        gFunc.EquipSet(sets.Boost)
    elseif (action.Name == 'Focus') then
        gFunc.EquipSet(sets.Focus)
    elseif (action.Name == 'Counterstance') then
        gFunc.EquipSet(sets.Counterstance)
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.Jump)
    elseif (action.Name == 'High Jump') then
        gFunc.EquipSet(sets.Jump)
        gFunc.EquipSet(sets.HighJump)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    local player = gData.GetPlayer()

    if (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.WS_AsuranFists)
    elseif (action.Name == 'Dragon Kick') then
        gFunc.EquipSet(sets.WS_DragonKick)
    elseif (action.Name == 'Howling Fist') then
        gFunc.EquipSet(sets.WS_HowlingFist)
    elseif (action.Name == 'Raging Fists') then
        gFunc.EquipSet(sets.WS_RagingFists) 
    elseif (action.Name == 'Final Heaven') then
        gFunc.EquipSet(sets.WS_FinalHeaven)
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
    local focus = gData.GetBuffCount('Focus')
    local hundredFists = gData.GetBuffCount('Hundred Fists')

    if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Focus)
    end

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.TP_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.TP_THF)
        end
    end

    if (hundredFists == 1) then
        gFunc.EquipSet(sets.HundredFists)
        if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
            gFunc.EquipSet(sets.HundredFists_Focus)
        end
    end

   gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'DT') then
        if (player.HPP <= 75 and player.TP <= 1000) then
            gFunc.EquipSet('kampfer_ring')
        end
        if (player.HPP <= 25 and player.TP <= 1000) then
            gFunc.EquipSet('kampfer_earring')
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
