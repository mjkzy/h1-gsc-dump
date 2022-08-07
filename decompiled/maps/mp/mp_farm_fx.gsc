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
    level._effect["rain_splash_sm_5x5_no_dist_lp"] = loadfx( "vfx/rain/rain_splash_sm_5x5_no_dist_lp" );
    level._effect["rain_splash_sm_x20_no_dist_lp"] = loadfx( "vfx/rain/rain_splash_sm_x20_no_dist_lp" );
    level._effect["rain_splash_sm_20x20_no_dist_lp"] = loadfx( "vfx/rain/rain_splash_sm_20x20_no_dist_lp" );
    level._effect["vfx_water_drips"] = loadfx( "fx/maps/mp_downpour/vfx_water_drips" );
    level._effect["fx_flare_anamorphic_rain"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_rain" );
    level._effect["mpfarm_headlight"] = loadfx( "vfx/lights/mpfarm_headlight" );
    level._effect["smoldering_smk_direction_s"] = loadfx( "vfx/smoke/smoldering_smk_direction_s" );
    level._effect["water_flow_rain_gutter_mp"] = loadfx( "vfx/water/water_flow_rain_gutter_mp" );
    level._effect["water_roof_gutter_gush_fall"] = loadfx( "vfx/rain/water_roof_gutter_gush_fall" );
    level._effect["godray_ambient_rain_mp"] = loadfx( "vfx/lights/godray_ambient_rain_mp" );
    level._effect["fire_campfire_small"] = loadfx( "vfx/fire/dlc/fire_campfire_small" );
    level._effect["barrel_fire_mp"] = loadfx( "vfx/fire/barrel_fire_mp" );
    level._effect["water_drips_med"] = loadfx( "vfx/rain/water_drips_med" );
    level._effect["falling_water_heavydoor_cgoshp"] = loadfx( "vfx/water/falling_water_heavydoor_cgoshp" );
    level._effect["lightning_strike_runner"] = loadfx( "vfx/lightning/lightning_strike_runner" );
    level._effect["lightning_strike_01"] = loadfx( "vfx/lightning/lightning_strike_01" );
    level._effect["water_sweeping_cgoshp_sml"] = loadfx( "vfx/water/water_sweeping_cgoshp_sml" );
    level._effect["water_sweeping_cgoshp"] = loadfx( "vfx/water/water_sweeping_cgoshp" );
    level._effect["rain_splashes_mpfarm"] = loadfx( "fx/weather/rain_splashes_mpfarm" );
    level._effect["lightning_mp_farm"] = loadfx( "vfx/lightning/lightning_mp_farm" );
    level._effect["rain_heavy_mist_mpfarm"] = loadfx( "fx/weather/rain_heavy_mist_mpfarm" );
    level._effect["lightning"] = loadfx( "fx/weather/lightning_mp_farm" );
    level._effect["cgoshp_drips_a"] = loadfx( "fx/maps/mp_downpour/vfx_water_drips" );
    level._effect["rain_splash_mp_farm"] = loadfx( "fx/ambient_runners/mp_farm_rain_splash01" );
    level._effect["water_noise_ud"] = loadfx( "fx/ambient_runners/mp_farm_water_noise_ud01" );
    level._effect["water_noise"] = loadfx( "fx/ambient_runners/mp_farm_water_noise01" );
    level._effect["screen_rain_mp"] = loadfx( "vfx/rain/screen_rain_mp" );
}
