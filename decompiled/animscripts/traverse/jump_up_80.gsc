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
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    var_0 = self getnegotiationstartnode();
    self _meth_8193( "face angle", var_0.angles[1] );
    var_1 = var_0._id_972A - var_0.origin[2];
    thread animscripts\traverse\shared::_id_925E( var_1 - 80 );
    self _meth_8144( %animscript_root, 0.2 );
    self setflaggedanimrestart( "jump_up_80", anim._id_2CE0["jump_up_80"], 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "jump_up_80" );
}
