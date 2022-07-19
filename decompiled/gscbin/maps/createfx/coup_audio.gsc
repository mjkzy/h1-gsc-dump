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
    thread _id_4CB2();
}

_id_4CB2()
{
    waitframe;
    _id_A510::_id_0805( "playerview", "intro", "throw_in_car", "scn_coup_throw_in_car" );
    _id_A510::_id_0805( "playerview", "intro", "hit", "scn_coup_rifle_butt" );
    _id_A510::_id_0805( "human", "intro_leftguard", "closing_door", "scn_coup_car_door_close" );
    _id_A510::_id_0805( "human", "intro_leftguard", "roof_tap", "scn_coup_roof_tap" );
    _id_A510::_id_0807( "human", "roof_tap", ::setmusic_p2_flag );
    _id_A510::_id_0805( "human", "carexit_leftguard", "door_open", "scn_coup_car_door_open" );
    _id_A510::_id_0805( "playerview", "carexit", "pulled_from_car", "scn_coup_pulled_from_car" );
    _id_A510::_id_0805( "playerview", "carexit", "kick", "scn_coup_curb_stomp" );
    _id_A510::_id_0807( "playerview", "kick", ::curb_stomp_mix, "carexit" );
    _id_A510::_id_0805( "playerview", "ending", "tied_to_post", "scn_coup_tied_to_post" );
    _id_A510::_id_0805( "human", "ending_alasad", "cock_gun", "assassination_hammer" );
    _id_A510::_id_0805( "dumpster", "dumpster_open", "lid_close", "scn_dumpster_lid_close" );
    _id_A510::_id_0805( "trashcan_rig", "trash_stumble", "sound_trashcan", "scn_trashcan_knock_over" );
}

setmusic_p2_flag( var_0 )
{
    common_scripts\utility::_id_383F( "music_part2" );
}

curb_stomp_mix( var_0 )
{
    thread maps\coup_aud::aud_curb_stomp_event();
}
