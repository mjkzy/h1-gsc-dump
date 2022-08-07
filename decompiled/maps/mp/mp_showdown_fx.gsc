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
    level._effect["battlefield_smokebank_s"] = loadfx( "fx/smoke/battlefield_smokebank_s" );
    level._effect["waterfountain_borders_showdown"] = loadfx( "vfx/water/waterfountain_borders_showdown" );
    level._effect["light_godray_dawn_mp_showdown"] = loadfx( "vfx/lights/light_godray_dawn_mp_showdown" );
    level._effect["fx_sunflare_mp_showdown"] = loadfx( "vfx/lensflare/fx_sunflare_mp_showdown" );
    level._effect["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._effect["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._effect["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm_nodistort" );
    level._effect["firelp_small_pm"] = loadfx( "fx/fire/firelp_small_pm" );
    level._effect["firelp_small_pm_a"] = loadfx( "fx/fire/firelp_small_pm_a" );
    level._effect["dust_wind_fast"] = loadfx( "fx/dust/dust_wind_fast" );
    level._effect["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_yel_loop" );
    level._effect["dust_wind_spiral"] = loadfx( "fx/dust/dust_spiral_runner" );
    level._effect["hawk"] = loadfx( "fx/weather/hawk" );
    level._effect["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._effect["dust_ambient_street_showdown"] = loadfx( "vfx/fog/dust_ambient_street_showdown" );
    level._effect["dust_ambient_street_blowing_bklot"] = loadfx( "vfx/dust/dust_ambient_street_blowing_showdown_mp" );
    level._effect["dust_ambient_interior"] = loadfx( "vfx/fog/dust_ambient_interior" );
    level._effect["trash_ambient_blowing"] = loadfx( "vfx/map/mp_lost/mp_trash_blowing_runner" );
    level._effect["blowing_sand_runner"] = loadfx( "vfx/sand/blowing_sand_runner" );
    level._effect["dust_ambient_blowing"] = loadfx( "vfx/dust/dust_ambient_street_blowing_bog_mp" );
    level._effect["dust_ceilling_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner_showdown" );
    level._effect["trash_dust_tornado"] = loadfx( "vfx/wind/trash_dust_tornado_s_runner" );
    level._effect["dust_ambient_interior_showdown"] = loadfx( "vfx/fog/dust_ambient_interior_showdown" );
    level._effect["insects_flies_garbage_mp_bog"] = loadfx( "vfx/animal/insects_flies_garbage_mp_bog" );
    level._effect["bird_seagull_flock_large"] = loadfx( "fx/misc/bird_seagull_flock_large" );
    level._effect["firelp_med_pm_bog_mp"] = loadfx( "fx/fire/firelp_med_pm_bog_mp" );
    level._effect["firelp_med_pm_w_tail_bog_mp"] = loadfx( "fx/fire/firelp_med_pm_w_tail_bog_mp" );
    level._effect["dust_falling_bog_mp"] = loadfx( "fx/misc/dust_falling_bog_mp" );
    level._effect["waterfountain_caustics_mp_showdown"] = loadfx( "vfx/water/waterfountain_caustics_mp_showdown" );
    level._effect["waterfountain_stream_leak_showdown"] = loadfx( "vfx/water/waterfountain_stream_leak_showdown" );
    level._effect["waterfountain_caustics_corner_mp_showdown"] = loadfx( "vfx/water/waterfountain_caustics_corner_mp_showdown" );
    level._effect["waterfountain_stream_leak_sml_showdown"] = loadfx( "vfx/water/waterfountain_stream_leak_sml_showdown" );
    level._effect["waterfountain_stream_leak_showdown_slow"] = loadfx( "vfx/water/waterfountain_stream_leak_showdown_slow" );
    level._effect["drips_slow_mp_showdown"] = loadfx( "fx/misc/drips_slow_mp_showdown" );
    level._effect["paper_sheet_burnt_blowing_mp_showdown"] = loadfx( "vfx/wind/paper_sheet_burnt_blowing_mp_showdown" );
    level._effect["sand_tornado_mp_showdown"] = loadfx( "vfx/sand/sand_tornado_mp_showdown" );
    level._effect["light_shaft_dust_med_mp_showdown"] = loadfx( "fx/dust/light_shaft_dust_med_mp_showdown" );
    level._effect["roach_flock_mp_showdown"] = loadfx( "vfx/animal/roach_flock_mp_showdown" );
}
