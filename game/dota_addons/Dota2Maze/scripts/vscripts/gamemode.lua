if GameMode == nil then
    _G.GameMode = class({})
end

require('libraries/timers')
require('libraries/physics')
require('libraries/projectiles')
require('internal/gamemode')
require('internal/events')
require('settings')
require('events')
require('levelone')

function GameMode:PostLoadPrecache()
end

function GameMode:OnFirstPlayerLoaded()
end

function GameMode:OnAllPlayersLoaded()
end

function GameMode:OnHeroInGame(hero)

  hero:SetGold(0, false)
  hero:SetModelScale(0.8)

  local abilQ = hero:GetAbilityByIndex(0)
  hero:RemoveAbility(abilQ:GetAbilityName())
  hero:AddAbility("blademaster_windwalk")

  local abilW = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abilW:GetAbilityName())
  hero:AddAbility("tauren_chieftain_endurance_aura")

  local abilE = hero:GetAbilityByIndex(2)
  hero:RemoveAbility(abilE:GetAbilityName())
  hero:AddAbility("death_knight_unholy_aura")

  local abilR = hero:GetAbilityByIndex(3)
  hero:RemoveAbility(abilR:GetAbilityName())
  hero:AddAbility("no_health_bars")
  hero:SetAbilityPoints(2)
  hero:UpgradeAbility(abilR)
end

function GameMode:OnGameInProgress()

function GameMode:InitGameMode()
  GameMode = self
  GameMode:_InitGameMode()

  initUnitPatrol()

  --Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )
end

-- This is an example console command
function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end
