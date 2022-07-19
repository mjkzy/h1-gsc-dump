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

snd_init_mi28()
{
    _id_A5E8::_id_870C( "snd_register_vehicle", "mi28", ::snd_mi28_constructor );
}

snd_start_mi28()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        snd_stop_mi28( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "mi28";
    _id_A5E8::_id_870C( "snd_start_vehicle", var_0 );
}

snd_stop_mi28( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        _id_A5E8::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

snd_mi28_constructor()
{
    _id_A5E4::_id_118C( "mi28" );
    _id_A5E4::_id_1187();
    _id_A5E4::_id_1188( "havoc_engine_dist_loop" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi28_dist_towards_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "mi28_dist_towards_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi28_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "havoc_engine_high" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi28_close_towards_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi28_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "havoc_idle_high" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi28_close_towards_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi28_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1197();
    _id_A5E4::_id_1189( 0.5 );
    _id_A5E4::_id_118A( "h1r_havoc_start_rev", "mi28_windup_duck" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi28_by_windup_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_118A( "h1r_havoc_pass_by", "mi28_flyby_duck_envelope" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "pitch", "mi28_flyby_vel2pch" );
    _id_A5E4::_id_1183( "volume", "mi28_flyby_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi28_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_1199();
    _id_A5E4::_id_1185();
    _id_A5E4::_id_1186( "to_state_hover", ::mi28_condition_callback_to_hover, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly", ::mi28_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly_from_hover", ::mi28_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_havoc_start_rev" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_distant", ::mi28_condition_callback_to_distant, [ "distance2d" ] );
    _id_A5E4::_id_1180( "havoc_engine_dist_loop" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_flyby", ::mi28_condition_callback_to_flyby, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_havoc_pass_by" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1195();
    _id_A5E4::_id_118D( 0.25, 0.5 );
    _id_A5E4::_id_118F( "engine_oneshots", "state_fly", "to_state_fly", 50, 1.0 );
    _id_A5E4::_id_118E( "state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly_from_hover" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_distant" );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_fly" );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_flyby", 7.0 );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_119F();
    _id_A5E4::_id_119D();
    _id_A5E4::_id_117D( "mi28_dist_towards_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_close_towards_vel2vol", [ [ 0, 1.0 ], [ 20, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_dist_towards_vel2pch", [ [ 0, 0.8 ], [ 10, 1.0 ], [ 20, 1.1 ] ] );
    _id_A5E4::_id_117D( "mi28_windup_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_by_windup_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_flyby_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_flyby_vel2vol", [ [ 0.0, 0.0 ], [ 16.08, 0.0 ], [ 20.1, 0.5 ], [ 40.2, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi28_flyby_vel2pch", [ [ 0.0, 0.8 ], [ 20.1, 1.0 ], [ 150.0, 1.1 ] ] );
    _id_A5E4::_id_117D( "mi28_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    _id_A5E4::_id_119C();
}

mi28_condition_callback_to_hover( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 < 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

mi28_condition_callback_to_fly( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 >= 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

mi28_condition_callback_to_flyby( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );
    var_5 = var_0["speed"];

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_6 = var_3 - var_1._id_391D._id_6F39;

        if ( var_6 < 0 && var_4 < 2500 && var_5 >= 20.1 )
            var_2 = 1;

        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = var_6;
    }

    return var_2;
}

mi28_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = _id_A5E4::_id_2B71( var_2 );

    if ( var_3 >= 3000 )
        return 1;

    return 0;
}
