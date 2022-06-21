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
    level._id_058F["paper_falling"] = loadfx( "fx/misc/paper_falling" );
    level._id_058F["amb_dust_unlit_dayonly"] = loadfx( "vfx/dust/amb_dust_unlit_dayonly" );
    level._id_058F["dust_falling_ceiling_light_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._id_058F["dust_runner_01"] = loadfx( "vfx/dust/dust_runner_01" );
    level._id_058F["blowing_sand_runner"] = loadfx( "vfx/sand/blowing_sand_runner" );
    level._id_058F["street_sand_loop"] = loadfx( "vfx/map/betrayal/street_sand_loop" );
    level._id_058F["dust_ambient_interior"] = loadfx( "vfx/map/greece/dust_ambient_interior" );
    level._id_058F["godray_window_small_mp"] = loadfx( "vfx/map/mp_dam/godray_window_small_mp" );
    level._id_058F["electrical_spark_loop"] = loadfx( "vfx/sparks/electrical_spark_loop" );
    level._id_058F["sewage_flies_flying_bog"] = loadfx( "vfx/map/mp_clowntown/sewage_flies_flying_bog" );
    level._id_058F["dust_ambient_street_recovery"] = loadfx( "vfx/map/mp_recovery/dust_ambient_street_recovery" );
    level._id_058F["dust_blowing_vista"] = loadfx( "vfx/dust/dust_blowing_vista" );
    level._id_058F["dust_ambient_street_blowing_runner"] = loadfx( "vfx/map/greece/dust_ambient_street_blowing_runner" );
    level._id_058F["trash_dust_tornado_s_runner"] = loadfx( "vfx/wind/trash_dust_tornado_s_runner" );
    level._id_058F["mp_trash_blowing_runner"] = loadfx( "vfx/map/mp_lost/mp_trash_blowing_runner" );
    level._id_058F["mp_trash_blowing_02"] = loadfx( "vfx/map/mp_lost/mp_trash_blowing_02" );
    level._id_058F["vehicle_fire_ext_small"] = loadfx( "vfx/fire/vehicle_fire_ext_small" );
    level._id_058F["fx_flare_anamorphic_va"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_va" );
    level._id_058F["fire_wreckage_ground_mp"] = loadfx( "vfx/fire/fire_wreckage_ground_mp" );
    level._id_058F["fx_sunflare_perplex"] = loadfx( "vfx/lensflare/fx_sunflare_perplex" );
    level._id_058F["hawk"] = loadfx( "fx/weather/hawk" );
    level._id_058F["bird_seagull_flock_large"] = loadfx( "fx/misc/bird_seagull_flock_large" );
}
