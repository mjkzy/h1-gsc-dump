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
    level._id_058F["fx_flare_anamorphic_night"] = loadfx( "vfx/lensflare/fx_flare_anamorphic_night" );
    level._id_058F["mp_bog_vista_explosion_runner"] = loadfx( "vfx/map/mp_bog/mp_bog_vista_explosion_runner" );
    level._id_058F["mp_bog_smoke_plumes_vista"] = loadfx( "fx/smoke/mp_bog_smoke_plumes_vista" );
    level._id_058F["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._id_058F["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._id_058F["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._id_058F["firelp_barrel_pm"] = loadfx( "fx/fire/firelp_small_pm_bog_mp" );
    level._id_058F["firelp_container_mp_bog"] = loadfx( "fx/fire/firelp_med_pm_bog_mp" );
    level._id_058F["barrel_fire_mp_bog"] = loadfx( "fx/fire/firelp_small_pm_bog_mp" );
    level._id_058F["oil_fire_mp_bog"] = loadfx( "fx/fire/firelp_med_pm_w_tail_bog_mp" );
    level._id_058F["antiair_runner"] = loadfx( "fx/misc/antiair_runner_cloudy_bog_a" );
    level._id_058F["mp_bog_horizon_flash"] = loadfx( "fx/weather/horizon_flash_runner_bog_a" );
    level._id_058F["streetlight_bog_a_fx"] = loadfx( "vfx/lights/light_cone_streetlight_bog_mp" );
    level._id_058F["electrical_spark"] = loadfx( "vfx/sparks/electrical_spark_loop_night" );
    level._id_058F["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_bog_mp" );
    level._id_058F["explosion_light"] = loadfx( "fx/explosions/explosion_light_runner_bog_a" );
    level._id_058F["thin_black_smoke_L_bog_a"] = loadfx( "fx/smoke/thin_black_smoke_l_bog_mp" );
    level._id_058F["hunted_fog_vista_night"] = loadfx( "vfx/fog/hunted_fog_vista_night" );
    level._id_058F["building_back_smoke_bog_a"] = loadfx( "fx/smoke/building_back_smoke_bog_a" );
    level._id_058F["fog_bog_a"] = loadfx( "fx/weather/fog_mp_bog" );
    level._id_058F["fog_vista_bog_mp"] = loadfx( "vfx/fog/fog_vista_night_bog_mp" );
    level._id_058F["insects_flies_garbage_mp_bog"] = loadfx( "vfx/animal/insects_flies_garbage_mp_bog" );
    level._id_058F["trash_dust_tornado"] = loadfx( "vfx/wind/trash_dust_tornado_s_runner" );
    level._id_058F["ash_falling_bog_a"] = loadfx( "fx/misc/ash_falling_bog_a" );
    level._id_058F["dust_falling_bog_mp"] = loadfx( "fx/misc/dust_falling_bog_mp" );
    level._id_058F["dust_ambient_street"] = loadfx( "vfx/map/mp_recovery/dust_ambient_street_bog_mp" );
    level._id_058F["dust_ambient_interior"] = loadfx( "vfx/map/greece/dust_ambient_interior" );
    level._id_058F["dust_ceilling_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._id_058F["blowing_sand_runner"] = loadfx( "vfx/sand/blowing_sand_runner" );
    level._id_058F["dust_ambient_blowing"] = loadfx( "vfx/dust/dust_ambient_street_blowing_bog_mp" );
    level._id_058F["trash_ambient_blowing"] = loadfx( "vfx/map/mp_lost/mp_trash_blowing_runner" );
    level._id_058F["fire_palm_large"] = loadfx( "vfx/fire/fire_palm_large_bog_mp" );
    level._id_058F["AA Explosions"] = loadfx( "fx/explosions/a10_explosion_bog_mp" );
}
