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
    common_scripts\utility::_id_0755( "vehicle_80s_hatch1_red", destructible_scripts\vehicle_80s_hatch1_red::main );
    common_scripts\utility::_id_0755( "vehicle_80s_sedan1_brn", destructible_scripts\vehicle_80s_sedan1_brn::main );
    common_scripts\utility::_id_0755( "vehicle_80s_sedan1_red", destructible_scripts\vehicle_80s_sedan1_red::main );
    common_scripts\utility::_id_0755( "vehicle_80s_sedan1_silv", destructible_scripts\vehicle_80s_sedan1_silv::main );
    common_scripts\utility::_id_0755( "vehicle_80s_wagon1_brn", destructible_scripts\vehicle_80s_wagon1_brn::main );
    common_scripts\utility::_id_0755( "vehicle_80s_wagon1_red", destructible_scripts\vehicle_80s_wagon1_red::main );
    common_scripts\utility::_id_0755( "vehicle_80s_wagon1_silv", destructible_scripts\vehicle_80s_wagon1_silv::main );
    common_scripts\utility::_id_0755( "vehicle_small_hatch_blue", destructible_scripts\vehicle_small_hatch_blue::main );
    vehicle_scripts\_mig29::main( "vehicle_av8b_harrier_jet", undefined, "script_vehicle_av8b_harrier_jet" );
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk", undefined, "script_vehicle_blackhawk" );
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk_hero_sas_night", undefined, "script_vehicle_blackhawk_hero_sas_night" );
    vehicle_scripts\_m1a1::main( "vehicle_m1a1_abrams", undefined, "script_vehicle_m1a1_abrams" );
    vehicle_scripts\_technical::main( "vehicle_pickup_technical", undefined, "script_vehicle_pickup_technical" );
}
