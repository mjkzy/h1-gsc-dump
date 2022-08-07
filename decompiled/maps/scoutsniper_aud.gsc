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
    thread _id_4F77();
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway01", ::bird_flyaway_sound01 );
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway02", ::bird_flyaway_sound02 );
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway03", ::bird_flyaway_sound03 );
}

_id_2110()
{
    soundscripts\_audio::_id_7EC8( "shg" );
    soundscripts\_snd_filters::_id_8757( "med_occlusion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_scoutsniper_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "musicSubmixDelay" );
}

_id_4CF4()
{
    level._interior_vo_zone = getentarray( "interior_vo_zone", "targetname" );
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
    soundscripts\_snd::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    soundscripts\_snd::_id_874D( "snd_music_handler", ::_id_5FFD );
    soundscripts\_snd::_id_874D( "aud_start_intro_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_church_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_graveyard_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_pond_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_cargo_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_dash_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_town_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_dogs_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_center_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_end_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "start_field_mix", ::start_field_mix );
    soundscripts\_snd::_id_874D( "start_pond_mix", ::start_pond_mix );
    soundscripts\_snd::_id_874D( "start_cargo_mix", ::start_cargo_mix );
    soundscripts\_snd::_id_874D( "start_taking_guard_mix", ::start_taking_guard_mix );
    soundscripts\_snd::_id_874D( "stop_taking_guard_mix", ::stop_taking_guard_mix );
    soundscripts\_snd::_id_874D( "start_dash_mix", ::start_dash_mix );
    soundscripts\_snd::_id_874D( "aud_start_dash_heli_flyby_sequence", ::aud_start_dash_heli_flyby_sequence );
    soundscripts\_snd::_id_874D( "aud_start_dash_convoy_sequence", ::aud_start_dash_convoy_sequence );
    soundscripts\_snd::_id_874D( "start_mix_moving_to_town", ::start_mix_moving_to_town );
    soundscripts\_snd::_id_874D( "start_town_mix", ::start_town_mix );
    soundscripts\_snd::_id_874D( "start_dogs_mix", ::start_dogs_mix );
    soundscripts\_snd::_id_874D( "start_school_heli_mix", ::start_school_heli_mix );
    soundscripts\_snd::_id_874D( "start_center_mix", ::start_center_mix );
    soundscripts\_snd::_id_874D( "start_end_mix", ::start_end_mix );
    soundscripts\_snd::_id_874D( "play_additionnal_fs_sfx", ::play_additionnal_fs_sfx );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_intro_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_church_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_graveyard_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "church" );
}

aud_start_field_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_pond_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_cargo_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_dash_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "containor" );
}

aud_start_town_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_dogs_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_center_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_end_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "hall" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "scoutsniper_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "scoutsniper_intro_mute" );
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

start_field_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "graveyard_hind_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "field_mix" );
}

start_pond_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "field_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "pond_mix" );
}

start_cargo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "pond_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "cargo_mix" );
}

start_taking_guard_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "taking_guard_mix" );
}

stop_taking_guard_mix()
{
    wait 1;
    soundscripts\_audio_mix_manager::_id_5CF6( "taking_guard_mix" );
}

start_dash_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "cargo_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "dash_mix" );
}

start_mix_moving_to_town()
{
    self waittill( "trigger", var_0 );

    if ( !common_scripts\utility::_id_382E( "musicSubmixDelay" ) )
    {
        soundscripts\_audio_mix_manager::_id_5CF2( "moving_to_town" );
        level.movingtotownsubmix = 1;
    }

    level common_scripts\utility::_id_384A( "musicSubmixDelay" );

    if ( isdefined( level.movingtotownsubmix ) && level.movingtotownsubmix )
        soundscripts\_audio_mix_manager::_id_5CF6( "moving_to_town" );
}

moving_to_town_submix_handler()
{
    level maps\_utility::_id_27EF( 24, common_scripts\utility::_id_383F, "musicSubmixDelay" );
    common_scripts\utility::_id_76BB( "dash_safezone_trigger", ::start_mix_moving_to_town );
}

start_town_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "dash_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "town_mix" );
}

start_dogs_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "town_mix" );
}

start_center_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "dogs_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "center_mix" );
}

start_school_heli_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "school_heli_mix" );
}

start_end_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "center_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "end_mix" );
}

bird_flywaway( var_0, var_1 )
{
    self waittill( "trigger", var_2 );
    var_3 = spawn( "script_origin", var_0 );
    var_4 = spawn( "script_origin", var_1 );
    var_3 thread maps\_utility::_id_69C4( "anml_bird_startle_flyaway" );
    var_3 moveto( var_4.origin, 2, 0.5 );
    wait 2;
    var_3 delete();
    var_4 delete();
}

bird_flyaway_sound01()
{
    thread bird_flywaway( ( -8751.3, -11507.7, -160.006 ), ( -10563.6, -11225.8, 416.322 ) );
    thread bird_flywaway( ( -9133.09, -10977.3, -33.0787 ), ( -10541.5, -10762.5, 384.938 ) );
}

bird_flyaway_sound02()
{
    bird_flywaway( ( -9819, -7393.55, -58.442 ), ( -11173.2, -7153.06, 352.737 ) );
}

bird_flyaway_sound03()
{
    bird_flywaway( ( -187.072, 690.678, -111.24 ), ( -422.097, 1246.75, 314.014 ) );
}

aud_start_graveyard_heli_scripted_sequence( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "graveyard_hind_mix" );
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    var_1 playsound( "scn_scoutsniper_graveyard_hind_passby" );
    var_2 = spawn( "script_origin", self.origin );
    var_3 = ( 0, 0, -400 );
    var_2 linkto( self, "tag_origin", var_3, ( 0, 0, 0 ) );
    var_2 playrumblelooponentity( "heli_loop" );
    var_0 thread monitor_end_node_reached();
    common_scripts\utility::_id_A069( "end_node_reached", "enemy", "restart_avm" );
    soundscripts\_audio_mix_manager::_id_5CF6( "graveyard_hind_mix" );
    var_1 scalevolume( 0, 2 );
    wait 2;
    var_1 _meth_854d( "scn_scoutsniper_graveyard_hind_passby" );
    var_2 stoprumble( "heli_loop" );
}

aud_start_school_heli_scripted_sequence( var_0 )
{
    maps\_utility::_id_69C4( "scn_scoutsniper_school_int_heli_flyby" );
    var_0 thread monitor_end_node_reached();
    common_scripts\utility::_id_A069( "end_node_reached" );
    wait 2;
    soundscripts\_audio_mix_manager::_id_5CF6( "school_heli_mix" );
    wait 2;
    self _meth_854d( "scn_scoutsniper_school_int_heli_flyby" );
}

monitor_end_node_reached()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    var_0 notify( "end_node_reached" );
}

aud_start_dash_heli_flyby_sequence()
{
    var_0 = getent( "start_heli", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 0.1;
    soundscripts\_audio_mix_manager::_id_5CF2( "dash_heli_flyby_mix" );
    var_1 = maps\_utility::_id_3EB2( "dash_hind", "targetname" );
    var_1 playsound( "scn_scoutsniper_dash_heli_flyby" );
    thread aud_start_dash_heli_idle( var_1 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );

    if ( isdefined( level.dash_section ) && level.dash_section )
    {
        soundscripts\_audio_mix_manager::_id_5CF6( "dash_heli_flyby_mix" );
        var_1 scalevolume( 0, 1 );
        wait 1;
        var_1 stopsounds();
    }
}

aud_start_dash_heli_idle( var_0 )
{
    var_1 = getent( "land_heli_start_node", "script_noteworthy" );
    var_1 waittill( "trigger" );
    soundscripts\_audio_mix_manager::_id_5CF6( "dash_heli_flyby_mix" );
    var_0 scalevolume( 0.5, 0.5 );
    wait 0.5;
    var_0 playloopsound( "scn_scoutsniper_dash_heli_idle" );
    var_0 scalevolume( 1, 1.5 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );

    if ( isdefined( level.dash_section ) && level.dash_section )
    {
        var_0 scalevolume( 0, 1 );
        wait 1;
        var_0 stoploopsound( "scn_scoutsniper_dash_heli_idle" );
    }
}

aud_field_handle_bmps_engine()
{
    var_0 = getvehiclenode( "first_bmp_end", "script_noteworthy" );
    var_1 = getvehiclenode( "second_bmp_end", "script_noteworthy" );
    var_2 = getvehiclenode( "third_bmp_end", "script_noteworthy" );
    var_3 = getvehiclenode( "fourth_bmp_end", "script_noteworthy" );
    var_0 thread aud_field_bmp_end_node_reached();
    var_1 thread aud_field_bmp_end_node_reached();
    var_2 thread aud_field_bmp_end_node_reached();
    var_3 thread aud_field_bmp_end_node_reached();
}

aud_field_bmp_end_node_reached()
{
    self waittill( "trigger", var_0 );
    var_0 aud_field_bmp_to_idle();
}

aud_field_bmp_engine_handle()
{
    waitframe;
    self._id_799F = 1;
    self vehicle_turnengineoff();
    thread maps\_utility::_id_6976( "bmp_engine_front", "tag_flash" );
    thread maps\_utility::_id_6976( "bmp_engine_rear", "tag_c4" );
    thread maps\_utility::_id_6976( "bmp_thread_loop_side", "tag_wheel_middle_left" );
    thread maps\_utility::_id_6976( "bmp_thread_loop_side", "tag_wheel_middle_right" );
}

aud_field_bmp_to_idle()
{
    self scalevolume( 0, 1 );
    wait 1.2;
    common_scripts\utility::_id_8EA1( "bmp_engine_front" );
    common_scripts\utility::_id_8EA1( "bmp_engine_rear" );
    common_scripts\utility::_id_8EA1( "bmp_thread_loop_side" );
    self scalevolume( 1, 1 );
    thread maps\_utility::_id_6976( "bmp_engine_idle", "tag_flash" );
}

aud_start_dash_convoy_sequence()
{
    var_0 = getvehiclenode( "firsttruck", "script_noteworthy" );
    var_1 = getvehiclenode( "secondtruck", "script_noteworthy" );
    var_2 = getvehiclenode( "jeep", "script_noteworthy" );
    var_0 thread convoy_node_reached();
    var_1 thread convoy_node_reached();
    var_2 thread convoy_node_reached();
}

convoy_node_reached()
{
    self waittill( "trigger", var_0 );
    var_1 = "scn_scoutsniper_dash_" + self.script_parentname;
    var_0 thread maps\_utility::_id_69C4( var_1 );
    var_2 = getvehiclenode( self.script_parentname + "_close", "script_noteworthy" );
    var_2 waittill( "trigger", var_0 );
    var_1 = "scn_scoutsniper_dash_" + self.script_parentname + "_close";
    var_0 thread maps\_utility::_id_69C4( var_1 );
}

play_additionnal_fs_sfx()
{
    if ( self != level._id_6F7C )
        thread maps\_utility::_id_69C4( "scn_scout_convoy_npc_step" );
}

aud_school_heli_rumble()
{
    thread common_scripts\utility::_id_69C2( "emt_helicopter_ground_rumble", ( 11330.9, 6009.59, 150.375 ) );
    thread common_scripts\utility::_id_69C2( "scn_scoutsniper_school_int_debris_1", ( 11366, 5986.93, 191.435 ) );
    thread common_scripts\utility::_id_69C2( "scn_scoutsniper_school_int_debris_2", ( 11346.6, 5770.42, 190.031 ) );
}

cargo_guard_getting_hit( var_0 )
{
    var_0 thread maps\_utility::_id_69C4( "scn_scoutsniper_taking_guard" );
}
