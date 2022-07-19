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
    common_scripts\utility::_id_0755( "vehicle_bus_destructible", destructible_scripts\vehicle_bus_destructible::main );
    common_scripts\utility::_id_0755( "vehicle_uaz_fabric", destructible_scripts\vehicle_uaz_fabric::main );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_bed_under_destructible", undefined, "script_vehicle_bm21_bed_under_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_cover_under_destructible", undefined, "script_vehicle_bm21_cover_under_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_mobile_bed", undefined, "script_vehicle_bm21_mobile_bed" );
    vehicle_scripts\_bmp::main( "vehicle_bmp_woodland", undefined, "script_vehicle_bmp_woodland" );
    vehicle_scripts\_hind::main( "vehicle_mi24p_hind_woodland", undefined, "script_vehicle_mi24p_hind_woodland" );
    vehicle_scripts\_uaz::main( "vehicle_uaz_light_destructible", undefined, "script_vehicle_uaz_light_destructible" );
}
