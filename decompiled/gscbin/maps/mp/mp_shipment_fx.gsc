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
    level._id_058F["ship_lgt_glow_square_red"] = loadfx( "vfx/map/mp_shipment/ship_lgt_glow_square_red" );
    level._id_058F["ship_beacon_light"] = loadfx( "vfx/map/mp_shipment/ship_beacon_light" );
    level._id_058F["ship_spotlight_beam"] = loadfx( "vfx/map/mp_shipment/ship_spotlight_beam" );
    level._id_058F["ship_hanging_light3"] = loadfx( "vfx/map/mp_shipment/ship_hanging_light3" );
    level._id_058F["ship_fluorescent_warm"] = loadfx( "vfx/map/mp_shipment/ship_fluorescent_warm" );
    level._id_058F["ship_lgt_glow_square"] = loadfx( "vfx/map/mp_shipment/ship_lgt_glow_square" );
    level._id_058F["ship_breaking_wave_01_cg"] = loadfx( "vfx/map/mp_shipment/ship_breaking_wave_01_cg" );
    level._id_058F["ship_water_wake_long"] = loadfx( "vfx/map/mp_shipment/ship_water_wake_long" );
    level._id_058F["ship_water_wake"] = loadfx( "vfx/map/mp_shipment/ship_water_wake" );
    level._id_058F["steam_chimney_breeze_small"] = loadfx( "vfx/steam/steam_chimney_breeze_small" );
    level._id_058F["fog_bank"] = loadfx( "vfx/fog/fog_bank" );
    level._id_058F["fog_distant_vista"] = loadfx( "vfx/fog/fog_distant_vista" );
    level._id_058F["fog_daytime"] = loadfx( "fx/weather/fog_daytime" );
    level._id_058F["bird_seagull_flock_large"] = loadfx( "fx/misc/bird_seagull_flock_large" );
    level._id_058F["cloud_bank_far"] = loadfx( "fx/weather/jeepride_cloud_bank_far" );
    level._id_058F["fog_bog_a"] = loadfx( "fx/weather/fog_bog_a" );
}
