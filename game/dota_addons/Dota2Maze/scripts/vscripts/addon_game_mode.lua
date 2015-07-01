require('gamemode')

function Precache( context )

  PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
  PrecacheResource("particle_folder", "particles/test_particle", context)

  PrecacheResource("model_folder", "particles/heroes/antimage", context)
  PrecacheResource("model", "particles/heroes/antimage/antimage.vmdl", context)
  PrecacheModel("models/heroes/antimage/antimage.vmdl", context)


  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)

  PrecacheItemByNameSync("example_ability", context)
  PrecacheItemByNameSync("item_example_item", context)

  PrecacheUnitByNameSync("npc_dota_hero_antimage", context)

end

function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
end
