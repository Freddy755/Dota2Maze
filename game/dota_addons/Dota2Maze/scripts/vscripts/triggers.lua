function killHero(trigger)
	local playerID = trigger.activator:GetPlayerID()
	local hero = PlayerResource:GetPlayer(playerID):GetAssignedHero()
	hero:ForceKill(true)
end

function SetCheckpoint(trigger)
	local respawnposition = trigger.caller:GetAbsOrigin()

	for _,hero in pairs(getAllHeroes()) do
		hero:SetRespawnPosition(respawnposition)
		if hero:IsAlive() then
			hero:ForceKill(true)
			hero:SetAbsOrigin(Vector(pos.x, pos.y, pos.z-400))
		end
	end
end

function getAllHeroes()
	local allHeroes = HeroList:GetAllHeroes()
	return allHeroes
end

function tp1(event)
	local unit = event.activator
	local ent = Entities:FindByName( nil, "teleport1_destination")
	local point = ent:GetAbsOrigin()

	event.activator:SetAbsOrigin(point)
	FindClearSpaceForUnit(event.activator, point, false)
	event.activator:Stop()
end
