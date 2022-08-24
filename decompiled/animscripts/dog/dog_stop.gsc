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
    self _meth_8144( %root, 0.1 );
    self _meth_8144( %german_shepherd_idle, 0.2 );
    self _meth_8144( %german_shepherd_attackidle_knob, 0.2 );
    thread _id_585C( "attackIdle" );

    for (;;)
    {
        if ( _id_8483() )
        {
            self _meth_8144( %german_shepherd_idle, 0.2 );
            randomattackidle();
        }
        else
        {
            self _meth_8193( "face current" );
            self _meth_8144( %german_shepherd_attackidle_knob, 0.2 );
            self setflaggedanimrestart( "dog_idle", %german_shepherd_idle, 1, 0.2, self._id_0C78 );
        }

        animscripts\shared::_id_2D06( "dog_idle" );

        if ( isdefined( self._id_6F7A ) )
        {
            self.turnrate = self._id_6F7A;
            self._id_6F7A = undefined;
        }
    }
}

isfacingenemy( var_0 )
{
    var_1 = self.enemy.origin - self.origin;
    var_2 = length( var_1 );

    if ( var_2 < 1 )
        return 1;

    var_3 = anglestoforward( self.angles );
    return ( var_3[0] * var_1[0] + var_3[1] * var_1[1] ) / var_2 > var_0;
}

randomattackidle()
{
    self _meth_8144( %german_shepherd_attackidle_knob, 0.1 );

    if ( isfacingenemy( 0.866 ) )
        self _meth_8193( "face angle", self.angles[1] );
    else
    {
        if ( isdefined( self.enemy ) )
        {
            var_0 = vectortoyaw( self.enemy.origin - self.origin );
            var_1 = angleclamp180( var_0 - self.angles[1] );

            if ( abs( var_1 ) > 10 )
            {
                self _meth_8193( "face enemy" );
                self._id_6F7A = self.turnrate;
                self.turnrate = 0.3;

                if ( var_1 > 0 )
                    var_2 = %german_shepherd_rotate_ccw;
                else
                    var_2 = %german_shepherd_rotate_cw;

                self setflaggedanimrestart( "dog_turn", var_2, 1, 0.2, 1.0 );
                animscripts\shared::_id_2D06( "dog_turn" );
                self.turnrate = self._id_6F7A;
                self._id_6F7A = undefined;
                self _meth_8144( %german_shepherd_rotate_cw, 0.2 );
                self _meth_8144( %german_shepherd_rotate_ccw, 0.2 );
            }
        }

        self _meth_8193( "face angle", self.angles[1] );
    }

    if ( _id_846C() )
        self setflaggedanimrestart( "dog_idle", %german_shepherd_attackidle_growl, 1, 0.2, 1 );
    else
    {
        var_3 = 33;
        var_4 = 66;

        if ( isdefined( self._id_5D35 ) )
        {
            if ( self._id_5D35 == "growl" )
            {
                var_3 = 15;
                var_4 = 30;
            }
            else if ( self._id_5D35 == "bark" )
            {
                var_3 = 15;
                var_4 = 85;
            }
        }

        var_5 = randomint( 100 );

        if ( var_5 < var_3 )
            self setflaggedanimrestart( "dog_idle", %german_shepherd_attackidle_b, 1, 0.2, self._id_0C78 );
        else
        {
            if ( var_5 < var_4 )
            {
                self setflaggedanimrestart( "dog_idle", %german_shepherd_attackidle_bark, 1, 0.2, self._id_0C78 );
                return;
            }

            self setflaggedanimrestart( "dog_idle", %german_shepherd_attackidle_growl, 1, 0.2, self._id_0C78 );
        }
    }
}

_id_8483()
{
    return isdefined( self.enemy ) && isalive( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) < 1000000;
}

_id_846C()
{
    if ( isdefined( self._id_7A0B ) )
        return 1;

    if ( !isalive( self.enemy ) )
        return 1;

    return !self _meth_81c2( self.enemy );
}

_id_585C( var_0 )
{
    self endon( "killanimscript" );
    self endon( "stop tracking" );
    self _meth_8144( %german_shepherd_look_2, 0 );
    self _meth_8144( %german_shepherd_look_4, 0 );
    self _meth_8144( %german_shepherd_look_6, 0 );
    self _meth_8144( %german_shepherd_look_8, 0 );
    self _meth_8177();
    self.rightaimlimit = 90;
    self.leftaimlimit = -90;
    self _meth_814e( anim._id_2CD2[var_0][2], 1, 0 );
    self _meth_814e( anim._id_2CD2[var_0][4], 1, 0 );
    self _meth_814e( anim._id_2CD2[var_0][6], 1, 0 );
    self _meth_814e( anim._id_2CD2[var_0][8], 1, 0 );
    animscripts\track::_id_7F21( 1, 0.2 );
    animscripts\track::_id_9502( %german_shepherd_look_2, %german_shepherd_look_4, %german_shepherd_look_6, %german_shepherd_look_8 );
}
