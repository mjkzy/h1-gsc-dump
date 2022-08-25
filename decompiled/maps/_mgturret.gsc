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

_id_4D17()
{
    level._id_5BD9["easy"]["convergenceTime"] = 2.5;
    level._id_5BD9["easy"]["suppressionTime"] = 3.0;
    level._id_5BD9["easy"]["accuracy"] = 0.38;
    level._id_5BD9["easy"]["aiSpread"] = 2;
    level._id_5BD9["easy"]["playerSpread"] = 0.5;
    level._id_5BD9["medium"]["convergenceTime"] = 1.5;
    level._id_5BD9["medium"]["suppressionTime"] = 3.0;
    level._id_5BD9["medium"]["accuracy"] = 0.38;
    level._id_5BD9["medium"]["aiSpread"] = 2;
    level._id_5BD9["medium"]["playerSpread"] = 0.5;
    level._id_5BD9["hard"]["convergenceTime"] = 0.8;
    level._id_5BD9["hard"]["suppressionTime"] = 3.0;
    level._id_5BD9["hard"]["accuracy"] = 0.38;
    level._id_5BD9["hard"]["aiSpread"] = 2;
    level._id_5BD9["hard"]["playerSpread"] = 0.5;
    level._id_5BD9["fu"]["convergenceTime"] = 0.4;
    level._id_5BD9["fu"]["suppressionTime"] = 3.0;
    level._id_5BD9["fu"]["accuracy"] = 0.38;
    level._id_5BD9["fu"]["aiSpread"] = 2;
    level._id_5BD9["fu"]["playerSpread"] = 0.5;
}

main()
{
    if ( getdvar( "mg42" ) == "" )
        setdvar( "mgTurret", "off" );

    level._id_58D9 = 24;
    var_0 = getentarray( "turretInfo", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();
}

_id_6E4A()
{
    self detach( "weapon_mg42_carry", "tag_origin" );
    self endon( "death" );
    self.goalradius = level._id_2780;

    if ( isdefined( self.target ) )
    {
        var_0 = getnode( self.target, "targetname" );

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0.radius ) )
                self.goalradius = var_0.radius;

            self _meth_81A9( var_0 );
        }
    }

    while ( !isdefined( self.node ) )
        wait 0.05;

    var_1 = undefined;

    if ( isdefined( self.target ) )
    {
        var_0 = getnode( self.target, "targetname" );
        var_1 = var_0;
    }

    if ( !isdefined( var_1 ) )
        var_1 = self.node;

    if ( !isdefined( var_1 ) )
        return;

    if ( var_1.type != "Turret" )
        return;

    var_2 = _id_4104();
    var_2[self.node.origin + ""] = undefined;

    if ( isdefined( var_2[var_1.origin + ""] ) )
        return;

    var_3 = var_1._id_9940;

    if ( isdefined( var_3.reserved ) )
        return;

    _id_741E( var_3 );

    if ( var_3._id_519E )
        _id_5665( var_3 );
    else
        _id_76BE( var_3 );

    maps\_mg_penetration::_id_4476( var_1._id_9940 );
}

_id_5BCC()
{
    self waittill( "trigger" );
    level notify( self.targetname );
    level._id_5BCC[self.targetname] = 1;
    self delete();
}

_id_5BD6( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getaiarray( "bad_guys" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_7A35 ) && var_0._id_7A35 == var_1[var_2]._id_7A35 )
            var_1[var_2] notify( "auto_ai" );
    }

    var_3 = getspawnerarray();

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        if ( isdefined( var_3[var_2]._id_7A35 ) && var_0._id_7A35 == var_3[var_2]._id_7A35 )
            var_3[var_2].ai_mode = "auto_ai";
    }

    maps\_spawner::_id_533E( var_0 );
}

_id_5BC9( var_0 )
{
    self endon( "death" );
    self endon( "stop_suppressionFire" );

    if ( !isdefined( self._id_8FE3 ) )
        self._id_8FE3 = 1;

    for (;;)
    {
        while ( self._id_8FE3 )
        {
            self settargetentity( var_0[randomint( var_0.size )] );
            wait(2 + randomfloat( 2 ));
        }

        self cleartargetentity();

        while ( !self._id_8FE3 )
            wait 1;
    }
}

_id_5975( var_0 )
{
    var_1 = self.origin;
    self waittill( "auto_ai" );
    var_0 notify( "stopfiring" );
    var_0 setmode( "auto_ai" );
    var_0 settargetentity( level.player );
}

burst_fire_settings( var_0 )
{
    if ( var_0 == "delay" )
        return 0.2;
    else if ( var_0 == "delay_range" )
        return 0.5;
    else if ( var_0 == "burst" )
        return 0.5;
    else
        return 1.5;
}

burst_fire_unmanned()
{
    self endon( "death" );
    self endon( "stop_burst_fire_unmanned" );

    if ( isdefined( self._id_798E ) )
        var_0 = self._id_798E;
    else
        var_0 = burst_fire_settings( "delay" );

    if ( isdefined( self._id_798D ) )
        var_1 = self._id_798D - var_0;
    else
        var_1 = burst_fire_settings( "delay_range" );

    if ( isdefined( self._id_7968 ) )
        var_2 = self._id_7968;
    else
        var_2 = burst_fire_settings( "burst" );

    if ( isdefined( self._id_7967 ) )
        var_3 = self._id_7967 - var_2;
    else
        var_3 = burst_fire_settings( "burst_range" );

    var_4 = gettime();
    var_5 = "start";

    if ( isdefined( self._id_83B8 ) )
        thread _id_998D();

    for (;;)
    {
        var_6 = ( var_4 - gettime() ) * 0.001;

        if ( self isfiringturret() && var_6 <= 0 )
        {
            if ( var_5 != "fire" )
            {
                var_5 = "fire";
                thread _id_2D79();
            }

            var_6 = var_2 + randomfloat( var_3 );
            thread _id_99C3( var_6 );
            self waittill( "turretstatechange" );
            var_6 = var_0 + randomfloat( var_1 );
            var_4 = gettime() + int( var_6 * 1000 );
            continue;
        }

        if ( var_5 != "aim" )
            var_5 = "aim";

        thread _id_99C3( var_6 );
        self waittill( "turretstatechange" );
    }
}

_id_2D79()
{
    self endon( "death" );
    self endon( "turretstatechange" );

    for (;;)
    {
        self shootturret();
        self notify( "turret_fire" );
        wait 0.1;
    }
}

_id_998D()
{
    self endon( "death" );
    self endon( "stop_burst_fire_unmanned" );

    if ( isdefined( self._id_83B9 ) )
        self._id_83BA = 1;

    for (;;)
    {
        self waittill( "turret_fire" );
        playfxontag( self._id_83B8, self, "tag_origin" );

        if ( isdefined( self._id_83BA ) && self._id_83BA )
            thread _id_998E();
    }
}

_id_998E()
{
    self endon( "death" );
    self._id_83BA = 0;
    var_0 = self gettagorigin( "tag_origin" );
    var_1 = common_scripts\utility::_id_2F69( var_0, -30 );
    var_2 = var_0[2] - var_1[2];
    var_3 = var_2 / 300;
    wait(var_3);
    level thread common_scripts\utility::_id_69C2( self._id_83B9, var_1 );
    wait 1;
    self._id_83BA = 1;
}

_id_99C3( var_0 )
{
    if ( var_0 <= 0 )
        return;

    self endon( "turretstatechange" );
    wait(var_0);

    if ( isdefined( self ) )
        self notify( "turretstatechange" );
}

_id_7119( var_0 )
{
    self endon( "death" );
    self notify( "stop random_spread" );
    self endon( "stop random_spread" );
    self endon( "stopfiring" );
    self settargetentity( var_0 );

    for (;;)
    {
        if ( isplayer( var_0 ) )
            var_0.origin = self._id_5974 getorigin();
        else
            var_0.origin = self._id_5974.origin;

        var_0.origin += ( 20 - randomfloat( 40 ), 20 - randomfloat( 40 ), 20 - randomfloat( 60 ) );
        wait 0.2;
    }
}

_id_5BC4( var_0 )
{
    self notify( "stop_using_built_in_burst_fire" );
    self endon( "stop_using_built_in_burst_fire" );
    var_0 stopfiring();

    for (;;)
    {
        var_0 waittill( "startfiring" );
        thread burst_fire( var_0 );
        var_0 startfiring();
        var_0 waittill( "stopfiring" );
        var_0 stopfiring();
    }
}

burst_fire( var_0, var_1 )
{
    var_0 endon( "stopfiring" );
    self endon( "stop_using_built_in_burst_fire" );

    if ( isdefined( var_0._id_798E ) )
        var_2 = var_0._id_798E;
    else
        var_2 = burst_fire_settings( "delay" );

    if ( isdefined( var_0._id_798D ) )
        var_3 = var_0._id_798D - var_2;
    else
        var_3 = burst_fire_settings( "delay_range" );

    if ( isdefined( var_0._id_7968 ) )
        var_4 = var_0._id_7968;
    else
        var_4 = burst_fire_settings( "burst" );

    if ( isdefined( var_0._id_7967 ) )
        var_5 = var_0._id_7967 - var_4;
    else
        var_5 = burst_fire_settings( "burst_range" );

    for (;;)
    {
        var_0 startfiring();

        if ( isdefined( var_1 ) )
            var_0 thread _id_7119( var_1 );

        wait(var_4 + randomfloat( var_5 ));
        var_0 stopfiring();
        wait(var_2 + randomfloat( var_3 ));
    }
}

_spawner_mg42_think()
{
    if ( !isdefined( self._id_3864 ) )
        self._id_3864 = 0;

    if ( !isdefined( self.targetname ) )
        return;

    var_0 = getnode( self.targetname, "target" );

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_7A34 ) )
        return;

    if ( !isdefined( var_0._id_5BC3 ) )
        var_0._id_5BC3 = 1;

    self._id_7A34 = var_0._id_7A34;
    var_1 = 1;

    for (;;)
    {
        if ( var_1 )
        {
            var_1 = 0;

            if ( isdefined( var_0.targetname ) || self._id_3864 )
                self waittill( "get new user" );
        }

        if ( !var_0._id_5BC3 )
        {
            var_0 waittill( "enable mg42" );
            var_0._id_5BC3 = 1;
        }

        var_2 = [];
        var_3 = getaiarray();

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = 1;

            if ( isdefined( var_3[var_4]._id_7A34 ) && var_3[var_4]._id_7A34 == self._id_7A34 )
                var_5 = 0;

            if ( isdefined( var_3[var_4]._id_9BF5 ) )
                var_5 = 1;

            if ( var_5 )
                var_2[var_2.size] = var_3[var_4];
        }

        if ( var_2.size )
            var_3 = maps\_utility::_id_3CEF( var_0.origin, undefined, var_2 );
        else
            var_3 = maps\_utility::_id_3CEE( var_0.origin, undefined );

        var_2 = undefined;

        if ( isdefined( var_3 ) )
        {
            var_3 notify( "stop_going_to_node" );
            var_3 thread maps\_spawner::_id_4241( var_0 );
            var_3 waittill( "death" );
            continue;
        }

        self waittill( "get new user" );
    }
}

_id_5BCB()
{
    if ( !isdefined( self.ai_mode ) )
        self.ai_mode = "manual_ai";

    var_0 = getnode( self.target, "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = getent( var_0.target, "targetname" );
    var_1._id_6581 = var_0.origin;

    if ( isdefined( var_1.target ) )
    {
        if ( !isdefined( level._id_5BCC ) || !isdefined( level._id_5BCC[var_1.target] ) )
        {
            level._id_5BCC[var_1.target] = 0;
            getent( var_1.target, "targetname" ) thread _id_5BCC();
        }

        var_2 = 1;
    }
    else
        var_2 = 0;

    for (;;)
    {
        if ( self.count == 0 )
            return;

        var_3 = undefined;

        while ( !isdefined( var_3 ) )
        {
            var_3 = self dospawn();
            wait 1;
        }

        var_3 thread _id_5BC6( var_1, var_2, self.ai_mode );
        var_3 thread _id_5BC4( var_1 );
        var_3 waittill( "death" );

        if ( isdefined( self.script_delay ) )
        {
            wait(self.script_delay);
            continue;
        }

        if ( isdefined( self._id_798E ) && isdefined( self._id_798D ) )
        {
            wait(self._id_798E + randomfloat( self._id_798D - self._id_798E ));
            continue;
        }

        wait 1;
    }
}

_id_532B( var_0, var_1, var_2, var_3 )
{
    var_0 waittill( var_1 );

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_5BC6( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( var_2 == "manual_ai" )
    {
        for (;;)
        {
            thread _id_5BC5( var_0, var_1 );
            self waittill( "auto_ai" );
            _id_5F3E( var_0, "auto_ai" );
            self waittill( "manual_ai" );
        }
    }
    else
    {
        for (;;)
        {
            _id_5F3E( var_0, "auto_ai", level.player );
            self waittill( "manual_ai" );
            thread _id_5BC5( var_0, var_1 );
            self waittill( "auto_ai" );
        }
    }
}

_id_6BF2()
{
    if ( !isdefined( level._id_6ABD ) )
        return 0;

    if ( level.player getstance() == "prone" )
        return 1;

    if ( level._id_6ABE == "cow" && level.player getstance() == "crouch" )
        return 1;

    return 0;
}

_id_8AF9()
{
    if ( level.player getstance() == "prone" )
        return ( 0.0, 0.0, 5.0 );
    else if ( level.player getstance() == "crouch" )
        return ( 0.0, 0.0, 25.0 );

    return ( 0.0, 0.0, 50.0 );
}

_id_5BC5( var_0, var_1 )
{
    self endon( "death" );
    self endon( "auto_ai" );
    self.pacifist = 1;
    self _meth_81AA( var_0._id_6581 );
    self.goalradius = level._id_58D9;
    self waittill( "goal" );

    if ( var_1 )
    {
        if ( !level._id_5BCC[var_0.target] )
            level waittill( var_0.target );
    }

    self.pacifist = 0;
    var_0 setmode( "auto_ai" );
    var_0 cleartargetentity();
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3._id_782D = 3;

    if ( getdvar( "mg42" ) != "off" )
        var_3 setmodel( "temp" );

    var_3 thread _id_9274( var_0, var_2 );
    level thread _id_532B( self, "death", var_2, var_3 );
    level thread _id_532B( self, "auto_ai", var_2, var_3 );
    var_0._id_6C2D = 0;
    var_4 = 0;
    var_5 = getentarray( "mg42_target", "targetname" );

    if ( var_5.size > 0 )
    {
        var_6 = 1;
        var_7 = var_5[randomint( var_5.size )].origin;
        thread _id_83DD( var_5 );
        _id_5F3E( var_0 );
        self._id_91A2 = var_2;
        var_0 setmode( "manual_ai" );
        var_0 settargetentity( var_2 );
        var_0 notify( "startfiring" );
        var_8 = 15;
        var_9 = 0.08;
        var_10 = 0.05;
        var_2.origin = var_5[randomint( var_5.size )].origin;
        var_11 = 0;

        while ( !isdefined( level._id_6ABD ) )
        {
            var_7 = var_2.origin;

            if ( distance( var_7, var_5[self._id_4466].origin ) > var_8 )
            {
                var_12 = vectornormalize( var_5[self._id_4466].origin - var_7 );
                var_12 *= var_8;
                var_7 += var_12;
            }
            else
                self notify( "next_target" );

            var_2.origin = var_7;
            wait 0.1;
        }

        for (;;)
        {
            for ( var_13 = 0; var_13 < 1; var_13 += var_10 )
            {
                var_2.origin = var_7 * ( 1.0 - var_13 ) + ( level.player getorigin() + _id_8AF9() ) * var_13;

                if ( _id_6BF2() )
                    var_13 = 2;

                wait(var_9);
            }

            var_14 = level.player getorigin();

            while ( !_id_6BF2() )
            {
                var_2.origin = level.player getorigin();
                var_15 = var_2.origin - var_14;
                var_2.origin = var_2.origin + var_15 + _id_8AF9();
                var_14 = level.player getorigin();
                wait 0.1;
            }

            if ( _id_6BF2() )
            {
                var_11 = gettime() + 1500 + randomfloat( 4000 );

                while ( _id_6BF2() && isdefined( level._id_6ABD.target ) && gettime() < var_11 )
                {
                    var_16 = getentarray( level._id_6ABD.target, "targetname" );
                    var_16 = var_16[randomint( var_16.size )];
                    var_2.origin = var_16.origin + ( randomfloat( 30 ) - 15, randomfloat( 30 ) - 15, randomfloat( 40 ) - 60 );
                    wait 0.1;
                }
            }

            self notify( "next_target" );

            while ( _id_6BF2() )
            {
                var_7 = var_2.origin;

                if ( distance( var_7, var_5[self._id_4466].origin ) > var_8 )
                {
                    var_12 = vectornormalize( var_5[self._id_4466].origin - var_7 );
                    var_12 *= var_8;
                    var_7 += var_12;
                }
                else
                    self notify( "next_target" );

                var_2.origin = var_7;
                wait 0.1;
            }
        }
    }
    else
    {
        for (;;)
        {
            _id_5F3E( var_0 );

            while ( !isdefined( level._id_6ABD ) )
            {
                if ( !var_0._id_6C2D )
                {
                    var_0 settargetentity( level.player );
                    var_0._id_6C2D = 1;
                    var_3._id_9197 = level.player;
                }

                wait 0.2;
            }

            var_0 setmode( "manual_ai" );
            _id_5F3E( var_0 );
            var_0 notify( "startfiring" );
            var_11 = gettime() + 1500 + randomfloat( 4000 );

            while ( var_11 > gettime() )
            {
                if ( isdefined( level._id_6ABD ) )
                {
                    var_16 = getentarray( level._id_6ABD.target, "targetname" );
                    var_16 = var_16[randomint( var_16.size )];
                    var_2.origin = var_16.origin + ( randomfloat( 30 ) - 15, randomfloat( 30 ) - 15, randomfloat( 40 ) - 60 );
                    var_0 settargetentity( var_2 );
                    var_3._id_9197 = var_2;
                    wait(randomfloat( 1 ));
                    continue;
                }

                break;
            }

            var_0 notify( "stopfiring" );
            _id_5F3E( var_0 );

            if ( var_0._id_6C2D )
            {
                var_0 setmode( "auto_ai" );
                var_0 cleartargetentity();
                var_0._id_6C2D = 0;
                var_3._id_9197 = var_3;
                var_3.origin = ( 0.0, 0.0, 0.0 );
            }

            while ( isdefined( level._id_6ABD ) )
                wait 0.2;

            wait(0.75 + randomfloat( 0.2 ));
        }
    }
}

_id_83DD( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_1 = [];

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            var_1[var_2] = 0;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            self._id_4466 = randomint( var_0.size );
            self waittill( "next_target" );

            while ( var_1[self._id_4466] )
            {
                self._id_4466++;

                if ( self._id_4466 >= var_0.size )
                    self._id_4466 = 0;
            }

            var_1[self._id_4466] = 1;
        }
    }
}

_id_5F3E( var_0, var_1, var_2 )
{
    self _meth_81AA( var_0._id_6581 );
    self.goalradius = level._id_58D9;
    self waittill( "goal" );

    if ( isdefined( var_1 ) && var_1 == "auto_ai" )
    {
        var_0 setmode( "auto_ai" );

        if ( isdefined( var_2 ) )
            var_0 settargetentity( var_2 );
        else
            var_0 cleartargetentity();
    }

    self _meth_818E( var_0 );
}

_id_9274( var_0, var_1 )
{
    if ( getdvar( "mg42" ) == "off" )
        return;

    self._id_9197 = self;

    for (;;)
    {
        self.origin = var_1.origin;
        wait 0.1;
    }
}

_id_9999( var_0 )
{
    var_1 = getent( var_0.auto_mg42_target, "targetname" );
    var_2 = 0.5;

    if ( isdefined( var_1._id_7B02 ) )
        var_2 = var_1._id_7B02;

    var_3 = 2;

    if ( isdefined( var_1._id_7B01 ) )
        var_2 = var_1._id_7B01;

    for (;;)
    {
        var_1 waittill( "turret_deactivate" );
        wait(var_2 + randomfloat( var_3 - var_2 ));

        while ( !isturretactive( var_1 ) )
        {
            _id_9958( var_0, var_1 );
            wait 1.0;
        }
    }
}

_id_9958( var_0, var_1 )
{
    var_2 = getaiarray();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] _meth_8161( var_0.origin ) && var_2[var_3] _meth_8190( var_1 ) )
        {
            var_4 = var_2[var_3].keepclaimednodeifvalid;
            var_2[var_3].keepclaimednodeifvalid = 0;

            if ( !var_2[var_3] _meth_81F3( var_0 ) )
                var_2[var_3].keepclaimednodeifvalid = var_4;
        }
    }
}

_id_7F51()
{
    _id_4D17();
    var_0 = getentarray( "misc_turret", "code_classname" );
    var_1 = maps\_utility::_id_3F58();

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_7AC5 ) )
        {
            switch ( var_0[var_2]._id_7AC5 )
            {
                case "easy":
                    var_1 = "easy";
                    break;
                case "medium":
                    var_1 = "medium";
                    break;
                case "hard":
                    var_1 = "hard";
                    break;
                case "fu":
                    var_1 = "fu";
                    break;
                default:
                    continue;
            }
        }

        _id_5BC8( var_0[var_2], var_1 );
    }
}

_id_5BC8( var_0, var_1 )
{
    var_0.convergencetime = level._id_5BD9[var_1]["convergenceTime"];
    var_0.suppressiontime = level._id_5BD9[var_1]["suppressionTime"];
    var_0.accuracy = level._id_5BD9[var_1]["accuracy"];
    var_0.aispread = level._id_5BD9[var_1]["aiSpread"];
    var_0._id_6D5F = level._id_5BD9[var_1]["playerSpread"];
}

_id_5BCA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.88;

    self endon( "death" );
    self notify( "stop_mg42_target_drones" );
    self endon( "stop_mg42_target_drones" );
    self._id_2F08 = 0;

    if ( !isdefined( self._id_79D0 ) )
        self._id_79D0 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    self setmode( "manual_ai" );
    var_3 = maps\_utility::_id_3F58();

    if ( !isdefined( level._id_2F1A ) )
        var_4 = 1;
    else
        var_4 = 0;

    for (;;)
    {
        if ( var_4 )
        {
            if ( isdefined( self._id_2F24 ) )
                self setmode( self._id_279B );
            else if ( var_0 )
                self setmode( "auto_nonai" );
            else
                self setmode( "auto_ai" );

            level waittill( "new_drone" );
        }

        if ( !isdefined( self._id_63C8 ) )
            self._id_63C8 = self.convergencetime;

        self.convergencetime = 2;

        if ( !var_0 )
        {
            var_5 = self getturretowner();

            if ( !isalive( var_5 ) || isplayer( var_5 ) )
            {
                wait 0.05;
                continue;
            }
            else
                var_1 = var_5.team;
        }
        else
            var_5 = undefined;

        if ( var_1 == "allies" )
            var_6 = "axis";
        else
            var_6 = "allies";

        while ( level._id_2F1A[var_6]._id_55AE )
        {
            common_scripts\utility::_id_57FE( "mg42_drones" );

            if ( !level._id_2F1A[var_6]._id_55AE )
            {
                common_scripts\utility::_id_9A45( "mg42_drones" );
                break;
            }

            var_7 = _id_3CDB( var_6, var_2 );
            common_scripts\utility::_id_9A45( "mg42_drones" );

            if ( !isdefined( self._id_79D0 ) || !self._id_79D0 )
            {
                wait 0.05;
                break;
            }

            if ( !isdefined( var_7 ) )
            {
                wait 0.05;
                break;
            }

            if ( isdefined( self.anim_wait_func ) )
                [[ self.anim_wait_func ]]();

            if ( var_0 )
                self setmode( "manual" );
            else
                self setmode( "manual_ai" );

            self settargetentity( var_7, ( 0.0, 0.0, 32.0 ) );
            _id_2ED7( var_7, 1, var_2 );
            self cleartargetentity();
            self stopfiring();

            if ( !var_0 && !( isdefined( self getturretowner() ) && self getturretowner() == var_5 ) )
                break;
        }

        self.convergencetime = self._id_63C8;
        self._id_63C8 = undefined;
        self cleartargetentity();
        self stopfiring();

        if ( level._id_2F1A[var_6]._id_55AE )
        {
            var_4 = 0;
            continue;
        }

        var_4 = 1;
    }
}

_id_2ED7( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_3 = gettime() + var_1 * 1000;
    var_4 = 0;

    while ( var_3 > gettime() || var_4 )
    {
        common_scripts\utility::_id_57FE( "mg42_drones_target_trace" );
        var_5 = self getturrettarget( 1 );

        if ( !bullettracepassed( self gettagorigin( "tag_flash" ), var_0.origin + ( 0.0, 0.0, 40.0 ), 0, var_0 ) )
        {
            common_scripts\utility::_id_9A45( "mg42_drones_target_trace" );
            break;
        }
        else if ( isdefined( var_5 ) && distance( var_5.origin, self.origin ) < distance( self.origin, var_0.origin ) )
        {
            common_scripts\utility::_id_9A45( "mg42_drones_target_trace" );
            break;
        }

        if ( !var_4 )
        {
            self startfiring();
            var_4 = 1;
        }

        common_scripts\utility::_id_9A4A( "mg42_drones_target_trace" );
    }

    self stopfiring();
    maps\_utility::_id_8F69( level._id_2F1A[var_0.team], 1 );
}

_id_3CDB( var_0, var_1 )
{
    if ( level._id_2F1A[var_0]._id_55AE < 1 )
        return;

    var_2 = undefined;
    var_3 = anglestoforward( self.angles );

    for ( var_4 = 0; var_4 < level._id_2F1A[var_0]._id_55AE; var_4++ )
    {
        if ( !isdefined( level._id_2F1A[var_0].array[var_4] ) )
            continue;

        var_5 = vectortoangles( level._id_2F1A[var_0].array[var_4].origin - self.origin );
        var_6 = anglestoforward( var_5 );

        if ( vectordot( var_3, var_6 ) < var_1 )
            continue;

        var_2 = level._id_2F1A[var_0].array[var_4];

        if ( !bullettracepassed( self gettagorigin( "tag_flash" ), var_2 getcentroid(), 0, var_2 ) )
        {
            var_2 = undefined;
            continue;
        }

        break;
    }

    var_7 = self getturrettarget( 1 );

    if ( !isdefined( self._id_6EF6 ) )
    {
        if ( isdefined( var_2 ) && isdefined( var_7 ) && distancesquared( self.origin, var_7.origin ) < distancesquared( self.origin, var_2.origin ) )
            var_2 = undefined;
    }

    return var_2;
}

_id_7820( var_0 )
{
    var_1 = getentarray( "misc_turret", "code_classname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3].targetname ) )
            continue;

        if ( isdefined( var_1[var_3]._id_51FF ) )
            continue;

        var_2[var_1[var_3].origin + ""] = var_1[var_3];
    }

    if ( !var_2.size )
        return;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_5.type == "Path" )
            continue;

        if ( var_5.type == "Begin" )
            continue;

        if ( var_5.type == "End" )
            continue;

        var_6 = anglestoforward( ( 0, var_5.angles[1], 0 ) );

        foreach ( var_11, var_8 in var_2 )
        {
            if ( distance( var_5.origin, var_8.origin ) > 50 )
                continue;

            var_9 = anglestoforward( ( 0, var_8.angles[1], 0 ) );
            var_10 = vectordot( var_6, var_9 );

            if ( var_10 < 0.9 )
                continue;

            var_5._id_99B3 = spawn( "script_origin", var_8.origin );
            var_5._id_99B3.angles = var_8.angles;
            var_5._id_99B3.node = var_5;
            var_5._id_99B3.leftarc = 45;
            var_5._id_99B3.rightarc = 45;
            var_5._id_99B3.toparc = 15;
            var_5._id_99B3.bottomarc = 15;

            if ( isdefined( var_8.leftarc ) )
                var_5._id_99B3.leftarc = min( var_8.leftarc, 45 );

            if ( isdefined( var_8.rightarc ) )
                var_5._id_99B3.rightarc = min( var_8.rightarc, 45 );

            if ( isdefined( var_8.toparc ) )
                var_5._id_99B3.toparc = min( var_8.toparc, 15 );

            if ( isdefined( var_8.bottomarc ) )
                var_5._id_99B3.bottomarc = min( var_8.bottomarc, 15 );

            var_2[var_11] = undefined;
            var_8 delete();
        }
    }
}

auto_mgturretlink( var_0 )
{
    var_1 = getentarray( "misc_turret", "code_classname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !isdefined( var_1[var_3].targetname ) || tolower( var_1[var_3].targetname ) != "find_mgTurret" )
            continue;

        if ( !isdefined( var_1[var_3]._id_3584 ) )
            continue;

        if ( !isdefined( var_1[var_3]._id_79A8 ) )
            var_2[var_1[var_3].origin + ""] = var_1[var_3];
    }

    if ( !var_2.size )
        return;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_5.type == "Path" )
            continue;

        if ( var_5.type == "Begin" )
            continue;

        if ( var_5.type == "End" )
            continue;

        var_6 = anglestoforward( ( 0, var_5.angles[1], 0 ) );
        var_7 = getarraykeys( var_2 );

        for ( var_3 = 0; var_3 < var_7.size; var_3++ )
        {
            var_8 = var_2[var_7[var_3]];

            if ( distance( var_5.origin, var_8.origin ) > 70 )
                continue;

            var_9 = anglestoforward( ( 0, var_8.angles[1], 0 ) );
            var_10 = vectordot( var_6, var_9 );

            if ( var_10 < 0.9 )
                continue;

            var_5._id_9940 = var_8;
            var_8.node = var_5;
            var_8._id_519E = 1;
            var_2[var_7[var_3]] = undefined;
        }
    }

    var_0 = undefined;
}

_id_780D()
{
    self._id_83B4 = [];
    self._id_83B4["connected"] = [];
    self._id_83B4["ambush"] = [];

    if ( !isdefined( self._id_3584 ) )
        return;

    level._id_83B3[self._id_3584] = self;

    if ( isdefined( self._id_7B03 ) )
    {
        var_0 = strtok( self._id_7B03, " " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self._id_83B4["connected"][var_0[var_1]] = 1;
    }

    if ( isdefined( self._id_7B00 ) )
    {
        var_0 = strtok( self._id_7B00, " " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self._id_83B4["ambush"][var_0[var_1]] = 1;
    }
}

_id_74A8()
{
    self notify( "gun_placed_again" );
    self endon( "gun_placed_again" );
    self waittill( "restore_default_drop_pitch" );
    wait 1;
    self restoredefaultdroppitch();
}

_id_2F96()
{
    thread _id_2F97();
}

_id_2F97()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = self gettagorigin( level._id_6E4B );
    var_0.angles = self gettagangles( level._id_6E4B );
    var_0 setmodel( self._id_99B5 );
    var_1 = anglestoforward( self.angles );
    var_1 *= 100;
    var_0 movegravity( var_1, 0.5 );
    self detach( self._id_99B5, level._id_6E4B );
    self._id_99B5 = undefined;
    wait 0.7;
    var_0 delete();
}

_id_99AB()
{
    self endon( "kill_turret_detach_thread" );
    self endon( "dropped_gun" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_2F96();
}

_id_99AD()
{
    self endon( "death" );
    self endon( "kill_turret_detach_thread" );
    self waittill( "dropped_gun" );
    self detach( self._id_99B5, level._id_6E4B );
}

_id_74A9()
{
    self._id_76AF = undefined;
    common_scripts\utility::_id_7DB7( animscripts\init::empty );
}

_id_74AE()
{
    self waittill( "turret_deactivate" );
    self restoredefaultdroppitch();
}

_id_9AB8( var_0 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );

    for (;;)
    {
        self waittill( "saw_enemy" );
        var_0.origin = self._id_5524;
    }
}

_id_5F30( var_0, var_1 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );
    var_2 = self._id_9940.origin + ( 0.0, 0.0, 16.0 );
    var_3 = var_1.origin + ( 0.0, 0.0, 16.0 );

    for (;;)
    {
        wait 0.05;

        if ( sighttracepassed( var_0.origin, var_3, 0, undefined ) )
            continue;

        var_4 = vectortoangles( var_2 - var_0.origin );
        var_5 = anglestoforward( var_4 );
        var_5 *= 8;
        var_0.origin += var_5;
    }
}

_id_7281( var_0 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );
    var_0.bread_crumbs = [];

    for (;;)
    {
        var_0.bread_crumbs[var_0.bread_crumbs.size] = self.origin + ( 0.0, 0.0, 50.0 );
        wait 0.35;
    }
}

aim_turret_at_ambush_point_or_visible_enemy( var_0, var_1 )
{
    if ( !isalive( self._id_24DF ) && self _meth_81C2( self._id_24DF ) )
    {
        var_1.origin = self._id_5524;
        return;
    }

    var_2 = anglestoforward( var_0.angles );

    for ( var_3 = var_1.bread_crumbs.size - 3; var_3 >= 0; var_3-- )
    {
        var_4 = var_1.bread_crumbs[var_3];
        var_5 = vectornormalize( var_4 - var_0.origin );
        var_6 = vectordot( var_2, var_5 );

        if ( var_6 < 0.75 )
            continue;

        var_1.origin = var_4;

        if ( sighttracepassed( var_0.origin, var_4, 0, undefined ) )
            continue;

        break;
    }
}

_id_3751( var_0 )
{
    var_1 = _id_3E36( var_0 );
    var_2 = var_1["spot"];
    var_3 = var_1["type"];

    if ( !isdefined( var_2 ) )
        return;

    _id_741E( var_2 );
    thread _id_9AB8( var_0 );
    thread _id_5F30( var_0, var_2 );

    if ( var_3 == "ambush" )
        thread _id_7281( var_0 );

    if ( var_2._id_519E )
        _id_5665( var_2 );
    else
    {
        _id_6810( var_2 );
        _id_76BE( var_2 );
    }

    self notify( "stop_updating_enemy_target_pos" );

    if ( var_3 == "ambush" )
        aim_turret_at_ambush_point_or_visible_enemy( var_2, var_0 );

    var_2 settargetentity( var_0 );
}

_id_86BC( var_0 )
{
    var_0 setmode( "manual" );
    wait 0.5;
    var_0 setmode( "manual_ai" );
}

_id_5665( var_0 )
{
    self _meth_818F();
    animscripts\shared::_id_6869( self.primaryweapon, "none" );
    var_1 = _id_3EA9( var_0 );
    var_2 = getstartorigin( var_0.origin, var_0.angles, var_1 );
    self _meth_8162( var_2 );
    self waittill( "runto_arrived" );
    _id_9BE8( var_0 );
}

_id_6810( var_0 )
{
    self _meth_818F();
    self._id_9940 _id_4866();
}

_id_3EA9( var_0 )
{
    var_1 = [];
    var_1["saw_bipod_stand"] = level._id_5BBF["bipod_stand_setup"];
    var_1["saw_bipod_crouch"] = level._id_5BBF["bipod_crouch_setup"];
    var_1["saw_bipod_prone"] = level._id_5BBF["bipod_prone_setup"];
    return var_1[var_0.weaponinfo];
}
#using_animtree("generic_human");

_id_76BE( var_0 )
{
    var_1 = self.health;
    var_0 endon( "turret_deactivate" );
    self._id_5BC2 = var_0;
    self endon( "death" );
    self endon( "dropped_gun" );
    var_2 = _id_3EA9( var_0 );
    self._id_99B5 = "weapon_mg42_carry";
    self notify( "kill_get_gun_back_on_killanimscript_thread" );
    animscripts\shared::_id_6869( self.weapon, "none" );

    if ( self _meth_813F() )
        self.health = 1;

    self._id_76AF = %saw_gunner_run_fast;
    self._id_2485 = %saw_gunner_run_fast;
    self attach( self._id_99B5, level._id_6E4B );
    thread _id_99AB();
    var_3 = getstartorigin( var_0.origin, var_0.angles, var_2 );
    self _meth_8162( var_3 );
    wait 0.05;
    common_scripts\utility::_id_7DB7( animscripts\combat::_id_33E6 );
    common_scripts\utility::_id_1EB7( "move" );
    common_scripts\utility::_id_7E1C( "cover_crouch", ::_id_493D );

    while ( distance( self.origin, var_3 ) > 16 )
    {
        self _meth_8162( var_3 );
        wait 0.05;
    }

    self notify( "kill_turret_detach_thread" );

    if ( self _meth_813F() )
        self.health = var_1;

    if ( soundexists( "weapon_setup" ) )
        thread common_scripts\utility::_id_69C2( "weapon_setup" );

    self _meth_8140( "setup_done", var_0.origin, var_0.angles, var_2 );
    _id_74A9();
    self waittillmatch( "setup_done", "end" );
    var_0 notify( "restore_default_drop_pitch" );
    var_0 _id_84F4();
    animscripts\shared::_id_6869( self.primaryweapon, "right" );
    _id_9BE8( var_0 );
    self detach( self._id_99B5, level._id_6E4B );
    common_scripts\utility::_id_7DB7( animscripts\init::empty );
    self notify( "bcs_portable_turret_setup" );
}

_id_5F37()
{
    self _meth_8162( self._id_76E7 );
}

_id_493D()
{
    self endon( "killanimscript" );
    self waittill( "death" );
}

_id_9C1E()
{
    if ( !isdefined( self._id_9940 ) )
        return 0;

    return self._id_9940.owner == self;
}

_id_99A0()
{
    if ( !_id_9C1E() )
    {
        common_scripts\utility::_id_1EB7( "move" );
        return;
    }

    var_0 = _id_375C( "connected" );
    var_1 = var_0["spots"];

    if ( !var_1.size )
    {
        common_scripts\utility::_id_1EB7( "move" );
        return;
    }

    var_2 = self.node;

    if ( !isdefined( var_2 ) || !maps\_utility::_id_503B( var_1, var_2 ) )
    {
        var_3 = _id_4104();

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        {
            var_2 = common_scripts\utility::_id_710E( var_1 );

            if ( isdefined( var_3[var_2.origin + ""] ) )
                return;
        }
    }

    var_5 = var_2._id_9940;

    if ( isdefined( var_5.reserved ) )
        return;

    _id_741E( var_5 );

    if ( var_5._id_519E )
        _id_5665( var_5 );
    else
        _id_76BE( var_5 );

    maps\_mg_penetration::_id_4476( var_2._id_9940 );
}

_id_9BE8( var_0 )
{
    var_1 = self _meth_818E( var_0 );

    if ( var_1 )
    {
        common_scripts\utility::_id_7E1C( "move", ::_id_99A0 );
        self._id_9940 = var_0;
        thread _id_5BC4( var_0 );
        var_0 setmode( "manual_ai" );
        var_0 thread _id_74AE();
        self._id_9940 = var_0;
        var_0.owner = self;
        return 1;
    }
    else
    {
        var_0 restoredefaultdroppitch();
        return 0;
    }
}

_id_3E36( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = ::_id_3764;
    var_1[var_1.size] = ::_id_3766;
    var_1 = common_scripts\utility::array_randomize( var_1 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = [[ var_1[var_2] ]]( var_0 );

        if ( !isdefined( var_3["spots"] ) )
            continue;

        var_3["spot"] = common_scripts\utility::_id_710E( var_3["spots"] );
        return var_3;
    }
}

_id_4104()
{
    var_0 = [];
    var_1 = getaiarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2].node ) )
            continue;

        var_0[var_1[var_2].node.origin + ""] = 1;
    }

    return var_0;
}

_id_375C( var_0 )
{
    var_1 = level._id_83B3;
    var_2 = [];
    var_3 = getarraykeys( var_1 );
    var_4 = _id_4104();
    var_4[self.node.origin + ""] = undefined;

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = var_3[var_5];

        if ( var_1[var_6] == self._id_9940 )
            continue;

        var_7 = getarraykeys( self._id_9940._id_83B4[var_0] );

        for ( var_8 = 0; var_8 < var_7.size; var_8++ )
        {
            if ( var_1[var_6]._id_3584 + "" != var_7[var_8] )
                continue;

            if ( isdefined( var_1[var_6].reserved ) )
                continue;

            if ( isdefined( var_4[var_1[var_6].node.origin + ""] ) )
                continue;

            if ( distance( self.goalpos, var_1[var_6].origin ) > self.goalradius )
                continue;

            var_2[var_2.size] = var_1[var_6];
        }
    }

    var_9 = [];
    var_9["type"] = var_0;
    var_9["spots"] = var_2;
    return var_9;
}

_id_3766( var_0 )
{
    return _id_375C( "ambush" );
}

_id_3764( var_0 )
{
    var_1 = _id_375C( "connected" );
    var_2 = var_1["spots"];

    if ( !var_2.size )
        return;

    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !common_scripts\utility::_id_A347( var_2[var_4].origin, var_2[var_4].angles, var_0.origin, 0.75 ) )
            continue;

        if ( !sighttracepassed( var_0.origin, var_2[var_4].origin + ( 0.0, 0.0, 16.0 ), 0, undefined ) )
            continue;

        var_3[var_3.size] = var_2[var_4];
    }

    var_1["spots"] = var_3;
    return var_1;
}

_id_6E4C()
{
    _id_780D();
    var_0 = 1;
    self._id_519E = 1;
    self.reserved = undefined;

    if ( isdefined( self._id_51FF ) )
        return;

    if ( self.spawnflags & var_0 )
        return;

    _id_4866();
}

_id_4866()
{
    self notify( "stop_checking_for_flanking" );
    self._id_519E = 0;
    self hide();
    self._id_886E = 0;
    self makeunusable();
    self _meth_815C( 0 );
    thread _id_74A8();
}

_id_84F4()
{
    self show();
    self._id_886E = 1;
    self makeusable();
    self._id_519E = 1;
    thread _id_8EA5();
}

_id_8EA5()
{
    self endon( "stop_checking_for_flanking" );
    self waittill( "turret_deactivate" );

    if ( isalive( self.owner ) )
        self.owner notify( "end_mg_behavior" );
}

_id_996E( var_0 )
{
    var_1 = var_0 getturretowner();

    if ( !isdefined( var_1 ) )
        return 0;

    return var_1 == self;
}

_id_3153( var_0 )
{
    _id_A0C5( var_0 );
    var_0.reserved = undefined;
}

_id_A0C5( var_0 )
{
    var_0 endon( "turret_deactivate" );
    self endon( "death" );
    self waittill( "end_mg_behavior" );
}

_id_741E( var_0 )
{
    var_0.reserved = self;
    thread _id_3153( var_0 );
}
