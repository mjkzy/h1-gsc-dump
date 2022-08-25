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
    if ( self.type == "dog" )
        _id_861F();
    else
        _id_8620();
}
#using_animtree("generic_human");

_id_8620()
{
    var_0 = [];
    var_0["traverseAnim"] = %slide_across_car;
    var_0["traverseToCoverAnim"] = %slide_across_car_2_cover;
    var_0["coverType"] = "Cover Crouch";
    var_0["traverseHeight"] = 38.0;
    var_0["interruptDeathAnim"][0] = animscripts\utility::array( %slide_across_car_death );
    var_0["traverseSound"] = "npc_car_slide_hood";
    var_0["traverseToCoverSound"] = "npc_car_slide_cover";
    animscripts\traverse\shared::_id_2D86( var_0 );
}
#using_animtree("dog");

_id_861F()
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    var_0 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8144( %animscript_root, 0.1 );
    self setflaggedanimrestart( "traverse", anim._id_2CE0["jump_up_40"], 1, 0.1, 1 );
    animscripts\shared::_id_2D06( "traverse" );
    thread common_scripts\utility::_id_69C2( "anml_dog_bark", self gettagorigin( "tag_eye" ) );
    self _meth_8144( %animscript_root, 0 );
    self setflaggedanimrestart( "traverse", anim._id_2CE0["jump_down_40"], 1, 0, 1 );
    animscripts\shared::_id_2D06( "traverse" );
    self _meth_8191( "gravity" );
}
