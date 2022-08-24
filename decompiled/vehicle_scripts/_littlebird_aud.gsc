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

_id_45B5()
{
    self endon( "death" );
    soundscripts\_snd::_id_870C( "rec_littlebird_formation_spawn", self );

    if ( issubstr( self.classname, "sentinel" ) || issubstr( self.classname, "armed" ) || issubstr( self.classname, "atlas_bench" ) )
    {
        var_0 = 0.25;

        if ( level.currentgen )
            var_0 = 1.0;

        var_1 = 0;
        var_2 = 0;
        var_3 = spawnstruct();
        var_3._id_6F21 = "littlebird_sentinel";
        var_3._id_35F0 = 3;
        var_3._id_35F5 = 3;
        soundscripts\_snd::_id_870C( "snd_register_vehicle", "littlebird_sentinel", ::_id_57B5 );

        for (;;)
        {
            var_4 = distance( self.origin, level.player.origin );

            if ( !var_1 && var_4 < 5400 )
            {
                soundscripts\_snd::_id_870C( "snd_start_vehicle", var_3 );
                var_1 = 1;
            }
            else if ( var_1 && var_4 > 5400 )
            {
                soundscripts\_snd::_id_870C( "snd_stop_vehicle" );
                var_1 = 0;
            }

            wait(var_0);
        }
    }
}

_id_57B5()
{
    var_0 = undefined;
    var_1 = 1;
    var_2 = 1;
    soundscripts\_audio_vehicle_manager::_id_118C( "littlebird_sentinel" );
    soundscripts\_audio_vehicle_manager::_id_1187( var_0, var_1, var_2 );
    soundscripts\_audio_vehicle_manager::_id_1188( "lbs_near" );
    soundscripts\_audio_vehicle_manager::_id_118B( "DISTANCE" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "lbs_near_dist2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "pitch" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "lbs_near_pch2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "DOPPLER" );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "lbs_dplr2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_1198();
    soundscripts\_audio_vehicle_manager::_id_1188( "lbs_far" );
    soundscripts\_audio_vehicle_manager::_id_118B( "DISTANCE" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "lbs_far_dist2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "pitch" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "lbs_far_pch2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "DOPPLER" );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "lbs_dplr2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_1198();
    soundscripts\_audio_vehicle_manager::_id_1188( "lbs_pitch" );
    soundscripts\_audio_vehicle_manager::_id_118B( "pitch" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "lbs_pitch_pch2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "DOPPLER" );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "lbs_dplr2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_1198();
    soundscripts\_audio_vehicle_manager::_id_1197();
    soundscripts\_audio_vehicle_manager::_id_1189();
    soundscripts\_audio_vehicle_manager::_id_1199();
    soundscripts\_audio_vehicle_manager::_id_1185();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_hover", ::_id_563B, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_flying", ::_id_5639, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_distant", ::_id_5637, [ "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_flyby", ::_id_5638, [ "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_deathspin", ::_id_5635 );
    soundscripts\_audio_vehicle_manager::_id_1180( "NONE" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_destruct", ::_id_5636 );
    soundscripts\_audio_vehicle_manager::_id_1180( "NONE" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_off", ::_id_563C );
    soundscripts\_audio_vehicle_manager::_id_1180( "NONE" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1195();
    soundscripts\_audio_vehicle_manager::_id_118D( 0.25, 50 );
    soundscripts\_audio_vehicle_manager::_id_118F( "main_oneshots", "state_hover", "to_state_hover", 50, 1.0 );
    soundscripts\_audio_vehicle_manager::_id_118E( "state_off" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flying", "to_state_flying" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_deathspin", "to_state_deathspin" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_destruct", "to_state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_flying" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_deathspin", "to_state_deathspin" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_destruct", "to_state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_distant" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flying", "to_state_flying" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_deathspin", "to_state_deathspin" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_destruct", "to_state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_flyby", 3.0 );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flying", "to_state_flying" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_deathspin", "to_state_deathspin" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_destruct", "to_state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_deathspin" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_destruct", "to_state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_destruct" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_off", "to_state_off" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_119F();
    soundscripts\_audio_vehicle_manager::_id_119D();
    var_3 = 0;
    var_4 = 10;
    var_5 = 30;
    var_6 = var_5 - var_3;
    var_7 = soundscripts\_audio_vehicle_manager::_id_A3B3( 0 );
    var_8 = soundscripts\_audio_vehicle_manager::_id_A3B3( 99.0 );
    var_9 = var_8 - var_7;
    var_10 = 0.0;
    var_11 = 1.0;
    var_12 = var_11 - var_10;
    var_13 = soundscripts\_audio_vehicle_manager::_id_A3B3( 10 );
    var_14 = soundscripts\_audio_vehicle_manager::_id_A3B3( 30 );
    var_15 = soundscripts\_audio_vehicle_manager::_id_A3B3( 1000000 );
    var_16 = var_15 - var_13;
    var_17 = 0.0;
    var_18 = 1.0;
    var_19 = var_18 - var_17;
    var_20 = -25;
    var_21 = 0;
    var_22 = 25;
    var_23 = soundscripts\_audio_vehicle_manager::_id_A3B3( 0 );
    var_24 = soundscripts\_audio_vehicle_manager::_id_A3B3( 75.0 );
    var_25 = var_24 - var_23;
    var_26 = 0.0;
    var_27 = 1.0;
    var_28 = var_27 - var_26;
    var_29 = 0.6;
    var_30 = 1.0;
    var_31 = 1.6;
    var_32 = soundscripts\_audio_vehicle_manager::_id_A3B3( 0 );
    var_33 = soundscripts\_audio_vehicle_manager::_id_A3B3( 150.0 );
    var_34 = var_24 - var_23;
    var_35 = 0.0;
    var_36 = 0.4;
    var_37 = var_27 - var_26;
    var_38 = 0.0;
    var_39 = 0.5;
    var_40 = var_27 - var_26;
    var_41 = var_23;
    var_42 = var_24;
    var_43 = 0.0;
    var_44 = 1.0;
    var_45 = var_44 - var_43;
    var_46 = 1.0;
    var_47 = 2.0;
    var_48 = var_47 - var_46;
    var_49 = 30;
    var_50 = 0.0;
    var_51 = 1.0;
    var_52 = 0.5;
    var_53 = 1.5;
    var_54 = 100;
    var_55 = 200;
    var_56 = 500;
    var_57 = 6.0;
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_near_dist2vol", [ [ var_7, 1 ], [ var_8, 0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_far_dist2vol", [ [ var_13, 0 ], [ var_14, 1 ], [ var_15, 1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_near_pch2vol", [ [ var_20, 0.2 ], [ var_21, 1.0 ], [ var_22, 0.2 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_far_pch2vol", [ [ var_20, 0.2 ], [ var_21, 1.0 ], [ var_22, 0.2 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_pitch_pch2vol", [ [ var_20, 1 ], [ var_21, 0 ], [ var_22, 1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_live_dist2vol", [ [ var_23, 1 ], [ var_24, 0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_dist_far_dist2vol", [ [ var_32, 0.0 ], [ var_33 * 0.333, 0.333 ], [ var_33, 0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_live1_accel2pch", [ [ var_38, 0.9 ], [ var_39, 1.1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_live1_accel2vol", [ [ var_38, 0 ], [ var_39, 1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_live1_dst2vol", [ [ var_41, var_44 ], [ var_42, var_43 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_flyby_vel2vol", [ [ var_3, var_50 ], [ var_6 * 0.25, var_51 * 0.5 ], [ var_5, var_51 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_flyby_vel2pch", [ [ var_3, var_52 ], [ var_5, var_53 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_dplr2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_dplr2vol", [ [ var_29, var_27 ], [ var_30, var_26 ], [ var_31, var_27 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "lbs_flyby_duck_envelope", [ [ 0.0, 1.0 ], [ 0.4, 0.7 ], [ 0.6, 0.5 ], [ 0.8, 0.7 ], [ 1.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_119C();
}

_id_563C()
{
    return 0;
}

_id_563B( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["speed"];
    var_4 = var_0["distance2d"];
    var_5 = soundscripts\_audio_vehicle_manager::_id_9A2A( var_4 );

    if ( var_3 <= 5.1 && var_5 < 100.0 )
        var_2 = 1;

    return var_2;
}

_id_5639( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["speed"];
    var_4 = var_0["distance2d"];
    var_5 = soundscripts\_audio_vehicle_manager::_id_9A2A( var_4 );

    if ( var_3 > 5.1 && var_5 < 100.0 )
        var_2 = 1;

    return var_2;
}

_id_5637( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_9A2A( var_3 );

    if ( var_4 >= 100.0 )
        var_2 = 1;

    return var_2;
}

_id_5638( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_9A2A( var_3 );

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F4B = var_4;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_5 = var_4 - var_1._id_391D._id_6F4B;

        if ( var_5 < 0 && var_4 < 6.0 )
            var_2 = 1;

        var_1._id_391D._id_6F4B = var_4;
        var_1._id_391D._id_6F3C = var_5;
    }

    return var_2;
}

_id_563A( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = var_0["relative_speed"];
    var_5 = soundscripts\_audio_vehicle_manager::_id_9A2A( var_3 );

    if ( var_5 < 30 )
        var_2 = 1;

    return var_2;
}

_id_5635( var_0, var_1 )
{
    return 0;
}

_id_5636( var_0, var_1 )
{
    return 0;
}
