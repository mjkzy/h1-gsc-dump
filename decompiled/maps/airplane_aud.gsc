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
    soundscripts\_audio::_id_7EC8( "shg" );
    soundscripts\_snd_filters::_id_8757( "med_occlusion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_airplane_global" );
    soundscripts\_audio_mix_manager::_id_5CF2( "first_floor_mix" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "wind_zone_active" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread aud_wind_door_mix_manager();
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
    soundscripts\_snd::_id_874D( "aud_start_breach_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_vip_checkpoint", ::aud_start_vip_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_freefall_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_demo_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_no_game_checkpoint", ::aud_start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "aud_add_wind_door_mix", ::aud_add_wind_door_mix );
    soundscripts\_snd::_id_874D( "aud_remove_wind_door_mix", ::aud_remove_wind_door_mix );
    soundscripts\_snd::_id_874D( "aud_add_armed_bomb_vo_mix", ::aud_add_armed_bomb_vo_mix );
    soundscripts\_snd::_id_874D( "aud_remove_armed_bomb_vo_mix", ::aud_remove_armed_bomb_vo_mix );
    soundscripts\_snd::_id_874D( "aud_add_slowmo_mix", ::aud_add_slowmo_mix );
    soundscripts\_snd::_id_874D( "aud_remove_slowmo_mix", ::aud_remove_slowmo_mix );
    soundscripts\_snd::_id_874D( "mission_failed_fade_out", ::mission_failed_fade_out );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_intro_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_small" );
}

aud_start_breach_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_large" );
}

aud_start_vip_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "second_floor_corridor" );
}

aud_start_freefall_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "second_floor_large" );
}

aud_start_demo_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_large" );
}

aud_wind_door_mix_manager()
{
    common_scripts\utility::_id_384A( "wind_zone_active" );
    var_0 = getent( "zone_wind", "targetname" );
    var_0 thread update_wind_mix();
}

update_wind_mix()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 != level.player )
            continue;

        aud_add_wind_door_mix();

        while ( self istouching( level.player ) )
            wait 0.05;

        aud_remove_wind_door_mix();
    }
}

aud_add_wind_door_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "wind_door_mix" );
}

aud_remove_wind_door_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "wind_door_mix" );
}

aud_add_armed_bomb_vo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "armed_bomb_vo_mix" );
}

aud_remove_armed_bomb_vo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "armed_bomb_vo_mix" );
}

aud_add_slowmo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "slowmo_mix" );
}

aud_remove_slowmo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "slowmo_mix" );
}

aud_explosion_event()
{
    thread common_scripts\utility::_id_69C2( "emt_engine_rev_left", ( -213.481, 1664.53, 57.2619 ) );
    thread common_scripts\utility::_id_69C2( "emt_engine_rev_right", ( -293.822, -439.819, 35.6474 ) );
    thread common_scripts\utility::_id_697A( "emt_engine_left_lp", ( -213.481, 1664.53, 57.2619 ) );
    thread common_scripts\utility::_id_697A( "emt_engine_right_lp", ( -293.822, -439.819, 35.6474 ) );
    thread common_scripts\utility::_id_697A( "fuselage_breach_wind", ( 1120.67, 713.839, 177.178 ) );
}

aud_animated_luggage()
{
    thread common_scripts\utility::_id_6975( "emt_luggage_rattler_lp" );
}

aud_end_breach_sounds()
{
    thread maps\_utility::_id_69C4( "end_breach_explosion" );
    thread maps\_utility::_id_69C4( "end_breach_explosion_in" );
    thread common_scripts\utility::_id_6975( "end_breach_hole_wind_lp" );
    maps\_utility::_id_27EF( 1.4, common_scripts\utility::_id_69C2, "scn_container_impact", ( -1042.49, 510.675, 289.612 ) );
    maps\_utility::_id_27EF( 2.5, common_scripts\utility::_id_69C2, "scn_container_impact", ( -1115.57, 395.735, 299.337 ) );
}

aud_final_jump_mix_and_sounds()
{
    thread soundscripts\_audio_mix_manager::_id_5CF9( "second_floor_mix" );
    thread soundscripts\_audio_mix_manager::_id_5CF6( "armed_bomb_vo_mix" );
    thread soundscripts\_audio_mix_manager::_id_5CF2( "final_jump_mix" );
    level.player thread maps\_utility::_id_69C4( "end_jump_plane" );
    level.player thread common_scripts\utility::_id_6975( "ext_wind_lp_front" );
}

mission_failed_fade_out()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "fade_to_black_end_mix" );
}
