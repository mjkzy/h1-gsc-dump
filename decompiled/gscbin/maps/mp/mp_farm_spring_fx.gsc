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
    level._effect["light_spotlight_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/light_spotlight_mp_farm_spring" );
    level._effect["fx_flare_bulkhead_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/fx_flare_bulkhead_mp_farm_spring" );
    level._effect["mp_balloon_pop"] = loadfx( "fx/maps/mp_farm_spring/mp_balloon_pop" );
    level._effect["particulates_100_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/particulates_100_mp_farm_spring" );
    level._effect["rainbow_sprite_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/rainbow_sprite_mp_farm_spring" );
    level._effect["rainbow_flare_mp_farm_spring"] = loadfx( "vfx/map/mp_farm_spring/rainbow_flare_mp_farm_spring" );
    level._effect["vfx_water_drips"] = loadfx( "fx/maps/mp_downpour/vfx_water_drips" );
    level._effect["fx_flare_anamorphic_rain"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_rain" );
    level._effect["smoldering_smk_direction_s"] = loadfx( "vfx/smoke/smoldering_smk_direction_s" );
    level._effect["water_flow_rain_gutter_mp"] = loadfx( "vfx/water/water_flow_rain_gutter_mp" );
    level._effect["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._effect["fire_campfire_small"] = loadfx( "vfx/fire/dlc/fire_campfire_small" );
    level._effect["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._effect["water_drips_med"] = loadfx( "vfx/rain/water_drips_med" );
    level._effect["water_sweeping_cgoshp_sml"] = loadfx( "vfx/water/water_sweeping_cgoshp_sml" );
    level._effect["water_sweeping_cgoshp"] = loadfx( "vfx/water/water_sweeping_cgoshp" );
    level._effect["water_noise_ud"] = loadfx( "fx/ambient_runners/mp_farm_water_noise_ud01" );
    level._effect["water_noise"] = loadfx( "fx/ambient_runners/mp_farm_water_noise01" );
    level._effect["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._effect["pip_ambient_particles"] = loadfx( "vfx/map/mp_pipeline/pip_ambient_particles" );
    level._effect["pip_hazy_sun_lensflare"] = loadfx( "vfx/map/mp_pipeline/pip_hazy_sun_lensflare" );
    level._effect["drips_med_edge_mp_carentan"] = loadfx( "vfx/map/mp_carentan/drips_med_edge_mp_carentan" );
    level._effect["00_particle_shadow_clouds"] = loadfx( "vfx/cloud/00_particle_shadow_clouds" );
    level._effect["insects_light_moths_complex"] = loadfx( "vfx/animal/dlc/insects_light_moths_complex" );
    level._effect["leaves_windblown_slw_constant"] = loadfx( "vfx/wind/leaves_windblown_slw_constant" );
    level._effect["fog_daytime"] = loadfx( "fx/weather/fog_daytime" );
    level._effect["leaves_blowing_slow"] = loadfx( "vfx/wind/dlc/leaves_blowing_slow" );
    level._effect["insects_flies_wall"] = loadfx( "vfx/animal/insects_flies_wall" );
    level._effect["sewage_flies_flying_bog"] = loadfx( "vfx/map/mp_clowntown/sewage_flies_flying_bog" );
    level._effect["insects_dragonfly_runner_a"] = loadfx( "vfx/animal/insects_dragonfly_runner_a" );
    level._effect["smoke_chimney_breeze_small"] = loadfx( "vfx/smoke/smoke_chimney_breeze_small" );
    level._effect["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._effect["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._effect["barrel_fire_nolight_mp"] = loadfx( "vfx/fire/barrel_fire_nolight_mp" );
    level._effect["fireplace_fire_mp"] = loadfx( "vfx/fire/fireplace_fire_mp" );
    level._effect["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._effect["fire_wreckage_ground_mp"] = loadfx( "vfx/fire/fire_wreckage_ground_mp" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._effect["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._effect["mp_overgrown_insects01"] = loadfx( "fx/ambient_runners/mp_overgrown_insects01" );
    level._effect["mp_overgrown_insects02"] = loadfx( "fx/ambient_runners/mp_overgrown_insects02" );
    level._effect["mp_overgrown_insects03"] = loadfx( "fx/ambient_runners/mp_overgrown_insects03" );
    level._effect["mp_overgrown_insects04"] = loadfx( "fx/ambient_runners/mp_overgrown_insects04" );
    level._effect["mp_overgrown_insects05"] = loadfx( "fx/ambient_runners/mp_overgrown_insects05" );
    level._effect["mp_overgrown_fog_daytime01"] = loadfx( "fx/ambient_runners/mp_overgrown_fog_daytime01" );
    level._effect["mp_overgrown_leavesfall01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesfall01" );
    level._effect["mp_overgrown_leavesground01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesground01" );
}
