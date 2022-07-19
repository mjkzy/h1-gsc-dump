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
    self endon( "death" );
    self notify( "killanimscript" );
    self._id_2001["root"] = %root;
    self endon( "end_sequence" );
    self _meth_8241( self._id_2001["notifyName"], self._id_2001["origin"], self._id_2001["angles"], self._id_2001["anim"], self._id_2001["animMode"], self._id_2001["root"] );
    self._id_2001 = undefined;

    if ( isdefined( self._id_2670 ) )
        self._id_266F = self._id_2670;

    self waittill( "killanimscript" );
}

init( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self._id_2001["notifyName"] = var_0;
    self._id_2001["origin"] = var_1;
    self._id_2001["angles"] = var_2;
    self._id_2001["anim"] = var_3;

    if ( isdefined( var_4 ) )
        self._id_2001["animMode"] = var_4;
    else
        self._id_2001["animMode"] = "normal";

    if ( isdefined( var_5 ) )
        self._id_2001["root"] = var_5;
    else
        self._id_2001["root"] = %root;
}
