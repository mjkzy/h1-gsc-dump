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
    level._effect["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._effect["trash_dust_tornado_s_runner"] = loadfx( "vfx/wind/trash_dust_tornado_s_runner" );
    level._effect["dust_falling_debris_runner"] = loadfx( "vfx/dust/dlc/dust_falling_debris_runner" );
    level._effect["rocks_water_splash_bog_sumr"] = loadfx( "vfx/map/mp_bog_summer/rocks_water_splash_bog_sumr" );
    level._effect["bird_seagull_flying_runner_bog_sumr"] = loadfx( "vfx/map/mp_bog_summer/bird_seagull_flying_runner_bog_sumr" );
    level._effect["spark_idle_carentan"] = loadfx( "vfx/sparks/spark_idle_carentan" );
    level._effect["clouds_moving_fast_mp_carentan"] = loadfx( "vfx/map/mp_carentan/clouds_moving_fast_mp_carentan" );
    level._effect["mp_dust_blowing_runner"] = loadfx( "vfx/map/mp_clowntown/mp_dust_blowing_runner" );
    level._effect["blowing_sand_runner_bog_sumr"] = loadfx( "vfx/map/mp_bog_summer/blowing_sand_runner_bog_sumr" );
    level._effect["hazy_sun_lensflare_bog_sumr"] = loadfx( "vfx/map/mp_bog_summer/hazy_sun_lensflare_bog_sumr" );
    level._effect["blowing_sand_runner"] = loadfx( "vfx/sand/blowing_sand_runner" );
}
