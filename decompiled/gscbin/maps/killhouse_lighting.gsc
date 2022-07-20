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
    level.cheat_invert_override = "_bright";
    common_scripts\utility::_id_383D( "in_firerange_lighting_zone1" );
    common_scripts\utility::_id_383D( "in_firerange_lighting_zone2" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneTower" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneHangarFloor" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipTopDeck" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipInterior1" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipInterior2" );
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_7F00( "killhouse_interior", 0.0 );
    maps\_utility::_id_9E6E( "killhouse_interior", 0 );
    level.playercardbackground maps\_utility::set_light_set_player( "killhouse_interior" );
    level.playercardbackground _meth_848c( "clut_killhouse", 0.0 );
    setsaveddvar( "fx_cast_shadow", 0 );
}
