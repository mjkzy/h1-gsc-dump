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

_id_0850( var_0 )
{
    self endon( "death" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    if ( self._id_1CA5 )
        return;

    if ( !isdefined( self._id_8AB0._id_1CA5 ) || !self._id_8AB0._id_1CA5 )
        self._id_8AB0 animscripts\battlechatter::_id_4D5E();

    self._id_32A8 = "infantry";
    self._id_1A07 = [];

    if ( isplayer( self ) )
    {
        self._id_132D = 0;
        self.type = "human";
        return;
    }

    if ( self.type == "dog" )
    {
        self._id_32A8 = undefined;
        self._id_132D = 0;
        return;
    }

    self._id_2243 = anim._id_2244[self._id_9F32];

    if ( isdefined( self._id_79EE ) )
    {
        var_1 = tolower( self._id_79EE );

        if ( issubstr( var_1, "grigsby" ) )
            self._id_6252 = "grg";
        else if ( issubstr( var_1, "griggs" ) )
            self._id_6252 = "grg";
        else if ( issubstr( var_1, "price" ) )
            self._id_6252 = "pri";
        else if ( issubstr( var_1, "gaz" ) )
            self._id_6252 = "gaz";
        else
            _id_7FC1();
    }
    else
        _id_7FC1();

    thread _id_0987();
    _id_4C72();
    thread _id_09A6();
}

_id_09A6()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_0 = 0.5;
    wait(var_0);
    thread _id_0955();
    thread _id_0954();

    if ( self.team == "allies" )
    {
        wait(var_0);
        thread aiflankerwaiter();
        thread _id_094F();
    }

    wait(var_0);
    thread _id_0948();
}

_id_7FC1()
{
    var_0 = anim._id_9BF9[self._id_9F32];
    var_1 = var_0.size;
    var_2 = randomintrange( 0, var_1 );
    var_3 = var_2;

    for ( var_4 = 0; var_4 <= var_1; var_4++ )
    {
        if ( var_0[( var_2 + var_4 ) % var_1].count < var_0[var_3].count )
            var_3 = ( var_2 + var_4 ) % var_1;
    }

    thread _id_6253( var_3 );
    self._id_6252 = var_0[var_3]._id_6252;
}

_id_6253( var_0 )
{
    anim._id_9BF9[self._id_9F32][var_0].count++;
    self waittill( "death" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    anim._id_9BF9[self._id_9F32][var_0].count--;
}

_id_0948()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        animscripts\battlechatter::_id_6A2E();
        wait(0.3 + randomfloat( 0.2 ));
    }
}

_id_0987()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        self._id_1342 = animscripts\battlechatter::_id_4030();
        self._id_1346 = animscripts\battlechatter::_id_40A9();
        self waittill( "set name and rank" );
    }
}

_id_73AE( var_0 )
{
    if ( !isalive( self ) && animscripts\battlechatter::_id_1357() )
    {
        _id_094C();
        _id_094A();
    }

    if ( isdefined( self ) )
    {
        self._id_132D = 0;
        self._id_1CA5 = 0;
    }

    self notify( "removed from battleChatter" );

    if ( isdefined( self ) )
    {
        self._id_1CA6 = undefined;
        self._id_60DA = undefined;
        self._id_60DB = undefined;
        self._id_51B3 = undefined;
        self._id_32A8 = undefined;
        self._id_1A07 = undefined;
        self._id_2243 = undefined;
        self._id_6252 = undefined;
    }
}

_id_4C72()
{
    self._id_1CA6 = [];
    self._id_1CA6["threat"] = spawnstruct();
    self._id_1CA6["threat"]._id_351C = 0;
    self._id_1CA6["threat"]._id_6FBE = 0.0;
    self._id_1CA6["response"] = spawnstruct();
    self._id_1CA6["response"]._id_351C = 0;
    self._id_1CA6["response"]._id_6FBE = 0.0;
    self._id_1CA6["reaction"] = spawnstruct();
    self._id_1CA6["reaction"]._id_351C = 0;
    self._id_1CA6["reaction"]._id_6FBE = 0.0;
    self._id_1CA6["inform"] = spawnstruct();
    self._id_1CA6["inform"]._id_351C = 0;
    self._id_1CA6["inform"]._id_6FBE = 0.0;
    self._id_1CA6["order"] = spawnstruct();
    self._id_1CA6["order"]._id_351C = 0;
    self._id_1CA6["order"]._id_6FBE = 0.0;
    self._id_1CA6["custom"] = spawnstruct();
    self._id_1CA6["custom"]._id_351C = 0;
    self._id_1CA6["custom"]._id_6FBE = 0.0;
    self._id_60DA = gettime() + 50;
    self._id_60DB["threat"] = 0;
    self._id_60DB["reaction"] = 0;
    self._id_60DB["response"] = 0;
    self._id_60DB["inform"] = 0;
    self._id_60DB["order"] = 0;
    self._id_60DB["custom"] = 0;
    self._id_51B3 = 0;
    self._id_134D = 0.0;

    if ( isdefined( self._id_795A ) && !self._id_795A )
        self._id_132D = 0;
    else
        self._id_132D = level._id_132D[self.team];

    self._id_1CA5 = 1;
}

_id_0840( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1ADD( "threat", var_0, var_2 ) )
        return;

    if ( isdefined( var_1._id_1A07 ) && isdefined( var_1._id_1A07[self._id_8AB0.squadname] ) )
        return;

    var_3 = animscripts\battlechatter::_id_23EA( "threat", var_0, var_2 );

    switch ( var_0 )
    {
        case "infantry":
            var_3._id_9317 = var_1;
            break;
        case "vehicle":
            var_3._id_9317 = var_1;
            break;
    }

    if ( isdefined( var_1._id_8AB0 ) )
        self._id_8AB0 animscripts\battlechatter::_id_9B0A( var_1._id_8AB0.squadname, self );

    self._id_1CA6["threat"] = undefined;
    self._id_1CA6["threat"] = var_3;
}

_id_0826( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1ADD( "response", var_0, var_3, var_1 ) )
        return;

    if ( var_2 != level.player )
    {
        if ( isstring( var_2._id_6252 ) && isstring( self._id_6252 ) && var_2._id_6252 == self._id_6252 )
            return;
        else if ( !isstring( var_2._id_6252 ) && !isstring( self._id_6252 ) && var_2._id_6252 == self._id_6252 )
            return;
    }

    var_4 = animscripts\battlechatter::_id_23EA( "response", var_0, var_3 );

    switch ( var_0 )
    {
        case "killfirm":
            var_4._id_747E = var_2;
            var_4._id_5D47 = var_1;
            break;
        case "ack":
            var_4._id_747E = var_2;
            var_4._id_5D47 = var_1;
    }

    self._id_1CA6["response"] = undefined;
    self._id_1CA6["response"] = var_4;
}

_id_07E7( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1ADD( "inform", var_0, var_3, var_1 ) )
        return;

    var_4 = animscripts\battlechatter::_id_23EA( "inform", var_0, var_3 );

    switch ( var_0 )
    {
        case "reloading":
            var_4._id_5D47 = var_1;
            var_4._id_4C66 = var_2;
            break;
        default:
            var_4._id_5D47 = var_1;
    }

    self._id_1CA6["inform"] = undefined;
    self._id_1CA6["inform"] = var_4;
}

_id_0824( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1ADD( "reaction", var_0, var_3, var_1 ) )
        return;

    var_4 = animscripts\battlechatter::_id_23EA( "reaction", var_0, var_3 );

    switch ( var_0 )
    {
        case "casualty":
            var_4._id_71CF = var_2;
            var_4._id_5D47 = var_1;
            break;
        case "taunt":
            var_4._id_71CF = var_2;
            var_4._id_5D47 = var_1;
    }

    self._id_1CA6["reaction"] = undefined;
    self._id_1CA6["reaction"] = var_4;
}

_id_081B( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1ADD( "order", var_0, var_3, var_1 ) )
        return;

    if ( isdefined( var_2 ) && var_2.type == "dog" )
        return;

    var_4 = animscripts\battlechatter::_id_23EA( "order", var_0, var_3 );
    var_4._id_5D47 = var_1;
    var_4._id_6580 = var_2;

    switch ( var_0 )
    {

    }

    self._id_1CA6["order"] = undefined;
    self._id_1CA6["order"] = var_4;
}

_id_8AD3()
{
    anim endon( "battlechatter disabled" );
    anim endon( "squad deleted " + self.squadname );

    for (;;)
    {
        var_0 = undefined;

        if ( self._id_6376.size )
            var_1 = self._id_6376;
        else
            var_1 = self._id_5BA6;

        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( isalive( var_1[var_3] ) )
                var_2[var_2.size] = var_1[var_3];
        }

        if ( var_2.size )
        {
            var_0 = common_scripts\utility::_id_3F33( level.player.origin, var_2 );
            var_0 _id_0988();
            var_0 waittill( "death" );
        }

        wait 3.0;
    }
}

getthreats( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_32A8 ) )
            continue;

        if ( !level.player animscripts\battlechatter::_id_6E26( var_0[var_2].origin ) )
            continue;

        var_0[var_2].threatid = var_1.size;
        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

_id_8AD7()
{
    anim endon( "battlechatter disabled" );
    anim endon( "squad deleted " + self.squadname );

    for (;;)
    {
        wait(randomfloatrange( 0.25, 0.75 ));
        var_0 = getthreats( getaiarray( "axis" ) );

        if ( !var_0.size )
            continue;

        var_1 = [];

        for ( var_2 = 0; var_2 < self._id_5BA6.size; var_2++ )
        {
            if ( !isalive( self._id_5BA6[var_2] ) )
                continue;

            if ( !var_0.size )
            {
                var_0 = var_1;
                var_1 = [];
            }

            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
            {
                if ( !isdefined( var_0[var_3] ) )
                {
                    if ( var_3 == 0 )
                        var_0 = [];

                    continue;
                }

                if ( !isalive( var_0[var_3] ) )
                    continue;

                if ( !self._id_5BA6[var_2] _meth_81c2( var_0[var_3] ) )
                    continue;

                self._id_5BA6[var_2] _id_0840( var_0[var_3]._id_32A8, var_0[var_3] );
                var_1[var_1.size] = var_0[var_3];
                var_0[var_3] = undefined;
                var_0[var_3] = var_0[var_0.size - 1];
                var_0[var_0.size - 1] = undefined;

                if ( !isdefined( var_0[0] ) )
                    var_0 = [];

                break;
            }

            wait 0.05;
        }
    }
}

flexiblethreatwaiter()
{
    anim endon( "battlechatter disabled" );
    anim endon( "squad deleted " + self.squadname );

    for (;;)
    {
        wait 0.5;
        var_0 = filterthreats( getaiarray( "axis" ) );

        if ( !var_0.size )
            continue;

        var_1 = [];

        for ( var_2 = 0; var_2 < self._id_5BA6.size; var_2++ )
        {
            if ( !var_0.size )
            {
                var_0 = var_1;
                var_1 = [];
            }

            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
            {
                if ( !isdefined( var_0[var_3] ) )
                {
                    if ( var_3 == 0 )
                        var_0 = [];

                    continue;
                }

                if ( getdvar( "bcs_threatLimitTargettedBySelf" ) == "on" )
                {
                    if ( !isdefined( self._id_5BA6[var_2].enemy ) || var_0[var_3] != self._id_5BA6[var_2].enemy )
                        continue;

                    if ( gettime() > self._id_5BA6[var_2]._id_559D + 2000 )
                        continue;
                }
                else if ( !self._id_5BA6[var_2] _meth_81c2( var_0[var_3] ) )
                    continue;

                if ( getdvar( "bcs_threatLimitSpeakerDist" ) != "off" )
                {
                    var_4 = int( getdvar( "bcs_threatLimitSpeakerDist" ) );

                    if ( distance( level.player.origin, self._id_5BA6[var_2].origin ) > var_4 )
                        continue;
                }

                self._id_5BA6[var_2] _id_0840( var_0[var_3]._id_32A8, var_0[var_3] );
                var_1[var_1.size] = var_0[var_3];
                var_0[var_3] = undefined;
                var_0[var_3] = var_0[var_0.size - 1];
                var_0[var_0.size - 1] = undefined;

                if ( !isdefined( var_0[0] ) )
                    var_0 = [];

                break;
            }
        }
    }
}

filterthreats( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !var_0[var_2]._id_132D )
            continue;

        if ( getdvar( "bcs_threatLimitTargetingPlayer" ) == "on" )
        {
            if ( !isdefined( var_0[var_2].enemy ) || var_0[var_2].enemy != level.player )
                continue;
        }

        if ( getdvar( "bcs_threatLimitInPlayerFOV" ) == "on" )
        {
            if ( !level.player animscripts\battlechatter::_id_6E26( var_0[var_2].origin ) )
                continue;
        }

        if ( getdvar( "bcs_threatLimitThreatDist" ) != "off" )
        {
            var_3 = int( getdvar( "bcs_threatLimitThreatDist" ) );

            if ( distance( level.player.origin, var_0[var_2].origin ) > var_3 )
                continue;
        }

        if ( getdvar( "bcs_threatLimitInLocation" ) == "on" )
        {
            if ( !isdefined( var_0[var_2] animscripts\battlechatter::_id_400A() ) && !isdefined( var_0[var_2] animscripts\battlechatter::getlandmark() ) )
                continue;
        }

        var_0[var_2].threatid = var_1.size;
        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

randomthreatwaiter()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    anim endon( "squad deleted " + self.squadname );

    for (;;)
    {
        if ( getdvar( "bcs_enable" ) == "off" )
        {
            wait 1.0;
            continue;
        }

        var_0 = gettime();

        for ( var_1 = 0; var_1 < self._id_5BA6.size; var_1++ )
        {
            if ( !isdefined( self._id_5BA6[var_1].enemy ) )
                continue;

            var_2 = self._id_5BA6[var_1].enemy;

            if ( !var_2._id_132D )
                continue;

            if ( !isdefined( var_2 animscripts\battlechatter::_id_400A() ) && !isdefined( var_2 animscripts\battlechatter::getlandmark() ) )
                continue;

            if ( var_0 > self._id_5BA6[var_1]._id_559D + 2000 )
                continue;

            self._id_8AD0[var_2._id_8AB0.squadname]._id_1A07 = 1;
            self._id_5BA6[var_1] _id_0840( var_2._id_32A8, var_2 );
        }

        wait 1.0;
    }
}

aithreatwaiter()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
}

_id_094C()
{
    var_0 = self.attacker;

    if ( isdefined( self ) )
    {
        for ( var_1 = 0; var_1 < self._id_8AB0._id_5BA6.size; var_1++ )
        {
            if ( isalive( self._id_8AB0._id_5BA6[var_1] ) )
                self._id_8AB0._id_5BA6[var_1] thread _id_094B();
        }
    }

    if ( isalive( var_0 ) && issentient( var_0 ) && isdefined( var_0._id_8AB0 ) && var_0._id_132D )
    {
        if ( isdefined( var_0._id_1A07[var_0._id_8AB0.squadname] ) )
            var_0._id_1A07[var_0._id_8AB0.squadname] = undefined;

        for ( var_1 = 0; var_1 < self._id_8AB0._id_5BA6.size; var_1++ )
        {
            if ( !isdefined( var_0._id_32A8 ) )
                return;

            if ( !isdefined( var_0 animscripts\battlechatter::_id_400A() ) && !isdefined( var_0 animscripts\battlechatter::getlandmark() ) )
                continue;

            if ( gettime() > self._id_8AB0._id_5BA6[var_1]._id_559D + 2000 )
                continue;

            self._id_8AB0._id_5BA6[var_1] _id_0840( var_0._id_32A8, var_0 );
        }
    }
}

_id_094B()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    wait 1.5;
    _id_0824( "casualty", "generic", self, 0.9 );
}

_id_094A()
{
    var_0 = self.attacker;

    if ( !isalive( var_0 ) || !issentient( var_0 ) || !isdefined( var_0._id_8AB0 ) )
        return;

    if ( isdefined( self._id_1A07[var_0._id_8AB0.squadname] ) && isalive( self._id_1A07[var_0._id_8AB0.squadname]._id_8A97 ) && self._id_1A07[var_0._id_8AB0.squadname]._id_8A97 != var_0 && gettime() < self._id_1A07[var_0._id_8AB0.squadname]._id_351C )
    {
        if ( var_0 == level.player )
            return;

        return;
    }
    else if ( var_0 != level.player )
        var_0 thread _id_0960();
}

_id_0960()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    wait 1.5;
    _id_07E7( "killfirm", "infantry" );
}

_id_0988()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !isdefined( self._id_8AB0._id_1CA5 ) )
        self._id_8AB0 waittill( "squad chat initialized" );

    for (;;)
    {
        if ( getdvar( "bcs_enable" ) == "off" )
        {
            wait 1.0;
            continue;
        }

        _id_082C();
        wait(randomfloatrange( 3.0, 6.0 ));
    }
}

_id_0955()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        self waittill( "grenade danger", var_0 );

        if ( getdvar( "bcs_enable" ) == "off" )
            continue;

        if ( !isdefined( var_0 ) || var_0.model != "projectile_m67fraggrenade" )
            continue;

        if ( distance( var_0.origin, level.player.origin ) < 512 )
            _id_07E7( "incoming", "grenade" );
    }
}

aiflankerwaiter()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        level waittill( "flanker", var_0 );

        if ( getdvar( "bcs_enable" ) == "off" )
            continue;

        if ( isdefined( self._id_2557 ) )
            return;

        _id_139A();
        addthreataliasex( "infantry", "generic" );
        addgenericaliasex( "direction", "relative", var_0 );
        _id_3158( 2000 );
    }
}

aiflankerorderwaiter()
{

}

_id_094F()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( getdvar( "bcs_enable" ) == "off" )
            continue;

        if ( gettime() < self.a._id_665F + 4000 )
            continue;

        _id_0826( "ack", "yes", level.player, 1.0 );
    }
}

_id_33B5( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    if ( !isdefined( self.node ) )
        return;

    var_1 = distance( self.origin, self.node.origin );

    if ( var_1 < 250 )
        return;

    if ( !animscripts\battlechatter::isnodecover() )
        return;

    var_2 = animscripts\battlechatter::getclosestspeaker( "order", 0 );

    if ( !isdefined( var_2 ) || distance( self.origin, var_2.origin ) > 800 )
        var_2 = animscripts\battlechatter::getclosestspeaker( "order" );

    if ( isdefined( var_2 ) && distance( self.origin, var_2.origin ) < 800 && self._id_20B5 > 0.0 )
    {
        anim._id_5F63.origin = self.node.origin;
        var_3 = anim._id_5F63 animscripts\battlechatter::getlandmark();
        self._id_8AB0 animscripts\squadmanager::_id_9B77();

        if ( isdefined( var_3 ) && soundexists( var_2._id_2243 + "_" + var_2._id_6252 + "_order_cover_" + var_3._id_7A20 ) )
        {
            var_2 _id_081B( "cover", var_3._id_7A20, self );
            return;
        }

        if ( self._id_8AB0._id_8AD6["move"].isactive )
        {
            var_2 _id_081B( "move", "forward", self );
            return;
        }

        var_2 _id_081B( "cover", "generic", self );
        return;
        return;
    }
    else if ( isdefined( var_2 ) && distance( self.origin, var_2.origin ) < 600 )
    {
        if ( animscripts\battlechatter::_id_5164() )
            _id_081B( "move", "follow", var_2 );
        else
        {
            if ( self._id_20B5 < 0.0 )
                return;

            _id_081B( "action", "coverme", var_2 );
        }
    }
    else if ( distance( self.origin, level.player.origin ) < 500 )
    {
        if ( self._id_20B5 < 0.0 )
            return;

        _id_081B( "action", "coverme", level.player );
    }
}

_id_0954()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    for (;;)
    {
        level waittill( "follow order", var_0 );

        if ( !animscripts\battlechatter::_id_1357() )
            return;

        if ( var_0.team != self.team )
            continue;

        wait 1.5;

        if ( !isalive( var_0 ) )
            continue;

        if ( !animscripts\battlechatter::_id_1ADD( "response" ) )
            continue;

        if ( distance( self.origin, var_0.origin ) < 600 )
            _id_0826( "ack", "follow", var_0 );
    }
}

_id_33B6()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    var_0 = animscripts\battlechatter::getclosestspeaker( "response" );

    if ( isdefined( var_0 ) && isdefined( var_0.a.personimmeleeing ) )
        var_0 = undefined;

    _id_07E7( "reloading", "generic" );
}

_id_33B4()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return 0;

    if ( !isdefined( self.enemy ) )
        return 0;

    return 0;
}

_id_33B3()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    if ( !isdefined( self.enemy ) )
        return;
}

_id_33B7()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    if ( !self._id_8FE4 )
        return;

    _id_07E7( "suppressed", "generic" );
}

_id_33B1( var_0 )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( !animscripts\battlechatter::_id_1357() )
        return;

    switch ( var_0 )
    {
        case "grenade":
            _id_07E7( "attack", "grenade" );
            break;
    }
}

_id_082C()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );

    if ( self._id_8AB0._id_8AD6["combat"].isactive )
        _id_082B();
    else
        addsituationalidleorder();
}

addsituationalidleorder()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_0 = self._id_8AB0;
    var_0 animscripts\squadmanager::_id_9B77();

    if ( var_0._id_8AD6["move"].isactive )
        _id_081B( "move", "generic" );
}

_id_082B()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    var_0 = self._id_8AB0;
    var_0 animscripts\squadmanager::_id_9B77();

    if ( var_0._id_8AD6["suppressed"].isactive )
    {
        if ( var_0._id_8AD6["move"].isactive )
            _id_081B( "cover", "generic" );
        else if ( var_0._id_8AD6["cover"].isactive )
            _id_081B( "action", "grenade" );
        else if ( randomfloat( 1 ) > 0.5 )
            _id_081B( "displace", "generic" );
        else
            _id_081B( "cover", "generic" );
    }
    else
    {
        if ( self.team == "allies" )
            var_1 = getaiarray( "axis" );
        else
            var_1 = getaiarray( "allies" );

        if ( var_0._id_8AD6["attacking"].isactive )
        {
            var_2 = 0;

            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
            {
                if ( var_1[var_3] animscripts\battlechatter::isclaimednodewindow() )
                    var_2 = 1;
            }

            if ( var_2 )
            {
                _id_081B( "attack", "window" );
                return;
            }

            _id_081B( "action", "boost" );
            return;
        }
        else if ( var_0._id_8AD6["combat"].isactive )
        {
            var_2 = 0;

            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
            {
                if ( var_1[var_3] animscripts\battlechatter::isclaimednodewindow() )
                    var_2 = 1;
            }

            if ( var_2 )
                _id_081B( "attack", "window" );
            else
                _id_081B( "action", "suppress" );
        }
    }
}

_id_139A()
{
    if ( !animscripts\battlechatter::_id_1357() )
        return;

    self._id_2558 = animscripts\battlechatter::_id_23EB();
}

addthreataliasex( var_0, var_1 )
{
    if ( !animscripts\battlechatter::_id_1357() )
        return;

    self._id_2558 animscripts\battlechatter::_id_0837( 1.0, var_0, var_1 );
}

addgenericaliasex( var_0, var_1, var_2 )
{
    if ( !animscripts\battlechatter::_id_1357() )
        return;

    self._id_2558 animscripts\battlechatter::addgenericalias( 1.0, var_0, var_1, var_2 );
}

_id_3158( var_0, var_1 )
{
    if ( !animscripts\battlechatter::_id_1357() )
        return;

    var_2 = animscripts\battlechatter::_id_23EA( "custom", "generic", 1.0 );

    if ( isdefined( var_0 ) )
        var_2._id_351C = gettime() + var_0;

    if ( isdefined( var_1 ) )
        var_2.type = var_1;
    else
        var_2.type = "custom";

    self._id_1CA6["custom"] = undefined;
    self._id_1CA6["custom"] = var_2;
}
