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

_id_6169( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE4 ) )
        return;

    if ( !isdefined( level._id_3AE4[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        call [[ level._id_3AE4[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_7C73( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE4[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    self call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3, var_4 );
}

vectorscale( var_0, var_1 )
{
    var_0 = ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
    return var_0;
}

_id_712D( var_0 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5 );
}

_id_712F( var_0, var_1 )
{
    var_2 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_2 *= -1;

    var_3 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_3 *= -1;

    var_4 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_4 *= -1;

    return ( var_2, var_3, var_4 );
}

_id_712E( var_0, var_1 )
{
    var_2 = randomfloat( var_1 );
    var_3 = randomfloat( 360 );
    var_4 = sin( var_2 );
    var_5 = cos( var_2 );
    var_6 = sin( var_3 );
    var_7 = cos( var_3 );
    var_8 = ( var_5, var_7 * var_4, var_6 * var_4 );
    return rotatevector( var_8, vectortoangles( var_0 ) );
}

vectorisnormalized( var_0 )
{
    return abs( lengthsquared( var_0 ) - 1 ) < 0.002;
}

_id_856D( var_0 )
{
    if ( var_0 >= 0 )
        return 1;

    return -1;
}

mod( var_0, var_1 )
{
    var_2 = int( var_0 / var_1 );

    if ( var_0 * var_1 < 0 )
        var_2 -= 1;

    return var_0 - var_2 * var_1;
}

_id_93F2( var_0 )
{
    return "" + var_0;
}

_id_949E( var_0 )
{
    if ( isdefined( self._id_24FD ) )
    {
        if ( var_0 == self._id_24FD )
            return;
    }

    self._id_24FD = var_0;
}

_id_3D4F( var_0 )
{
    var_1 = [];
    var_1["axis"] = "allies";
    var_1["allies"] = "axis";
    return var_1[var_0];
}

_id_1EB7( var_0 )
{
    self._id_33E5[var_0] = anim._id_2796;
}

_id_7E1C( var_0, var_1 )
{
    self._id_33E5[var_0] = var_1;
}

_id_7DB7( var_0 )
{
    var_1 = getarraykeys( self._id_33E5 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        self._id_33E5[var_1[var_2]] = var_0;
}

_id_2006()
{
    return randomint( 100 ) >= 50;
}

_id_1D3F( var_0, var_1 )
{
    var_2 = randomint( var_1[var_1.size - 1] + 1 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_2 <= var_1[var_3] )
            return var_0[var_3];
    }
}

_id_3D1E( var_0 )
{
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2 += var_0[var_3];
        var_1[var_3] = var_2;
    }

    return var_1;
}

waittillend( var_0 )
{
    self waittillmatch( var_0, "end" );
}

_id_A0B9( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A0BB( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    var_12 = [];
    var_12[0] = var_0;

    if ( isdefined( var_2 ) )
        var_12[1] = var_2;

    if ( isdefined( var_3 ) )
        var_12[2] = var_3;

    if ( isdefined( var_4 ) )
        var_12[3] = var_4;

    if ( isdefined( var_5 ) )
        var_12[4] = var_5;

    if ( isdefined( var_6 ) )
        var_12[5] = var_6;

    if ( isdefined( var_7 ) )
        var_12[6] = var_7;

    if ( isdefined( var_8 ) )
        var_12[7] = var_8;

    if ( isdefined( var_9 ) )
        var_12[8] = var_9;

    if ( isdefined( var_10 ) )
        var_12[9] = var_10;

    if ( isdefined( var_11 ) )
        var_12[10] = var_11;

    var_1 notify( "returned", var_12 );
}

_id_A0BA( var_0, var_1 )
{
    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A09A( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = spawnstruct();
    var_5._id_9316 = 0;

    if ( isdefined( var_0 ) )
    {
        childthread _id_A0B9( var_0, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_1 ) )
    {
        childthread _id_A0B9( var_1, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_2 ) )
    {
        childthread _id_A0B9( var_2, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_3 ) )
    {
        childthread _id_A0B9( var_3, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_4 ) )
    {
        childthread _id_A0B9( var_4, var_5 );
        var_5._id_9316++;
    }

    while ( var_5._id_9316 )
    {
        var_5 waittill( "returned" );
        var_5._id_9316--;
    }

    var_5 notify( "die" );
}

_id_A09B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    var_8 = spawnstruct();
    var_8._id_9316 = 0;

    if ( isdefined( var_0 ) )
    {
        var_0 childthread _id_A0B9( var_1, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_2 ) )
    {
        var_2 childthread _id_A0B9( var_3, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_4 ) )
    {
        var_4 childthread _id_A0B9( var_5, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_6 ) )
    {
        var_6 childthread _id_A0B9( var_7, var_8 );
        var_8._id_9316++;
    }

    while ( var_8._id_9316 )
    {
        var_8 waittill( "returned" );
        var_8._id_9316--;
    }

    var_8 notify( "die" );
}

_id_A070( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0B9( var_0, var_7 );

    if ( isdefined( var_1 ) )
        childthread _id_A0B9( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B9( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B9( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B9( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B9( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B9( var_6, var_7 );

    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_A072( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) && ( !isdefined( var_7 ) || var_7 != "death" ) )
        self endon( "death" );

    var_8 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0BB( var_0, var_8 );

    if ( isdefined( var_1 ) )
        childthread _id_A0BB( var_1, var_8 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BB( var_2, var_8 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BB( var_3, var_8 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BB( var_4, var_8 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BB( var_5, var_8 );

    if ( isdefined( var_6 ) )
        childthread _id_A0BB( var_6, var_8 );

    if ( isdefined( var_7 ) )
        childthread _id_A0BB( var_7, var_8 );

    var_8 waittill( "returned", var_9 );
    var_8 notify( "die" );
    return var_9;
}

_id_A071( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0BA( var_0, var_6 );

    if ( isdefined( var_1 ) )
        childthread _id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BA( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A06D( var_0 )
{
    var_1 = spawnstruct();
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        childthread _id_A0B9( var_4, var_1 );

        if ( var_4 == "death" )
            var_2 = 1;
    }

    if ( !var_2 )
        self endon( "death" );

    var_1 waittill( "returned", var_6 );
    var_1 notify( "die" );
    return var_6;
}

_id_A06E( var_0 )
{
    var_1 = spawnstruct();

    foreach ( var_3 in var_0 )
        childthread _id_A0BA( var_3, var_1 );

    var_1 waittill( "returned", var_5 );
    var_1 notify( "die" );
    return var_5;
}

_id_A06B( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        childthread _id_A0B9( var_5, var_2 );

        if ( var_5 == "death" )
            var_3 = 1;
    }

    if ( !var_3 )
        self endon( "death" );

    var_2 childthread _timeout( var_1 );
    var_2 waittill( "returned", var_7 );
    var_2 notify( "die" );
    return var_7;
}

_id_A06C( var_0, var_1 )
{
    var_2 = spawnstruct();

    foreach ( var_4 in var_0 )
        childthread _id_A0BA( var_4, var_2 );

    var_2 thread _timeout( var_1 );
    var_2 waittill( "returned", var_6 );
    var_2 notify( "die" );
    return var_6;
}

_id_A073( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0B9( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B9( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B9( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B9( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B9( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B9( var_6, var_7 );

    var_7 childthread _timeout( var_0 );
    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_timeout( var_0 )
{
    self endon( "die" );
    wait(var_0);
    self notify( "returned", "timeout" );
}

_id_A074( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BA( var_5, var_6 );

    var_6 childthread _timeout( var_0 );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A069( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    self waittill( var_0 );
}

_id_A06A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_2 endon( var_3 );

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
        var_4 endon( var_5 );

    if ( isdefined( var_6 ) && isdefined( var_7 ) )
        var_6 endon( var_7 );

    if ( isdefined( var_8 ) && isdefined( var_9 ) )
        var_8 endon( var_9 );

    if ( isdefined( var_10 ) && isdefined( var_11 ) )
        var_10 endon( var_11 );

    if ( isdefined( var_12 ) && isdefined( var_13 ) )
        var_12 endon( var_13 );

    var_0 waittill( var_1 );
}

_id_5108()
{
    var_0 = gettime();

    if ( isdefined( self._id_38B1 ) && var_0 < self._id_38B1 )
        return 1;

    if ( isdefined( self._id_20DF ) && var_0 < self._id_20DF )
        return 1;

    return 0;
}

_id_3839( var_0 )
{
    return isdefined( level._id_382E[var_0] );
}

_id_382E( var_0 )
{
    return level._id_382E[var_0];
}

_id_386B( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !_id_382E( var_2 ) )
            return 0;
    }

    return 1;
}

_id_4CF0()
{
    level._id_382E = [];
    level._id_386C = [];
    level._id_3C9D = 0;

    if ( !isdefined( level._id_88B2 ) )
        level._id_88B2 = ::_id_3093;

    level._id_3846 = spawnstruct();
    level._id_3846 assign_unique_id();
}

_id_383D( var_0 )
{
    if ( !isdefined( level._id_382E ) )
        _id_4CF0();

    level._id_382E[var_0] = 0;

    if ( !isdefined( level._id_9794 ) )
    {
        _id_4D6D();
        level._id_9794[var_0] = [];
    }
    else if ( !isdefined( level._id_9794[var_0] ) )
        level._id_9794[var_0] = [];

    if ( _id_51C1( var_0, "aa_" ) )
        thread [[ level._id_88B2 ]]( var_0 );
}

_id_3093( var_0 )
{

}

_id_51C1( var_0, var_1 )
{
    if ( var_1.size > var_0.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[var_2] )
            return 0;
    }

    return 1;
}

_id_383F( var_0, var_1 )
{
    level._id_382E[var_0] = 1;
    _id_7EDD( var_0 );

    if ( isdefined( var_1 ) )
        level notify( var_0, var_1 );
    else
        level notify( var_0 );
}

assign_unique_id()
{
    self._id_9A29 = "generic" + level._id_3C9D;
    level._id_3C9D++;
}

_id_384A( var_0 )
{
    var_1 = undefined;

    while ( !_id_382E( var_0 ) )
    {
        var_1 = undefined;
        level waittill( var_0, var_1 );
    }

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_3831( var_0 )
{
    if ( !_id_382E( var_0 ) )
        return;

    level._id_382E[var_0] = 0;
    _id_7EDD( var_0 );
    level notify( var_0 );
}

_id_3857( var_0 )
{
    while ( _id_382E( var_0 ) )
        level waittill( var_0 );
}

_id_A087( var_0, var_1 )
{
    self endon( var_0 );
    self waittill( var_1 );
}

array_thread( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]();
    }
    else
    {
        if ( !isdefined( var_3 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2 );

            return;
        }

        if ( !isdefined( var_4 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3 );

            return;
        }

        if ( !isdefined( var_5 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4 );

            return;
        }

        if ( !isdefined( var_6 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );

            return;
        }

        if ( !isdefined( var_7 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );

            return;
        }

        if ( !isdefined( var_8 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );

            return;
        }

        if ( !isdefined( var_9 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

            return;
        }

        if ( !isdefined( var_10 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

            return;
        }

        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }
}

array_call( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        var_6 call [[ var_1 ]]();
}

_id_6166( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

array_thread4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    array_thread( var_0, var_1, var_2, var_3, var_4, var_5 );
}

array_thread5( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    array_thread( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_97CE( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        array_thread( var_2, ::_id_97CF );
    }
    else
        _id_97CF();
}

_id_97CF()
{
    if ( isdefined( self._id_71E9 ) )
        self.origin = self._id_71E9;

    self._id_97CC = undefined;
}

_id_97CC( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        array_thread( var_2, ::_id_97CD );
    }
    else
        _id_97CD();
}

_id_97CD()
{
    if ( !isdefined( self._id_71E9 ) )
        self._id_71E9 = self.origin;

    if ( self.origin == self._id_71E9 )
        self.origin += ( 0.0, 0.0, -10000.0 );

    self._id_97CC = 1;
}

_id_7EDD( var_0 )
{
    if ( !isdefined( level._id_9794 ) )
        return;

    level._id_9794[var_0] = array_removeundefined( level._id_9794[var_0] );
    array_thread( level._id_9794[var_0], ::_id_9AE8 );
}

_id_9AE8()
{
    var_0 = 1;

    if ( isdefined( self._id_79D9 ) )
    {
        var_0 = 0;
        var_1 = _id_23B2( self._id_79D9 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382E( var_3 ) )
            {
                var_0 = 1;
                break;
            }
        }
    }

    var_5 = 1;

    if ( isdefined( self._id_79D6 ) )
    {
        var_1 = _id_23B2( self._id_79D6 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382E( var_3 ) )
            {
                var_5 = 0;
                break;
            }
        }
    }

    [[ level._id_979E[var_0 && var_5] ]]();
}

_id_23B2( var_0 )
{
    var_1 = strtok( var_0, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( level._id_382E[var_1[var_2]] ) )
            _id_383D( var_1[var_2] );
    }

    return var_1;
}

_id_4D6D()
{
    level._id_9794 = [];
    level._id_979E[1] = ::_id_97CE;
    level._id_979E[0] = ::_id_97CC;
}

_id_40FB( var_0, var_1 )
{
    var_2 = level._id_8F64[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_40FD( var_0, var_1 )
{
    var_2 = level._id_8F64[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return [];

    return var_2;
}

_id_8F63()
{
    level._id_8F64 = [];
    level._id_8F64["target"] = [];
    level._id_8F64["targetname"] = [];
    level._id_8F64["script_noteworthy"] = [];
    level._id_8F64["script_linkname"] = [];

    foreach ( var_1 in level._id_8F60 )
        add_struct_to_global_array( var_1 );
}

add_struct_to_global_array( var_0 )
{
    if ( isdefined( var_0.targetname ) )
    {
        if ( !isdefined( level._id_8F64["targetname"][var_0.targetname] ) )
            level._id_8F64["targetname"][var_0.targetname] = [];

        var_1 = level._id_8F64["targetname"][var_0.targetname].size;
        level._id_8F64["targetname"][var_0.targetname][var_1] = var_0;
    }

    if ( isdefined( var_0.target ) )
    {
        if ( !isdefined( level._id_8F64["target"][var_0.target] ) )
            level._id_8F64["target"][var_0.target] = [];

        var_1 = level._id_8F64["target"][var_0.target].size;
        level._id_8F64["target"][var_0.target][var_1] = var_0;
    }

    if ( isdefined( var_0.script_noteworthy ) )
    {
        if ( !isdefined( level._id_8F64["script_noteworthy"][var_0.script_noteworthy] ) )
            level._id_8F64["script_noteworthy"][var_0.script_noteworthy] = [];

        var_1 = level._id_8F64["script_noteworthy"][var_0.script_noteworthy].size;
        level._id_8F64["script_noteworthy"][var_0.script_noteworthy][var_1] = var_0;
    }

    if ( isdefined( var_0.script_linkname ) )
    {
        if ( !isdefined( level._id_8F64["script_linkname"][var_0.script_linkname] ) )
            level._id_8F64["script_linkname"][var_0.script_linkname] = [];

        var_1 = level._id_8F64["script_linkname"][var_0.script_linkname].size;
        level._id_8F64["script_linkname"][var_0.script_linkname][0] = var_0;
    }
}

_id_36BE()
{

}

_id_36BC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;
}

_id_36BD( var_0, var_1 )
{

}

_id_36BB()
{

}

_id_36BA()
{

}

_id_36BF( var_0 )
{

}

array_remove( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4 != var_1 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

array_remove_array( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_0 = array_remove( var_0, var_3 );

    return var_0;
}

array_removeundefined( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

array_remove_duplicates( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = 1;

        foreach ( var_6 in var_1 )
        {
            if ( var_3 == var_6 )
            {
                var_4 = 0;
                break;
            }
        }

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

array_levelthread( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        thread [[ var_1 ]]( var_6 );
}

array_levelcall( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

add_to_array( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) )
        var_0[0] = var_1;
    else
        var_0[var_0.size] = var_1;

    return var_0;
}

_id_382F( var_0 )
{

}

_id_3852( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382E( var_0 ) )
            return;

        if ( _id_382E( var_1 ) )
            return;

        level _id_A087( var_0, var_1 );
    }
}

_id_3853( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382E( var_0 ) )
            return var_0;

        if ( _id_382E( var_1 ) )
            return var_1;

        var_2 = level _id_A070( var_0, var_1 );
        return var_2;
    }
}

_id_3859( var_0, var_1 )
{
    for (;;)
    {
        if ( !_id_382E( var_0 ) )
            return var_0;

        if ( !_id_382E( var_1 ) )
            return var_1;

        level _id_A087( var_0, var_1 );
    }
}

_id_385A( var_0, var_1 )
{
    return _id_3859( var_0, var_1 );
}

_id_384C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( isdefined( var_5 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
        var_6[var_6.size] = var_5;
    }
    else if ( isdefined( var_4 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        _id_3852( var_0, var_1 );
        return;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        {
            if ( _id_382E( var_6[var_7] ) )
                return;
        }

        level _id_A069( var_0, var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_384E( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    if ( isdefined( var_4 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
        var_5[var_5.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        var_6 = _id_3853( var_0, var_1 );
        return var_6;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( _id_382E( var_5[var_7] ) )
                return var_5[var_7];
        }

        var_6 = level _id_A070( var_0, var_1, var_2, var_3, var_4 );
        return var_6;
    }
}

_id_384B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
        _id_384A( var_0 );

    if ( isdefined( var_1 ) )
        _id_384A( var_1 );

    if ( isdefined( var_2 ) )
        _id_384A( var_2 );

    if ( isdefined( var_3 ) )
        _id_384A( var_3 );
}

_id_3856( var_0, var_1 )
{
    var_2 = var_1 * 1000;
    var_3 = gettime();

    for (;;)
    {
        if ( _id_382E( var_0 ) )
            break;

        if ( gettime() >= var_3 + var_2 )
            break;

        var_4 = var_2 - ( gettime() - var_3 );
        var_5 = var_4 / 1000;
        _id_9FA0( var_0, var_5 );
    }
}

_id_385B( var_0, var_1 )
{
    var_2 = gettime();

    for (;;)
    {
        if ( !_id_382E( var_0 ) )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_9FA0( var_0, var_1 );
    }
}

_id_9FA0( var_0, var_1 )
{
    level endon( var_0 );
    wait(var_1);
}

_id_27CD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27CE( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27CE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( _id_51AE() )
    {
        self endon( "death" );
        self endon( "stop_delay_call" );
    }

    wait(var_1);

    if ( isdefined( var_10 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self call [[ var_0 ]]( var_2 );
    else
        self call [[ var_0 ]]();
}

_id_27C8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27C9( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27C9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    wait(var_1);

    if ( isdefined( var_10 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self [[ var_0 ]]( var_2 );
    else
        self [[ var_0 ]]();
}

_id_6167( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_6168( var_1, var_0, var_2, var_3, var_4, var_5 );
}

_id_6168( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    wait(var_1);

    if ( isdefined( var_5 ) )
        call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        call [[ var_0 ]]( var_2 );
    else
        call [[ var_0 ]]();
}

_id_51AE()
{
    if ( !isdefined( level._id_51AE ) )
        level._id_51AE = !_id_8F57( getdvar( "mapname" ), "mp_" );

    return level._id_51AE;
}

_id_51AF()
{
    if ( !isdefined( level._id_51AF ) )
        level._id_51AF = _id_8F57( getdvar( "mapname" ), "so_td_" );

    return level._id_51AF;
}

_id_8F57( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( tolower( var_0[var_2] ) != tolower( var_1[var_2] ) )
            return 0;
    }

    return 1;
}

_id_8F55( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return -1;

    if ( var_1.size == 0 )
        return 0;

    var_2 = 0;

    for ( var_3 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( tolower( var_0[var_2] ) == tolower( var_1[var_3] ) )
            var_3++;
        else
        {
            var_3 = 0;

            if ( tolower( var_0[var_2] ) == tolower( var_1[var_3] ) )
                var_3++;
            else if ( var_2 > var_0.size - var_1.size )
                return -1;
        }

        if ( var_3 >= var_1.size )
            return var_2 - var_3 + 1;
    }

    return -1;
}

_id_6DF1( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0[0];

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    for ( var_6 = 1; var_6 < var_0.size; var_6++ )
    {
        thread _id_2DB8( var_5, var_0[var_6], var_1, var_2, var_3, var_4 );
        var_5 = var_0[var_6];
    }
}

_id_2DB8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
        wait 0.05;
}

_id_909B( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

array_combine( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

array_combine_reverse_keys( var_0, var_1 )
{
    if ( !var_0.size )
        return var_1;

    var_2 = [];
    var_3 = getarraykeys( var_0 );
    var_3 = array_reverse( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_2[var_2.size] = var_0[var_5];
    }

    var_3 = getarraykeys( var_1 );
    var_3 = array_reverse( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_2[var_2.size] = var_1[var_5];
    }

    return var_2;
}

array_combine_non_integer_indices( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

array_randomize( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = randomint( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return var_0;
}

array_add( var_0, var_1 )
{
    var_0[var_0.size] = var_1;
    return var_0;
}

array_first( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3;
        break;
    }

    return var_1;
}

array_insert( var_0, var_1, var_2 )
{
    if ( var_2 == var_0.size )
    {
        var_3 = var_0;
        var_3[var_3.size] = var_1;
        return var_3;
    }

    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( var_5 == var_2 )
        {
            var_3[var_5] = var_1;
            var_4 = 1;
        }

        var_3[var_5 + var_4] = var_0[var_5];
    }

    return var_3;
}

array_contains( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

array_find( var_0, var_1 )
{
    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return var_4;
    }

    return undefined;
}

_id_38C8( var_0 )
{
    var_1 = ( 0, var_0[1], 0 );
    return var_1;
}

_id_38C9( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    return var_1;
}

_id_2DA0( var_0, var_1, var_2, var_3 )
{
    level endon( "newpath" );
    var_4 = [];
    var_5 = vectortoangles( var_0 - var_1 );
    var_6 = anglestoright( var_5 );
    var_7 = anglestoforward( var_5 );
    var_8 = anglestoup( var_5 );
    var_9 = distance( var_0, var_1 );
    var_10 = [];
    var_11 = 0.1;
    var_10[0] = var_0;
    var_10[1] = var_0 + var_6 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[2] = var_1;
    var_10[3] = var_0 + var_6 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[4] = var_0;
    var_10[5] = var_0 + var_8 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[6] = var_1;
    var_10[7] = var_0 + var_8 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[8] = var_0;
    var_12 = var_2[0];
    var_13 = var_2[1];
    var_14 = var_2[2];
    _id_6DF1( var_10, var_12, var_13, var_14, var_3 );
}

_id_3DBD()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = _id_3DC3();

        foreach ( var_3 in var_1 )
        {
            var_4 = getentarray( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = array_combine( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DC2()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = _id_3DC3();

        foreach ( var_3 in var_1 )
        {
            var_4 = getvehiclenodearray( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = array_combine( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DBC()
{
    var_0 = _id_3DBD();
    return var_0[0];
}

_id_3DC1()
{
    var_0 = _id_3DC2();
    return var_0[0];
}

_id_3DC3()
{
    return strtok( self._id_7A26, " " );
}

_id_76BB( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "targetname" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FD( var_0, "targetname" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4047 ]]( var_0, "targetname" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = getvehiclenodearray( var_0, "targetname" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
}

_id_76B9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "script_noteworthy" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FD( var_0, "script_noteworthy" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4047 ]]( var_0, "script_noteworthy" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
    var_5 = getvehiclenodearray( var_0, "script_noteworthy" );
    array_thread( var_5, var_1, var_2, var_3, var_4 );
}

_id_2D9F( var_0, var_1, var_2 )
{
    level endon( "newpath" );
    var_3 = [];
    var_4 = vectortoangles( var_0 - var_1 );
    var_5 = anglestoright( var_4 );
    var_6 = anglestoforward( var_4 );
    var_7 = distance( var_0, var_1 );
    var_8 = [];
    var_9 = 0.05;
    var_8[0] = var_0;
    var_8[1] = var_0 + var_5 * ( var_7 * var_9 ) + var_6 * ( var_7 * -0.2 );
    var_8[2] = var_1;
    var_8[3] = var_0 + var_5 * ( var_7 * ( -1 * var_9 ) ) + var_6 * ( var_7 * -0.2 );

    for ( var_10 = 0; var_10 < 4; var_10++ )
    {
        var_11 = var_10 + 1;

        if ( var_11 >= 4 )
            var_11 = 0;
    }
}

_id_2DB4( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 1.0, 0.0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    if ( var_3 )
        var_5 = int( var_4 / 0.05 );
    else
        var_5 = int( var_1 / 0.05 );

    var_6 = [];
    var_7 = [];
    var_8 = gettime();

    for ( var_9 = var_8 + var_1 * 1000; var_8 < var_9 && isdefined( var_0 ); var_8 = gettime() )
    {
        var_6[0] = var_0 getpointinbounds( 1, 1, 1 );
        var_6[1] = var_0 getpointinbounds( 1, 1, -1 );
        var_6[2] = var_0 getpointinbounds( -1, 1, -1 );
        var_6[3] = var_0 getpointinbounds( -1, 1, 1 );
        var_7[0] = var_0 getpointinbounds( 1, -1, 1 );
        var_7[1] = var_0 getpointinbounds( 1, -1, -1 );
        var_7[2] = var_0 getpointinbounds( -1, -1, -1 );
        var_7[3] = var_0 getpointinbounds( -1, -1, 1 );

        for ( var_10 = 0; var_10 < 4; var_10++ )
        {
            var_11 = var_10 + 1;

            if ( var_11 == 4 )
                var_11 = 0;
        }

        if ( !var_3 )
            return;

        wait(var_4);
    }
}

_id_2DCE( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB4( var_0, var_1, var_2, var_3, var_4 );
}

_id_2DCC( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB4( var_0, var_1, var_2, var_3, var_4 );
}

_id_3FA8( var_0 )
{
    return level._effect[var_0];
}

_id_3BA5( var_0 )
{
    return isdefined( level._effect[var_0] );
}

_id_6F94( var_0, var_1 )
{
    var_2 = var_1 + "," + var_0;

    if ( isdefined( level._id_24A7[var_2] ) )
        return;

    level._id_24A7[var_2] = 1;
}

_id_36B6( var_0 )
{

}

_id_3FFD()
{
    return self._id_7814;
}

_id_6D76()
{

}

_id_51E1()
{
    return !self._id_2B0A;
}

_disableusability()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;

    self._id_2B0A++;
    self disableusability();
}

_enableusability()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;
    else if ( self._id_2B0A > 0 )
    {
        self._id_2B0A--;

        if ( self._id_2B0A == 0 )
            self enableusability();
    }
}

_id_7466()
{
    self._id_2B0A = 0;
    self enableusability();
}

_disableweapon()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B++;
    self disableweapons();
}

_enableweapon()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B--;

    if ( !self._id_2B0B )
        self enableweapons();
}

_id_5207()
{
    return !self._id_2B0B;
}

_disableweaponswitch()
{
    if ( !isdefined( self._id_2B0C ) )
        self._id_2B0C = 0;

    self._id_2B0C++;
    self disableweaponswitch();
}

_enableweaponswitch()
{
    if ( !isdefined( self._id_2B0C ) )
        self._id_2B0C = 0;

    self._id_2B0C--;

    if ( !self._id_2B0C )
    {
        if ( isdefined( level._id_49E4 ) && level._id_49E4 == 1 )
            return;
        else
            self enableweaponswitch();
    }
}

_id_5209()
{
    return !self._id_2B0C;
}

_disableoffhandweapons()
{
    if ( !isdefined( self._id_2B05 ) )
        self._id_2B05 = 0;

    self._id_2B05++;
    self disableoffhandweapons();
}

_enableoffhandweapons()
{
    if ( !isdefined( self._id_2B05 ) )
        self._id_2B05 = 0;

    self._id_2B05--;

    if ( !self._id_2B05 )
        self enableoffhandweapons();
}

_id_5163()
{
    return !self._id_2B05;
}

_enabledetonate( var_0, var_1 )
{
    if ( !self hasweapon( var_0 ) )
        return;

    if ( self _meth_84C0( var_0 ) == var_1 )
        return;

    self _meth_84BF( var_0, var_1 );

    if ( var_1 )
        self notify( "WeaponDetonateEnabled", var_0 );
    else
        self notify( "WeaponDetonateDisabled", var_0 );
}

_id_710E( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    return var_1[randomint( var_1.size )];
}

_id_711C( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    var_5 = randomint( var_1.size * var_1.size );
    return var_1[var_1.size - 1 - int( sqrt( var_5 ) )];
}

_id_8959()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "tag_origin" );
    var_0 hide();

    if ( isdefined( self.origin ) )
        var_0.origin = self.origin;

    if ( isdefined( self.angles ) )
        var_0.angles = self.angles;

    return var_0;
}

_id_A0A0( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
}

_id_A0A2( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    return "timeout";
}

_id_36B9()
{
    level._id_36C1 = 0;
    level._id_36B7 = 1;
    _id_36B7( "GAMEPRINTSTARTFILE:" );
}

_id_36B7( var_0 )
{
    level._id_36C1++;

    if ( level._id_36C1 > 200 )
    {
        wait 0.05;
        level._id_36C1 = 0;
    }
}

_id_36B8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        _id_36B7( "GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_0 );
    else
        _id_36B7( "GAMEPRINTENDFILE:" + var_0 );

    var_2 = gettime() + 4000;

    while ( getdvarint( "LAUNCHER_PRINT_SUCCESS" ) == 0 && getdvar( "LAUNCHER_PRINT_FAIL" ) == "0" && gettime() < var_2 )
        wait 0.05;

    if ( !( gettime() < var_2 ) )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? " );
        level._id_36B7 = undefined;
        return 0;
    }

    var_3 = getdvar( "LAUNCHER_PRINT_FAIL" );

    if ( var_3 != "0" )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( " + var_3 + " ): launcherconflict? restart launcher and try again? " );
        level._id_36B7 = undefined;
        return 0;
    }

    level._id_36B7 = undefined;
    return 1;
}

_id_562B( var_0 )
{
    level._id_36C1 = 0;
    _id_36B7( "LAUNCHER_CLIP:" + var_0 );
}

_id_50F2()
{
    if ( !isdefined( self ) )
        return 0;

    return isdefined( self.destructible_type );
}

_id_671F()
{
    common_scripts\_createfx::_id_8E8E();
}

activate_individual_exploder()
{
    common_scripts\_exploder::activate_individual_exploder_proc();
}

_id_3E89( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.target;

    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AE() )
    {
        var_1 = call [[ level._id_404C ]]( var_0, "targetname" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40FB( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = getvehiclenode( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_3DF3( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AE() )
    {
        var_1 = call [[ level._id_404C ]]( var_0, "script_noteworthy" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40FB( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = getvehiclenode( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_2BBD( var_0, var_1 )
{
    var_2 = level._id_3010[var_0];
    earthquake( var_2["magnitude"], var_2["duration"], var_1, var_2["radius"] );
}

_id_697A( var_0, var_1 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_2.origin = var_1;
    var_2 playloopsound( var_0 );
    return var_2;
}

play_loopsound_in_space_with_end( var_0, var_1, var_2 )
{
    var_3 = _id_697A( var_0, var_1 );

    if ( isdefined( var_2 ) )
        self waittill( var_2 );

    var_3 stoploopsound( var_0 );
    var_3 delete();
}

_id_69C3( var_0, var_1, var_2, var_3 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_4 = spawn( "script_origin", ( 0.0, 0.0, 1.0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_4.origin = var_1;
    var_4.angles = var_2;

    if ( _id_51AE() )
    {
        if ( isdefined( var_3 ) && var_3 )
            var_4 playsoundasmaster( var_0, "sounddone" );
        else
            var_4 playsound( var_0, "sounddone" );

        var_4 waittill( "sounddone" );
    }
    else if ( isdefined( var_3 ) && var_3 )
        var_4 playsoundasmaster( var_0 );
    else
        var_4 playsound( var_0 );

    var_4 delete();
}

_id_69C2( var_0, var_1, var_2 )
{
    _id_69C3( var_0, var_1, ( 0.0, 0.0, 0.0 ), var_2 );
}

_id_5871( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !soundexists( var_0 ) )
        return;

    if ( isdefined( var_3 ) )
        var_2 = undefined;

    if ( isdefined( var_2 ) && var_2 && ( !isdefined( level._id_380E ) || level._id_380E == 1 ) )
        spawnloopingsound( var_0, var_1, ( 0.0, 0.0, 0.0 ) );
    else
    {
        var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

        if ( isdefined( var_3 ) )
        {
            thread _id_5877( var_3, var_5 );
            self endon( var_3 );
        }

        var_5.origin = var_1;
        var_5 playloopsound( var_0 );
        var_5 willneverchange();
    }
}

_id_5874( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !soundexists( var_0 ) )
        return;

    if ( isdefined( var_3 ) && var_3 )
    {
        if ( !isdefined( level._id_380E ) || level._id_380E == 1 )
            spawnloopingsound( var_0, var_1, var_2 );
    }
    else
    {
        if ( isdefined( level._id_2409 ) && level._id_2409 && isdefined( var_5._id_5891 ) )
            var_7 = var_5._id_5891;
        else
            var_7 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

        if ( isdefined( var_4 ) )
        {
            thread _id_5877( var_4, var_7 );
            self endon( var_4 );
        }

        var_7.origin = var_1;
        var_7.angles = var_2;
        var_7 playloopsound( var_0 );

        if ( isdefined( level._id_2409 ) && level._id_2409 )
            var_5._id_5891 = var_7;
        else
            var_7 willneverchange();
    }
}

_id_5872( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_5873( var_0, var_1, ( 0.0, 0.0, 0.0 ), var_2, var_3, var_4, var_5 );
}

_id_5873( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( var_3 ) )
    {
        thread _id_5877( var_3, var_7 );
        self endon( var_3 );
    }

    var_7.origin = var_1;
    var_7.angles = var_2;

    if ( var_5 >= var_6 )
    {
        for (;;)
            wait 0.05;
    }

    if ( !soundexists( var_0 ) )
    {
        for (;;)
            wait 0.05;
    }

    for (;;)
    {
        wait(randomfloatrange( var_5, var_6 ));
        _id_57FE( "createfx_looper" );
        thread _id_69C3( var_0, var_7.origin, var_7.angles, undefined );
        _id_9A45( "createfx_looper" );
    }
}

_id_5877( var_0, var_1 )
{
    var_1 endon( "death" );
    self waittill( var_0 );
    var_1 delete();
}

_id_2428( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "loopfx", var_0 );
    var_1.v["delay"] = common_scripts\_createfx::_id_400F();
    return var_1;
}

_id_242E( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "oneshotfx", var_0 );
    var_1.v["delay"] = common_scripts\_createfx::_id_4061();
    return var_1;
}

_id_23FE( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "exploder", var_0 );
    var_1.v["delay"] = common_scripts\_createfx::_id_3F8D();
    var_1.v["exploder_type"] = "normal";
    return var_1;
}

alphabetize( var_0 )
{
    if ( var_0.size <= 1 )
        return var_0;

    var_1 = 0;

    for ( var_2 = var_0.size - 1; var_2 >= 1; var_2-- )
    {
        var_3 = var_0[var_2];
        var_4 = var_2;

        for ( var_5 = 0; var_5 < var_2; var_5++ )
        {
            var_6 = var_0[var_5];

            if ( stricmp( var_6, var_3 ) > 0 )
            {
                var_3 = var_6;
                var_4 = var_5;
            }
        }

        if ( var_4 != var_2 )
        {
            var_0[var_4] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_5047( var_0, var_1 )
{
    return stricmp( var_0, var_1 ) > 0;
}

_id_6975( var_0, var_1, var_2, var_3 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_4 endon( "death" );
    thread _id_2825( var_4 );

    if ( isdefined( var_1 ) )
    {
        var_4.origin = self.origin + var_1;
        var_4.angles = self.angles;
        var_4 _meth_8442( self );
    }
    else
    {
        var_4.origin = self.origin;
        var_4.angles = self.angles;
        var_4 _meth_8442( self );
    }

    if ( isdefined( var_2 ) && var_2 > 0 )
        var_4 setvolume( 0 );

    var_4 playloopsound( var_0 );

    if ( isdefined( var_2 ) && var_2 > 0 )
        var_4 scalevolume( 1, var_2 );

    self waittill( "stop sound" + var_0 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4 scalevolume( 0, var_3 );
        wait(var_3 + 0.05);
    }

    var_4 stoploopsound( var_0 );
    var_4 delete();
}

_id_8EA1( var_0 )
{
    self notify( "stop sound" + var_0 );
}

_id_2825( var_0 )
{
    var_0 endon( "death" );
    _id_A069( "death", "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_334F( var_0 )
{
    waittillframeend;
}

_id_23AE( var_0, var_1 )
{
    setdvarifuninitialized( var_0, var_1 );
}

_id_9F36( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{

}

_id_90C8( var_0, var_1 )
{
    var_2 = self gettagorigin( var_0 );
    var_3 = self gettagangles( var_0 );
    var_4 = anglestoforward( var_3 );
    var_4 = vectornormalize( var_4 ) * var_1;
    return var_2 + var_4;
}

_id_9294( var_0, var_1, var_2 )
{
    if ( var_0 )
        return var_1;

    return var_2;
}

_id_23C8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( level._id_57FE ) )
        level._id_57FE = [];

    var_2 = spawnstruct();
    var_2._id_59FB = var_1;
    var_2.count = 0;
    level._id_57FE[var_0] = var_2;
}

_id_57FF( var_0 )
{
    if ( !isdefined( level._id_57FE ) )
        return 0;

    return isdefined( level._id_57FE[var_0] );
}

_id_57FE( var_0 )
{
    var_1 = level._id_57FE[var_0];

    while ( var_1.count >= var_1._id_59FB )
        var_1 waittill( "unlocked" );

    var_1.count++;
}

_id_504D( var_0 )
{
    var_1 = level._id_57FE[var_0];
    return var_1.count > var_1._id_59FB;
}

_id_9A4A( var_0 )
{
    thread _id_9A48( var_0 );
    wait 0.05;
}

_id_9A45( var_0 )
{
    thread _id_9A48( var_0 );
}

_id_9A48( var_0 )
{
    wait 0.05;
    var_1 = level._id_57FE[var_0];
    var_1.count--;
    var_1 notify( "unlocked" );
}

_id_3E94()
{
    var_0 = level.script;

    if ( isdefined( level._id_927C ) )
        var_0 = level._id_927C;

    return var_0;
}

array_reverse( var_0 )
{
    var_1 = [];

    for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
        var_1[var_1.size] = var_0[var_2];

    return var_1;
}

_id_2B73( var_0, var_1 )
{
    return length2dsquared( var_0 - var_1 );
}

_id_3CCC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CCB( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_6 = array_reverse( var_6 );
    return var_6;
}

_id_3CCB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1.size;

    if ( !isdefined( var_2 ) )
        var_2 = [];

    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_6 = var_4 * var_4;

    var_7 = 0;

    if ( isdefined( var_5 ) )
        var_7 = var_5 * var_5;

    if ( var_2.size == 0 && var_3 >= var_1.size && var_7 == 0 && !isdefined( var_6 ) )
        return sortbydistance( var_1, var_0 );

    var_8 = [];

    foreach ( var_10 in var_1 )
    {
        var_11 = 0;

        foreach ( var_13 in var_2 )
        {
            if ( var_10 == var_13 )
            {
                var_11 = 1;
                break;
            }
        }

        if ( var_11 )
            continue;

        var_15 = distancesquared( var_0, var_10.origin );

        if ( isdefined( var_6 ) && var_15 > var_6 )
            continue;

        if ( var_15 < var_7 )
            continue;

        var_8[var_8.size] = var_10;
    }

    var_8 = sortbydistance( var_8, var_0 );

    if ( var_3 >= var_8.size )
        return var_8;

    var_17 = [];

    for ( var_18 = 0; var_18 < var_3; var_18++ )
        var_17[var_18] = var_8[var_18];

    return var_17;
}

_id_5064()
{
    if ( !level.console )
    {
        var_0 = self _meth_834C();

        if ( isdefined( var_0 ) )
            return var_0;
        else
            return 0;
    }

    return 1;
}

_id_2F69( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1500;

    if ( !isdefined( var_2 ) )
        var_2 = -12000;

    return physicstrace( var_0 + ( 0, 0, var_1 ), var_0 + ( 0, 0, var_2 ) );
}

add_destructible_type_function( var_0, var_1 )
{
    if ( !isdefined( level._id_2911 ) )
        level._id_2911 = [];

    level._id_2911[var_0] = var_1;
}

add_destructible_type_transient( var_0, var_1 )
{
    if ( !isdefined( level._id_2935 ) )
        level._id_2935 = [];

    level._id_2935[var_0] = var_1;
}

_id_A347( var_0, var_1, var_2, var_3 )
{
    var_4 = vectornormalize( var_2 - var_0 );
    var_5 = anglestoforward( var_1 );
    var_6 = vectordot( var_5, var_4 );
    return var_6 >= var_3;
}

_id_3315( var_0 )
{
    self notify( "entity_path_disconnect_thread" );
    self endon( "entity_path_disconnect_thread" );
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = 0;
    self._id_39BB = 0;

    for (;;)
    {
        var_2 = self.origin;
        var_3 = _id_A073( var_0, "path_disconnect" );
        var_4 = 0;
        var_5 = distancesquared( self.origin, var_2 ) > 0;

        if ( var_5 )
            var_4 = 1;

        if ( isdefined( var_3 ) && var_3 == "path_disconnect" )
            var_4 = 1;

        if ( gettime() < self._id_39BB )
            var_4 = 1;

        foreach ( var_7 in level.characters )
        {
            if ( isai( var_7 ) && distancesquared( self.origin, var_7.origin ) < 250000 )
            {
                var_4 = 1;
                self._id_39BB = max( gettime() + 30000, self._id_39BB );
            }
        }

        if ( var_4 != var_1 || var_5 )
        {
            if ( var_4 )
                self disconnectpaths();
            else
                self connectpaths();

            var_1 = var_4;
        }
    }
}

_id_5923( var_0, var_1 )
{
    if ( level.gametype == "aliens" && isdefined( level.aliens_make_entity_sentient_func ) )
        return self [[ level.aliens_make_entity_sentient_func ]]( var_0, var_1 );

    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_make_entity_sentient"] ) )
        return self [[ level.bot_funcs["bots_make_entity_sentient"] ]]( var_0, var_1 );
}

ai_3d_sighting_model( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["ai_3d_sighting_model"] ) )
        return self [[ level.bot_funcs["ai_3d_sighting_model"] ]]( var_0 );
}

_id_7DDE( var_0, var_1, var_2 )
{
    if ( !isdefined( level.anim_prop_models ) )
        level.anim_prop_models = [];

    var_3 = tolower( getdvar( "mapname" ) );
    var_4 = 1;

    if ( _id_8F57( var_3, "mp_" ) )
        var_4 = 0;

    if ( var_4 )
        level.anim_prop_models[var_0]["basic"] = var_1;
    else
        level.anim_prop_models[var_0]["basic"] = var_2;
}

_id_3F33( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_6 = distance( var_5.origin, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_3F91( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = 0;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        var_7 = distance( var_6.origin, var_0 );

        if ( var_7 <= var_3 || var_7 >= var_2 )
            continue;

        var_3 = var_7;
        var_4 = var_6;
    }

    return var_4;
}

_id_5CA4( var_0, var_1, var_2 )
{
    var_2 = _id_9294( isdefined( var_2 ), var_2, ( 0.0, 0.0, 0.0 ) );
    self _meth_81DC( var_0, var_2 );

    switch ( var_1 )
    {
        case "direct":
            self missilesetflightmodedirect();
            break;
        case "top":
            self missilesetflightmodetop();
            break;
    }
}

_id_33E1( var_0 )
{
    return log( var_0 + 0.000061 ) / log( 2.0 ) + 2.84;
}

_id_576F( var_0 )
{
    if ( var_0 <= 0.0031308 )
        return var_0 * 12.92;
    else
        return pow( var_0, 0.416667 ) * 1.055 - 0.055;
}

_id_21A5( var_0 )
{
    if ( !isdefined( var_0._id_4774 ) )
    {
        if ( isusinghdr() )
        {
            var_1 = max( var_0._id_7299, max( var_0._id_43D8, var_0.blue ) );
            var_2 = _id_33E1( var_1 * getradiometricunit() );

            if ( var_1 > 0 )
            {
                var_0._id_7299 /= var_1;
                var_0._id_43D8 /= var_1;
                var_0.blue /= var_1;
                var_0._id_7299 = _id_576F( var_0._id_7299 );
                var_0._id_43D8 = _id_576F( var_0._id_43D8 );
                var_0.blue = _id_576F( var_0.blue );
                var_0._id_4774 = var_2;
            }
            else
                var_0._id_4774 = 0.0;
        }
        else
            var_0._id_4774 = 1.0;
    }

    if ( isdefined( var_0._id_8FD1 ) && var_0._id_8FD1 )
    {
        if ( !isdefined( var_0._id_4776 ) )
        {
            if ( isusinghdr() )
            {
                var_1 = max( var_0._id_7299, var_0._id_43D8, var_0.blue );
                var_2 = _id_33E1( var_1 * getradiometricunit() );

                if ( var_1 > 0 )
                {
                    var_0._id_8FD9 /= var_1;
                    var_0._id_8FD2 /= var_1;
                    var_0._id_8FBF /= var_1;
                    var_0._id_8FD9 = _id_576F( var_0._id_7299 );
                    var_0._id_8FD2 = _id_576F( var_0._id_43D8 );
                    var_0._id_8FBF = _id_576F( var_0.blue );
                    var_0._id_4776 = var_2;
                    return;
                }

                var_0._id_4776 = 0.0;
                return;
            }
            else
                var_0._id_4776 = 1.0;
        }
    }
}

_id_21A4( var_0 )
{
    if ( isdefined( level._id_33E9 ) )
    {
        switch ( level._id_33E9 )
        {
            case "dfog":
                if ( level._id_33E9 == "dfog" && var_0._id_8FD1 == 0 )
                {
                    var_0._id_8FD1 = 1;
                    var_0._id_8FD9 = 0;
                    var_0._id_8FD2 = 0;
                    var_0._id_8FBF = 0;
                    var_0._id_4776 = 0;
                    var_0._id_8FC6 = ( 0.0, 0.0, 0.0 );
                    var_0._id_8FBD = 0;
                    var_0._id_8FCB = 0;
                    var_0._id_615E = 1;
                }

                break;
            case "normal_fog":
                if ( var_0._id_8FD1 == 1 )
                    var_0._id_8FD1 = 0;

                break;
            default:
        }
    }
}

_id_7E37( var_0, var_1 )
{
    if ( isdefined( var_0._id_8FD1 ) && var_0._id_8FD1 )
    {
        if ( !isplayer( self ) )
            setexpfogext( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0.blue, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_8FD9, var_0._id_8FD2, var_0._id_8FBF, var_0._id_4776, var_0._id_8FC6, var_0._id_8FBD, var_0._id_8FC9, var_0._id_615E, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
        else
            self _meth_8222( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0.blue, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_8FD9, var_0._id_8FD2, var_0._id_8FBF, var_0._id_4776, var_0._id_8FC6, var_0._id_8FBD, var_0._id_8FC9, var_0._id_615E, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
    }
    else if ( !isplayer( self ) )
        setexpfogext( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0.blue, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
    else
        self _meth_8222( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0.blue, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
}

_id_7E36( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_0._id_85CD ) )
    {
        var_0._id_85CD = 0;
        var_0._id_85CF = 0;
        var_0._id_85CE = 0;
    }

    if ( !isdefined( var_0._id_479F ) )
    {
        var_0._id_479F = 0;
        var_0._id_479E = 0;
        var_0._id_47A0 = 1000;
    }

    _id_21A5( var_0 );
    _id_21A4( var_0 );

    if ( isdefined( var_0.atmosfogenabled ) )
    {
        if ( level.nextgen && var_0.atmosfogenabled )
        {
            if ( isplayer( self ) )
                self _meth_8224( var_1, var_0.atmosfogsunfogcolor, var_0.atmosfoghazecolor, var_0.atmosfoghazestrength, var_0.atmosfoghazespread, var_0.atmosfogextinctionstrength, var_0.atmosfoginscatterstrength, var_0.atmosfoghalfplanedistance, var_0.atmosfogstartdistance, var_0.atmosfogdistancescale, int( var_0.atmosfogskydistance ), var_0.atmosfogskyangularfalloffenabled, var_0.atmosfogskyfalloffstartangle, var_0.atmosfogskyfalloffanglerange, var_0.atmosfogsundirection, var_0.atmosfogheightfogenabled, var_0.atmosfogheightfogbaseheight, var_0.atmosfogheightfoghalfplanedistance );
            else
                setatmosfog( var_1, var_0.atmosfogsunfogcolor, var_0.atmosfoghazecolor, var_0.atmosfoghazestrength, var_0.atmosfoghazespread, var_0.atmosfogextinctionstrength, var_0.atmosfoginscatterstrength, var_0.atmosfoghalfplanedistance, var_0.atmosfogstartdistance, var_0.atmosfogdistancescale, int( var_0.atmosfogskydistance ), var_0.atmosfogskyangularfalloffenabled, var_0.atmosfogskyfalloffstartangle, var_0.atmosfogskyfalloffanglerange, var_0.atmosfogsundirection, var_0.atmosfogheightfogenabled, var_0.atmosfogheightfogbaseheight, var_0.atmosfogheightfoghalfplanedistance );
        }
        else
            _id_7E37( var_0, var_1 );
    }
    else
        _id_7E37( var_0, var_1 );
}

add_fx( var_0, var_1 )
{
    if ( !isdefined( level._effect ) )
        level._effect = [];

    level._effect[var_0] = loadfx( var_1 );
}

array_sort_by_handler( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        for ( var_3 = var_2 + 1; var_3 < var_0.size; var_3++ )
        {
            if ( var_0[var_3] [[ var_1 ]]() < var_0[var_2] [[ var_1 ]]() )
            {
                var_4 = var_0[var_3];
                var_0[var_3] = var_0[var_2];
                var_0[var_2] = var_4;
            }
        }
    }

    return var_0;
}

array_sort_with_func( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = -1;

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && ![[ var_1 ]]( var_0[var_5], var_4 ); var_5-- )
            var_0[var_5 + 1] = var_0[var_5];

        var_0[var_5 + 1] = var_4;

        if ( var_2 > 0 && var_3 % var_2 == 0 )
            wait 0.05;
    }

    return var_0;
}

_id_485E()
{
    if ( !isdefined( self._id_63C7 ) )
        self._id_63C7 = self setcontents( 0 );

    self hide();
}

_id_84EF()
{
    if ( !isai( self ) )
        self solid();

    if ( isdefined( self._id_63C7 ) )
        self setcontents( self._id_63C7 );

    self show();
}

_id_7FA2( var_0 )
{
    var_1 = getentarray();
    setomnvar( "lighting_state", var_0 );

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_572E ) && ( var_3.classname == "script_brushmodel" || var_3.classname == "script_model" ) )
            {
                if ( var_3._id_572E == 0 )
                    continue;

                if ( var_3._id_572E == var_0 )
                {
                    var_3 _id_84EF();
                    continue;
                }

                var_3 _id_485E();
            }
        }
    }
}

getstatsgroup_ranked()
{
    return "rankedMatchData";
}

getstatsgroup_private()
{
    return "privateMatchData";
}

getstatsgroup_coop()
{
    return "coopMatchData";
}

getstatsgroup_common()
{
    return "commonData";
}

getstatsgroup_horde()
{
    return "hordeMatchData";
}

getstatsgroup_sp()
{
    return "spData";
}

_id_4853( var_0 )
{
    thread hide_friendname_waittill_flag_or_notify( var_0 );
}

hide_friendname_waittill_flag_or_notify( var_0 )
{
    if ( !isdefined( self.name ) )
        return;

    level.player endon( "death" );
    self endon( "death" );
    self._id_63B0 = self.name;
    self.name = " ";
    level waittill( var_0 );
    self.name = self._id_63B0;
}
