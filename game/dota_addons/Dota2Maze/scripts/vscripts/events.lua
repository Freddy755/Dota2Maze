function GameMode:OnDisconnect(keys)
  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid
end
function GameMode:OnGameRulesStateChange(keys)
  GameMode:_OnGameRulesStateChange(keys)
  local newState = GameRules:State_Get()
end

function GameMode:OnNPCSpawned(keys)
  GameMode:_OnNPCSpawned(keys)
  local npc = EntIndexToHScript(keys.entindex)
end

function GameMode:OnEntityHurt(keys)
  local entCause = EntIndexToHScript(keys.entindex_attacker)
  local entVictim = EntIndexToHScript(keys.entindex_killed)
end

function GameMode:OnItemPickedUp(keys)
  local heroEntity = EntIndexToHScript(keys.HeroEntityIndex)
  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

function GameMode:OnPlayerReconnect(keys)
end

function GameMode:OnAbilityUsed(keys)
  local player = EntIndexToHScript(keys.PlayerID)
  local abilityname = keys.abilityname
end

function GameMode:OnNonPlayerUsedAbility(keys)
  local abilityname=  keys.abilityname
end

function GameMode:OnPlayerChangedName(keys)
  local newName = keys.newname
  local oldName = keys.oldName
end

function GameMode:OnPlayerLearnedAbility( keys)
  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

function GameMode:OnAbilityChannelFinished(keys)
  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

function GameMode:OnPlayerLevelUp(keys)
  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

function GameMode:OnPlayerPickHero(keys)
  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

function GameMode:OnTeamKillCredit(keys)
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

function GameMode:OnEntityKilled( keys )
  GameMode:_OnEntityKilled( keys )
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end
end

function GameMode:PlayerConnect(keys)
end

function GameMode:OnConnectFull(keys)
  GameMode:_OnConnectFull(keys)
  local entIndex = keys.index+1
  local ply = EntIndexToHScript(entIndex)
  local playerID = ply:GetPlayerID()
end
