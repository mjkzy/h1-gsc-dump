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
}

_id_2110()
{
    soundscripts\_audio::_id_7EC8( "shg" );
    soundscripts\_snd_filters::_id_8757( "med_occlusion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_cargoship_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "aud_mix_deck_window" );
    common_scripts\utility::_id_383D( "aud_package_door_creaks" );
    soundsettraceflags( "vehicles", "solid", "glass" );
    soundsettraceflags( "battlechatter", "solid", "glass" );
    soundsettraceflags( "voices", "solid", "glass" );
    soundsettraceflags( "emitters", "solid", "glass" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread aud_start_mix_deck_windows();
    thread aud_start_mix_end();
}

_id_5618()
{

}

_id_5617()
{
    wait 0.1;
    thread soundscripts\_audio::_id_0FF4( "ocean_emitter_left", "emt_waves_crashing_far", ( 3649.9, -899.7, -13.0 ), ( -3582.0, -899.7, -13.0 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "ocean_emitter_right", "emt_waves_crashing_far", ( 3710.4, 893.8, -13.0 ), ( -3586.4, 896.9, -13.0 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "hangar_emitter_center01 ", "emt_water_drop_metal", ( -1894.71, -27.25, -407.875 ), ( -1142.67, -20.391, -407.875 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "hangar_emitter_center02 ", "emt_water_drop_metal", ( -963.804, -5.706, -407.875 ), ( -830.211, 2.213, -407.875 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "hangar_emitter_center03 ", "emt_water_drop_metal", ( -548.97, 8.78, -407.875 ), ( 131.804, 11.023, -407.875 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "hangar_emitter_center04 ", "emt_water_drop_metal", ( 549.98, 14.846, -407.875 ), ( 995.199, 22.681, -407.875 ), 0.5 );
    thread soundscripts\_audio::_id_0FF4( "hangar_emitter_center05 ", "emt_water_drop_metal", ( 1255.19, 11.04, -407.875 ), ( 2497.56, 2.806, -407.875 ), 0.5 );
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
    soundscripts\_snd::_id_874D( "aud_start_checkpoint", ::aud_start_checkpoint );
    soundscripts\_snd::_id_874D( "aud_bridge_checkpoint", ::aud_bridge_checkpoint );
    soundscripts\_snd::_id_874D( "aud_deck_checkpoint", ::aud_deck_checkpoint );
    soundscripts\_snd::_id_874D( "aud_hallways_checkpoint", ::aud_hallways_checkpoint );
    soundscripts\_snd::_id_874D( "aud_cargohold_checkpoint", ::aud_cargohold_checkpoint );
    soundscripts\_snd::_id_874D( "aud_cargohold2_checkpoint", ::aud_cargohold2_checkpoint );
    soundscripts\_snd::_id_874D( "aud_laststand_checkpoint", ::aud_laststand_checkpoint );
    soundscripts\_snd::_id_874D( "aud_package_checkpoint", ::aud_package_checkpoint );
    soundscripts\_snd::_id_874D( "aud_escape_checkpoint", ::aud_escape_checkpoint );
    soundscripts\_snd::_id_874D( "aud_end_checkpoint", ::aud_end_checkpoint );
    soundscripts\_snd::_id_874D( "aud_get_out_blackhawk", ::aud_get_out_blackhawk );
    soundscripts\_snd::_id_874D( "aud_stop_intro_mix", ::aud_stop_intro_mix );
    soundscripts\_snd::_id_874D( "aud_get_in_seaknight", ::aud_get_in_seaknight );
    soundscripts\_snd::_id_874D( "aud_start_mix_heli_shoot_window", ::aud_start_mix_heli_shoot_window );
    soundscripts\_snd::_id_874D( "aud_stop_mix_heli_shoot_window", ::aud_stop_mix_heli_shoot_window );
    soundscripts\_snd::_id_874D( "aud_stop_mix_moving_to_hallway", ::aud_stop_mix_moving_to_hallway );
    soundscripts\_snd::_id_874D( "aud_start_mix_npc_pre_explosion", ::aud_start_mix_npc_pre_explosion );
    soundscripts\_snd::_id_874D( "aud_start_mix_scn_explosion", ::aud_start_mix_scn_explosion );
    soundscripts\_snd::_id_874D( "aud_start_mix_escape", ::aud_start_mix_escape );
    soundscripts\_snd::_id_874D( "start_mix_final_jump", ::start_mix_final_jump );
    soundscripts\_snd::_id_874D( "start_mix_finale_music", ::start_mix_finale_music );
    soundscripts\_snd::_id_874D( "start_title_logo_mix", ::start_title_logo_mix );
    soundscripts\_snd::_id_874D( "aud_start_sway1", ::aud_start_sway1 );
    soundscripts\_snd::_id_874D( "aud_start_sway2", ::aud_start_sway2 );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_checkpoint()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "intro_mix" );
    soundscripts\_audio_zone_manager::_id_123A( "cargoship_inside_blackhawk" );
}

aud_bridge_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_deck_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_hallways_checkpoint()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_moving_to_hallway" );
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_cargohold_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_metal" );
}

aud_cargohold2_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "hangar" );
}

aud_laststand_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "hangar" );
}

aud_package_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "hangar" );
}

aud_escape_checkpoint()
{
    soundscripts\_audio_zone_manager::_id_123A( "hangar" );
}

aud_end_checkpoint()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_escape" );
    soundscripts\_audio_zone_manager::_id_123A( "interior_metal" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "cargoship_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "cargoship_intro_mute", 1.75 );
}

aud_get_out_blackhawk()
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior", 0.3 );
}

aud_stop_intro_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "intro_mix" );
}

aud_get_in_seaknight()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_final_jump" );
    soundscripts\_audio_zone_manager::_id_123A( "cargoship_inside_seaknight", 0.3 );
}

aud_start_mix_deck_windows()
{
    common_scripts\utility::_id_384A( "aud_mix_deck_window" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_deck_windows" );
}

aud_start_mix_heli_shoot_window()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_deck_windows" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_heli_shoot_window" );
}

aud_stop_mix_heli_shoot_window()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_heli_shoot_window" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_moving_to_hallway" );
}

aud_stop_mix_moving_to_hallway()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_moving_to_hallway" );
}

aud_start_mix_npc_pre_explosion()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_npc_pre_explosion" );
}

aud_start_mix_scn_explosion()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_scn_explosion" );
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_npc_pre_explosion" );
    soundscripts\_audio_zone_manager::_id_122C( 1 );
    soundscripts\_audio_zone_manager::_id_1233( 1 );
    level.player setreverb( "snd_enveffectsprio_level", "scn_cargo_explosion", 1, 0.7, 0.5 );
    soundscripts\_snd_filters::_id_86DB( "scn_explosion_filter", 0.5 );
}

aud_start_mix_escape()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_scn_explosion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_escape" );
    soundscripts\_snd_filters::_id_86DC( 0.5 );
    soundscripts\_audio_zone_manager::_id_122C( 0 );
    level.player deactivatereverb( "snd_enveffectsprio_level", 1 );
    level.player setreverb( "snd_enveffectsprio_level", "hall_metal", 1, 0.4, 0.5 );
    thread common_scripts\utility::_id_697A( "ambient_cargo_escape_rumble", ( 333.375, -0.75, -99.156 ) );
    thread common_scripts\utility::_id_697A( "ambient_cargo_escape_rumble_02", ( -1762.0, 103.0, -123.0 ) );
    thread aud_alarm_sound();
}

aud_start_mix_end()
{
    common_scripts\utility::_id_384A( "aud_mix_end" );
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_escape" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_end" );
    level.player deactivatereverb( "snd_enveffectsprio_level", 1 );
    soundscripts\_audio_zone_manager::_id_1233( 0 );
}

start_mix_final_jump()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_final_jump" );
}

start_mix_finale_music()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_end" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_finale_music" );
}

start_title_logo_mix()
{
    wait 6;
    soundscripts\_audio_mix_manager::_id_5CF2( "start_title_logo_mix" );
}

aud_start_sway1()
{
    level.player thread maps\_utility::_id_69C4( "elm_cargo_metal_stress_l" );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 894.75, -254.68, 427.8 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 839.41, 199.43, 465.56 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.85, -175.85, 444.47 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.07, 177.02, 442.77 ) );
    aud_container_doors_creak();
}

aud_start_sway2()
{
    level.player thread maps\_utility::_id_69C4( "elm_cargo_metal_stress_r" );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 894.75, -254.68, 427.8 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 839.41, 199.43, 465.56 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.85, -175.85, 444.47 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.07, 177.02, 442.77 ) );
    aud_container_doors_creak();
}

aud_container_doors_creak()
{
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1380.5, 181.0, 25.0 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1630.5, 181.0, 24.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1636.5, 89.0, 25.0 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1387.0, 192.5, 25.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1630.0, 285.0, 25.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1637.0, 194.0, 27.0 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1274.5, 256.5, -350.0 ) );

    if ( common_scripts\utility::_id_382E( "aud_package_door_creaks" ) )
    {
        thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( 2349.5, 254.0, -306.0 ) );
        thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( 2349.5, 154.0, -306.0 ) );
    }
}

start_blackhawk_move( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    soundscripts\_audio_mix_manager::_id_5CF2( "mix_heli_above_deck" );
    var_0 thread maps\_utility::_id_69C4( var_1 );
}

stop_blackhawk_move()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_heli_above_deck" );
}

aud_alarm_sound()
{
    for (;;)
    {
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2332.8, -96.3121, -84.7888 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -3082.43, -216.679, 17.2978 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2513.76, -36.1929, 159.563 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2471.24, -226.825, 180.314 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2570.56, -492.694, 169.511 ) );
        wait 2;
    }
}
