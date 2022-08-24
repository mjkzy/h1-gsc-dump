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

_id_9512()
{
    self endon( "killanimscript" );
    self endon( "stop tracking" );
    self endon( "melee" );
    _id_9502( %aim_2, %aim_4, %aim_6, %aim_8 );
}

_id_9502( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 0;
    var_7 = ( 0.0, 0.0, 0.0 );
    var_8 = 1;
    var_9 = 0;
    var_10 = 0;
    var_11 = 10;
    var_12 = ( 0.0, 0.0, 0.0 );
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    var_16 = 0;
    var_17 = 0.1;
    var_18 = 0;

    if ( self.type == "dog" )
    {
        var_19 = 0;
        self._id_83F6 = self.enemy;
    }
    else
    {
        var_19 = 1;
        var_20 = 0;
        var_21 = 0;

        if ( isdefined( self._id_22A0 ) )
            var_20 = anim._id_22A1;

        var_22 = self.script;

        if ( var_22 == "cover_multi" )
        {
            if ( self.cover._id_8D56 == "right" )
                var_22 = "cover_right";
            else if ( self.cover._id_8D56 == "left" )
                var_22 = "cover_left";
        }

        if ( ( var_22 == "cover_left" || var_22 == "cover_right" ) && isdefined( self.a._id_2227 ) && self.a._id_2227 == "lean" )
            var_21 = self._id_22BA.angles[1] - self.angles[1];

        var_12 = ( var_20, var_21, 0 );
    }

    for (;;)
    {
        _id_4C30();

        if ( self _meth_843e( "tag_flash" ) == -1 )
        {
            wait 0.05;
            continue;
        }

        var_23 = animscripts\shared::_id_40C8();
        var_24 = self._id_840F;

        if ( isdefined( self._id_83F6 ) )
        {
            if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
                var_24 = animscripts\combat_utility::_id_3DB2( self._id_83F6 );
            else
                var_24 = self._id_83F6 getshootatpos();
        }
        else if ( isdefined( var_24 ) && isdefined( self.forceaimtorwardsenemy ) && isdefined( self.enemy ) )
            var_24 = self.enemy getshootatpos();

        if ( !isdefined( var_24 ) && animscripts\utility::_id_848B() )
            var_24 = _id_9505( var_23 );

        var_25 = isdefined( self._id_64E7 ) || isdefined( self._id_6450 );
        var_26 = isdefined( var_24 );
        var_27 = ( 0.0, 0.0, 0.0 );

        if ( var_26 )
            var_27 = var_24;

        var_28 = 0;
        var_29 = isdefined( self._id_8E2A );

        if ( var_29 )
            var_28 = self._id_8E2A;

        var_7 = self _meth_81bf( var_23, var_27, var_26, var_12, var_28, var_29, var_25 );
        var_30 = var_7[0];
        var_31 = var_7[1];
        var_7 = undefined;
        var_32 = undefined;

        if ( self.a._id_6E5A == "prone" )
        {
            var_32 = self.proneaimlimits;
            var_30 = clamp( var_30, var_32.downaimlimit, var_32.upaimlimit );
            var_31 = clamp( var_31, var_32.leftaimlimit, var_32.rightaimlimit );
        }
        else
        {
            var_32 = spawnstruct();
            var_32.rightaimlimit = self.rightaimlimit;
            var_32.leftaimlimit = self.leftaimlimit;
            var_32.upaimlimit = self.upaimlimit;
            var_32.downaimlimit = self.downaimlimit;
        }

        if ( animscripts\utility::_id_51B0() )
        {
            var_33 = self.angles[2] * -1;
            var_34 = var_30 * cos( var_33 ) - var_31 * sin( var_33 );
            var_35 = var_30 * sin( var_33 ) + var_31 * cos( var_33 );
            var_30 = var_34;
            var_31 = var_35;
            var_30 = clamp( var_30, var_32.downaimlimit, var_32.upaimlimit );
            var_31 = clamp( var_31, var_32.leftaimlimit, var_32.rightaimlimit );
        }

        if ( var_10 > 0 )
        {
            var_10 -= 1;
            var_11 = max( 10, var_11 - 5 );
        }
        else if ( self.relativedir && self.relativedir != var_9 )
        {
            var_10 = 2;
            var_11 = 30;
        }
        else
            var_11 = 10;

        var_36 = squared( var_11 );
        var_9 = self.relativedir;
        var_37 = self.movemode != "stop" || !var_8;

        if ( var_37 )
        {
            var_38 = var_31 - var_5;

            if ( squared( var_38 ) > var_36 )
            {
                var_31 = var_5 + clamp( var_38, -1 * var_11, var_11 );
                var_31 = clamp( var_31, var_32.leftaimlimit, var_32.rightaimlimit );
            }

            var_39 = var_30 - var_6;

            if ( squared( var_39 ) > var_36 )
            {
                var_30 = var_6 + clamp( var_39, -1 * var_11, var_11 );
                var_30 = clamp( var_30, var_32.downaimlimit, var_32.upaimlimit );
            }
        }

        var_8 = 0;
        var_5 = var_31;
        var_6 = var_30;
        _id_9507( var_0, var_1, var_2, var_3, var_4, var_30, var_31, var_32 );
        wait 0.05;
    }
}

_id_9505( var_0 )
{
    var_1 = undefined;
    var_2 = anglestoforward( self.angles );

    if ( isdefined( self._id_22D8 ) )
    {
        if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
            var_1 = animscripts\combat_utility::_id_3DB2( self._id_22D8 );
        else
            var_1 = self._id_22D8 getshootatpos();

        if ( isdefined( self._id_22DC ) )
        {
            if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.177 )
                var_1 = undefined;
        }
        else if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.643 )
            var_1 = undefined;
    }

    if ( !isdefined( var_1 ) && isdefined( self._id_22D6 ) )
    {
        var_1 = self._id_22D6;

        if ( isdefined( self._id_22DB ) )
        {
            if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.177 )
                var_1 = undefined;
        }
        else if ( vectordot( vectornormalize( var_1 - var_0 ), var_2 ) < 0.643 )
            var_1 = undefined;
    }

    return var_1;
}

_id_9503( var_0, var_1 )
{
    if ( animscripts\utility::_id_7262() )
    {
        var_2 = self.enemy getshootatpos() - self.enemy.origin;
        var_3 = self _meth_81c5( self.enemy ) + var_2;
        return _id_9506( var_3 - var_0, var_1 );
    }

    var_4 = 0;
    var_5 = 0;

    if ( isdefined( self.node ) && isdefined( anim._id_50E4[self.node.type] ) && distancesquared( self.origin, self.node.origin ) < 16 )
        var_5 = angleclamp180( self.angles[1] - self.node.angles[1] );
    else
    {
        var_6 = self _meth_8196();

        if ( isdefined( var_6 ) )
        {
            var_5 = angleclamp180( self.angles[1] - var_6[1] );
            var_4 = angleclamp180( 360 - var_6[0] );
        }
    }

    return ( var_4, var_5, 0 );
}

_id_9506( var_0, var_1 )
{
    var_2 = vectortoangles( var_0 );
    var_3 = 0;
    var_4 = 0;

    if ( self.stairsstate == "up" )
    {
        if ( !isdefined( self._id_5A7A ) || isdefined( self._id_5A7A ) && !self._id_5A7A )
            var_3 = -40;
    }
    else if ( self.stairsstate == "down" )
    {
        if ( !isdefined( self._id_5A7A ) || isdefined( self._id_5A7A ) && !self._id_5A7A )
        {
            var_3 = 40;
            var_4 = 12;
        }
    }

    var_5 = 360 - var_2[0];
    var_5 = angleclamp180( var_5 + var_1[0] + var_3 );

    if ( isdefined( self._id_8E2A ) )
        var_6 = self._id_8E2A - var_2[1];
    else
    {
        var_7 = angleclamp180( self.desiredangle - self.angles[1] ) * 0.5;
        var_6 = var_7 + self.angles[1] - var_2[1];
    }

    var_6 = angleclamp180( var_6 + var_1[1] + var_4 );
    return ( var_5, var_6, 0 );
}

_id_9504( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_64E7 ) || isdefined( self._id_6450 ) )
    {
        if ( var_1 > self.rightaimlimit || var_1 < self.leftaimlimit )
            var_1 = 0;

        if ( var_0 > self.upaimlimit || var_0 < self.downaimlimit )
            var_0 = 0;
    }
    else if ( var_2 && ( abs( var_1 ) > anim._id_5A26 || abs( var_0 ) > anim._id_5A25 ) )
    {
        var_1 = 0;
        var_0 = 0;
    }
    else
    {
        if ( self.gunblockedbywall )
            var_1 = clamp( var_1, -10, 10 );
        else
            var_1 = clamp( var_1, self.leftaimlimit, self.rightaimlimit );

        var_0 = clamp( var_0, self.downaimlimit, self.upaimlimit );
    }

    return ( var_0, var_1, 0 );
}

_id_9507( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = 0.1;

    if ( isdefined( self._id_0974 ) )
        var_13 = self._id_0974;

    if ( var_6 > 0 )
    {
        var_11 = clamp( var_6 / self.animaimlimit.rightaimlimit * self.a._id_097E, 0, 1 );
        var_10 = 1;
    }
    else if ( var_6 < 0 )
    {
        var_9 = clamp( var_6 / self.animaimlimit.leftaimlimit * self.a._id_097E, 0, 1 );
        var_10 = 1;
    }

    if ( var_5 > 0 )
    {
        var_12 = var_5 / var_7.upaimlimit * self.a._id_097E;
        var_10 = 1;
    }
    else if ( var_5 < 0 )
    {
        var_8 = var_5 / var_7.downaimlimit * self.a._id_097E;
        var_10 = 1;
    }

    self _meth_814e( var_0, var_8, var_13, 1, 1 );
    self _meth_814e( var_1, var_9, var_13, 1, 1 );
    self _meth_814e( var_2, var_11, var_13, 1, 1 );
    self _meth_814e( var_3, var_12, var_13, 1, 1 );

    if ( isdefined( var_4 ) )
        self _meth_814e( var_4, var_10, var_13, 1, 1 );
}

_id_7F21( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 <= 0 )
    {
        self.a._id_097E = var_0;
        self.a._id_0980 = var_0;
        self.a._id_097F = var_0;
        self.a._id_0982 = 0;
    }
    else
    {
        if ( !isdefined( self.a._id_097E ) )
            self.a._id_097E = 0;

        self.a._id_0980 = self.a._id_097E;
        self.a._id_097F = var_0;
        self.a._id_0982 = int( var_1 * 20 );
    }

    self.a._id_0981 = 0;
}

_id_4C30()
{
    if ( self.a._id_0981 < self.a._id_0982 )
    {
        self.a._id_0981++;
        var_0 = 1.0 * self.a._id_0981 / self.a._id_0982;
        self.a._id_097E = self.a._id_0980 * ( 1 - var_0 ) + self.a._id_097F * var_0;
    }
}
