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
    _id_A632::main( "vehicle_av8b_harrier_jet", undefined, "script_vehicle_av8b_harrier_jet" );
    vehicle_scripts\_bmp::main( "vehicle_bmp_woodland_low", undefined, "script_vehicle_bmp_woodland_low" );
    vehicle_scripts\_seaknight::main( "vehicle_ch46e", undefined, "script_vehicle_ch46e" );
    vehicle_scripts\_seaknight_airlift::main( "vehicle_ch46e_opened_door_interior_mk19", undefined, "script_vehicle_ch46e_airlift" );
    vehicle_scripts\_cobra::main( "vehicle_cobra_helicopter_fly_low", undefined, "script_vehicle_cobra_helicopter_fly_low" );
    vehicle_scripts\_cobra::main( "vehicle_cobra_helicopter_low", undefined, "script_vehicle_cobra_helicopter_low" );
    vehicle_scripts\_m1a1::main( "vehicle_m1a1_abrams", undefined, "script_vehicle_m1a1_abrams" );
    _id_A62F::main( "vehicle_mi17_woodland_fly_cheap", undefined, "script_vehicle_mi17_woodland_fly_cheap" );
    vehicle_scripts\_t72::main( "vehicle_t72_tank_low", undefined, "script_vehicle_t72_tank_low" );
    vehicle_scripts\_zpu_antiair::main( "vehicle_zpu4_nowheels", undefined, "script_vehicle_zpu4_nowheels" );
}
