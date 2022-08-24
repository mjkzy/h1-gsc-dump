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
    thread handle_rappel_down_vent();
    level.nightvisionlightset = "launchfacility_a_nightvision";
    _func_144( "launchfacility_a_nightvision" );
}

_id_4D05()
{
    common_scripts\utility::_id_383D( "rappel_down_vent_started" );
}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_9E6E( "launchfacility_a", 5 );
    level.player maps\_utility::set_light_set_player( "launchfacility_a" );
    level.player _meth_848c( "clut_launchfacility_a", 0.0 );
    setsaveddvar( "r_specularcolorscale", "1.2" );
}

handle_rappel_down_vent()
{
    common_scripts\utility::_id_384A( "rappel_down_vent_started" );
    maps\_utility::_id_7F00( "launchfacility_a_rappel", 15 );
}
