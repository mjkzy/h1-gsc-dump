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

snd_init_m1a1()
{
    _id_A5E4::_id_11A3( "about_to_stop", ::m1a1_input_callback_about_to_stop );
    _id_A5E8::_id_870C( "snd_register_vehicle", "m1a1", ::snd_m1a1_constructor );
}

snd_start_m1a1()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        snd_stop_m1a1( 1.0 );
    }

    thread _id_870F();
    var_0 = spawnstruct();
    var_0._id_6F21 = "m1a1";
    _id_A5E8::_id_870C( "snd_start_vehicle", var_0 );
}

_id_870F()
{
    self endon( "death" );
    self endon( "snd_stop_vehicle" );
    self waittill( "about_to_stop", var_0 );

    if ( var_0 > 1.0 )
    {
        wait(var_0 - 1.0);

        if ( !isdefined( self ) )
            return;
    }

    self._id_06C1 = 1;
}

snd_stop_m1a1( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        _id_A5E8::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

snd_m1a1_constructor()
{
    _id_A5E4::_id_118C( "m1a1" );
    _id_A5E4::_id_1187();
    _id_A5E4::_id_1188( "m1a1_abrams_idle_close_loop" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "m1a1_idle_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "m1a1_idle_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "m1a1_abrams_engine_close_loop" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "m1a1_engine_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "m1a1_engine_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "m1a1_abrams_engine_treads_loop" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "m1a1_treads_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "m1a1_treads_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "m1a1_abrams_engine_treads_loop_2" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "m1a1_treads_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "m1a1_treads_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1197();
    _id_A5E4::_id_1189( 0.5 );
    _id_A5E4::_id_1199();
    _id_A5E4::_id_1185();
    _id_A5E4::_id_1186( "to_state_idle", ::m1a1_condition_callback_to_idle );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_118B( "speed", 1.0, 1.0 );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "about_to_stop" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_engine", ::m1a1_condition_callback_to_engine );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_118B( "speed", 1.0, 1.0 );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "about_to_stop" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1195();
    _id_A5E4::_id_118D();
    _id_A5E4::_id_118F( "main_oneshots", "state_idle", "to_state_idle", 50, 0.1 );
    _id_A5E4::_id_118E( "state_idle" );
    _id_A5E4::_id_1184( "state_engine", "to_state_engine" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_engine", 1.0 );
    _id_A5E4::_id_1184( "state_idle", "to_state_idle" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_119F();
    _id_A5E4::_id_119D();
    _id_A5E4::_id_117D( "m1a1_idle_vel2vol", [ [ 0.0, 1.0 ], [ 8.0, 0.0 ] ] );
    _id_A5E4::_id_117D( "m1a1_idle_vel2pch", [ [ 0.0, 1.0 ], [ 2.5, 1.25 ] ] );
    _id_A5E4::_id_117D( "m1a1_engine_vel2vol", [ [ 0.0, 0.0 ], [ 5.0, 0.7 ], [ 8.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "m1a1_engine_vel2pch", [ [ 0.0, 0.8 ], [ 8.0, 1.0 ], [ 10.0, 1.1 ] ] );
    _id_A5E4::_id_117D( "m1a1_treads_vel2vol", [ [ 0.0, 0.0 ], [ 5.0, 0.7 ], [ 8.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "m1a1_treads_vel2pch", [ [ 0.0, 0.8 ], [ 8.0, 1.2 ] ] );
    _id_A5E4::_id_119C();
}

m1a1_input_callback_about_to_stop()
{
    var_0 = _id_A5E4::_id_11CA();
    return isdefined( var_0._id_06C1 );
}

m1a1_condition_callback_to_idle( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["about_to_stop"];

    if ( var_2 <= 0.01 || var_3 > 0.5 )
        return 1;

    return 0;
}

m1a1_condition_callback_to_engine( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["about_to_stop"];

    if ( var_2 > 0.01 && var_3 < 0.5 )
        return 1;

    return 0;
}
