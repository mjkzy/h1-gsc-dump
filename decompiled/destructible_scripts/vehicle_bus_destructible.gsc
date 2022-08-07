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
    common_scripts\_destructible::_id_2906( "vehicle_bus_destructible", "tag_body", 250, undefined, 32, "no_melee" );
    var_0 = "tag_window_front_left";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_front_right";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_driver";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_back";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_1";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_2";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_3";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_4";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_5";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_6";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_7";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_8";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_9";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_10";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_0 = "tag_window_side_11";
    common_scripts\_destructible::_id_2924( var_0, undefined, 99, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_0 + "_d", undefined, 200, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( var_0, "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
}
