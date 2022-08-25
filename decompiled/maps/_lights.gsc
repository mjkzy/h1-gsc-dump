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

_id_4D7B()
{
    var_0 = getentarray( "generic_flickering", "targetname" );
    var_1 = getentarray( "generic_pulsing", "targetname" );
    var_2 = getentarray( "generic_double_strobe", "targetname" );
    var_3 = getentarray( "burning_trash_fire", "targetname" );
    var_4 = getentarray( "scripted_light", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_3C94 );
    common_scripts\utility::array_thread( var_1, ::_id_3CA1 );
    common_scripts\utility::array_thread( var_2, ::_id_3C8E );
    common_scripts\utility::array_thread( var_3, ::burning_trash_fire );
    common_scripts\utility::array_thread( var_4, ::_id_4D55 );
}

_id_5049( var_0 )
{
    return var_0.classname == "light_spot" || var_0.classname == "light_omni" || var_0.classname == "light";
}

_id_38D8( var_0, var_1, var_2, var_3 )
{
    self endon( "kill_flicker" );
    var_4 = var_0;
    var_5 = 0.0;
    maps\_utility::_id_32DD( "stop_flicker" );

    for (;;)
    {
        if ( maps\_utility::_id_32D8( "stop_flicker" ) )
        {
            wait 0.05;
            continue;
        }

        var_6 = var_4;
        var_4 = var_0 + ( var_1 - var_0 ) * randomfloat( 1.0 );

        if ( var_2 != var_3 )
            var_5 += randomfloatrange( var_2, var_3 );
        else
            var_5 += var_2;

        if ( var_5 == 0 )
            var_5 += 0.0000001;

        for ( var_7 = ( var_6 - var_4 ) * 1 / var_5; var_5 > 0 && !maps\_utility::_id_32D8( "stop_flicker" ); var_5 -= 0.05 )
        {
            self setlightcolor( var_4 + var_7 * var_5 );
            wait 0.05;
        }
    }
}

_id_530C( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );
    var_2 = undefined;
    var_3 = 100000000.0;

    foreach ( var_5 in var_1 )
    {
        var_6 = distance( self.origin, var_5.origin );

        if ( var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    if ( isdefined( var_2 ) )
    {
        var_2 waittill( "damage", var_8, var_9, var_10, var_11, var_12, var_13, var_14 );
        self notify( "kill_flicker" );
        wait 0.05;
        self setlightcolor( ( 0.0, 0.0, 0.0 ) );
    }
}

_id_3CA1()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        self setlightintensity( 0 );
        return;
    }

    var_0 = self getlightintensity();
    var_1 = 0.05;
    var_2 = var_0;
    var_3 = 0.3;
    var_4 = 0.6;
    var_5 = ( var_0 - var_1 ) / ( var_3 / 0.05 );
    var_6 = ( var_0 - var_1 ) / ( var_4 / 0.05 );

    for (;;)
    {
        var_7 = 0;

        while ( var_7 < var_4 )
        {
            var_2 -= var_6;
            var_2 = clamp( var_2, 0, 100 );
            self setlightintensity( var_2 );
            var_7 += 0.05;
            wait 0.05;
        }

        wait 1;
        var_7 = 0;

        while ( var_7 < var_3 )
        {
            var_2 += var_5;
            var_2 = clamp( var_2, 0, 100 );
            self setlightintensity( var_2 );
            var_7 += 0.05;
            wait 0.05;
        }

        wait 0.5;
    }
}

_id_3C8E()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        self setlightintensity( 0 );
        return;
    }

    var_0 = self getlightintensity();
    var_1 = 0.05;
    var_2 = 0;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = 0;
    var_6 = [];

    if ( isdefined( self.script_noteworthy ) )
    {
        var_7 = getentarray( self.script_noteworthy, "targetname" );

        for ( var_8 = 0; var_8 < var_7.size; var_8++ )
        {
            if ( _id_5049( var_7[var_8] ) )
            {
                var_5 = 1;
                var_6[var_6.size] = var_7[var_8];
            }

            if ( var_7[var_8].classname == "script_model" )
            {
                var_3 = var_7[var_8];
                var_4 = getent( var_3.target, "targetname" );
                var_2 = 1;
            }
        }
    }

    for (;;)
    {
        self setlightintensity( var_1 );

        if ( var_2 )
        {
            var_3 hide();
            var_4 show();
        }

        wait 0.8;
        self setlightintensity( var_0 );

        if ( var_2 )
        {
            var_3 show();
            var_4 hide();
        }

        wait 0.1;
        self setlightintensity( var_1 );

        if ( var_2 )
        {
            var_3 hide();
            var_4 show();
        }

        wait 0.12;
        self setlightintensity( var_0 );

        if ( var_2 )
        {
            var_3 show();
            var_4 hide();
        }

        wait 0.1;
    }
}

_id_3F3A( var_0 )
{
    var_1 = getentarray( "light_flicker_model", "targetname" );
    var_2 = [];
    var_3 = common_scripts\utility::_id_3F33( var_0, var_1 );

    if ( isdefined( var_3 ) )
        var_2[0] = var_3;

    return var_2;
}

_id_3C94()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        self setlightintensity( 0 );
        return;
    }

    self endon( "stop_dynamic_light_behavior" );
    self endon( "death" );
    self._id_578C = 0;
    self._id_57A6 = undefined;
    self._id_9A39 = undefined;
    self._id_578A = 0;
    self._id_5789 = [];
    self._id_578E = undefined;
    self._id_5790 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        self._id_578E = common_scripts\utility::_id_3DBD();

        foreach ( var_1 in self._id_578E )
        {
            if ( isdefined( var_1.script_noteworthy ) && var_1.script_noteworthy == "on" )
            {
                if ( !isdefined( self._id_57A6 ) )
                    self._id_57A6[0] = var_1;
                else
                    self._id_57A6[self._id_57A6.size] = var_1;

                continue;
            }

            if ( isdefined( var_1.script_noteworthy ) && var_1.script_noteworthy == "off" )
            {
                if ( !isdefined( self._id_9A39 ) )
                    self._id_9A39[0] = var_1;
                else
                    self._id_9A39[self._id_9A39.size] = var_1;

                self._id_9A38 = var_1;
                continue;
            }

            if ( _id_5049( var_1 ) )
            {
                self._id_578A = 1;
                self._id_5789[self._id_5789.size] = var_1;
            }
        }

        self._id_578C = 1;
    }

    if ( isdefined( self.script_noteworthy ) )
        self._id_5790 = getentarray( self.script_noteworthy, "targetname" );

    if ( !self._id_5790.size && !isdefined( self._id_578E ) )
        self._id_5790 = _id_3F3A( self.origin );

    for ( var_3 = 0; var_3 < self._id_5790.size; var_3++ )
    {
        if ( _id_5049( self._id_5790[var_3] ) )
        {
            self._id_578A = 1;
            self._id_5789[self._id_5789.size] = self._id_5790[var_3];
        }

        if ( self._id_5790[var_3].classname == "script_model" )
        {
            var_4 = self._id_5790[var_3];

            if ( !isdefined( self._id_57A6 ) )
                self._id_57A6[0] = var_4;
            else
                self._id_57A6[self._id_57A6.size] = var_4;

            if ( !isdefined( self._id_9A39 ) )
                self._id_9A39[0] = getent( var_4.target, "targetname" );
            else
                self._id_9A39[self._id_9A39.size] = getent( var_4.target, "targetname" );

            self._id_578C = 1;
        }
    }

    if ( isdefined( self._id_57A6 ) )
    {
        foreach ( var_4 in self._id_57A6 )
        {
            if ( isdefined( var_4 ) && isdefined( var_4._id_79F1 ) )
            {
                var_4._id_3018 = common_scripts\utility::_id_242E( var_4._id_79F1 );
                var_6 = ( 0.0, 0.0, 0.0 );
                var_7 = ( 0.0, 0.0, 0.0 );

                if ( isdefined( var_4._id_7A99 ) )
                {
                    var_8 = strtok( var_4._id_7A99, ", " );

                    if ( var_8.size < 3 )
                    {

                    }
                    else if ( var_8.size == 6 )
                    {
                        var_9 = float( var_8[0] );
                        var_10 = float( var_8[1] );
                        var_11 = float( var_8[2] );
                        var_6 = ( var_9, var_10, var_11 );
                        var_9 = float( var_8[3] );
                        var_10 = float( var_8[4] );
                        var_11 = float( var_8[5] );
                        var_7 = ( var_9, var_10, var_11 );
                    }
                    else
                    {
                        var_9 = float( var_8[0] );
                        var_10 = float( var_8[1] );
                        var_11 = float( var_8[2] );
                        var_6 = ( var_9, var_10, var_11 );
                    }
                }

                var_4._id_3018.v["origin"] = var_4.origin + var_6;
                var_4._id_3018.v["angles"] = var_4.angles + var_7;
            }
        }
    }

    thread _id_3C92();
    thread _id_3C91();
}

_id_3C92()
{
    maps\_utility::_id_32DD( "flicker_on" );

    if ( isdefined( self._id_7A23 ) && self._id_7A23 != "nil" )
    {
        for (;;)
        {
            level waittill( self._id_7A23 );
            maps\_utility::_id_32DE( "flicker_on" );

            if ( isdefined( self._id_7A24 ) && self._id_7A24 != "nil" )
            {
                level waittill( self._id_7A24 );
                maps\_utility::_id_32DA( "flicker_on" );
            }
        }
    }
    else
        maps\_utility::_id_32DE( "flicker_on" );
}

_id_3C93()
{
    var_0 = self getlightintensity();

    if ( !maps\_utility::_id_32D8( "flicker_on" ) )
    {
        if ( self._id_578C )
        {
            if ( isdefined( self._id_57A6 ) )
            {
                foreach ( var_2 in self._id_57A6 )
                {
                    var_2 hide();

                    if ( isdefined( var_2._id_3018 ) )
                        var_2._id_3018 common_scripts\utility::_id_671F();
                }
            }

            if ( isdefined( self._id_9A39 ) )
            {
                foreach ( var_5 in self._id_9A39 )
                    var_5 show();
            }
        }

        self setlightintensity( 0 );

        if ( self._id_578A )
        {
            for ( var_7 = 0; var_7 < self._id_5789.size; var_7++ )
                self._id_5789[var_7] setlightintensity( 0 );
        }

        maps\_utility::_id_32E0( "flicker_on" );
        self setlightintensity( var_0 );

        if ( self._id_578A )
        {
            for ( var_7 = 0; var_7 < self._id_5789.size; var_7++ )
                self._id_5789[var_7] setlightintensity( var_0 );
        }

        if ( self._id_578C )
        {
            if ( isdefined( self._id_57A6 ) )
            {
                foreach ( var_2 in self._id_57A6 )
                {
                    var_2 show();

                    if ( isdefined( var_2._id_3018 ) )
                        var_2._id_3018 maps\_utility::_id_748D();
                }
            }

            if ( isdefined( self._id_9A39 ) )
            {
                foreach ( var_5 in self._id_9A39 )
                    var_5 hide();
            }
        }
    }
}

_id_3C91()
{
    self endon( "stop_dynamic_light_behavior" );
    self endon( "death" );
    var_0 = 0.2;
    var_1 = 1.5;
    var_2 = self getlightintensity();
    var_3 = 0;
    var_4 = var_2;
    var_5 = 0;

    while ( isdefined( self ) )
    {
        _id_3C93();

        for ( var_5 = randomintrange( 1, 10 ); var_5; var_5-- )
        {
            _id_3C93();
            wait(randomfloatrange( 0.05, 0.1 ));

            if ( var_4 > 0.2 )
            {
                var_4 = randomfloatrange( 0, 0.3 );

                if ( self._id_578C )
                {
                    foreach ( var_7 in self._id_57A6 )
                    {
                        var_7 hide();

                        if ( isdefined( var_7._id_3018 ) )
                            var_7._id_3018 common_scripts\utility::_id_671F();
                    }
                }

                if ( isdefined( self._id_9A39 ) )
                {
                    foreach ( var_10 in self._id_9A39 )
                        var_10 show();
                }
            }
            else
            {
                var_4 = var_2;

                if ( self._id_578C )
                {
                    if ( isdefined( self._id_57A6 ) )
                    {
                        foreach ( var_7 in self._id_57A6 )
                        {
                            var_7 show();

                            if ( isdefined( var_7._id_3018 ) )
                                var_7._id_3018 maps\_utility::_id_748D();
                        }
                    }

                    if ( isdefined( self._id_9A39 ) )
                    {
                        foreach ( var_10 in self._id_9A39 )
                        {
                            var_10 hide();
                            soundscripts\_audio::_id_28A2( "light_flicker_on", var_10 );
                        }
                    }
                }
            }

            self setlightintensity( var_4 );

            if ( self._id_578A )
            {
                for ( var_16 = 0; var_16 < self._id_5789.size; var_16++ )
                    self._id_5789[var_16] setlightintensity( var_4 );
            }
        }

        _id_3C93();
        self setlightintensity( var_2 );

        if ( self._id_578A )
        {
            for ( var_16 = 0; var_16 < self._id_5789.size; var_16++ )
                self._id_5789[var_16] setlightintensity( var_2 );
        }

        if ( self._id_578C )
        {
            if ( isdefined( self._id_57A6 ) )
            {
                foreach ( var_7 in self._id_57A6 )
                {
                    var_7 show();

                    if ( isdefined( var_7._id_3018 ) )
                        var_7._id_3018 maps\_utility::_id_748D();
                }
            }

            if ( isdefined( self._id_9A39 ) )
            {
                foreach ( var_10 in self._id_9A39 )
                    var_10 hide();
            }
        }

        wait(randomfloatrange( var_0, var_1 ));
    }
}

_id_3CA3()
{
    for (;;)
        waittillframeend;
}

_id_38D9( var_0, var_1 )
{
    var_2 = self getlightintensity();
    var_3 = 0;
    var_4 = var_2;
    var_5 = 0;

    for (;;)
    {
        for ( var_5 = randomintrange( 1, 10 ); var_5; var_5-- )
        {
            wait(randomfloatrange( 0.05, 0.1 ));

            if ( var_4 > 0.2 )
                var_4 = randomfloatrange( 0, 0.3 );
            else
                var_4 = var_2;

            self setlightintensity( var_4 );
        }

        self setlightintensity( var_2 );
        wait(randomfloatrange( var_0, var_1 ));
    }
}

burning_trash_fire()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        self setlightintensity( 0 );
        return;
    }

    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0.7, var_0 * 1.2 );
        var_3 = randomfloatrange( 0.3, 0.6 );
        var_3 *= 20;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

_id_8F5F( var_0, var_1, var_2, var_3 )
{
    var_4 = 360 / var_2;
    var_5 = 0;

    for (;;)
    {
        var_6 = sin( var_5 * var_4 ) * 0.5 + 0.5;
        self setlightintensity( var_0 + ( var_1 - var_0 ) * var_6 );
        wait 0.05;
        var_5 += 0.05;

        if ( var_5 > var_2 )
            var_5 -= var_2;

        if ( isdefined( var_3 ) )
        {
            if ( common_scripts\utility::_id_382E( var_3 ) )
                return;
        }
    }
}

_id_1C80( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    thread _id_1C81( var_0, var_1, var_2, var_3 );
}

_id_1C81( var_0, var_1, var_2, var_3 )
{
    var_4 = self getlightcolor();
    var_5 = 1 / ( var_1 * 2 - var_2 + var_3 );
    var_6 = 0;

    if ( var_6 < var_2 )
    {
        for ( var_7 = var_5 / var_2; var_6 < var_2; var_6 += 0.05 )
        {
            var_8 = var_7 * var_6 * var_6;
            self setlightcolor( vectorlerp( var_4, var_0, var_8 ) );
            wait 0.05;
        }
    }

    while ( var_6 < var_1 - var_3 )
    {
        var_8 = var_5 * ( 2 * var_6 - var_2 );
        self setlightcolor( vectorlerp( var_4, var_0, var_8 ) );
        wait 0.05;
        var_6 += 0.05;
    }

    var_6 = var_1 - var_6;

    if ( var_6 > 0 )
    {
        for ( var_7 = var_5 / var_3; var_6 > 0; var_6 -= 0.05 )
        {
            var_8 = 1 - var_7 * var_6 * var_6;
            self setlightcolor( vectorlerp( var_4, var_0, var_8 ) );
            wait 0.05;
        }
    }

    self setlightcolor( var_0 );
}

_id_9260()
{
    thread _id_99CE();
    thread _id_99CD();
}

_id_99CE()
{
    self endon( "light_off" );
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0.7, var_0 * 1.2 );
        var_3 = randomfloatrange( 0.3, 1.2 );
        var_3 *= 20;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

_id_99CD()
{
    self endon( "light_off" );
    var_0 = 0.5;
    var_1 = 0.5;
    var_2 = [];
    var_3 = [];

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_2[var_4] = 0;
        var_3[var_4] = 0;
    }

    for (;;)
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            var_3[var_4] = var_2[var_4];
            var_2[var_4] = randomfloat( var_0 ) + var_1;
        }

        var_5 = randomfloatrange( 0.3, 1.2 );
        var_5 *= 20;

        for ( var_4 = 0; var_4 < var_5; var_4++ )
        {
            var_6 = [];

            for ( var_7 = 0; var_7 < var_2.size; var_7++ )
                var_6[var_7] = var_2[var_7] * var_4 / var_5 + var_3[var_7] * ( var_5 - var_4 ) / var_5;

            self setlightcolor( ( var_6[0], var_6[1], var_6[2] ) );
            wait 0.05;
        }
    }
}

_id_8FBC( var_0 )
{
    var_1 = 1;

    if ( isdefined( var_0._id_79B4 ) )
        var_1 = var_0._id_79B4;

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );
        var_0 _id_7ECB( var_1 );

        while ( var_2 istouching( var_0 ) )
            wait 0.25;
    }
}

_id_7ECB( var_0 )
{
    var_1 = getdvarint( "sm_sunenable", 1 );
    var_2 = getdvarfloat( "sm_sunshadowscale", 1.0 );
    var_3 = getdvarint( "sm_spotlimit", 4 );
    var_4 = getdvarfloat( "sm_sunsamplesizenear", 0.25 );
    var_5 = getdvarfloat( "sm_qualityspotshadow", 1.0 );

    if ( isdefined( self._id_7AE7 ) )
        var_1 = self._id_7AE7;

    if ( isdefined( self._id_7AE9 ) )
        var_2 = self._id_7AE9;

    if ( isdefined( self._id_7AD5 ) )
        var_3 = self._id_7AD5;

    if ( isdefined( self._id_7AE8 ) )
        var_4 = self._id_7AE8;

    var_4 = min( max( 0.016, var_4 ), 32 );

    if ( isdefined( self._id_7AB1 ) )
        var_5 = self._id_7AB1;

    var_6 = getdvarint( "sm_sunenable", 1 );
    var_7 = getdvarfloat( "sm_sunshadowscale", 1.0 );
    var_8 = getdvarint( "sm_spotlimit", 4 );
    var_9 = getdvarint( "sm_qualityspotshadow", 1.0 );
    setsaveddvar( "sm_sunenable", var_1 );
    setsaveddvar( "sm_sunshadowscale", var_2 );
    setsaveddvar( "sm_spotlimit", var_3 );
    setsaveddvar( "sm_qualityspotshadow", var_5 );
    _id_56A7( var_4, var_0 );
}

_id_56A7( var_0, var_1 )
{
    level notify( "changing_sunsamplesizenear" );
    level endon( "changing_sunsamplesizenear" );
    var_2 = getdvarfloat( "sm_sunSampleSizeNear", 0.25 );

    if ( var_0 == var_2 )
        return;

    var_3 = var_0 - var_2;
    var_4 = var_1 / 0.05;

    if ( var_4 > 0 )
    {
        var_5 = var_3 / var_4;
        var_6 = var_2;

        for ( var_7 = 0; var_7 < var_4; var_7++ )
        {
            var_6 += var_5;
            setsaveddvar( "sm_sunSampleSizeNear", var_6 );
            wait 0.05;
        }
    }

    setsaveddvar( "sm_sunSampleSizeNear", var_0 );
}

_id_4D55()
{
    _id_4D0B();
    _id_4D08();
}

_id_4D0B()
{
    self._id_57A6 = [];
    self._id_9A39 = [];
    self._id_578A = [];

    if ( isdefined( self.target ) )
    {
        var_0 = getentarray( self.target, "targetname" );

        if ( var_0.size == 0 )
            return;

        foreach ( var_2 in var_0 )
        {
            if ( _id_5049( var_2 ) )
            {
                self._id_578A[self._id_578A.size] = var_2;
                var_2 _id_4D0B();
                continue;
            }

            var_3 = 1;

            if ( isdefined( var_2.script_noteworthy ) )
            {
                if ( var_2.script_noteworthy == "on" )
                {
                    var_3 = 0;
                    _id_4D0C( var_2 );
                }
                else if ( var_2.script_noteworthy == "off" )
                {
                    var_3 = 0;
                    self._id_9A39[self._id_9A39.size] = var_2;
                }
            }

            if ( var_3 )
            {
                _id_4D0C( var_2 );
                var_4 = getentarray( var_2.target, "targetname" );

                foreach ( var_6 in var_4 )
                    self._id_9A39[self._id_9A39.size] = var_6;
            }
        }

        foreach ( var_2 in self._id_57A6 )
            var_2._id_9E5A = 1;

        foreach ( var_2 in self._id_9A39 )
        {
            var_2._id_9E5A = 0;
            var_2 hide();
        }
    }
}

_id_4D0C( var_0 )
{
    self._id_57A6[self._id_57A6.size] = var_0;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    if ( isdefined( var_0._id_79F1 ) )
    {
        var_1 = self._id_79F1;
        var_2 = var_0.origin;
        var_3 = var_0.angles;
    }
    else if ( isdefined( var_0.target ) )
    {
        var_4 = common_scripts\utility::_id_40FB( var_0.target, "targetname" );

        if ( isdefined( var_4 ) && isdefined( var_4._id_79F1 ) )
        {
            var_1 = var_4._id_79F1;
            var_2 = var_4.origin;
            var_3 = ( 0.0, 0.0, 0.0 );

            if ( isdefined( var_4.angles ) )
                var_3 = var_4.angles;
        }
    }

    if ( isdefined( var_1 ) )
    {
        var_0._id_3018 = common_scripts\utility::_id_242E( var_1 );
        var_0._id_3018.v["origin"] = var_2;
        var_0._id_3018.v["angles"] = var_3;
    }
}

_id_7051()
{
    self endon( "stop_scripted_light" );
    self endon( "death" );

    for (;;)
    {
        maps\_utility::_id_7B20();
        var_0 = self._id_7A1A;
        var_1 = self._id_7A1A + ( self._id_7A19 - self._id_7A1A ) * 0.4;
        var_2 = self._id_7A19 - ( self._id_7A19 - self._id_7A1A ) * 0.4;
        var_3 = self._id_7A19;
        var_4 = randomintrange( self._id_797E, self._id_797D );

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            var_6 = randomfloatrange( var_0, var_1 );
            _id_568D( var_6, _id_3D30() );
            maps\_utility::script_delay();
            var_6 = randomfloatrange( var_2, var_3 );
            _id_568D( var_6, _id_3D30() );
        }

        _id_568D( self._id_7A19, _id_3D30() );
    }
}

_id_568D( var_0, var_1 )
{
    var_2 = int( var_1 * 20 );
    var_3 = self getlightintensity();
    var_4 = ( var_0 - var_3 ) / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        thread _id_45B4( var_0 );
        self setlightintensity( var_3 + var_5 * var_4 );
        wait 0.05;
    }

    var_6[0] = self;

    if ( isdefined( self._id_578A ) )
        var_6 = common_scripts\utility::array_combine( var_6, self._id_578A );

    foreach ( var_8 in var_6 )
    {
        var_8 thread _id_45B4( var_0 );
        var_8 setlightintensity( var_0 );
    }
}

_id_45B4( var_0 )
{
    var_1 = var_0 > self._id_7AF4;

    foreach ( var_3 in self._id_57A6 )
    {
        if ( var_1 && !var_3._id_9E5A )
        {
            var_3._id_9E5A = var_1;
            var_3 show();

            if ( isdefined( var_3._id_3018 ) )
                var_3._id_3018 thread maps\_utility::_id_748D();

            continue;
        }

        if ( !var_1 && var_3._id_9E5A )
        {
            var_3._id_9E5A = var_1;
            var_3 hide();

            if ( isdefined( var_3._id_3018 ) )
                var_3._id_3018 thread common_scripts\utility::_id_671F();
        }
    }

    foreach ( var_3 in self._id_9A39 )
    {
        if ( !var_1 && !var_3._id_9E5A )
        {
            var_3._id_9E5A = 1;
            var_3 show();
            continue;
        }

        if ( var_1 && var_3._id_9E5A )
        {
            var_3._id_9E5A = 0;
            var_3 hide();
        }
    }
}

_id_3D30()
{
    return randomfloatrange( self._id_798E, self._id_798D );
}

_id_4D08()
{
    var_0["pulse"] = ::_id_2773;
    var_0["neon"] = ::_id_276E;
    var_0["fire"] = ::_id_276B;
    [[ var_0[self._id_7A22] ]]();
}

_id_2773()
{
    _id_7E0E( 0.1, 0.2 );
    _id_7F04( 1, 4 );
    _id_7DF9( 3, 6 );
    _id_7ED9( 0.5 );
    var_0 = self getlightintensity();
    _id_7E62( var_0 * 0.25, var_0 );
    thread _id_7051();
}

_id_276E()
{
    _id_7E0E( 0.05, 0.1 );
    _id_7F04( 2, 5 );
    _id_7DF9( 1, 3 );
    _id_7ED9( 0.5 );
    var_0 = self getlightintensity();
    _id_7E62( var_0 * 0.1, var_0 );
    thread _id_7051();
}

_id_276B()
{
    _id_7E0E( 0.05, 0.1 );
    _id_7F04( 0.05, 0.1 );
    _id_7DF9( 1, 2 );
    _id_7ED9( 0.5 );
    var_0 = self getlightintensity();
    _id_7E62( var_0 * 0.75, var_0 );
    thread _id_7051();
}

_id_7ED9( var_0 )
{
    if ( !isdefined( self._id_7AF4 ) )
        self._id_7AF4 = var_0;

    foreach ( var_2 in self._id_578A )
    {
        if ( !isdefined( var_2._id_7AF4 ) )
            var_2._id_7AF4 = self._id_7AF4;
    }
}

_id_7E0E( var_0, var_1 )
{
    if ( !isdefined( self._id_798E ) )
        self._id_798E = var_0;

    if ( !isdefined( self._id_798D ) )
        self._id_798D = var_1;
}

_id_7F04( var_0, var_1 )
{
    if ( !isdefined( self._id_7B23 ) )
        self._id_7B23 = var_0;

    if ( !isdefined( self._id_7B22 ) )
        self._id_7B22 = var_1;
}

_id_7DF9( var_0, var_1 )
{
    if ( !isdefined( self._id_797E ) )
        self._id_797E = var_0;

    if ( !isdefined( self._id_797D ) )
        self._id_797D = var_1;
}

_id_7E62( var_0, var_1 )
{
    if ( !isdefined( self._id_7A1A ) )
        self._id_7A1A = var_0;

    if ( !isdefined( self._id_7A19 ) )
        self._id_7A19 = var_1;
}
