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
    level._effect["door_godrays_short_armada"] = loadfx( "vfx/map/armada/door_godrays_short_armada" );
    level._effect["jet_contrail_airlift"] = loadfx( "fx/smoke/jet_contrail_airlift" );
    level._effect["door_godrays_armada"] = loadfx( "vfx/map/armada/door_godrays_armada" );
    level._effect["spark_burst_armada"] = loadfx( "vfx/map/armada/spark_burst_armada" );
    level._effect["dust_ambient_interior_big_armada"] = loadfx( "vfx/map/greece/dust_ambient_interior_big_armada" );
    level._effect["neon_floating_dust_armada"] = loadfx( "fx/misc/neon_floating_dust_armada" );
    level._effect["ambient_cloud_fog_area_local_armada"] = loadfx( "vfx/map/armada/ambient_cloud_fog_area_local_armada" );
    level._effect["floating_room_dust_02_armada"] = loadfx( "fx/misc/floating_room_dust_02_armada" );
    level._effect["amb_dust_int_armada"] = loadfx( "vfx/dust/amb_dust_int_armada" );
    level._effect["window_smoke_armada"] = loadfx( "vfx/smoke/window_smoke_armada" );
    level._effect["ash_cloud_freq_lrg_loop_armada"] = loadfx( "vfx/ash/ash_cloud_freq_lrg_loop_armada" );
    level._effect["wind_blowing_trash"] = loadfx( "vfx/wind/wind_blowing_trash" );
    level._effect["trash_tornado_s"] = loadfx( "vfx/wind/trash_tornado_s" );
    level._effect["bird_seagull_flock_large_armada"] = loadfx( "vfx/animal/bird_seagull_flock_large_armada" );
    level._effect["wavebreak_runner_armada"] = loadfx( "fx/misc/wavebreak_runner_armada" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    level._effect["breach_wooden_door"] = loadfx( "fx/explosions/breach_wooden_door" );
    level._effect["breach_metal_door"] = loadfx( "fx/explosions/breach_metal_door" );
    level._effect["power_faillure_armada"] = loadfx( "vfx/lights/power_faillure_armada" );
    level._effect["tv_explosion"] = loadfx( "fx/explosions/tv_explosion" );
    level._effect["large_vehicle_explosion_pickup_armada"] = loadfx( "fx/explosions/large_vehicle_explosion_pickup_armada" );
    level._effect["small_vehicle_explosion_armada"] = loadfx( "fx/explosions/small_vehicle_explosion_armada" );
    level._effect["fx_sunflare_armada"] = loadfx( "vfx/lensflare/fx_sunflare_armada" );
    level._effect["light_spotlight_cone_haze_dim_armada"] = loadfx( "vfx/lights/light_spotlight_cone_haze_dim_armada" );
    level._effect["light_spotlight_cone_haze_dim_armada_hqup"] = loadfx( "vfx/lights/light_spotlight_cone_haze_dim_armada_hqup" );
    level._effect["ground_fire_mwr"] = loadfx( "vfx/fire/ground_fire_mwr" );
    level._effect["tire_fire_med"] = loadfx( "fx/fire/tire_fire_med" );
    level._effect["fire_spawner_child_small_armada"] = loadfx( "vfx/fire/fire_spawner_child_small_armada" );
    level._effect["fire_wreckage_ground_armada"] = loadfx( "vfx/fire/fire_wreckage_ground_armada" );
    level._effect["tire_fire"] = loadfx( "vfx/fire/tire_fire" );
    level._effect["big_fire_far_armada"] = loadfx( "vfx/fire/big_fire_far_armada" );
    level._effect["small_wide_fire_armada"] = loadfx( "vfx/fire/small_wide_fire_armada" );
    level._effect["firelp_med_pm_armada"] = loadfx( "fx/fire/firelp_med_pm_armada" );
    level._effect["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M_armada" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L_armada" );
    level._effect["thin_black_smoke_extension"] = loadfx( "fx/smoke/thin_black_smoke_L_armada" );
    level._effect["smoke_chimney_small_dark"] = loadfx( "vfx/smoke/smoke_chimney_small_dark_armada" );
    level._effect["smk_linger_narrow_armada"] = loadfx( "vfx/smoke/smk_linger_narrow_armada" );
    level._effect["battlefield_smoke_m_slow_armada"] = loadfx( "vfx/smoke/battlefield_smoke_m_slow_armada" );
    level._effect["armada_window_morning_fog_big_thick"] = loadfx( "fx/smoke/armada_window_morning_fog_big_thick" );
    level._effect["window_smoke_armada"] = loadfx( "vfx/smoke/window_smoke_armada" );
    level._effect["thin_black_smoke_l_noz_armada"] = loadfx( "fx/smoke/thin_black_smoke_l_noz_armada" );
    level._effect["thin_black_smoke_l_outdoor_armada"] = loadfx( "fx/smoke/thin_black_smoke_l_outdoor_armada" );
    level._effect["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_yel_loop_armada" );
    level._effect["dust_ambient_interior_big"] = loadfx( "vfx/map/greece/dust_ambient_interior_big" );
    level._effect["floating_room_dust"] = loadfx( "fx/misc/floating_room_dust" );
    level._effect["amb_dust_wind_armada"] = loadfx( "vfx/dust/amb_dust_wind_armada" );
    level._effect["amb_dust_wind_narrow_armada"] = loadfx( "vfx/dust/amb_dust_wind_narrow_armada" );
    level._effect["ground_sand_light_wind"] = loadfx( "vfx/sand/ground_sand_light_wind_armada" );
    level._effect["ground_sand_skitter"] = loadfx( "vfx/sand/ground_sand_skitter_armada" );
    level._effect["ground_sand_scroll"] = loadfx( "vfx/sand/ground_sand_scroll_armada" );
    level._effect["ambient_sand_lingering"] = loadfx( "vfx/sand/ambient_sand_lingering_armada" );
    level._effect["ground_sand_wind_slow_01"] = loadfx( "vfx/sand/ground_sand_wind_slow_01_armada" );
    level._effect["ground_sand_fine_flat"] = loadfx( "vfx/sand/ground_sand_fine_flat_armada" );
    level._effect["ground_sand_drifts_flat"] = loadfx( "vfx/sand/ground_sand_drifts_flat_armada" );
    level._effect["sand_tornado_armada"] = loadfx( "vfx/sand/sand_tornado_armada" );
    level._effect["sand_armada"] = loadfx( "fx/sand/sand_armada" );
    level._effect["paper_sheet_01_blowing"] = loadfx( "vfx/wind/paper_sheet_01_blowing_armada" );
    level._effect["heli_residual_dust_armada"] = loadfx( "fx/treadfx/heli_residual_dust_armada" );
    level._effect["heli_residual_rooftop_dust_armada"] = loadfx( "fx/treadfx/heli_residual_rooftop_dust_armada" );
    level._effect["heat_distortion_mirage_large"] = loadfx( "vfx/distortion/heat_distortion_mirage_large" );
    level._effect["heat_distortion_mirage_med"] = loadfx( "vfx/distortion/heat_distortion_mirage_med" );
    level._effect["heat_distortion_mirage_large_armada"] = loadfx( "vfx/distortion/heat_distortion_mirage_large_armada" );
    level._effect["hawk"] = loadfx( "fx/weather/hawk" );
    level._effect["fog_oriented_edge_fade_lrg_armada"] = loadfx( "vfx/fog/fog_oriented_edge_fade_lrg_armada" );
    level._effect["fog_oriented_edge_fade_armada"] = loadfx( "vfx/fog/fog_oriented_edge_fade_armada" );
    level._effect["power_tower_light_red_blink"] = loadfx( "fx/misc/power_tower_light_red_blink" );
    level._effect["floating_room_dust_02"] = loadfx( "fx/misc/floating_room_dust_02" );
    level._effect["village_window_vl_xsml_child_big_thick"] = loadfx( "fx/misc/village_window_vl_xsml_child_big_thick" );
    level._effect["ash_column_falling_armada"] = loadfx( "fx/misc/ash_column_falling_armada" );
    level._effect["palm_leaves_armada"] = loadfx( "fx/misc/palm_leaves_armada" );
    level._effect["armada_street_godray"] = loadfx( "fx/misc/armada_street_godray" );
    level._effect["spotlight_studiolight_armada"] = loadfx( "vfx/lights/spotlight_studiolight_armada" );
    level._effect["armada_windows_rays"] = loadfx( "vfx/lights/armada_windows_rays" );
    level._effect["village_morning_fog_large"] = loadfx( "fx/smoke/village_morning_fog_large" );
    level._effect["trash_tornado_s"] = loadfx( "vfx/wind/trash_tornado_s" );
    level._effect["wind_blowing_trash"] = loadfx( "vfx/wind/wind_blowing_trash" );
    level._effect["dust_motes_armada"] = loadfx( "vfx/map/armada/dust_motes_armada" );
    level._effect["insects_flies_wall"] = loadfx( "vfx/animal/insects_flies_wall" );
    level._effect["water_drips_armada_ripples"] = loadfx( "vfx/rain/water_drips_armada_ripples" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    setexpfog( 800, 6000, 0.583, 0.644, 0.587, 1, 0, 0 );
    _id_974C();
    thread pickup_technical_deathfx_override();
    thread destructiblefx_overide();
    maps\createfx\armada_fx::main();
    maps\createfx\armada_sound::main();
}

_id_974C()
{
    _id_A59D::_id_7F1E( "script_vehicle_blackhawk", "fx/treadfx/heli_dust_armada", "h1r_blackhawk_wind" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk", "water", "fx/treadfx/heli_water", "h1r_blackhawk_wind" );
    _id_A59D::_id_7F1E( "script_vehicle_m1a1_abrams", "vfx/treadfx/tread_dust_tanks", undefined );
}

pickup_technical_deathfx_override()
{
    _id_A5A8::swap_deathfx_effect_only( "script_vehicle_pickup_technical", "fx/explosions/Vehicle_Explosion_Pickuptruck", "tag_deathfx", "fx/explosions/large_vehicle_explosion_pickup_armada" );
    _id_A5A8::swap_deathfx_effect_only( "script_vehicle_pickup_technical", "fx/fire/firelp_med_pm", "tag_fx_cab", "fx/fire/firelp_med_pm_armada" );
}

destructiblefx_overide()
{
    level.destructible_effect_override["fx/explosions/small_vehicle_explosion"] = "fx/explosions/small_vehicle_explosion_armada";
}
