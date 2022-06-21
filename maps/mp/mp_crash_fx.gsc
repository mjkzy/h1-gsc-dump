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
    level._id_058F["smoldering_smk_thin_black"] = loadfx( "vfx/smoke/smoldering_smk_thin_black" );
    level._id_058F["paper_falling"] = loadfx( "fx/misc/paper_falling" );
    level._id_058F["amb_dust_unlit_dayonly"] = loadfx( "vfx/dust/amb_dust_unlit_dayonly" );
    level._id_058F["smoldering_smk_ground_bog_b"] = loadfx( "vfx/smoke/smoldering_smk_ground_bog_b" );
    level._id_058F["vehicle_damaged_sparks_interior_small"] = loadfx( "vfx/sparks/vehicle_damaged_sparks_interior_small" );
    level._id_058F["dust_blowing_runner_mp"] = loadfx( "vfx/dust/dust_blowing_runner_mp" );
    level._id_058F["trash_tornado_s_runner"] = loadfx( "vfx/wind/trash_tornado_s_runner" );
    level._id_058F["godray_ambient_small_mp"] = loadfx( "vfx/lights/godray_ambient_small_mp" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._id_058F["drips_slow"] = loadfx( "fx/misc/drips_slow" );
    level._id_058F["med_smoke_plume"] = loadfx( "fx/smoke/med_smoke_plume" );
    level._id_058F["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._id_058F["insects_fruitflies_flying"] = loadfx( "vfx/animal/insects_fruitflies_flying" );
    level._id_058F["small_spark_runner"] = loadfx( "vfx/map/crash/small_spark_runner" );
    level._id_058F["fire_wreckage_medium"] = loadfx( "vfx/map/crash/fire_wreckage_medium" );
    level._id_058F["smoke_vista_01"] = loadfx( "vfx/smoke/dlc/smoke_vista_01" );
    level._id_058F["fire_wreckage_ground"] = loadfx( "vfx/map/crash/fire_wreckage_ground" );
    level._id_058F["dust_ceiling_agu"] = loadfx( "fx/dust/dust_ceiling_agu" );
    level._id_058F["dust_ambient_interior"] = loadfx( "vfx/map/greece/dust_ambient_interior" );
    level._id_058F["electrical_sparks_runner"] = loadfx( "vfx/explosion/electrical_sparks_runner" );
    level._id_058F["spark_bounce"] = loadfx( "vfx/explosion/spark_bounce" );
    level._id_058F["bg_smoke_plume_mp"] = loadfx( "fx/smoke/bg_smoke_plume_mp" );
    level._id_058F["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm_nodistort" );
    level._id_058F["firelp_small_pm"] = loadfx( "fx/fire/firelp_small_pm" );
    level._id_058F["firelp_small_pm_a"] = loadfx( "fx/fire/firelp_small_pm_a" );
    level._id_058F["dust_wind_fast"] = loadfx( "fx/dust/dust_wind_fast_paper" );
    level._id_058F["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_paper" );
    level._id_058F["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._id_058F["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
}
