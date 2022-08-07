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

snd_init_blackhawk()
{
    soundscripts\_snd::_id_870C( "snd_register_vehicle", "blackhawk", ::snd_blackhawk_constructor );
}

snd_start_blackhawk()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        snd_stop_blackhawk( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "blackhawk";
    soundscripts\_snd::_id_870C( "snd_start_vehicle", var_0 );
}

snd_stop_blackhawk( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        soundscripts\_snd::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

snd_blackhawk_constructor()
{
    soundscripts\_audio_vehicle_manager::_id_118C( "blackhawk" );
    soundscripts\_audio_vehicle_manager::_id_1187();
    soundscripts\_audio_vehicle_manager::_id_1188( "h1r_blackhawk_engine_far_lp" );
    soundscripts\_audio_vehicle_manager::_id_118B( "speed" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "blackhawk_engine_far_vel2vol" );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "blackhawk_engine_far_vel2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "doppler", 0.65, 0.3 );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "blackhawk_doppler2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_1198();
    soundscripts\_audio_vehicle_manager::_id_1188( "h1r_blackhawk_engine_close_lp" );
    soundscripts\_audio_vehicle_manager::_id_118B( "speed" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "blackhawk_engine_close_vel2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_118B( "doppler", 0.65, 0.3 );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "blackhawk_doppler2pch" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_1198();
    soundscripts\_audio_vehicle_manager::_id_1197();
    soundscripts\_audio_vehicle_manager::_id_1189( 0.5 );
    soundscripts\_audio_vehicle_manager::_id_118A( "h1r_blackhawk_start_rev", "blackhawk_start_rev_duck" );
    soundscripts\_audio_vehicle_manager::_id_118B( "speed" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "blackhawk_start_rev_vel2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_119A();
    soundscripts\_audio_vehicle_manager::_id_118A( "h1r_blackhawk_pass_by", "blackhawk_pass_by_duck_envelope" );
    soundscripts\_audio_vehicle_manager::_id_118B( "speed" );
    soundscripts\_audio_vehicle_manager::_id_1183( "pitch", "blackhawk_pass_by_vel2pch" );
    soundscripts\_audio_vehicle_manager::_id_1183( "volume", "blackhawk_pass_by_vel2vol" );
    soundscripts\_audio_vehicle_manager::_id_119B();
    soundscripts\_audio_vehicle_manager::_id_119A();
    soundscripts\_audio_vehicle_manager::_id_1199();
    soundscripts\_audio_vehicle_manager::_id_1185();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_hover", ::blackhawk_condition_callback_to_hover, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_fly", ::blackhawk_condition_callback_to_fly, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_fly_from_hover", ::blackhawk_condition_callback_to_fly, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1182( "h1r_blackhawk_start_rev" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_distant", ::blackhawk_condition_callback_to_distant, [ "distance2d" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "h1r_blackhawk_engine_far_lp" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1186( "to_state_flyby", ::blackhawk_condition_callback_to_flyby, [ "speed", "distance2d", "doppler" ] );
    soundscripts\_audio_vehicle_manager::_id_1180( "ALL" );
    soundscripts\_audio_vehicle_manager::_id_1182( "h1r_blackhawk_pass_by" );
    soundscripts\_audio_vehicle_manager::_id_1196();
    soundscripts\_audio_vehicle_manager::_id_1195();
    soundscripts\_audio_vehicle_manager::_id_118D( 0.25, 0.5 );
    soundscripts\_audio_vehicle_manager::_id_118F( "engine_oneshots", "state_fly", "to_state_fly", 50, 1.0 );
    soundscripts\_audio_vehicle_manager::_id_118E( "state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_fly", "to_state_fly_from_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_distant" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_fly", "to_state_fly" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_fly" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_118E( "state_flyby", 7.0 );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_fly", "to_state_fly" );
    soundscripts\_audio_vehicle_manager::_id_1184( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::_id_119E();
    soundscripts\_audio_vehicle_manager::_id_119F();
    soundscripts\_audio_vehicle_manager::_id_119D();
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_engine_far_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_engine_close_vel2vol", [ [ 0, 1.0 ], [ 20, 1.0 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_engine_far_vel2pch", [ [ 0, 0.9 ], [ 10, 1.0 ], [ 20, 1.1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_start_rev_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_start_rev_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_pass_by_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_pass_by_vel2vol", [ [ 0.0, 0.0 ], [ 9.06, 0.0 ], [ 15.1, 0.7 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_pass_by_vel2pch", [ [ 0.0, 0.9 ], [ 15.1, 1.0 ], [ 150.0, 1.1 ] ] );
    soundscripts\_audio_vehicle_manager::_id_117D( "blackhawk_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    soundscripts\_audio_vehicle_manager::_id_119C();
}

blackhawk_condition_callback_to_hover( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );

    if ( var_2 < 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

blackhawk_condition_callback_to_fly( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );

    if ( var_2 >= 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

blackhawk_condition_callback_to_flyby( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );
    var_5 = var_0["speed"];
    var_6 = var_0["doppler"];

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_7 = var_3 - var_1._id_391D._id_6F39;

        if ( var_7 < 0 && var_5 >= 15.1 && var_4 < 2100 && var_6 >= 1.02 )
            var_2 = 1;

        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = var_7;
    }

    return var_2;
}

blackhawk_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = soundscripts\_audio_vehicle_manager::_id_2B71( var_2 );

    if ( var_3 >= 3000 )
        return 1;

    return 0;
}