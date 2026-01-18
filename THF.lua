local profile = {}

local fastCastValue = 0.05 -- 5% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local evasion_master_casters_mitts = {
    Hands = 'Mst.Cst. Mitts',
}

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {
	    Head = 'Korrigan Beret',
        Neck = 'Love Torque',
		Ear1 = 'Stealth earring',        
        Body = 'Rapparee Harness',
        Hands = 'Assassin\'s Armlets',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Trotter Boots',
		Back = 'Boxer\'s mantle',
    },
    Movement = {
        Feet = 'Trotter Boots',
    },

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
		Head = 'Optical Hat',
--		Neck = 'Evasion torque',
		Body = 'Scp. Harness +1',
		Hands = 'War gloves +1',
		Waist = 'Scouter\'s Rope',
		Legs = 'Crow hose',
		Feet = 'Dance shoes',
		Ear2 = 'Novia earring',
		Back = 'Boxer\'s mantle',        
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Homam zucchetto',
        Ear1 = 'Loquac. Earring',
        Body = 'Rapparee Harness',
        Hands = 'Homam manopolas',
        Waist = 'Swift belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',    
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Homam zucchetto',
        Body = 'Rapparee Harness',
        Neck = 'Love Torque',
        Ear1 = 'Brutal earring',
		Ear2 = 'Merman\'s earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Hands = 'Homam manopolas',
        Waist = 'Swift belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
		Back = 'Forager\'s mantle',         
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
		Body = 'Homam Corazza',
        Neck = 'Peacock amulet',
        Ear1 = 'Brutal earring',
		Ear2 = 'Stealth earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Hands = 'Homam manopolas',
        Waist = 'Swift belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
		Back = 'Forager\'s mantle',         
    },
    TP_NIN = {
        Head = 'Homam zucchetto',
        Body = 'Rapparee Harness',
        Neck = 'Love Torque',
        Ear1 = 'Brutal earring',
		Ear2 = 'Stealth earring',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Hands = 'Homam manopolas',
        Waist = 'Swift belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
		Back = 'Forager\'s mantle',         },

    -- Note that these sets are for naked SA/TA/SATAs without WS --
    SA = {
        Head = 'Hecatomb Cap',
        Neck = 'Love Torque',
		Body = 'Dragon Harness',
		Hands = 'Hecatomb Mittens',
		Legs = 'Dragon Subligar',
        Feet = 'Hct. Leggings',
		Ear1 = 'Intruder earring',
        Ring1 = 'Thunder Ring',
        Ring2 = 'Thunder Ring',
		Waist = 'Warwolf belt',
		Back = 'Assassin\'s Cape',
    },
    TA = {
		-- Body = 'Flora Cotehardie',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
		legs = 'Rogue\'s culottes',
		Waist = 'Ryl.Kgt. Belt',
		Back = 'Assassin\'s Cape',        
    },
    SATA = {
        Neck = 'Love Torque',
        Head = 'Hecatomb Cap',
		Body = 'Dragon Harness',
		Hands = 'Hecatomb Mittens',
		Legs = 'Dragon Subligar',
        Feet = 'Hct. Leggings',
        Ring1 = 'Thunder Ring',
        Ring2 = 'Thunder Ring',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
		Waist = 'Warwolf belt',
		Back = 'Assassin\'s Cape',        
    },

    -- The following demonstrates layering of WS sets that should cover all debatable major WS combinations.
    WS = {
		Head = 'Hecatomb Cap',
		Neck = 'Love Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Dragon Harness',
		Hands = { Name = 'Hecatomb Mittens', Priority = 1 },
		Ring1 = 'Thunder Ring',
		Ring2 = 'Thunder Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = { Name = 'Dragon Subligar', Priority = 2 },
		Feet = { Name = 'Hct. Leggings', Priority = 1 },
    },
    WS_HighAcc = {
		Body = { Name = 'Hecatomb Harness', Priority = 2 },
		Ring2 = { Name = 'Toreador\'s Ring', Priority = 2 },
    },

    WS_Evisceration = {
		Feet = { Name = 'Asn. Poulaines +1', Priority = 1 },
    },
    WS_DancingEdge = {
		Feet = { Name = 'Asn. Poulaines +1', Priority = 1 },
    },
    WS_SharkBite = {
        Head = 'Hecatomb Cap',
		Body = 'Dragon Harness',
		Neck = 'Breeze gorget',
		Hands = 'Hecatomb Mittens',
		Legs = 'Dragon Subligar',
        Feet = 'Hct. Leggings',
        Ring1 = 'Thunder Ring',
        Ring2 = 'Thunder Ring',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
		Back = 'Assassin\'s Cape',        
    },
    WS_MercyStroke = {
		Ear1 = 'Tmph. Earring +1',
		Body = { Name = 'Hct. Harness +1', Priority = 2 },
		Ring2 = 'Triumph Ring',
		Waist = 'Warwolf Belt',
    },

    -- Applied on SA WS and SATA WS
    WS_SA = {
		Feet = { Name = 'Hecatomb Leggings', Priority = 1 },
    },

    -- Applied only on TA WS but NOT SATA WS
    WS_TA = {
		Ear1 = 'Drone Earring',
        Hands = 'Rogue\'s Armlets +1',
        Legs = 'Drn. Leggings +1',
    },
    WS_TA_SharkBite = {
		Ring2 = 'Breeze Ring',
    },
    WS_TA_MercyStroke = {
		Hands = { Name = 'Hct. Mittens +1', Priority = 1 },
    },

    WS_SATA_SharkBite = {
        Hands = 'Rogue\'s Armlets +1',
    },

    Flee = {
		Feet = 'Rogue\'s poulaines',
    },
    Hide = {},
	Steal_HPDown = {},
    Steal = {
		Head = 'Rog. Bonnet +1',
        -- Ring1 = 'Rogue\'s ring',
        Legs = 'Assassin\'s culottes',
		Hands = 'Thief\'s Kote',
		Feet = 'Rogue\'s poulaines',

    },
    Mug = {
		head = 'Assassin\'s Bonnet',
    },

    TH = {
        Hands = 'Assassin\'s Armlets',
		Neck = 'Nanaa\'s Charm',        
    },

    Ranged = {
		Head = 'Optical hat',
        Neck = 'Peacock amulet',
		hands = 'Noct Gloves +1',
		body = 'Rapparee Harness',
        Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s ring',
		Legs = 'Noct brais +1',
		--Legs = 'Dusk Trousers', -- +10 RACC
        Feet = 'Homam Gambieras',
		back = 'Jaeger mantle',        
    },
    Ranged_INT = {
		head = 'Rog. Bonnet +1',
		ring1 = 'Tamas ring',
		Ear1 = 'Abyssal earring',
		Ear2 = 'Cunning earring', 
		Neck = 'Predunce torque',        
    },

    Acid = {
        Ammo = 'Acid Bolt',
    },
    Sleep = {
        Ammo = 'Sleep Bolt',
    },
    Bloody = {
        Ammo = 'Bloody Bolt',
    },
    Blind = {
        Ammo = 'Blind Bolt',
    },
    Venom = {
        Ammo = 'Venom Bolt',
    },

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.evasion_master_casters_mitts = evasion_master_casters_mitts
profile.Sets = gcmelee.AppendSets(sets)

local ammo = T{'aacid','asleep','abloody','ablind','avenom'}

local AmmoTable1 = {
    [1] = 'Acid',
    [2] = 'Sleep',
    [3] = 'Bloody',
    [4] = 'Blind',
    [5] = 'Venom',
}
local AmmoTable2 = {
    ['acid'] = 1,
    ['sleep'] = 2,
    ['bloody'] = 3,
    ['blind'] = 4,
    ['venom'] = 5,
}

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
		gFunc.ForceEquipSet(sets.Steal_HPDown)
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')]);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)

    local ammo = gData.GetEquipment().Ammo
    if (ammo ~= nil and ammo.Name == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    elseif (action.Name == 'Dancing Edge') then
        gFunc.EquipSet(sets.WS_DancingEdge)
    elseif (action.Name == 'Mercy Stroke') then
        gFunc.EquipSet(sets.WS_MercyStroke)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.WS_SA)
    end

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SATA_SharkBite)
        end
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.WS_TA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_TA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_TA_MercyStroke)
        end
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(ammo)
    gcdisplay.CreateCycle('Ammo', AmmoTable1)
    gcinclude.SetAlias(T{'ammo'})
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'Auto', [2] = 'On', [3] = 'Off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(ammo)
    gcinclude.ClearAlias(T{'ammo'})
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
    elseif (args[1] == 'ammo') then
        gcdisplay.AdvanceCycle('Ammo')
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    elseif (ammo:contains(args[1])) then
        gcdisplay.SetCycleIndex('Ammo', AmmoTable2[args[1]:sub(2)])
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.EquipSet('TP_NIN')
    end

    gcmelee.DoDefaultOverride()

    if (conquest:GetOutsideControl() and gcdisplay.IdleSet == 'Evasion') then
        gFunc.EquipSet('evasion_master_casters_mitts')
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
	gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')]);
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'Auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'On'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = T { 1, 2, 4, 6 };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type:contains(packet.Type)) then
                    local reaction = T { 0, 8, 
                        9, -- melee/range attack missed, comment out for pedantic TH mode
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if reaction:contains(action.Reaction) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile
