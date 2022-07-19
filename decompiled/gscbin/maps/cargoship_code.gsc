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

start_blend()
{

}

escape_debri()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;

    switch ( self.script_parentname )
    {
        case "panel_mid":
            var_0 = "lead";
            var_1 = 500;
            var_2 = 1;
            self._not_team = undefined;
            break;
        case "panel_high":
            var_0 = "last";
            var_1 = 300;
            var_2 = 2;
            break;
        case "pole_mid":
            var_0 = "lead";
            var_1 = 768;
            var_2 = 1;
            break;
        default:
            return;
    }

    var_3 = var_1 * var_1;

    if ( !isdefined( self._not_team ) )
    {
        self delete();
        return;
    }

    escape_debri_wait( var_0, var_3 );
    thread escape_debri_launch( var_2 );
}

escape_debri_wait( var_0, var_1 )
{
    var_2 = [];
    var_2[var_2.size] = level.heroes3["price"];
    var_2[var_2.size] = level.heroes3["alavi"];
    var_2[var_2.size] = level.heroes3["grigsby"];

    for (;;)
    {
        var_3 = escape_heroes_findorder( var_2 );

        if ( distancesquared( var_3[var_0].origin, self getorigin() ) < var_1 )
            break;

        wait 0.05;
    }
}

escape_debri_launch( var_0 )
{
    wait(randomfloat( var_0 ));
    var_1 = anglestoright( ( 0, 180, 50 ) );
    var_1 = _id_A5A4::vector_multiply( var_1, 10000 );
    var_2 = getent( self._not_team, "targetname" );
    var_2 show();
    self delete();
    thread common_scripts\utility::_id_69C2( "cgoship_panel_break_away", var_2.origin );
    var_2 physicslaunch( var_2.origin, var_1 );
}

escape_event()
{
    var_0 = "fx";
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = 0;
    var_7 = undefined;
    var_8 = 0;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;
    var_12 = undefined;
    var_13 = undefined;
    var_14 = -500;
    var_15 = strtok( self._id_7A99, ":;,= " );

    for ( var_16 = 0; var_16 < var_15.size; var_16++ )
    {
        switch ( tolower( var_15[var_16] ) )
        {
            case "type":
                var_16++;
                var_0 = var_15[var_16];
                continue;
            case "quake":
                var_16++;

                if ( tolower( var_15[var_16] ) == "true" )
                    var_6 = 1;
                else if ( tolower( var_15[var_16] ) == "playeronly" )
                    var_6 = 2;

                continue;
            case "fx":
                var_16++;
                var_1 = var_15[var_16];
                continue;
            case "exploder_id":
                var_16++;
                var_2 = var_15[var_16];
                continue;
            case "snd":
                var_16++;
                var_4 = var_15[var_16];
                continue;
            case "sndloop":
                var_16++;
                var_4 = var_15[var_16];
                continue;
            case "sndoneshot":
                var_16++;
                var_3 = var_15[var_16];
                continue;
            case "sndobj":
                var_16++;
                var_5 = var_15[var_16];
                continue;
            case "flag":
                var_16++;
                var_7 = var_15[var_16];
                continue;
            case "rotang":
                var_16++;
                var_9 = ( int( var_15[var_16] ), int( var_15[var_16 + 1] ), int( var_15[var_16 + 2] ) );
                var_16 += 2;
                continue;
            case "delay":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_8 = var_17 * 0.001;
                continue;
            case "rottime":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_10 = var_17 * 0.001;
                continue;
            case "rotacc":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_11 = var_17 * 0.001;
                continue;
            case "rotdec":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_12 = var_17 * 0.001;
                continue;
        }
    }

    self waittill( "trigger" );
    wait(var_8);

    switch ( var_0 )
    {
        case "fx":
            var_13 = common_scripts\utility::_id_40FD( self._not_team, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                var_18 = spawn( "script_model", var_13[var_16].origin );
                var_18.angles = var_13[var_16].angles;
                var_18 setmodel( "tag_origin" );
                var_18 hide();

                switch ( var_1 )
                {
                    case "event_waterleak":
                        if ( isdefined( var_13[var_16]._not_team ) )
                        {
                            var_19 = getent( var_13[var_16]._not_team, "targetname" );
                            var_19 thread escape_event_waterleak_blur();
                        }

                        break;
                }

                var_18 thread escape_event_fx( var_1, var_3, var_4, var_7, var_2, var_5 );
            }

            break;
        case "cargocontainer":
            var_20 = getent( self._not_team, "targetname" );
            var_21 = var_14;
            var_22 = ( 0, 0, 90 );
            var_23 = undefined;
            var_24 = undefined;

            if ( var_20.angles != ( 0, 90, 0 ) && var_20.angles != ( 0, 270, 0 ) )
            {
                var_25 = _id_A5A4::vector_multiply( anglestoup( ( 0, 360, 0 ) ), 4 );
                var_26 = _id_A5A4::vector_multiply( anglestoright( ( 0, 360, 0 ) ), -1 );
                var_24 = vectornormalize( var_25 + var_26 );
                var_21 *= 800;
                var_27 = anglestoright( ( 0, 360, 0 ) );
                var_27 = _id_A5A4::vector_multiply( var_27, 64 );
                var_23 = var_20.origin + var_27;
            }
            else
            {
                var_25 = anglestoup( level._sea_org.angles );
                var_26 = _id_A5A4::vector_multiply( anglestoright( level._sea_org.angles ), -1 );
                var_23 = var_20.origin + var_22;
                var_24 = vectornormalize( var_25 + var_26 );
            }

            var_24 *= ( var_21 * 0.75 );
            var_20 physicslaunch( var_23, var_24 );
            break;
        case "physics":
            var_13 = getentarray( self._not_team, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                var_21 = var_14;
                var_22 = ( randomfloat( 20 ), randomfloat( 20 ), randomfloat( 20 ) );
                var_23 = var_13[var_16].origin + var_22;
                var_24 = anglestoup( level._sea_org.angles );
                var_24 *= var_21;
                var_13[var_16] physicslaunch( var_23, var_24 );
            }

            break;
        case "rotate":
            var_13 = getentarray( self._not_team, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                if ( isdefined( var_13[var_16]._not_team ) )
                {
                    var_28 = getentarray( var_13[var_16]._not_team, "targetname" );

                    for ( var_29 = 0; var_29 < var_28.size; var_29++ )
                        var_28[var_29] linkto( var_13[var_16] );
                }

                var_3 = var_4;
                var_13[var_16] thread escape_event_rotate( var_3, var_12, var_11, var_9, var_10, var_5 );
            }

            break;
    }

    if ( !var_6 )
        return;

    if ( var_6 > 1 )
    {
        earthquake( 0.25, 0.75, level.playercardbackground.origin, 1024 );
        level.playercardbackground playrumbleonentity( "tank_rumble" );
        return;
    }

    if ( distance( level.playercardbackground.origin, self.origin ) < 770 )
    {
        earthquake( 0.4, 1.25, level.playercardbackground.origin, 1024 );
        thread escape_event_player();
    }

    if ( !isdefined( level.escape_stumble_num ) )
        level.escape_stumble_num = 1;

    var_30 = getarraykeys( level.heroes3 );

    for ( var_16 = 0; var_16 < var_30.size; var_16++ )
    {
        var_31 = var_30[var_16];
        level.heroes3[var_31] thread escape_event_ai( level.escape_stumble_num );

        if ( level.escape_stumble_num < 3 )
        {
            level.escape_stumble_num++;
            continue;
        }

        level.escape_stumble_num = 1;
    }

    _id_A5A4::_id_0D18( level.heroes3, "done_stumbling" );
    level notify( "let player up" );
}

escape_event_rotate( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = escape_event_get_snd_entity_obj( var_5 );
        var_6 thread _id_A5A4::_id_69C4( var_0 );
    }

    var_7 = self.angles;

    if ( isdefined( var_1 ) )
        self rotateto( var_3, var_4, var_2, var_1 );
    else if ( isdefined( var_2 ) )
        self rotateto( var_3, var_4, var_2 );
    else
    {
        self rotateto( var_3, var_4 );

        if ( isdefined( self.script_parentname ) )
        {
            wait(var_4 * 0.75);
            thread escape_event_wobble_pipe();
        }
        else
        {
            wait(var_4);
            var_8 = var_7 + _id_A5A4::vector_multiply( var_3, 0.3 );
            var_9 = var_4 * 0.5;
            self rotateto( var_8, var_9, 0, var_9 );
            wait(var_9);
            self rotateto( var_3, var_9, var_9, 0 );
        }
    }
}

escape_event_wobble_pipe()
{
    var_0 = self.angles;
    var_1 = 45;
    var_2 = 720;
    var_3 = 0.75;
    var_4 = 0.8;
    var_5 = float( self.script_parentname );

    for (;;)
    {
        self rotateto( ( var_0[0], var_0[1], var_0[2] + var_5 * sin( var_1 ) * -1 ), 0.1 );

        if ( var_1 >= var_2 )
        {
            var_1 = 0;
            var_5 *= var_3;

            if ( var_5 < var_4 )
                return;
        }

        var_1 += var_1;
        wait 0.1;
    }
}

escape_event_waterleak_blur()
{
    self endon( "death" );
    var_0 = 32;
    var_1 = var_0 * var_0;

    for (;;)
    {
        self waittill( "trigger" );
        setblur( 2.4, 0.15 );

        while ( level.playercardbackground istouching( self ) )
            wait 0.1;

        wait 0.1;
        setblur( 0, 0.15 );
    }
}

escape_event_fx( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        common_scripts\_exploder::_id_3528( var_4 );
    else
        playfxontag( level._effect[var_0], self, "tag_origin" );

    thread escape_event_sndfx( var_1, var_2, var_5 );

    if ( !isdefined( var_3 ) )
        return;

    if ( var_0 == "event_waterleak" )
        _playloopsound( "cgo_water_breach_large_loop" );

    common_scripts\utility::_id_384A( var_3 );

    if ( isdefined( var_4 ) )
        _id_A5A4::_id_8E7E( var_4 );

    self stoploopsound();
    waitframe;
    self delete();
}

escape_event_sndfx( var_0, var_1, var_2 )
{
    var_3 = escape_event_get_snd_entity_obj( var_2 );

    if ( isdefined( var_0 ) )
        var_3 thread _id_A5A4::_id_69C4( var_0 );

    if ( isdefined( var_1 ) )
        var_3 thread common_scripts\utility::_id_6975( var_1 );
}

escape_event_get_snd_entity_obj( var_0 )
{
    var_1 = self;

    if ( isdefined( var_0 ) )
    {
        var_2 = _id_A5A4::_id_3F82( var_0, "targetname" );

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }

    return var_1;
}

escape_event_ai( var_0 )
{
    var_1 = "stumble" + var_0;
    self.springleak = 1;
    var_2 = getanimlength( level._id_78AC[self._id_0C72][var_1] );
    thread _id_A510::_id_0C24( self, var_1 );
    wait(var_2 - 0.2);
    self _meth_8143();
    self notify( "single_anim_done" );
    self notify( "done_stumbling" );
    self.springleak = 0;
}

escape_event_player()
{
    level.playercardbackground allowstand( 0 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground setstance( "crouch" );
    level.playercardbackground setvelocity( ( 0, 1, 0 ) );
    player_speed_set_cargoship( 135, 0.1 );
    _id_A5A4::_id_27EF( 0.5, ::player_speed_set_cargoship, 185, 2.5 );
    level.playercardbackground playrumbleonentity( "tank_rumble" );
    _id_A5A4::_id_27EF( 0.05, ::blur_overlay, 2.4, 0.25 );
    _id_A5A4::_id_27EF( 0.3, ::blur_overlay, 0, 0.5 );
    level.playercardbackground _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_69C4, "breathing_hurt" );
    level waittill( "let player up" );
    level.playercardbackground _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground allowstand( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground setstance( "stand" );
}

escape_player_last_quake()
{
    level.playercardbackground setvelocity( ( 0, 90, 0 ) );
    earthquake( 0.25, 1.5, level.playercardbackground.origin, 1024 );
    player_speed_set_cargoship( 100, 0.1 );
    _id_A5A4::_id_27EF( 0.25, ::player_speed_set_cargoship, 140, 2 );
    level.playercardbackground playrumbleonentity( "tank_rumble" );
}

misc_light_flicker( var_0, var_1, var_2 )
{
    var_3 = 0.25;
    var_4 = 0.45;
    var_5 = self getlightintensity();
    var_6 = 0;
    var_7 = undefined;
    var_8 = undefined;
    var_9 = var_5;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = undefined;

    if ( isdefined( var_0 ) )
    {
        var_14 = _id_A5A4::_id_3FA9( var_0 );
        var_13 = _id_A5A4::_id_3F39( self.origin, var_14 );
        var_12 = 1;
    }

    var_15 = getentarray( "script_lightmodel", "targetname" );
    var_16 = common_scripts\utility::_id_3F33( self.origin, var_15, 32 );

    if ( isdefined( var_16 ) )
    {
        var_8 = var_16.motiontrackerenabled;
        var_11 = 1;

        switch ( var_8 )
        {
            case "com_lightbox_on":
                var_7 = "com_lightbox";
                break;
            case "ch_industrial_light_02_on":
                var_7 = "ch_industrial_light_02_off";
                break;
            case "me_lightfluohang_on":
                var_7 = "me_lightfluohang";
                break;
        }
    }

    if ( isdefined( var_2 ) )
        common_scripts\utility::_id_384A( var_2 );

    for (;;)
    {
        for ( var_10 = randomintrange( 1, 10 ); var_10; var_10-- )
        {
            wait(randomfloatrange( 0.05, 0.1 ));

            if ( var_9 == var_5 )
            {
                var_9 = var_6;
                self setlightintensity( var_6 );

                if ( var_12 )
                    var_13 common_scripts\utility::_id_671F();

                if ( var_11 )
                    var_16 setmodel( var_7 );

                continue;
            }

            if ( common_scripts\utility::_id_382E( var_1 ) )
            {
                var_9 = var_5;
                self setlightintensity( var_5 );

                if ( var_12 )
                    var_13 _id_A5A4::_id_748D();

                if ( var_11 )
                    var_16 setmodel( var_8 );

                continue;
            }

            common_scripts\utility::_id_384A( var_1 );
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

escape_heroes_holdtheline_run_or_walk_asone( var_0 )
{
    if ( var_0["last"]._id_76B8 == "sprint" )
    {
        switch ( self.precache )
        {
            case "lead":
                if ( distance( self.origin, var_0["middle"].origin ) < self.aimaxdist )
                    self._id_2B6C = var_0["last"]._id_2B6C;

                break;
            case "middle":
                if ( distance( self.origin, var_0["last"].origin ) < self.aimaxdist )
                    self._id_2B6C = var_0["last"]._id_2B6C;

                break;
        }
    }
    else if ( var_0["lead"]._id_76B8 == "jog" )
    {
        switch ( self.precache )
        {
            case "middle":
                if ( distance( self.origin, var_0["lead"].origin ) < self.aimaxdist )
                    self._id_2B6C = var_0["lead"]._id_2B6C;

                break;
            case "last":
                if ( distance( self.origin, var_0["middle"].origin ) < self.aimaxdist )
                    self._id_2B6C = var_0["lead"]._id_2B6C;

                break;
        }
    }
}

escape_heroes_holdtheline_stay_in_single_file( var_0, var_1 )
{
    var_2 = undefined;

    switch ( self.precache )
    {
        case "lead":
            var_2 = var_0["middle"];
            break;
        case "middle":
            var_2 = var_0["last"];
            break;
    }

    escape_heroes_holdtheline_adjust_rate_vs_ai( var_2, var_1 );
}

escape_heroes_holdtheline_adjust_rate_vs_ai( var_0, var_1 )
{
    if ( var_1 )
        wait 5.0;

    if ( isdefined( var_0 ) )
    {
        if ( distance( self.origin, var_0.origin ) < self.aimindist )
        {
            if ( self._id_5F65 < 1.2 )
                self._id_5F65 += 0.005;
        }
        else if ( distance( self.origin, var_0.origin ) > self.aimaxdist )
        {
            if ( self._id_5F65 > 0.9 )
                self._id_5F65 -= 0.005;
        }
    }
    else if ( self._id_76B8 == "sprint" && self._id_5F65 < self.aimaxsprintrate )
        self._id_5F65 = self.aimaxsprintrate;
    else if ( self._id_76B8 == "jog" && self._id_5F65 > self.aiminjograte )
        self._id_5F65 -= 0.005;
    else if ( self._id_5F65 < 1 )
        self._id_5F65 += 0.005;
    else if ( self._id_5F65 > 1 )
        self._id_5F65 -= 0.005;
}

escape_heroes_holdtheline_decide_jog_run_sprint( var_0, var_1 )
{
    if ( self._id_2B6C < var_1 )
    {
        if ( self._id_76B8 == "sprint" || self.springleak == 1 )
            return;

        self._id_76B8 = "sprint";

        if ( isdefined( self.escape_run_section ) )
            _id_A5A4::_id_7E45( level.current_run[self.escape_run_section][self._id_76B8] );
        else
            _id_A5A4::_id_1ED1();

        if ( self._id_5F65 < self.aimaxsprintrate )
            self._id_5F65 = self.aimaxsprintrate;
    }
    else if ( self._id_2B6C < var_0 )
    {
        if ( self._id_76B8 == "run" )
            return;

        self._id_76B8 = "run";

        if ( isdefined( self.escape_run_section ) )
            _id_A5A4::_id_7E45( level.current_run[self.escape_run_section][self._id_76B8] );
        else
            _id_A5A4::_id_1ED1();

        self._id_5F65 = 1;
    }
    else if ( self._id_2B6C < var_0 * 2 )
    {
        if ( self._id_76B8 == "jog" || self.springleak == 1 )
            return;

        self._id_76B8 = "jog";

        if ( isdefined( self.escape_run_section ) )
            _id_A5A4::_id_7E45( level.current_run[self.escape_run_section][self._id_76B8] );
        else
            _id_A5A4::_id_1ED1();

        if ( self._id_5F65 > self.aiminjograte )
            self._id_5F65 = self.aiminjograte;
    }
}

escape_heroes_holdtheline( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "stop_dynamic_run_speed" );
    self endon( "stop_dynamic_run_speed" );
    self._id_6435 = self.weapon_change;
    self._id_63AF = self._id_5F65;
    self._id_76B8 = "run";
    self._id_63C4 = self._id_0C72;
    self._id_0C72 = "escape";
    self._id_2B6C = 0;
    self.springleak = 0;
    self._id_2B0E = 1;
    self._id_2AF3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = var_0 * 0.5;

    self.aimaxdist = 150;
    self.aimindist = 75;

    if ( isdefined( var_3 ) )
        self.aimaxsprintrate = var_3;
    else
        self.aimaxsprintrate = 1.25;

    self.aiminjograte = 0.85;
    self.movestand_moveoverride_overrideanimrate = 1.0;
    var_6 = isdefined( var_5 );

    for (;;)
    {
        wait 0.05;
        var_7 = escape_heroes_findorder( var_1 );

        if ( isdefined( var_4 ) )
            self._id_2B6C = var_2 - 5;
        else
        {
            switch ( self.precache )
            {
                case "lead":
                    var_8 = var_7["middle"];
                    break;
                case "middle":
                    var_8 = var_7["last"];
                    break;
                default:
                    var_8 = level.playercardbackground;
                    break;
            }

            self._id_2B6C = distance( self.origin, var_8.origin );
        }

        escape_heroes_holdtheline_run_or_walk_asone( var_7 );
        escape_heroes_holdtheline_stay_in_single_file( var_7, var_6 );
        escape_heroes_holdtheline_decide_jog_run_sprint( var_0, var_2 );
        var_6 = 0;
    }
}

escape_heroes_findorder( var_0 )
{
    var_1 = [];
    var_2 = 0;
    var_1["last"] = var_0[0];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        var_3 = distancesquared( var_1["last"].origin, level.playercardbackground.origin );
        var_4 = distancesquared( var_0[var_2].origin, level.playercardbackground.origin );

        if ( var_3 > var_4 )
            var_1["last"] = var_0[var_2];
    }

    var_1[2] = var_1["last"];
    var_1["last"].precache = "last";
    var_1["lead"] = var_0[0];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        var_3 = distancesquared( var_1["lead"].origin, level.playercardbackground.origin );
        var_4 = distancesquared( var_0[var_2].origin, level.playercardbackground.origin );

        if ( var_3 < var_4 )
            var_1["lead"] = var_0[var_2];
    }

    var_1[0] = var_1["lead"];
    var_1["lead"].precache = "lead";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] != var_1["lead"] && var_0[var_2] != var_1["last"] )
        {
            var_1["middle"] = var_0[var_2];
            var_1[1] = var_0[var_2];
            var_0[var_2].precache = "middle";
            break;
        }
    }

    return var_1;
}

escape_heroes_run_wait( var_0 )
{
    var_1 = var_0 + "_flag";
    level endon( var_1 );
    var_2 = getnodearray( var_0 + "_end", "targetname" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_3[int( var_2[var_4].script_parentname )] = var_2[var_4];

    var_5 = [];
    var_5[var_5.size] = level.heroes3["price"];
    var_5[var_5.size] = level.heroes3["alavi"];
    var_5[var_5.size] = level.heroes3["grigsby"];
    var_6 = escape_heroes_findorder( var_5 );

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        if ( var_6[var_4].script_parentname == self.script_parentname )
        {
            thread _id_A5A4::_id_30A1();
            self _meth_81a9( var_3[var_4 + 1] );
            self.goalradius = 16;
            break;
        }
    }
}

escape_waterlevel_parts( var_0 )
{
    switch ( self.script_parentname )
    {
        case "path":
            var_0._id_66BD = self;
            break;
    }
}

escape_quake()
{
    level.playercardbackground endon( "stopquake" );

    while ( !common_scripts\utility::_id_382E( "escape_tilt_30" ) )
    {
        wait 0.1;
        earthquake( 0.15, 0.1, level.playercardbackground.origin, 256 );
    }

    while ( !common_scripts\utility::_id_382E( "escape_cargohold1_enter" ) )
    {
        wait 0.1;
        earthquake( 0.175, 0.1, level.playercardbackground.origin, 256 );
    }

    while ( !common_scripts\utility::_id_382E( "escape_hallway_lower_flag" ) )
    {
        wait 0.1;
        earthquake( 0.2, 0.1, level.playercardbackground.origin, 256 );
    }

    while ( !common_scripts\utility::_id_382E( "end_start_player_anim" ) )
    {
        wait 0.1;
        earthquake( 0.225, 0.1, level.playercardbackground.origin, 256 );
    }
}

escape_explosion_drops()
{
    var_0 = getent( "escape_first_falling_container", "targetname" );
    var_1 = getentarray( "escape_first_fallen_container", "targetname" );
    var_2 = 2;
    var_3 = 0;
    var_4 = 0;
    var_0 rotateto( ( 0, 45, 0 ), 2 );
    wait(var_2);
    var_0 delete();

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_1[var_5] solid();
        var_1[var_5] show();
    }

    var_6 = getentarray( "escape_big_blocker_before", "targetname" );
    var_7 = getentarray( "escape_big_blocker", "targetname" );

    for ( var_5 = 0; var_5 < var_6.size; var_5++ )
        var_6[var_5] delete();

    for ( var_5 = 0; var_5 < var_7.size; var_5++ )
    {
        var_7[var_5] show();
        var_7[var_5] solid();

        if ( var_7[var_5].specialgrenade & 1 )
            var_7[var_5] disconnectpaths();
    }
}

escape_shellshock_blinking()
{
    level endon( "escape_unlink_player" );
    var_0 = _id_23D0( "black", 0 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 0.5, 0.25, 0, 0.25 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    var_0 destroy();
}

escape_shellshock_blur()
{
    level endon( "escape_unlink_player" );
    wait 2.2;
    setblur( 4.0, 0.5 );
    wait 2.0;
    setblur( 0.0, 3.0 );
    wait 4.75;
    setblur( 3.0, 2.0 );
    wait 4.5;
    setblur( 0.0, 0.6 );
}

escape_shellshock_breathing()
{
    level.playercardbackground _id_A5A4::_id_27EF( 1.5, _id_A5A4::_id_69C4, "breathing_hurt_start" );
    level.playercardbackground _id_A5A4::_id_27EF( 2.5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 4, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 8.5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 11, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 13, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 16, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 21, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 24, _id_A5A4::_id_69C4, "breathing_better" );
}

escape_shellshock_vision()
{
    var_0 = _id_23D0( "black", 0 );
    var_0 _id_A5A4::_id_27EF( 1.5, ::exp_fade_overlay, 1, 0.5 );
    var_0 _id_A5A4::_id_27EF( 2.25, ::exp_fade_overlay, 0, 0.5 );
    var_0 _id_A5A4::_id_27EF( 3, ::exp_fade_overlay, 0.5, 0.25 );
    var_0 _id_A5A4::_id_27EF( 3.25, ::exp_fade_overlay, 0, 0.25 );
    var_0 _id_A5A4::_id_27EF( 5, ::exp_fade_overlay, 1, 0.5 );
    var_0 _id_A5A4::_id_27EF( 6, ::exp_fade_overlay, 0, 0.5 );
    var_0 _id_A5A4::_id_27EF( 10, ::exp_fade_overlay, 1, 0.5 );
    var_0 _id_A5A4::_id_27EF( 10.75, ::exp_fade_overlay, 0, 0.5 );
    var_0 _id_A5A4::_id_27EF( 13, ::exp_fade_overlay, 1, 0.5 );
    var_0 _id_A5A4::_id_27EF( 13.75, ::exp_fade_overlay, 0, 0.5 );
    _id_A5A4::_id_27EF( 0.75, ::blur_overlay, 4.8, 0.5 );
    _id_A5A4::_id_27EF( 1.25, ::blur_overlay, 0, 4 );
    _id_A5A4::_id_27EF( 7.25, ::blur_overlay, 4.8, 2 );
    _id_A5A4::_id_27EF( 9.25, ::blur_overlay, 0, 2 );
    _id_A5A4::_id_27EF( 13, ::blur_overlay, 7.2, 1 );
    _id_A5A4::_id_27EF( 14, ::blur_overlay, 0, 1 );
    level.playercardbackground _id_A5A4::_id_27EF( 1.5, _id_A5A4::_id_69C4, "breathing_hurt_start" );
    level.playercardbackground _id_A5A4::_id_27EF( 2.5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 4, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 8.5, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 11, _id_A5A4::_id_69C4, "breathing_hurt" );
    level.playercardbackground _id_A5A4::_id_27EF( 13, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 16, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 21, _id_A5A4::_id_69C4, "breathing_better" );
    level.playercardbackground _id_A5A4::_id_27EF( 24, _id_A5A4::_id_69C4, "breathing_better" );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    var_0 destroy();
}

escape_shellshock_heartbeat()
{
    level endon( "stop_heartbeat_sound" );
    var_0 = -0.5;

    for (;;)
    {
        level.playercardbackground _id_A5A4::_id_69C4( "breathing_heartbeat" );

        if ( var_0 > 0 )
            wait(var_0);

        var_0 += 0.1;
    }
}

escape_shellshock_depthoffield()
{
    level.playercardbackground _meth_84a5();
    setsaveddvar( "r_mbEnable", 2 );
    wait 1.34;
    level.playercardbackground _meth_84a7( 0.7, 50, 4.0, 4.0 );
    wait 2.5;
    level.playercardbackground _meth_84a7( 1.5, 56, 1.6, 1.6 );
    wait 6.5;
    level.playercardbackground _meth_84a7( 1.0, 50, 1.6, 1.6 );
    wait 2.5;
    level.playercardbackground _meth_84a7( 2.0, 24, 2.8, 2.8 );
    wait 1.66;
    level.playercardbackground _meth_84a7( 1.0, 56, 4.0, 4.0 );
    wait 1.16;
    level.playercardbackground _meth_84a7( 0.9, 74, 1.3, 1.3 );
    wait 3.34;
    setsaveddvar( "r_mbEnable", 0 );
    level.playercardbackground _meth_84a7( 1.0, 70, 2.0, 2.0 );
    wait 1.16;
    level.playercardbackground _meth_84a7( 3.0, 28, 3.5, 3.5 );
    wait 1.16;
    level.playercardbackground _meth_84a7( 5.0, 10, 1.7, 1.7 );
    wait 1.1;
    level.playercardbackground _meth_84a7( 4.0, 300, 3.0, 3.0 );
    wait 4.0;
    level.playercardbackground _meth_84a6();
}

escape_shellshock()
{
    thread escape_shellshock_blinking();
    thread escape_shellshock_blur();
    thread escape_shellshock_breathing();
    thread escape_shellshock_heartbeat();
    thread escape_shellshock_depthoffield();
    level.playercardbackground playrumbleonentity( "tank_rumble" );
    level thread _id_A5A4::_id_61FD( "stop_heartbeat_sound", 18 );
    clearallcorpses();
    var_0 = ( 600, -296, -360 );
    var_1 = _id_A5A4::_id_88D1( "player_viewbody" );
    var_1.origin = level.playercardbackground _id_A5A4::_id_3E24();
    level.playercardbackground setstance( "stand" );
    var_1.angles = level.playercardbackground getplayerangles();
    var_1 hide();
    level.playercardbackground playerlinktoabsolute( var_1, "tag_player", 1 );
    var_2 = spawn( "script_model", level.playercardbackground.origin );
    var_2.angles = level.playercardbackground getplayerangles();
    var_2 setmodel( "tag_origin" );
    var_1 linkto( var_2, "tag_origin" );
    var_2 thread common_scripts\utility::_id_6975( "shellshock_loop" );
    maps\mo_tools::playerweapontake();
    var_3 = getentarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isdefined( var_3[var_4].classname ) && getsubstr( var_3[var_4].classname, 0, 7 ) == "weapon_" )
            var_3[var_4] delete();
    }

    var_5 = getent( "hallways_door", "targetname" );
    var_6 = getent( var_5._not_team, "targetname" );
    var_5 delete();
    var_6 delete();
    var_7 = ( 358.273, 286.02, -89.0164 );
    var_8 = _id_A5A4::_id_88D1( "player_viewbody" );
    var_8 hide();
    var_9 = spawn( "script_origin", var_0 );
    var_9.angles = ( 0, 180, 0 );
    var_9 _id_A510::_id_0BC7( var_8, "player_explosion" );
    waitframe;
    var_7 = var_8 gettagangles( "tag_player" );
    var_10 = var_8 gettagorigin( "tag_player" );
    var_9 delete();
    var_8 delete();
    var_2 thread _id_A510::_id_0C24( var_1, "player_explosion_start" );
    var_2 moveto( var_10, 1 );
    var_2 waittill( "movedone" );
    thread escape_new_explosion_scene( var_2, var_1, var_0 );
    wait 9.45;
    level notify( "escape_show_waterlevel" );
    wait 13.74;
    var_2 common_scripts\utility::_id_8EA1( "shellshock_loop" );
    wait 0.3;
}

escape_new_explosion_scene( var_0, var_1, var_2 )
{
    level.heroes3["price"] common_scripts\utility::_id_4853( "escape_unlink_player" );
    level.heroes3["grigsby"] common_scripts\utility::_id_4853( "escape_unlink_player" );
    level.heroes3["alavi"] common_scripts\utility::_id_4853( "escape_unlink_player" );
    var_1 unlink();
    var_3 = level.heroes3["price"];
    var_4 = level.heroes3["grigsby"];
    var_5 = spawn( "script_origin", var_2 );
    var_5.angles = ( 0, 180, 0 );
    var_6 = getstartorigin( var_5.origin, var_5.angles, var_1 _id_A5A4::_id_3EF5( "player_explosion" ) );
    var_7 = var_1.origin - var_6;
    var_5.origin = ( var_5.origin[0], var_5.origin[1], -360 );
    var_1 show();
    var_5 _id_A510::_id_0BC7( var_1, "player_explosion" );
    var_3 _meth_8143();
    var_3 unlink();
    var_5 thread _id_A510::_id_0BC9( var_3, "price_explosion" );
    var_4 _meth_8143();
    var_4 unlink();
    var_5 thread _id_A510::_id_0BC9( var_4, "grigsby_explosion" );
    var_5 _id_A510::_id_0C24( var_1, "player_explosion" );
    level notify( "escape_unlink_player" );
    level.playercardbackground unlink();
    var_0 delete();
    var_5 delete();
    var_1 delete();
}

escape_old_explosion_scene( var_0, var_1 )
{
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 0.2, 0, 0.2 );
    var_0 moveto( var_1, 0.2, 0, 0.2 );
    wait 0.1;
    var_0 rotateto( ( 358.273, 286.02, -89.0164 ), 0.3, 0.3, 0 );
    var_0 moveto( var_0.origin + ( 0, 0, -12 ), 0.3, 0.3, 0 );
    wait 0.3;
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 2.05, 0, 2.05 );
    var_0 moveto( var_0.origin + ( 0, 0, 0 ), 2.05, 0, 2.05 );
    wait 2.05;
    var_0 rotateto( ( 321.374, 134.198, 58.7419 ), 6, 3, 3 );
    var_0 moveto( var_0.origin + ( 0, 0, -32 ), 3, 3, 0 );
    wait 3;
    var_0 moveto( var_0.origin + ( 0, 0, 32 ), 3, 0, 3 );
    wait 3;
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 6, 3, 3 );
    var_0 moveto( var_0.origin + ( 0, 0, -32 ), 3, 3, 0 );
    wait 3;
    var_0 moveto( var_0.origin + ( 0, 0, 36 ), 3, 0, 3 );
    wait 3;
    var_0 rotateto( ( 321.374, 134.198, 58.7419 ), 4, 2, 2 );
    var_0 moveto( var_0.origin + ( 0, 0, -32 ), 2, 2, 0 );
    wait 2;
    var_0 moveto( var_0.origin + ( 0, 0, 36 ), 2, 0, 2 );
    wait 2;
    var_0 rotateto( ( 330.674, 192.977, -13.8899 ), 2, 1, 1 );
    var_0 moveto( var_0.origin + ( 0, 0, -16 ), 2, 2, 0 );
    wait 2;
    var_0 rotateto( ( 327.722, 180.996, -2.2776 ), 0.5, 0.25, 0.25 );
    wait 0.5;
    wait 0.25;
    var_0 rotateto( ( -10, 180, 0 ), 0.5 );
    var_0 moveto( var_0.origin + ( 0, 0, 0 ), 0.5 );
    wait 0.5;
    var_0 rotateto( ( 0, 75, 10 ), 1.5 );
    wait 0.35;
    var_0 moveto( var_0.origin + ( 0, 0, 10 ), 0.75 );
    wait 0.4;
    wait 0.74;
    wait 0.3;
}

playermaskputon()
{
    if ( isdefined( level.playercardbackground.ropecamera ) )
    {
        level.playercardbackground lerpviewangleclamp( 1, 0.1, 0.1, 25, 30, 20, 0 );
        wait 1;
    }

    var_0 = getdvar( "nightVisionFadeInOutTime" );
    var_1 = getdvar( "nightVisionPowerOnTime" );
    setsaveddvar( "nightVisionPowerOnTime", 0.5 );
    setsaveddvar( "nightVisionFadeInOutTime", 0.5 );
    setsaveddvar( "overrideNVGModelWithKnife", 1 );
    setsaveddvar( "nightVisionDisableEffects", 1 );
    wait 0.01;
    level.playercardbackground giveweapon( "facemask" );
    level.playercardbackground forceviewmodelanimation( "facemask", "nvg_down" );
    wait 1.7;
    setomnvar( "ui_gasmask", 1 );
    thread breath();
    wait 3.0;

    if ( isdefined( level.playercardbackground.ropecamera ) )
        level.playercardbackground lerpviewangleclamp( 1, 0.1, 0.1, 65, 65, 30, 35 );

    setsaveddvar( "nightVisionDisableEffects", 0 );
    setsaveddvar( "overrideNVGModelWithKnife", 0 );
    setsaveddvar( "nightVisionPowerOnTime", var_1 );
    setsaveddvar( "nightVisionFadeInOutTime", var_0 );
}

hidegasmaskthink()
{
    level endon( "end_finished" );

    for (;;)
    {
        var_0 = getdvarint( "hideGasMask" ) != 0;
        var_1 = getomnvar( "ui_gasmask" ) == 0;

        if ( var_0 != var_1 )
            setomnvar( "ui_gasmask", !var_0 );

        wait 0.5;
    }
}

showgasmaskcracks()
{
    wait 1.3;
    level.maskiscracked = 1;

    if ( getdvarint( "showGasMaskCracks" ) != 0 )
    {
        level.maskcracksfx = spawnfx( level._effect["goggles_cracks"], level.playercardbackground.origin );
        triggerfx( level.maskcracksfx );
        level.playercardbackground thread _id_A5A4::_id_69C4( "scn_cargo_explosion_mask_crack" );
    }
}

breath()
{
    for (;;)
    {
        while ( shouldshowbreath() )
        {
            var_0 = randomintrange( 1, 3 );
            var_1 = spawnfx( level._effect["goggles_breath"], level.playercardbackground.origin );
            triggerfx( var_1 );
            wait(var_0);
            var_1 delete();
        }

        wait 0.5;
    }
}

shouldshowbreath()
{
    return level.playercardbackground issprinting() && getdvarint( "showBreath" ) != 0;
}

pricecigardelete()
{
    wait 26;
    self delete();
}

pricecigarexhalefx( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittillmatch( "single anim", "exhale" );
        playfxontag( level._effect["cigar_exhale"], self, "J_Head", level._id_47A3._id_9C7E );
        playfxontag( level._effect["cigarsmoke_exhale_thin"], self, "J_Head" );
    }
}

pricecigarpufffx( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittillmatch( "single anim", "puff" );
        playfxontag( level._effect["cigar_glow_puff"], var_0, "tag_cigarglow" );
        wait 1;
        playfxontag( level._effect["cigar_smoke_puff"], self, "J_Head", level._id_47A3._id_9C7E );
    }
}

cigar_embers_burst( var_0 )
{
    wait 8.7;
    playfxontag( level._effect["cigar_embers_wind"], var_0, "tag_cigarglow", level._id_47A3._id_9C7E );
    wait 1.8;
    playfxontag( level._effect["cigar_embers_burst"], var_0, "tag_cigarglow", level._id_47A3._id_9C7E );
    wait 0.2;
    playfxontag( level._effect["cigar_embers_burst"], var_0, "tag_cigarglow", level._id_47A3._id_9C7E );
    wait 12.847;
    playfxontag( level._effect["cigar_embers_wind"], var_0, "tag_cigarglow", level._id_47A3._id_9C7E );
}

_id_33EF( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = var_0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    _id_33EE( var_5, var_1, var_2, var_3, var_4 );
}

_id_33EE( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "quarters_sleepers_dead" );
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = isdefined( var_4 );

    while ( isdefined( self._id_33F0 ) && self._id_33F0 == 1 )
        self waittill( "execute_mode" );

    self._id_33F0 = 1;
    var_7 = 1;

    if ( isdefined( self._id_22E0 ) && self._id_22E0 )
        var_7 = 0;

    for ( var_8 = 0; var_8 < var_0.size; var_8++ )
    {
        if ( !isalive( var_0[var_8] ) || isdefined( var_0[var_8]._id_33F4 ) )
            continue;

        var_0[var_8]._id_33F4 = 1;
        var_9 = spawn( "script_origin", var_0[var_8] gettagorigin( "j_spine4" ) );
        var_9 linkto( var_0[var_8], "j_spine4" );
        maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
        _id_A5A4::_id_22CF( var_9 );

        if ( var_3 )
        {
            while ( isdefined( var_0[var_8] ) && abs( vectordot( vectornormalize( self gettagangles( "tag_flash" ) ), vectornormalize( var_9.origin - self gettagorigin( "tag_flash" ) ) ) ) < 0.85 )
                wait 0.1;
        }

        wait(var_1);

        while ( var_6 )
        {
            var_10 = bullettrace( self gettagorigin( "tag_flash" ), var_9.origin, 1, self );

            if ( !isdefined( var_10["entity"] ) || !isplayer( var_10["entity"] ) )
                break;

            wait 0.1;
        }

        if ( isdefined( var_2 ) )
            var_5 = var_2;
        else
            var_5 = randomintrange( 3, 6 );

        _id_1935( var_5, var_9.origin );

        if ( isdefined( var_0[var_8] ) )
            var_0[var_8] kill( self gettagorigin( "tag_flash" ) );

        var_9 delete();
        wait 0.1;
    }

    _id_A5A4::_id_22CF( undefined );

    if ( var_7 )
        maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    self._id_33F0 = 0;
    self notify( "execute_mode" );
}

_id_1935( var_0, var_1 )
{
    if ( self._id_18B0 < var_0 )
        self._id_18B0 = var_0;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( isdefined( var_1 ) )
        {
            self._id_840F = var_1;
            self _meth_81ea( 1.0, var_1 );
        }
        else
            self _meth_81ea();

        wait 0.1;
    }
}

_id_66FC()
{
    thread patrol2();
    self _meth_81ce( "stand" );
    self._id_2AF3 = 1;
    self endon( "patrol_stop" );
    self endon( "damage" );
    self._id_0C72 = "patrol";
    _id_A5A4::_id_7EAB( "walk" + randomintrange( 1, 5 ) );
    var_0 = [];

    for ( var_0[var_0.size] = getnode( self._not_team, "targetname" ); isdefined( var_0[var_0.size - 1]._not_team ); var_0[var_0.size] = getnode( var_0[var_0.size - 1]._not_team, "targetname" ) )
    {

    }

    self attach( "com_flashlight_on", "tag_inhand", 1 );
    flashlight_light( 1 );
    self waittill( "goal" );
    var_1 = 0;

    for (;;)
    {
        var_1++;

        if ( var_1 < var_0.size )
        {
            var_2 = var_0[var_1];
            self _meth_81a9( var_2 );

            if ( isdefined( var_2.rank ) && var_2.rank > 0 )
                self.goalradius = var_2.rank;
            else
                self.rank = 16;

            self waittill( "goal" );
            continue;
        }

        _id_A510::_id_0C24( self, "turn" );
        var_1 = 0;
        var_0 = common_scripts\utility::_id_0D02( var_0 );
    }
}

patrol2()
{
    common_scripts\utility::_id_A087( "damage", "patrol_stop" );
    self notify( "stopanimscripted" );
    self _meth_8143();
    _id_A5A4::_id_1ED1();
    thread _id_A5A4::_id_30A1();
    flashlight_light( 0 );
    self detach( "com_flashlight_on", "tag_inhand" );
}

flashlight_light( var_0 )
{
    var_1 = "tag_light";

    if ( var_0 )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 setmodel( "tag_origin" );
        var_2 hide();
        var_2 linkto( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        thread flashlight_light_death( var_2 );
        playfxontag( level._effect["flashlight"], var_2, "tag_origin" );
    }
    else
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::_id_A087( "death", "flashlight_off" );
    var_0 delete();
}

door_opens( var_0 )
{
    self playsound( "wood_door_kick" );
    var_1 = -160;

    if ( isdefined( var_0 ) )
        var_1 *= var_0;

    self rotateyaw( var_1, 0.4, 0, 0.3 );
}

txt_voice( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );
    var_7 = ( 0, 1, 0 );
    var_8 = 0.5;

    if ( isdefined( var_6 ) )
        var_8 = var_6;

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "r":
                var_7 = ( 1, 0, 0 );
                break;
            case "b":
                var_7 = ( 0, 0, 1 );
                break;
            case "g":
                var_7 = ( 0, 1, 0 );
                break;
            case "y":
                var_7 = ( 1, 1, 0 );
                break;
        }
    }

    var_9 = [];

    if ( isdefined( var_5 ) )
        var_9[var_9.size] = var_5;

    if ( isdefined( var_4 ) )
        var_9[var_9.size] = var_4;

    if ( isdefined( var_3 ) )
        var_9[var_9.size] = var_3;

    if ( isdefined( var_2 ) )
        var_9[var_9.size] = var_2;

    var_10 = int( var_0 * 20 );

    if ( isplayer( self ) )
    {
        while ( var_10 )
        {
            var_11 = level.playercardbackground getplayerangles();
            var_12 = anglestoforward( var_11 );
            var_12 = _id_A5A4::vector_multiply( var_12, 96 );
            var_13 = level.playercardbackground.origin + var_12 + ( 0, 0, 64 );
            var_8 = 0.25;
            var_7 = ( 1, 1, 0 );

            for ( var_14 = 0; var_14 < var_9.size; var_14++ )
                var_13 += ( 0, 0, 10 * var_8 );

            wait 0.05;
            var_10--;
        }
    }
    else
    {
        while ( var_10 )
        {
            var_13 = self.origin + ( 0, 0, 64 );

            for ( var_14 = 0; var_14 < var_9.size; var_14++ )
                var_13 += ( 0, 0, 10 * var_8 );

            wait 0.05;
            var_10--;
        }
    }
}

heli_flypath( var_0 )
{
    level._id_47A3 notify( "heli_flypath" );
    level._id_47A3 endon( "heli_flypath" );

    while ( isdefined( var_0 ) )
    {
        var_1 = 1;

        if ( isdefined( var_0._not_team ) )
            var_1 = 0;

        handle_heli_audio( var_0 );
        level._id_47A3._id_9C7E setgoalpos( var_0.origin + ( 0, 0, 150 ), var_1 );
        level._id_47A3._id_9C7E neargoalnotifydist( 150 );
        level._id_47A3._id_9C7E waittill( "near_goal" );

        if ( isdefined( var_0._not_team ) )
        {
            var_0 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
            continue;
        }

        heli_in_tempest( var_0.origin );
        var_0 = undefined;
    }
}

heli_in_tempest( var_0 )
{
    level._id_47A3 endon( "heli_flypath" );
    level._id_47A3 endon( "heli_end" );
    level.playercardbackground endon( "death" );
    level._id_47A3._id_9C7E vehicle_setspeed( 7, 6, 6 );
    level._id_47A3.lastheightsea = level._id_47A3.heightsea;

    while ( isdefined( level._id_47A3._id_9C7E ) )
    {
        level._sea_org common_scripts\utility::_id_A069( "sway1", "sway2" );
        level._id_47A3.lastheightsea = level._id_47A3.heightsea;
        set_heli_tempest_goal( var_0 );
        level._id_47A3._id_9C7E waittill( "near_goal" );
    }
}

set_heli_tempest_goal( var_0 )
{
    var_1 = 10;
    var_2 = 15;
    var_3 = randomintrange( var_1, var_2 );
    var_4 = randomintrange( var_1, var_2 );

    if ( randomint( 2 ) )
        var_3 *= -1;

    if ( randomint( 2 ) )
        var_4 *= -1;

    level._id_47A3._id_9C7E setgoalpos( var_0 + ( var_3, var_4, level._id_47A3.heightsea ), 1 );
    level._id_47A3._id_9C7E neargoalnotifydist( 50 );
}

handle_heli_audio( var_0 )
{
    switch ( var_0.teambalanced )
    {
        case "heli_bridge_node":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_01" );
            break;
        case "auto2686":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "heli_deck_landing_node":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_02" );
            break;
        case "auto2699":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_1b":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_03" );
            break;
        case "auto2732":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_2b":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_04" );
            break;
        case "auto2723":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_win":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_05" );
            break;
        case "auto2736":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_gohome":
            thread maps\cargoship_aud::start_blackhawk_move( level._id_47A3._id_9C7E, "cgo_helicopter_linear_06" );
            break;
        case "auto2775":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
    }
}

heli_circle_area_start( var_0 )
{
    self._id_9C7E vehicle_setspeed( 20, 8, 8 );
    self._id_9C7E sethoverparams( 16, 10, 3 );
    self._id_9C7E cleartargetyaw();
    self._id_9C7E cleargoalyaw();
    self._id_9C7E clearlookatent();
    self endon( "stop_circling_area" );
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    thread heli_circle_area_gun();

    for (;;)
    {
        self._id_9C7E setgoalpos( var_1.origin, 1 );
        self._id_9C7E neargoalnotifydist( 64 );
        self._id_9C7E settargetyaw( var_1.angles[1] );
        self._id_9C7E waittill( "near_goal" );
        wait 5;

        if ( isdefined( var_1._not_team ) )
        {
            var_1 = common_scripts\utility::_id_40FB( var_1._not_team, "targetname" );
            continue;
        }

        var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    }
}

heli_circle_area_gun()
{
    self endon( "stop_circling_area" );
    self.motiontrackerenabled.minigun[self.motiontrackerenabled.minigun_control] setplayerspread( 15 );
    self.motiontrackerenabled.minigun[self.motiontrackerenabled.minigun_control] setaispread( 15 );

    for (;;)
    {
        if ( isdefined( self.motiontrackerenabled._id_8A85.targetobj ) )
        {
            self.motiontrackerenabled.minigun[self.motiontrackerenabled.minigun_control] settargetentity( self.motiontrackerenabled._id_8A85.targetobj );
            self.motiontrackerenabled heli_minigun_burstfire();
        }

        wait 5;
        self.motiontrackerenabled heli_minigun_stopfire();
        self.motiontrackerenabled.minigun[self.motiontrackerenabled.minigun_control] cleartargetentity();
        wait 6;
    }
}

heli_circle_area_stop()
{
    self notify( "stop_circling_area" );
    self.motiontrackerenabled heli_minigun_stopfire();
    self.motiontrackerenabled.minigun[self.motiontrackerenabled.minigun_control] cleartargetentity();
}

heli_minigun_fake_deck_fire()
{
    self.minigun[self.minigun_control] thread heli_minigun_fake_deck_fire_fx();
    common_scripts\_exploder::_id_3528( "702" );
    self.minigun[self.minigun_control] thread common_scripts\utility::_id_6975( "hind_gatling_fire" );
    thread common_scripts\utility::play_loopsound_in_space_with_end( "hind_shells_loop", ( -1990.82, -182.443, 16.125 ), "stop_shell_snd" );
    wait 3.2;
    common_scripts\_exploder::_id_3528( "703" );
    earthquake( 0.25, 0.7, level.playercardbackground.origin, 500 );

    if ( getdvarint( "ragdoll_enable" ) )
        thread deck_explosion_guy();

    common_scripts\utility::_id_384A( "hallways_lower_runners1" );
    common_scripts\_exploder::_id_5309( "703" );
}

heli_minigun_fake_deck_fire_fx()
{
    self endon( "stop_firing" );

    for (;;)
    {
        playfxontag( level._effect["heli_minigun_muzzleflash"], self, "tag_flash" );
        var_0 = randomfloatrange( 0.1, 0.3 );
        wait(var_0);
    }
}

heli_minigun_fire()
{
    self.minigun[self.minigun_control] thread heli_minigun_firethread( 0 );
}

heli_minigun_burstfire()
{
    self.minigun[self.minigun_control] thread heli_minigun_firethread( 1 );
}

heli_minigun_stopfire()
{
    self.minigun[self.minigun_control] notify( "stop_firing" );
}

heli_minigun_fake_deck_stopfire()
{
    self.minigun[self.minigun_control] notify( "stop_firing" );
    self.minigun[self.minigun_control] common_scripts\utility::_id_8EA1( "hind_gatling_fire" );
    self.minigun[self.minigun_control] thread _id_A5A4::_id_69C4( "hind_gatling_cooldown" );
    self notify( "stop_deck_glass_monitoring" );
    self notify( "stop_shell_snd" );
    thread common_scripts\utility::_id_69C2( "hind_shells_tail", ( -1990.82, -182.443, 16.125 ) );
}

heli_minigun_firethread( var_0 )
{
    self endon( "stop_firing" );

    for (;;)
    {
        var_1 = randomfloatrange( 0.2, 0.7 ) * 20;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            self shootturret();
            wait 0.05;
        }

        if ( isdefined( var_0 ) && var_0 == 1 )
            wait(randomfloat( 0.5, 2 ));
    }
}

deck_delete_destroyed_glass_pieces()
{
    self endon( "stop_deck_glass_monitoring" );
    self endon( "stop_damage" );
    self endon( "death" );
    var_0 = getglassarray( "deck_glass" );

    for (;;)
    {
        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( isglassdestroyed( var_3 ) )
            {
                deleteglass( var_3 );
                var_1 = common_scripts\utility::_id_0CDA( var_1, var_3 );
                continue;
            }
        }

        if ( var_1.size > 0 )
            var_0 = common_scripts\utility::_id_0CF7( var_0, var_1 );

        wait 0.05;
    }
}

deck_minigun_dodamage()
{
    self endon( "stop_damage" );
    self endon( "death" );
    var_0 = getglassarray( "deck_glass" );
    var_1 = 64;
    var_2 = var_1 * var_1;
    var_3 = 64;
    var_4 = var_3 * var_3;

    for (;;)
    {
        var_5 = self.origin;
        var_6 = [];

        foreach ( var_8 in var_0 )
        {
            if ( isglassdestroyed( var_8 ) )
            {
                var_6 = common_scripts\utility::_id_0CDA( var_6, var_8 );
                continue;
            }

            var_9 = getglassorigin( var_8 );

            if ( distancesquared( var_9, var_5 ) < var_2 )
            {
                var_10 = var_9 - var_5;
                destroyglass( var_8, var_10 );
                var_6 = common_scripts\utility::_id_0CDA( var_6, var_8 );
                break;
            }
        }

        for ( var_12 = 0; var_12 < level.aftdeck_enemies.size; var_12++ )
        {
            if ( !isdefined( level.aftdeck_enemies[var_12] ) )
                continue;

            if ( !isalive( level.aftdeck_enemies[var_12] ) )
                continue;

            if ( distancesquared( level.aftdeck_enemies[var_12] getorigin(), var_5 ) < var_4 )
            {
                level.aftdeck_enemies[var_12] thread deck_minigun_dodamage_to_ent( "generic_death_russian_" + randomintrange( 1, 8 ) );
                level.aftdeck_enemies = common_scripts\utility::_id_0CF6( level.aftdeck_enemies, level.aftdeck_enemies[var_12] );
                break;
            }
        }

        if ( var_6.size > 0 )
            var_0 = common_scripts\utility::_id_0CF7( var_0, var_6 );

        level.aftdeck_enemies = _id_A5A4::_id_0CFD( level.aftdeck_enemies );
        level.aftdeck_enemies = common_scripts\utility::_id_0D01( level.aftdeck_enemies );
        wait 0.05;
    }
}

deck_minigun_dodamage_to_ent( var_0 )
{
    wait 0.25;

    if ( !isdefined( self ) )
        return;

    self dodamage( 1000, level._id_47A3.motiontrackerenabled.origin );

    if ( isdefined( var_0 ) )
        thread common_scripts\utility::_id_69C2( var_0, self.origin );
}

deck_explosion_guy()
{
    var_0 = getent( "aftdeck_explosion_enemy", "targetname" );
    var_0 _id_A5A4::_id_0798( ::deck_explosion_guy_spawn );
    var_1 = var_0 _id_A5A4::_id_88C3( 1 );
    var_1.ignoretriggers = 1;
    wait 0.05;
    var_1 thread _id_A5A4::_id_69C4( "scn_cargo_heli_minigun_explosion_layer_guy" );
    var_1._id_0C72 = "guy";
    var_1 thread _id_A510::_id_0C24( var_1, "explosion" );
    wait(getanimlength( var_1 _id_A5A4::_id_3EF5( "explosion" ) ) - 0.2);
    var_1 kill();
}

deck_explosion_guy_spawn()
{
    self.grenadeammo = 0;
    thread _id_A5A4::_id_4BB0( 1 );
    _id_A5A4::_id_4462();
}

deck_enemies_see( var_0 )
{
    setthreatbias( self.script_parentname, var_0.cgogroup, 0 );
    var_0 notify( "stop_smoking" );
    var_0 notify( "patrol_stop" );
    var_0 notify( "see_enemy" );
    var_0 _meth_8143();
}

enemies_death_msg( var_0 )
{
    self waittill( "damage", var_1, var_2 );

    if ( isalive( self ) )
        self waittill( "death" );

    maps\mo_tools::radio_msg_stack( var_0 );
}

deck_enemies_herokill()
{
    self endon( "death" );
    self endon( "marked_for_death" );

    if ( self.ignoretriggers )
        self waittill( "in_range" );

    var_0 = level.heroes5;
    var_1 = getarraykeys( var_0 );
    var_2 = 700;
    var_3 = var_2 * var_2;
    var_4 = 1;

    while ( var_4 )
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            var_6 = var_1[var_5];
            var_7 = distancesquared( var_0[var_6].origin, self.origin ) < var_3;

            if ( var_7 )
            {
                var_4 = 0;

                if ( !isplayer( var_0[var_6] ) )
                {
                    var_0[var_6] thread _id_33EF( self, 0, undefined, 1 );
                    self notify( "marked_for_death" );
                }
            }
        }

        wait 0.1;
    }
}

deck_enemies_behavior()
{
    self endon( "death" );
    thread deck_enemies_behavior2();
    self.cgogroup = "deck_enemy" + self._id_9A29;
    createthreatbiasgroup( self.cgogroup );
    self setthreatbiasgroup( self.cgogroup );
    var_0 = [];
    var_0[var_0.size] = level.playercardbackground;
    var_0 = common_scripts\utility::_id_0CDD( var_0, level.heroes5 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        setignoremegroup( var_0[var_1].script_parentname, self.cgogroup );

    var_2 = 700;
    var_3 = var_2 * var_2;
    var_4 = 1;

    while ( var_4 )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_5 = distancesquared( var_0[var_1].origin, self.origin ) < var_3;

            if ( var_5 )
            {
                var_4 = 0;

                if ( !isplayer( var_0[var_1] ) )
                {
                    var_0[var_1] thread _id_33EF( self, 0, undefined, 1 );
                    self notify( "marked_for_death" );
                }

                break;
            }
        }

        wait 0.25;
    }

    self notify( "in_range" );
    var_2 = 350;
    var_3 = var_2 * var_2;

    for (;;)
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( distancesquared( var_0[var_1].origin, self.origin ) < var_3 && self _meth_81c2( var_0[var_1] ) )
                var_0[var_1] thread deck_enemies_see( self );
        }

        wait 0.25;
    }
}

deck_enemies_behavior2()
{
    self endon( "death" );
    self waittill( "doFlashBanged" );
    level.playercardbackground.ignoretriggers = 0;
    setthreatbias( self.cgogroup, level.playercardbackground.script_parentname, 200 );
    level.playercardbackground thread deck_enemies_see( self );
}

deck_heli_minigun_fx()
{
    self endon( "death" );

    for (;;)
    {
        playfxontag( level._effect["heli_minigun_shells"], self, "tag_origin" );
        wait 0.1;
    }
}

deck_heroes_holdtheline()
{
    common_scripts\utility::_id_384A( "walk_deck" );
    var_0 = 1.13;
    var_1 = 1;
    var_2 = 0.9;
    var_3 = 140;
    var_4 = [];
    var_5 = getarraykeys( level.heroes5 );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        var_4[var_4.size] = level.heroes5[var_7];
    }

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        var_4[var_6]._id_63DA = var_4[var_6]._id_5F65;
        var_4[var_6]._id_5F65 = var_1;
    }

    while ( !common_scripts\utility::_id_382E( "deck_windows" ) )
    {
        var_8 = var_4[0];

        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        {
            if ( var_8.origin[0] > var_4[var_6].origin[0] )
                var_8 = var_4[var_6];
        }

        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        {
            var_9 = var_4[var_6].origin[0] - var_8.origin[0];

            if ( var_9 > var_3 && var_4[var_6]._id_5F65 < var_0 )
            {
                var_4[var_6]._id_5F65 += 0.05;
                continue;
            }

            if ( var_4[var_6]._id_5F65 > var_1 )
                var_4[var_6]._id_5F65 -= 0.05;
        }

        wait 0.1;
    }

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        var_4[var_6]._id_5F65 = var_4[var_6]._id_63DA;
}

deck_kill_lights()
{
    var_0 = getentarray( "aftdeck_light_off", "script_noteworthy" );
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = [];

    foreach ( var_7 in var_0 )
    {
        if ( var_7._id_7A99 == "a" )
        {
            var_1[var_1.size] = var_7;
            continue;
        }

        if ( var_7._id_7A99 == "b" )
        {
            var_2[var_2.size] = var_7;
            continue;
        }

        if ( var_7._id_7A99 == "c" )
        {
            var_3[var_3.size] = var_7;
            continue;
        }

        if ( var_7._id_7A99 == "d" )
        {
            var_4[var_4.size] = var_7;
            continue;
        }

        if ( var_7._id_7A99 == "e" )
            var_5[var_5.size] = var_7;
    }

    wait 0.5;
    deck_lights_off( var_1 );
    wait 0.5;
    deck_lights_off( var_2 );
    wait 0.5;
    deck_lights_off( var_3 );
    maps\cargoship_lighting::aftdeck_lights_flickering();
    wait 0.5;
    deck_lights_off( var_4 );
    wait 0.6;
    deck_lights_off( var_5 );
}

deck_lights_off( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 _id_A5A4::_id_0639( 0 );
}

heli_minigun_attach( var_0 )
{
    self.minigun = [];
    var_1 = undefined;

    switch ( tolower( var_0 ) )
    {
        case "right":
            var_1 = "_r";
            break;
        case "left":
            var_1 = "_l";
            break;
    }

    self.minigun[tolower( var_0 )] = spawnturret( "misc_turret", self gettagorigin( "tag_gun" + var_1 ), "heli_minigun_noai" );
    self.minigun[tolower( var_0 )].angles = self gettagangles( "tag_gun" + var_1 );
    self.minigun[tolower( var_0 )] setmodel( "weapon_minigun" );
    self.minigun[tolower( var_0 )] linkto( self, "tag_gun" + var_1 );
    self.minigun[tolower( var_0 )] makeunusable();
    self.minigun[tolower( var_0 )] setmode( "manual" );
    self.minigun[tolower( var_0 )] setturretteam( "allies" );
    self.minigun_control = tolower( var_0 );
}

heli_searchlight_on()
{
    self._id_8A85 = spawnturret( "misc_turret", self gettagorigin( "tag_barrel" ), "heli_spotlight" );
    self._id_8A85.angles = self gettagangles( "tag_barrel" );
    self._id_8A85 setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    self._id_8A85 linkto( self, "tag_barrel", ( 0, 0, -16 ), ( 0, 0, 0 ) );
    self._id_8A85 makeunusable();
    self._id_8A85 setmode( "manual" );
    self._id_8A85 _meth_8159( 5 );
    common_scripts\utility::_id_383F( "heli_light_on" );
    self._id_8A85 thread h1_searchlight_light_manager();
    self._id_8A85 thread heli_searchlight_dlight();
    thread heli_searchlight_target( "default" );
}

h1_searchlight_light_manager()
{
    self endon( "death" );
    common_scripts\utility::_id_383F( "heli_light_triggers" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "heli_light_on" );
        var_0 = level._effect["heli_spotlight"];

        if ( common_scripts\utility::_id_382E( "heli_light_optimize" ) )
            var_0 = level._effect["heli_spotlight_noshadow"];

        self setmodel( "com_blackhawk_spotlight_on_mg_setup" );
        self.dlight = spawn( "script_model", level._id_47A3.motiontrackerenabled gettagorigin( "tag_barrel" ) );
        self.dlight setmodel( "tag_origin" );
        playfxontag( var_0, self, "tag_flash" );
        common_scripts\utility::_id_3857( "heli_light_on" );
        self setmodel( "com_blackhawk_spotlight_off_mg_setup" );
        stopfxontag( var_0, self, "tag_flash" );
        self.dlight delete();
    }
}

heli_searchlight_off()
{
    self.spotlight_default_target delete();
    self._id_8A85 notify( "death" );
    var_0 = spawn( "script_model", self._id_8A85.origin );
    var_0 setmodel( "tag_origin" );
    self._id_8A85 linkto( var_0 );
    var_0 moveto( ( 0, 0, -10000 ), 0.05 );
    wait 0.25;
    self._id_8A85 delete();
    var_0 delete();
}

heli_searchlight_dlight()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = anglestoforward( self gettagangles( "tag_flash" ) );
        var_1 = physicstrace( self gettagorigin( "tag_flash" ), self gettagorigin( "tag_flash" ) + _id_A5A4::vector_multiply( var_0, 1500 ) );
        var_2 = _id_A5A4::vector_multiply( var_0, -64 );
        var_1 += var_2;

        if ( isdefined( self.dlight ) )
            self.dlight moveto( var_1, 0.1 );

        wait 0.1;
    }
}

heli_searchlight_target_calcai( var_0 )
{
    var_1 = level.playercardbackground getplayerangles();
    var_1 = anglestoforward( var_1 );
    var_2 = 0;
    var_3 = var_0[0];

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4].origin - level.playercardbackground.origin;
        vectornormalize( var_5 );
        var_6 = vectordot( var_5, var_1 );

        if ( var_6 > var_2 )
        {
            var_3 = var_0[var_4];
            var_2 = var_6;
        }
    }

    return var_3;
}

heli_searchlight_target( var_0, var_1 )
{
    var_2 = undefined;

    switch ( var_0 )
    {
        case "aiarray":
            var_3 = getaiarray( var_1 );

            if ( var_1 == "allies" )
            {
                var_3 = common_scripts\utility::_id_0CF6( var_3, level.heroes7["pilot"] );
                var_3 = common_scripts\utility::_id_0CF6( var_3, level.heroes7["copilot"] );
            }

            var_2 = heli_searchlight_target_calcai( var_3 );
            break;
        case "player":
            var_2 = level.playercardbackground;
            break;
        case "targetname":
            var_2 = getent( var_1, var_0 );
            break;
        case "script_noteworthy":
            var_2 = getent( var_1, var_0 );
            break;
        case "hero":
            var_2 = level.heroes5[var_1];
            break;
        case "default":
            var_2 = self.spotlight_default_target;
            break;
    }

    if ( !isdefined( var_2 ) )
        return;

    self notify( "new_searchlight_target" );
    thread heli_searchlight_think( var_2 );
    self endon( "new_searchlight_target" );

    switch ( var_0 )
    {
        case "aiarray":
            wait(randomfloatrange( 2, 4 ));
            thread heli_searchlight_target( var_0, var_1 );
            break;
    }
}

heli_searchlight_think( var_0 )
{
    self endon( "new_searchlight_target" );
    self._id_8A85 settargetentity( var_0 );
    self._id_8A85.targetobj = var_0;
    var_0 waittill( "death" );
    self._id_8A85 cleartargetentity();
}

heli_searchlight_bridge()
{
    level endon( "price_wait_at_stairs" );
    var_0 = getentarray( "heli_bridge_spottarget", "targetname" );
    var_1 = 1;
    var_2 = 0;

    for (;;)
    {
        level._id_47A3.motiontrackerenabled.spotlight_default_target = var_0[var_2];
        level._id_47A3.motiontrackerenabled thread heli_searchlight_target( "default" );
        var_2 += var_1;

        if ( var_2 == var_0.size )
            var_1 = -1;
        else if ( var_2 == -1 )
            var_1 = 1;

        wait 1.5;
    }
}

heli_deckdrop_target()
{
    common_scripts\utility::_id_384A( "walk_deck" );
    var_0 = getent( "heli_deck_spottarget", "targetname" );
    level._id_47A3.motiontrackerenabled.spotlight_default_target = var_0;
    level._id_47A3.motiontrackerenabled thread heli_searchlight_target( "heli_deck_spottarget" );
    var_0 linkto( level._id_47A3.motiontrackerenabled, "tag_turret", ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

player_speed_set_cargoship( var_0, var_1 )
{
    var_2 = int( getdvar( "g_speed" ) );
    var_3 = var_0;

    if ( !isdefined( level.playercardbackground._id_3BC4 ) )
        level.playercardbackground._id_3BC4 = var_2;

    var_4 = var_3 - var_2;
    var_5 = 0.05;
    var_6 = var_1 / var_5;
    var_7 = var_4 / var_6;

    while ( abs( var_3 - var_2 ) > abs( var_7 * 1.1 ) )
    {
        var_2 += var_7;
        setsaveddvar( "g_speed", int( var_2 ) );
        wait(var_5);
    }

    setsaveddvar( "g_speed", var_3 );
}

player_speed_reset( var_0 )
{
    if ( !isdefined( level.playercardbackground._id_3BC4 ) )
        return;

    player_speed_set_cargoship( level.playercardbackground._id_3BC4, var_0 );
    level.playercardbackground._id_3BC4 = undefined;
}

cargohold_1_light_sway( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( var_0 );

    for (;;)
    {
        self moveto( var_1.origin, 0.1 );
        wait 0.1;
    }
}

misc_light_sway()
{
    if ( isdefined( self.script_parentname ) && self.script_parentname == "nosway" )
        return;

    var_0 = self.angles;
    var_1 = self.origin;
    var_0 += ( 0, 90, 0 );

    for (;;)
    {
        level._sea_org waittill( "sway1" );
        var_2 = level._sea_org.titleunlocked;
        var_3 = var_2 * 0.5;
        self moveto( var_1 + ( 0, 20, 0 ), var_2, var_3, var_3 );
        level._sea_org waittill( "sway2" );
        var_2 = level._sea_org.titleunlocked;
        var_3 = var_2 * 0.5;
        self moveto( var_1 + ( 0, -20, 0 ), var_2, var_3, var_3 );
    }
}

misc_tv_stairs_on()
{
    wait 1;
    self._id_9C1A notify( "trigger" );
    var_0 = getent( "start_bridge_standoff", "targetname" );
    var_0 waittill( "trigger" );
    self._id_9C1A notify( "trigger" );
}

misc_tv()
{
    self setcandamage( 1 );
    self._id_25A7 = undefined;
    self._id_6378 = undefined;

    switch ( self.motiontrackerenabled )
    {
        case "com_tv2_testpattern":
            self._id_25A7 = "com_tv2_d";
            self._id_6378 = "com_tv2";
            self._id_64BC = "com_tv2_testpattern";
            break;
        case "com_tv1_testpattern":
            self._id_25A7 = "com_tv2_d";
            self._id_6378 = "com_tv1";
            self._id_64BC = "com_tv1_testpattern";
            break;
    }

    self._id_4236 = undefined;
    self.gloworg = self.origin + ( 0, 0, 14 ) + _id_A5A4::vector_multiply( anglestoforward( self.angles ), 55 );
    self._id_9C1A = getent( self._not_team, "targetname" );
    self._id_9C1A usetriggerrequirelookat();
    self._id_9C1A setcursorhint( "HINT_NOICON" );

    if ( isdefined( self._id_9C1A._not_team ) )
    {
        self._id_57A7 = getent( self._id_9C1A._not_team, "targetname" );

        if ( isdefined( self._id_57A7 ) )
            self._id_57A9 = self._id_57A7 getlightintensity();
    }

    thread misc_tv_damage();
    thread misc_tv_off();
}

misc_tv_off()
{
    self._id_9C1A endon( "death" );

    for (;;)
    {
        self._id_4236 = spawn( "script_model", self.gloworg );
        self._id_4236 setmodel( "tag_origin" );
        self._id_4236 hide();
        playfxontag( level._effect["aircraft_light_cockpit_blue"], self._id_4236, "tag_origin" );

        if ( isdefined( self._id_57A7 ) )
            self._id_57A7 setlightintensity( self._id_57A9 );

        wait 0.2;
        self._id_9C1A waittill( "trigger" );
        self setmodel( self._id_6378 );
        self._id_4236 delete();
        self._id_4236 = undefined;

        if ( isdefined( self._id_57A7 ) )
            self._id_57A7 setlightintensity( 0 );

        wait 0.2;
        self._id_9C1A waittill( "trigger" );
        self setmodel( self._id_64BC );
    }
}

misc_tv_damage()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    self._id_9C1A notify( "death" );

    if ( isdefined( self._id_4236 ) )
        self._id_4236 delete();

    if ( isdefined( self._id_57A7 ) )
        self._id_57A7 setlightintensity( 0 );

    playfxontag( level.misc_tv_damage_fx["tv_explode"], self, "tag_fx" );
    self playsound( "tv_shot_burst" );
    self._id_9C1A delete();
    self setmodel( self._id_25A7 );
}

misc_vision()
{
    var_0 = strtok( self._id_7A99, ":;, " );
    var_1 = 5;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == "time" )
        {
            var_2++;
            var_1 = int( var_0[var_2] );
        }
    }

    for (;;)
    {
        self waittill( "trigger" );
        _id_A5A4::_id_7F00( self.script_parentname, var_1 );
    }
}

misc_fx_handler_trig()
{
    if ( !isdefined( level.fx_handlers ) )
        level.fx_handlers = [];

    level.fx_handlers[level.fx_handlers.size] = self.script_parentname;

    for (;;)
    {
        self waittill( "trigger" );

        for ( var_0 = 0; var_0 < level.fx_handlers.size; var_0++ )
        {
            if ( level.fx_handlers[var_0] == self.script_parentname )
            {
                common_scripts\utility::_id_383F( self.script_parentname );
                continue;
            }

            common_scripts\utility::_id_3831( level.fx_handlers[var_0] );
        }
    }
}

_id_23D0( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2.xpmaxmultipliertimeplayed = 0;
    var_2._id_0538 = 0;
    var_2 setshader( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2.hostquits = "fullscreen";
    var_2.visionsetnight = "fullscreen";
    var_2.alpha = var_1;
    return var_2;
}

create_credit_element( var_0 )
{
    var_1 = newhudelem();
    var_1.xpmaxmultipliertimeplayed = 0;
    var_1._id_0538 = 0;
    var_1 setshader( var_0, 512, 256 );
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.hostquits = "center";
    var_1.visionsetnight = "middle";
    var_1.alpha = 0;
    return var_1;
}

fade_overlay( var_0, var_1 )
{
    self fadeovertime( var_1 );
    self.alpha = var_0;
    wait(var_1);
}

h1_fade_overlay( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::_id_384A( "shellshock_blinking" );
    exp_fade_overlay( var_0, var_1 );
    common_scripts\utility::_id_3857( "shellshock_blinking" );
    exp_fade_overlay( var_2, var_3 );
}

exp_fade_overlay( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

h1_blur_overlay( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::_id_384A( "shellshock_blur" );
    setblur( var_0, var_1 );
    common_scripts\utility::_id_3857( "shellshock_blur" );
    setblur( var_2, var_3 );
}

blur_overlay( var_0, var_1 )
{
    setblur( var_0, var_1 );
}
#using_animtree("vehicles");

seaknight_spawn( var_0 )
{
    var_1 = spawnstruct();
    var_1.modelname = "vehicle_ch46e_opened_door_interior_a";
    var_1.unlockpoints = "seaknight";
    var_1.teambalanced = "escape_seaknight";
    var_2 = getstartorigin( var_0.origin, var_0.angles, level._id_78AC["bigbird"]["in"] );
    var_3 = getstartangles( var_0.origin, var_0.angles, level._id_78AC["bigbird"]["in"] );
    var_1.motiontrackerenabled = spawn( "script_model", var_2 );
    var_1.motiontrackerenabled setmodel( var_1.modelname );
    var_1.motiontrackerenabled.angles = var_3;
    var_1.motiontrackerenabled._id_0C72 = "bigbird";
    var_1.motiontrackerenabled.visionsetnaked = var_1.unlockpoints;
    var_1.motiontrackerenabled thread _id_A5A8::_id_0994();
    var_1.motiontrackerenabled thread maps\mo_fastrope::fastrope_player_quake();
    var_1.motiontrackerenabled useanimtree( #animtree );
    var_1.motiontrackerenabled _meth_814d( %ch46_turret_idle );
    return var_1;
}

seaknight_playlightfx()
{
    playfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing1" );
    playfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing2" );
    playfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing1" );
    playfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing2" );
    wait 0.25;
    playfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_belly" );
    playfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_tail" );
    playfxontag( level._effect["aircraft__spot_light_escape_cargoship"], self, "tag_light_cargo02" );
    playfxontag( level._effect["aircraft_light_escape_cargoship"], self, "tag_light_cargo02" );
    common_scripts\utility::_id_384A( "end_start_player_anim" );
    wait 4.7;
    killfxontag( level._effect["aircraft_light_escape_cargoship"], self, "tag_light_cargo02" );
    playfxontag( level._effect["aircraft_light_escape_cargoship_2"], self, "tag_light_cargo02" );
    thread common_scripts\utility::_id_69C2( "scn_heli_final_price_face_thunder", level.playercardbackground.origin );
    wait 4.2;
    killfxontag( level._effect["aircraft_light_escape_cargoship_2"], self, "tag_light_cargo02" );
    killfxontag( level._effect["aircraft__spot_light_escape_cargoship"], self, "tag_light_cargo02" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing1" );
    killfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing2" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing1" );
    killfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing2" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_belly" );
    killfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_tail" );
}

hallways_heroes( var_0, var_1, var_2, var_3, var_4 )
{
    if ( common_scripts\utility::_id_382E( var_1 ) )
        return;

    level endon( var_1 );

    if ( !isdefined( var_2 ) )
    {
        var_2 = [];
        var_2["alavi"] = undefined;
        var_2["grigsby"] = undefined;
        var_2["price"] = undefined;
    }

    if ( !isdefined( var_4 ) )
    {
        var_4 = [];
        var_4["alavi"] = undefined;
        var_4["grigsby"] = undefined;
        var_4["price"] = undefined;
    }

    if ( !isdefined( var_3 ) )
    {
        var_3 = [];
        var_3["alavi"] = 0;
        var_3["grigsby"] = 1;
        var_3["price"] = 2;
    }

    var_5 = getarraykeys( level.heroes3 );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        level.heroes3[var_7] _id_A5A4::_id_27EF( var_3[var_7], ::hallways_heroes_solo, var_0, var_1, var_2[var_7], var_4[var_7] );
    }

    _id_A5A4::_id_0D18( level.heroes3, "hallways_heroes_ready" );
    common_scripts\utility::_id_384A( var_0 );
}

wtfhack()
{
    wait 0.25;
    self._id_2B0E = 0;
}

hallways_heroes_solo( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.dontpushplayer ) )
        self _meth_81a7( 1 );

    if ( common_scripts\utility::_id_382E( var_1 ) )
        return;

    level endon( var_1 );
    self notify( "hallways_heroes_solo" );
    self endon( "hallways_heroes_solo" );
    var_4 = hallways_heroes_get_node( var_0 );

    while ( isdefined( var_4 ) )
    {
        self _meth_81a9( var_4 );

        if ( isdefined( var_4.rank ) && var_4.rank > 0 )
            self.goalradius = var_4.rank;
        else
            self.goalradius = 80;

        if ( isdefined( var_3 ) )
        {
            var_5 = 1;

            if ( isdefined( self._id_2B0E ) && self._id_2B0E == 1 )
                var_5 = 0;

            self._id_2B0E = 1;
            var_6 = undefined;

            if ( var_3 == "stand2run180" )
                var_6 = self;
            else if ( isdefined( self.node_relinquished ) && distance( self.node_relinquished.origin, self.origin ) < 4 )
                var_6 = self.node_relinquished;
            else if ( isdefined( self.goodnode ) && distance( self.goodnode.origin, self.origin ) < 4 )
                var_6 = self.goodnode;
            else
                var_6 = self;

            var_7 = spawn( "script_origin", var_6.origin );
            var_7.angles = var_6.angles;
            self.hackexit = var_7;

            if ( var_3 == "stand2run180" )
                var_7.angles += ( 0, 32, 0 );

            if ( var_6 != self )
            {
                if ( issubstr( var_3, "cornerleft" ) )
                    var_7.angles += ( 0, 90, 0 );
                else if ( issubstr( var_3, "cornerright" ) )
                    var_7.angles -= ( 0, 90, 0 );
            }

            self._id_0C72 = "guy";
            var_8 = getanimlength( level._id_78AC[self._id_0C72][var_3] );
            self _meth_8193( "face motion" );
            var_7 thread _id_A510::_id_0C24( self, var_3 );
            wait(var_8 - 0.2);
            self _meth_8143();
            var_7 delete();
            var_3 = undefined;

            if ( var_5 )
                thread wtfhack();
        }

        self waittill( "goal" );

        if ( isdefined( var_4._id_7A99 ) )
        {
            var_9 = strtok( var_4._id_7A99, ":;, " );

            for ( var_10 = 0; var_10 < var_9.size; var_10++ )
            {
                switch ( var_9[var_10] )
                {
                    case "disable_cqb":
                        if ( isdefined( var_4._not_team ) )
                            maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
                        else
                            _id_A5A4::_id_27EF( 1.5, maps\mo_tools::disable_cqbwalk_ign_demo_wrapper );

                        continue;
                    case "enable_cqb":
                        if ( isdefined( var_4._not_team ) )
                            maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
                        else
                            _id_A5A4::_id_27EF( 1.5, maps\mo_tools::enable_cqbwalk_ign_demo_wrapper );

                        continue;
                }
            }
        }

        if ( isdefined( var_4._not_team ) )
        {
            var_4 = getnode( var_4._not_team, "targetname" );
            continue;
        }

        var_4 = undefined;
    }

    self notify( "hallways_heroes_atgoal" );

    if ( isdefined( var_2 ) )
        maps\mo_tools::radio_msg_stack( var_2 );

    self notify( "hallways_heroes_ready" );
}

hallways_heroes_get_node( var_0 )
{
    var_1 = getnodearray( var_0, "targetname" );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3].script_parentname == self.script_parentname )
        {
            var_2 = var_1[var_3];
            break;
        }
    }

    return var_2;
}

cargohold_flashthrow( var_0, var_1, var_2 )
{
    self._id_0C72 = "guy";

    if ( isdefined( self.node_relinquished ) )
        self.goodnode = self.node_relinquished;
    else
    {
        var_3 = getallnodes();
        var_4 = [];

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            if ( issubstr( tolower( var_3[var_5].unlockpoints ), "cover left" ) )
                var_4[var_4.size] = var_3[var_5];
        }

        self.goodnode = common_scripts\utility::_id_3F33( self.origin, var_4, 90 );
    }

    var_6 = spawn( "script_origin", self.goodnode.origin );
    var_6.angles = self.goodnode.angles + ( 0, 90, 0 );
    var_6 thread _id_A510::_id_0C24( self, "grenade_throw" );
    thread animscripts\shared::_id_2D06( "single anim", animscripts\combat_utility::h1_grenade_attach_detach_listener );
    var_7 = self.groundentchanged;
    self.groundentchanged = "flash_grenade";
    self.grenadeammo++;
    wait 3.5;
    var_8 = self.origin + ( 30, 25, 30 );
    var_9 = var_8 + var_0;

    if ( isdefined( var_1 ) )
    {
        var_9 += ( 0, 0, 200 );
        var_10 = vectornormalize( var_9 - var_8 );

        if ( !isdefined( var_2 ) )
            var_2 = 350;

        var_10 = _id_A5A4::vector_multiply( var_10, var_2 );
        self magicgrenademanual( var_8, var_10, 1.1 );
    }
    else
        self magicgrenade( var_8, var_9, 1.1 );

    self.groundentchanged = var_7;
    self.grenadeammo = 0;
    wait 2;
}

caroghold_remove_flash_grenade( var_0 )
{
    common_scripts\utility::_id_384A( var_0 );

    if ( isdefined( self.h1_scripted_grenade ) )
        animscripts\combat_utility::h1_grenade_attach_detach_listener( "grenade_throw" );
}

jumptoinit()
{
    if ( getdvar( "jumpto" ) == "" )
        setdvar( "jumpto", "" );

    if ( !isdefined( getdvar( "jumpto" ) ) )
        setdvar( "jumpto", "" );

    var_0 = getdvar( "start" );
    var_1 = getdvar( "jumpto" );
    level.jumpto = "start";
    level.jumptosection = "bridge";

    if ( isdefined( var_0 ) && !( var_0 == "" || issubstr( var_0, " ** " ) ) )
        level.jumpto = var_0;

    if ( isdefined( var_1 ) && var_1 != "" )
        level.jumpto = var_1;

    var_2 = 1;

    if ( level.jumpto == "bridge" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "bridge";
        level.jumpto = "bridge";
        return;
    }

    var_2++;

    if ( level.jumpto == "quarters" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "quarters";
        level.jumpto = "quarters";
        return;
    }

    var_2++;

    if ( level.jumpto == "deck" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "deck";
        level.jumpto = "deck";
        return;
    }

    var_2++;

    if ( level.jumpto == "hallways" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "hallways";
        level.jumpto = "hallways";
        return;
    }

    var_2++;

    if ( level.jumpto == "cargohold" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "cargohold";
        level.jumpto = "cargohold";
        return;
    }

    var_2++;

    if ( level.jumpto == "cargohold2" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "cargohold2";
        level.jumpto = "cargohold2";
        return;
    }

    var_2++;

    if ( level.jumpto == "laststand" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "laststand";
        level.jumpto = "laststand";
        return;
    }

    var_2++;

    if ( level.jumpto == "package" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "package";
        level.jumpto = "package";
        return;
    }

    var_2++;

    if ( level.jumpto == "escape" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "escape";
        level.jumpto = "escape";
        return;
    }

    var_2++;

    if ( level.jumpto == "end" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "end";
        level.jumpto = "end";
        return;
    }

    var_2++;
}

jumptothink()
{
    jumptorandomtrig( level.jumpto );
    var_0 = [];

    if ( level.jumpto != "start" )
    {
        setomnvar( "ui_gasmask", 1 );
        thread hidegasmaskthink();
        thread breath();
    }

    switch ( level.jumpto )
    {
        case "start":
            break;
        case "bridge":
            _id_A5E8::_id_870C( "aud_bridge_checkpoint" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            level._id_47A3._id_9C7E vehicle_setspeed( 700, 700 );
            level._id_47A3._id_9C7E setgoalpos( common_scripts\utility::_id_40FB( "intro_ride_node", "targetname" ).origin + ( 0, 0, 920 ), 1 );
            level._id_47A3._id_9C7E settargetyaw( 220 );
            wait 5.5;
            _id_A5A4::_id_27EF( 2.5, _id_A5E8::_id_870C, "aud_stop_intro_mix" );
            level.playercardbackground.titleunlocked = 3;
            level._id_47A3 maps\mo_fastrope::fastrope_player_unload();
            level notify( "bridge_jumpto_done" );
            break;
        case "deck":
            _id_A5E8::_id_870C( "aud_deck_checkpoint" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "_sea_waves" );
            common_scripts\utility::_id_3831( "_sea_bob" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            _id_A5A4::_id_7F00( "cargoship_exterior", 0 );
            _id_A5A4::_id_9E6E( "cargoship_exterior", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_exterior" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            level._id_47A3._id_9C7E vehicle_setspeed( 300, 300, 250 );
            level._id_47A3._id_9C7E setgoalpos( common_scripts\utility::_id_40FB( "heli_deck_landing_node", "targetname" ).origin + ( 0, 0, 146 ), 1 );
            var_1 = getnode( "quarters_price_2", "targetname" );
            level.heroes5["price"] thread jumptoactor( var_1.origin );
            var_1 = getnode( "quarters_alavi_2", "targetname" );
            level.heroes5["alavi"] thread jumptoactor( var_1.origin );
            level._id_47A3.motiontrackerenabled heli_searchlight_on();
            wait 1;
            common_scripts\utility::_id_383F( "deck_drop" );
            common_scripts\utility::_id_383F( "deck_heli" );
            common_scripts\utility::_id_383F( "deck" );
            break;
        case "hallways":
            _id_A5E8::_id_870C( "aud_hallways_checkpoint" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "_sea_waves" );
            _id_A5A4::_id_7F00( "cargoship_exterior", 0 );
            _id_A5A4::_id_9E6E( "cargoship_exterior", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_exterior" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["price"] thread jumptoactor( var_1["alavi"].origin + ( -100, 0, 0 ) );
            level.heroes5["grigsby"] thread jumptoactor( var_1["alavi"].origin + ( 250, 0, 0 ) );
            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level._id_47A3 notify( "heli_end" );
            wait 0.1;
            level._id_47A3.motiontrackerenabled delete();
            level._id_47A3._id_9C7E delete();
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            common_scripts\utility::_id_383F( "hallways" );
            common_scripts\utility::_id_383F( "hallways_moveup" );
            break;
        case "cargohold":
            _id_A5E8::_id_870C( "aud_cargohold_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "cargohold_fx" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_upperdeck", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_upperdeck", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_upperdeck" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "hallways_lowerhall2", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_383F( "hallways_lowerhall2" );
            break;
        case "cargohold2":
            _id_A5E8::_id_870C( "aud_cargohold2_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "cargohold_fx" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_cargohold", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "cargoholds_1_part5", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"]._id_A154 = 1;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_0D13( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::_id_97CC );
            common_scripts\utility::_id_383F( "cargoholds2" );
            break;
        case "laststand":
            _id_A5E8::_id_870C( "aud_laststand_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "cargohold_fx" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_cargohold", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "cargohold2_door", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"]._id_A154 = 1;
            level.heroes5["price"].ignoretriggers = 0;
            level.heroes5["alavi"].ignoretriggers = 0;
            level.heroes5["grigsby"].ignoretriggers = 0;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_0D13( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::_id_97CC );
            common_scripts\utility::_id_383F( "laststand" );
            break;
        case "package":
            _id_A5E8::_id_870C( "aud_package_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "cargohold_fx" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_cargohold", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "package1", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"]._id_A154 = 1;
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_0D13( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::_id_97CC );
            common_scripts\utility::_id_383F( "package" );
            break;
        case "escape":
            _id_A5E8::_id_870C( "aud_escape_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_383F( "cargohold_fx" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_cargohold", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "escape_nodes", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes3["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes3["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes3["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"]._id_A154 = 1;
            wait 0.1;
            level._id_47A3.motiontrackerenabled delete();
            level._id_47A3._id_9C7E delete();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_0D13( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::_id_97CC );
            common_scripts\utility::_id_383F( "escape" );
            thread _id_A5A4::_id_3840( "package_secure", 1 );
            break;
        case "end":
            _id_A5E8::_id_870C( "aud_end_checkpoint" );
            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "cargohold_fx" );
            common_scripts\utility::_id_383F( "topside_fx" );
            common_scripts\utility::_id_383F( "_sea_viewbob" );
            common_scripts\utility::_id_3831( "_sea_bob" );
            thread _id_A5B3::_id_7100( 1 );
            _id_A5A4::_id_7F00( "cargoship_interior_upperdeck", 0 );
            _id_A5A4::_id_9E6E( "cargoship_interior_upperdeck", 0 );
            level.playercardbackground _id_A5A4::set_light_set_player( "cargoship_interior_upperdeck" );
            common_scripts\utility::_id_384A( "heroes_ready" );
            level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake_now();
            var_4 = getarraykeys( level.heroes5 );

            for ( var_3 = 0; var_3 < var_4.size; var_3++ )
            {
                var_5 = var_4[var_3];
                var_6 = level.heroes5[var_5];
                var_6 notify( "stop_" + var_6.info_player_start );
                level._id_47A3.motiontrackerenabled notify( "stop_" + var_6.info_player_start );
            }

            waitframe;
            var_2 = getnodearray( "hallway_attack", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes3["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes3["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes3["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level._id_47A3.motiontrackerenabled delete();
            level._id_47A3._id_9C7E delete();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_parentname] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::_id_97CC();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::_id_97CC();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::_id_97CC();
            common_scripts\utility::_id_0D13( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::_id_97CC );
            common_scripts\utility::_id_383F( "escape" );
            common_scripts\utility::_id_383F( "package_secure" );
            common_scripts\utility::_id_383F( "escape_hallway_lower_flag" );
            common_scripts\utility::_id_383F( "cargoship_end_music" );
            common_scripts\utility::_id_0D13( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::_id_97CE );
            common_scripts\utility::_id_383F( "escape_exterior_visionset" );
            waitframe;
            maps\mo_tools::playerweapontake();
            level.heroes3["alavi"]._id_0C72 = "escape";
            level.heroes3["grigsby"]._id_0C72 = "escape";
            level.heroes3["price"]._id_0C72 = "escape";
            var_7 = [];
            var_7[var_7.size] = level.heroes3["price"];
            var_7[var_7.size] = level.heroes3["alavi"];
            var_7[var_7.size] = level.heroes3["grigsby"];
            level.heroes3["price"] _id_A5A4::_id_32DD( "turning" );
            level.heroes3["grigsby"] _id_A5A4::_id_32DD( "turning" );
            level.heroes3["alavi"] _id_A5A4::_id_32DD( "turning" );
            level.heroes3["alavi"] thread escape_heroes_holdtheline( 500, var_7, 200 );
            level.heroes3["grigsby"] thread escape_heroes_holdtheline( 400, var_7, 150 );
            level.heroes3["price"] thread escape_heroes_holdtheline( 350, var_7, 150 );
            wait 0.5;
            escape_heroes_turn_setup();
            escape_heroes_runanim_setup();
            thread maps\cargoship::escape_seaknight();
            thread maps\cargoship::end_main();
            level.heroes3["alavi"] thread _id_A5A4::_id_3AF2( ::escape_heroes_run, "escape_aftdeck" );
            level.heroes3["grigsby"] _id_A5A4::_id_27EF( 2, _id_A5A4::_id_3AF2, ::escape_heroes_run, "escape_aftdeck" );
            level.heroes3["price"] _id_A5A4::_id_27EF( 3, _id_A5A4::_id_3AF2, ::escape_heroes_run, "escape_aftdeck" );
            thread _id_A5A4::_id_3840( "escape_hallway_upper_flag", 3.75 );
            level._sea_org notify( "tilt_40_degrees" );
            level._sea_org.sway = "sway1";
            level._sea_org notify( "sway1" );
            level._sea_org.titleunlocked = 0.1;
            level._sea_org.acctime = level._sea_org.titleunlocked * 0.5;
            level._sea_org.dectime = level._sea_org.titleunlocked * 0.5;
            level._sea_org.runto_arrived = ( 0, 0, -40 );
            level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
            level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
            level._sea_link movez( -300, 0.1 );
            level._sea_org movez( -300, 0.1 );
            break;
    }

    switch ( level.jumpto )
    {
        case "package":
        case "escape":
        case "end":
            var_8 = getent( "cargohold1_door", "targetname" );
            var_9 = getent( var_8._not_team, "targetname" );
            var_9 notsolid();
            var_9 connectpaths();
            var_8 door_opens();
        case "cargohold":
            var_8 = getent( "hallways_door", "targetname" );
            var_9 = getent( var_8._not_team, "targetname" );
            var_9 notsolid();
            var_9 connectpaths();
            var_8 door_opens();
    }

    common_scripts\utility::_id_0D13( var_0, ::jumptorandomtrigthink );

    if ( level.jumpto != "end" )
        maps\mo_tools::playerweapongive();

    var_1 = common_scripts\utility::_id_40FB( "jumpto_" + level.jumpto, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    level.playercardbackground unlink();
    level.playercardbackground allowlean( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground setorigin( var_1.origin + ( 0, 0, 8 ) );
    level.playercardbackground setplayerangles( var_1.angles );
}

jumptoactor( var_0 )
{
    self notify( "overtakenow" );
    self unlink();
    self _meth_8143();
    var_1 = spawn( "script_origin", self.origin );
    self linkto( var_1 );
    var_1 moveto( var_0, 0.2 );
    wait 0.25;
    self unlink();
    var_1 delete();
    self._id_588F = 0;
    self _meth_81aa( var_0 );
    self.goalradius = 16;
    common_scripts\utility::_id_A0A0( "goal", 1.25 );
    wait 0.1;
    self _meth_81aa( var_0 );
    self.goalradius = 16;
}

jumptorandomtrig( var_0 )
{
    var_1 = getentarray( "jumptoRandomTrig", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = strtok( var_1[var_2]._id_7A99, ":;, " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4] == var_0 )
            {
                var_1[var_2].jumptorandomtype = tolower( var_3[var_4 + 1] );
                var_1[var_2] thread jumptorandomtrigthink();
                break;
            }
        }
    }
}

jumptorandomtrigthink()
{
    if ( self.classname != "trigger_multiple" && self.classname != "trigger_radius" && !isdefined( self.jumptorandomtype ) )
        return;

    if ( !isdefined( self.jumptorandomtype ) )
        self.jumptorandomtype = "trigger";

    switch ( self.jumptorandomtype )
    {
        case "trigger":
            wait 0.1;
            self notify( "trigger" );
            break;
        case "off":
            common_scripts\utility::_id_97CC();
            break;
        case "open":
            maps\mo_tools::door_breach_door();
            break;
    }
}

escape_catwalk()
{
    var_0 = getent( "escape_catwalk", "targetname" );
    var_1 = getentarray( var_0.teambalanced, "target" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] linkto( var_0 );

    common_scripts\utility::_id_384A( "escape_catwalk" );
    var_0 movez( -4, 0.25, 0, 0 );
    var_0 movey( -2, 0.25, 0, 0 );
    var_0 rotateto( ( 0, 0, 5 ), 0.25, 0, 0 );
    var_0 waittill( "rotatedone" );
    var_0 thread escape_catwalk_sway();
    var_0 thread _id_A5A4::_id_69C4( "cgo_escape_catwalk_breaks" );
    var_0 thread common_scripts\utility::_id_6975( "cgo_escape_catwalk_creaks_loop" );
    common_scripts\utility::_id_3852( "escape_death_cargohold1", "escape_catwalk_fall" );
    var_3 = _id_23D0( "overlay_hunted_red", 0 );
    thread escape_catwalk_live( var_3 );
    var_3 thread exp_fade_overlay( 1, 6 );
    var_0 notify( "stop_swaying" );
    var_4 = 2.5;

    if ( level._id_3BFE == 0 )
        var_4 = 3.5;

    wait(var_4);
    var_0 common_scripts\utility::_id_8EA1( "cgo_escape_catwalk_creaks_loop" );
    var_0 thread _id_A5A4::_id_69C4( "cgo_escape_catwalk_collapse" );
    var_0 movez( -16, 1.5, 0, 1.5 );
    var_0 rotateto( ( 10, 0, 90 ), 1.5, 0, 1.5 );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "escape_catwalk_madeit" ) )
        escape_mission_failed();
}

escape_catwalk_live( var_0 )
{
    common_scripts\utility::_id_384A( "escape_catwalk_madeit" );
    var_0 exp_fade_overlay( 0, 0.5 );
    var_0 destroy();
}

escape_catwalk_sway()
{
    self endon( "stop_swaying" );
    var_0 = 0.7;

    for (;;)
    {
        self rotateto( ( 0, -2 * var_0, -2 * var_0 ), 1, 0.5, 0.5 );
        self waittill( "rotatedone" );
        self rotateto( ( 0, 2 * var_0, 2 * var_0 ), 1, 0.5, 0.5 );
        self waittill( "rotatedone" );
    }
}

escape_heroes_turn_setup()
{
    var_0 = getentarray( "escape_turn_animations", "targetname" );
    level.escape_turns = [];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        level.escape_turns[var_0[var_1].script_parentname] = var_0[var_1];
}
#using_animtree("generic_human");

escape_turn( var_0 )
{
    level endon( "killanimscript" );
    self _meth_8193( "face angle", self.turn_anim["angle"][1] );
    self setflaggedanimknoball( "custom_anim", self.turn_anim["anim"], %body, 1, 0.2, self.turn_anim["rate"] );
    wait(self.turn_anim["wait"]);
}

escape_heroes_run( var_0 )
{
    self _meth_81ce( "stand", "crouch" );
    self _meth_81a7( 1 );
    self.goalradius = 116;
    self.ignoretriggers = 1;
    self.index = 1;
    self.invisible = 0;
    self._id_2AF3 = 1;

    if ( isdefined( level.escape_turns[var_0] ) )
    {
        var_1 = level.escape_turns[var_0];
        var_2 = var_1._id_7A99;
        var_3 = _id_A5A4::_id_3EF5( var_2 );
        var_4 = getanimlength( var_3 );
        var_5 = getstartorigin( var_1.origin, var_1.angles, var_3 );
        self _meth_81aa( var_5 );
        self.goalradius = 20;
        self waittill( "goal" );
        self.escape_run_section = var_0;

        switch ( var_0 )
        {
            case "escape_cargohold2b":
                var_6 = 1;
                break;
            case "escape_hallway_lowerb":
                var_6 = 1;
                break;
            case "escape_hallway_lowerc":
                var_6 = 1;
                break;
            case "escape_hallway_lowerd":
                var_6 = 1;
                break;
            case "escape_hallway_lowere":
                var_6 = 1;
                break;
            case "escape_hallway_upper":
                var_6 = 1;
                break;
            case "escape_aftdeck":
                var_6 = 1;
                break;
            default:
                var_6 = 0;
                break;
        }

        if ( self.script_parentname == "price" )
            var_7 = common_scripts\utility::_id_9294( var_0 == "escape_hallway_lower", 1.5, 1.2 );
        else
            var_7 = 2.1;

        self.turn_anim = [];
        self.turn_anim["anim"] = var_3;
        self.turn_anim["angle"] = var_1.angles;
        self.turn_anim["length"] = var_4;
        self.turn_anim["rate"] = var_7;
        self.turn_anim["wait"] = var_4 / self.turn_anim["rate"] - 0.2;

        if ( self.script_parentname == "price" && var_6 == 1 )
            _id_A5A4::_id_7E45( level.current_run[var_0][self._id_76B8] );
        else
        {
            self _meth_819e( ::escape_turn );
            _id_A5A4::_id_27EF( self.turn_anim["wait"] - 0.2, _id_A5A4::_id_7E45, level.current_run[var_0][self._id_76B8] );
            wait(self.turn_anim["wait"]);
        }
    }
    else
        _id_A5A4::_id_27EF( 0.75, _id_A5A4::_id_7E45, level.current_run[var_0][self._id_76B8] );

    var_8 = getnodearray( var_0 + "_start", "targetname" );

    if ( isdefined( var_8 ) && var_8.size )
    {
        var_9 = undefined;

        for ( var_10 = 0; var_10 < var_8.size; var_10++ )
        {
            if ( var_8[var_10].script_parentname == self.script_parentname )
            {
                var_9 = var_8[var_10];
                break;
            }
        }

        while ( isdefined( var_9 ) )
        {
            self _meth_81a9( var_9 );

            if ( isdefined( var_9.rank ) && var_9.rank > 0 )
                self.goalradius = var_9.rank;
            else
                self.goalradius = 116;

            self waittill( "goal" );

            if ( isdefined( var_9._not_team ) )
            {
                var_9 = getnode( var_9._not_team, "targetname" );
                continue;
            }

            var_9 = undefined;
        }
    }

    if ( self.script_parentname == "price" )
    {
        switch ( var_0 )
        {
            case "escape_cargohold2":
                var_11 = "price_escape_1";
                var_12 = getent( "escape_cargohold2b", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_cargohold2b", "targetname" );
                var_15 = undefined;
                break;
            case "escape_hallway_lower":
                var_11 = "price_escape_2";
                var_12 = getent( "escape_hallway_lowerb", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_hallway_lowerb", "targetname" );
                var_15 = undefined;
                break;
            case "escape_hallway_lowerb":
                var_11 = "price_escape_3";
                var_12 = getent( "escape_hallway_lowerc", "script_noteworthy" );
                var_13 = getent( "escape_hallway_lowerd", "script_noteworthy" );
                var_14 = getent( "newpos_price_escape_hallway_lowerc", "targetname" );
                var_15 = getent( "newpos_price_escape_hallway_lowerd", "targetname" );
                break;
            case "escape_hallway_lowerd":
                var_11 = "price_escape_4";
                var_12 = getent( "escape_hallway_lowere", "script_noteworthy" );
                var_13 = getent( "escape_hallway_upper", "script_noteworthy" );
                var_14 = getent( "newpos_price_escape_hallway_lowere", "targetname" );
                var_15 = getent( "newpos_price_escape_hallway_upper", "targetname" );
                break;
            case "escape_hallway_upperb":
                var_11 = "price_escape_5";
                self.a.animreachcustomradius = 15;
                var_12 = getent( "escape_aftdeck", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_aftdeck", "targetname" );
                var_15 = undefined;
                break;
            default:
                var_11 = undefined;
                var_12 = undefined;
                var_13 = undefined;
                var_14 = undefined;
                var_15 = undefined;
                break;
        }

        if ( isdefined( var_11 ) )
        {
            var_16 = getent( "price_escapeanims_refpos", "targetname" );
            var_16 _id_A510::_id_0BFF( self, var_11 );
            self.a.animreachcustomradius = undefined;

            if ( isdefined( var_14 ) )
            {
                var_12.origin = var_14.origin;

                if ( isdefined( var_15 ) )
                    var_13.origin = var_15.origin;
            }

            _id_A5A4::_id_7E4D( var_12.origin );
            self.goalradius = 40;
            var_16 _id_A510::_id_0C24( self, var_11 );
        }
    }

    self notify( "end_escape_run" );
}

escape_sneakyslowplayer_underwaterfall()
{
    common_scripts\utility::_id_384A( "bottom_1st_stairs" );

    if ( distance2d( level.playercardbackground.origin, level.heroes3["price"].origin ) < 150 )
        player_speed_set_cargoship( 110, 0.3 );

    _id_A5A4::_id_27EF( 0.6, ::player_speed_set_cargoship, 185, 1.5 );
    common_scripts\utility::_id_384A( "inside_1st_waterfall" );

    if ( distance2d( level.playercardbackground.origin, level.heroes3["price"].origin ) < 250 )
    {
        level.playercardbackground setvelocity( ( 0, 1, 0 ) );
        player_speed_set_cargoship( 135, 0.1 );
        _id_A5A4::_id_27EF( 0.5, ::player_speed_set_cargoship, 185, 1.25 );
    }

    common_scripts\utility::_id_384A( "inside_2nd_waterfall" );

    if ( distance2d( level.playercardbackground.origin, level.heroes3["price"].origin ) < 250 )
    {
        level.playercardbackground setvelocity( ( 0, 1, 0 ) );
        player_speed_set_cargoship( 135, 0.1 );
        _id_A5A4::_id_27EF( 0.5, ::player_speed_set_cargoship, 180, 1.5 );
    }

    common_scripts\utility::_id_384A( "waterleak_machine_room" );

    if ( distance2d( level.playercardbackground.origin, level.heroes3["price"].origin ) < 200 )
    {
        player_speed_set_cargoship( 140, 0.2 );
        _id_A5A4::_id_27EF( 0.75, ::player_speed_set_cargoship, 170, 1.25 );
    }

    common_scripts\utility::_id_384A( "on_flooded_stairs" );

    if ( distance2d( level.playercardbackground.origin, level.heroes3["price"].origin ) < 175 )
    {
        player_speed_set_cargoship( 110, 0.2 );
        _id_A5A4::_id_27EF( 1, ::player_speed_set_cargoship, 170, 3 );
    }
}

escape_heroes2()
{
    self._id_0C78 = 1.0;
    self._id_5F65 = 1.0;
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = ( 0, 180, 0 );
    self._id_63C4 = self._id_0C72;
    self._id_0C72 = "escape";
    self _meth_81ce( "crouch", "stand" );
    self _meth_8143();
    self linkto( var_0 );
    var_0 thread _id_A510::_id_0C24( self, "blowback" );
    var_1 = undefined;

    switch ( self.script_parentname )
    {
        case "alavi":
            var_1 = ( 600, -160, -359 );
            break;
        case "grigsby":
            var_1 = ( 520, -320, -359 );
            break;
        case "price":
            self _meth_81ce( "prone" );
            var_1 = ( 442, -230, -359 );
            break;
    }

    var_0 moveto( var_1, 1, 0, 0.5 );

    if ( self.script_parentname == "price" || self.script_parentname == "grigsby" )
        wait 5;
    else
        self waittillmatch( "single anim", "end" );

    switch ( self.script_parentname )
    {
        case "alavi":
            var_1 = self.origin;
            break;
        case "grigsby":
            var_0 delete();
            self _meth_81ce( "stand" );
            break;
        case "price":
            var_0 delete();
            self _meth_81ce( "stand" );
            break;
    }

    if ( self.script_parentname == "price" || self.script_parentname == "grigsby" )
        return;

    self _meth_8143();
    self unlink();
    self _meth_81aa( var_1 );
    self.goalradius = 16;
    self._id_0C72 = self._id_63C4;

    switch ( self.script_parentname )
    {
        case "price":
            wait 2;
            var_0.origin = self.origin;
            var_0.angles = ( 0, 230, 0 );
            var_0 _id_A510::_id_0C24( self, "standup" );
            break;
        case "grigsby":
            wait 0.5;
            var_0.origin += ( 0, -35, 0 );
            var_0.angles = ( 0, 360, 0 );
            var_0 _id_A510::_id_0C24( self, "stumble3" );
            break;
    }

    var_0 delete();
    self _meth_81ce( "stand" );
}

escape_heroes()
{
    level endon( "escape_explosion" );
    var_0 = getent( "escape_door", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" );
    var_1 notsolid();
    var_1 connectpaths();
    var_0 thread door_opens( 0.6 );

    if ( self.script_parentname == "price" )
        level.heroes3["price"]._id_5F65 = 1.0816;
    else if ( self.script_parentname == "alavi" )
    {
        level.heroes3["alavi"]._id_5F65 = 1;
        wait 0.75;
    }
    else if ( self.script_parentname == "grigsby" )
    {
        level.heroes3["grigsby"]._id_5F65 = 1;
        wait 1.5;
    }

    var_2 = getnodearray( "escape_nodes", "targetname" );
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_2[var_4].script_parentname == self.script_parentname )
        {
            var_3 = var_2[var_4];
            break;
        }
    }

    self _meth_81ce( "crouch", "stand" );
    var_5 = 0;

    switch ( self.script_parentname )
    {
        case "grigsby":
            var_5 = 0;
            break;
        case "price":
            var_5 = 0.4;
            break;
        case "alavi":
            var_5 = 1;
            break;
    }

    self _meth_81a7( 1 );
    self.goalradius = 80;
    self.ignoretriggers = 1;
    self.index = 1;
    self.oldinterval = self.invisible;
    self.invisible = 0;

    while ( isdefined( var_3 ) )
    {
        self _meth_81a9( var_3 );

        if ( isdefined( var_3.rank ) && var_3.rank > 0 )
            self.goalradius = var_3.rank;
        else
            self.goalradius = 80;

        self waittill( "goal" );
        var_6 = common_scripts\utility::_id_40FB( var_3.teambalanced, "target" );

        if ( isdefined( var_6 ) )
        {
            var_7 = getent( var_6.teambalanced, "target" );

            if ( !common_scripts\utility::_id_382E( var_7._id_79D3 ) )
            {
                common_scripts\utility::_id_384A( var_7._id_79D3 );

                if ( var_7._id_79D3 == "escape_moveup1" )
                    wait(var_5);
            }
        }

        if ( isdefined( var_3._not_team ) )
        {
            var_3 = getnode( var_3._not_team, "targetname" );
            continue;
        }

        var_3 = undefined;
    }
}

escape_waterlevel()
{
    level waittill( "escape_show_waterlevel" );
    _id_A5A4::_id_3CAE();
    var_0 = self._id_66BD;
    self show();
    self moveto( var_0.origin, 0.5 );
    self rotateto( var_0.angles, 0.5 );
    wait 0.5;
    self notify( "show" );
    level._sea_org waittill( "tilt_20_degrees" );
    var_0 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
    self moveto( var_0.origin, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    self rotateto( var_0.angles, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org waittill( "tilt_30_degrees" );
    var_0 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
    self moveto( var_0.origin, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    self rotateto( var_0.angles, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
}

escape_tilt_gravity( var_0 )
{
    level endon( "stop_escape_tilt_gravity" );

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, var_0 );
        var_2 = _id_A5A4::vector_multiply( anglestoup( var_1 ), -1 );
        var_3 = _id_A5A4::vector_multiply( anglestoright( var_1 ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }

    for (;;)
    {
        wait 0.05;
        var_2 = _id_A5A4::vector_multiply( anglestoup( level._sea_org.angles ), -1 );
        var_3 = _id_A5A4::vector_multiply( anglestoright( level._sea_org.angles ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

escape_tiltboat()
{
    var_0 = [];
    var_0["stage_0"] = -8;
    var_0["stage_1"] = -16;
    var_0["stage_2"] = -26;
    var_0["stage_3"] = -23;
    var_0["stage_4"] = -33;
    var_0["stage_5"] = -30;
    common_scripts\utility::_id_384A( "start_sinking_boat" );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1600 );
    var_1 = getentarray( "boat_sway", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2]._id_577B.setscale = 1.0;

    level waittill( "escape_show_waterlevel" );
    thread escape_tilt_gravity();
    level._sea_org.titleunlocked = 1;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_0"] );

    if ( level._sea_org.sway == "sway2" )
    {
        level._sea_org.sway = "sway1";
        level._sea_org notify( "sway1" );
        wait 0.05;
    }

    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, 1, 0 );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, 1, 0 );
    wait(level._sea_org.titleunlocked);
    level notify( "stop_escape_tilt_gravity" );
    level waittill( "escape_unlink_player" );
    thread escape_tilt_gravity();
    level._sea_org.titleunlocked = 3.5;
    level._sea_org.acctime = 0;
    level._sea_org.dectime = 1.75;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_1"] );
    level._sea_org notify( "tilt_20_degrees" );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level notify( "stop_escape_tilt_gravity" );
    common_scripts\utility::_id_384A( "escape_tilt_30" );
    thread escape_tilt_gravity( -40 );
    level._sea_org.titleunlocked = 3.5;
    level._sea_org.acctime = 1.75;
    level._sea_org.dectime = 1.75;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_2"] );
    level._sea_org notify( "tilt_30_degrees" );
    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level._sea_org.titleunlocked = 1;
    level._sea_org.acctime = level._sea_org.titleunlocked * 0.5;
    level._sea_org.dectime = level._sea_org.titleunlocked * 0.5;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_3"] );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level notify( "stop_escape_tilt_gravity" );
    common_scripts\utility::_id_384A( "escape_cargohold1_enter" );
    thread escape_tilt_gravity();
    level._sea_org.titleunlocked = 3.5;
    level._sea_org.acctime = 1.75;
    level._sea_org.dectime = 1.75;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_4"] );
    level._sea_org notify( "tilt_40_degrees" );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level._sea_org.titleunlocked = 1;
    level._sea_org.acctime = level._sea_org.titleunlocked * 0.5;
    level._sea_org.dectime = level._sea_org.titleunlocked * 0.5;
    level._sea_org.runto_arrived = ( 0, 0, var_0["stage_5"] );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level notify( "stop_escape_tilt_gravity" );
    level._sea_link movez( -300, 1, 0.5, 0.5 );
    level._sea_org movez( -300, 1, 0.5, 0.5 );
    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    wait 0.5;
    var_3 = _id_A5A4::vector_multiply( anglestoup( level._sea_org.angles ), -1 );
    setphysicsgravitydir( var_3 );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1000 );
}

escape_fx_setup()
{
    var_0 = _id_A5A4::_id_3FA9( "cargo_vl_red_thin" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_red_lrg" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_steam" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_steam_single" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_steam_single_2" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_steam_single_strong" ) );
    var_1 = _id_A5A4::_id_3FA9( "sparks_runner" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_waterdrips" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_caustics" ) );
    common_scripts\utility::_id_384A( "start_sinking_boat" );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_671F );
    common_scripts\utility::_id_384A( "escape_explosion" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_748D );
    var_2 = getentarray( "escape_pipe_hide", "targetname" );
    var_3 = getentarray( "pipe_shootable", "targetname" );
    var_4 = spawn( "script_origin", ( 0, 0, 0 ) );

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_6 = [];

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            var_4.origin = var_3[var_7].origin;

            if ( var_2[var_5] istouching( var_4 ) )
            {
                var_6[var_6.size] = var_3[var_7];
                var_3[var_7] = undefined;
            }
        }

        for ( var_8 = 0; var_8 < var_6.size; var_8++ )
            var_6[var_8] delete();

        var_3 = common_scripts\utility::_id_0D01( var_3 );
    }

    var_4 delete();
    var_9 = getentarray( "escape_container", "targetname" );

    for ( var_5 = 0; var_5 < var_9.size; var_5++ )
    {
        var_10 = getent( var_9[var_5]._not_team, "targetname" );
        var_10 show();
        var_9[var_5] delete();
    }

    var_11 = getentarray( "escape_container_col", "targetname" );

    for ( var_5 = 0; var_5 < var_11.size; var_5++ )
        var_11[var_5] delete();

    var_12 = [];
    var_12[var_12.size] = spawn( "script_origin", ( 520, 596, -90 ) );
    var_12[var_12.size] = spawn( "script_origin", ( -1376, 596, -90 ) );
    var_12[var_12.size] = spawn( "script_origin", ( -2640, 32, -80 ) );

    for ( var_5 = 0; var_5 < var_12.size; var_5++ )
        var_12[var_5] playloopsound( "emt_alarm_ship_sinking" );

    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    wait 1;
    var_0 = _id_A5A4::_id_3FA9( "cargo_vl_white" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_white_soft" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_white_eql" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_white_eql_flare" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_white_sml" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "cargo_vl_white_sml_a" ) );
    var_1 = _id_A5A4::_id_3FA9( "sinking_stair" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_water_drip_stairs" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_water_nodrip_stairs" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_water_side_stairs" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, _id_A5A4::_id_3FA9( "escape_water_gush_stairs" ) );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_671F );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_748D );
    common_scripts\utility::_id_384A( "escape_hallway_lower_flag" );
    setphysicsgravitydir( ( 0, -0.5, -0.866025 ) );
    var_13 = ( -2804, -32, 96 );
    var_14 = 8;
    _id_A5A4::_id_27EF( 0.25, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.5, ::escape_fx_setup_throw_obj, "com_pipe_coupling_metal", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.75, ::escape_fx_setup_throw_obj, "com_pipe_4_coupling_ceramic", var_13, var_14 );
    _id_A5A4::_id_27EF( 1, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.25, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.5, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.75, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    _id_A5A4::_id_27EF( 2, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    common_scripts\utility::_id_384A( "escape_topofstairs" );
    setphysicsgravitydir( ( 0, -0.5, -0.866025 ) );
    var_13 = ( -2420, 176, 110 );
    var_14 = 8;
    thread escape_fx_setup_throw_obj( "com_fire_extinguisher", var_13, var_14 );
    thread escape_fx_setup_throw_obj( "com_pipe_4_coupling_ceramic", var_13, var_14 );
    thread escape_fx_setup_throw_obj( "me_plastic_crate7", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.25, ::escape_fx_setup_throw_obj, "h1_cs_pan_metalpot", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.25, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.25, ::escape_fx_setup_throw_obj, "me_plastic_crate6", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.4, ::escape_fx_setup_throw_obj, "me_plastic_crate7", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.4, ::escape_fx_setup_throw_obj, "h1_cs_pan_metal_sauce_sm", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.4, ::escape_fx_setup_throw_obj, "me_plastic_crate1", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.5, ::escape_fx_setup_throw_obj, "com_pipe_4_coupling_ceramic", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.75, ::escape_fx_setup_throw_obj, "com_fire_extinguisher", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.75, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    _id_A5A4::_id_27EF( 0.75, ::escape_fx_setup_throw_obj, "me_plastic_crate1", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.25, ::escape_fx_setup_throw_obj, "com_plastic_bucket", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.25, ::escape_fx_setup_throw_obj, "h1_cs_pan_metalpot", var_13, var_14 );
    _id_A5A4::_id_27EF( 1.5, ::escape_fx_setup_throw_obj, "com_plastic_bucket", var_13, var_14 );
    common_scripts\utility::_id_384A( "escape_hallway_upper_flag" );
    var_15 = _id_A5A4::_id_3FA9( "escape_water_gush_stairs" );
    var_15 = common_scripts\utility::_id_0CDD( var_15, _id_A5A4::_id_3FA9( "sinking_stair" ) );
    var_15 = common_scripts\utility::_id_0CDD( var_15, _id_A5A4::_id_3FA9( "escape_water_drip_stairs" ) );
    var_15 = common_scripts\utility::_id_0CDD( var_15, _id_A5A4::_id_3FA9( "escape_water_nodrip_stairs" ) );
    var_15 = common_scripts\utility::_id_0CDD( var_15, _id_A5A4::_id_3FA9( "escape_water_side_stairs" ) );
    var_15 = common_scripts\utility::_id_0CDD( var_15, _id_A5A4::_id_3FA9( "escape_caustics" ) );
    var_16 = _id_A5A4::_id_3FA9( "cgoshp_drips_a" );
    common_scripts\utility::_id_0D13( var_15, common_scripts\utility::_id_671F );
    common_scripts\utility::_id_0D13( var_16, common_scripts\utility::_id_671F );
    _id_A5A4::_id_27EF( 1, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 2, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 1, common_scripts\utility::_id_69C2, "elm_wave_crash_ext", ( -2304, -864, -128 ) );
    _id_A5A4::_id_27EF( 1, common_scripts\_exploder::_id_3528, 126 );
    common_scripts\utility::_id_384A( "escape_aftdeck_flag" );
    _id_A5A4::_id_27EF( 0.1, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 2, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 5, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 7, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 9, _id_A5B3::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    _id_A5A4::_id_27EF( 0.5, common_scripts\utility::_id_69C2, "elm_wave_crash_ext", ( -2304, -864, -128 ) );
    _id_A5A4::_id_27EF( 0.5, common_scripts\_exploder::_id_3528, 126 );
    _id_A5A4::_id_27EF( 1.25, common_scripts\utility::_id_69C2, "elm_wave_crash_ext", ( -2848, -800, -64 ) );
    _id_A5A4::_id_27EF( 1.25, common_scripts\_exploder::_id_3528, 300 );
    _id_A5A4::_id_27EF( 4, common_scripts\utility::_id_69C2, "elm_wave_crash_ext", ( -3808, -368, -64 ) );
    _id_A5A4::_id_27EF( 4, common_scripts\_exploder::_id_3528, 302 );
}

escape_fx_setup_throw_obj( var_0, var_1, var_2, var_3 )
{
    var_4 = ( randomfloatrange( -32, 32 ), randomfloatrange( -32, 32 ), randomfloatrange( -32, 32 ) );
    var_5 = spawn( "script_model", var_1 + var_4 );
    var_5 setmodel( var_0 );
    var_4 = ( randomfloatrange( -10, 10 ), randomfloatrange( -10, 10 ), randomfloatrange( -10, 10 ) );
    var_6 = anglestoright( ( 0, 180, 0 ) );

    if ( !isdefined( var_3 ) )
        var_3 = randomintrange( 500, 1000 );

    var_6 = _id_A5A4::vector_multiply( var_6, var_3 );
    var_5 physicslaunch( var_5.origin + var_4, var_6 );
}

escape_explosion()
{
    var_0 = getent( "escape_sink_start", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_3831( "_sea_bob" );
    common_scripts\utility::_id_383F( "start_sinking_boat" );
    level._sea_org notify( "manual_override" );
    level notify( "sinking the ship" );
    level notify( "cargoship_escape_music" );
    musicstop( 0.1 );
    wait 0.2;
    _id_A5E8::_id_870C( "aud_start_mix_scn_explosion" );
    _id_A5A4::_id_6008( "cargoship_end_music" );
    thread _id_A5A4::_id_3840( "cargoship_end_music", 93 );
    common_scripts\utility::_id_383F( "escape_explosion" );
    thread escape_explosion_drops();
    earthquake( 0.3, 0.5, level.playercardbackground.origin, 256 );
    var_1 = spawn( "script_model", ( 8, -360, -216 ) );
    var_1.angles = ( 0, 45, 0 );
    var_1 setmodel( "tag_origin" );
    thread common_scripts\utility::_id_69C2( "scn_cargo_explosion", ( 8, -360, -216 ) );
    playfxontag( level._effect["sinking_explosion"], var_1, "tag_origin" );
    common_scripts\_exploder::_id_3528( "601" );
    thread maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_explosion" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    wait 0.2;
    level.playercardbackground allowsprint( 0 );
    thread player_speed_set_cargoship( 185, 0.5 );
    thread escape_shellshock();
    wait 0.3;
    var_1.origin = ( 100, -600, -70 );
    var_1.angles = ( 0, -90, 0 );
    common_scripts\_exploder::_id_3528( "400" );
    var_1 _playloopsound( "cgo_water_breach_large_loop" );
    wait 21.5;
    level.playercardbackground thread escape_quake();

    if ( level._id_3BFE < 2 )
        setsaveddvar( "compass", 1 );

    setsaveddvar( "hud_showStance", 1 );
    var_2 = spawn( "script_origin", ( -2808, -199, 0 ) );
    var_2 playloopsound( "cgo_water_stairs_large_loop" );
    _id_A5E8::_id_870C( "aud_start_mix_escape" );
    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    wait 2.0;
    _id_A5A4::_id_8E7E( "601" );
    _id_A5A4::_id_8E7E( "400" );
    var_1 stoploopsound();
    waitframe;
    var_1 delete();
}

escape_heroes_runanim_setup()
{
    level.current_run = [];
    level.current_run["escape_cargohold2"] = [];
    level.current_run["escape_cargohold2b"] = [];
    level.current_run["escape_cargohold1"] = [];
    level.current_run["escape_hallway_lower"] = [];
    level.current_run["escape_hallway_lowerb"] = [];
    level.current_run["escape_hallway_lowerc"] = [];
    level.current_run["escape_hallway_lowerd"] = [];
    level.current_run["escape_hallway_lowere"] = [];
    level.current_run["escape_hallway_upper"] = [];
    level.current_run["escape_hallway_upperb"] = [];
    level.current_run["escape_aftdeck"] = [];
    level.current_run["escape_aftdeckb"] = [];
    level.current_run["escape_cargohold2"]["run"] = "lean_none";
    level.current_run["escape_cargohold2b"]["run"] = "lean_right";
    level.current_run["escape_cargohold1"]["run"] = "lean_right";
    level.current_run["escape_hallway_lower"]["run"] = "lean_back";
    level.current_run["escape_hallway_lowerb"]["run"] = "lean_right";
    level.current_run["escape_hallway_lowerc"]["run"] = "lean_none";
    level.current_run["escape_hallway_lowerd"]["run"] = "lean_left";
    level.current_run["escape_hallway_lowere"]["run"] = "lean_forward";
    level.current_run["escape_hallway_upper"]["run"] = "lean_left";
    level.current_run["escape_hallway_upperb"]["run"] = "lean_back";
    level.current_run["escape_aftdeck"]["run"] = "lean_right";
    level.current_run["escape_aftdeckb"]["run"] = "lean_forward";
    level.current_run["escape_cargohold2"]["sprint"] = "lean_none";
    level.current_run["escape_cargohold2b"]["sprint"] = "lean_right";
    level.current_run["escape_cargohold1"]["sprint"] = "lean_right";
    level.current_run["escape_hallway_lower"]["sprint"] = "lean_back";
    level.current_run["escape_hallway_lowerb"]["sprint"] = "lean_right";
    level.current_run["escape_hallway_lowerc"]["sprint"] = "lean_none";
    level.current_run["escape_hallway_lowerd"]["sprint"] = "lean_left";
    level.current_run["escape_hallway_lowere"]["sprint"] = "lean_forward";
    level.current_run["escape_hallway_upper"]["sprint"] = "lean_left";
    level.current_run["escape_hallway_upperb"]["sprint"] = "lean_back";
    level.current_run["escape_aftdeck"]["sprint"] = "lean_right";
    level.current_run["escape_aftdeckb"]["sprint"] = "lean_forward";
    level.current_run["escape_cargohold2"]["jog"] = "lean_none_jog";
    level.current_run["escape_cargohold2b"]["jog"] = "lean_right_jog";
    level.current_run["escape_cargohold1"]["jog"] = "lean_right_jog";
    level.current_run["escape_hallway_lower"]["jog"] = "lean_back_jog";
    level.current_run["escape_hallway_lowerb"]["jog"] = "lean_right_jog";
    level.current_run["escape_hallway_lowerc"]["jog"] = "lean_none_jog";
    level.current_run["escape_hallway_lowerd"]["jog"] = "lean_left_jog";
    level.current_run["escape_hallway_lowere"]["jog"] = "lean_forward_jog";
    level.current_run["escape_hallway_upper"]["jog"] = "lean_left_jog";
    level.current_run["escape_hallway_upperb"]["jog"] = "lean_back_jog";
    level.current_run["escape_aftdeck"]["jog"] = "lean_right_jog";
    level.current_run["escape_aftdeckb"]["jog"] = "lean_forward_jog";
}

escape_hallways_lower_flood()
{
    thread escape_hallways_lower_flood_vfx( "escape_hallway_lower_flag", ( -2985, -401, 15 ), ( 300, -90, 0 ), "escape_hallway_upper_flag", 0.0, 404 );
    thread escape_hallways_lower_flood_vfx( "escape_hallway_lower_flag", ( -2434, 117, 197 ), ( 300, 90, 0 ), "escape_aftdeck_flag", 2.5, 405 );
    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    common_scripts\utility::_id_3856( "escape_hallway_lower_flood_save", level.escape_timer["escape_hallway_lower_flood_save"] + level.timer_grace_period );

    if ( common_scripts\utility::_id_382E( "escape_hallway_lower_flood_save" ) )
        common_scripts\utility::_id_3856( "escape_hallway_lower_flood", 3 );

    if ( common_scripts\utility::_id_382E( "escape_hallway_lower_flood" ) )
        wait 0.5;

    wait 1;

    if ( !common_scripts\utility::_id_382E( "escape_hallway_lower_flood" ) )
        thread escape_mission_failed();

    common_scripts\utility::_id_384A( "escape_hallway_upper_flag" );
    wait 1;
}

escape_hallways_lower_flood_vfx( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    common_scripts\utility::_id_384A( var_0 );
    wait(var_4);
    var_6 = spawn( "script_model", var_1 );
    var_6.angles = var_2;
    var_6 setmodel( "tag_origin" );
    var_6 hide();
    var_6 playsound( "h1_cgo_escape_water_breach_explosion" );
    common_scripts\_exploder::_id_3528( var_5 );
    var_6 _playloopsound( "cgo_water_breach_large_loop" );
    common_scripts\utility::_id_384A( var_3 );
    _id_A5A4::_id_8E7E( var_5 );
    var_6 stoploopsound();
    waitframe;
    var_6 delete();
}

_playloopsound( var_0 )
{
    thread _playloopsound_proc( var_0 );
}

_playloopsound_proc( var_0 )
{
    wait 0.5;

    if ( !isdefined( self ) )
        return;

    var_1 = spawn( "script_origin", self.origin );
    var_1 playloopsound( var_0 );
    self waittill( "death" );
    var_1 stoploopsound();
    waitframe;
    var_1 delete();
}

escape_invisible_timer()
{
    level.timer_grace_period = undefined;

    switch ( level._id_3BFE )
    {
        case 0:
            level.timer_grace_period = 6;
            break;
        case 1:
            level.timer_grace_period = 2.5;
            break;
        case 2:
            level.timer_grace_period = 1.25;
            break;
        case 3:
            level.timer_grace_period = 0.5;
            break;
    }

    thread escape_handle_wrongway();
    level.escape_timer = [];
    level.escape_timer["escape_cargohold1_enter"] = 20;
    level.escape_timer["escape_catwalk_madeit"] = 12;
    level.escape_timer["escape_hallway_lower_flood_save"] = 15;
    level.escape_timer["escape_aftdeck_flag"] = 10;
    level.escape_timer["end_no_jump"] = 12.5;

    if ( getdvar( "no_escape" ) == "1" )
    {
        level.escape_timer = [];
        level.escape_timer["escape_cargohold1_enter"] = 9999;
        level.escape_timer["escape_catwalk_madeit"] = 9999;
        level.escape_timer["escape_hallway_lower_flood_save"] = 9999;
        level.escape_timer["escape_aftdeck_flag"] = 9999;
        level.escape_timer["end_no_jump"] = 9999;
    }

    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    escape_timer_section( "escape_cargohold1_enter" );
    thread _id_A5A4::_id_3840( "escape_death_cargohold1", level.escape_timer["escape_catwalk_madeit"] - 2.5 + level.timer_grace_period );
    escape_timer_section( "escape_catwalk_madeit" );
    escape_timer_section( "escape_hallway_lower_flood_save" );
    escape_timer_section( "escape_aftdeck_flag" );
    escape_timer_section( "end_no_jump" );
}

escape_timer_section( var_0 )
{
    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    level endon( var_0 );
    level endon( "mission_failed" );
    wait(level.escape_timer[var_0] + level.timer_grace_period);

    if ( !common_scripts\utility::_id_382E( var_0 ) )
        thread escape_mission_failed();
}

escape_autosaves()
{
    level endon( "mission_failed" );
    var_0 = undefined;
    var_1 = getentarray( "escape_flags", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_79D3 ) )
            continue;

        if ( var_1[var_2]._id_79D3 == "escape_seaknight_flag" )
        {
            var_0 = var_1[var_2];
            break;
        }
    }

    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    wait 0.5;
    _id_A5A4::_id_27EF( 0.5, _id_A5A4::_id_114E );
    var_0 common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_384A( "escape_catwalk_madeit" );
    wait 0.5;
    _id_A5A4::_id_114E();
    common_scripts\utility::_id_384A( "escape_hallway_lower_flood_save" );
    wait 0.1;
    _id_A5A4::_id_114E();
    common_scripts\utility::_id_384A( "escape_aftdeck_flag" );
    _id_A5A4::_id_114E();
    var_0 common_scripts\utility::_id_97CE();
    common_scripts\utility::_id_384A( "player_rescued" );
    _id_A5A4::_id_114E();
}

escape_mission_failed()
{
    if ( common_scripts\utility::_id_382E( "end_start_player_anim" ) )
        return;

    level notify( "mission_failed" );
    setdvar( "ui_deadquote", level.missionfailedquote["escape"] );
    _id_A5A4::_id_5CDF();
}

end_handle_player_fall()
{
    common_scripts\utility::_id_384A( "escape_aftdeck_flag" );
    var_0 = getent( "end_player_clip", "targetname" );
    var_0 delete();
    level endon( "end_start_player_anim" );
    var_1 = getent( "end_player_fall", "targetname" );
    var_1 waittill( "trigger" );

    if ( getdvar( "cargoship_jump" ) == "" )
        setdvar( "cargoship_jump", "1" );

    switch ( int( getdvar( "cargoship_jump" ) ) )
    {
        case 1:
            level.missionfailedquote["escape"] = level.missionfailedquote["jump1"];
            setdvar( "cargoship_jump", "2" );
            break;
        default:
            level.missionfailedquote["escape"] = level.missionfailedquote["jump"];
            break;
    }

    escape_mission_failed();
}

escape_handle_wrongway()
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    common_scripts\utility::_id_384A( "escape_explosion" );
    common_scripts\utility::_id_0D13( getentarray( "end_wrongway_kill", "targetname" ), ::escape_handle_wrongway_kill );
    var_0 = getent( "end_wrongway", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level.missionfailedquote["escape"] = level.missionfailedquote["wrongway"];

        while ( level.playercardbackground istouching( var_0 ) )
            wait 0.1;

        level.missionfailedquote["escape"] = level.missionfailedquote["slow"];
    }
}

escape_handle_wrongway_kill()
{
    self waittill( "trigger" );
    level.missionfailedquote["escape"] = level.missionfailedquote["wrongway"];
    escape_mission_failed();
}

water_stuff_for_art1( var_0 )
{
    var_1 = "cargoship_water_hole";
    var_2 = "cargoship_water";
    var_3 = 0;
    var_4 = ( 0, 0, 1000 );

    if ( isdefined( var_0 ) )
    {
        var_1 = "cargoship_water_black_static";
        var_2 = "cargoship_water_static";
        var_3 = 1;
    }

    var_5 = getent( "sea_black", "targetname" );
    var_6 = var_5 getorigin();
    var_5 delete();
    var_5 = spawn( "script_model", var_6 );
    var_5 setmodel( var_1 );
    var_5 _meth_8477( var_4 );
    var_5.teambalanced = "sea_black";

    if ( var_3 )
        level.sea_black = var_5;

    var_5 = getent( "sea_foam", "targetname" );
    var_5 delete();
    var_5 = spawn( "script_model", var_6 );
    var_5 setmodel( var_2 );
    var_5 _meth_8477( var_4 );
    var_5.teambalanced = "sea_foam";

    if ( var_3 )
        level.sea_foam = var_5;

    if ( var_3 )
    {
        level.sea_black hide();
        level.sea_black.angles = level._sea_link.angles;
        level.sea_black linkto( level._sea_link );
        level.sea_foam hide();
        level.sea_foam.angles = level._sea_link.angles;
        level.sea_foam linkto( level._sea_link );
    }
}

water_stuff_for_art2( var_0 )
{
    wait(var_0);
    level.sea_foam thread maps\_sea::sea_animate();
    level.sea_black thread maps\_sea::sea_animate();
}

_id_1C16( var_0, var_1, var_2 )
{
    level notify( "new_introscreen_element" );

    if ( !isdefined( level._id_4F4E ) )
        level._id_4F4E = 0;
    else
        level._id_4F4E++;

    var_3 = _id_A54B::_cornerlinethread_height();
    var_4 = newhudelem();
    var_4.xpmaxmultipliertimeplayed = 0;
    var_4._id_0538 = 0;
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.hostquits = "center";
    var_4.visionsetnight = "middle";
    var_4.space = 1;
    var_4.foreground = 1;
    var_4 settext( var_0 );
    var_4.alpha = 0;
    var_4 fadeovertime( 0.2 );
    var_4.alpha = 1;
    var_4.hindlegstraceoffset = 1;
    var_4.fontscale = 1.6;
    var_4.color = ( 0.8, 1, 0.8 );
    var_4.font = "objective";
    var_4.glowcolor = ( 0.26, 0.65, 0.32 );
    var_4.glowalpha = 0.2;
    var_5 = int( var_1 * var_2 * 1000 + 3000 );
    var_4 setpulsefx( 30, var_5, 700 );
    thread _id_A54B::_id_4AE2( var_4 );
}

cargoship_hack_animreach_grigsby( var_0, var_1, var_2, var_3, var_4 )
{
    _id_A510::_id_0BF7( var_0, var_1, var_2, var_3 );
    common_scripts\utility::_id_383F( var_4 );
}

cargoship_waitscriptend( var_0, var_1 )
{
    self endon( var_1 );

    while ( self.script_context == var_0 )
        waittillframeend;

    self notify( var_1 );
}

cargoship_waitanimend( var_0, var_1 )
{
    self endon( var_1 );
    animscripts\shared::_id_2D06( var_0 );
    self notify( var_1 );
}

cargoship_hack_animreach_price( var_0, var_1, var_2, var_3, var_4 )
{
    var_0.secondaryattachment1 = self;
    _id_A510::_id_0BF5( var_0, var_1 );
    var_0.secondaryattachment1 = undefined;

    if ( var_0.script_context == "cover_arrival" )
    {
        var_5 = "cover_arrival_ended";
        var_0 thread cargoship_waitscriptend( "cover_arrival", var_5 );
        var_0 thread cargoship_waitanimend( "coverArrival", var_5 );
        var_0 waittill( var_5 );
    }

    _id_A510::_id_0BF7( var_0, var_1, var_2, var_3 );
    common_scripts\utility::_id_383F( var_4 );
}

cargoship_breach2_setup( var_0, var_1, var_2, var_3, var_4 )
{
    _id_A510::_id_0BD0( var_0, var_1 );
    _id_A510::_id_0BC9( var_0, var_1 );
    thread _id_A510::_id_0BCE( var_0, var_2, undefined, var_3 );
    common_scripts\utility::_id_383F( var_4 );
}

carogship_shotgunpulla( var_0 )
{
    var_1 = "none";
    var_0 animscripts\shared::_id_6869( var_0.weapon_switch_invalid, var_1 );
    var_0 playsound( "scn_cargo_hallway_breaching_gaz_foley" );
}

carogship_shotgunpullb( var_0 )
{
    var_0._id_560F = var_0.weapon_switch_invalid;
    var_0 animscripts\shared::_id_6869( var_0.secondaryweapon, "right" );
    var_0._id_18B0 = weaponclipsize( var_0.weapon_switch_invalid );
}

player_noprone()
{
    for (;;)
    {
        self waittill( "trigger" );
        level.playercardbackground allowprone( 0 );

        while ( level.playercardbackground istouching( self ) )
            wait 0.2;

        level.playercardbackground allowprone( 1 );
    }
}

nadehint()
{
    level.playercardbackground endon( "kill_nade_hint" );
    level.playercardbackground endon( "death" );
    notifyoncommand( "kill_nade_hint", "+frag" );
    common_scripts\utility::_id_384A( "nade_hint" );
    thread keyhint( "frag", 8 );
}

crouchhint()
{
    level.playercardbackground endon( "kill_crouch_hint" );
    level.playercardbackground endon( "death" );
    notifyoncommand( "kill_crouch_hint", "+stance" );
    notifyoncommand( "kill_crouch_hint", "gocrouch" );
    notifyoncommand( "kill_crouch_hint", "togglecrouch" );

    if ( !level.console )
    {
        notifyoncommand( "kill_crouch_hint", "+togglecrouch" );
        notifyoncommand( "kill_crouch_hint", "+movedown" );
    }

    common_scripts\utility::_id_384A( "crouch_hint" );
    thread keyhint( "crouch", 8 );
}

standhint()
{
    level.playercardbackground endon( "kill_stand_hint" );
    level.playercardbackground endon( "death" );
    common_scripts\utility::_id_384A( "crouch_hint" );
    _id_A5A4::_id_27EF( 2, ::standhint_kill );
    common_scripts\utility::_id_384A( "stand_hint" );

    while ( level.playercardbackground getstance() == "stand" )
        return;

    thread keyhint( "stand", 8 );
}

standhint_kill()
{
    level endon( "stand_hint" );

    while ( level.playercardbackground getstance() != "crouch" )
        wait 0.05;

    while ( level.playercardbackground getstance() != "stand" )
        wait 0.05;

    level.playercardbackground notify( "kill_stand_hint" );
}

hint_setup()
{
    if ( _id_A5A4::_id_0CC3() )
        return;

    _id_A5A4::_id_7DF3();
    level.actionbinds = [];
    registeractionbinding( "frag", "+frag", &"CARGOSHIP_HINT_FRAG" );
    registeractionbinding( "crouch", "+stance", &"CARGOSHIP_HINT_CROUCH_STANCE" );

    if ( !level.console )
    {
        registeractionbinding( "crouch", "+togglecrouch", &"PLATFORM_HINT_CROUCH_TOGGLE_COVER_PC" );
        registeractionbinding( "crouch", "+movedown", &"PLATFORM_HINT_HOLD_CROUCH_COVER" );
    }

    registeractionbinding( "crouch", "gocrouch", &"CARGOSHIP_HINT_CROUCH" );
    registeractionbinding( "crouch", "togglecrouch", &"CARGOSHIP_HINT_CROUCH_TOGGLE" );
    registeractionbinding( "stand", "+gostand", &"CARGOSHIP_HINT_STAND" );
    registeractionbinding( "stand", "+stance", &"CARGOSHIP_HINT_STAND_STANCE" );
    initkeys();
    updatekeysforbindings();
    thread nadehint();
    thread crouchhint();
    thread standhint();
}

keyhint( var_0, var_1 )
{
    if ( getdvar( "chaplincheat" ) == "1" )
        return;

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    _id_1EBE();
    level endon( "clearing_hints" );
    var_2 = getactionbind( var_0 );
    _id_A5A4::_id_48B0( var_2._id_48B0 );
    var_3 = "did_action_" + var_0;

    for ( var_4 = 0; var_4 < level.actionbinds[var_0].size; var_4++ )
    {
        var_2 = level.actionbinds[var_0][var_4];
        notifyoncommand( var_3, var_2.binding );
    }

    if ( isdefined( var_1 ) )
        level.playercardbackground thread notifyontimeout( var_3, var_1 );

    level.playercardbackground waittill( var_3 );
    _id_A5A4::_id_48CB( 0.5 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );
    level notify( "clearing_hints" );
}

getactionbind( var_0 )
{
    for ( var_1 = 0; var_1 < level.actionbinds[var_0].size; var_1++ )
    {
        var_2 = level.actionbinds[var_0][var_1];
        var_3 = getkeybinding( var_2.binding );

        if ( !var_3["count"] )
            continue;

        return level.actionbinds[var_0][var_1];
    }

    return level.actionbinds[var_0][0];
}

notifyontimeout( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    self notify( var_0 );
}

registeractionbinding( var_0, var_1, var_2 )
{
    if ( !isdefined( level.actionbinds[var_0] ) )
        level.actionbinds[var_0] = [];

    var_3 = spawnstruct();
    var_3.binding = var_1;
    var_3._id_48B0 = var_2;
    var_3.keytext = undefined;
    var_3.hinttext = undefined;
    precachestring( var_2 );
    level.actionbinds[var_0][level.actionbinds[var_0].size] = var_3;
}

initkeys()
{
    level.kbkeys = "1234567890-=qwertyuiop[]asdfghjkl;'zxcvbnm,./";
    level.specialkeys = [];
    level.specialkeys[level.specialkeys.size] = "TAB";
    level.specialkeys[level.specialkeys.size] = "ENTER";
    level.specialkeys[level.specialkeys.size] = "ESCAPE";
    level.specialkeys[level.specialkeys.size] = "SPACE";
    level.specialkeys[level.specialkeys.size] = "BACKSPACE";
    level.specialkeys[level.specialkeys.size] = "UPARROW";
    level.specialkeys[level.specialkeys.size] = "DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "ALT";
    level.specialkeys[level.specialkeys.size] = "CTRL";
    level.specialkeys[level.specialkeys.size] = "SHIFT";
    level.specialkeys[level.specialkeys.size] = "CAPSLOCK";
    level.specialkeys[level.specialkeys.size] = "F1";
    level.specialkeys[level.specialkeys.size] = "F2";
    level.specialkeys[level.specialkeys.size] = "F3";
    level.specialkeys[level.specialkeys.size] = "F4";
    level.specialkeys[level.specialkeys.size] = "F5";
    level.specialkeys[level.specialkeys.size] = "F6";
    level.specialkeys[level.specialkeys.size] = "F7";
    level.specialkeys[level.specialkeys.size] = "F8";
    level.specialkeys[level.specialkeys.size] = "F9";
    level.specialkeys[level.specialkeys.size] = "F10";
    level.specialkeys[level.specialkeys.size] = "F11";
    level.specialkeys[level.specialkeys.size] = "F12";
    level.specialkeys[level.specialkeys.size] = "INS";
    level.specialkeys[level.specialkeys.size] = "DEL";
    level.specialkeys[level.specialkeys.size] = "PGDN";
    level.specialkeys[level.specialkeys.size] = "PGUP";
    level.specialkeys[level.specialkeys.size] = "HOME";
    level.specialkeys[level.specialkeys.size] = "END";
    level.specialkeys[level.specialkeys.size] = "MOUSE1";
    level.specialkeys[level.specialkeys.size] = "MOUSE2";
    level.specialkeys[level.specialkeys.size] = "MOUSE3";
    level.specialkeys[level.specialkeys.size] = "MOUSE4";
    level.specialkeys[level.specialkeys.size] = "MOUSE5";
    level.specialkeys[level.specialkeys.size] = "MWHEELUP";
    level.specialkeys[level.specialkeys.size] = "MWHEELDOWN";
    level.specialkeys[level.specialkeys.size] = "AUX1";
    level.specialkeys[level.specialkeys.size] = "AUX2";
    level.specialkeys[level.specialkeys.size] = "AUX3";
    level.specialkeys[level.specialkeys.size] = "AUX4";
    level.specialkeys[level.specialkeys.size] = "AUX5";
    level.specialkeys[level.specialkeys.size] = "AUX6";
    level.specialkeys[level.specialkeys.size] = "AUX7";
    level.specialkeys[level.specialkeys.size] = "AUX8";
    level.specialkeys[level.specialkeys.size] = "AUX9";
    level.specialkeys[level.specialkeys.size] = "AUX10";
    level.specialkeys[level.specialkeys.size] = "AUX11";
    level.specialkeys[level.specialkeys.size] = "AUX12";
    level.specialkeys[level.specialkeys.size] = "AUX13";
    level.specialkeys[level.specialkeys.size] = "AUX14";
    level.specialkeys[level.specialkeys.size] = "AUX15";
    level.specialkeys[level.specialkeys.size] = "AUX16";
    level.specialkeys[level.specialkeys.size] = "KP_HOME";
    level.specialkeys[level.specialkeys.size] = "KP_UPARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGUP";
    level.specialkeys[level.specialkeys.size] = "KP_LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_5";
    level.specialkeys[level.specialkeys.size] = "KP_RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_END";
    level.specialkeys[level.specialkeys.size] = "KP_DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGDN";
    level.specialkeys[level.specialkeys.size] = "KP_ENTER";
    level.specialkeys[level.specialkeys.size] = "KP_INS";
    level.specialkeys[level.specialkeys.size] = "KP_DEL";
    level.specialkeys[level.specialkeys.size] = "KP_SLASH";
    level.specialkeys[level.specialkeys.size] = "KP_MINUS";
    level.specialkeys[level.specialkeys.size] = "KP_PLUS";
    level.specialkeys[level.specialkeys.size] = "KP_NUMLOCK";
    level.specialkeys[level.specialkeys.size] = "KP_STAR";
    level.specialkeys[level.specialkeys.size] = "KP_EQUALS";
    level.specialkeys[level.specialkeys.size] = "PAUSE";
    level.specialkeys[level.specialkeys.size] = "SEMICOLON";
    level.specialkeys[level.specialkeys.size] = "COMMAND";
    level.specialkeys[level.specialkeys.size] = "181";
    level.specialkeys[level.specialkeys.size] = "191";
    level.specialkeys[level.specialkeys.size] = "223";
    level.specialkeys[level.specialkeys.size] = "224";
    level.specialkeys[level.specialkeys.size] = "225";
    level.specialkeys[level.specialkeys.size] = "228";
    level.specialkeys[level.specialkeys.size] = "229";
    level.specialkeys[level.specialkeys.size] = "230";
    level.specialkeys[level.specialkeys.size] = "231";
    level.specialkeys[level.specialkeys.size] = "232";
    level.specialkeys[level.specialkeys.size] = "233";
    level.specialkeys[level.specialkeys.size] = "236";
    level.specialkeys[level.specialkeys.size] = "241";
    level.specialkeys[level.specialkeys.size] = "242";
    level.specialkeys[level.specialkeys.size] = "243";
    level.specialkeys[level.specialkeys.size] = "246";
    level.specialkeys[level.specialkeys.size] = "248";
    level.specialkeys[level.specialkeys.size] = "249";
    level.specialkeys[level.specialkeys.size] = "250";
    level.specialkeys[level.specialkeys.size] = "252";
}

updatekeysforbindings()
{
    if ( level.console )
    {
        setkeyforbinding( getcommandfromkey( "BUTTON_START" ), "BUTTON_START" );
        setkeyforbinding( getcommandfromkey( "BUTTON_A" ), "BUTTON_A" );
        setkeyforbinding( getcommandfromkey( "BUTTON_B" ), "BUTTON_B" );
        setkeyforbinding( getcommandfromkey( "BUTTON_X" ), "BUTTON_X" );
        setkeyforbinding( getcommandfromkey( "BUTTON_Y" ), "BUTTON_Y" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LSTICK" ), "BUTTON_LSTICK" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RSTICK" ), "BUTTON_RSTICK" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LSHLDR" ), "BUTTON_LSHLDR" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RSHLDR" ), "BUTTON_RSHLDR" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LTRIG" ), "BUTTON_LTRIG" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RTRIG" ), "BUTTON_RTRIG" );
    }
    else
    {
        for ( var_0 = 0; var_0 < level.kbkeys.size; var_0++ )
            setkeyforbinding( getcommandfromkey( level.kbkeys[var_0] ), level.kbkeys[var_0] );

        for ( var_0 = 0; var_0 < level.specialkeys.size; var_0++ )
            setkeyforbinding( getcommandfromkey( level.specialkeys[var_0] ), level.specialkeys[var_0] );
    }
}

setkeyforbinding( var_0, var_1 )
{
    if ( var_0 == "" )
        return;

    var_2 = getarraykeys( level.actionbinds );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = level.actionbinds[var_2[var_3]];

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( var_4[var_5].binding != var_0 )
                continue;

            var_4[var_5].key = var_1;
        }
    }
}

orient_cameraviewangles_helicopterstart()
{
    level.playercardbackground lerpviewangleclamp( 0, 0, 0, -9, 9, -5, 5 );
    wait 0.05;
    level.playercardbackground lerpviewangleclamp( 0, 0, 0, 65, 74, 30, 35 );
}

deck_light_shadow_hack()
{
    var_0 = getent( "deck_light_hack", "script_noteworthy" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "deck_light_shadow" );
        var_0 _meth_8494( "force_fully_on" );
        common_scripts\utility::_id_3857( "deck_light_shadow" );
        var_0 _meth_8494( "normal" );
    }
}