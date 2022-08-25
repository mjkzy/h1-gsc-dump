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

_id_2D62()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2B06 ) )
        return;

    for (;;)
    {
        var_0 = self _meth_81A4();

        if ( isdefined( var_0 ) )
            break;

        wait 0.2;
    }

    var_1 = var_0.type == "Door Interior" || self _meth_81A5( var_0 );

    if ( var_1 )
        _id_2D5F( var_0 );
    else
        _id_2D63( var_0 );

    for (;;)
    {
        var_2 = self _meth_81A4();

        if ( !isdefined( var_2 ) || var_2 != var_0 )
            break;

        wait 0.2;
    }

    thread _id_2D62();
}

_id_91F0()
{
    self endon( "killanimscript" );
    self._id_91F1 = 1;
    wait 5;
    self._id_91F1 = undefined;
}
#using_animtree("generic_human");

_id_2C31( var_0 )
{
    thread _id_91F0();

    if ( self.grenadeweapon == "flash_grenade" )
        self notify( "flashbang_thrown" );

    self _meth_8193( "face current" );
    var_0._id_60C9 = gettime() + 5000;
    self._id_5C7A = gettime() + 100000;
    self notify( "move_interrupt" );
    self._id_9AC9 = undefined;
    self _meth_8144( %combatrun, 0.2 );
    self.a._id_5F5B = "stop";
    self waittill( "done_grenade_throw" );
    self _meth_8193( "face default" );
    self._id_5C7A = gettime() + 5000;
    self.grenadeweapon = self._id_63D1;
    self._id_63D1 = undefined;
    animscripts\run::_id_315D();
    thread animscripts\move::_id_66D9();
    thread animscripts\move::_id_7490( 1 );
}

_id_2D61( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 3;
    var_7 = undefined;
    var_7 = %cqb_stand_grenade_throw;
    var_8 = anglestoforward( var_0.angles );

    if ( var_0.type == "Door Interior" && !self _meth_81A5( var_0 ) )
        var_8 = -1 * var_8;

    var_9 = ( var_0.origin[0], var_0.origin[1], var_0.origin[2] + 64 );
    var_10 = var_9;

    if ( var_2 )
    {
        var_11 = anglestoright( var_0.angles );
        var_12 = var_0.origin - self.origin;
        var_13 = vectordot( var_11, var_12 );

        if ( var_13 > 20 )
            var_13 = 20;
        else if ( var_13 < -20 )
            var_13 = -20;

        var_10 = var_9 + var_13 * var_11;
    }

    while ( var_6 > 0 )
    {
        if ( isdefined( self.grenade ) || !isdefined( self.enemy ) )
            return;

        if ( _id_64E5( var_0, var_8 ) )
            return;

        if ( !self _meth_81C3( self.enemy, 0.2 ) && self.a._id_6E5A == "stand" && _id_2B7A( self.enemy.origin - var_0.origin, 360000, 16384 ) )
        {
            if ( isdefined( var_0._id_60C9 ) && var_0._id_60C9 > gettime() )
                return;

            if ( self _meth_81C1() )
                return;

            var_12 = var_0.origin - self.origin;

            if ( lengthsquared( var_12 ) < var_3 )
                return;

            if ( vectordot( var_12, var_8 ) < 0 )
                return;

            self._id_63D1 = self.grenadeweapon;
            self.grenadeweapon = var_1;
            animscripts\combat_utility::_id_7F15( self.enemy );

            if ( !var_5 )
            {
                var_14 = var_9 + var_8 * 100;

                if ( !animscripts\combat_utility::isgrenadepossafe( self.enemy, var_14, 128 ) )
                    return;
            }

            var_5 = 1;

            if ( animscripts\combat_utility::_id_989F( self.enemy, var_10, var_7, animscripts\combat_utility::_id_3FB1( var_7 ), 1, 0, 1 ) )
            {
                _id_2C31( var_0 );
                return;
            }
        }

        var_6--;
        wait(var_4);
        var_15 = self _meth_81A4();

        if ( !isdefined( var_15 ) || var_15 != var_0 )
            return;
    }
}

_id_4C46()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2B06 ) )
        return;

    self._id_5126 = 0;

    for (;;)
    {
        if ( self isindoor() && !self.doingambush )
            _id_2D60();
        else if ( !isdefined( self._id_5C7A ) || self._id_5C7A < gettime() )
        {
            self._id_5C7A = undefined;
            _id_2D64();
        }

        wait 0.2;
    }
}

_id_2D60()
{
    if ( !isdefined( self._id_6094 ) && !self.doingambush )
    {
        self._id_5126 = 1;

        if ( !isdefined( self._id_22E0 ) || !self._id_22E0 )
            maps\_utility::_id_30B0( 1 );
    }
}

_id_2D64()
{
    if ( !isdefined( self._id_22DD ) )
    {
        self._id_5126 = 0;

        if ( isdefined( self._id_22E0 ) && self._id_22E0 )
            maps\_utility::_id_2A8D();
    }
}

_id_2B7A( var_0, var_1, var_2 )
{
    return var_0[0] * var_0[0] + var_0[1] * var_0[1] < var_1 && var_0[2] * var_0[2] < var_2;
}

_id_64E5( var_0, var_1 )
{
    var_2 = var_0.origin - self.origin;
    var_3 = var_0.origin - self.enemy.origin;
    return vectordot( var_2, var_1 ) * vectordot( var_3, var_1 ) > 0;
}

_id_2D5F( var_0 )
{
    for (;;)
    {
        if ( isdefined( self._id_2D66 ) && ( self._id_2D66 == 0 || self._id_2D66 < randomfloat( 1 ) ) )
            break;

        if ( _id_2B7A( self.origin - var_0.origin, 562500, 25600 ) )
        {
            _id_2D61( var_0, "fraggrenade", 0, 302500, 0.3 );
            var_0 = self _meth_81A4();

            if ( !isdefined( var_0 ) )
                return;

            break;
        }

        wait 0.1;
    }

    for (;;)
    {
        if ( _id_2B7A( self.origin - var_0.origin, 36864, 6400 ) )
        {
            _id_2D60();
            self._id_5C7A = gettime() + 6000;

            if ( isdefined( self._id_2D65 ) && ( self._id_2D65 == 0 || self._id_2D65 < randomfloat( 1 ) ) )
                return;

            _id_2D61( var_0, "flash_grenade", 1, 4096, 0.2 );
            return;
        }

        wait 0.1;
    }
}

_id_2D63( var_0 )
{
    for (;;)
    {
        if ( !self._id_5126 || distancesquared( self.origin, var_0.origin ) < 1024 )
            return;

        wait 0.1;
    }
}
