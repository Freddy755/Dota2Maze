local levelOneNpcs = {}
local levelOneNpcsNames = {"npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2",
							"npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2", "npc_dota_necronomicon_warrior_2"}
local numTotal = 20

function initUnitPatrol() 
	local compteur = 6;
	for i = 1, numTotal do
		if i < 3 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[1], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
		elseif i < 5 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[2], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
		elseif i < 7 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[3], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
		elseif i < 12 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[4], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
		elseif i < 16 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[5], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
		elseif i <= 20 then
			levelOneNpcs[i] = CreateUnitByName(levelOneNpcsNames[compteur], Entities:FindByName(nil, "path" .. i):GetAbsOrigin(), true, nil, nil, 1)
			compteur = compteur + 1;
		end
		levelOneNpcs[i]:SetMustReachEachGoalEntity(true)
		--ability = magnus[i]:FindAbilityByName("Invulnerable")
		--ability:SetLevel(1)
	end
	startWaypoint_unit()
end

function act_unit(numUnit) 
	levelOneNpcs[numUnit]:SetInitialGoalEntity(Entities:FindByName(nil, "path" .. numUnit))
end

function startWaypoint_unit()
	for i = 1, numTotal do
		act_unit(i)
	end
end