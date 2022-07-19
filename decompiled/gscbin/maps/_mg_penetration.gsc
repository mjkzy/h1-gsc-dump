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

_id_4476( var_0 )
{
    self endon( "death" );
    self notify( "end_mg_behavior" );
    self endon( "end_mg_behavior" );
    self._id_1A49 = 1;
    self._id_A151 = 0;

    if ( !_id_A558::_id_9BE8( var_0 ) )
    {
        self notify( "continue_cover_script" );
        return;
    }

    self._id_5524 = undefined;
    thread _id_7283();
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
    thread _id_91A1( var_2 );
    var_2.origin = var_0.origin + var_1 * 500;

    if ( isdefined( self._id_5524 ) )
        var_2.origin = self._id_5524;

    var_0 settargetentity( var_2 );
    var_3 = undefined;

    for (;;)
    {
        if ( !isalive( self._id_24DF ) )
        {
            _id_8E84();
            self waittill( "new_enemy" );
        }

        _id_8BA9();
        _id_83DC( var_2 );

        if ( !isalive( self._id_24DF ) )
            continue;

        if ( self _meth_81c2( self._id_24DF ) )
            continue;

        self waittill( "saw_enemy" );
    }
}

_id_91A1( var_0 )
{
    common_scripts\utility::_id_A087( "death", "end_mg_behavior" );
    var_0 delete();
}

_id_83DC( var_0 )
{
    self endon( "death" );
    self endon( "new_enemy" );
    self._id_24DF endon( "death" );
    var_1 = self._id_24DF;

    while ( self _meth_81c2( var_1 ) )
    {
        var_2 = vectortoangles( var_1 geteye() - var_0.origin );
        var_2 = anglestoforward( var_2 );
        var_0 moveto( var_0.origin + var_2 * 12, 0.1 );
        wait 0.1;
    }

    if ( isplayer( var_1 ) )
    {
        self endon( "saw_enemy" );
        var_3 = var_1 geteye();
        var_2 = vectortoangles( var_3 - var_0.origin );
        var_2 = anglestoforward( var_2 );
        var_4 = 150;
        var_5 = distance( var_0.origin, self._id_5524 ) / var_4;

        if ( var_5 > 0 )
        {
            var_0 moveto( self._id_5524, var_5 );
            wait(var_5);
        }

        var_6 = var_0.origin + var_2 * 180;
        var_7 = _id_3E80( self geteye(), var_0.origin, var_6 );

        if ( !isdefined( var_7 ) )
            var_7 = var_0.origin;

        var_0 moveto( var_0.origin + var_2 * 80 + ( 0, 0, randomfloatrange( 15, 50 ) * -1 ), 3, 1, 1 );
        wait 3.5;
        var_0 moveto( var_7 + var_2 * -20, 3, 1, 1 );
    }

    wait(randomfloatrange( 2.5, 4 ));
    _id_8E84();
}

_id_7E21( var_0 )
{
    if ( var_0 )
    {
        self._id_1A49 = 1;

        if ( self._id_A151 )
            self._id_9940 notify( "startfiring" );
    }
    else
    {
        self._id_1A49 = 0;
        self._id_9940 notify( "stopfiring" );
    }
}

_id_8E84()
{
    self._id_A151 = 0;
    self._id_9940 notify( "stopfiring" );
}

_id_8BA9()
{
    self._id_A151 = 1;

    if ( self._id_1A49 )
        self._id_9940 notify( "startfiring" );
}

_id_23CC()
{
    if ( isdefined( level._id_5BC1 ) )
    {
        level._id_5BC1[level._id_5BC1.size] = self;
        return;
    }

    level._id_5BC1 = [];
    level._id_5BC1[level._id_5BC1.size] = self;
    waitframe;
    var_0 = spawnstruct();
    common_scripts\utility::_id_0D13( level._id_5BC1, ::_id_5BC0, var_0 );
    var_1 = level._id_5BC1;
    level._id_5BC1 = undefined;
    var_0 waittill( "gunner_died" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isalive( var_1[var_2] ) )
            continue;

        var_1[var_2] notify( "stop_using_built_in_burst_fire" );
        var_1[var_2] thread _id_8871();
    }
}

_id_5BC0( var_0 )
{
    self waittill( "death" );
    var_0 notify( "gunner_died" );
}

_id_5BD4( var_0 )
{
    wait 1;
    level notify( "new_mg_firing_team" + var_0[0].script_parentname );
    level endon( "new_mg_firing_team" + var_0[0].script_parentname );

    for (;;)
    {
        _id_2FB0( var_0 );
        _id_8872( var_0 );
    }
}

_id_8872( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isalive( var_0[var_2] ) )
            continue;

        var_1 = var_0[var_2];
        break;
    }

    if ( !isdefined( var_1 ) )
        return;
}

_id_8871()
{
    self endon( "death" );

    for (;;)
    {
        self._id_9940 startfiring();
        wait(randomfloatrange( 0.3, 0.7 ));
        self._id_9940 stopfiring();
        wait(randomfloatrange( 0.1, 1.1 ));
    }
}

_id_2FB0( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] endon( "death" );

    var_2 = 0;
    var_3 = 1;

    for (;;)
    {
        if ( isalive( var_0[var_2] ) )
            var_0[var_2] _id_7E21( 1 );

        if ( isalive( var_0[var_3] ) )
            var_0[var_3] _id_7E21( 0 );

        var_4 = var_2;
        var_2 = var_3;
        var_3 = var_4;
        wait(randomfloatrange( 2.3, 3.5 ));
    }
}

_id_8A91( var_0, var_1 )
{
    _id_8BA9();
    self endon( "death" );
    self endon( "new_enemy" );
    var_1 endon( "death" );

    while ( self _meth_81c2( var_1 ) )
    {
        var_2 = vectortoangles( var_1 geteye() - var_0.origin );
        var_2 = anglestoforward( var_2 );
        var_0 moveto( var_0.origin + var_2 * 10, 0.2 );
        wait 0.2;
    }

    var_2 = vectortoangles( var_1 geteye() - var_0.origin );
    var_2 = anglestoforward( var_2 );
    var_3 = 150;
    var_4 = distance( var_0.origin, self._id_5524 ) / var_3;
    var_0 moveto( self._id_5524, var_4 );
    wait(var_4);
    var_5 = var_0.origin;
    var_0 moveto( var_0.origin + var_2 * 80 + ( 0, 0, -25 ), 3, 1, 1 );
    wait 3.5;
    var_0 moveto( var_5 + var_2 * -20, 3, 1, 1 );
    wait 1;
    _id_8E84();
}

_id_3E80( var_0, var_1, var_2 )
{
    var_3 = distance( var_1, var_2 ) * 0.05;

    if ( var_3 < 5 )
        var_3 = 5;

    if ( var_3 > 20 )
        var_3 = 20;

    var_4 = var_2 - var_1;
    var_4 = ( var_4[0] / var_3, var_4[1] / var_3, var_4[2] / var_3 );
    var_5 = ( 0, 0, 0 );
    var_6 = undefined;

    for ( var_7 = 0; var_7 < var_3 + 2; var_7++ )
    {
        var_8 = bullettrace( var_0, var_1 + var_5, 0, undefined );

        if ( var_8["fraction"] < 1 )
        {
            var_6 = var_8["position"];
            break;
        }

        var_5 += var_4;
    }

    return var_6;
}

_id_7283()
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self._id_24DF = undefined;

    for (;;)
    {
        _id_7287();
        wait 0.05;
    }
}

_id_7287()
{
    if ( !isalive( self.enemy ) )
        return;

    if ( !self _meth_81c2( self.enemy ) )
        return;

    self._id_5524 = self.enemy geteye();
    self notify( "saw_enemy" );

    if ( !isalive( self._id_24DF ) || self._id_24DF != self.enemy )
    {
        self._id_24DF = self.enemy;
        self notify( "new_enemy" );
    }
}
