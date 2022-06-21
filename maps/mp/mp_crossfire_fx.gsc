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
    level._id_058F["fire_wreckage_ground_mp"] = loadfx( "vfx/fire/fire_wreckage_ground_mp" );
    level._id_058F["vehicle_fire_ext_small"] = loadfx( "vfx/fire/vehicle_fire_ext_small" );
    level._id_058F["electrical_spark_loop"] = loadfx( "vfx/sparks/electrical_spark_loop" );
    level._id_058F["dust_falling_ceiling_light_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._id_058F["paper_scrap_windblown_runner_light"] = loadfx( "vfx/wind/paper_scrap_windblown_runner_light" );
    level._id_058F["smoldering_smk_ground_bog_b"] = loadfx( "vfx/smoke/smoldering_smk_ground_bog_b" );
    level._id_058F["smoke_vista_01"] = loadfx( "vfx/smoke/dlc/smoke_vista_01" );
    level._id_058F["trash_tornado_s_runner"] = loadfx( "vfx/wind/trash_tornado_s_runner" );
    level._id_058F["water_drips_bog_ripples"] = loadfx( "vfx/rain/water_drips_bog_ripples" );
    level._id_058F["00_particle_shadow_clouds"] = loadfx( "vfx/cloud/00_particle_shadow_clouds" );
    level._id_058F["smoldering_smk_direction_s"] = loadfx( "vfx/smoke/smoldering_smk_direction_s" );
    level._id_058F["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._id_058F["insects_carcass_flies"] = loadfx( "fx/misc/insects_carcass_flies" );
    level._id_058F["smk_low_linger_narrow_slow_nolit_win"] = loadfx( "vfx/smoke/dlc/smk_low_linger_narrow_slow_nolit_win" );
    level._id_058F["floating_room_dust_02"] = loadfx( "fx/misc/floating_room_dust_02" );
    level._id_058F["fx_flare_anamorphic_va"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_va" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._id_058F["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._id_058F["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._id_058F["paper_falling"] = loadfx( "fx/misc/paper_falling" );
    level._id_058F["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._id_058F["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M" );
    level._id_058F["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._id_058F["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_yel_loop" );
}
