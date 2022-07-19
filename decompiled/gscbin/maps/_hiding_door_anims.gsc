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
#using_animtree("script_model");

main()
{
    level._id_78B1["hiding_door"] = #animtree;
    level._id_78B5["hiding_door"] = "com_door_01_handleleft";
    level._id_78AC["hiding_door"]["close"] = %doorpeek_close_door;
    level._id_78AC["hiding_door"]["death_1"] = %doorpeek_deatha_door;
    level._id_78AC["hiding_door"]["death_2"] = %doorpeek_deathb_door;
    level._id_78AC["hiding_door"]["fire_1"] = %doorpeek_firea_door;
    level._id_78AC["hiding_door"]["fire_2"] = %doorpeek_fireb_door;
    level._id_78AC["hiding_door"]["fire_3"] = %doorpeek_firec_door;
    level._id_78AC["hiding_door"]["peek"] = %doorpeek_idle_door;
    level._id_78AC["hiding_door"]["grenade"] = %doorpeek_grenade_door;
    level._id_78AC["hiding_door"]["idle"][0] = %doorpeek_idle_door;
    level._id_78AC["hiding_door"]["jump"] = %doorpeek_jump_door;
    level._id_78AC["hiding_door"]["kick"] = %doorpeek_kick_door;
    level._id_78AC["hiding_door"]["open"] = %doorpeek_open_door;
    precachemodel( level._id_78B5["hiding_door"] );
    _id_A510::_id_0812( "hiding_door", "sound door death", "any", "scn_doorpeek_door_open_death" );
    _id_A510::_id_0812( "hiding_door", "sound door open", "any", "scn_doorpeek_door_open" );
    _id_A510::_id_0812( "hiding_door", "sound door slam", "any", "scn_doorpeek_door_slam" );
    main_guy();
    thread _id_61E5();
}
#using_animtree("generic_human");

main_guy()
{
    level._id_78AC["hiding_door_guy"]["close"] = %doorpeek_close;
    level._id_78AC["hiding_door_guy"]["death_1"] = %doorpeek_deatha;
    level._id_78AC["hiding_door_guy"]["death_2"] = %doorpeek_deathb;
    level._id_78AC["hiding_door_guy"]["fire_1"] = %doorpeek_firea;
    level._id_78AC["hiding_door_guy"]["fire_2"] = %doorpeek_fireb;
    level._id_78AC["hiding_door_guy"]["fire_3"] = %doorpeek_firec;
    level._id_78AC["hiding_door_guy"]["peek"] = %doorpeek_idle;
    level._id_78AC["hiding_door_guy"]["grenade"] = %doorpeek_grenade;
    level._id_78AC["hiding_door_guy"]["idle"][0] = %doorpeek_idle;
    level._id_78AC["hiding_door_guy"]["jump"] = %doorpeek_jump;
    level._id_78AC["hiding_door_guy"]["kick"] = %doorpeek_kick;
    level._id_78AC["hiding_door_guy"]["open"] = %doorpeek_open;
}

_id_61E5()
{
    wait 0.05;
    _id_A510::_id_0807( "hiding_door_guy", "grenade_throw", maps\_hiding_door::hiding_door_guy_grenade_throw );
}
