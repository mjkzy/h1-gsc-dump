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

_id_4DBF()
{
    if ( !isdefined( level._id_3AE4 ) )
        level._id_3AE4 = [];

    if ( !isdefined( level._id_3AE4["create_triggerfx"] ) )
        level._id_3AE4["create_triggerfx"] = ::_id_23DD;

    if ( !isdefined( level._id_05B2 ) )
        level._id_05B2 = spawnstruct();

    common_scripts\utility::_id_23C8( "createfx_looper", 20 );
    level._id_3BA6 = 1;
    level._id_05B2._id_3539 = common_scripts\_exploder::_id_352A;
    waitframe;
    waitframe;
    level._id_05B2._id_3539 = common_scripts\_exploder::_id_3529;
    level._id_05B2._id_7D9E = 0;

    if ( getdvarint( "serverCulledSounds" ) == 1 )
        level._id_05B2._id_7D9E = 1;

    if ( level._id_2409 )
        level._id_05B2._id_7D9E = 0;

    if ( level._id_2409 )
        level waittill( "createfx_common_done" );

    for ( var_0 = 0; var_0 < level._id_2417.size; var_0++ )
    {
        var_1 = level._id_2417[var_0];
        var_1 common_scripts\_createfx::_id_7E40();

        switch ( var_1.v["type"] )
        {
            case "loopfx":
                var_1 thread _id_5883();
                break;
            case "oneshotfx":
                var_1 thread _id_64A0();
                break;
            case "soundfx":
                var_1 thread _id_23CA();
                break;
            case "soundfx_interval":
                var_1 thread _id_23C3();
                break;
            case "reactive_fx":
                var_1 _id_078A();
                break;
            case "soundfx_dynamic":
                var_1 thread _id_23AF();
                break;
        }

        if ( isdefined( var_1.v["stop_on_exploder"] ) )
            var_1 thread common_scripts\_createfx::stop_fx_looper_on_exploder();
    }

    _id_1CB4();
}

_id_7346()
{

}

_id_1CB4()
{

}

_id_1CD1( var_0, var_1 )
{

}

_id_6F99( var_0, var_1, var_2, var_3 )
{
    if ( getdvar( "debug" ) == "1" )
        return;
}

_id_688F()
{
    if ( isdefined( self.v["platform"] ) && isdefined( level.currentgen ) )
    {
        var_0 = self.v["platform"];

        if ( var_0 == "cg" && !level.currentgen || var_0 == "ng" && !level.nextreadghosts1 || var_0 == "xenon" && !level.xuid || var_0 == "ps3" && !level.pushable || var_0 == "pc" && !level.perk1 || var_0 == "xb3" && !level.xpmultiplier || var_0 == "ps4" && !level.radaralwayson || var_0 == "pccg" && !level.perk2 || var_0 == "!cg" && level.currentgen || var_0 == "!ng" && level.nextreadghosts1 || var_0 == "!xenon" && level.xuid || var_0 == "!ps3" && level.pushable || var_0 == "!pc" && level.perk1 || var_0 == "!xb3" && level.xpmultiplier || var_0 == "!ps4" && level.radaralwayson || var_0 == "!pccg" && level.perk2 )
            return 0;
    }

    return 1;
}

_id_649F( var_0, var_1, var_2, var_3 )
{

}

_id_353A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17 )
{
    if ( 1 )
    {
        var_18 = common_scripts\utility::_id_23FE( var_1 );
        var_18.v["origin"] = var_2;
        var_18.v["angles"] = ( 0.0, 0.0, 0.0 );

        if ( isdefined( var_4 ) )
            var_18.v["angles"] = vectortoangles( var_4 - var_2 );

        var_18.v["delay"] = var_3;
        var_18.v["exploder"] = var_0;

        if ( isdefined( level._id_241A ) )
        {
            var_19 = level._id_241A[var_18.v["exploder"]];

            if ( !isdefined( var_19 ) )
                var_19 = [];

            var_19[var_19.size] = var_18;
            level._id_241A[var_18.v["exploder"]] = var_19;
        }

        return;
    }

    var_20 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_20.origin = var_2;
    var_20.angles = vectortoangles( var_4 - var_2 );
    var_20._id_79BF = var_0;
    var_20.script_fxid = var_1;
    var_20.script_lightset = var_3;
    var_20._id_79CB = var_5;
    var_20._id_79CC = var_6;
    var_20._id_79CD = var_7;
    var_20._id_7ACA = var_8;
    var_20._id_79B5 = var_9;
    var_20._id_7981 = var_10;
    var_20._id_7AB2 = var_15;
    var_20._id_7ACB = var_11;
    var_20._id_79CE = var_16;
    var_20._id_7AB6 = var_12;
    var_20._id_798E = var_13;
    var_20._id_798D = var_14;
    var_20._id_79C1 = var_17;
    var_21 = anglestoforward( var_20.angles );
    var_21 *= 150;
    var_20._id_91D8 = var_2 + var_21;

    if ( !isdefined( level._id_062E ) )
        level._id_062E = [];

    level._id_062E[level._id_062E.size] = var_20;
}

_id_587C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = common_scripts\utility::_id_2428( var_0 );
    var_7.v["origin"] = var_1;
    var_7.v["angles"] = ( 0.0, 0.0, 0.0 );

    if ( isdefined( var_3 ) )
        var_7.v["angles"] = vectortoangles( var_3 - var_1 );

    var_7.v["delay"] = var_2;
}

_id_23C9()
{
    self._id_587B = playloopedfx( level._effect[self.v["fxid"]], self.v["delay"], self.v["origin"], 0, self.v["forward"], self.v["up"] );
    _id_23CA();
}

_id_23CA()
{
    if ( !_id_688F() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self.v["soundalias"] ) )
        return;

    if ( self.v["soundalias"] == "nil" )
        return;

    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self.v["stopable"] ) && self.v["stopable"] )
    {
        if ( isdefined( self._id_587B ) )
            var_1 = "death";
        else
            var_1 = "stop_loop";
    }
    else if ( level._id_05B2._id_7D9E && isdefined( self.v["server_culled"] ) )
        var_0 = self.v["server_culled"];

    var_2 = self;

    if ( isdefined( self._id_587B ) )
        var_2 = self._id_587B;

    var_3 = undefined;

    if ( level._id_2409 )
        var_3 = self;

    var_2 common_scripts\utility::_id_5874( self.v["soundalias"], self.v["origin"], self.v["angles"], var_0, var_1, var_3 );
}

_id_23C3()
{
    if ( !_id_688F() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self.v["soundalias"] ) )
        return;

    if ( self.v["soundalias"] == "nil" )
        return;

    var_0 = undefined;
    var_1 = self;

    if ( isdefined( self.v["stopable"] ) && self.v["stopable"] || level._id_2409 )
    {
        if ( isdefined( self._id_587B ) )
        {
            var_1 = self._id_587B;
            var_0 = "death";
        }
        else
            var_0 = "stop_loop";
    }

    var_1 thread common_scripts\utility::_id_5873( self.v["soundalias"], self.v["origin"], self.v["angles"], var_0, undefined, self.v["delay_min"], self.v["delay_max"] );
}

_id_23AF()
{
    if ( !_id_688F() )
        return;

    if ( !isdefined( self.v["ambiencename"] ) )
        return;

    if ( self.v["ambiencename"] == "nil" )
        return;

    if ( common_scripts\utility::_id_51AE() )
        return;

    if ( getdvar( "createfx" ) == "on" )
        common_scripts\utility::_id_384A( "createfx_started" );

    if ( isdefined( self._id_25CC ) )
        level.playercardbackground _meth_847a( self._id_25CC._id_9A29 );

    self._id_25CC = spawnstruct();
    self._id_25CC common_scripts\utility::_id_0D6F();
    level.playercardbackground _meth_8479( self.v["ambiencename"], self.v["origin"], self.v["dynamic_distance"], self._id_25CC._id_9A29 );
    return;
}

_id_5883()
{
    waittillframeend;

    if ( isdefined( self._id_3BB9 ) )
        level waittill( "start fx" + self._id_3BB9 );

    for (;;)
    {
        _id_23C9();

        if ( isdefined( self._id_936B ) )
            thread _id_5882( self._id_936B );

        if ( isdefined( self._id_3BBA ) )
            level waittill( "stop fx" + self._id_3BBA );
        else
            return;

        if ( isdefined( self._id_587B ) )
            self._id_587B delete();

        if ( isdefined( self._id_3BB9 ) )
        {
            level waittill( "start fx" + self._id_3BB9 );
            continue;
        }

        return;
    }
}

_id_587F( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect id changed", var_1 );
}

_id_5880( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "effect org changed", var_1 );
        self.origin = var_1;
    }
}

_id_587E( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect delay changed", var_1 );
}

_id_5881( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect deleted" );
    self delete();
}

_id_5882( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self._id_587B delete();
}

_id_5890( var_0, var_1, var_2 )
{
    level thread _id_5892( var_0, var_1, var_2 );
}

_id_5892( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1 );
    var_3.origin = var_1;
    var_3 playloopsound( var_0 );
}

_id_446A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_446B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_446B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_7 < var_6 )
    {
        var_8 = var_7;
        var_7 = var_6;
        var_6 = var_8;
    }

    var_9 = var_6;
    var_10 = var_7 - var_6;

    if ( var_5 < var_4 )
    {
        var_8 = var_5;
        var_5 = var_4;
        var_4 = var_8;
    }

    var_11 = var_4;
    var_12 = var_5 - var_4;

    if ( var_3 < var_2 )
    {
        var_8 = var_3;
        var_3 = var_2;
        var_2 = var_8;
    }

    var_13 = var_2;
    var_14 = var_3 - var_2;
    var_15 = spawnfx( level._effect[var_0], var_1 );

    if ( !level._id_2409 )
        var_15 willneverchange();

    for (;;)
    {
        var_16 = var_13 + randomint( var_14 );

        for ( var_17 = 0; var_17 < var_16; var_17++ )
        {
            triggerfx( var_15 );
            wait(var_11 + randomfloat( var_12 ));
        }

        wait(var_9 + randomfloat( var_10 ));
    }
}

_id_446C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    thread _id_446D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_446D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_8 < var_7 )
    {
        var_9 = var_8;
        var_8 = var_7;
        var_7 = var_9;
    }

    var_10 = var_7;
    var_11 = var_8 - var_7;

    if ( var_6 < var_5 )
    {
        var_9 = var_6;
        var_6 = var_5;
        var_5 = var_9;
    }

    var_12 = var_5;
    var_13 = var_6 - var_5;

    if ( var_4 < var_3 )
    {
        var_9 = var_4;
        var_4 = var_3;
        var_3 = var_9;
    }

    var_14 = var_3;
    var_15 = var_4 - var_3;
    var_2 = vectornormalize( var_2 - var_1 );
    var_16 = spawnfx( level._effect[var_0], var_1, var_2 );

    if ( !level._id_2409 )
        var_16 willneverchange();

    for (;;)
    {
        var_17 = var_14 + randomint( var_15 );

        for ( var_18 = 0; var_18 < int( var_17 / level._id_3BA6 ); var_18++ )
        {
            triggerfx( var_16 );
            var_19 = ( var_12 + randomfloat( var_13 ) ) * level._id_3BA6;

            if ( var_19 < 0.05 )
                var_19 = 0.05;

            wait(var_19);
        }

        wait(var_12 + randomfloat( var_13 ));
        wait(var_10 + randomfloat( var_11 ));
    }
}

_id_7F6E( var_0 )
{
    level._id_3BA6 = 1 / var_0;
}

_id_811E()
{
    if ( !isdefined( self.script_fxid ) || !isdefined( self.script_fxcommand ) || !isdefined( self.script_lightset ) )
        return;

    if ( isdefined( self.motiontrackerenabled ) )
    {
        if ( self.motiontrackerenabled == "toilet" )
        {
            thread _id_1929();
            return;
        }
    }

    var_0 = undefined;

    if ( isdefined( self._not_team ) )
    {
        var_1 = getent( self._not_team, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 = var_1.origin;
    }

    var_2 = undefined;

    if ( isdefined( self._id_79F2 ) )
        var_2 = self._id_79F2;

    var_3 = undefined;

    if ( isdefined( self._id_79F3 ) )
        var_3 = self._id_79F3;

    if ( self.script_fxcommand == "OneShotfx" )
        _id_649F( self.script_fxid, self.origin, self.script_lightset, var_0 );

    if ( self.script_fxcommand == "loopfx" )
        _id_587C( self.script_fxid, self.origin, self.script_lightset, var_0, var_2, var_3 );

    if ( self.script_fxcommand == "loopsound" )
        _id_5890( self.script_fxid, self.origin, self.script_lightset );

    self delete();
}

_id_1929()
{
    var_0 = ( 0, 0, self.angles[1] );
    var_1 = level._effect[self.script_fxid];
    var_2 = self.origin;
    wait 1;
    level thread _id_192A( var_0, var_2, var_1 );
    self delete();
}

_id_192A( var_0, var_1, var_2 )
{
    for (;;)
    {
        playfx( var_2, var_1 );
        wait(30 + randomfloat( 40 ));
    }
}

_id_23DD()
{
    if ( !_id_9D87( self.v["fxid"] ) )
        return;

    if ( isdefined( self.v["tintcolor"] ) || isdefined( self.v["tintalpha"] ) || isdefined( self.v["fadein"] ) || isdefined( self.v["fadeout"] ) || isdefined( self.v["emissive"] ) || isdefined( self.v["sizescale"] ) )
    {
        var_0 = self.v["tintcolor"];

        if ( !isdefined( var_0 ) )
            var_0 = ( 1.0, 1.0, 1.0 );

        var_1 = self.v["tintalpha"];

        if ( !isdefined( var_1 ) )
            var_1 = 1;

        var_2 = self.v["fadein"];

        if ( !isdefined( var_2 ) )
            var_2 = ( 0.0, 0.0, 0.0 );

        var_3 = self.v["fadeout"];

        if ( !isdefined( var_3 ) )
            var_3 = ( 0.0, 0.0, 0.0 );

        var_4 = self.v["emissive"];

        if ( !isdefined( var_4 ) )
            var_4 = 1;

        var_5 = self.v["sizescale"];

        if ( !isdefined( var_5 ) )
            var_5 = 1;

        self._id_587B = spawnfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"], var_0, var_1, var_2, var_3, var_4, var_5 );
    }
    else
        self._id_587B = spawnfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"] );

    triggerfx( self._id_587B, self.v["delay"] );

    if ( !level._id_2409 )
        self._id_587B willneverchange();
    else
        setfxkillondelete( self._id_587B, 1 );

    _id_23CA();
}

_id_9D87( var_0 )
{
    if ( isdefined( level._effect[var_0] ) )
        return 1;

    if ( !isdefined( level._id_05F3 ) )
        level._id_05F3 = [];

    level._id_05F3[self.v["fxid"]] = var_0;
    _id_9D88( var_0 );
    return 0;
}

_id_9D88( var_0 )
{
    level notify( "verify_effects_assignment_print" );
    level endon( "verify_effects_assignment_print" );
    wait 0.05;
    var_1 = getarraykeys( level._id_05F3 );

    foreach ( var_3 in var_1 )
    {

    }
}

_id_64A0()
{
    wait 0.05;

    if ( !_id_688F() )
        return;

    if ( self.v["delay"] > 0 )
        wait(self.v["delay"]);

    [[ level._id_3AE4["create_triggerfx"] ]]();
}

_id_078A()
{
    if ( !_id_688F() )
        return;

    if ( !common_scripts\utility::_id_51AE() && getdvar( "createfx" ) == "" )
        return;

    if ( !isdefined( level._id_05B2._id_7190 ) )
    {
        level._id_05B2._id_7190 = 1;
        level thread _id_718E();
    }

    if ( !isdefined( level._id_05B2._id_718D ) )
        level._id_05B2._id_718D = [];

    level._id_05B2._id_718D[level._id_05B2._id_718D.size] = self;
    self._id_60C0 = 3000;
}

_id_718E()
{
    if ( !common_scripts\utility::_id_51AE() )
    {
        if ( getdvar( "createfx" ) == "on" )
            common_scripts\utility::_id_384A( "createfx_started" );
    }

    level._id_05B2._id_718F = [];
    var_0 = 256;

    for (;;)
    {
        level waittill( "code_damageradius", var_1, var_0, var_2, var_3 );
        var_4 = _id_8892( var_2, var_0 );

        foreach ( var_7, var_6 in var_4 )
            var_6 thread _id_6998( var_7 );
    }
}

_id_9C71( var_0 )
{
    return ( var_0[0], var_0[1], 0 );
}

_id_8892( var_0, var_1 )
{
    var_2 = [];
    var_3 = gettime();

    foreach ( var_5 in level._id_05B2._id_718D )
    {
        if ( var_5._id_60C0 > var_3 )
            continue;

        var_6 = var_5.v["reactive_radius"] + var_1;
        var_6 *= var_6;

        if ( distancesquared( var_0, var_5.v["origin"] ) < var_6 )
            var_2[var_2.size] = var_5;
    }

    foreach ( var_5 in var_2 )
    {
        var_9 = _id_9C71( var_5.v["origin"] - level.playercardbackground.origin );
        var_10 = _id_9C71( var_0 - level.playercardbackground.origin );
        var_11 = vectornormalize( var_9 );
        var_12 = vectornormalize( var_10 );
        var_5._id_2D80 = vectordot( var_11, var_12 );
    }

    for ( var_14 = 0; var_14 < var_2.size - 1; var_14++ )
    {
        for ( var_15 = var_14 + 1; var_15 < var_2.size; var_15++ )
        {
            if ( var_2[var_14]._id_2D80 > var_2[var_15]._id_2D80 )
            {
                var_16 = var_2[var_14];
                var_2[var_14] = var_2[var_15];
                var_2[var_15] = var_16;
            }
        }
    }

    foreach ( var_5 in var_2 )
    {
        var_5.origin = undefined;
        var_5._id_2D80 = undefined;
    }

    for ( var_14 = 4; var_14 < var_2.size; var_14++ )
        var_2[var_14] = undefined;

    return var_2;
}

_id_6998( var_0 )
{
    var_1 = _id_3E4D();

    if ( !isdefined( var_1 ) )
        return;

    self._id_60C0 = gettime() + 3000;
    var_1.origin = self.v["origin"];
    var_1._id_506C = 1;
    wait(var_0 * randomfloatrange( 0.05, 0.1 ));

    if ( common_scripts\utility::_id_51AE() )
    {
        var_1 playsound( self.v["soundalias"], "sounddone" );
        var_1 waittill( "sounddone" );
    }
    else
    {
        var_1 playsound( self.v["soundalias"] );
        wait 2;
    }

    wait 0.1;
    var_1._id_506C = 0;
}

_id_3E4D()
{
    foreach ( var_1 in level._id_05B2._id_718F )
    {
        if ( !var_1._id_506C )
            return var_1;
    }

    if ( level._id_05B2._id_718F.size < 4 )
    {
        var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_1._id_506C = 0;
        level._id_05B2._id_718F[level._id_05B2._id_718F.size] = var_1;
        return var_1;
    }

    return undefined;
}
