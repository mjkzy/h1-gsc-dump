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
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    level.cheat_highcontrast_override = "_night";
    enableouterspacemodellighting( ( 10000.0, 10000.0, 10000.0 ), ( 0.001, 0.001, 0.001 ) );
    thread _id_8106();
    thread maps\_lighting::_id_694A( "firelight_motion_dim_01", "firelight_dim_01" );
    thread maps\_lighting::_id_694A( "firelight_motion_dim_02", "firelight_dim_02" );
    thread maps\_lighting::_id_694A( "firelight_motion_medium_01", "firelight_medium_01" );
    thread maps\_lighting::_id_694A( "firelight_motion_medium_02", "firelight_medium_02" );
    thread maps\_lighting::_id_694A( "firelight_motion_bright_01", "firelight_bright_01" );
    thread maps\_lighting::_id_694A( "firelight_motion_bright_02", "firelight_bright_02" );
    thread maps\_lighting::_id_694A( "firelight_motion_verybright_01", "firelight_verybright_01" );
    thread maps\_lighting::_id_694A( "firelight_motion_ridonculous_01", "firelight_ridonculous_01" );
    level.nightvisionlightset = "nightvision_bog_a";
    _func_144( "bog_a_nightvision" );
    setsaveddvar( "sm_cacheSunShadowEnabled", 0 );
    setsaveddvar( "r_useSunShadowPortals", 1 );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    setsaveddvar( "sm_minSpotLightScore", "0.0001" );
    maps\_utility::_id_9E6E( "bog_a", 0 );
    level.player maps\_utility::set_light_set_player( "bog_a" );
    level.player _meth_848c( "clut_bog_a", 0.0 );
}

_id_8106()
{
    maps\_lighting::_id_23B3( "firelight_motion_dim_01", ( 0.86, 0.5, 0.15 ), 10, 12, 0.15, 0.75 );
    maps\_lighting::_id_23B3( "firelight_motion_dim_02", ( 0.86, 0.5, 0.15 ), 13, 12, 0.15, 0.75 );
    maps\_lighting::_id_23B3( "firelight_motion_medium_01", ( 0.86, 0.5, 0.15 ), 35, 12, 0.15, 0.75 );
    maps\_lighting::_id_23B3( "firelight_motion_medium_02", ( 0.86, 0.5, 0.15 ), 35, 12, 0.15, 0.75 );
    maps\_lighting::_id_23B3( "firelight_motion_bright_01", ( 0.86, 0.5, 0.15 ), 80, 20, 0.2, 1.0 );
    maps\_lighting::_id_23B3( "firelight_motion_bright_02", ( 0.86, 0.5, 0.15 ), 80, 20, 0.2, 1.0 );
    maps\_lighting::_id_23B3( "firelight_motion_verybright_01", ( 0.86, 0.5, 0.15 ), 200, 30, 0.6, 1.5 );
    maps\_lighting::_id_23B3( "firelight_motion_ridonculous_01", ( 0.86, 0.5, 0.15 ), 4000, 40, 1, 2.5 );
}
