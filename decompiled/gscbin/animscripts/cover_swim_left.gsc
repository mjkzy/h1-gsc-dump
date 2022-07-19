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
    self._id_0C50 = [];
    self._id_0C50["hiding"]["stand"] = ::_id_7F24;
    self._id_0C50["hiding"]["crouch"] = ::_id_7F24;
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_swim_left" );

    if ( !isdefined( self._id_0CBC ) || self._id_0CBC != "cover_corner_l" )
        self._id_0CBC = "cover_corner_l";

    var_0 = anim._id_0CCA["soldier"]["swim"]["arrival_cover_corner_l_angleDelta"][4][4];
    animscripts\corner::_id_2222( "left", var_0[1] );
}

end_script()
{
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::end_script( "left" );
}

_id_7F24()
{
    self.a._id_0CD8 = animscripts\swim::_id_4100( "cover_corner_l" );
    var_0 = anim._id_0CCA["soldier"]["swim"]["arrival_cover_corner_l_angleDelta"][4][4];
    self._id_4884 = var_0[1];
}
