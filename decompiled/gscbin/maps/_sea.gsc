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

main()
{
    level._sea_scale = 1;
    level.sea_model = getent( "sea", "targetname" );
    level._sea_org = spawn( "script_origin", level.sea_model.origin );
    level._sea_org._id_6379 = level.sea_model.origin * -1;
    level._sea_org.sway = "sway2";
    level._sea_link = spawn( "script_origin", level.sea_model.origin );
    level._sea_link._id_6379 = level._sea_org._id_6379;
    level.sea_model linkto( level._sea_link );
    level.sea_foam = getent( "sea_foam", "targetname" );

    if ( isdefined( level.sea_foam ) )
    {
        level.sea_foam linkto( level._sea_link );
        level.sea_foam hide();
    }

    level.sea_black = getent( "sea_black", "targetname" );

    if ( isdefined( level.sea_black ) )
        level.sea_black linkto( level._sea_link );

    common_scripts\utility::_id_383D( "_sea_waves" );
    common_scripts\utility::_id_383D( "_sea_viewbob" );
    common_scripts\utility::_id_383D( "_sea_bob" );
    common_scripts\utility::_id_383F( "_sea_bob" );
    common_scripts\utility::_id_383F( "_sea_viewbob" );
    var_0 = getentarray( "boat_sway", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::_id_0D13( var_0, ::sea_objectbob, level._sea_org );

    thread sea_logic();
    return;
}
#using_animtree("script_model");

sea_animate()
{
    self._id_0C72 = "sea";
    self useanimtree( #animtree );
    self _meth_814d( %cargoship_water );
}

sea_logic()
{
    wait 0.05;
    var_0 = getmapsundirection();
    setsundirection( var_0 );
    level._id_57A8 = vectortoangles( var_0 );
    level._id_60A3 = level._id_57A8;
    level._sea_org thread sea_bob();
    level._sea_org thread sea_litebob();
    level._sea_org thread sea_waves();
    level._sea_org thread sea_viewbob();
}

sea_objectbob_precalc( var_0, var_1 )
{
    self.waittime = randomfloatrange( 0.5, 1 );

    if ( isdefined( self.setscale ) )
        self._id_782D = self.setscale;
    else
        self._id_782D = randomfloatrange( 2, 3 );

    var_2 = 0;
    var_3 = 0;

    switch ( var_1 )
    {
        case "sway1":
            var_2 = self.sway1max;
            break;
        case "sway2":
            var_2 = self.sway2max;
            break;
    }

    if ( self.axial )
    {
        var_4 = var_0.runto_arrived[0] * self.pratio * self._id_782D + var_0.runto_arrived[2] * self.rratio * self._id_782D;

        if ( var_2 < abs( var_4 ) )
        {
            if ( var_4 < 1 )
                var_3 = var_2 * -1;
            else
                var_3 = var_2;
        }
        else
            var_3 = var_4;

        self.ang = ( self.angles[0], self.angles[1], var_3 );
    }
    else
        self.ang = var_0.runto_arrived * self._id_782D;
}

sea_objectbob( var_0 )
{
    if ( isdefined( self.teambalanced ) )
    {
        var_1 = getentarray( self.teambalanced, "target" );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] linkto( self );
    }

    var_3 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );
    var_4 = var_3[0].origin;
    var_5 = undefined;
    var_6 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_6.axial = 0;

    if ( isdefined( var_3[1] ) )
    {
        var_5 = var_3[1].origin;
        var_6.axial = 1;
    }
    else
    {
        var_7 = anglestoup( var_3[0].angles );
        var_7 *= 10;
        var_5 = var_4 + var_7;
    }

    var_6.origin = var_4;
    var_6.angles = vectortoangles( var_5 - var_4 );
    var_6.pratio = 1;
    var_6.rratio = 1;
    var_6.sway1max = 100;
    var_6.sway2max = 100;
    var_6.setscale = undefined;

    if ( isdefined( var_3[0]._id_7A99 ) )
    {
        var_8 = strtok( var_3[0]._id_7A99, ":;, " );

        for ( var_2 = 0; var_2 < var_8.size; var_2++ )
        {
            switch ( var_8[var_2] )
            {
                case "axial":
                    var_6.axial = 1;
                    continue;
                case "sway1":
                    var_2++;
                    var_6.sway1max = int( var_8[var_2] );
                    continue;
                case "sway2":
                    var_2++;
                    var_6.sway2max = int( var_8[var_2] );
                    continue;
                case "setscale":
                    var_2++;

                    if ( var_8[var_2] == "randomrange" )
                    {
                        var_2++;
                        var_9 = int( var_8[var_2] );
                        var_2++;
                        var_10 = int( var_8[var_2] );
                        var_6.setscale = randomfloatrange( var_9, var_10 );
                    }
                    else
                        var_6.setscale = int( var_8[var_2] );

                    continue;
            }
        }
    }

    if ( var_6.axial )
    {
        var_11 = undefined;
        var_12 = ( 0, 360, 0 );

        if ( !isdefined( var_3[1] ) )
            var_11 = var_3[0].angles;
        else
            var_11 = vectortoangles( var_5 - var_4 );

        var_6.rratio = vectordot( anglestoright( var_11 ), anglestoright( var_12 ) );
        var_6.pratio = vectordot( anglestoright( var_11 ), anglestoforward( var_12 ) );
    }

    self._id_577B = var_6;
    self notify( "got_link" );

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
        var_3[var_2] thread sea_objectbob_findparent( var_6, var_0 );

    wait 0.05;
    self linkto( var_6 );

    if ( isdefined( self._id_7A99 ) )
    {

    }

    thread sea_objectbob_logic( var_0, var_6 );
}

sea_objectbob_logic( var_0, var_1 )
{
    for (;;)
    {
        if ( var_0.sway == "sway2" )
            var_0 waittill( "sway1" );

        var_1 sea_objectbob_precalc( var_0, "sway1" );
        var_1 notify( "precalcdone1" );

        if ( !isdefined( var_1._id_6685 ) )
            wait(var_1.waittime);

        var_1 rotateto( var_1.ang, var_0.titleunlocked, var_0.titleunlocked * 0.5, var_0.titleunlocked * 0.5 );

        if ( var_0.sway == "sway1" )
            var_0 waittill( "sway2" );

        var_1 sea_objectbob_precalc( var_0, "sway2" );
        var_1 notify( "precalcdone2" );

        if ( !isdefined( var_1._id_6685 ) )
            wait(var_1.waittime);

        var_1 rotateto( var_1.ang, var_0.titleunlocked, var_0.titleunlocked * 0.5, var_0.titleunlocked * 0.5 );
    }
}

sea_objectbob_follow( var_0 )
{
    for (;;)
    {
        self moveto( var_0.origin, 0.1 );
        wait 0.1;
    }
}

sea_objectbob_findparent( var_0, var_1 )
{
    if ( !isdefined( self._not_team ) )
        return;

    var_0._id_6685 = getent( self._not_team, "targetname" );

    if ( !isdefined( var_0._id_6685._id_577B ) )
        var_0._id_6685 waittill( "got_link" );

    var_2 = var_0._id_6685._id_577B;
    var_3 = var_0.origin;
    var_4 = spawn( "script_origin", var_2.origin );
    var_4.angles = var_2.angles;
    var_5 = spawn( "script_origin", var_0.origin );
    var_5.angles = var_0.angles;
    var_5 linkto( var_4 );
    var_0 thread sea_objectbob_follow( var_5 );

    for (;;)
    {
        var_2 waittill( "precalcdone1" );
        wait(var_2.waittime - 0.05);
        var_4 rotateto( var_2.ang, var_1.titleunlocked, var_1.titleunlocked * 0.5, var_1.titleunlocked * 0.5 );
        var_2 waittill( "precalcdone2" );
        wait(var_2.waittime - 0.05);
        var_4 rotateto( var_2.ang, var_1.titleunlocked, var_1.titleunlocked * 0.5, var_1.titleunlocked * 0.5 );
    }
}

sea_bob()
{
    self endon( "manual_override" );
    common_scripts\utility::_id_384A( "_sea_bob" );
    thread sea_bob_reset();
    wait 0.05;

    for (;;)
    {
        var_0 = 0;
        var_1 = 0;
        var_2 = randomfloatrange( 2, 4 ) * level._sea_scale;
        self.titleunlocked = randomfloatrange( 3, 4 );
        self.runto_arrived = ( var_1, var_0, var_2 );
        self.sway = "sway1";
        self notify( "sway1" );

        if ( common_scripts\utility::_id_382E( "_sea_bob" ) )
            level._sea_link rotateto( self.runto_arrived, self.titleunlocked, self.titleunlocked * 0.5, self.titleunlocked * 0.5 );

        self rotateto( self.runto_arrived, self.titleunlocked, self.titleunlocked * 0.5, self.titleunlocked * 0.5 );
        level._id_47A3.heightsea = 110;
        _id_A5E8::_id_870C( "aud_start_sway1" );
        wait(self.titleunlocked);
        self.runto_arrived *= -1;
        self.sway = "sway2";
        self notify( "sway2" );

        if ( common_scripts\utility::_id_382E( "_sea_bob" ) )
            level._sea_link rotateto( self.runto_arrived, self.titleunlocked, self.titleunlocked * 0.5, self.titleunlocked * 0.5 );

        self rotateto( self.runto_arrived, self.titleunlocked, self.titleunlocked * 0.5, self.titleunlocked * 0.5 );
        level._id_47A3.heightsea = 180;
        _id_A5E8::_id_870C( "aud_start_sway2" );
        wait(self.titleunlocked);
    }
}

sea_bob_reset_loop()
{
    self endon( "manual_override" );
    common_scripts\utility::_id_384A( "_sea_bob" );
    thread sea_bob_reset();
}

sea_bob_reset()
{
    self endon( "manual_override" );
    level waittill( "_sea_bob" );
    thread sea_bob_reset_loop();
    level endon( "_sea_bob" );
    var_0 = 1.5;
    var_1 = ( 0, 0, 0 );
    level._sea_link rotateto( var_1, var_0, var_0 * 0.5, var_0 * 0.5 );
    wait(var_0);
    wait 0.05;
    level._id_60A3 = level._id_57A8;
    level._sea_link.angles = ( 0, 0, 0 );
}

sea_waves()
{
    var_0 = sea_waves_setup();

    if ( !isdefined( var_0 ) )
        return;

    self.oldwaves = [];

    for (;;)
    {
        common_scripts\utility::_id_384A( "_sea_waves" );
        self waittill( "sway1" );
        thread sea_waves_fx( var_0, "right" );
        common_scripts\utility::_id_384A( "_sea_waves" );
        self waittill( "sway2" );
        thread sea_waves_fx( var_0, "left" );
    }
}

sea_waves_fx( var_0, var_1 )
{
    wait(self.titleunlocked * 0.5);
    var_2 = 2;
    var_3 = common_scripts\utility::_id_710E( sea_closestwavearray( var_0[var_1], var_2 ) );

    if ( !isdefined( self.oldwaves[var_1] ) )
        self.oldwaves[var_1] = var_3;

    while ( self.oldwaves[var_1] == var_3 )
    {
        wait 0.05;
        var_3 = common_scripts\utility::_id_710E( sea_closestwavearray( var_0[var_1], var_2 ) );
    }

    self.oldwaves[var_1] = var_3;
    var_3 thread sea_waves_fx2();
}

sea_waves_fx2()
{
    wait(randomfloat( 0.15 ));
    thread common_scripts\utility::_id_69C2( "elm_wave_crash_ext", self.origin );
    common_scripts\_exploder::_id_3528( self._id_3528.v["exploder"] );
}

sea_closestwavearray( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3]._sea_dist = distancesquared( var_0[var_3].origin, level.playercardbackground.origin );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_2 = sea_closestwavelogic( var_2, var_0[var_3] );

    var_4 = [];

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_4[var_3] = var_2[var_3];

    return var_4;
}

sea_closestwavelogic( var_0, var_1 )
{
    if ( !var_0.size )
    {
        var_0[0] = var_1;
        return var_0;
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._sea_dist > var_1._sea_dist )
        {
            var_0 = common_scripts\utility::_id_0CED( var_0, var_1, var_2 );
            break;
        }
    }

    if ( var_2 == var_0.size )
        var_0 = common_scripts\utility::_id_0CDA( var_0, var_1 );

    return var_0;
}

sea_waves_setup()
{
    var_0 = common_scripts\utility::_id_40FD( "wave_fx", "targetname" );
    var_1 = common_scripts\utility::_id_40FB( "wave_fx_center", "targetname" );

    if ( !var_0.size )
        return undefined;

    var_2 = anglestoforward( var_1.angles );
    var_3 = anglestoright( var_1.angles );
    var_4 = [];
    var_4["right"] = [];
    var_4["left"] = [];

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_0[var_5].forward = anglestoforward( var_0[var_5].angles );
        var_0[var_5].upgradepurchased = anglestoup( var_0[var_5].angles );
        var_0[var_5].riotshield_damaged = anglestoright( var_0[var_5].angles );
    }

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( vectordot( var_0[var_5].forward, var_3 ) > 0 )
        {
            var_4["right"][var_4["right"].size] = var_0[var_5];
            continue;
        }

        var_4["left"][var_4["left"].size] = var_0[var_5];
    }

    var_6 = level._waves_exploders;

    for ( var_5 = 0; var_5 < var_6.size; var_5++ )
        var_6[var_5].origin = var_6[var_5].v["origin"];

    for ( var_5 = 0; var_5 < var_4["right"].size; var_5++ )
    {
        var_7 = common_scripts\utility::_id_3F33( var_4["right"][var_5].origin, var_6, 64 );
        var_6 = common_scripts\utility::_id_0CF6( var_6, var_7 );
        var_4["right"][var_5]._id_3528 = var_7;
    }

    for ( var_5 = 0; var_5 < var_4["left"].size; var_5++ )
    {
        var_7 = common_scripts\utility::_id_3F33( var_4["left"][var_5].origin, var_6, 64 );
        var_6 = common_scripts\utility::_id_0CF6( var_6, var_7 );
        var_4["left"][var_5]._id_3528 = var_7;
    }

    return var_4;
}

sea_litebob()
{
    for (;;)
    {
        wait 0.2;
        var_0 = self.angles * 2;
        var_0 = ( var_0[0], var_0[1], var_0[2] );
        var_1 = level._id_60A3;
        level._id_60A3 = combineangles( var_0, level._id_57A8 );
        var_2 = level._id_60A3;
        var_3 = anglestoforward( var_1 );
        var_4 = anglestoforward( var_2 );

        if ( common_scripts\utility::_id_382E( "final_sun_direction" ) )
        {
            setsundirection( ( 0.6, 0.5, 0.7 ) );
            return;
            continue;
        }

        lerpsundirection( var_3, var_4, 0.2 );
    }
}

sea_viewbob()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "_sea_viewbob" );
        level.playercardbackground playersetgroundreferenceent( self );

        if ( common_scripts\utility::_id_382E( "_sea_viewbob" ) )
            level waittill( "_sea_viewbob" );

        level.playercardbackground playersetgroundreferenceent( undefined );
    }
}
