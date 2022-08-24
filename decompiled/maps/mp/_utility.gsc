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

_id_3537()
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    self playsound( level._id_78BA[self._id_7ACA] );
}

_id_0560( var_0, var_1, var_2, var_3 )
{
    self beginlocationselection( var_1, var_2, var_3 );
    self setclientomnvar( "ui_map_location_selector", 1 );
    self._id_7C6F = 1;
    self setblurforplayer( 10.3, 0.3 );
    thread _id_31C4( "cancel_location" );
    thread _id_31C4( "death" );
    thread _id_31C4( "disconnect" );
    thread _id_31C4( "used" );
    thread _id_31C4( "weapon_change" );
    self endon( "stop_location_selection" );
    thread _id_31C6();
    thread _id_31C5();
    thread _id_31C3();
}

_id_8EF6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( !var_0 )
    {
        self setclientomnvar( "ui_map_location_selector", 0 );
        self setblurforplayer( 0, 0.3 );
        self endlocationselection();
        self._id_7C6F = undefined;
    }

    self notify( "stop_location_selection", var_1 );
}

_id_31C5()
{
    self endon( "stop_location_selection" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !_id_50F9() )
            continue;

        thread _id_8EF6( 0, "emp" );
        return;
    }
}

_id_31C4( var_0, var_1 )
{
    self endon( "stop_location_selection" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    while ( var_1 > 0 )
    {
        self waittill( var_0 );
        var_1--;
    }

    thread _id_8EF6( var_0 == "disconnect", var_0 );
}

_id_31C6()
{
    self endon( "stop_location_selection" );
    level waittill( "game_ended" );
    thread _id_8EF6( 0, "end_game" );
}

_id_31C3()
{
    self endon( "stop_location_selection" );
    level waittill( "host_migration_begin" );
    thread _id_8EF6( 0, "hostmigrate" );
}

_id_50BD( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 3, var_0, 0 );

    if ( isdefined( var_1 ) && var_1 != "" )
        return 1;
    else
        return 0;
}

_id_3F0B( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 3, var_0, 1 );
    return var_1;
}

_id_27EF( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread _id_27F1( var_1, var_0, var_2, var_3, var_4, var_5, var_6 );
}

_id_27F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    wait(var_1);

    if ( !isdefined( var_2 ) )
        thread [[ var_0 ]]();
    else if ( !isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2 );
    else if ( !isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( !isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( !isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
}

_id_4087()
{
    var_0 = self.origin + ( 0.0, 0.0, 10.0 );
    var_1 = 11;
    var_2 = anglestoforward( self.angles );
    var_2 *= var_1;
    var_3[0] = var_0 + var_2;
    var_3[1] = var_0;
    var_4 = bullettrace( var_3[0], var_3[0] + ( 0.0, 0.0, -18.0 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = _id_658A( var_4["normal"] );
        return var_5;
    }

    var_4 = bullettrace( var_3[1], var_3[1] + ( 0.0, 0.0, -18.0 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = _id_658A( var_4["normal"] );
        return var_5;
    }

    var_3[2] = var_0 + ( 16.0, 16.0, 0.0 );
    var_3[3] = var_0 + ( 16.0, -16.0, 0.0 );
    var_3[4] = var_0 + ( -16.0, -16.0, 0.0 );
    var_3[5] = var_0 + ( -16.0, 16.0, 0.0 );
    var_6 = undefined;
    var_7 = undefined;

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        var_4 = bullettrace( var_3[var_8], var_3[var_8] + ( 0.0, 0.0, -1000.0 ), 0, undefined );

        if ( !isdefined( var_6 ) || var_4["fraction"] < var_6 )
        {
            var_6 = var_4["fraction"];
            var_7 = var_4["position"];
        }
    }

    if ( var_6 == 1 )
        var_7 = self.origin;

    var_5 = spawnstruct();
    var_5.origin = var_7;
    var_5.angles = _id_658A( var_4["normal"] );
    return var_5;
}

_id_658A( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    var_2 = length( var_1 );

    if ( !var_2 )
        return ( 0.0, 0.0, 0.0 );

    var_3 = vectornormalize( var_1 );
    var_4 = var_0[2] * -1;
    var_5 = ( var_3[0] * var_4, var_3[1] * var_4, var_2 );
    var_6 = vectortoangles( var_5 );
    return var_6;
}

_id_285E( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

issecondarysplitscreenplayer()
{
    if ( self issplitscreenplayerprimary() && !self usinggamepad() )
        return 1;

    return 0;
}

_id_6DDD( var_0, var_1, var_2 )
{
    if ( level.splitscreen )
    {
        if ( isdefined( level.players[0] ) )
            level.players[0] playlocalsound( var_0 );
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2 ) )
        {
            for ( var_3 = 0; var_3 < level.players.size; var_3++ )
            {
                var_4 = level.players[var_3];

                if ( var_4 issecondarysplitscreenplayer() )
                    continue;

                if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 && !_id_5100( var_4, var_2 ) )
                    var_4 playlocalsound( var_0 );
            }
        }
        else
        {
            for ( var_3 = 0; var_3 < level.players.size; var_3++ )
            {
                var_4 = level.players[var_3];

                if ( var_4 issecondarysplitscreenplayer() )
                    continue;

                if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
                    var_4 playlocalsound( var_0 );
            }
        }
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            var_4 = level.players[var_3];

            if ( var_4 issecondarysplitscreenplayer() )
                continue;

            if ( !_id_5100( var_4, var_2 ) )
                var_4 playlocalsound( var_0 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            var_4 = level.players[var_3];

            if ( var_4 issecondarysplitscreenplayer() )
                continue;

            var_4 playlocalsound( var_0 );
        }
    }
}

_id_6DC5( var_0, var_1, var_2 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3 endon( "death" );
    thread common_scripts\utility::_id_2825( var_3 );

    if ( isdefined( var_2 ) )
    {
        var_3 hide();

        foreach ( var_5 in var_2 )
            var_3 showtoplayer( var_5 );
    }

    if ( isdefined( var_1 ) )
    {
        var_3.origin = self.origin + var_1;
        var_3.angles = self.angles;
        var_3 _meth_8442( self );
    }
    else
    {
        var_3.origin = self.origin;
        var_3.angles = self.angles;
        var_3 _meth_8442( self );
    }

    var_3 playloopsound( var_0 );
    self waittill( "stop sound" + var_0 );
    var_3 stoploopsound( var_0 );
    var_3 delete();
}

_id_8896()
{
    for ( var_0 = 1; var_0 < self._id_58A6.size; var_0++ )
    {
        var_1 = self._id_58A6[var_0];
        var_2 = var_1._id_6FBE;

        for ( var_3 = var_0 - 1; var_3 >= 0 && var_2 > self._id_58A6[var_3]._id_6FBE; var_3-- )
            self._id_58A6[var_3 + 1] = self._id_58A6[var_3];

        self._id_58A6[var_3 + 1] = var_1;
    }
}

_id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = undefined;

    foreach ( var_11 in self._id_58A6 )
    {
        if ( var_11.name == var_0 )
        {
            if ( var_11._id_92B2 == var_1 && var_11._id_6FBE == var_3 )
                return;

            var_9 = var_11;
            break;
        }
    }

    if ( !isdefined( var_9 ) )
    {
        var_9 = spawnstruct();
        self._id_58A6[self._id_58A6.size] = var_9;
    }

    var_9.name = var_0;
    var_9._id_92B2 = var_1;
    var_9.time = var_2;
    var_9._id_0843 = gettime();
    var_9._id_6FBE = var_3;
    var_9._id_8534 = var_4;
    var_9._id_8497 = var_5;
    var_9._id_35F9 = var_6;
    var_9._id_35FA = var_7;
    var_9.hidewhenindemo = var_8;
    _id_8896();
}

_id_73BB( var_0 )
{
    if ( isdefined( self._id_58A6 ) )
    {
        for ( var_1 = self._id_58A6.size; var_1 > 0; var_1-- )
        {
            if ( self._id_58A6[var_1 - 1].name != var_0 )
                continue;

            var_2 = self._id_58A6[var_1 - 1];

            for ( var_3 = var_1; var_3 < self._id_58A6.size; var_3++ )
            {
                if ( isdefined( self._id_58A6[var_3] ) )
                    self._id_58A6[var_3 - 1] = self._id_58A6[var_3];
            }

            self._id_58A6[self._id_58A6.size - 1] = undefined;
        }

        _id_8896();
    }
}

_id_4011()
{
    return self._id_58A6[0];
}

_id_7FA5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0.85;

    if ( !isdefined( var_7 ) )
        var_7 = 3.0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    _id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    _id_9B31();
}

_id_9B31()
{
    if ( !isdefined( self._id_58A4 ) )
        return;

    var_0 = _id_4011();

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_58A4 ) && isdefined( self._id_58AB ) )
        {
            self._id_58A4.alpha = 0;
            self._id_58AB.alpha = 0;
        }
    }
    else
    {
        self._id_58A4 settext( var_0._id_92B2 );
        self._id_58A4.alpha = 0.85;
        self._id_58AB.alpha = 1;
        self._id_58A4.hidewhenindemo = var_0.hidewhenindemo;

        if ( var_0._id_8497 )
        {
            self._id_58A4 fadeovertime( min( var_0._id_35FA, 60 ) );
            self._id_58A4.alpha = var_0._id_35F9;
        }

        if ( var_0.time > 0 && var_0._id_8534 )
            self._id_58AB settimer( max( var_0.time - ( gettime() - var_0._id_0843 ) / 1000, 0.1 ) );
        else
        {
            if ( var_0.time > 0 && !var_0._id_8534 )
            {
                self._id_58AB settext( "" );
                self._id_58A4 fadeovertime( min( var_0.time, 60 ) );
                self._id_58A4.alpha = 0;
                thread _id_1EF8( var_0 );
                thread _id_1EDF( var_0 );
                return;
            }

            self._id_58AB settext( "" );
        }
    }
}

_id_1EF8( var_0 )
{
    self notify( "message_cleared" );
    self endon( "message_cleared" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_1EF5( var_0.name );
}

_id_1EDF( var_0 )
{
    wait(var_0.time);
    _id_1EF5( var_0.name );
    self notify( "message_cleared" );
}

_id_1EF5( var_0 )
{
    _id_73BB( var_0 );
    _id_9B31();
}

_id_1EF6()
{
    for ( var_0 = 0; var_0 < self._id_58A6.size; var_0++ )
        self._id_58A6[var_0] = undefined;

    if ( !isdefined( self._id_58A4 ) )
        return;

    _id_9B31();
}

_id_6FB5( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3.team != var_1 )
            continue;

        var_3 clientiprintln( var_0 );
    }
}

_id_6FAD( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3.pers["team"] ) && var_3.pers["team"] == var_1 )
            var_3 clientiprintlnbold( var_0 );
    }
}

_id_6FAE( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 clientiprintlnbold( var_0, var_2 );
    }
}

_id_6FB6( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 clientiprintln( var_0, var_2 );
    }
}

_id_6FB4( var_0, var_1 )
{
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == var_1 )
                var_2[var_3] clientiprintln( var_0 );

            continue;
        }

        var_2[var_3] clientiprintln( var_0 );
    }
}

_id_6FAA( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = isdefined( var_4 );
    var_8 = 0;

    if ( isdefined( var_5 ) )
        var_8 = 1;

    if ( !var_7 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 && isdefined( var_2 ) )
                {
                    var_10 clientiprintln( var_2, var_6 );
                    continue;
                }

                if ( var_11 == var_1 && isdefined( var_3 ) )
                    var_10 clientiprintln( var_3, var_6 );
            }
        }
    }
    else if ( var_8 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];

            if ( var_10 issecondarysplitscreenplayer() )
                continue;

            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 clientiprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 clientiprintln( var_3, var_6 );

                    var_10 playlocalsound( var_5 );
                }
            }
        }
    }
    else
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];

            if ( var_10 issecondarysplitscreenplayer() )
                continue;

            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 clientiprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 clientiprintln( var_3, var_6 );
                }
            }
        }
    }
}

_id_6FAC( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( var_4.team != var_0 )
            continue;

        var_4 _id_6FAB( var_1, var_2 );
    }
}

_id_6FAB( var_0, var_1 )
{
    self clientiprintln( var_0 );
    self playlocalsound( var_1 );
}

_id_0618( var_0 )
{
    if ( level.splitscreen && self getentitynumber() != 0 )
        return;

    self playlocalsound( var_0 );
}

_id_2FD0( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarint( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_2FCF( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarfloat( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_69C5( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playsoundatpos( self gettagorigin( var_1 ), var_0 );
    else
        playsoundatpos( self.origin, var_0 );
}

getotherteam( var_0 )
{
    if ( level.multiteambased )
    {

    }

    if ( var_0 == "allies" )
        return "axis";
    else if ( var_0 == "axis" )
        return "allies";
    else
        return "none";
}

_id_9F85( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    wait(var_0);
}

_id_4DF9( var_0 )
{
    if ( !isdefined( self.pers[var_0] ) )
        self.pers[var_0] = 0;
}

_id_4081( var_0 )
{
    return self.pers[var_0];
}

_id_4C2E( var_0, var_1 )
{
    if ( isdefined( self ) && isdefined( self.pers ) && isdefined( self.pers[var_0] ) )
    {
        self.pers[var_0] += var_1;
        maps\mp\gametypes\_persistence::_id_8D50( var_0, var_1 );
    }
}

_id_7FE1( var_0, var_1 )
{
    self.pers[var_0] = var_1;
}

_id_4E00( var_0, var_1 )
{
    if ( !isdefined( self._id_8D77["stats_" + var_0] ) )
    {
        if ( !isdefined( var_1 ) )
            var_1 = 0;

        self._id_8D77["stats_" + var_0] = spawnstruct();
        self._id_8D77["stats_" + var_0]._id_9C53 = var_1;

        if ( _id_7139() )
            self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "awards", var_0, 0 );
    }
}

_id_4C2F( var_0, var_1 )
{
    if ( isagent( self ) )
        return;

    var_2 = self._id_8D77["stats_" + var_0];
    var_2._id_9C53 += var_1;
}

_id_7FEA( var_0, var_1 )
{
    var_2 = self._id_8D77["stats_" + var_0];
    var_2._id_9C53 = var_1;
    var_2.time = gettime();
}

_id_408F( var_0 )
{
    return self._id_8D77["stats_" + var_0]._id_9C53;
}

_id_4090( var_0 )
{
    return self._id_8D77["stats_" + var_0].time;
}

_id_7FEB( var_0, var_1 )
{
    var_2 = _id_408F( var_0 );

    if ( var_1 > var_2 )
        _id_7FEA( var_0, var_1 );
}

_id_7FEC( var_0, var_1 )
{
    var_2 = _id_408F( var_0 );

    if ( var_1 < var_2 )
        _id_7FEA( var_0, var_1 );
}

_id_9B47( var_0, var_1, var_2 )
{
    if ( !_id_7139() )
        return;

    var_3 = maps\mp\gametypes\_persistence::_id_8D68( var_1 );
    var_4 = maps\mp\gametypes\_persistence::_id_8D68( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::_id_8D78( var_0, int( var_3 * 1000 / var_4 ) );
}

_id_9B48( var_0, var_1, var_2 )
{
    if ( !_id_7139() )
        return;

    var_3 = maps\mp\gametypes\_persistence::_id_8D69( var_1 );
    var_4 = maps\mp\gametypes\_persistence::_id_8D69( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::_id_8D79( var_0, int( var_3 * 1000 / var_4 ) );
}

_id_A0F4( var_0 )
{
    if ( level._id_55DC == gettime() )
    {
        if ( isdefined( var_0 ) && var_0 )
        {
            while ( level._id_55DC == gettime() )
                wait 0.05;
        }
        else
        {
            wait 0.05;

            if ( level._id_55DC == gettime() )
            {
                wait 0.05;

                if ( level._id_55DC == gettime() )
                {
                    wait 0.05;

                    if ( level._id_55DC == gettime() )
                        wait 0.05;
                }
            }
        }
    }

    level._id_55DC = gettime();
}

_id_A03E( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
}

_id_A03D( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
            self endon( var_3 );
    }

    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);
}

_id_5100( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_564B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( var_0 == "null" )
        return;

    if ( !isdefined( var_1 ) )
        _id_5650( var_0, "allies", var_0, "axis", var_2, var_3, var_4 );
    else
    {
        if ( isdefined( var_3 ) )
        {
            for ( var_5 = 0; var_5 < level.players.size; var_5++ )
            {
                var_6 = level.players[var_5];

                if ( isdefined( var_6.pers["team"] ) && var_6.pers["team"] == var_1 && !_id_5100( var_6, var_3 ) )
                {
                    if ( var_6 issecondarysplitscreenplayer() )
                        continue;

                    var_6 _id_5655( var_0, var_2, undefined, var_4 );
                }
            }

            return;
        }

        for ( var_5 = 0; var_5 < level.players.size; var_5++ )
        {
            var_6 = level.players[var_5];

            if ( isdefined( var_6.pers["team"] ) && var_6.pers["team"] == var_1 )
            {
                if ( var_6 issecondarysplitscreenplayer() )
                    continue;

                var_6 _id_5655( var_0, var_2, undefined, var_4 );
            }
        }
    }
}

_id_5650( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( level.splitscreen )
        return;

    if ( isdefined( var_5 ) )
    {
        for ( var_7 = 0; var_7 < level.players.size; var_7++ )
        {
            var_8 = level.players[var_7];
            var_9 = var_8.pers["team"];

            if ( !isdefined( var_9 ) )
                continue;

            if ( _id_5100( var_8, var_5 ) )
                continue;

            if ( var_8 issecondarysplitscreenplayer() )
                continue;

            if ( var_9 == var_1 )
            {
                var_8 _id_5655( var_0, var_4, undefined, var_6 );
                continue;
            }

            if ( var_9 == var_3 )
                var_8 _id_5655( var_2, var_4, undefined, var_6 );
        }
    }
    else
    {
        for ( var_7 = 0; var_7 < level.players.size; var_7++ )
        {
            var_8 = level.players[var_7];
            var_9 = var_8.pers["team"];

            if ( !isdefined( var_9 ) )
                continue;

            if ( var_8 issecondarysplitscreenplayer() )
                continue;

            if ( var_9 == var_1 )
            {
                var_8 _id_5655( var_0, var_4, undefined, var_6 );
                continue;
            }

            if ( var_9 == var_3 )
                var_8 _id_5655( var_2, var_4, undefined, var_6 );
        }
    }
}

_id_5658( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    foreach ( var_5 in var_1 )
        var_5 _id_5655( var_0, var_2, undefined, var_3 );
}

_id_5655( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_4 = self.pers["team"];

    if ( isdefined( level.ishorde ) && issecondarysplitscreenplayer() )
        return;

    if ( isdefined( level._id_0C91 ) && level._id_0C91 )
        return;

    if ( !isdefined( var_4 ) )
        return;

    if ( var_4 != "allies" && var_4 != "axis" )
        return;

    if ( issecondarysplitscreenplayer() )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0.0, 0.0, 0.0 );

    if ( isdefined( var_1 ) )
    {
        if ( self._id_5651 == var_1 )
        {
            if ( var_2 )
            {
                if ( self._id_564F != "" )
                    self stoplocalsound( self._id_564F );

                thread _id_5657( var_0, var_4, var_3 );
            }

            return;
        }

        var_5 = isdefined( self._id_5652[var_1] );
        self._id_5652[var_1] = var_0;
        var_0 = var_1;

        if ( var_5 )
            return;
    }

    if ( self._id_564F == "" )
        thread _id_5657( var_0, var_4, var_3 );
    else
    {
        self._id_5659[self._id_5659.size] = var_0;
        self._id_5654[self._id_5654.size] = var_3;
    }
}

_id_564E( var_0, var_1 )
{
    var_2 = 2;

    if ( isdefined( game["dialog"]["lockouts"][var_0] ) )
    {
        var_2 = game["dialog"]["lockouts"][var_0];

        if ( var_2 == 0 )
            return;
    }

    if ( !isdefined( var_1._id_071B ) )
        var_1._id_071B = [];

    var_1._id_071B[var_0] = 1;
    thread _id_564D( var_0, var_1, var_2 );
}

_id_564D( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    wait(var_2);
    var_1._id_071B[var_0] = undefined;
}

_id_564C( var_0, var_1 )
{
    if ( isdefined( var_1._id_071B ) )
    {
        if ( isdefined( var_1._id_071B[var_0] ) )
        {
            if ( isdefined( var_1._id_071B[var_0] == 1 ) )
                return 1;
        }
    }

    return 0;
}

_id_5657( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self notify( "playLeaderDialogOnPlayer" );
    self endon( "playLeaderDialogOnPlayer" );

    if ( isdefined( self._id_5652[var_0] ) )
    {
        var_3 = var_0;
        var_0 = self._id_5652[var_3];
        self._id_5652[var_3] = undefined;
        self._id_5651 = var_3;
    }

    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    if ( isai( self ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["leader_dialog"] ) )
        self [[ level.bot_funcs["leader_dialog"] ]]( var_0, var_2 );

    if ( issubstr( game["dialog"][var_0], "null" ) )
        return;

    if ( isdefined( level.ishorde ) && level.ishorde )
    {
        if ( issubstr( var_0, "coop_gdn" ) )
            var_4 = var_0;
        else
            var_4 = "AT_anr0_" + game["dialog"][var_0];
    }
    else
        var_4 = game["voice"][var_1] + game["dialog"][var_0];

    var_5 = var_4;

    if ( level.classicgamemode )
        var_4 += "_cl";

    if ( soundexists( var_4 ) )
    {
        if ( _id_564C( game["dialog"][var_0], self ) )
            return;

        self._id_564F = var_4;
        self _meth_8510( var_4 );
        _id_564E( game["dialog"][var_0], self );
    }
    else if ( level.classicgamemode )
    {
        if ( soundexists( var_5 ) )
        {

        }
        else
        {

        }
    }
    else
    {

    }

    wait 2.0;
    self._id_5653 = "";
    self._id_564F = "";
    self._id_5651 = "";

    if ( self._id_5659.size > 0 )
    {
        var_6 = self._id_5659[0];
        var_7 = self._id_5654[0];

        for ( var_8 = 1; var_8 < self._id_5659.size; var_8++ )
            self._id_5659[var_8 - 1] = self._id_5659[var_8];

        for ( var_8 = 1; var_8 < self._id_5654.size; var_8++ )
            self._id_5654[var_8 - 1] = self._id_5654[var_8];

        self._id_5659[var_8 - 1] = undefined;
        self._id_5654[var_8 - 1] = undefined;
        thread _id_5657( var_6, var_1, var_7 );
    }
}

_id_4043()
{
    for ( var_0 = 0; var_0 < self._id_5659.size; var_0++ )
    {
        if ( issubstr( self._id_5659[var_0], "losing" ) )
        {
            if ( self.team == "allies" )
            {
                if ( issubstr( level._id_1216, self._id_5659[var_0] ) )
                    return self._id_5659[var_0];
                else
                    common_scripts\utility::_id_0CF6( self._id_5659, self._id_5659[var_0] );
            }
            else if ( issubstr( level._id_0A7D, self._id_5659[var_0] ) )
                return self._id_5659[var_0];
            else
                common_scripts\utility::_id_0CF6( self._id_5659, self._id_5659[var_0] );

            continue;
        }

        return level._id_0A7D[self._id_5659];
    }
}

_id_657F()
{
    self endon( "disconnect" );
    var_0 = [];
    var_0 = self._id_5659;

    for ( var_1 = 0; var_1 < self._id_5659.size; var_1++ )
    {
        if ( issubstr( self._id_5659[var_1], "losing" ) )
        {
            for ( var_2 = var_1; var_2 >= 0; var_2-- )
            {
                if ( !issubstr( self._id_5659[var_2], "losing" ) && var_2 != 0 )
                    continue;

                if ( var_2 != var_1 )
                {
                    _id_0D1D( var_0, self._id_5659[var_1], var_2 );
                    common_scripts\utility::_id_0CF6( var_0, self._id_5659[var_1] );
                    break;
                }
            }
        }
    }

    self._id_5659 = var_0;
}

_id_38F6()
{
    self._id_5652 = [];
    self._id_5659 = [];
    self._id_564F = "";
    self._id_2519 = "";
    self notify( "flush_dialog" );
}

_id_38F7( var_0 )
{
    foreach ( var_2 in level.players )
        var_2 _id_38F8( var_0 );
}

_id_0D1E( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    while ( var_2 < var_0.size )
    {
        if ( var_0[var_2] == var_1 )
        {
            var_2++;
            continue;
        }

        if ( var_2 != var_3 )
            var_0[var_3] = var_0[var_2];

        var_2++;
        var_3++;
    }

    while ( var_3 < var_0.size )
    {
        var_0[var_3] = undefined;
        var_3++;
    }
}

_id_38F8( var_0 )
{
    self._id_5652[var_0] = undefined;
    _id_0D1E( self._id_5659, var_0 );

    if ( self._id_5659.size == 0 )
        _id_38F6();
}

_id_9B33()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "g_scriptMainMenu", game["menu_team"] );
    else
        self setclientdvar( "g_scriptMainMenu", game["menu_class_" + self.pers["team"]] );
}

_id_9B42()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "cg_objectiveText", "" );
    else
    {
        if ( _id_415E( "scorelimit" ) > 0 && !_id_5160() )
        {
            if ( level.splitscreen )
            {
                self setclientdvar( "cg_objectiveText", _id_405B( self.pers["team"] ) );
                return;
            }

            self setclientdvar( "cg_objectiveText", _id_405B( self.pers["team"] ), _id_415E( "scorelimit" ) );
            return;
            return;
        }

        self setclientdvar( "cg_objectiveText", _id_405C( self.pers["team"] ) );
    }
}

setobjectivetext( var_0, var_1 )
{
    game["strings"]["objective_" + var_0] = var_1;
}

setobjectivescoretext( var_0, var_1 )
{
    game["strings"]["objective_score_" + var_0] = var_1;
}

setobjectivehinttext( var_0, var_1 )
{
    game["strings"]["objective_hint_" + var_0] = var_1;
}

_id_405C( var_0 )
{
    return game["strings"]["objective_" + var_0];
}

_id_405B( var_0 )
{
    return game["strings"]["objective_score_" + var_0];
}

_id_405A( var_0 )
{
    return game["strings"]["objective_hint_" + var_0];
}

_id_412C()
{
    if ( !isdefined( level._id_8D41 ) || !isdefined( level._id_2B30 ) )
        return 0;

    if ( level._id_937B )
        return level._id_937A - level._id_8D41 - level._id_2B30;
    else
        return gettime() - level._id_8D41 - level._id_2B30;
}

getunpausedtimepassedraw()
{
    if ( !isdefined( level.matchdurationstarttime ) )
        return 0;

    return gettime() - level.matchdurationstarttime;
}

getgametimepassedms()
{
    var_0 = getmatchdata( "gameLengthSeconds" ) * 1000;
    var_0 += getunpausedtimepassedraw();
    return var_0;
}

getgametimepassedseconds()
{
    var_0 = getgametimepassedms();
    var_1 = int( var_0 / 1000 );
    return var_1;
}

_id_4130()
{
    return _id_412C() / _id_412B() * 60 * 1000 * 100;
}

_id_40C7()
{
    return _id_412C() / 1000;
}

_id_4024()
{
    return _id_40C7() / 60;
}

_id_4129()
{
    return _id_21A6( gettime() );
}

_id_412D()
{
    return _id_21A6( _id_412C() );
}

_id_412E()
{
    var_0 = getgametimepassedms();
    return _id_21A6( var_0 );
}

_id_21A6( var_0 )
{
    return _id_1E29( var_0 / 100 );
}

_id_1E29( var_0 )
{
    var_0 = int( var_0 );

    if ( var_0 > 32767 )
        var_0 = 32767;

    if ( var_0 < -32768 )
        var_0 = -32768;

    return var_0;
}

_id_1E28( var_0 )
{
    var_0 = int( var_0 );

    if ( var_0 > 255 )
        var_0 = 255;

    if ( var_0 < 0 )
        var_0 = 0;

    return var_0;
}

_id_1EF2()
{
    self.forcespectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
}

_id_5129()
{
    return self.spectatekillcam;
}

_id_51E8( var_0 )
{
    return isdefined( var_0 ) && var_0 != "";
}

_id_4150( var_0, var_1, var_2 )
{
    if ( var_0 > var_2 )
        return var_2;
    else if ( var_0 < var_1 )
        return var_1;
    else
        return var_0;
}

_id_584D()
{
    if ( !isdefined( self.pers["summary"] ) )
        return;

    if ( isai( self ) )
        return;

    var_0 = 0;

    if ( isdefined( self.timeplayed["total"] ) )
        var_0 = self.timeplayed["total"];

    reconevent( "script_EarnedXP: totalXP %d, timeplayed %d, score %d, challenge %d, match %d, misc %d, gamemode %s", self.pers["summary"]["xp"], var_0, self.pers["summary"]["score"], self.pers["summary"]["challenge"], self.pers["summary"]["match"], self.pers["summary"]["misc"], level.gametype );
}

registerroundswitchdvar( var_0, var_1, var_2, var_3 )
{
    _id_72FD( "roundswitch", var_1 );
    var_0 = "scr_" + var_0 + "_roundswitch";
    level._id_765B = var_0;
    level._id_765D = var_2;
    level._id_765C = var_3;
    level._id_765A = getdvarint( var_0, var_1 );

    if ( level._id_765A < var_2 )
        level._id_765A = var_2;
    else if ( level._id_765A > var_3 )
        level._id_765A = var_3;
}

registerroundlimitdvar( var_0, var_1 )
{
    _id_72FD( "roundlimit", var_1 );
}

_id_72F5( var_0, var_1 )
{
    _id_72FD( "numTeams", var_1 );
}

registerwinlimitdvar( var_0, var_1 )
{
    _id_72FD( "winlimit", var_1 );
}

registerscorelimitdvar( var_0, var_1 )
{
    _id_72FD( "scorelimit", var_1 );
}

registertimelimitdvar( var_0, var_1 )
{
    _id_72FC( "timelimit", var_1 );
    setdvar( "ui_timelimit", _id_412B() );
}

registerhalftimedvar( var_0, var_1 )
{
    _id_72FD( "halftime", var_1 );
    setdvar( "ui_halftime", _id_3FC0() );
}

registernumlivesdvar( var_0, var_1 )
{
    _id_72FD( "numlives", var_1 );
}

_id_7FD9( var_0 )
{
    setdvar( "overtimeTimeLimit", var_0 );
}

_id_3D27( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 1;
    var_2._id_50A8 = 0;
    var_2.entity = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D29( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2._id_519C = 1;
    var_2.entity = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D24( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2.entity = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D26( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2.entity = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D28( var_0 )
{
    return var_0.origin + ( 0.0, 0.0, 32.0 );
}

_id_40E7()
{
    if ( self getstance() == "crouch" )
        var_0 = self.origin + ( 0.0, 0.0, 24.0 );
    else if ( self getstance() == "prone" )
        var_0 = self.origin + ( 0.0, 0.0, 10.0 );
    else
        var_0 = self.origin + ( 0.0, 0.0, 32.0 );

    return var_0;
}

_id_3D25( var_0 )
{
    return var_0.origin;
}

_id_3F75( var_0 )
{
    var_1 = getdvar( var_0 );

    if ( var_1 == "" )
        return ( 0.0, 0.0, 0.0 );

    var_2 = strtok( var_1, " " );

    if ( var_2.size < 3 )
        return ( 0.0, 0.0, 0.0 );

    setdvar( "tempR", var_2[0] );
    setdvar( "tempG", var_2[1] );
    setdvar( "tempB", var_2[2] );
    return ( getdvarfloat( "tempR" ), getdvarfloat( "tempG" ), getdvarfloat( "tempB" ) );
}

_id_8F5C( var_0, var_1 )
{
    if ( var_0.size <= var_1.size )
        return var_0;

    if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
        return getsubstr( var_0, 0, var_0.size - var_1.size );

    return var_0;
}

_id_0671( var_0 )
{
    var_1 = self getweaponslistall();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            continue;
        else
            self takeweapon( var_3 );
    }
}

_id_7816()
{
    var_0 = spawnstruct();
    var_0._id_6343 = self getoffhandsecondaryclass();
    var_0._id_06F3 = self._id_7811;
    var_0._id_252D = self getcurrentweapon();
    var_1 = self getweaponslistall();
    var_0._id_A2E6 = [];

    foreach ( var_3 in var_1 )
    {
        if ( weaponinventorytype( var_3 ) == "exclusive" )
            continue;

        if ( weaponinventorytype( var_3 ) == "altmode" )
            continue;

        var_4 = spawnstruct();
        var_4.name = var_3;
        var_4._id_1F99 = self getweaponammoclip( var_3, "right" );
        var_4._id_1F98 = self getweaponammoclip( var_3, "left" );
        var_4._id_8E5E = self getweaponammostock( var_3 );

        if ( isdefined( self.throwinggrenade ) && self.throwinggrenade == var_3 )
            var_4._id_8E5E--;

        var_0._id_A2E6[var_0._id_A2E6.size] = var_4;
    }

    self._id_7ABC = var_0;
}

_id_74A7()
{
    var_0 = self._id_7ABC;
    self setoffhandsecondaryclass( var_0._id_6343 );

    foreach ( var_2 in var_0._id_A2E6 )
    {
        _id_05C0( var_2.name, int( tablelookup( "mp/camoTable.csv", 1, self._id_57E0, 0 ) ) );
        self setweaponammoclip( var_2.name, var_2._id_1F99, "right" );

        if ( issubstr( var_2.name, "akimbo" ) )
            self setweaponammoclip( var_2.name, var_2._id_1F98, "left" );

        self setweaponammostock( var_2.name, var_2._id_8E5E );
    }

    foreach ( var_6, var_5 in var_0._id_06F3 )
        _id_0634( var_6, var_5.type, var_5.item );

    if ( self getcurrentweapon() == "none" )
    {
        var_2 = var_0._id_252D;

        if ( var_2 == "none" )
            var_2 = common_scripts\utility::_id_3FFD();

        self setspawnweapon( var_2 );
        self switchtoweapon( var_2 );
    }
}

_id_7F6B( var_0 )
{
    self.extrascore0 = var_0;
    _id_7FE1( "extrascore0", var_0 );
}

_id_7F6C( var_0 )
{
    self.extrascore1 = var_0;
    _id_7FE1( "extrascore1", var_0 );
}

_id_0634( var_0, var_1, var_2 )
{
    self._id_7811[var_0].type = var_1;
    self._id_7811[var_0].item = var_2;
    self setactionslot( var_0, var_1, var_2 );
}

_id_510A( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return 1;

    return 0;
}

_id_72FD( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvarint( var_2, var_1 );
    level._id_A214[var_2].type = "int";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_72FC( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvarfloat( var_2, var_1 );
    level._id_A214[var_2].type = "float";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_72FB( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvar( var_2, var_1 );
    level._id_A214[var_2].type = "string";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_7FD8( var_0, var_1 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;
    level._id_662C[var_0] = var_1;
}

_id_415E( var_0 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( isdefined( level._id_662C ) && isdefined( level._id_662C[var_0] ) )
        return level._id_662C[var_0];

    return level._id_A214[var_0]._id_9C53;
}

_id_9BA3()
{
    while ( game["state"] == "playing" )
    {
        var_0 = getarraykeys( level._id_A214 );

        foreach ( var_2 in var_0 )
        {
            if ( level._id_A214[var_2].type == "string" )
                var_3 = _id_409E( var_2, level._id_A214[var_2]._id_9C53 );
            else if ( level._id_A214[var_2].type == "float" )
                var_3 = _id_3F9D( var_2, level._id_A214[var_2]._id_9C53 );
            else
                var_3 = _id_3FDB( var_2, level._id_A214[var_2]._id_9C53 );

            if ( var_3 != level._id_A214[var_2]._id_9C53 )
            {
                level._id_A214[var_2]._id_9C53 = var_3;
                level notify( level._id_A214[var_2]._id_6237, var_3 );
            }
        }

        wait 1.0;
    }
}

_id_5194()
{
    if ( !level.teambased )
        return 0;

    if ( _id_415E( "winlimit" ) != 1 && _id_415E( "roundlimit" ) != 1 )
        return 1;

    return 0;
}

_id_5106()
{
    if ( !level.teambased )
        return 1;

    if ( _id_415E( "roundlimit" ) > 1 && game["roundsPlayed"] == 0 )
        return 1;

    if ( _id_415E( "winlimit" ) > 1 && game["roundsWon"]["allies"] == 0 && game["roundsWon"]["axis"] == 0 )
        return 1;

    return 0;
}

_id_5141()
{
    if ( !level.teambased )
        return 1;

    if ( _id_415E( "roundlimit" ) > 1 && game["roundsPlayed"] >= _id_415E( "roundlimit" ) - 1 )
        return 1;

    if ( _id_415E( "winlimit" ) > 1 && game["roundsWon"]["allies"] >= _id_415E( "winlimit" ) - 1 && game["roundsWon"]["axis"] >= _id_415E( "winlimit" ) - 1 )
        return 1;

    return 0;
}

_id_A1CC()
{
    if ( !level.teambased )
        return 1;

    if ( isdefined( level._id_64BB ) )
        return 0;

    if ( _id_415E( "winlimit" ) == 1 && _id_492B() )
        return 1;

    if ( _id_415E( "roundlimit" ) == 1 )
        return 1;

    if ( isdefined( level.overridewasonlyround ) )
    {
        if ( [[ level.overridewasonlyround ]]() )
            return 1;
    }

    return 0;
}

_id_A1CA()
{
    if ( level._id_39B8 )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( _id_4925() || _id_492B() )
        return 1;

    return 0;
}

_id_4925()
{
    if ( _id_415E( "roundlimit" ) <= 0 )
        return 0;

    return game["roundsPlayed"] >= _id_415E( "roundlimit" );
}

_id_4928()
{
    if ( _id_5160() )
        return 0;

    if ( _id_415E( "scorelimit" ) <= 0 )
        return 0;

    if ( level.teambased )
    {
        if ( game["teamScores"]["allies"] >= _id_415E( "scorelimit" ) || game["teamScores"]["axis"] >= _id_415E( "scorelimit" ) )
            return 1;
    }
    else
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            var_1 = level.players[var_0];

            if ( isdefined( var_1.score ) && var_1.score >= _id_415E( "scorelimit" ) )
                return 1;
        }
    }

    return 0;
}

_id_492B()
{
    if ( _id_415E( "winlimit" ) <= 0 )
        return 0;

    if ( !level.teambased )
        return 1;

    if ( _id_40BB( "allies" ) >= _id_415E( "winlimit" ) || _id_40BB( "axis" ) >= _id_415E( "winlimit" ) )
        return 1;

    return 0;
}

_id_40C2()
{
    if ( _id_5194() )
    {
        if ( _id_415E( "roundlimit" ) )
            return _id_415E( "roundlimit" );
        else
            return _id_415E( "winlimit" );
    }
    else
        return _id_415E( "scorelimit" );
}

_id_40BB( var_0 )
{
    return game["roundsWon"][var_0];
}

_id_5160()
{
    return level._id_62F8;
}

_id_412B()
{
    if ( _id_4E3F() )
    {
        var_0 = float( getdvar( "overtimeTimeLimit" ) );

        if ( !isdefined( var_0 ) )
            var_0 = 1;

        return var_0;
    }

    return _id_415E( "timelimit" );
}

_id_3FC0()
{
    if ( _id_4E3F() )
        return 0;

    return _id_415E( "halftime" );
}

_id_4E3F()
{
    return isdefined( game["status"] ) && _id_516C( game["status"] );
}

_id_516C( var_0 )
{
    return var_0 == "overtime" || var_0 == "overtime_halftime";
}

_id_3BE2()
{
    if ( isdefined( level._id_3BE2 ) )
        return level._id_3BE2;

    if ( level.teambased )
        return level._id_4745["axis"] && level._id_4745["allies"];

    return level._id_5A4D > 1;
}

_id_3F0D( var_0 )
{
    var_1 = ( 0.0, 0.0, 0.0 );

    if ( !var_0.size )
        return undefined;

    foreach ( var_3 in var_0 )
        var_1 += var_3.origin;

    var_5 = int( var_1[0] / var_0.size );
    var_6 = int( var_1[1] / var_0.size );
    var_7 = int( var_1[2] / var_0.size );
    var_1 = ( var_5, var_6, var_7 );
    return var_1;
}

_id_4008( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( level.teambased && isdefined( var_0 ) )
        {
            if ( var_0 == var_3.pers["team"] )
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_834D( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 0;

    self.usingremote = var_0;
    common_scripts\utility::_id_0585();
    self notify( "using_remote" );
}

_id_40B7()
{
    return self.usingremote;
}

_id_3A32( var_0 )
{
    if ( isdefined( level._id_4A39 ) || _id_5092( self.phfrozen ) )
    {
        self freezecontrols( 1 );
        return;
    }

    self freezecontrols( var_0 );
    self._id_219B = var_0;
}

_id_3A33( var_0, var_1 )
{
    wait(var_1);

    if ( isdefined( self ) )
        _id_3A32( var_0 );
}

_id_1F0D()
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 1;

    self.usingremote = undefined;
    common_scripts\utility::_id_0593();
    var_0 = self getcurrentweapon();

    if ( var_0 == "none" || iskillstreakweapon( var_0 ) )
        self switchtoweapon( common_scripts\utility::_id_3FFD() );

    _id_3A32( 0 );
    _id_6D2F();
    self notify( "stopped_using_remote" );
}

_id_6D2E()
{
    self setclientomnvar( "ui_killstreak_remote", 1 );
}

_id_6D2F()
{
    self setclientomnvar( "ui_killstreak_remote", 0 );
}

_id_3EC4()
{
    if ( isdefined( self._id_9A21 ) )
    {
        if ( self._id_9A21 == "shallow" && isdefined( level._id_83B2 ) )
            return level._id_83B2;

        if ( self._id_9A21 == "deep" && isdefined( level._id_2764 ) )
            return level._id_2764;

        if ( self._id_9A21 != "none" && isdefined( level._id_83B2 ) )
            return level._id_83B2;
    }

    return "none";
}

_id_51E3()
{
    return isdefined( self.usingremote );
}

_id_512B()
{
    return isdefined( self._id_7329 );
}

isrocketcorpse()
{
    return isdefined( self.isrocketcorpse ) && self.isrocketcorpse;
}

_id_7098( var_0 )
{
    if ( !isdefined( level._id_709B ) )
        level._id_709B = [];

    level._id_709B[var_0] = [];
}

_id_7096( var_0, var_1 )
{
    level._id_709B[var_0][level._id_709B[var_0].size] = var_1;
}

_id_709A( var_0 )
{
    var_1 = undefined;
    var_2 = [];

    foreach ( var_4 in level._id_709B[var_0] )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    level._id_709B[var_0] = var_2;
    return var_1;
}

_id_05C0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    var_3 = 0;

    if ( isdefined( self.pers["toggleScopeStates"] ) && isdefined( self.pers["toggleScopeStates"][var_0] ) )
        var_3 = self.pers["toggleScopeStates"][var_0];

    if ( issubstr( var_0, "akimbo" ) || isdefined( var_2 ) && var_2 == 1 )
    {
        if ( isagent( self ) )
            self giveweapon( var_0, var_1, 1, -1, 0 );
        else
            self giveweapon( var_0, var_1, 1, -1, 0, self, var_3 );
    }
    else if ( isagent( self ) )
        self giveweapon( var_0, var_1, 0, -1, 0 );
    else
        self giveweapon( var_0, var_1, 0, -1, 0, self, var_3 );
}

_hasperk( var_0 )
{
    if ( isdefined( self.perks ) && isdefined( self.perks[var_0] ) )
        return 1;

    return 0;
}

_id_41F8( var_0, var_1, var_2 )
{
    _id_063C( var_0, var_1, var_2 );
}

_id_063C( var_0, var_1, var_2 )
{
    self.perks[var_0] = 1;
    self._id_67D2[var_0] = var_0;
    self._id_67D4[var_0] = var_1;

    if ( isdefined( level._id_67D1[var_0] ) )
        self thread [[ level._id_67D1[var_0] ]]();

    var_3 = _id_8F5C( var_0, "_lefthand" );

    if ( isdefined( var_2 ) )
        self setperk( var_0, !isdefined( level._id_7B45[var_3] ), var_1, var_2 );
    else
        self setperk( var_0, !isdefined( level._id_7B45[var_3] ), var_1 );
}

_unsetperk( var_0 )
{
    self.perks[var_0] = undefined;
    self._id_67D2[var_0] = undefined;
    self._id_67D4[var_0] = undefined;
    self._id_67D3[var_0] = undefined;

    if ( isdefined( level._id_67D5[var_0] ) )
        self thread [[ level._id_67D5[var_0] ]]();

    var_1 = _id_8F5C( var_0, "_lefthand" );
    self unsetperk( var_0, !isdefined( level._id_7B45[var_1] ) );
}

_id_056B()
{
    foreach ( var_2, var_1 in self.perks )
    {
        if ( isdefined( level._id_67D5[var_2] ) )
            self [[ level._id_67D5[var_2] ]]();
    }

    self.perks = [];
    self._id_67D2 = [];
    self._id_67D4 = [];
    self._id_67D3 = [];
    self.perkscustom = [];
    self clearperks();
}

_id_1AC8( var_0 )
{
    return _id_0562( var_0 );
}

_id_0562( var_0 )
{
    if ( !isdefined( level._id_06B6 ) || !isdefined( level._id_06B6[var_0] ) )
        return 1;

    return self [[ level._id_06B6[var_0] ]]();
}

_id_41DC( var_0, var_1 )
{
    _id_0633( var_0, var_1 );
}

_id_0633( var_0, var_1 )
{
    self._id_06B5[var_0] = 1;

    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B8[var_0] ) )
            self thread [[ level._id_06B8[var_0] ]]();
    }

    self setperk( var_0, !isdefined( level._id_7B28[var_0] ), var_1 );
}

_id_067A( var_0 )
{
    self._id_06B5[var_0] = undefined;

    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B9[var_0] ) )
            self thread [[ level._id_06B9[var_0] ]]();
    }

    self unsetperk( var_0, !isdefined( level._id_7B28[var_0] ) );
}

_id_0566()
{
    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B9[self.pers["ability"]] ) )
            self [[ level._id_06B9[self.pers["ability"]] ]]();
    }

    self._id_06B5 = [];
    self clearperks();
}

_id_05CA( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
    {
        if ( isdefined( self._id_06B5[var_0] ) && self._id_06B5[var_0] )
            return 1;
    }
    else if ( isdefined( self.pers["ability"] ) && self.pers["ability"] == var_0 && isdefined( self.pers["abilityOn"] ) && self.pers["abilityOn"] )
        return 1;

    return 0;
}

_id_70A4( var_0, var_1 )
{
    return _id_70A7( var_0, 0, var_0.size - 1, var_1 );
}

_id_70A7( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1;
    var_5 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_70A5;

    if ( var_2 - var_1 >= 1 )
    {
        var_6 = var_0[var_1];

        while ( var_5 > var_4 )
        {
            while ( [[ var_3 ]]( var_0[var_4], var_6 ) && var_4 <= var_2 && var_5 > var_4 )
                var_4++;

            while ( ![[ var_3 ]]( var_0[var_5], var_6 ) && var_5 >= var_1 && var_5 >= var_4 )
                var_5--;

            if ( var_5 > var_4 )
                var_0 = _id_9001( var_0, var_4, var_5 );
        }

        var_0 = _id_9001( var_0, var_1, var_5 );
        var_0 = _id_70A7( var_0, var_1, var_5 - 1, var_3 );
        var_0 = _id_70A7( var_0, var_5 + 1, var_2, var_3 );
    }
    else
        return var_0;

    return var_0;
}

_id_70A5( var_0, var_1 )
{
    return var_0 <= var_1;
}

_id_9001( var_0, var_1, var_2 )
{
    var_3 = var_0[var_1];
    var_0[var_1] = var_0[var_2];
    var_0[var_2] = var_3;
    return var_0;
}

_id_066F()
{
    if ( _id_51E3() && !isdefined( self._id_3693 ) )
        thread maps\mp\gametypes\_damage::_id_6CD8( self, self, self, 10000, "MOD_SUICIDE", "h1_fraggrenade_mp", ( 0.0, 0.0, 0.0 ), "none", 0, 1116, 1, 0 );
    else if ( !_id_51E3() && !isdefined( self._id_3693 ) )
        self suicide();
}

_id_5189( var_0 )
{
    if ( isalive( var_0 ) && !isdefined( var_0._id_3693 ) )
        return 1;

    return 0;
}

_id_A075( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        thread common_scripts\utility::_id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        thread common_scripts\utility::_id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        thread common_scripts\utility::_id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        thread common_scripts\utility::_id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        thread common_scripts\utility::_id_A0BA( var_5, var_6 );

    var_6 thread _id_0677( var_0, self );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_0677( var_0, var_1 )
{
    self endon( "die" );

    for ( var_2 = 0.05; var_0 > 0; var_0 -= var_2 )
    {
        if ( isplayer( var_1 ) && !_id_5189( var_1 ) )
            var_1 waittill( "spawned_player" );

        if ( getdvarint( "ui_inprematch" ) )
            level waittill( "prematch_over" );

        wait(var_2);
    }

    self notify( "returned", "timeout" );
}

_id_6A3F()
{
    if ( isdefined( level.customplaydeathsound ) )
        self thread [[ level.customplaydeathsound ]]();
    else
    {
        var_0 = randomintrange( 1, 8 );

        if ( self.team == "axis" )
        {
            if ( self hasfemalecustomizationmodel() )
                self playsound( "generic_death_enemy_fm_" + var_0 );
            else
                self playsound( "generic_death_enemy_" + var_0 );
        }
        else
        {
            if ( self hasfemalecustomizationmodel() )
            {
                self playsound( "generic_death_friendly_fm_" + var_0 );
                return;
            }

            self playsound( "generic_death_friendly_" + var_0 );
        }
    }
}

_id_7139()
{
    if ( !isplayer( self ) )
        return 0;

    return level.rankedmatch && !self._id_9C30;
}

_id_6FD0()
{
    return !level.onlinegame || getdvarint( "xblive_privatematch" );
}

_id_59E3()
{
    return level.onlinegame && !getdvarint( "xblive_privatematch" );
}

_id_7F1F( var_0, var_1, var_2, var_3 )
{

}

_id_31C2( var_0 )
{
    self endon( "altscene" );
    var_0 waittill( "death" );
    self notify( "end_altScene" );
}

_id_4015()
{
    return getdvar( "mapname" );
}

_id_3FAA()
{
    return _id_415E( "numlives" );
}

_id_0D1D( var_0, var_1, var_2 )
{
    if ( var_0.size != 0 )
    {
        for ( var_3 = var_0.size; var_3 >= var_2; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];
    }

    var_0[var_2] = var_1;
}

_id_409E( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvar( var_0, var_1 );
    return var_2;
}

_id_3FDB( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarint( var_0, var_1 );
    return var_2;
}

_id_3F9D( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarfloat( var_0, var_1 );
    return var_2;
}

_id_50DE()
{
    return isdefined( self.changingweapon );
}

_id_537A( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_0.requireddeathcount ) && isdefined( self.deaths ) && self.deaths != var_0.requireddeathcount )
        return 0;

    return 1;
}

_id_5131()
{
    if ( isdefined( self._id_5131 ) && self._id_5131 == 1 )
        return 1;

    if ( isdefined( self._id_5132 ) && self._id_5132 == 1 )
        return 1;

    if ( isdefined( self._id_5133 ) && self._id_5133 == 1 )
        return 1;

    if ( isdefined( self._id_5135 ) && self._id_5135 == 1 )
        return 1;

    if ( isdefined( self._id_5134 ) && self._id_5134 == 1 )
        return 1;

    return 0;
}

iskillstreakweapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    switch ( var_0 )
    {
        case "artillery_mp":
        case "cobra_ffar_mp":
        case "hind_ffar_mp":
        case "cobra_20mm_mp":
        case "radar_mp":
        case "airstrike_mp":
        case "helicopter_mp":
            return 1;
        default:
            break;
    }

    return 0;
}

_id_50F3( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "destructible":
        case "destructible_toy":
        case "destructible_car":
        case "barrel_mp":
            return 1;
    }

    return 0;
}

_id_50C4()
{
    return getdvarint( "scr_game_high_jump", 0 );
}

isdivisionmode()
{
    return getdvarint( "scr_game_division", 0 );
}

_id_50C9( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "briefcase_bomb_mp":
        case "briefcase_bomb_mp_defuse_mp":
        case "bomb_site_mp":
            return 1;
    }

    return 0;
}

_id_50FE( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "turret_minigun_mp" )
        return 1;

    if ( issubstr( var_0, "_bipod_" ) )
        return 1;

    return 0;
}

_id_514D( var_0 )
{
    return 0;
}

ismeleeweapon( var_0 )
{
    switch ( var_0 )
    {
        case "h1_meleebayonet_mp":
        case "h1_meleeblade_mp":
        case "h1_meleebottle_mp":
        case "h1_meleeicepick_mp":
        case "h1_meleepaddle_mp":
        case "h1_meleeshovel_mp":
            return 1;
        default:
            return 0;
    }
}

_id_416C( var_0 )
{
    return strtok( var_0, "_" );
}

getweaponclass( var_0 )
{
    var_1 = _id_3F11( var_0 );
    var_2 = tablelookup( "mp/statstable.csv", 4, var_1, 2 );

    if ( var_2 == "" )
    {
        var_3 = _id_8F5C( var_0, "_lefthand" );
        var_3 = _id_8F5C( var_3, "_mp" );
        var_2 = tablelookup( "mp/statstable.csv", 4, var_3, 2 );
    }

    if ( _id_50FE( var_0 ) )
        var_2 = "weapon_mg";
    else if ( iskillstreakweapon( var_0 ) )
        var_2 = "killstreak";
    else if ( var_0 == "none" )
        var_2 = "other";
    else if ( var_2 == "" )
        var_2 = "other";

    return var_2;
}

_id_4160( var_0 )
{
    var_0 = _id_3F11( var_0 );

    if ( !isdefined( level.weaponattachments[var_0] ) )
    {
        var_1 = [];

        for ( var_2 = 0; var_2 <= 29; var_2++ )
        {
            var_3 = tablelookup( "mp/statsTable.csv", 4, var_0, 11 + var_2 );

            if ( var_3 == "" )
                break;

            var_1[var_1.size] = var_3;
        }

        level.weaponattachments[var_0] = var_1;
    }

    return level.weaponattachments[var_0];
}

_id_4162( var_0, var_1 )
{
    var_0 = _id_3F11( var_0 );
    return tablelookup( "mp/statsTable.csv", 4, var_0, 11 + var_1 );
}

getbasearrayforattachkit( var_0 )
{
    if ( !isdefined( level.baseattachkits ) )
        level.baseattachkits = [];

    if ( !isdefined( level.baseattachkits[var_0] ) )
    {
        var_1 = 2;
        var_2 = 5;
        var_3 = tablelookuprownum( "mp/attachkits.csv", 1, var_0 );
        var_4 = [];

        for ( var_5 = var_1; var_5 <= var_2; var_5++ )
        {
            var_6 = tablelookupbyrow( "mp/attachkits.csv", var_3, var_5 );

            if ( var_6 != "" )
                var_4[var_4.size] = var_6;
        }

        level.baseattachkits[var_0] = var_4;
    }

    return level.baseattachkits[var_0];
}

getgroupforattachkitbase( var_0 )
{
    if ( !isdefined( level.attachkitgroup ) )
        level.attachkitgroup = [];

    if ( !isdefined( level.attachkitgroup[var_0] ) )
    {
        var_1 = 2;
        var_2 = tablelookuprownum( "mp/attachmentbase.csv", 1, var_0 );
        level.attachkitgroup[var_0] = tablelookupbyrow( "mp/attachmentbase.csv", var_2, var_1 );
    }

    return level.attachkitgroup[var_0];
}

_id_3F11( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == "none" || var_0 == "" )
        return var_0;

    var_1 = _id_416C( var_0 );
    var_2 = "";

    if ( var_1[0] == "iw5" || var_1[0] == "iw6" || var_1[0] == "s1" || var_1[0] == "h1" )
        var_2 = var_1[0] + "_" + var_1[1];
    else if ( var_1[0] == "alt" )
        var_2 = var_1[1] + "_" + var_1[2];
    else if ( var_1.size > 1 && ( var_1[1] == "grenade" || var_1[1] == "marker" ) )
        var_2 = var_1[0] + "_" + var_1[1];
    else
        var_2 = var_1[0];

    return var_2;
}

_id_6DDC( var_0, var_1 )
{
    playsoundatpos( var_1, var_0 );
}

_id_5764( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2 *= 10;

    var_4 = var_0 * var_2;
    var_4 = int( var_4 );
    var_4 /= var_2;
    return var_4;
}

_id_7651( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "nearest";

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( var_2 == "up" )
        var_6 = ceil( var_5 );
    else if ( var_2 == "down" )
        var_6 = floor( var_5 );
    else
        var_6 = var_5 + 0.5;

    var_5 = int( var_6 );
    var_5 /= var_3;
    return var_5;
}

_id_6CA5( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.clientid == var_0 )
            return var_2;
    }

    return undefined;
}

_id_8F5A( var_0 )
{
    var_1 = strtok( var_0, "." );
    var_2 = int( var_1[0] );

    if ( isdefined( var_1[1] ) )
    {
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_1[1].size; var_4++ )
            var_3 *= 0.1;

        var_2 += int( var_1[1] ) * var_3;
    }

    return var_2;
}

_id_8005( var_0 )
{
    self makeusable();

    foreach ( var_2 in level.players )
    {
        if ( var_2 != var_0 )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        self enableplayeruse( var_2 );
    }
}

_id_8004()
{
    self makeunusable();

    foreach ( var_1 in level.players )
        self disableplayeruse( var_1 );
}

_id_594B( var_0 )
{
    self makeusable();
    thread _id_0681( var_0 );
}

_id_0681( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
            {
                self enableplayeruse( var_2 );
                continue;
            }

            self disableplayeruse( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_593F( var_0 )
{
    self makeusable();
    thread _id_067E( var_0 );
}

_id_067E( var_0 )
{
    self endon( "death" );
    var_1 = var_0.team;

    for (;;)
    {
        if ( level.teambased )
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3.team != var_1 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }
        else
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3 != var_0 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }

        level waittill( "joined_team" );
    }
}

_id_403F()
{
    var_0 = getmatchdata( "lifeCount" );

    if ( var_0 < level.maxlives )
    {
        setmatchdata( "lifeCount", var_0 + 1 );
        return var_0;
    }
    else
        return level.maxlives - 1;
}

_id_4DC0()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

_id_3BDF( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

_id_3BDD( var_0 )
{
    return game["flags"][var_0];
}

gameflagexists( var_0 )
{
    return isdefined( game["flags"][var_0] );
}

_id_3BE0( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

_id_3BDE( var_0 )
{
    game["flags"][var_0] = 0;
}

_id_3BE1( var_0 )
{
    while ( !_id_3BDD( var_0 ) )
        level waittill( var_0 );
}

_id_50CD( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET MOD_PISTOL_BULLET MOD_HEAD_SHOT";

    if ( issubstr( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_510C( var_0, var_1, var_2 )
{
    return isdefined( var_2 ) && isplayer( var_2 ) && var_2 _hasperk( "specialty_bulletpenetration" ) && isdefined( var_1 ) && _id_50CD( var_1 );
}

_id_4DF0()
{
    if ( !isdefined( level._id_56DC ) )
        level._id_56DC = [];
}

_id_56DB( var_0, var_1 )
{
    level._id_56DC[var_0] = var_1;
}

_id_56D9( var_0 )
{
    return level._id_56DC[var_0];
}

_id_56DD( var_0 )
{
    level._id_56DC[var_0] = 1;
    level notify( var_0 );
}

_id_56DA( var_0 )
{
    level._id_56DC[var_0] = 0;
    level notify( var_0 );
}

_id_56DE( var_0 )
{
    while ( !_id_56D9( var_0 ) )
        level waittill( var_0 );
}

_id_56DF( var_0 )
{
    while ( _id_56D9( var_0 ) )
        level waittill( var_0 );
}

_id_4FA6()
{
    if ( !isdefined( level._id_9E56 ) || level._id_9E56 == 0 )
        return 0;

    return 1;
}

_id_4DC1()
{
    if ( !isdefined( level._id_4231 ) )
    {
        level._id_4231["killstreakTable"] = spawnstruct();
        level._id_4231["killstreakTable"]._id_66BD = "mp/killstreakTable.csv";
        level._id_4231["killstreakTable"]._id_4C41 = 0;
        level._id_4231["killstreakTable"]._id_72AB = 1;
        level._id_4231["killstreakTable"]._id_603D = 2;
        level._id_4231["killstreakTable"]._id_28AF = 3;
        level._id_4231["killstreakTable"]._id_0866 = 4;
        level._id_4231["killstreakTable"]._id_300A = 5;
        level._id_4231["killstreakTable"]._id_889A = 6;
        level._id_4231["killstreakTable"]._id_3009 = 7;
        level._id_4231["killstreakTable"]._id_0A6A = 8;
        level._id_4231["killstreakTable"]._id_6535 = 9;
        level._id_4231["killstreakTable"]._id_3293 = 10;
        level._id_4231["killstreakTable"]._id_A2BD = 11;
        level._id_4231["killstreakTable"]._id_788A = 12;
        level._id_4231["killstreakTable"]._id_4B2A = 13;
        level._id_4231["killstreakTable"]._id_65F0 = 14;
        level._id_4231["killstreakTable"]._id_65F1 = 15;
        level._id_4231["killstreakTable"]._id_65F2 = 16;
        level._id_4231["killstreakTable"]._id_65F3 = 17;
        level._id_4231["killstreakTable"]._id_2D94 = 18;
        level._id_4231["killstreakTable"]._id_9A24 = 19;
    }
}

_id_513B()
{
    if ( _id_4FA6() )
        return 0;

    return _id_50F9() || _id_50AE();
}

_id_50F9()
{
    if ( self.team == "spectator" )
        return 0;

    if ( _id_4FA6() )
        return 0;

    return 0;
}

_id_50FA()
{
    if ( self.team == "spectator" )
        return 0;

    if ( _id_4FA6() )
        return 0;

    return 0;
}

_id_50AE()
{
    return 0;
}

_id_515F()
{
    if ( self.team == "spectator" )
        return 0;

    return isdefined( self._id_626B );
}

_id_408B( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.guid == var_0 )
            return var_2;
    }

    return undefined;
}

_id_91FA( var_0, var_1, var_2, var_3 )
{
    if ( level.hardcoremode )
        return;

    foreach ( var_5 in level.players )
    {
        if ( isdefined( var_2 ) && var_5.team != var_2 )
            continue;

        if ( !isplayer( var_5 ) )
            continue;

        var_5 thread maps\mp\gametypes\_hud_message::_id_6C6F( var_0, var_1, var_3 );
    }
}

_id_50D1( var_0 )
{
    switch ( getweaponclass( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_riot":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_heavy":
        case "weapon_special":
            return 1;
        default:
            return 0;
    }
}

_id_50D2( var_0 )
{
    switch ( getweaponclass( var_0 ) )
    {
        case "weapon_projectile":
        case "weapon_pistol":
        case "weapon_machine_pistol":
        case "weapon_sec_special":
            return 1;
        default:
            return 0;
    }
}

iscacmeleeweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    switch ( getweaponclass( var_0 ) )
    {
        case "weapon_melee":
            return 1;
        default:
            return 0;
    }
}

_id_3FFC( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_0 ) && var_3.team != var_0 )
            continue;

        if ( !_id_5189( var_3 ) && !var_3 maps\mp\gametypes\_playerlogic::_id_5A62() )
            continue;

        var_1 = var_3;
    }

    return var_1;
}

_id_4093()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !_id_5189( var_2 ) && !var_2 maps\mp\gametypes\_playerlogic::_id_5A62() )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_A0ED( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self.health != self.maxhealth )
            var_2 = 0;
        else
            var_2 += var_1;

        wait(var_1);

        if ( self.health == self.maxhealth && var_2 >= var_0 )
            break;
    }

    return;
}

_id_50BE( var_0, var_1 )
{
    var_2 = strtok( var_0, "_" );
    return _id_50BF( var_2, var_1 );
}

_id_50BF( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size && isdefined( var_1 ) )
    {
        var_3 = 0;

        if ( var_0[0] == "alt" )
            var_3 = 1;

        if ( var_0.size >= 3 + var_3 && ( var_0[var_3] == "iw5" || var_0[var_3] == "iw6" || var_0[var_3] == "h1" ) )
        {
            if ( weaponclass( var_0[var_3] + "_" + var_0[var_3 + 1] + "_" + var_0[var_3 + 2] ) == "sniper" )
                var_2 = var_0[var_3 + 1] + "scope" == var_1;
        }
    }

    return var_2;
}

_id_4163( var_0 )
{
    var_1 = getweaponattachments( var_0 );

    foreach ( var_4, var_3 in var_1 )
        var_1[var_4] = _id_0E02( var_3 );

    return var_1;
}

_id_3F09()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ) )
    {
        if ( !common_scripts\utility::_id_0CE4( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    return var_0;
}

_id_3F0A()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookupbyrow( "mp/attachoverrides.csv", var_1, 2 ); var_2 != ""; var_2 = tablelookupbyrow( "mp/attachoverrides.csv", var_1, 2 ) )
    {
        var_0[var_0.size] = var_2;
        var_1++;
    }

    return var_0;
}

_id_1876()
{
    var_0 = _id_3F0A();
    level._id_0E04 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = tablelookup( "mp/attachoverrides.csv", 2, var_2, 1 );

        if ( var_2 == var_3 )
            continue;

        level._id_0E04[var_2] = var_3;
    }
}

_id_0E02( var_0 )
{
    if ( isdefined( level._id_0E04[var_0] ) )
        var_0 = level._id_0E04[var_0];

    return var_0;
}

_objective_delete( var_0 )
{
    objective_delete( var_0 );

    if ( !isdefined( level._id_7266 ) )
    {
        level._id_7266 = [];
        level._id_7266[0] = var_0;
    }
    else
        level._id_7266[level._id_7266.size] = var_0;
}

_id_9409()
{
    var_0 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    var_4 = getentarray( "radiation", "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    if ( isdefined( level.ishorde ) && level.ishorde )
    {
        if ( _id_4015() == "mp_torqued" )
        {
            if ( isdefined( level.hordeavalanche ) && level.hordeavalanche && isdefined( level.dyneventavalanche._id_8D7C ) && level.dyneventavalanche._id_8D7C != "post_avalanche" )
            {
                var_7 = getentarray( "quake_kill_volume01", "targetname" );

                foreach ( var_9 in var_7 )
                {
                    if ( self istouching( var_9 ) )
                        return 1;
                }
            }
        }
        else if ( _id_4015() == "mp_lost" )
        {
            foreach ( var_12 in level.hordekilltriggers )
            {
                if ( self istouching( var_12 ) )
                    return 1;
            }
        }
    }

    if ( getdvar( "g_gametype" ) == "hp" && isdefined( level._id_A3DD ) && isdefined( level._id_A3DD._id_9754 ) && self istouching( level._id_A3DD._id_9754 ) )
        return 1;

    return 0;
}

_id_8031( var_0 )
{
    if ( var_0 )
        self setdepthoffield( 0, 110, 512, 4096, 6, 1.8 );
    else
        self setdepthoffield( 0, 0, 512, 512, 4, 0 );
}

_id_53B2( var_0, var_1, var_2 )
{
    var_3 = spawn( "trigger_radius", var_0, 0, var_1, var_2 );

    for (;;)
    {
        var_3 waittill( "trigger", var_4 );

        if ( !isplayer( var_4 ) )
            continue;

        var_4 suicide();
    }
}

_id_3782( var_0, var_1, var_2 )
{
    var_3 = cos( var_2 );
    var_4 = anglestoforward( var_0.angles );
    var_5 = var_1.origin - var_0.origin;
    var_4 *= ( 1.0, 1.0, 0.0 );
    var_5 *= ( 1.0, 1.0, 0.0 );
    var_5 = vectornormalize( var_5 );
    var_4 = vectornormalize( var_4 );
    var_6 = vectordot( var_5, var_4 );

    if ( var_6 >= var_3 )
        return 1;
    else
        return 0;
}

_id_2DD9( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_2DE3( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_7FFB( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self.recoilscale ) )
        self.recoilscale = var_0;
    else
        self.recoilscale += var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self.recoilscale ) && var_1 < self.recoilscale )
            var_1 = self.recoilscale;

        var_2 = 100 - var_1;
    }
    else
        var_2 = 100 - self.recoilscale;

    if ( var_2 < 0 )
        var_2 = 0;

    if ( var_2 > 100 )
        var_2 = 100;

    if ( var_2 == 100 )
    {
        self player_recoilscaleoff();
        return;
    }

    self player_recoilscaleon( var_2 );
}

_id_1E5D( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

_id_6240( var_0 )
{
    self notify( "notusablejoiningplayers" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self endon( "notusablejoiningplayers" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( isdefined( var_1 ) && var_1 != var_0 )
            self disableplayeruse( var_1 );
    }
}

_id_51BA( var_0, var_1 )
{
    return getsubstr( var_0, 0, var_1.size ) == var_1;
}

_id_2AF1()
{
    level._id_53A6 = 1;
}

_id_3107()
{
    level._id_53A6 = undefined;
}

_id_9C4F( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_2 = var_0;
    else
    {
        var_3 = self.pers["killstreaks"];
        var_2 = var_3[self._id_539D]._id_8F26;
    }

    if ( isdefined( level._id_53A6 ) && level._id_53A6 )
        return 0;

    if ( !self isonground() && _id_5191( var_2 ) )
        return 0;

    if ( _id_51E3() || _id_512B() )
        return 0;

    if ( isdefined( self._id_7C6F ) )
        return 0;

    if ( _id_84A5( var_2 ) && level.killstreakrounddelay )
    {
        var_4 = 0;

        if ( isdefined( level._id_6F07 ) )
            var_4 = ( gettime() - level._id_6F07 ) / 1000;

        if ( var_4 < level.killstreakrounddelay )
        {
            var_5 = int( level.killstreakrounddelay - var_4 + 0.5 );

            if ( !var_5 )
                var_5 = 1;

            if ( !( isdefined( var_1 ) && var_1 ) )
                self clientiprintlnbold( &"MP_UNAVAILABLE_FOR_N", var_5 );

            return 0;
        }
    }

    if ( _id_50F9() && ( !isdefined( level.iszombiegame ) || !level.iszombiegame ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
        {
            if ( isdefined( level._id_3091 ) && level._id_3091 > 0 )
                self clientiprintlnbold( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP", level._id_3091 );
            else if ( isdefined( self.empendtime ) && int( ( self.empendtime - gettime() ) / 1000 ) > 0 )
                self clientiprintlnbold( &"MP_UNAVAILABLE_FOR_N", int( ( self.empendtime - gettime() ) / 1000 ) );
        }

        return 0;
    }

    if ( self isusingturret() && ( _id_5191( var_2 ) || _id_50DC( var_2 ) ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self clientiprintlnbold( &"MP_UNAVAILABLE_USING_TURRET" );

        return 0;
    }

    if ( isdefined( self.laststand ) && !_hasperk( "specialty_finalstand" ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self clientiprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );

        return 0;
    }

    if ( !common_scripts\utility::_id_5207() )
        return 0;

    return 1;
}

_id_5191( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 0;
    }
}

_id_50DC( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 0;
    }
}

_id_84A5( var_0 )
{
    return 0;
}

_id_5138( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 1;
    }
}

_id_5139( var_0 )
{
    return _id_5138( var_0 ) && !_id_510B( var_0 );
}

_id_510B( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 1;
    }
}

_id_50B5( var_0 )
{
    var_1 = _id_3FE1( var_0 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( int( var_1 ) == 1 )
        return 1;

    return 0;
}

_id_3FF5( var_0 )
{
    return tablelookuprownum( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0 );
}

_id_3FEE( var_0 )
{
    var_1 = "mp/killstreakTable.csv";
    var_2 = 0;
    var_3 = 1;
    var_4 = tablelookup( var_1, var_3, var_0, var_2 );

    if ( var_4 == "" )
        var_5 = -1;
    else
        var_5 = int( var_4 );

    return var_5;
}

_id_3FF4( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_72AB );
}

_id_3FF2( var_0 )
{
    return tablelookupistring( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_603D );
}

_id_3FE4( var_0 )
{
    return tablelookupistring( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_28AF );
}

_id_3FF0( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_0866 );
}

_id_3FE8( var_0 )
{
    return tablelookupistring( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_300A );
}

_id_3FF7( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_889A );
}

_id_3FE7( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3009 );
}

_id_3FE0( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_0A6A );
}

_id_3FE9( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3222 );
}

_id_3FEA( var_0 )
{
    return int( tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3293 ) );
}

_id_3FF9( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        var_2 = _id_05B6( var_0, var_1 );

        if ( isdefined( var_2 ) )
            return var_2;
    }

    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_A2BD );
}

_id_05B6( var_0, var_1 )
{

}

_id_3FF6( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_788A );
}

_id_3FED( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_4B2A );
}

_id_3FF3( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_65F0 );
}

_id_3FE6( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_2D94 );
}

_id_3FF8( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_9A24 );
}

_id_3FE1( var_0 )
{
    return tablelookup( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_09E4 );
}

_id_2508( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = var_0;

    if ( isdefined( level._id_4816 ) )
        var_1 += level._id_4816.size;

    if ( isdefined( level._id_57B8 ) )
        var_1 += level._id_57B8.size;

    if ( isdefined( level._id_99EF ) )
        var_1 += level._id_99EF.size;

    if ( isdefined( level.ishorde ) && level.ishorde )
    {
        if ( isdefined( level._id_392D ) )
            var_1 += level._id_392D.size;

        if ( isdefined( level._id_94F1 ) )
            var_1 += level._id_94F1.size;
    }

    return var_1;
}

_id_5A59()
{
    return 8;
}

_id_4C3F()
{
    level._id_3694++;
}

_id_2761()
{
    level._id_3694--;

    if ( level._id_3694 < 0 )
        level._id_3694 = 0;
}

_id_5761( var_0 )
{
    return 1.07;
}

_id_0AB0()
{
    if ( !isshipbuild() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    if ( ishodgepodgemm() )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 4 ) );
    return var_0;
}

_id_0AA2()
{
    if ( !isshipbuild() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    if ( level.oldschool )
        return 0;

    if ( ishodgepodgemm() || ishodgepodgerpgonly() )
        return 0;

    if ( ishodgepodgeph() && ( !level.madpropsmode || isdefined( self.team ) && level.madpropsmode && self.team == game["defenders"] ) )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 5 ) );
    return var_0;
}

_id_8510()
{
    if ( _id_0AA2() )
        return 0;

    if ( ishodgepodgeph() )
        return 1;

    if ( _id_59E3() && self.sessionteam != "none" )
        var_0 = 0;
    else if ( !_id_59E3() && !forceautoassign() && _id_0AB0() )
        var_0 = 1;
    else
        var_0 = 0;

    if ( var_0 )
        return 0;

    if ( level.oldschool )
        return 1;

    if ( ishodgepodgemm() )
        return 1;

    var_1 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 8 ) );
    return var_1;
}

forceautoassign()
{
    if ( ishodgepodgemm() )
        return 1;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 10 ) );
    return var_0;
}

_id_50CC( var_0, var_1 )
{
    return 0;
}

setcommonrulesfrommatchrulesdata( var_0 )
{
    var_1 = getmatchrulesdata( "commonOption", "timeLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_timeLimit", var_1 );
    registertimelimitdvar( level.gametype, var_1 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_scoreLimit", var_2 );
    registerscorelimitdvar( level.gametype, var_2 );
    setdynamicdvar( "scr_game_matchstarttime", getmatchrulesdata( "commonOption", "preMatchTimer" ) );
    setdynamicdvar( "scr_game_roundstarttime", getmatchrulesdata( "commonOption", "preRoundTimer" ) );
    setdynamicdvar( "scr_game_suicidespawndelay", getmatchrulesdata( "commonOption", "suicidePenalty" ) );
    setdynamicdvar( "scr_team_teamkillspawndelay", getmatchrulesdata( "commonOption", "teamKillPenalty" ) );
    setdynamicdvar( "scr_team_teamkillkicklimit", getmatchrulesdata( "commonOption", "teamKillKickLimit" ) );
    var_3 = getmatchrulesdata( "commonOption", "numLives" );
    setdynamicdvar( "scr_" + level.gametype + "_numLives", var_3 );
    registernumlivesdvar( level.gametype, var_3 );
    setdynamicdvar( "scr_player_maxhealth", getmatchrulesdata( "commonOption", "maxHealth" ) );
    setdynamicdvar( "scr_player_healthregentime", getmatchrulesdata( "commonOption", "healthRegen" ) );
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = 0;
    setdynamicdvar( "scr_game_spectatetype", getmatchrulesdata( "commonOption", "spectateModeAllowed" ) );
    setdynamicdvar( "scr_game_lockspectatorpov", getmatchrulesdata( "commonOption", "spectateModePOV" ) );
    setdynamicdvar( "scr_game_allowkillcam", getmatchrulesdata( "commonOption", "showKillcam" ) );
    setdynamicdvar( "scr_game_forceuav", getmatchrulesdata( "commonOption", "radarAlwaysOn" ) );
    setdynamicdvar( "scr_" + level.gametype + "_playerrespawndelay", getmatchrulesdata( "commonOption", "respawnDelay" ) );
    setdynamicdvar( "scr_" + level.gametype + "_waverespawndelay", getmatchrulesdata( "commonOption", "waveRespawnDelay" ) );
    setdynamicdvar( "scr_player_forcerespawn", getmatchrulesdata( "commonOption", "forceRespawn" ) );
    level._id_59E5 = getmatchrulesdata( "commonOption", "allowCustomClasses" );
    level._id_2559 = getmatchrulesdata( "commonOption", "classPickCount" );
    setdynamicdvar( "scr_game_disablesprint", getmatchrulesdata( "commonOption", "disableSprint" ) );
    setdynamicdvar( "scr_game_deleteturrets", getmatchrulesdata( "commonOption", "deleteTurrets" ) );
    setdynamicdvar( "scr_game_hardpoints", 1 );
    setdynamicdvar( "scr_game_perks", 1 );
    setdynamicdvar( "g_hardcore", getmatchrulesdata( "commonOption", "hardcoreModeOn" ) );
    setdynamicdvar( "scr_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "camera_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "scr_game_onlyheadshots", getmatchrulesdata( "commonOption", "headshotsOnly" ) );

    if ( !isdefined( var_0 ) )
        setdynamicdvar( "scr_team_fftype", getmatchrulesdata( "commonOption", "ffType" ) );

    setdynamicdvar( "scr_game_killstreakdelay", getmatchrulesdata( "commonOption", "streakGracePeriod" ) );
    setdynamicdvar( "scr_game_chatterDisabled", getmatchrulesdata( "commonOption", "chatterDisabled" ) );
    level._id_1CA7 = _id_3FDB( "scr_game_chatterDisabled", 0 );
    level._id_0C91 = getmatchrulesdata( "commonOption", "announcerDisabled" );
    level._id_59EA = getmatchrulesdata( "commonOption", "switchTeamDisabled" );
    level._id_4400 = getmatchrulesdata( "commonOption", "grenadeGracePeriod" );
    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );
    setdynamicdvar( "g_oldschool", getmatchrulesdata( "commonOption", "oldSchoolModeOn" ) );
    setdynamicdvar( "scr_killstreak_kills_uav", getmatchrulesdata( "commonOption", "killstreakUAVKills" ) );
    setdynamicdvar( "scr_killstreak_kills_airstrike", getmatchrulesdata( "commonOption", "killstreakAirStrikeKills" ) );
    setdynamicdvar( "scr_killstreak_kills_heli", getmatchrulesdata( "commonOption", "killstreakHeliKills" ) );
    setdynamicdvar( "scr_killcount_persists", getmatchrulesdata( "commonOption", "killCountPersists" ) );
}

reinitializematchrulesonmigration()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        [[ level.initializematchrules ]]();
    }
}

_id_7309( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self._id_560D ) )
            self visionsetthermalforplayer( self._id_560D, 0 );
    }
}

_id_4017( var_0, var_1 )
{
    var_2 = [];
    var_2["loadoutPrimary"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "weapon" );
    var_3 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "kit", "attachKit" );
    var_4 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "kit", "furnitureKit" );
    var_2["loadoutPrimaryAttachKit"] = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    var_2["loadoutPrimaryFurnitureKit"] = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_4 ), 1 );
    var_2["loadoutPrimaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "camo" );
    var_2["loadoutPrimaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "reticle" );
    var_2["loadoutSecondary"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "weapon" );
    var_3 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "kit", "attachKit" );
    var_4 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "kit", "furnitureKit" );
    var_2["loadoutSecondaryAttachKit"] = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    var_2["loadoutSecondaryFurnitureKit"] = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_4 ), 1 );
    var_2["loadoutSecondaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "camo" );
    var_2["loadoutSecondaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "reticle" );
    var_2["loadoutEquipment"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "equipment", 0 );
    var_2["loadoutOffhand"] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "equipment", 1 );

    for ( var_5 = 0; var_5 < 3; var_5++ )
        var_2["loadoutPerks"][var_5] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_1, "class", "perkSlots", var_5 );

    var_2["loadoutMelee"] = "none";
    return var_2;
}

_id_7265( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( level.ishorde ) )
    {
        if ( level.ingraceperiod && !self._id_4729 )
            self waittill( "applyLoadout" );
        else
            self waittill( "spawned_player" );
    }
    else
        self waittill( "applyLoadout" );

    if ( var_0 )
    {
        self notify( "lost_juggernaut" );
        wait 0.5;
    }

    if ( !isdefined( self._id_5137 ) )
    {
        self.movespeedscaler = 0.7;
        maps\mp\gametypes\_weapons::_id_9B3D();
    }

    self._id_52AA = 0.7;
    self disableweaponpickup();

    if ( !getdvarint( "camera_thirdPerson" ) && !isdefined( level.ishorde ) )
    {
        self._id_52A6 = newclienthudelem( self );
        self._id_52A6.x = 0;
        self._id_52A6.y = 0;
        self._id_52A6.alignx = "left";
        self._id_52A6.aligny = "top";
        self._id_52A6.horzalign = "fullscreen";
        self._id_52A6.vertalign = "fullscreen";
        self._id_52A6 setshader( level._id_52AD["juggernaut"]._id_65F6, 640, 480 );
        self._id_52A6.sort = -10;
        self._id_52A6.archived = 1;
        self._id_52A6.hidein3rdperson = 1;
    }

    if ( level.gametype != "jugg" || isdefined( level._id_59E9 ) && level._id_59E9 )
        self setperk( "specialty_radarjuggernaut", 1, 0 );

    if ( isdefined( self._id_5136 ) && self._id_5136 )
    {
        var_1 = spawn( "script_model", self.origin );
        var_1.team = self.team;
        var_1 makeportableradar( self );
        self._id_67E3 = var_1;
    }

    level notify( "juggernaut_equipped", self );
}

_id_9B69( var_0 )
{
    var_1 = self.sessionstate;
    self.sessionstate = var_0;
    self setclientomnvar( "ui_session_state", var_0 );

    if ( var_1 != var_0 )
        level notify( "playerSessionStateChanged", self );
}

_id_197E()
{
    if ( isdefined( level._id_39B1 ) )
        return level._id_39B1;

    if ( getdvarint( "xblive_privatematch" ) || issystemlink() )
        return "privateMatchCustomClasses";
    else
        return "customClasses";
}

_id_3F32( var_0 )
{
    return level._id_1E36[var_0];
}

_id_51CC()
{
    var_0 = _id_4008( self.team );

    foreach ( var_2 in var_0 )
    {
        if ( var_2 != self && ( !isdefined( var_2.laststand ) || !var_2.laststand ) )
            return 0;
    }

    return 1;
}

_id_53B0( var_0 )
{
    var_1 = _id_4008( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.laststand ) && var_3.laststand )
            var_3 thread maps\mp\gametypes\_damage::_id_2A52( randomintrange( 1, 3 ) );
    }
}

_id_907A( var_0 )
{
    if ( !isai( self ) )
        self switchtoweapon( var_0 );
    else
        self switchtoweapon( "none" );
}

_id_50B1( var_0 )
{
    if ( isagent( var_0 ) && var_0.agent_teamparticipant == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_51CE( var_0 )
{
    if ( _id_50B1( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

_id_50AD( var_0 )
{
    if ( isagent( var_0 ) && var_0.agent_gameparticipant == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_5112( var_0 )
{
    if ( _id_50AD( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

_id_4119( var_0 )
{
    var_1 = 0;

    if ( level.teambased )
    {
        switch ( var_0 )
        {
            case "axis":
                var_1 = 1;
                break;
            case "allies":
                var_1 = 2;
                break;
        }
    }

    return var_1;
}

_id_5150( var_0 )
{
    return var_0 == "MOD_MELEE" || var_0 == "MOD_MELEE_ALT";
}

_id_5117( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3.owner ) )
        {
            if ( var_3.code_classname == "script_vehicle" )
                return 0;

            if ( var_3.code_classname == "misc_turret" )
                return 0;

            if ( var_3.code_classname == "script_model" )
                return 0;
        }

        if ( isdefined( var_3.agent_type ) )
        {
            if ( var_3.agent_type == "dog" || var_3.agent_type == "alien" )
                return 0;
        }
    }

    return ( var_1 == "head" || var_1 == "helmet" ) && !_id_5150( var_2 ) && var_2 != "MOD_IMPACT" && !_id_50FE( var_0 );
}

_id_0E30( var_0, var_1 )
{
    if ( !level.teambased )
        return 0;
    else if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return 0;
    else if ( !isdefined( var_0.team ) || !isdefined( var_1.team ) )
        return 0;
    else if ( var_0 == var_1 )
        return 0;
    else if ( var_0.pers["team"] == var_1.team && isdefined( var_1._id_91EC ) )
        return 0;
    else if ( isdefined( var_1._id_78CD ) && var_1._id_78CD )
        return 0;
    else if ( var_0.team == var_1.team )
        return 1;
    else
        return 0;
}

_id_7E5A( var_0 )
{
    if ( !( isdefined( self._id_488B ) && common_scripts\utility::_id_0CE4( self._id_488B, var_0 ) ) )
    {
        self._id_488B = common_scripts\utility::_id_0CDA( self._id_488B, var_0 );
        var_0 notify( "calculate_new_level_targets" );
    }
}

_id_07A7( var_0, var_1 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_add_to_level_targets"] ) )
    {
        var_0._id_9BE9 = var_1;
        var_0._id_1657 = "use";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_7352( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_remove_from_level_targets"] ) )
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_07A6( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_add_to_level_targets"] ) )
    {
        var_0._id_1657 = "damage";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_7351( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_remove_from_level_targets"] ) )
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_6205( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["notify_enemy_bots_bomb_used"] ) )
        self [[ level.bot_funcs["notify_enemy_bots_bomb_used"] ]]( var_0 );
}

_id_3E4C()
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bot_get_rank_xp_and_prestige"] ) )
        return self [[ level.bot_funcs["bot_get_rank_xp_and_prestige"] ]]();
}

_id_7EA5()
{
    var_0 = _id_3E4C();

    if ( isdefined( var_0 ) )
    {
        self.pers["rankxp"] = var_0._id_713C;
        self.pers["prestige"] = var_0.prestige;
        self.pers["prestige_fake"] = var_0.prestige;
    }
}

set_rank_options_for_bot()
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bot_set_rank_options"] ) )
        self [[ level.bot_funcs["bot_set_rank_options"] ]]();
}

_id_7DF3()
{
    if ( !isdefined( level.console ) )
        level.console = getdvar( "consoleGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level.xenon ) )
        level.xenon = getdvar( "xenonGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level.ps3 ) )
        level.ps3 = getdvar( "ps3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level.xb3 ) )
        level.xb3 = getdvar( "xb3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level.ps4 ) )
        level.ps4 = getdvar( "ps4Game" ) == "true";
    else
    {

    }
}

_id_502F()
{
    if ( level.xb3 || level.ps4 || !level.console )
        return 1;
    else
        return 0;
}

_id_7F5E( var_0, var_1, var_2 )
{
    if ( !isdefined( level.console ) || !isdefined( level.xb3 ) || !isdefined( level.ps4 ) )
        _id_7DF3();

    if ( _id_502F() )
        setdvar( var_0, var_2 );
    else
        setdvar( var_0, var_1 );
}

_id_51F9( var_0, var_1 )
{
    return isdefined( var_1.team ) && var_1.team != var_0.team;
}

_id_51EC( var_0, var_1 )
{
    return isdefined( var_1.owner ) && var_1.owner != var_0;
}

_id_3FC4()
{
    return ( 0.0, 0.0, 5000.0 );
}

_id_3FC5()
{
    return ( 0.0, 0.0, 2500.0 );
}

_id_74FA( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level._id_626D ) && isdefined( level._id_627B ) )
    {
        self _meth_8476( level._id_627B, var_0 );
        self visionsetnakedforplayer( level._id_627B, var_0 );
        _id_7F02( level._id_627B, var_0 );
    }
    else if ( isdefined( self.usingremote ) && isdefined( self._id_750D ) )
    {
        self _meth_8476( self._id_750D, var_0 );
        self visionsetnakedforplayer( self._id_750D, var_0 );
        _id_7F02( self._id_750D, var_0 );
    }
    else
    {
        self _meth_8476( "", var_0 );
        self visionsetnakedforplayer( "", var_0 );
        _id_7F02( "", var_0 );
    }
}

_id_7E6B( var_0 )
{
    if ( !isplayer( self ) )
        return;

    if ( isdefined( level._id_575A ) )
        level._id_575B = level._id_575A;

    level._id_575A = var_0;
    self _meth_83be( var_0 );
}

_id_1EC2()
{
    if ( !isplayer( self ) )
        return;

    var_0 = getmapcustom( "map" );

    if ( isdefined( level._id_575B ) )
    {
        var_0 = level._id_575B;
        level._id_575B = undefined;
    }

    level._id_575A = var_0;
    self _meth_83be( var_0 );
}

_id_570C( var_0, var_1, var_2, var_3 )
{
    if ( !isplayer( self ) )
        return;

    self _meth_83bf( var_0, var_1 );
    _id_A03D( var_2, [ "death", "disconnect" ] );

    if ( isdefined( self ) )
        self _meth_83c0( var_3 );
}

_id_4144()
{
    if ( isdefined( self.pers["guid"] ) )
        return self.pers["guid"];

    var_0 = self getguid();

    if ( var_0 == "0000000000000000" )
    {
        if ( isdefined( level._id_4453 ) )
            level._id_4453++;
        else
            level._id_4453 = 1;

        var_0 = "script" + level._id_4453;
    }

    self.pers["guid"] = var_0;
    return self.pers["guid"];
}

_id_3E34( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = self getentitynumber();
    var_3 = [];

    foreach ( var_5 in level.players )
    {
        if ( !isdefined( var_5 ) || var_5 == self )
            continue;

        var_6 = 0;

        if ( !var_1 )
        {
            if ( isdefined( var_5.team ) && var_5.team == "spectator" || var_5.sessionstate == "spectator" )
            {
                var_7 = var_5 getspectatingplayer();

                if ( isdefined( var_7 ) && var_7 == self )
                    var_6 = 1;
            }

            if ( var_5.forcespectatorclient == var_2 )
                var_6 = 1;
        }

        if ( !var_0 )
        {
            if ( var_5.killcamentity == var_2 )
                var_6 = 1;
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_7F02( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_3E34( var_4, var_5 );

    foreach ( var_9 in var_7 )
    {
        var_9 notify( "changing_watching_visionset" );

        if ( isdefined( var_3 ) && var_3 )
            var_9 visionsetmissilecamforplayer( var_0, var_1 );
        else if ( isdefined( var_6 ) && var_6 )
            var_9 visionsetpostapplyforplayer( var_0, var_1 );
        else
            var_9 visionsetnakedforplayer( var_0, var_1 );

        if ( var_0 != "" && isdefined( var_2 ) )
        {
            var_9 thread _id_743F( self, var_1 + var_2, var_6 );
            var_9 thread _id_743D( self, var_6 );

            if ( var_9 _id_5129() )
                var_9 thread _id_743E();
        }
    }
}

_id_743E()
{
    self endon( "disconnect" );
    self waittill( "spawned" );
    self visionsetnakedforplayer( "", 0.0 );
    self visionsetpostapplyforplayer( "", 0.0 );
}

_id_743F( var_0, var_1, var_2 )
{
    self endon( "changing_watching_visionset" );
    var_0 endon( "disconnect" );
    var_3 = gettime();
    var_4 = self.team;

    while ( gettime() - var_3 < var_1 * 1000 )
    {
        if ( self.team != var_4 || !common_scripts\utility::_id_0CE4( var_0 _id_3E34(), self ) )
        {
            if ( isdefined( var_2 ) && var_2 )
                self visionsetpostapplyforplayer( "", 0.0 );
            else
                self visionsetnakedforplayer( "", 0.0 );

            self notify( "changing_visionset" );
            break;
        }

        wait 0.05;
    }
}

_id_743D( var_0, var_1 )
{
    self endon( "changing_watching_visionset" );
    var_0 waittill( "disconnect" );

    if ( isdefined( var_1 ) && var_1 )
        self visionsetpostapplyforplayer( "", 0.0 );
    else
        self visionsetnakedforplayer( "", 0.0 );
}

_id_0683( var_0 )
{
    if ( isagent( var_0 ) && ( !isdefined( var_0.isactive ) || !var_0.isactive ) )
        return undefined;

    return var_0;
}

_id_063B( var_0, var_1 )
{
    if ( !isdefined( self._id_6047 ) )
    {
        self._id_6047 = [];
        self._id_6F71 = [];
    }
    else
    {
        self._id_6F71[0] = self._id_6047[0];
        self._id_6F71[1] = self._id_6047[1];
    }

    self._id_6047[0] = var_0;
    self._id_6047[1] = var_1;
    self setnameplatematerial( var_0, var_1 );
}

_id_0628()
{
    if ( isdefined( self._id_6F71 ) )
        self setnameplatematerial( self._id_6F71[0], self._id_6F71[1] );
    else
        self setnameplatematerial( "", "" );

    self._id_6047 = undefined;
    self._id_6F71 = undefined;
}

_id_3774( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    if ( var_2.size > 0 )
    {
        foreach ( var_4 in var_2 )
        {
            var_5 = 0;

            if ( isdefined( var_4._id_793C ) )
            {
                if ( isdefined( var_4._id_7A99 ) && var_4._id_7A99 == "delta_anim" )
                    var_5 = 1;

                var_4 thread _id_6A25( var_1, var_5 );
            }
        }
    }
}

_id_6A25( var_0, var_1 )
{
    if ( var_0 == 1 )
        wait(randomfloatrange( 0.0, 1 ));

    if ( var_1 == 0 )
        self scriptmodelplayanim( self._id_793C );
    else
        self _meth_8277( self._id_793C );
}

_id_6C62( var_0, var_1 )
{
    _id_0612( "highjump", var_0, var_1, ::_meth_83b0 );
}

_id_6C63( var_0, var_1 )
{
    _id_0612( "highjumpdrop", var_0, var_1, ::_meth_8482 );
}

_id_6C60( var_0, var_1 )
{
    _id_0612( "boostjump", var_0, var_1, ::_meth_849a );
}

_id_6C64( var_0, var_1 )
{
    _id_0612( "powerslide", var_0, var_1, ::_meth_8481 );
}

_id_6C61( var_0, var_1 )
{
    _id_0612( "dodge", var_0, var_1, ::_meth_8489 );
}

_id_0612( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( self._id_6C8A ) )
        self._id_6C8A = [];

    if ( !isdefined( self._id_6C8A[var_0] ) )
        self._id_6C8A[var_0] = [];

    if ( !isdefined( var_2 ) )
        var_2 = "default";

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( var_1 )
    {
        self._id_6C8A[var_0] = common_scripts\utility::_id_0CF6( self._id_6C8A[var_0], var_2 );

        if ( !self._id_6C8A[var_0].size )
        {
            if ( var_4 )
                self call [[ var_3 ]]( 1 );
            else
                self [[ var_3 ]]( 1 );
        }
    }
    else
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( self._id_6C8A[var_0], var_2 ) ) )
            self._id_6C8A[var_0] = common_scripts\utility::_id_0CDA( self._id_6C8A[var_0], var_2 );

        if ( var_4 )
            self call [[ var_3 ]]( 0 );
        else
            self [[ var_3 ]]( 0 );
    }
}

_id_5943( var_0, var_1, var_2, var_3 )
{
    var_4 = 500;

    switch ( var_0 )
    {
        case "killstreakRemote":
            var_4 = 300;
            break;
        case "coopStreakPrompt":
            var_4 = 301;
            break;
        default:
            break;
    }

    _id_05D2( var_4, var_0, var_2, var_3 );
    self _meth_80c3( var_4, var_2, var_3 );
    self sethintstring( var_1 );
    self setcursorhint( "HINT_NOICON" );
}

_id_05D2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_4234 ) )
        level._id_4234 = [];

    var_4 = -1;

    for ( var_5 = 0; var_5 < level._id_4234.size; var_5++ )
    {
        var_6 = level._id_4234[var_5];

        if ( var_6._id_6FBE > var_0 )
        {
            if ( var_4 == -1 )
                var_4 = var_5;

            break;
        }

        if ( var_6._id_6FBE == var_0 )
        {
            var_6._id_6FBE += 0.01;

            if ( var_6._id_310D )
                var_6._id_32D5 _meth_80c3( var_6._id_6FBE, var_6.player, var_6.team );

            if ( var_4 == -1 )
                var_4 = var_5;
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_7 = spawnstruct();
    var_7._id_32D5 = self;
    var_7._id_6FBE = var_0;
    var_7.type = var_1;
    var_7.player = var_2;
    var_7.team = var_3;
    var_7._id_310D = 1;
    level._id_4234 = common_scripts\utility::_id_0CED( level._id_4234, var_7, var_4 );
}

_id_5942()
{
    var_0 = undefined;

    foreach ( var_2 in level._id_4234 )
    {
        if ( var_2._id_32D5 == self )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_4 = var_0._id_6FBE;
        level._id_4234 = common_scripts\utility::_id_0CF6( level._id_4234, var_0 );
        self _meth_80c4();

        foreach ( var_2 in level._id_4234 )
        {
            if ( var_4 > var_2._id_6FBE && int( var_4 ) == int( var_2._id_6FBE ) )
            {
                var_2._id_6FBE -= 0.01;

                if ( var_2._id_310D )
                    var_2._id_32D5 _meth_80c3( var_2._id_6FBE, var_2.player, var_2.team );
            }
        }
    }
}

_id_2B14()
{
    foreach ( var_1 in level._id_4234 )
    {
        if ( var_1._id_32D5 == self )
        {
            if ( var_1._id_310D )
            {
                var_1._id_32D5 _meth_80c4();
                var_1._id_310D = 0;
            }

            break;
        }
    }
}

_id_3110()
{
    foreach ( var_1 in level._id_4234 )
    {
        if ( var_1._id_32D5 == self )
        {
            if ( !var_1._id_310D )
            {
                var_1._id_32D5 _meth_80c3( var_1._id_6FBE, var_1.player, var_1.team );
                var_1._id_310D = 1;
            }

            break;
        }
    }
}

_id_7F54( var_0 )
{
    self setdepthoffield( var_0["nearStart"], var_0["nearEnd"], var_0["farStart"], var_0["farEnd"], var_0["nearBlur"], var_0["farBlur"] );
}

_id_50FC( var_0 )
{
    if ( level.teambased )
        return _id_517A( var_0 );
    else
        return _id_5176( var_0 );
}

_id_517A( var_0 )
{
    return var_0.team != self.team;
}

_id_5176( var_0 )
{
    if ( isdefined( var_0.owner ) )
        return var_0.owner != self;
    else
        return var_0 != self;
}

_id_5156()
{
    if ( issystemlink() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5155()
{
    if ( issplitscreen() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5154()
{
    if ( _id_6FD0() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5153()
{
    if ( _id_5156() || _id_5155() || _id_5154() )
        return 1;

    return 0;
}

_id_89DD( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnfx( var_0, var_2, var_3 );
    var_4 _id_3BB8( var_1 );
    return var_4;
}

_id_3BB8( var_0 )
{
    thread _id_850E( var_0 );
    setfxkillondelete( self, 1 );
    triggerfx( self );
}

_id_850E( var_0 )
{
    self endon( "death" );
    self endon( "stopShowFXToTeam" );
    level endon( "game_ended" );

    for (;;)
    {
        self hide();

        foreach ( var_2 in level.players )
        {
            var_3 = var_2.team;

            if ( var_3 != "axis" || var_2 _meth_842d() )
                var_3 = "allies";

            if ( var_0 == var_3 || var_0 == "neutral" )
                self showtoplayer( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_3E67( var_0 )
{
    var_1 = "h1_ak47_mp";

    if ( isdefined( var_0._id_6F84 ) && var_0._id_6F84 != "none" )
        var_1 = var_0._id_6F84;
    else if ( isdefined( var_0._id_7BFA ) && var_0._id_7BFA != "none" )
        var_1 = var_0._id_7BFA;

    return var_1;
}

_id_6D3F()
{
    self._id_74A6 = self getplayerangles();
}

_id_6D38()
{
    if ( isdefined( self._id_74A6 ) )
    {
        if ( self.team != "spectator" )
            self setplayerangles( self._id_74A6 );

        self._id_74A6 = undefined;
    }
}

_id_7FAE( var_0, var_1 )
{
    var_0 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", var_1 );
    var_0 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", var_1 );
}

spawnpatchclip( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( !isdefined( var_3 ) )
        return undefined;

    var_4 = spawn( "script_model", var_1 );
    var_4 clonebrushmodeltoscriptmodel( var_3 );
    var_4.angles = var_2;
    return var_4;
}

hardpointvisualsswap( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_1 + "_" + var_4.script_noteworthy;
        var_6 = getent( var_5, "targetname" );

        if ( !isdefined( var_6 ) )
            continue;

        var_6.script_noteworthy = var_4.script_noteworthy;
        var_6._id_79F4 = "hp";
        var_6.targetname = var_4.targetname;
        var_4 delete();
    }
}

hardpointtriggerswap( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );
    var_3 = getentarray( "hp_zone_trigger", "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        var_7 = distancesquared( var_6.origin, var_0 );

        if ( var_7 < 1 )
        {
            var_4 = var_6;
            break;
        }
    }

    var_9 = getentarray( "hp_zone_center", "targetname" );
    var_10 = undefined;

    foreach ( var_12 in var_9 )
    {
        if ( var_12 istouching( var_4 ) )
        {
            var_10 = var_12;
            break;
        }
    }

    if ( !var_10 istouching( var_2 ) )
        var_10.origin = var_2.origin;

    var_2.targetname = "hp_zone_trigger";
    var_4 delete();
}

headquarterstriggerswap( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );
    var_3 = getentarray( "radiotrigger", "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        var_7 = distancesquared( var_6.origin, var_0 );

        if ( var_7 < 1 )
        {
            var_4 = var_6;
            break;
        }
    }

    var_9 = getentarray( "hq_hardpoint", "targetname" );
    var_10 = undefined;

    foreach ( var_12 in var_9 )
    {
        if ( var_12 istouching( var_4 ) )
        {
            var_10 = var_12;
            break;
        }
    }

    if ( !var_10 istouching( var_2 ) )
        var_10.origin = var_2.origin;

    var_2.targetname = "radiotrigger";
    var_4 delete();
}

headquartersradiomove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "hq_hardpoint", "targetname" );
    var_4 = undefined;
    var_5 = isdefined( var_1 );
    var_6 = isdefined( var_2 );
    var_7 = ( 0.0, 0.0, 0.0 );
    var_8 = ( 0.0, 0.0, 0.0 );

    foreach ( var_10 in var_3 )
    {
        var_11 = distancesquared( var_10.origin, var_0 );

        if ( var_11 < 1 )
        {
            var_4 = var_10;

            if ( var_5 )
                var_7 = var_1 - var_10.origin;

            if ( var_6 )
                var_8 = var_2 - var_10.angles;

            break;
        }
    }

    if ( var_5 )
        var_4.origin = var_1;

    if ( var_6 )
        var_4.angles = var_2;

    var_13 = getentarray( var_4.target, "targetname" );

    foreach ( var_15 in var_13 )
    {
        if ( var_5 )
            var_15.origin += var_7;

        if ( var_6 )
            var_15.angles += var_8;
    }
}

demolitiontriggermove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "dd_bombzone", "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = distancesquared( var_5.origin, var_0 );

        if ( var_6 < 1 )
        {
            if ( isdefined( var_1 ) )
                var_5.origin = var_1;

            if ( isdefined( var_2 ) )
                var_5.angles = var_2;

            return;
        }
    }
}

demolitionsitemove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "dd_bombzone", "targetname" );
    var_4 = isdefined( var_1 );
    var_5 = isdefined( var_2 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = ( 0.0, 0.0, 0.0 );
    var_8 = undefined;

    foreach ( var_10 in var_3 )
    {
        if ( isdefined( var_10.script_label ) && var_10.script_label == var_0 )
        {
            var_8 = var_10;

            if ( var_4 )
                var_6 = var_1 - var_8.origin;

            if ( var_5 )
                var_7 = var_2 - var_8.angles;

            break;
        }
    }

    if ( !isdefined( var_8 ) )
        return;

    var_12 = getentarray( var_8.target, "targetname" );
    var_13 = getent( var_12[0].target, "targetname" );
    var_14 = getent( "dd_bombzone_clip" + var_0, "targetname" );
    var_15 = undefined;
    var_16 = undefined;

    for ( var_17 = 0; var_17 < var_12.size; var_17++ )
    {
        if ( isdefined( var_12[var_17]._id_79BF ) )
        {
            var_16 = var_12[var_17]._id_79BF;
            break;
        }
    }

    if ( !isdefined( var_16 ) )
        return;

    var_18 = getentarray( "exploder", "targetname" );

    foreach ( var_20 in var_18 )
    {
        if ( var_20._id_79BF == var_16 )
        {
            var_15 = var_20;
            break;
        }
    }

    if ( !isdefined( var_15 ) )
        return;

    if ( var_4 )
    {
        var_8.origin = var_1;

        foreach ( var_23 in var_12 )
            var_23.origin += var_6;

        var_13.origin += var_6;
        var_14.origin += var_6;
        var_15.origin += var_6;
    }

    if ( var_5 )
    {
        var_8.angles = var_2;

        foreach ( var_23 in var_12 )
            var_23.angles += var_7;

        var_13.angles += var_7;
        var_14.angles += var_7;
        var_15.angles += var_7;
    }
}

iscoop()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        return 1;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return 1;

    return 0;
}

setlightingstate_patched( var_0 )
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
                    var_3 common_scripts\utility::_id_84EF();
                    var_3 _meth_8550();
                    continue;
                }

                var_3 notify( "hidingLightingState" );
                var_3 common_scripts\utility::_id_485E();
            }
        }
    }
}

gettimeutc_for_stat_recording()
{
    return gettimeutc();
}

_id_5092( var_0 )
{
    return isdefined( var_0 ) && var_0;
}

waittillplayersnextsnapshot( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = var_0 _meth_8556();

    if ( !isdefined( var_1 ) )
        return;

    for (;;)
    {
        waittillframeend;
        var_2 = var_0 _meth_8557();

        if ( !isdefined( var_2 ) )
            return;

        if ( var_2 > var_1 )
            break;
    }
}

setgameplayactive( var_0 )
{
    setdvar( "bg_mpGameplayActive", var_0 );
}

gameplayactivewatch()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = 0;

        if ( isdefined( level.players ) )
        {
            foreach ( var_2 in level.players )
            {
                var_3 = isdefined( var_2.sessionstate ) && ( var_2.sessionstate == "playing" || var_2.sessionstate == "dead" );

                if ( var_3 && !isai( var_2 ) && !istestclient( var_2 ) )
                    var_0++;
            }
        }

        var_5 = var_0 >= 2;
        setgameplayactive( var_5 );
        level common_scripts\utility::_id_A069( "playerCountChanged", "playerSessionStateChanged" );
    }
}

setcarrierloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", "defaultClass", 5, "class", "inUse" ) )
        level.carrierloadouts["axis"] = _id_4017( "axis", 5 );

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", "defaultClass", 5, "class", "inUse" ) )
        level.carrierloadouts["allies"] = _id_4017( "allies", 5 );
}

applycarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50DA ) && self._id_50DA == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self ismantling() || !self isonground() )
        wait 0.05;

    if ( _id_5131() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self.pers["gamemodeLoadout"] = level.carrierloadouts[self.team];
    self._id_3BF3 = self.class;
    self.gamemode_carrierclass = 1;
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "gamemode";
    self.class = "gamemode";
    self.lastclass = "gamemode";
    self notify( "faux_spawn" );
    maps\mp\gametypes\_class::giveloadout( self.team, "gamemode" );
}

removecarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50DA ) && self._id_50DA == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self ismantling() || !self isonground() )
        wait 0.05;

    while ( _id_50C9( self getcurrentweapon() ) )
        wait 0.05;

    if ( _id_5131() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self.pers["gamemodeLoadout"] = undefined;
    self notify( "faux_spawn" );
    maps\mp\gametypes\_class::giveloadout( self.team, self.class );
}

streamcarrierweaponstoplayers( var_0, var_1, var_2 )
{
    level endon( "game_ended" );

    if ( !isdefined( level.carrierloadouts ) )
    {
        wait 1.0;

        if ( !isdefined( level.carrierloadouts ) )
            return;
    }

    var_3 = [];
    var_4 = [];
    var_5 = [];

    foreach ( var_18, var_7 in level.carrierloadouts )
    {
        if ( !common_scripts\utility::_id_0CE4( var_1, var_18 ) )
            continue;

        var_5[var_5.size] = var_18;
        var_8 = var_7["loadoutPrimary"];
        var_9 = var_7["loadoutPrimaryAttachKit"];
        var_10 = var_7["loadoutPrimaryFurnitureKit"];
        var_11 = var_7["loadoutPrimaryCamo"];
        var_12 = var_7["loadoutPrimaryReticle"];
        var_13 = int( tablelookup( "mp/camoTable.csv", 1, var_11, 0 ) );
        var_14 = int( tablelookup( "mp/reticleTable.csv", 1, var_12, 0 ) );
        var_15 = maps\mp\gametypes\_class::_id_188C( var_8, var_9, var_10, var_13, var_14, 0 );
        var_4[var_18] = [ var_15 ];
        var_16 = weaponclass( var_15 );
        var_17 = spawnstruct();
        var_17.team = var_18;
        var_17.weapon = var_15;
        var_3[var_18][var_16] = var_17;
    }

    if ( var_5.size == 0 )
        return;

    for (;;)
    {
        foreach ( var_20 in level.players )
        {
            if ( !isalive( var_20 ) || !isdefined( var_20.team ) )
                continue;

            if ( !common_scripts\utility::_id_0CE4( var_5, var_20.team ) )
                continue;

            if ( ![[ var_2 ]]( var_0, var_20 ) )
                continue;

            var_21 = var_0.curorigin;

            if ( isdefined( var_0._id_1BAF ) )
                var_21 = var_0._id_1BAF.origin;

            if ( distancesquared( var_20.origin, var_21 ) > 90000 )
                continue;

            var_20 _meth_8420( var_3[var_20.team], var_4[var_20.team] );
        }

        wait 0.5;
    }
}

_id_0CFA( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        if ( var_2 == var_1 )
        {
            var_0[var_2] = var_0[var_2 + 1];
            var_1++;
        }
    }

    var_0[var_0.size - 1] = undefined;
    return var_0;
}

streamnextspectatorweaponsifnecessary( var_0 )
{
    if ( isai( self ) )
        return;

    var_1 = undefined;

    if ( canspectatesometeam() && !( self _meth_857d( "freelook" ) && var_0 ) )
        var_1 = getnextspectateclient();

    if ( isdefined( var_1 ) )
        streamspectatorweaponsforclient( var_1 );
}

canspectatesometeam()
{
    if ( level.teambased )
    {
        if ( self _meth_857d( "allies" ) || self _meth_857d( "axis" ) )
            return 1;
    }
    else if ( self _meth_857d( "allies" ) || self _meth_857d( "axis" ) || self _meth_857d( "none" ) )
        return 1;

    return 0;
}

getnextspectateclient()
{
    var_0 = _func_302();
    var_1 = self getentitynumber();

    for ( var_2 = common_scripts\utility::mod( var_1 + 1, var_0 ); var_2 != var_1; var_2 = common_scripts\utility::mod( var_2 + 1, var_0 ) )
    {
        if ( self _meth_857e( var_2 ) )
            break;
    }

    if ( var_2 != var_1 )
    {
        foreach ( var_4 in level.players )
        {
            if ( var_4 getentitynumber() == var_2 )
                return var_4;
        }
    }

    return undefined;
}

streamspectatorweaponsforclient( var_0 )
{
    var_1 = spawnstruct();
    var_1.team = var_0.team;
    var_1.weapon = var_0.primaryweapon;
    var_2 = var_0 _meth_857f();
    return self _meth_8420( var_1, var_2 );
}

ishodgepodgemm()
{
    return isdefined( level.hodgepodgemode ) && level.hodgepodgemode == 2;
}

ishodgepodgerpgonly()
{
    return isdefined( level.hodgepodgemode ) && ( level.hodgepodgemode == 6 || level.hodgepodgemode == 7 );
}

ishodgepodgeph()
{
    return isdefined( level.hodgepodgemode ) && level.hodgepodgemode == 9;
}
