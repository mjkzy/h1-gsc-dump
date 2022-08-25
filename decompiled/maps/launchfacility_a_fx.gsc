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
    level._effect["saw_sparks"] = loadfx( "fx/misc/rescuesaw_sparks" );
    level._effect["headshot"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._effect["c4_secondary_explosion_01"] = loadfx( "fx/explosions/exp_pack_hallway" );
    level._effect["c4_secondary_explosion_02"] = loadfx( "fx/explosions/grenadeExp_metal" );
    level._effect["hind_explosion"] = loadfx( "fx/explosions/helicopter_explosion" );
    level._effect["heli_aerial_explosion"] = loadfx( "fx/explosions/aerial_explosion_launch_a" );
    level._effect["heli_aerial_explosion_large"] = loadfx( "fx/explosions/aerial_explosion_large" );
    level._effect["smoke_trail_heli"] = loadfx( "fx/fire/fire_smoke_trail_L" );
    level._effect["smoke_trail_bmp"] = loadfx( "fx/smoke/damaged_vehicle_smoke" );
    level._effect["tree_fire_fx"][0] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._effect["tree_fire_fx"][1] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["tree_fire_fx"][2] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["tree_fire_fx"][3] = loadfx( "fx/smoke/smoke_large" );
    level._effect["tree_fire_fx"][4] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["tree_fire_fx"][5] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["tree_fire_fx"][6] = loadfx( "fx/smoke/smoke_large" );
    level._effect["tree_fire_fx"][7] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["tree_fire_fx"][8] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["launchtube_steam"] = loadfx( "fx/smoke/launchTube_steam" );
    level._effect["rappel_objective"] = loadfx( "fx/misc/ui_pickup_available" );
    level._effect["vent_flashlight"] = loadfx( "fx/lights/light_blink_nolight_fast" );
    level._effect["smoke_missile_launched_01"] = loadfx( "fx/smoke/smoke_launchtubes" );
    level._effect["smoke_missile_launched_02"] = loadfx( "fx/smoke/smoke_launchtubes" );
    level._effect["steam_chimney"] = loadfx( "fx/smoke/steam_chimney" );
    level._effect["steam_large_vent"] = loadfx( "fx/smoke/steam_large_vent" );
    level._effect["steam_large_vent_shaft"] = loadfx( "fx/smoke/steam_large_vent_shaft" );
    level._effect["firelp_large_pm"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["fire_heli_wreck"] = loadfx( "fx/fire/fire_heli_wreck_lg" );
    level._effect["fire_tank_wreck"] = loadfx( "fx/fire/h1_fire_tank_wreck_lg" );
    level._effect["fire_heli_wreck_sm"] = loadfx( "fx/fire/fire_heli_wreck_sm" );
    level._effect["light_blink_red"] = loadfx( "fx/lights/light_blink_nolight" );
    level._effect["snow_wind"] = loadfx( "fx/snow/snow_wind" );
    level._effect["snow_flurries"] = loadfx( "fx/snow/snow_flurries" );
    level._effect["snow_flurries_screen"] = loadfx( "fx/snow/snow_flurries_screen" );
    level._effect["snow_gust"] = loadfx( "vfx/snow/snow_blown_off_rocks_lp" );
    level._effect["ground_smoke_launch_a"] = loadfx( "fx/smoke/ground_smoke_launch_a" );
    level._effect["village_fog_vista"] = loadfx( "vfx/fog/village_fog_vista" );
    level._effect["village_fog_vista_lrg"] = loadfx( "vfx/fog/village_fog_vista_lrg" );
    level._effect["light_cone_a"] = loadfx( "vfx/lights/light_cone_single_dust_int" );
    level._effect["light_cone_b"] = loadfx( "vfx/map/hunted/hunted_street_lights" );
    level._effect["veh_explode_sm"] = loadfx( "fx/explosions/small_vehicle_explosion_launch_a" );
    level._effect["veh_explode_bmp"] = loadfx( "fx/explosions/vehicle_explosion_bmp_launch_a" );
    level._effect["static_headlight"] = loadfx( "vfx/lights/launch_a_headlight" );
    level._effect["static_taillight_flipped"] = loadfx( "vfx/map/blackout/blackout_taillight" );
    level._effect["static_taillight"] = loadfx( "vfx/map/blackout/blackout_taillight_flipped" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_snow" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "snow", loadfx( "fx/impacts/footstep_snow" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    level._id_78BA["launch_chopsaw1"] = "launch_chopsaw1";
    level._id_78BA["launch_chopsaw2"] = "launch_chopsaw2";
    level._id_78BA["launch_heli_dying_loop"] = "launch_heli_dying_loop";
    level._id_78BA["launch_heli_alarm_loop"] = "launch_heli_alarm_loop";
    level._id_78BA["launch_alarm_buzzer"] = "launch_alarm_buzzer";
    level._id_78BA["launch_tube_prepare"] = "launch_tube_prepare";
    level._id_78BA["launch_tube_open_start"] = "launch_tube_open_start";
    level._id_78BA["launch_tube_open_loop"] = "launch_tube_open_loop";
    level._id_78BA["launch_tube_open_end"] = "launch_tube_open_end";
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bm21_mobile", "fx/explosions/vehicle_explosion_bmp", "tag_deathfx", "fx/fire/h1_fire_tank_wreck_lg" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bm21_mobile", "fx/fire/firelp_med_pm", "tag_fx_cab", "fx/fire/h1_fire_tank_wreck_lg" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bm21_mobile", "fx/explosions/small_vehicle_explosion", "tag_fx_tank", "fx/explosions/small_vehicle_explosion_launch_a" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bm21_mobile", "fx/explosions/vehicle_explosion_bm21", undefined, "fx/explosions/vehicle_explosion_bmp_launch_a" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/explosions/vehicle_explosion_bmp_fire", "tag_deathfx", "fx/fire/h1_fire_tank_wreck_lg" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/misc/empty", "tag_cargofire", "fx/fire/h1_fire_tank_wreck_lg" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/explosions/vehicle_explosion_bmp", "tag_deathfx", "fx/explosions/vehicle_explosion_bmp_launch_a" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/explosions/grenadeexp_default", "tag_engine_left", "hind_helicopter_hit", undefined, undefined, undefined, 0.2, 1 );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/explosions/grenadeexp_default", "tail_rotor_jnt", "hind_helicopter_hit", undefined, undefined, undefined, 0.5, 1 );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/fire/fire_smoke_trail_L", "tail_rotor_jnt", "hind_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/explosions/aerial_explosion_launch_a", "tag_engine_right", "hind_helicopter_hit", undefined, undefined, undefined, 2.5, 1 );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/explosions/aerial_explosion_launch_a", "tag_deathfx", "hind_helicopter_hit", undefined, undefined, undefined, 4.0 );
    maps\_vehicle::build_deathfx_override( "script_vehicle_mi24p_hind_woodland", "hind", "vehicle_mi24p_hind_woodland", "fx/explosions/helicopter_explosion_hind_woodland", undefined, "hind_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    maps\_vehicle::build_exploder_event_with_targetname( "hind_intro_flyby_01", "crash_done", 200, 0.5 );
    maps\createfx\launchfacility_a_fx::main();
    maps\createfx\launchfacility_a_sound::main();
}
