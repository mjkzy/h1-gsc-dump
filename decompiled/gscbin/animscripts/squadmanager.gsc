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

_id_4D5F()
{
    if ( isdefined( anim._id_8ACF ) && anim._id_8ACF )
        return;

    anim._id_8AC9 = [];
    anim._id_8ACA = [];
    anim._id_8AD5 = [];
    anim._id_8ACE = [];
    anim._id_8AD4 = 0;
    anim._id_8ACF = 1;
    _id_A5A4::_id_7DF3();
}

_id_2441( var_0, var_1 )
{
    anim._id_8AD5[var_0] = spawnstruct();
    var_2 = anim._id_8AD5[var_0];
    var_2.stand = var_0;
    var_2.team = _id_40E4( var_1 );
    var_2._id_856A = 0;
    var_2.origin = undefined;
    var_2.forward = undefined;
    var_2.enemy = undefined;
    var_2._id_5124 = 0;
    var_2._id_5BA0 = 0;
    var_2._id_5BA6 = [];
    var_2._id_6376 = [];
    var_2._id_6374 = 0;
    var_2._id_8AD0 = [];
    var_2._id_5B9D = [];
    var_2._id_5B9E = [];
    var_2._id_5BA4 = [];
    var_2._id_5BA5 = [];
    var_2._id_8AD9 = [];
    var_2._id_8ADA = [];
    var_2._id_8ACD = anim._id_8ACE.size;
    var_2 _id_4E29( "combat", 0.75 );
    var_2 _id_4E29( "cover", 0.75 );
    var_2 _id_4E29( "move", 0.75 );
    var_2 _id_4E29( "stop", 0.75 );
    var_2 _id_4E29( "death", 0.75 );
    var_2 _id_4E29( "suppressed", 0.75 );
    var_2 _id_4E29( "attacking", 0.5 );
    anim._id_8ACE[anim._id_8ACE.size] = var_2;
    var_2 _id_9B74();
    level notify( "squad created " + var_0 );
    anim notify( "squad created " + var_0 );

    for ( var_3 = 0; var_3 < anim._id_8AC9.size; var_3++ )
    {
        var_4 = anim._id_8AC9[var_3];
        var_2 thread [[ var_4 ]]();
    }

    for ( var_3 = 0; var_3 < anim._id_8ACE.size; var_3++ )
        anim._id_8ACE[var_3] _id_9B74();

    var_2 thread _id_9BA2();
    var_2 thread _id_8AD8();
    var_2 thread _id_6377();
    var_2 thread _id_9B36();
    return var_2;
}

_id_286C( var_0 )
{
    if ( var_0 == "axis" || var_0 == "team3" || var_0 == "allies" )
        return;

    var_1 = anim._id_8AD5[var_0]._id_8ACD;
    var_2 = anim._id_8AD5[var_0];
    var_2 notify( "squad_deleting" );

    while ( var_2._id_5BA6.size )
        var_2._id_5BA6[0] _id_084F( var_2._id_5BA6[0].team );

    anim._id_8ACE[var_1] = anim._id_8ACE[anim._id_8ACE.size - 1];
    anim._id_8ACE[var_1]._id_8ACD = var_1;
    anim._id_8ACE[anim._id_8ACE.size - 1] = undefined;
    anim._id_8AD5[var_0] = undefined;
    level notify( "squad deleted " + var_0 );
    anim notify( "squad deleted " + var_0 );

    for ( var_3 = 0; var_3 < anim._id_8ACE.size; var_3++ )
        anim._id_8ACE[var_3] _id_9B74();
}

_id_3C86()
{
    var_0 = "auto" + anim._id_8AD4;
    anim._id_8AD4++;
    return var_0;
}

_id_081E( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_7AD7 ) )
            var_0 = self._id_7AD7;
        else
            var_0 = self.team;
    }

    if ( !isdefined( anim._id_8AD5[var_0] ) )
        anim _id_2441( var_0, self );

    var_1 = anim._id_8AD5[var_0];
    self._id_8AB0 = var_1;
}

_id_8AC8()
{
    self endon( "death" );
    wait 10.0;

    if ( !isdefined( self._id_7AD7 ) )
        var_0 = self.team + self._id_79DD;
    else
        var_0 = self._id_7AD7 + self._id_79DD;

    _id_084F( var_0 );
}

_id_40E4( var_0 )
{
    var_1 = "allies";

    if ( var_0.team == "axis" || var_0.team == "neutral" || var_0.team == "team3" )
        var_1 = var_0.team;

    return var_1;
}

_id_084F( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_79DD ) )
            thread _id_8AC8();

        if ( isdefined( self._id_7AD7 ) )
            var_0 = self._id_7AD7;
        else
            var_0 = self.team;
    }

    if ( !isdefined( anim._id_8AD5[var_0] ) )
        anim _id_2441( var_0, self );

    var_1 = anim._id_8AD5[var_0];

    if ( isdefined( self._id_8AB0 ) )
    {
        if ( self._id_8AB0 == var_1 )
            return;
        else
            _id_73AD();
    }

    self._id_559D = 0;
    self._id_20B5 = 0;
    self._id_8AB0 = var_1;
    self._id_5BA3 = var_1._id_5BA6.size;
    var_1._id_5BA6[self._id_5BA3] = self;
    var_1._id_5BA0 = var_1._id_5BA6.size;

    if ( isdefined( level._id_57DA ) )
    {
        if ( self.team == "allies" && animscripts\battlechatter::_id_5164() )
            _id_0817();
    }

    for ( var_2 = 0; var_2 < self._id_8AB0._id_5B9D.size; var_2++ )
    {
        var_3 = self._id_8AB0._id_5B9D[var_2];
        self thread [[ var_3 ]]( self._id_8AB0.stand );
    }

    thread _id_5B9F();
    thread _id_5BA1();
}

_id_73AD()
{
    var_0 = self._id_8AB0;
    var_1 = -1;

    if ( isdefined( self ) )
        var_1 = self._id_5BA3;
    else
    {
        for ( var_2 = 0; var_2 < var_0._id_5BA6.size; var_2++ )
        {
            if ( var_0._id_5BA6[var_2] == self )
                var_1 = var_2;
        }
    }

    if ( var_1 != var_0._id_5BA6.size - 1 )
    {
        var_3 = var_0._id_5BA6[var_0._id_5BA6.size - 1];
        var_0._id_5BA6[var_1] = var_3;

        if ( isdefined( var_3 ) )
            var_3._id_5BA3 = var_1;
    }

    var_0._id_5BA6[var_0._id_5BA6.size - 1] = undefined;
    var_0._id_5BA0 = var_0._id_5BA6.size;

    if ( isdefined( self._id_6375 ) )
        _id_73BD();

    for ( var_2 = 0; var_2 < self._id_8AB0._id_5BA4.size; var_2++ )
    {
        var_4 = self._id_8AB0._id_5BA4[var_2];
        self thread [[ var_4 ]]( var_0.stand );
    }

    if ( var_0._id_5BA0 == 0 )
        _id_286C( var_0.stand );

    if ( isdefined( self ) )
    {
        self._id_8AB0 = undefined;
        self._id_5BA3 = undefined;
    }

    self notify( "removed from squad" );
}

_id_0817()
{
    var_0 = self._id_8AB0;

    if ( isdefined( self._id_6375 ) )
        return;

    self._id_6375 = var_0._id_6376.size;
    var_0._id_6376[self._id_6375] = self;
    var_0._id_6374 = var_0._id_6376.size;
}

_id_73BD()
{
    var_0 = self._id_8AB0;
    var_1 = -1;

    if ( isdefined( self ) )
        var_1 = self._id_6375;
    else
    {
        for ( var_2 = 0; var_2 < var_0._id_6376.size; var_2++ )
        {
            if ( var_0._id_6376[var_2] == self )
                var_1 = var_2;
        }
    }

    if ( var_1 != var_0._id_6376.size - 1 )
    {
        var_3 = var_0._id_6376[var_0._id_6376.size - 1];
        var_0._id_6376[var_1] = var_3;

        if ( isdefined( var_3 ) )
            var_3._id_6375 = var_1;
    }

    var_0._id_6376[var_0._id_6376.size - 1] = undefined;
    var_0._id_6374 = var_0._id_6376.size;

    if ( isdefined( self ) )
        self._id_6375 = undefined;
}

_id_6377()
{
    if ( !isdefined( level._id_57DA ) )
        anim waittill( "loadout complete" );

    for ( var_0 = 0; var_0 < self._id_5BA6.size; var_0++ )
    {
        if ( self._id_5BA6[var_0] animscripts\battlechatter::_id_5164() )
            self._id_5BA6[var_0] _id_0817();
    }
}

_id_9BA2()
{
    for (;;)
    {
        anim waittill( "squadupdate", var_0 );

        switch ( var_0 )
        {
            case "squadlist":
                _id_9B74();
                continue;
            case "combat":
                _id_9B02();
                continue;
            case "origin":
                _id_9B44();
                continue;
            case "forward":
                _id_9B25();
                continue;
        }
    }
}

_id_8AD8()
{
    anim endon( "squad deleted " + self.stand );
    var_0 = 0.1;

    if ( level.currentgen )
        var_0 = 0.5;

    for (;;)
    {
        _id_9AF1();
        wait(var_0);
    }
}

_id_5BA1()
{
    self endon( "removed from squad" );
    self waittill( "death", var_0 );

    if ( isdefined( self ) )
        self.attacker = var_0;

    _id_73AD();
}

_id_5B9F()
{
    self endon( "removed from squad" );

    for (;;)
    {
        self waittill( "enemy" );

        if ( !isdefined( self.enemy ) )
            self._id_8AB0 notify( "squadupdate", "combat" );
        else
            self._id_8AB0._id_5124 = 1;

        wait 0.05;
    }
}

_id_9B25()
{
    if ( isdefined( self.enemy ) )
        self.forward = vectornormalize( self.enemy.origin - self.origin );
    else
    {
        var_0 = ( 0, 0, 0 );
        var_1 = 0;

        for ( var_2 = 0; var_2 < self._id_5BA6.size; var_2++ )
        {
            if ( !isalive( self._id_5BA6[var_2] ) )
                continue;

            var_0 += anglestoforward( self._id_5BA6[var_2].angles );
            var_1++;
        }

        if ( var_1 )
        {
            self.forward = ( var_0[0] / var_1, var_0[1] / var_1, var_0[2] / var_1 );
            return;
        }

        self.forward = var_0;
    }
}

_id_9B44()
{
    var_0 = ( 0, 0, 0 );
    var_1 = 0;

    for ( var_2 = 0; var_2 < self._id_5BA6.size; var_2++ )
    {
        if ( !isalive( self._id_5BA6[var_2] ) )
            continue;

        var_0 += self._id_5BA6[var_2].origin;
        var_1++;
    }

    if ( var_1 )
        self.origin = ( var_0[0] / var_1, var_0[1] / var_1, var_0[2] / var_1 );
    else
        self.origin = var_0;
}

_id_9B02()
{
    self._id_5124 = 0;

    for ( var_0 = 0; var_0 < anim._id_8ACE.size; var_0++ )
        self._id_8AD0[anim._id_8ACE[var_0].stand]._id_5125 = 0;

    for ( var_0 = 0; var_0 < self._id_5BA6.size; var_0++ )
    {
        if ( isdefined( self._id_5BA6[var_0].enemy ) && isdefined( self._id_5BA6[var_0].enemy._id_8AB0 ) && self._id_5BA6[var_0]._id_20B5 > 0 )
            self._id_8AD0[self._id_5BA6[var_0].enemy._id_8AB0.stand]._id_5125 = 1;
    }
}

_id_9B15()
{
    var_0 = undefined;

    for ( var_1 = 0; var_1 < self._id_5BA6.size; var_1++ )
    {
        if ( isdefined( self._id_5BA6[var_1].enemy ) && isdefined( self._id_5BA6[var_1].enemy._id_8AB0 ) )
        {
            if ( !isdefined( var_0 ) )
            {
                var_0 = self._id_5BA6[var_1].enemy._id_8AB0;
                continue;
            }

            if ( self._id_5BA6[var_1].enemy._id_8AB0._id_5BA0 > var_0._id_5BA0 )
                var_0 = self._id_5BA6[var_1].enemy._id_8AB0;
        }
    }

    self.enemy = var_0;
}

_id_9AF1()
{
    var_0 = ( 0, 0, 0 );
    var_1 = 0;
    var_2 = undefined;
    var_3 = 0;
    _id_9B02();

    for ( var_4 = 0; var_4 < self._id_5BA6.size; var_4++ )
    {
        if ( !isalive( self._id_5BA6[var_4] ) )
            continue;

        var_0 += self._id_5BA6[var_4].origin;
        var_1++;

        if ( isdefined( self._id_5BA6[var_4].enemy ) && isdefined( self._id_5BA6[var_4].enemy._id_8AB0 ) )
        {
            if ( !isdefined( var_2 ) )
            {
                var_2 = self._id_5BA6[var_4].enemy._id_8AB0;
                continue;
            }

            if ( self._id_5BA6[var_4].enemy._id_8AB0._id_5BA0 > var_2._id_5BA0 )
                var_2 = self._id_5BA6[var_4].enemy._id_8AB0;
        }
    }

    if ( var_1 )
        self.origin = ( var_0[0] / var_1, var_0[1] / var_1, var_0[2] / var_1 );
    else
        self.origin = var_0;

    self._id_5124 = var_3;
    self.enemy = var_2;
    _id_9B25();
}

_id_9B74()
{
    for ( var_0 = 0; var_0 < anim._id_8ACE.size; var_0++ )
    {
        if ( !isdefined( self._id_8AD0[anim._id_8ACE[var_0].stand] ) )
        {
            self._id_8AD0[anim._id_8ACE[var_0].stand] = spawnstruct();
            self._id_8AD0[anim._id_8ACE[var_0].stand]._id_5125 = 0;
        }

        for ( var_1 = 0; var_1 < self._id_8AD9.size; var_1++ )
        {
            var_2 = self._id_8AD9[var_1];
            self thread [[ var_2 ]]( anim._id_8ACE[var_0].stand );
        }
    }
}

_id_6FA9( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    if ( !isdefined( var_3 ) )
        var_3 = ( 1, 0, 0 );

    for ( var_4 = 0; var_4 < var_1 * 2; var_4++ )
    {
        if ( !isalive( self ) )
            return;

        var_5 = self getshootatpos() + ( 0, 0, 10 ) + var_2;
        wait 0.05;
    }
}

_id_09A9( var_0 )
{
    switch ( var_0 )
    {
        case "stop":
        case "move":
        case "death":
        case "combat":
            self.a._id_8D56 = var_0;
            break;
        case "pain":
        case "grenadecower":
            break;
        case "cover_crouch":
        case "cover_stand":
        case "cover_left":
        case "cover_right":
        case "cover_prone":
        case "cover_multi":
        case "cover_swim_left":
        case "cover_swim_right":
        case "cover_swim_up":
        case "cover_wide_left":
        case "cover_wide_right":
        case "concealment_crouch":
        case "concealment_prone":
        case "concealment_stand":
        case "stalingrad_cover_crouch":
            self.a._id_8D56 = "cover";
            break;
        case "aim":
        case "l33t truckride combat":
            self.a._id_8D56 = "combat";
            break;
    }
}

_id_9B77()
{
    _id_745E( "combat" );
    _id_745E( "cover" );
    _id_745E( "move" );
    _id_745E( "stop" );
    _id_745E( "death" );
    _id_745E( "suppressed" );
    _id_745E( "attacking" );

    for ( var_0 = 0; var_0 < self._id_5BA6.size; var_0++ )
    {
        if ( !isalive( self._id_5BA6[var_0] ) )
            continue;

        _id_7094( self._id_5BA6[var_0] );
        _id_7095( self._id_5BA6[var_0], "suppressed" );
        _id_7095( self._id_5BA6[var_0], "combat" );
        _id_7095( self._id_5BA6[var_0], "attacking" );
        _id_7095( self._id_5BA6[var_0], "cover" );
    }
}

_id_9B36()
{
    anim endon( "squad deleted " + self.stand );
    var_0 = 0.05;

    if ( level.currentgen )
        var_0 = 0.25;

    for (;;)
    {
        for ( var_1 = 0; var_1 < self._id_5BA6.size; var_1++ )
        {
            if ( !isalive( self._id_5BA6[var_1] ) )
                continue;

            self._id_5BA6[var_1] _id_09AA( var_0 );
            self._id_5BA6[var_1] _id_09AB( var_0 );
        }

        wait(var_0);
    }
}

_id_09AA( var_0 )
{
    if ( isdefined( self.leanamount ) )
    {
        if ( self._id_20B5 < 0 )
            self._id_20B5 = var_0;
        else
            self._id_20B5 += var_0;

        self._id_559D = gettime();
        return;
    }
    else if ( self _meth_81d1() )
    {
        self._id_20B5 += var_0;
        return;
    }

    if ( self._id_20B5 > 0 )
        self._id_20B5 = 0 - var_0;
    else
        self._id_20B5 -= var_0;
}

_id_09AB( var_0 )
{
    if ( self._id_8FE4 )
    {
        if ( self._id_8FE7 < 0 )
            self._id_8FE7 = var_0;
        else
            self._id_8FE7 += var_0;
    }
    else
    {
        if ( self._id_8FE7 > 0 )
        {
            self._id_8FE7 = 0 - var_0;
            return;
        }

        self._id_8FE7 -= var_0;
    }
}

_id_4E29( var_0, var_1 )
{
    self._id_8AD6[var_0] = spawnstruct();
    self._id_8AD6[var_0]._id_070E = var_1;
    self._id_8AD6[var_0].isactive = 0;
    self._id_8AD6[var_0]._id_628D = 0;
}

_id_745E( var_0 )
{
    self._id_8AD6[var_0].isactive = 0;
    self._id_8AD6[var_0]._id_628D = 0;
}

_id_7094( var_0 )
{
    self._id_8AD6[var_0.a._id_8D56]._id_628D++;

    if ( self._id_8AD6[var_0.a._id_8D56]._id_628D > self._id_8AD6[var_0.a._id_8D56]._id_070E * self._id_5BA6.size )
        self._id_8AD6[var_0.a._id_8D56].isactive = 1;
}

_id_7095( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "suppressed":
            if ( var_0._id_8FE7 > 1.0 )
                self._id_8AD6[var_1]._id_628D++;

            break;
        case "combat":
            if ( var_0._id_20B5 > 0.0 )
                self._id_8AD6[var_1]._id_628D++;

            break;
        case "attacking":
            if ( gettime() < var_0.a._id_55D7 + 2000 )
                self._id_8AD6[var_1]._id_628D++;

            break;
        case "cover":
            if ( !var_0 animscripts\battlechatter::_id_5103() )
                self._id_8AD6[var_1]._id_628D++;

            break;
    }

    if ( self._id_8AD6[var_1]._id_628D > self._id_8AD6[var_1]._id_070E * self._id_5BA6.size )
        self._id_8AD6[var_1].isactive = 1;
}
