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
    _id_2110();
    _id_4D5B();
    _id_4CF4();
    _id_5625();
    _id_5618();
    thread _id_5617();
    _id_23C4();
    _id_6ECB();
    _id_72E8();
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_killhouse_global" );
    aud_deactivate_hangar_transition_zone();
}

_id_4D5B()
{

}

_id_4CF4()
{

}

_id_5625()
{

}

_id_5618()
{

}

_id_5617()
{
    wait 0.1;
}

_id_23C4()
{

}

_id_6ECB()
{

}

_id_72E8()
{
    _id_A5E8::_id_874D( "start_inside_checkpoint", ::start_inside_checkpoint );
    _id_A5E8::_id_874D( "start_look_training_checkpoint", ::start_look_training_checkpoint );
    _id_A5E8::_id_874D( "start_rifle_start_checkpoint", ::start_rifle_start_checkpoint );
    _id_A5E8::_id_874D( "start_rifle_timed_start_checkpoint", ::start_rifle_timed_start_checkpoint );
    _id_A5E8::_id_874D( "start_sidearm_start_checkpoint", ::start_sidearm_start_checkpoint );
    _id_A5E8::_id_874D( "start_frag_start_checkpoint", ::start_frag_start_checkpoint );
    _id_A5E8::_id_874D( "start_launcher_start_checkpoint", ::start_launcher_start_checkpoint );
    _id_A5E8::_id_874D( "start_explosives_start_checkpoint", ::start_explosives_start_checkpoint );
    _id_A5E8::_id_874D( "start_course_start_checkpoint", ::start_course_start_checkpoint );
    _id_A5E8::_id_874D( "start_reveal_start_checkpoint", ::start_reveal_start_checkpoint );
    _id_A5E8::_id_874D( "start_cargoship_start_checkpoint", ::start_cargoship_start_checkpoint );
    _id_A5E8::_id_874D( "start_debrief_start_checkpoint", ::start_debrief_start_checkpoint );
    _id_A5E8::_id_874D( "start_fade_to_black_end", ::start_fade_to_black_end );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_inside_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar1" );
}

start_look_training_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar1" );
}

start_rifle_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar1" );
}

start_rifle_timed_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar1" );
}

start_sidearm_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar1" );
}

start_frag_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_launcher_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_explosives_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_course_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_reveal_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_cargoship_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar2" );
}

start_debrief_start_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hangar2" );
}

aud_deactivate_hangar_transition_zone()
{
    var_0 = getent( "hangar_audio_transition_zone", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
}

aud_activate_hangar_transition_zone()
{
    _id_A5A4::_id_3101( "hangar_audio_transition_zone" );
}

aud_disable_bm21_idle()
{
    var_0 = getent( "bm21_no_sound_01", "targetname" );
    var_0 vehicle_turnengineoff();
}

aud_bm21_driveby_snd( var_0 )
{
    var_0 vehicle_turnengineoff();
    var_1 = aud_entity_link_on_tag( "scn_truck_passby_close_tire_left", var_0, "tag_wheel_back_left" );
    var_2 = aud_entity_link_on_tag( "scn_truck_passby_close_tire_right", var_0, "tag_wheel_back_right" );
    var_3 = aud_entity_link_on_tag( "scn_truck_passby_engine", var_0, "tag_body" );
    var_4 = aud_vehicle_node_handler( "vehicle_near_end_node" );
    var_5 = aud_entity_link_on_tag( "truck_brakesqueal", var_0, "tag_body" );
    var_5 scalevolume( 0, 0 );
    var_5 playloopsound( "truck_idle_high" );
    var_5 scalevolume( 1, 0.2 );
    var_1 scalevolume( 0, 2 );
    var_2 scalevolume( 0, 2 );
    var_3 scalevolume( 0, 0.8 );
    var_6 = aud_vehicle_node_handler( "vehicle_end_node" );
    var_1 stopsounds();
    var_2 stopsounds();
    var_3 stopsounds();
    var_1 delete();
    var_2 delete();
    var_3 delete();
}

aud_entity_link_on_tag( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3 linkto( var_1, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 playloopsound( var_0 );
    return var_3;
}

aud_vehicle_node_handler( var_0 )
{
    var_1 = _id_A5A4::_id_3F83( var_0, "script_noteworthy" );
    var_1 waittill( "trigger", var_2 );
}

aud_timer_end()
{
    var_0 = getent( "timerEntity", "targetname" );
    var_0 playsound( "scn_timer_end" );
}

aud_jet_passby()
{
    var_0 = _id_A5A4::_id_3F83( "jet01_sound", "script_noteworthy" );
    var_1 = _id_A5A4::_id_3F83( "jet02_sound", "script_noteworthy" );
    thread aud_jet_start_node_handler( var_0 );
    thread aud_jet_start_node_handler( var_1 );
}

aud_jet_start_node_handler( var_0 )
{
    var_0 waittill( "trigger", var_1 );
    wait 0.9;
    var_1 thread _id_A5A4::_id_69C4( "scn_mig29_passby" );
    var_1 thread _id_A5A4::_id_69C4( "veh_mig29_passby_layer" );
}

aud_vehicle_driveby_manager()
{
    if ( self.visionsetnaked == "bm21_troops" )
    {
        _id_A5DE::_id_5CF2( "bm21_engine_mute" );
        thread _id_A5A4::_id_69C4( "scn_bm21_break" );
        thread _id_A5A4::_id_69C4( "scn_bm21_horn" );
    }
    else
    {
        thread _id_A5A4::_id_69C4( "scn_jeep_break" );
        thread _id_A5A4::_id_69C4( "scn_jeep_horn" );
    }
}

aud_vehicle_driveby_reset()
{
    if ( self.visionsetnaked == "bm21_troops" )
    {
        _id_A5DE::_id_5CF6( "bm21_engine_mute" );
        thread _id_A5A4::_id_69C4( "scn_bm21_start" );
    }
}

aud_bm21_tire_sounds()
{
    if ( self.visionsetnaked == "bm21_troops" )
    {
        var_0 = aud_entity_link_on_tag( "scn_truck_passby_close_tire_left", self, "tag_wheel_back_left" );
        var_1 = aud_entity_link_on_tag( "scn_truck_passby_close_tire_right", self, "tag_wheel_back_right" );
    }
}

aud_fail_mix()
{
    level waittill( "mission failed" );
    _id_A5DE::_id_5CF2( "fail_mix" );
}

aud_hangar_amb_ext()
{
    var_0 = spawn( "script_origin", ( 3077.4, -1176.59, 139.321 ) );
    var_1 = spawn( "script_origin", ( 3056.51, -1177.58, 137.088 ) );
    var_0 thread common_scripts\utility::_id_6975( "h1_emt_walla_military_int" );
    var_1 thread common_scripts\utility::_id_6975( "amb_hangar_int_windows_outside_lp" );
    level waittill( "DespawnGuysHangar1" );
    wait 3;
    var_0 delete();
    var_1 delete();
}

start_fade_to_black_end()
{
    _id_A5DE::_id_5CF2( "fade_to_black_end_mix" );
}
