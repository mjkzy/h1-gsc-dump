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
    maps\_utility::_id_075A( "large", 0.3, 0.6, 6000 );
    maps\_utility::_id_075A( "building_top", 1, 1, 6000 );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    level._effect["00_particle_shadow_static_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_d" );
    level._effect["00_particle_shadow_static_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_d" );
    level._effect["00_particle_shadow_static_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_d" );
    level._effect["bird_pm"] = loadfx( "fx/misc/bird_pm" );
    level._effect["bird_takeoff_pm"] = loadfx( "fx/misc/bird_takeoff_pm" );
    level._effect["blood"] = loadfx( "fx/impacts/sniper_escape_blood" );
    level._effect["tread_burnout"] = loadfx( "fx/treadfx/tread_burnout_default" );
    level._effect["bullet_geo"] = loadfx( "fx/smoke/smoke_geotrail_barret" );
    level._effect["rocket_geo"] = loadfx( "fx/smoke/smoke_geotrail_rocket_sniperescape" );
    level._effect["wind_controlled_leaves"] = loadfx( "fx/misc/wind_controlled_leaves" );
    level._effect["blood_pool"] = loadfx( "fx/impacts/deathfx_bloodpool" );
    level._effect["ghillie_leaves"] = loadfx( "fx/misc/gilli_leaves" );
    level._effect["wall_explosion"] = loadfx( "fx/explosions/wall_explosion_sniperescape" );
    level._effect["hind_fire"] = loadfx( "fx/muzzleflashes/bmp_flash_wv" );
    level._effect["window_glass_shatter01"] = loadfx( "vfx/destructible/window_glass_shatter_01" );
    level._effect["h1_ca_ui_placement_marker"] = loadfx( "fx/misc/h1_ca_ui_placement_marker" );
    level._effect["snow_wind"] = loadfx( "fx/snow/snow_wind_sniperescape" );
    level._effect["ground_smoke"] = loadfx( "fx/smoke/ground_smoke_sniperescape" );
    level._effect["ground_smoke_sm"] = loadfx( "fx/smoke/ground_smoke_sm_sniperescape" );
    level._effect["ground_smoke_sm_thick"] = loadfx( "fx/smoke/ground_smoke_sm_thick_sniperescape" );
    level._effect["smoke_interior_01"] = loadfx( "fx/smoke/smoke_interior_stair_sniperescape01" );
    level._effect["smoke_interior_02"] = loadfx( "fx/smoke/smoke_interior_stair_sniperescape02" );
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["village_smolder_slow"] = loadfx( "fx/smoke/village_smolder_slow" );
    level._effect["village_smolder_hall"] = loadfx( "fx/smoke/village_smolder_hall_sniperescape" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "fx/fire/firelp_small_streak_pm_v_sniperescape" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fx/fire/firelp_small_streak_pm_h_sniperescape" );
    level._effect["fire_wall_50"] = loadfx( "fx/fire/fire_wall_50_sniperescape" );
    level._effect["lava"] = loadfx( "fx/misc/lava" );
    level._effect["lava_large"] = loadfx( "fx/misc/lava_large" );
    level._effect["lava_a"] = loadfx( "fx/misc/lava_a" );
    level._effect["lava_a_large"] = loadfx( "fx/misc/lava_a_large" );
    level._effect["lava_b"] = loadfx( "fx/misc/lava_b" );
    level._effect["lava_c"] = loadfx( "fx/misc/lava_c" );
    level._effect["lava_d"] = loadfx( "fx/misc/lava_d" );
    level._effect["lava_ash_runner"] = loadfx( "fx/misc/lava_ash_runner" );
    level._effect["ash_cloud_loop_sniperescape"] = loadfx( "vfx/ash/ash_cloud_loop_sniperescape" );
    level._effect["light_beam_long_sniperescape"] = loadfx( "fx/misc/light_beam_long_sniperescape" );
    level._effect["battlefield_smoke_sniperescape"] = loadfx( "vfx/smoke/dlc/battlefield_smoke_sniperescape" );
    level._effect["leaves_fall_gentlewind"] = loadfx( "vfx/wind/leaves_fall_gentlewind" );
    level._effect["leaves_runner_sniperescape"] = loadfx( "vfx/wind/leaves_runner_sniperescape" );
    level._effect["light_beam_fog_long_scoutsniper"] = loadfx( "fx/smoke/light_beam_fog_long_scoutsniper" );
    level._effect["dust_ceiling_agu"] = loadfx( "fx/dust/dust_ceiling_agu" );
    level._effect["ash_falling"] = loadfx( "fx/misc/ash_falling_sniperescape" );
    level._effect["firelp_med_pm_sniperescape"] = loadfx( "fx/fire/firelp_med_pm_sniperescape" );
    level._effect["btlfld_smoke_m_slow_sniperescape"] = loadfx( "vfx/smoke/dlc/btlfld_smoke_m_slow_sniperescape" );
    level._effect["btlfld_smoke_m_far_sniperescape"] = loadfx( "vfx/smoke/dlc/btlfld_smoke_m_far_slow_sniperescape" );
    level._effect["btlfld_smoke_xl_slow_sniperescape"] = loadfx( "vfx/smoke/dlc/btlfld_smoke_xl_slow_sniperescape" );
    level._effect["paper_sheet_01_blowing"] = loadfx( "vfx/wind/paper_sheet_01_blowing_sniperescape" );
    level._effect["fog_oriented_edge_fade"] = loadfx( "vfx/fog/fog_oriented_edge_fade" );
    level._effect["firelp_barrel_pm_no_light"] = loadfx( "fx/fire/firelp_barrel_pm_no_light" );
    level._effect["fire_damaged_wall_sniperescape"] = loadfx( "vfx/map/sniperescape/fire_damaged_wall_sniperescape" );
    level._effect["fire_damaged_wall_sm_sniperescape"] = loadfx( "vfx/map/sniperescape/fire_damaged_wall_sm_sniperescape" );
    level._effect["vl_a_int_sniperescape"] = loadfx( "vfx/map/sniperescape/vl_a_int_sniperescape" );
    level._effect["vl_a_int_less_sniperescape"] = loadfx( "vfx/map/sniperescape/vl_a_int_less_sniperescape" );
    level._effect["smoke_dust_int_sniperescape"] = loadfx( "vfx/map/sniperescape/smoke_dust_int_sniperescape" );
    level._effect["firelp_small_sniperescape"] = loadfx( "vfx/map/sniperescape/firelp_small_sniperescape" );
    level._effect["fx_sunflare_sniperescape"] = loadfx( "vfx/lensflare/fx_sunflare_sniperescape" );
    level._effect["aerial_explosion"] = loadfx( "vfx/map/sniperescape/aerial_explosion_sniperescape" );
    level._effect["window_explosion"] = loadfx( "fx/explosions/window_explosion_sniperescape" );
    level._effect["window_rock"] = loadfx( "fx/explosions/window_rock" );
    level._effect["window_brick_chunk_cam"] = loadfx( "fx/explosions/window_brick_chunk_cam" );
    level._effect["window_fire_large"] = loadfx( "fx/fire/window_fire_large_sniperescape" );
    level._effect["window_fire_large_2"] = loadfx( "fx/fire/window_fire_large_sniperescape_2" );
    level._effect["dust_ceiling_ash_large"] = loadfx( "fx/dust/dust_ceiling_ash_large_sniperescape" );
    level._effect["dust_ceiling_ash_large_stairwell"] = loadfx( "fx/dust/dust_ceiling_ash_lrg_stairwell_sniperescape" );
    level._effect["light_shaft_dust_med"] = loadfx( "fx/dust/light_shaft_dust_med_sniperescape" );
    level._effect["light_shaft_dust_large"] = loadfx( "fx/dust/light_shaft_dust_large_sniperescape" );
    level._effect["room_dust_200"] = loadfx( "fx/dust/room_dust_200_sniperescape" );
    level._effect["heli_explosion"] = loadfx( "fx/explosions/helicopter_explosion" );
    level._effect["aerial_explosion_heli"] = loadfx( "fx/explosions/aerial_explosion_heli" );
    level._effect["helicopter_crash_dirt"] = loadfx( "fx/explosions/helicopter_crash_dirt" );
    level._effect["aerial_explosion_large"] = loadfx( "fx/explosions/aerial_explosion_large" );
    level._effect["detpack_explosion"] = loadfx( "fx/explosions/exp_pack_hallway" );
    level._effect["heli_missile_launch"] = loadfx( "fx/muzzleflashes/cobra_rocket_flash_wv" );
    level._effect["heli_engine_smolder"] = loadfx( "fx/smoke/heli_engine_smolder" );
    level._effect["fire_trail_heli"] = loadfx( "fx/fire/fire_smoke_trail_L" );
    level._effect["smoke_trail_heli"] = loadfx( "fx/smoke/smoke_trail_black_heli" );
    level._effect["brick_chunk"] = loadfx( "fx/explosions/brick_chunk" );
    level._effect["helicopter_tail_sparks"] = loadfx( "fx/misc/helicopter_tail_sparks" );
    level._effect["rotor_smash"] = loadfx( "fx/misc/rotor_smash" );
    level._effect["heli_dirt"] = loadfx( "fx/explosions/heli_dirt" );
    level._effect["heli_dirt_rear"] = loadfx( "fx/explosions/heli_dirt_rear" );
    level._effect["heli_rotor_dirt"] = loadfx( "fx/explosions/heli_rotor_dirt" );
    level._effect["heli_crash_dust"] = loadfx( "fx/dust/heli_crash_dust" );
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
    animscripts\utility::_id_7F74( "snow", loadfx( "fx/impacts/footstep_snow" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust_dark" ) );
    level thread _id_974C();
    globalfx_override();
    maps\createfx\sniperescape_fx::main();
    maps\createfx\sniperescape_sound::main();
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "brick", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "bark", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "carpet", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "cloth", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "concrete", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "dirt", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "flesh", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "foliage", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "glass", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "grass", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "gravel", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "ice", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "metal", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "mud", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "paper", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "plaster", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "rock", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "sand", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "snow", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "water", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "wood", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "asphalt", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "ceramic", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "plastic", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "rubber", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "cushion", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "fruit", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "painted metal", "fx/treadfx/tread_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "default", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_uaz_hardtop_destructible", "none", "fx/treadfx/tread_road_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "brick", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "bark", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "carpet", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "cloth", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "concrete", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "dirt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "flesh", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "foliage", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "glass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "grass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "gravel", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "ice", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "mud", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "paper", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "plaster", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "rock", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "sand", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "snow", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "water", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "wood", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "asphalt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "ceramic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "plastic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "rubber", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "cushion", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "fruit", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "painted metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "default", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e", "none", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "brick", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "bark", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "carpet", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cloth", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "concrete", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "dirt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "flesh", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "foliage", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "glass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "grass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "gravel", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ice", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "mud", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "paper", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plaster", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rock", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "sand", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "snow", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "water", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "wood", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "asphalt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ceramic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plastic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rubber", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cushion", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "fruit", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "painted metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "default", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "none", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "brick", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "bark", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "carpet", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "cloth", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "concrete", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "dirt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "flesh", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "foliage", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "glass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "grass", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "gravel", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "ice", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "mud", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "paper", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "plaster", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "rock", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "sand", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "snow", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "water", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "wood", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "asphalt", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "ceramic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "plastic", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "rubber", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "cushion", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "fruit", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "painted metal", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "default", "fx/treadfx/heli_dust_sniperescape" );
    maps\_treadfx::_id_8350( "script_vehicle_mi28_flying", "none", "fx/treadfx/heli_dust_sniperescape" );
}

globalfx_override()
{
    maps\_global_fx::override_global_fx( "barrel_fireFX_origin", "fx/fire/firelp_barrel_pm_no_light", undefined, "fire_barrel_small", "smallfire" );
}