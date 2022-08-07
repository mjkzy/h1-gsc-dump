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
    level thread _id_6EDB();
    level thread _id_974C();
    maps\createfx\ambush_fx::main();
    maps\createfx\ambush_sound::main();
}

_id_6EDB()
{
    level._effect["ambush_vl"] = loadfx( "fx/misc/ambush_vl" );
    level._effect["ambush_vl_far"] = loadfx( "fx/misc/ambush_vl_far" );
    level._effect["amb_dust"] = loadfx( "fx/smoke/amb_dust" );
    level._effect["amb_ash"] = loadfx( "fx/smoke/amb_ash" );
    level._effect["amb_smoke_add"] = loadfx( "fx/smoke/amb_smoke_add" );
    level._effect["amb_smoke_add_1"] = loadfx( "fx/smoke/amb_smoke_add_1" );
    level._effect["amb_smoke_add_1_far"] = loadfx( "fx/smoke/amb_smoke_add_1_far" );
    level._effect["amb_smoke_blend"] = loadfx( "fx/smoke/amb_smoke_blend" );
    level._effect["firelp_small_pm"] = loadfx( "fx/fire/firelp_small_pm" );
    level._effect["firelp_small_pm_a"] = loadfx( "fx/fire/firelp_small_pm_a" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fx/fire/firelp_small_streak_pm_h" );
    level._effect["hallways_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._effect["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M" );
    level._effect["village_morning_fog_06"] = loadfx( "fx/smoke/village_morning_fog_06" );
    level._effect["ambush_fog_vista_lrg"] = loadfx( "vfx/map/ambush/ambush_fog_vista_lrg" );
    level._effect["leaves_runner_pine"] = loadfx( "fx/misc/leaves_runner_pine" );
    level._effect["ambient_hallway_dust_01"] = loadfx( "vfx/map/ambush/ambient_hallway_dust_01" );
    level._effect["ambient_smoke_01"] = loadfx( "vfx/map/ambush/ambient_smoke_01" );
    level._effect["ambient_smoke_02"] = loadfx( "vfx/map/ambush/ambient_smoke_02" );
    level._effect["ambient_smoke_03"] = loadfx( "vfx/map/ambush/ambient_smoke_03" );
    level._effect["ambient_smoke_far"] = loadfx( "vfx/map/ambush/ambient_smoke_far" );
    level._effect["mist_hunted_add"] = loadfx( "fx/weather/mist_hunted_add" );
    level._effect["ambient_smoke_night"] = loadfx( "vfx/map/ambush/ambient_smoke_night" );
    level._effect["ambush_flood_light"] = loadfx( "vfx/map/ambush/ambush_flood_light" );
    level._effect["ambush_flood_light_outdoor"] = loadfx( "vfx/map/ambush/ambush_flood_light_outdoor" );
    level._effect["dust_falling_ceiling_light_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._effect["heli_dust_flyover"] = loadfx( "vfx/map/ambush/heli_dust_flyover" );
    level._effect["ambush_tower_collapse_dust"] = loadfx( "vfx/map/ambush/ambush_tower_collapse_dust" );
    level._effect["tower_impact_dust"] = loadfx( "vfx/map/ambush/tower_impact_dust" );
    level._effect["ambush_apartment_linger"] = loadfx( "vfx/map/ambush/ambush_apartment_linger" );
    level._effect["ambush_apartment_debris"] = loadfx( "vfx/map/ambush/ambush_apartment_debris" );
    level._effect["ambush_apartment_debris_02"] = loadfx( "vfx/map/ambush/ambush_apartment_debris_02" );
    level._effect["ambush_apartment_debris_03"] = loadfx( "vfx/map/ambush/ambush_apartment_debris_03" );
    level._effect["ambush_apartment_debris_fire"] = loadfx( "vfx/map/ambush/ambush_apartment_debris_fire" );
    level._effect["ambush_apartment_debris_fire_02"] = loadfx( "vfx/map/ambush/ambush_apartment_debris_fire_02" );
    level._effect["smoke_trail_concrete_wispy"] = loadfx( "vfx/trail/smoke_trail_concrete_wispy" );
    level._effect["ambush_apartment_kill_spawn"] = loadfx( "vfx/map/ambush/ambush_apartment_kill_spawns" );
    level._effect["trash_tornado_s_parent_motion"] = loadfx( "vfx/map/ambush/ambush_trash_tornado" );
    level._effect["wind_blowing_debris"] = loadfx( "vfx/wind/wind_blowing_debris" );
    level._effect["ambush_light_godrays"] = loadfx( "vfx/map/ambush/ambush_light_godrays" );
    level._effect["ambush_village_fog_vista_near_fade"] = loadfx( "vfx/map/ambush/ambush_village_fog_vista_near_fade" );
    level._effect["apartment_heli_fire_shell"] = loadfx( "vfx/map/ambush/ambush_apartment_shells" );
    level._effect["ambush_sign_r"] = loadfx( "vfx/map/ambush/ambush_sign_r" );
    level._effect["ambush_sign_r_day"] = loadfx( "vfx/map/ambush/ambush_sign_r_day" );
    level._effect["ambush_sign_sprite_light"] = loadfx( "vfx/map/ambush/ambush_sign_sprite_light" );
    level._effect["ambush_fire_barrel"] = loadfx( "fx/fire/ambush_fire_barrel" );
    level._effect["mg_nest_expl"] = loadfx( "fx/explosions/small_vehicle_explosion" );
    level._effect["bullet_spark"] = loadfx( "fx/impacts/large_metalhit_1" );
    level._effect["head_fatal"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._effect["bloodpool"] = loadfx( "fx/impacts/deathfx_bloodpool_ambush" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud_dark" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_flood_light", ( -593.53, 1172.85, 97.5281 ), ( 357.953, 79.0317, -92.3872 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_flood_light", ( -382.417, 1173.13, 75.5279 ), ( 348.225, 98.3652, -84.921 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_flood_light", ( -68.4582, 1182.06, 65.9917 ), ( 351.887, 114.715, -88.2766 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_flood_light", ( 160.799, 1167.46, 65.983 ), ( 348.448, 96.7673, -87.0688 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_flood_light_outdoor", ( -664.035, 531.96, 114.84 ), ( 90, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_r", ( -70.987, 1057.46, 171.473 ), ( 0, 270, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -97.266, 1048.68, 172.31 ), ( 270, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -121.031, 1047.65, 172.351 ), ( 270, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -144.233, 1048.69, 172.052 ), ( 270, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -294.135, 1042.64, 171.822 ), ( 270, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -318.893, 1045.65, 172.387 ), ( 270, 0, 0 ) );
    thread play_nighttime_fx( "vfx/map/ambush/ambush_sign_sprite_light", ( -435.207, 1042.64, 173.216 ), ( 270, 0, 0 ) );
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "brick", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "bark", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "carpet", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "cloth", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "concrete", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "dirt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "flesh", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "foliage", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "glass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "grass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "gravel", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "ice", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "mud", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "paper", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "plaster", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "rock", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "sand", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "snow", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "water", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "wood", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "asphalt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "ceramic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "plastic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "rubber", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "cushion", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "fruit", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "painted metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "default", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp_woodland_low", "none", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "brick", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "bark", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "carpet", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "cloth", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "concrete", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "dirt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "flesh", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "foliage", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "glass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "grass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "gravel", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "ice", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "mud", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "paper", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "plaster", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "rock", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "sand", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "snow", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "water", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "wood", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "asphalt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "ceramic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "plastic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "rubber", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "cushion", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "fruit", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "painted metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "default", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_cover", "none", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "brick", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "bark", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "carpet", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "cloth", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "concrete", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "dirt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "flesh", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "foliage", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "glass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "grass", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "gravel", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "ice", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "mud", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "paper", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "plaster", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "rock", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "sand", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "snow", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "water", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "wood", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "asphalt", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "ceramic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "plastic", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "rubber", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "cushion", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "fruit", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "painted metal", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "default", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_open", "none", "fx/treadfx/tread_dust_ambush" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "brick", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "bark", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "carpet", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "cloth", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "concrete", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "dirt", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "flesh", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "foliage", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "glass", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "grass", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "gravel", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "ice", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "metal", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "mud", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "paper", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "plaster", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "rock", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "sand", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "snow", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "water", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "wood", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "asphalt", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "ceramic", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "plastic", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "rubber", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "cushion", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "fruit", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "painted metal", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "default", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
    maps\_treadfx::_id_8350( "script_vehicle_blackhawk", "none", "fx/treadfx/heli_dust_ambush", "ambush_helicopter_wind" );
}

play_nighttime_fx( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::_id_8959();
    var_3.origin = var_1;
    var_3.angles = var_2;
    var_4 = loadfx( var_0 );
    playfxontag( var_4, var_3, "tag_origin" );
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    stopfxontag( var_4, var_3, "tag_origin" );
}
