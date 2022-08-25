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

main()
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "grenadecower" );

    if ( isdefined( self._id_43FC ) )
    {
        self [[ self._id_43FC ]]();
        return;
    }

    if ( self.a._id_6E5A == "prone" )
    {
        animscripts\stop::main();
        return;
    }

    self _meth_8192( "zonly_physics" );
    self _meth_8193( "face angle", self.angles[1] );
    var_0 = 0;

    if ( isdefined( self.grenade ) )
        var_0 = angleclamp180( vectortoangles( self.grenade.origin - self.origin )[1] - self.angles[1] );
    else
        var_0 = self.angles[1];

    if ( self.a._id_6E5A == "stand" )
    {
        if ( isdefined( self.grenade ) && _id_9898( var_0 ) )
            return;

        self setflaggedanimknoballrestart( "cowerstart", animscripts\utility::_id_5863( "grenade", "cower_squat" ), %body, 1, 0.2 );
        self._id_2564 = ::squatouttransition;
        animscripts\shared::_id_2D06( "cowerstart" );
    }

    self.a._id_6E5A = "crouch";
    self.a._id_5F5B = "stop";
    self setflaggedanimknoballrestart( "cower", animscripts\utility::_id_5863( "grenade", "cower_squat_idle" ), %body, 1, 0.2 );
    animscripts\shared::_id_2D06( "cower" );
    self waittill( "never" );
}

squatouttransition()
{
    self _meth_8193( "face angle", self.angles[1] );
    self.nododgemove = 1;
    self setflaggedanimknoballrestart( "cowerend", animscripts\utility::_id_5863( "grenade", "cower_squat_up" ), %body, 1, 0.4 );
    animscripts\shared::_id_2D06( "cowerend" );
    self._id_2564 = undefined;
    self.a._id_5F5B = "stop";
    self.nododgemove = 0;
    animscripts\exit_node::_id_8D2E();
}

end_script()
{
    self.safetochangescript = 1;
}

_id_9898( var_0 )
{
    if ( randomint( 2 ) == 0 )
        return 0;

    if ( self.stairsstate != "none" )
        return 0;

    var_1 = undefined;

    if ( abs( var_0 ) > 90 )
        var_1 = animscripts\utility::_id_5863( "grenade", "cower_dive_back" );
    else
        var_1 = animscripts\utility::_id_5863( "grenade", "cower_dive_front" );

    var_2 = getmovedelta( var_1, 0, 0.5 );
    var_3 = self localtoworldcoords( var_2 );

    if ( !self _meth_81C7( var_3 ) )
        return 0;

    self.safetochangescript = 0;
    self setflaggedanimknoballrestart( "cowerstart", var_1, %body, 1, 0.2 );
    animscripts\shared::_id_2D06( "cowerstart" );
    self.safetochangescript = 1;
    return 1;
}
