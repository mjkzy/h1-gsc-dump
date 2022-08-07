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

onwifi( var_0, var_1 )
{
    if ( isdefined( self._id_6490 ) )
        self [[ self._id_6490 ]]( var_0, var_1 );
}

onlygoodnearestnodes()
{
    self notify( "killanimscript" );
}

_id_6A2B( var_0, var_1, var_2, var_3 )
{
    _id_6A2A( var_0, 0, var_1, var_2, var_3 );
}

_id_6A2A( var_0, var_1, var_2, var_3, var_4 )
{
    self setanimstate( var_0, var_1 );

    if ( !isdefined( var_3 ) )
        var_3 = "end";

    _id_A100( var_2, var_3, var_0, var_1, var_4 );
}

_id_6A28( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self setanimstate( var_0, var_1, var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = "end";

    _id_A100( var_3, var_4, var_0, var_1, var_5 );
}

_id_A100( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = gettime();
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_7 = getanimlength( self getanimentry( var_2, var_3 ) );

    for (;;)
    {
        self waittill( var_0, var_8 );

        if ( isdefined( var_7 ) )
            var_6 = ( gettime() - var_5 ) * 0.001 / var_7;

        if ( !isdefined( var_7 ) || var_6 > 0 )
        {
            if ( var_8 == var_1 || var_8 == "end" || var_8 == "anim_will_finish" || var_8 == "finish" )
                break;
        }

        if ( isdefined( var_4 ) )
            [[ var_4 ]]( var_8, var_2, var_3, var_6 );
    }
}

_id_6A26( var_0, var_1 )
{
    _id_6A29( var_0, 0, var_1 );
}

_id_6A29( var_0, var_1, var_2 )
{
    self setanimstate( var_0, var_1 );
    wait(var_2);
}

_id_6A27( var_0, var_1, var_2, var_3 )
{
    self setanimstate( var_0, var_1, var_2 );
    wait(var_3);
}

_id_3EFD( var_0, var_1, var_2 )
{
    var_3 = length2d( var_0 );
    var_4 = var_0[2];
    var_5 = length2d( var_1 );
    var_6 = var_1[2];
    var_7 = 1;
    var_8 = 1;

    if ( isdefined( var_2 ) && var_2 )
    {
        var_9 = ( var_1[0], var_1[1], 0 );
        var_10 = vectornormalize( var_9 );

        if ( vectordot( var_10, var_0 ) < 0 )
            var_7 = 0;
        else if ( var_5 > 0 )
            var_7 = var_3 / var_5;
    }
    else if ( var_5 > 0 )
        var_7 = var_3 / var_5;

    if ( abs( var_6 ) > 0.001 && var_6 * var_4 >= 0 )
        var_8 = var_4 / var_6;

    var_11 = spawnstruct();
    var_11._id_A3B1 = var_7;
    var_11._id_053B = var_8;
    return var_11;
}

_id_3EF1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 10;

    if ( var_0 < 0 )
        return int( ceil( ( 180 + var_0 - var_1 ) / 45 ) );
    else
        return int( floor( ( 180 + var_0 + var_1 ) / 45 ) );
}

_id_2F8F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 18;

    var_2 = var_0 + ( 0, 0, var_1 );
    var_3 = var_0 + ( 0, 0, var_1 * -1 );
    var_4 = self aiphysicstrace( var_2, var_3, self.rank, self.hidewhendead, 1 );

    if ( abs( var_4[2] - var_2[2] ) < 0.1 )
        return undefined;

    if ( abs( var_4[2] - var_3[2] ) < 0.1 )
        return undefined;

    return var_4;
}

_id_1AD2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 6;

    if ( !isdefined( var_3 ) )
        var_3 = self.rank;

    var_4 = ( 0.0, 0.0, 1.0 ) * var_2;
    var_5 = var_0 + var_4;
    var_6 = var_1 + var_4;
    return self _meth_83e4( var_5, var_6, var_3, self.hidewhendead - var_2, 1 );
}

_id_414C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 6;

    var_3 = ( 0.0, 0.0, 1.0 ) * var_2;
    var_4 = var_0 + var_3;
    var_5 = var_1 + var_3;
    return self aiphysicstrace( var_4, var_5, self.rank + 4, self.hidewhendead - var_2, 1 );
}

_id_40C0( var_0 )
{
    var_1 = getmovedelta( var_0 );
    var_2 = self localtoworldcoords( var_1 );
    var_3 = _id_414C( self.origin, var_2 );
    var_4 = distance( self.origin, var_3 );
    var_5 = distance( self.origin, var_2 );
    return min( 1.0, var_4 / var_5 );
}

_id_77CA( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_40A3( var_0 );
    _id_77C9( var_0, var_4, var_1, var_2, var_3 );
}

_id_77C7( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_40A3( var_0 );
    _id_77C8( var_0, var_5, var_1, var_2, var_3, var_4 );
}

_id_77C8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self setanimstate( var_0, var_1, var_2 );
    _id_77C9( var_0, var_1, var_3, var_4, var_5 );
}

_id_77C9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self getanimentry( var_0, var_1 );
    var_6 = _id_40C0( var_5 );
    self scragentsetanimscale( var_6, 1.0 );
    _id_6A2A( var_0, var_1, var_2, var_3, var_4 );
    self scragentsetanimscale( 1.0, 1.0 );
}

_id_40A3( var_0 )
{
    var_1 = self getanimentrycount( var_0 );
    return randomint( var_1 );
}

_id_3EF2( var_0 )
{
    var_1 = vectortoangles( var_0 );
    var_2 = angleclamp180( var_1[1] - self.angles[1] );
    return _id_3EF1( var_2 );
}
