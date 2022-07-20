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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_airlift_global" );
}

_id_4D5B()
{
    soundsettraceflags( "vehicles", "solid", "glass" );
    soundsettraceflags( "battlechatter", "solid", "glass" );
    soundsettraceflags( "voices", "solid", "glass" );
    soundsettraceflags( "emitters", "solid", "glass" );
    soundsettraceflags( "weapons", "solid", "glass" );
    soundsettraceflags( "explosions", "solid", "glass" );
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
    soundscripts\_snd::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    soundscripts\_snd::_id_874D( "start_smoketown_checkpoint", ::start_smoketown_checkpoint );
    soundscripts\_snd::_id_874D( "start_cobraflight_checkpoint", ::start_cobraflight_checkpoint );
    soundscripts\_snd::_id_874D( "start_cobrastreets_checkpoint", ::start_cobrastreets_checkpoint );
    soundscripts\_snd::_id_874D( "start_nuke_checkpoint", ::start_nuke_checkpoint );
    soundscripts\_snd::_id_874D( "aud_add_gun_overheat_mix", ::aud_add_gun_overheat_mix );
    soundscripts\_snd::_id_874D( "aud_remove_gun_overheat_mix", ::aud_remove_gun_overheat_mix );
    soundscripts\_snd::_id_874D( "aud_seaknight_sound_node_spawner", ::aud_seaknight_sound_node_spawner );
    soundscripts\_snd::_id_874D( "aud_seaknight_leaves_smoketown", ::aud_seaknight_leaves_smoketown );
    soundscripts\_snd::_id_874D( "aud_add_smoketown_operation_mix", ::aud_add_smoketown_operation_mix );
    soundscripts\_snd::_id_874D( "aud_add_leave_smoketown_mix", ::aud_add_leave_smoketown_mix );
    soundscripts\_snd::_id_874D( "aud_add_drag_pilot_mix", ::aud_add_drag_pilot_mix );
    soundscripts\_snd::_id_874D( "aud_add_escape_crash_mix", ::aud_add_escape_crash_mix );
    soundscripts\_snd::_id_874D( "aud_add_failure_mix", ::aud_add_failure_mix );
    soundscripts\_snd::_id_874D( "aud_add_nuke_heli_spin_mix", ::aud_add_nuke_heli_spin_mix );
    soundscripts\_snd::_id_874D( "aud_add_nuke_blackscreen_mix", ::aud_add_nuke_blackscreen_mix );
    soundscripts\_snd::_id_874D( "player_outside_seaknight", ::player_outside_seaknight );
    soundscripts\_snd::_id_874D( "set_ambient_helicopter", ::set_ambient_helicopter );
    soundscripts\_snd::_id_874D( "start_cobra_crash_mix", ::start_cobra_crash_mix );
    soundscripts\_snd::_id_874D( "start_pilot_rescue_mix", ::start_pilot_rescue_mix );
    soundscripts\_snd::_id_874D( "start_nuke_mix", ::start_nuke_mix );
    soundscripts\_snd::_id_874D( "set_context_int_for_seaknight", ::set_context_int_for_seaknight );
    soundscripts\_snd::_id_874D( "set_context_ext_for_seaknight", ::set_context_ext_for_seaknight );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_ext" );
    soundscripts\_audio_mix_manager::_id_5CF2( "intro_chopper_mix" );
}

start_smoketown_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_ext" );
    soundscripts\_audio_mix_manager::_id_5CF2( "heli_landing_field_mix" );
}

start_cobraflight_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
    soundscripts\_audio_mix_manager::_id_5CF2( "smoketown_operation_mix" );
}

start_cobrastreets_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_ext" );
    soundscripts\_audio_mix_manager::_id_5CF2( "pilot_rescue_mix" );
}

start_nuke_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
    soundscripts\_audio_mix_manager::_id_5CF2( "escape_crash_mix" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "airlift_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "airlift_intro_mute" );
    soundscripts\_audio_mix_manager::_id_5CF2( "intro_chopper_mix" );
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_ext" );
}

set_ambient_helicopter()
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_int" );
}

player_outside_seaknight()
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_add_smoketown_operation_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "seaknight_taking_off_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "smoketown_operation_mix" );
}

aud_add_leave_smoketown_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "smoketown_operation_mix", 0.5 );
    soundscripts\_audio_mix_manager::_id_5CF2( "leaving_smoketown_mix" );
}

start_cobra_crash_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "leaving_smoketown_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "cobra_crash_mix" );
}

start_pilot_rescue_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "landing_crash_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "pilot_rescue_mix" );
}

aud_add_drag_pilot_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "pilot_rescue_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "drag_pilot_mix" );
}

aud_add_escape_crash_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "drag_pilot_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "escape_crash_mix" );
}

start_nuke_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "escape_crash_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "nuke_mix" );
}

aud_add_nuke_heli_spin_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "nuke_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "nuke_heli_spin_mix" );
}

aud_add_nuke_blackscreen_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "nuke_heli_spin_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "nuke_blackscreen_mix" );
}

aud_add_gun_overheat_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "gun_overheat_mix" );
}

aud_remove_gun_overheat_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "gun_overheat_mix" );
}

aud_add_failure_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "failure_mix" );
}

set_context_int_for_seaknight()
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_int", 0.5 );
}

set_context_ext_for_seaknight()
{
    soundscripts\_audio_zone_manager::_id_123A( "inside_seaknight_ext", 0.5 );
}

aud_seaknight_sound_node_spawner()
{
    level.seaknight_engine_sound_node = spawn( "script_origin", level.seaknight.origin );
    level.seaknight_engine_sound_node linkto( level.seaknight );
}

aud_seaknight_event_handler( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_3 ) && isdefined( var_4 ) )
    {
        soundscripts\_audio_mix_manager::_id_5CF6( var_3, 0.5 );
        soundscripts\_audio_mix_manager::_id_5CF2( var_4, 0.5 );
    }

    self scalepitch( var_0, var_2 );
    self scalevolume( var_1, var_2 );
}

aud_seaknight_audio_event( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread maps\_utility::_id_69C4( var_0 );
    self scalepitch( var_1, var_2 );
    wait(var_3 + var_2);
    self scalepitch( var_4, var_5 );
}

aud_seaknight_leaves_smoketown()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "heli_landing_field_mix", 0.5 );
    soundscripts\_audio_mix_manager::_id_5CF2( "seaknight_taking_off_mix", 0.5 );
    level.seaknight_engine_sound_node thread maps\_utility::_id_69C4( "scn_airlift_seaknight_liftoff_smoketown" );
}

aud_convoy_passby_manager( var_0, var_1, var_2, var_3 )
{
    wait(var_3);
    var_4 = getentarray( var_0, var_1 );

    foreach ( var_6 in var_4 )
        var_6 playsound( var_2 );
}

aud_cobra_passby_manager( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_3 waittill( "trigger", var_4 );
    wait(var_2);
    var_4 thread maps\_utility::_id_69C4( var_1 );
}

aud_abrams_passby_manager( var_0 )
{
    var_1 = 0;

    for (;;)
    {
        self waittill( "trigger", var_2 );
        wait 0.1;
        var_1 += 1;

        switch ( var_0 )
        {
            case "lead":
                var_2 thread maps\_utility::_id_69C4( "scn_airlift_abrams_lead" );
                break;
            case "follow":
                var_3 = "scn_airlift_abrams_follow_0" + var_1;
                var_2 thread maps\_utility::_id_69C4( var_3 );
                break;
        }

        wait 0.05;
    }
}

play_player_heli_land_sfx( var_0, var_1 )
{
    var_0 waittill( "trigger", var_2 );
    thread maps\_utility::_id_69C4( var_1 );
}
