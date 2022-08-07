// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

/*
    ----- WARNING: -----

    This GSC dump may contain symbols that H1-mod does not have named. Navigating to https://github.com/h1-mod/h1-mod/blob/develop/src/client/game/scripting/function_tables.cpp and
    finding the function_map, method_map, & token_map maps will help you. CTRL + F (Find) and search your desired value (ex: 'isplayer') and see if it exists.

    If H1-mod doesn't have the symbol named, then you'll need to use the '_ID' prefix.

    (Reference for below: https://github.com/mjkzy/gsc-tool/blob/97abc4f5b1814d64f06fd48d118876106e8a3a39/src/h1/xsk/resolver.cpp#L877)

    For example, if H1-mod theroetically didn't have this symbol, then you'll refer to the '0x1ad' part. This is the hexdecimal key of the value 'isplayer'.
    So, if 'isplayer' wasn't defined with a proper name in H1-mod's function/method table, you would call this function as 'game:_id_1AD(player)' or 'game:_ID1AD(player)'

    Once again, you may need to do this even though it's named in this GSC dump but not in H1-Mod. This dump just names stuff so you know what you're looking at.
    --------------------

*/

main()
{
    level._effect["water_stop"] = loadfx( "fx/misc/parabolic_water_stand" );
    level._effect["water_movement"] = loadfx( "fx/misc/parabolic_water_movement" );
    level._effect["spotlight"] = loadfx( "vfx/map/blackout/blackout_flashlight_spotlight" );
    level._effect["flashlight"] = loadfx( "vfx/map/blackout/blackout_flashlight" );
    level._effect["pistol_muzzleflash"] = loadfx( "fx/muzzleflashes/pistolflash" );
    level._effect["blackout_river_fog"] = loadfx( "vfx/map/blackout/blackout_river_fog" );
    level._effect["sprite_light_fire_flicker_alone"] = loadfx( "fx/fire/sprite_light_fire_flicker_alone" );
    level._effect["blackout_house_fire_flicker"] = loadfx( "vfx/map/blackout/blackout_house_fire_flicker" );
    level._effect["waterfall_splash_base_sm_night"] = loadfx( "vfx/water/waterfall_splash_base_sm_night" );
    level._effect["blackout_outdoor_light_fixture"] = loadfx( "vfx/map/blackout/blackout_outdoor_light_fixture" );
    level._effect["light_godray_moonlight_a"] = loadfx( "vfx/lights/light_godray_moonlight_a" );
    level._effect["light_godray_moonlight_b"] = loadfx( "vfx/map/blackout/blackout_light_godray_moonlight_b" );
    level._effect["light_godray_dust_alone"] = loadfx( "vfx/lights/light_godray_dust_alone" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "fx/fire/firelp_small_streak_pm_v" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fx/fire/firelp_small_streak_pm_h" );
    level._effect["firelp_med_streak_pm_h"] = loadfx( "fx/fire/firelp_med_streak_pm_h" );
    level._effect["hunted_heli_smolder_night"] = loadfx( "vfx/map/hunted/hunted_heli_smolder_night" );
    level._effect["mist_hunted_add"] = loadfx( "vfx/map/blackout/blackout_mist" );
    level._effect["insects_light_hunted"] = loadfx( "fx/misc/insects_light_hunted" );
    level._effect["insects_light_hunted_a"] = loadfx( "fx/misc/insects_light_hunted_a" );
    level._effect["leaves_night_a"] = loadfx( "fx/misc/leaves_night_a" );
    level._effect["leaves_night_b"] = loadfx( "fx/misc/leaves_night_b" );
    level._effect["light_red_tower_blinking_vista_sm"] = loadfx( "vfx/lights/light_red_tower_blinking_vista_sm" );
    level._effect["village_smolder_night"] = loadfx( "fx/smoke/village_smolder_night" );
    level._effect["village_fog_vista_lrg_night"] = loadfx( "vfx/fog/village_fog_vista_lrg_night" );
    level._effect["insects_firefly_b"] = loadfx( "fx/misc/insects_firefly_b" );
    level._effect["ripple_flow_distortion_single"] = loadfx( "vfx/map/blackout/blackout_ripple_flow_distortion_single" );
    level._effect["ripple_flow_distortion_single_med"] = loadfx( "vfx/map/blackout/blackout_ripple_flow_distortion_single_med" );
    level._effect["ripple_flow_distortion_single_med_slow"] = loadfx( "vfx/map/blackout/blackout_ripple_med_slow" );
    level._effect["ripple_flow_distortion_strip_no_geo"] = loadfx( "vfx/map/blackout/blackout_ripple_flow_strip_no_geo" );
    level._effect["ripple_flow_distortion_single_no_geo"] = loadfx( "vfx/map/blackout/blackout_ripple_flow_single_no_geo" );
    level._effect["blackout_river_rapids_foam_01"] = loadfx( "vfx/map/blackout/blackout_river_rapids_foam_01" );
    level._effect["blackout_river_rapids_foam_02"] = loadfx( "vfx/map/blackout/blackout_river_rapids_foam_02" );
    level._effect["blackout_pond_algae_bits_fast"] = loadfx( "vfx/map/blackout/blackout_pond_algae_bits_fast" );
    level._effect["blackout_pond_algae_slow"] = loadfx( "vfx/map/blackout/blackout_pond_algae_slow" );
    level._effect["blackout_pond_algae_debris"] = loadfx( "vfx/map/blackout/blackout_pond_algae_debris" );
    level._effect["blackout_pond_algae_bits_curl_left"] = loadfx( "vfx/map/blackout/blackout_pond_algae_bits_curl_left" );
    level._effect["blackout_pond_algae_bits_curl_right"] = loadfx( "vfx/map/blackout/blackout_pond_algae_bits_curl_right" );
    level._effect["blackout_river_rapids_01"] = loadfx( "vfx/map/blackout/blackout_river_rapids_01" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "fx/fire/firelp_small_streak_pm_v" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fx/fire/firelp_small_streak_pm_h" );
    level._effect["firelp_small_streak_pm1_h"] = loadfx( "fx/fire/firelp_small_streak_pm1_h" );
    level._effect["firelp_med_streak_pm_h"] = loadfx( "fx/fire/firelp_med_streak_pm_h" );
    level._effect["firelp_large_pm"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["embers_burst_runner"] = loadfx( "fx/fire/embers_burst_runner" );
    level._effect["emb_burst_a"] = loadfx( "fx/fire/emb_burst_a" );
    level._effect["emb_burst_b"] = loadfx( "fx/fire/emb_burst_b" );
    level._effect["emb_burst_c"] = loadfx( "fx/fire/emb_burst_c" );
    level._effect["fire_fallingdebris"] = loadfx( "fx/fire/fire_fallingdebris" );
    level._effect["fire_fallingdebris_a"] = loadfx( "fx/fire/fire_fallingdebris_a" );
    level._effect["fire_debris_child"] = loadfx( "fx/fire/fire_debris_child" );
    level._effect["fire_debris_child_a"] = loadfx( "fx/fire/fire_debris_child_a" );
    level._effect["blackout_house_sim_fx_01"] = loadfx( "vfx/map/blackout/blackout_house_sim_fx_01" );
    level._effect["blackout_house_sim_fx_02"] = loadfx( "vfx/map/blackout/blackout_house_sim_fx_02" );
    level._effect["blackout_house_sim_fx_03a"] = loadfx( "vfx/map/blackout/blackout_house_sim_fx_03a" );
    level._effect["blackout_house_sim_fx_03b"] = loadfx( "vfx/map/blackout/blackout_house_sim_fx_03b" );
    level._effect["blackout_house_sim_fx_03c"] = loadfx( "vfx/map/blackout/blackout_house_sim_fx_03c" );
    level._effect["blackout_lamp_post_flare"] = loadfx( "vfx/map/blackout/blackout_lamp_post_flare" );
    level._effect["fire_wood_beam_flare_ups_med"] = loadfx( "fx/fire/fire_wood_beam_flare_ups_med" );
    level._effect["fire_wood_beam_flare_ups_verticle"] = loadfx( "vfx/map/blackout/blackout_house_fire_verticle" );
    level._effect["blackout_house_fire_wall"] = loadfx( "vfx/map/blackout/blackout_house_fire_wall" );
    level._effect["village_assault_house_fire"] = loadfx( "vfx/map/village_assault/village_assault_house_fire" );
    level._effect["blackout_house_fire_smoke"] = loadfx( "vfx/map/blackout/blackout_house_fire_smoke" );
    level._effect["blackout_house_fire_spotlight"] = loadfx( "vfx/map/blackout/blackout_house_fire_spotlight" );
    level._effect["hunted_fog_vista_near_fade_night"] = loadfx( "vfx/fog/hunted_fog_vista_near_fade_night" );
    level._effect["mist_blackout_add"] = loadfx( "vfx/map/blackout/mist_blackout_add" );
    level._effect["blackout_headlight"] = loadfx( "vfx/map/blackout/blackout_headlight" );
    level._effect["blackout_taillight_flipped"] = loadfx( "vfx/map/blackout/blackout_taillight" );
    level._effect["blackout_taillight"] = loadfx( "vfx/map/blackout/blackout_taillight_flipped" );
    level._effect["blackout_headlight_spotlight"] = loadfx( "vfx/map/blackout/blackout_headlight_spotlight" );
    level._effect["blackout_water_pour"] = loadfx( "vfx/map/blackout/blackout_water_pour" );
    level._effect["splash_up"] = loadfx( "fx/water/splash_launch_b" );
    level._effect["village_assault_lamp_post_lights"] = loadfx( "vfx/map/blackout/blackout_lamp_post_lights" );
    level._effect["blackout_house_fire_distortion"] = loadfx( "vfx/map/blackout/blackout_house_fire_distortion" );
    level._effect["blackout_flood_light"] = loadfx( "vfx/map/blackout/blackout_flood_light" );
    level._effect["small_explosion"] = loadfx( "fx/explosions/small_vehicle_explosion_night" );
    level._effect["magic_rocket_launch"] = loadfx( "vfx/map/blackout/blackout_rpg_flash" );
    level._effect["magic_rocket_geo"] = loadfx( "fx/smoke/smoke_geotrail_rocket_blackout" );
    level._effect["blackout_courtyard_falling_fires"] = loadfx( "vfx/map/blackout/blackout_courtyard_falling_fires" );
    level._effect["blackout_courtyard_fireball"] = loadfx( "vfx/map/blackout/blackout_courtyard_fireball" );
    level._effect["blackout_rpg_impact"] = loadfx( "vfx/map/blackout/blackout_rpg_impact" );
    level._effect["blackout_rpg_impact_secondary"] = loadfx( "vfx/map/blackout/blackout_rpg_impact_secondary" );
    level._effect["blackout_rpg_impact_porch"] = loadfx( "vfx/map/blackout/blackout_rpg_impact_porch" );
    level._effect["blackout_rpg_impact_after_fire"] = loadfx( "vfx/map/blackout/blackout_rpg_impact_after_fire" );
    level._effect["blackout_heli_flyover"] = loadfx( "vfx/map/blackout/blackout_heli_flyover" );
    level._effect["heli_spotlight"] = loadfx( "fx/misc/blackout_spotlight_model_night_no_noise" );
    level._effect["blackout_rappel_pebbles"] = loadfx( "vfx/map/blackout/blackout_rappel_pebbles" );
    level._effect["blackout_courtyard_after_fire"] = loadfx( "vfx/map/blackout/blackout_courtyard_after_fire" );
    level._effect["blackout_heli_end_flyover_01"] = loadfx( "vfx/map/blackout/blackout_heli_end_flyover_01" );
    level._effect["blackout_heli_end_flyover_02"] = loadfx( "vfx/map/blackout/blackout_heli_end_flyover_02" );
    level._effect["blackout_heli_end_flyover_03"] = loadfx( "vfx/map/blackout/blackout_heli_end_flyover_03" );
    level._effect["blackout_flashlight_dust_motes"] = loadfx( "vfx/map/blackout/blackout_flashlight_dust_motes" );
    level._effect["blackout_heli_cockpit_red"] = loadfx( "vfx/map/blackout/blackout_heli_cockpit_red" );
    level._effect["blackout_dust_motes_med"] = loadfx( "vfx/map/blackout/blackout_dust_motes_med" );
    level._effect["blackout_dust_motes_lrg"] = loadfx( "vfx/map/blackout/blackout_dust_motes_lrg" );
    level._effect["blackout_house_fire_flare"] = loadfx( "vfx/map/blackout/blackout_house_fire_flare" );
    level._effect["blackout_electric_box"] = loadfx( "vfx/map/blackout/blackout_electric_box" );
    level.destructible_effect_override["fx/explosions/small_vehicle_explosion"] = "fx/explosions/small_vehicle_explosion_night";
    level.destructible_effect_override["fx/smoke/car_damage_whitesmoke"] = "fx/smoke/car_damage_whitesmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke"] = "fx/smoke/car_damage_blacksmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke_fire"] = "fx/smoke/car_damage_blacksmoke_fire_night";
    level.destructible_effect_override["fx/props/car_glass_large"] = "fx/props/car_glass_large_night";
    level.destructible_effect_override["fx/props/car_glass_med"] = "fx/props/car_glass_med_night";
    level.destructible_effect_override["fx/props/car_glass_headlight"] = "fx/props/car_glass_headlight_night";
    level.destructible_effect_override["fx/props/car_glass_brakelight"] = "fx/props/car_glass_brakelight_night";
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["insects_firefly_a"] = loadfx( "fx/misc/insects_firefly_a" );
    level._effect["dust_ceiling_ash_small"] = loadfx( "fx/dust/dust_ceiling_ash_small" );
    level._effect["light_shaft_dust_med"] = loadfx( "fx/dust/light_shaft_dust_med" );
    level._effect["light_shaft_dust_field"] = loadfx( "fx/dust/light_shaft_dust_field" );
    level._effect["moth_runner_night"] = loadfx( "fx/misc/moth_runner_night" );
    level._effect["insects_carcass_runner"] = loadfx( "fx/misc/insects_carcass_runner" );
    level._effect["hallway_smoke_dark"] = loadfx( "fx/smoke/hallway_smoke_dark" );
    level._effect["lava"] = loadfx( "fx/misc/lava" );
    level._effect["lava_large"] = loadfx( "fx/misc/lava_large" );
    level._effect["lava_a"] = loadfx( "fx/misc/lava_a" );
    level._effect["lava_a_large"] = loadfx( "fx/misc/lava_a_large" );
    level._effect["lava_b"] = loadfx( "fx/misc/lava_b" );
    level._effect["lava_c"] = loadfx( "fx/misc/lava_c" );
    level._effect["lava_d"] = loadfx( "fx/misc/lava_d" );
    level._effect["lava_ash_runner"] = loadfx( "fx/misc/lava_ash_runner" );
    level._effect["village_smolder_slow"] = loadfx( "fx/smoke/village_smolder_slow" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "fx/fire/firelp_small_streak_pm_v" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fx/fire/firelp_small_streak_pm_h" );
    level._effect["mortar"] = loadfx( "vfx/explosion/rocket_explosion_mud" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud_dark" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust_dark" ) );
    level._id_78BA["fortress_artillery_intro_01"] = "parabolic_artillery_intro_01";
    level._id_78BA["fortress_artillery_intro_02"] = "parabolic_artillery_intro_02";
    level._id_78BA["truck_engine_start"] = "technical_start";
    level._id_78BA["parabolic_guardrail_scrape"] = "parabolic_guardrail_scrape";
    level._id_78BA["parabolic_truck_fenderbender"] = "parabolic_truck_fenderbender";
    level._id_78BA["parabolic_truck_peelout"] = "parabolic_truck_peelout";
    level._id_78BA["spotlight_on"] = "parabolic_spotlight_on";
    level._id_78BA["snd_breach_balcony_door"] = "detpack_explo_concrete";
    level._id_78BA["snd_breach_wooden_door"] = "detpack_explo_main";
    level._id_78BA["snd_wood_door_kick"] = "wood_door_kick";
    level._id_78BA["window_shutters_open"] = "wood_door_kick";
    level._id_78BA["knife_sequence"] = "parabolic_knife_sequence";
    level._id_78BA["muffled_voices"] = "parabolic_muffled_voices";
    _id_974C();
    globalfx_override();
    maps\createfx\blackout_fx::main();
    maps\createfx\blackout_sound::main();
}

globalfx_override()
{
    maps\_global_fx::override_global_fx( "m4m203_silencer", "fx/muzzleflashes/m4m203_silencer_nvg" );
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "brick", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "bark", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "carpet", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "cloth", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "concrete", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "dirt", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "flesh", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "foliage", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "glass", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "grass", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "gravel", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "ice", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "metal", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "mud", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "paper", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "plaster", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "rock", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "sand", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "snow", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "water", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "wood", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "asphalt", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "ceramic", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "plastic", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "rubber", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "cushion", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "fruit", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "painted metal", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "default", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland", "none", "fx/treadfx/tread_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "brick", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "bark", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "carpet", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "cloth", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "concrete", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "dirt", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "flesh", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "foliage", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "glass", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "grass", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "gravel", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "ice", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "metal", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "mud", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "paper", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "plaster", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "rock", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "sand", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "snow", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "water", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "wood", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "asphalt", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "ceramic", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "plastic", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "rubber", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "cushion", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "fruit", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "painted metal", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "default", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk_sas_night", "none", "fx/treadfx/heli_dust_blackout" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "brick", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "bark", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "carpet", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cloth", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "concrete", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "dirt", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "flesh", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "foliage", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "glass", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "grass", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "gravel", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ice", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "metal", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "mud", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "paper", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plaster", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rock", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "sand", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "snow", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "water", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "wood", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "asphalt", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ceramic", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plastic", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rubber", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cushion", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "fruit", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "painted metal", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "default", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "none", "fx/treadfx/heli_dust_hunted", "h1r_blackout_mi17_helicopter_wind" );
}