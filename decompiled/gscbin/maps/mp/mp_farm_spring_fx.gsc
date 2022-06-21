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
    level._id_058F["light_spotlight_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/light_spotlight_mp_farm_spring" );
    level._id_058F["fx_flare_bulkhead_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/fx_flare_bulkhead_mp_farm_spring" );
    level._id_058F["mp_balloon_pop"] = loadfx( "fx/maps/mp_farm_spring/mp_balloon_pop" );
    level._id_058F["particulates_100_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/particulates_100_mp_farm_spring" );
    level._id_058F["rainbow_sprite_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/rainbow_sprite_mp_farm_spring" );
    level._id_058F["rainbow_flare_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/rainbow_flare_mp_farm_spring" );
    level._id_058F["vfx_water_drips"] = loadfx( "fx/maps/mp_downpour/vfx_water_drips" );
    level._id_058F["fx_flare_anamorphic_rain"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_rain" );
    level._id_058F["smoldering_smk_direction_s"] = loadfx( "vfx/smoke/smoldering_smk_direction_s" );
    level._id_058F["water_flow_rain_gutter_mp"] = loadfx( "vfx/water/water_flow_rain_gutter_mp" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["fire_campfire_small"] = loadfx( "vfx/fire/dlc/fire_campfire_small" );
    level._id_058F["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._id_058F["water_drips_med"] = loadfx( "vfx/rain/water_drips_med" );
    level._id_058F["water_sweeping_cgoshp_sml"] = loadfx( "vfx/water/water_sweeping_cgoshp_sml" );
    level._id_058F["water_sweeping_cgoshp"] = loadfx( "vfx/water/water_sweeping_cgoshp" );
    level._id_058F["water_noise_ud"] = loadfx( "fx/ambient_runners/mp_farm_water_noise_ud01" );
    level._id_058F["water_noise"] = loadfx( "fx/ambient_runners/mp_farm_water_noise01" );
    level._id_058F["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._id_058F["pip_ambient_particles"] = loadfx( "vfx/map/mp_pipeline/pip_ambient_particles" );
    level._id_058F["pip_hazy_sun_lensflare"] = loadfx( "vfx/map/mp_pipeline/pip_hazy_sun_lensflare" );
    level._id_058F["drips_med_edge_mp_carentan"] = loadfx( "vfx/map/mp_carentan/drips_med_edge_mp_carentan" );
    level._id_058F["00_particle_shadow_clouds"] = loadfx( "vfx/cloud/00_particle_shadow_clouds" );
    level._id_058F["insects_light_moths_complex"] = loadfx( "vfx/animal/dlc/insects_light_moths_complex" );
    level._id_058F["leaves_windblown_slw_constant"] = loadfx( "vfx/wind/leaves_windblown_slw_constant" );
    level._id_058F["fog_daytime"] = loadfx( "fx/weather/fog_daytime" );
    level._id_058F["leaves_blowing_slow"] = loadfx( "vfx/wind/dlc/leaves_blowing_slow" );
    level._id_058F["insects_flies_wall"] = loadfx( "vfx/animal/insects_flies_wall" );
    level._id_058F["sewage_flies_flying_bog"] = loadfx( "vfx/map/mp_clowntown/sewage_flies_flying_bog" );
    level._id_058F["insects_dragonfly_runner_a"] = loadfx( "vfx/animal/insects_dragonfly_runner_a" );
    level._id_058F["smoke_chimney_breeze_small"] = loadfx( "vfx/smoke/smoke_chimney_breeze_small" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._id_058F["barrel_fire_nolight_mp"] = loadfx( "vfx/fire/barrel_fire_nolight_mp" );
    level._id_058F["fireplace_fire_mp"] = loadfx( "vfx/fire/fireplace_fire_mp" );
    level._id_058F["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._id_058F["fire_wreckage_ground_mp"] = loadfx( "vfx/fire/fire_wreckage_ground_mp" );
    level._id_058F["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._id_058F["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._id_058F["mp_overgrown_insects01"] = loadfx( "fx/ambient_runners/mp_overgrown_insects01" );
    level._id_058F["mp_overgrown_insects02"] = loadfx( "fx/ambient_runners/mp_overgrown_insects02" );
    level._id_058F["mp_overgrown_insects03"] = loadfx( "fx/ambient_runners/mp_overgrown_insects03" );
    level._id_058F["mp_overgrown_insects04"] = loadfx( "fx/ambient_runners/mp_overgrown_insects04" );
    level._id_058F["mp_overgrown_insects05"] = loadfx( "fx/ambient_runners/mp_overgrown_insects05" );
    level._id_058F["mp_overgrown_fog_daytime01"] = loadfx( "fx/ambient_runners/mp_overgrown_fog_daytime01" );
    level._id_058F["mp_overgrown_leavesfall01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesfall01" );
    level._id_058F["mp_overgrown_leavesground01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesground01" );
}
