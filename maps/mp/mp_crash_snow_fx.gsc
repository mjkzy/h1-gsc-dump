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
    level._id_058F["mp_crash_snow_flare_bulb"] = loadfx( "vfx/map/mp_crash_snow/mp_crash_snow_flare_bulb" );
    level._id_058F["mp_crash_snow_flare_anamorphic_wide"] = loadfx( "vfx/map/mp_crash_snow/mp_crash_snow_flare_anamorphic_wide" );
    level._id_058F["mp_crash_snow_flare_anamorphic"] = loadfx( "vfx/map/mp_crash_snow/mp_crash_snow_flare_anamorphic" );
    level._id_058F["ground_snow_low_mp"] = loadfx( "vfx/snow/ground_snow_low_mp" );
    level._id_058F["fx_flare_anamorphic_night"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_night" );
    level._id_058F["sleigh_rudolph_nose"] = loadfx( "vfx/map/mp_crash_snow/sleigh_rudolph_nose" );
    level._id_058F["mp_crash_snow_fall_particles"] = loadfx( "vfx/map/mp_crash_snow/mp_crash_snow_fall_particles" );
    level._id_058F["sleigh_glow_trail"] = loadfx( "vfx/map/mp_crash_snow/sleigh_glow_trail" );
    level._id_058F["sleigh_sparkle_trail"] = loadfx( "vfx/map/mp_crash_snow/sleigh_sparkle_trail" );
    level._id_058F["mp_snow_wind_gust_runner"] = loadfx( "vfx/map/mp_crash_snow/mp_snow_wind_gust_runner" );
    level._id_058F["falling_snow_lrg_runner"] = loadfx( "vfx/snow/falling_snow_lrg_runner" );
    level._id_058F["snow_blowoff_ledge_runner"] = loadfx( "fx/snow/snow_blowoff_ledge_runner" );
    level._id_058F["falling_snow_runner"] = loadfx( "vfx/snow/falling_snow_runner" );
    level._id_058F["snow_fall_particles"] = loadfx( "vfx/snow/snow_fall_particles" );
    level._id_058F["snow_wind"] = loadfx( "vfx/map/mp_crash_snow/snow_wind" );
    level._id_058F["mp_xmas_crash_snow_wind_spiral_runner"] = loadfx( "vfx/map/mp_crash_snow/mp_xmas_crash_snow_wind_spiral_runner" );
    level._id_058F["roof_blowing_snow_runner"] = loadfx( "vfx/map/mp_crash_snow/roof_blowing_snow_runner" );
    level._id_058F["snow_blown_off_rocks_lp"] = loadfx( "vfx/snow/snow_blown_off_rocks_lp" );
    level._id_058F["snow_cloud_moutain_peak"] = loadfx( "vfx/wind/snow_cloud_moutain_peak" );
    level._id_058F["snow_blowing_door_lp"] = loadfx( "vfx/snow/snow_blowing_door_lp" );
    level._id_058F["vertical_light_wind_snow_runner"] = loadfx( "vfx/snow/vertical_light_wind_snow_runner" );
    level._id_058F["snow_tornado_s_runner"] = loadfx( "vfx/snow/snow_tornado_s_runner" );
    level._id_058F["snow_drift"] = loadfx( "vfx/test/snow_drift" );
    level._id_058F["snow_blowing_window_lp"] = loadfx( "vfx/snow/snow_blowing_window_lp" );
    level._id_058F["fire_wreckage_ground"] = loadfx( "vfx/map/crash/fire_wreckage_ground" );
    level._id_058F["small_spark_runner"] = loadfx( "vfx/map/crash/small_spark_runner" );
    level._id_058F["drips_slow"] = loadfx( "vfx/rain/drips_slow" );
    level._id_058F["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._id_058F["fire_campfire_small"] = loadfx( "vfx/fire/dlc/fire_campfire_small" );
    level._id_058F["snow_light_mp_bloc"] = loadfx( "fx/weather/snow_light_mp_bloc" );
    level._id_058F["deathfx_xmas_snow"] = loadfx( "vfx/map/mp_crash_snow/deathfx_xmas_snow" );
    level._id_099B = loadfx( "fx/explosions/clusterbomb_christmas" );
    level._id_058F["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm_nodistort" );
    level._id_058F["dust_wind_fast"] = loadfx( "fx/weather/snow_wind" );
    level._id_058F["dust_wind_slow"] = loadfx( "fx/weather/snow_wind" );
    level._id_058F["dust_wind_spiral"] = loadfx( "fx/weather/snow_wind_spiral_runner" );
    level._id_058F["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._id_058F["snow_light"] = loadfx( "fx/weather/snow_light_mp_crash" );
}
