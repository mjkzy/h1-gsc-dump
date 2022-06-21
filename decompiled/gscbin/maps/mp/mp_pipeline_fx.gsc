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
    level._id_058F["pip_toxic_water_splash_base_sm"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_water_splash_base_sm" );
    level._id_058F["pip_toxic_water_gush_pipe_sm"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_water_gush_pipe_sm" );
    level._id_058F["pip_oil_splat_runner"] = loadfx( "vfx/map/mp_pipeline/pip_oil_splat_runner" );
    level._id_058F["falling_water_drip_line_sm_runner_fast"] = loadfx( "vfx/water/falling_water_drip_line_sm_runner_fast" );
    level._id_058F["falling_water_drip_line_runner_slow"] = loadfx( "vfx/water/falling_water_drip_line_runner_slow" );
    level._id_058F["pip_fire_spot_directional_blacksmk_lg"] = loadfx( "vfx/map/mp_pipeline/pip_fire_spot_directional_blacksmk_lg" );
    level._id_058F["pip_fire_wreckage_ground_mp_sm"] = loadfx( "vfx/map/mp_pipeline/pip_fire_wreckage_ground_mp_sm" );
    level._id_058F["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._id_058F["pip_falling_dust_runner"] = loadfx( "vfx/map/mp_pipeline/pip_falling_dust_runner" );
    level._id_058F["steam_vent_small"] = loadfx( "vfx/steam/steam_vent_small" );
    level._id_058F["steam_vent_burst_runner"] = loadfx( "vfx/steam/steam_vent_burst_runner" );
    level._id_058F["pip_toxic_waterfall_splash_med"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_waterfall_splash_med" );
    level._id_058F["pip_toxic_waterfall"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_waterfall" );
    level._id_058F["pip_fx_flare_security_sm_yellow"] = loadfx( "vfx/map/mp_pipeline/pip_fx_flare_security_sm_yellow" );
    level._id_058F["pip_ash_cloud_freq_lrg_loop"] = loadfx( "vfx/map/mp_pipeline/pip_ash_cloud_freq_lrg_loop" );
    level._id_058F["pip_ambient_particles"] = loadfx( "vfx/map/mp_pipeline/pip_ambient_particles" );
    level._id_058F["pip_waterfall_splash_base_sm"] = loadfx( "vfx/map/mp_pipeline/pip_waterfall_splash_base_sm" );
    level._id_058F["water_gush_pipe_xsm"] = loadfx( "vfx/water/water_gush_pipe_xsm" );
    level._id_058F["fog_ambient_low"] = loadfx( "vfx/fog/fog_ambient_low" );
    level._id_058F["dust_ground_slow"] = loadfx( "vfx/dust/dust_ground_slow" );
    level._id_058F["leaves_blowing_slow"] = loadfx( "vfx/wind/dlc/leaves_blowing_slow" );
    level._id_058F["pip_toxic_goo_drip"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_goo_drip" );
    level._id_058F["electrical_spark_loop_night"] = loadfx( "vfx/sparks/electrical_spark_loop_night" );
    level._id_058F["pip_fx_flare_bulkhead_sm_yellow"] = loadfx( "vfx/map/mp_pipeline/pip_fx_flare_bulkhead_sm_yellow" );
    level._id_058F["pip_smoke_pillar_large_slow_lit"] = loadfx( "vfx/map/mp_pipeline/pip_smoke_pillar_large_slow_lit" );
    level._id_058F["pip_fx_flare_med_yellow"] = loadfx( "vfx/map/mp_pipeline/pip_fx_flare_med_yellow" );
    level._id_058F["insects_fruitflies_flying_carentan"] = loadfx( "vfx/animal/insects_fruitflies_flying_carentan" );
    level._id_058F["pip_toxic_fog_ambient_low"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_fog_ambient_low" );
    level._id_058F["pip_toxic_chimney_smoke"] = loadfx( "vfx/map/mp_pipeline/pip_toxic_chimney_smoke" );
    level._id_058F["bird_vulture_circle_runner_less"] = loadfx( "vfx/animal/bird_vulture_circle_runner_less" );
    level._id_058F["insects_light_moths_complex"] = loadfx( "vfx/animal/insects_light_moths_complex" );
    level._id_058F["fire_wreckage_ground_mp"] = loadfx( "vfx/fire/fire_wreckage_ground_mp" );
    level._id_058F["godray_ambient_grates_sm"] = loadfx( "vfx/map/greece/godray_ambient_grates_sm" );
    level._id_058F["pip_hazy_sun_lensflare"] = loadfx( "vfx/map/mp_pipeline/pip_hazy_sun_lensflare" );
    level._id_058F["trash_spiral_runner"] = loadfx( "fx/misc/trash_spiral_runner" );
    level._id_058F["pip_sparks_interior_small"] = loadfx( "vfx/map/mp_pipeline/pip_sparks_interior_small" );
    level._id_058F["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._id_058F["leaves_fall_twirl_no_physics"] = loadfx( "vfx/wind/leaves_fall_twirl_no_physics" );
    level._id_058F["pip_godray_hazy_med"] = loadfx( "vfx/map/mp_pipeline/pip_godray_hazy_med" );
    level._id_058F["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._id_058F["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._id_058F["dust_ceiling_ash_large"] = loadfx( "fx/dust/dust_ceiling_ash_large" );
    level._id_058F["ash_spiral_runner"] = loadfx( "fx/dust/ash_spiral_runner" );
    level._id_058F["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._id_058F["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._id_058F["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._id_058F["coolaidmanbrick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
}
