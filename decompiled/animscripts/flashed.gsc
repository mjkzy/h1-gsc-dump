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
#using_animtree("generic_human");

_id_4C8B()
{
    var_0 = [];
    var_0["flashed"] = [ %exposed_flashbang_v2, %exposed_flashbang_v4 ];
    var_0["flashed"] = common_scripts\utility::_id_0CF5( var_0["flashed"] );
    anim._id_0CCA["soldier"]["flashed"] = var_0;
    anim._id_38A4["soldier"] = 0;
}

_id_403A()
{
    var_0 = "soldier";

    if ( isdefined( self._id_0C4D ) && isdefined( anim._id_38A4[self._id_0C4D] ) )
        var_0 = self._id_0C4D;

    anim._id_38A4[var_0]++;

    if ( anim._id_38A4[var_0] >= anim._id_0CCA[var_0]["flashed"]["flashed"].size )
    {
        anim._id_38A4[var_0] = 0;
        anim._id_0CCA[var_0]["flashed"]["flashed"] = common_scripts\utility::_id_0CF5( anim._id_0CCA[var_0]["flashed"]["flashed"] );
    }

    return anim._id_0CCA[var_0]["flashed"]["flashed"][anim._id_38A4[var_0]];
}

_id_38A5( var_0 )
{
    self endon( "killanimscript" );
    self setflaggedanimknoball( "flashed_anim", var_0, %body, 0.2, randomfloatrange( 0.9, 1.1 ) );
    animscripts\shared::_id_2D06( "flashed_anim" );
}

main()
{
    self endon( "death" );
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "flashed" );
    var_0 = maps\_utility::_id_38A7();

    if ( var_0 <= 0 )
        return;

    animscripts\face::_id_7824( "flashbang" );

    if ( isdefined( self._id_8A2D ) )
    {
        self [[ self._id_8A2D ]]();
        return;
    }

    var_1 = _id_403A();
    _id_38A6( var_1, var_0 );
}

_id_38A6( var_0, var_1 )
{
    self endon( "death" );
    self endon( "killanimscript" );

    if ( self.a._id_6E5A == "prone" )
        animscripts\utility::_id_344B( 1 );

    self.a._id_6E5A = "stand";
    self.allowdeath = 1;
    thread _id_38A5( var_0 );
    wait(var_1);
    self notify( "stop_flashbang_effect" );
    self._id_38AF = 0;
}
