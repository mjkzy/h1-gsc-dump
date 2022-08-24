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
    thread flying_intro_start();
}

_id_2110()
{
    soundscripts\_audio::_id_7EC8( "shg" );
    soundscripts\_snd_filters::_id_8757( "med_occlusion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_bogb_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "first_mi17_gone" );
    common_scripts\utility::_id_383D( "abrams_stop_for_city_fight" );
    common_scripts\utility::_id_383D( "abrams_start_moving_after_city_fight" );
    common_scripts\utility::_id_383D( "truck_crush_player_in_position" );
    common_scripts\utility::_id_383D( "abrams_stop_wait_for_player" );
}

_id_4CF4()
{
    level._id_0E57.disable_m1a1_audio = 1;
    level._id_0E57.abramsaudio = [];
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto33", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto34", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto70", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto73", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto76", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto87", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto88", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto138", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto183", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "auto298", "targetname" );
    level._id_0E57.abramsaudio[level._id_0E57.abramsaudio.size] = getvehiclenode( "tank_path_4", "targetname" );
    common_scripts\utility::_id_0D13( level._id_0E57.abramsaudio, ::abrams_audio_node );
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
    level._id_0E57._id_3337 = [];
    level._id_0E57._id_3337["example_envelop"] = [ [ 0.0, 0.0 ], [ 0.082, 0.426 ], [ 0.238, 0.736 ], [ 0.408, 0.844 ], [ 0.756, 0.953 ], [ 1.0, 1.0 ] ];
}

_id_6ECB()
{

}

_id_72E8()
{
    soundscripts\_snd::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    soundscripts\_snd::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_arch_checkpoint", ::aud_start_arch_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_alley_checkpoint", ::aud_start_alley_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_ch46_checkpoint", ::aud_start_ch46_checkpoint );
    soundscripts\_snd::_id_874D( "start_increase_ambiance", ::start_increase_ambiance );
    soundscripts\_snd::_id_874D( "start_decrease_ambiance", ::start_decrease_ambiance );
    soundscripts\_snd::_id_874D( "start_mi17_sequence", ::start_mi17_sequence );
    soundscripts\_snd::_id_874D( "start_t72_wall_explode_mix", ::start_t72_wall_explode_mix );
    soundscripts\_snd::_id_874D( "start_t72_hit_mix", ::start_t72_hit_mix );
    soundscripts\_snd::_id_874D( "start_t72_explode_mix", ::start_t72_explode_mix );
    soundscripts\_snd::_id_874D( "lastSequence_submix", ::lastsequence_submix );
    soundscripts\_snd::_id_874D( "lastSequence_celebration_submix", ::lastsequence_celebration_submix );
    soundscripts\_snd::_id_874D( "seaknight_rescue_submix", ::seaknight_rescue_submix );
}

_id_A3E6( var_0, var_1 )
{
    var_2 = "";
    var_3 = "";

    if ( getsubstr( var_0, 0, 6 ) == "enter_" )
        var_2 = var_1;
    else if ( getsubstr( var_0, 0, 5 ) == "exit_" )
        var_3 = var_1;
}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    set_exterior_streamed_ambience( "ambient_bog_ext3" );
    soundscripts\_audio_zone_manager::_id_123A( "exterior_field" );
}

aud_start_arch_checkpoint( var_0 )
{
    set_exterior_streamed_ambience( "ambient_bog_ext3" );
    soundscripts\_audio_zone_manager::_id_123A( "exterior_field" );
}

aud_start_alley_checkpoint( var_0 )
{
    start_decrease_ambiance();
    soundscripts\_audio_zone_manager::_id_123A( "exterior_alley" );
}

aud_start_ch46_checkpoint( var_0 )
{
    start_decrease_ambiance();
    soundscripts\_audio_zone_manager::_id_123A( "exterior_field" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_seaknight_rescue" );
}

flying_intro_start()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "flying_intro_mute" );
    flying_intro_check_end();
}

flying_intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "flying_intro_mute", 1 );
    set_exterior_streamed_ambience( "ambient_bog_ext3" );
    soundscripts\_audio_zone_manager::_id_123A( "exterior_field" );
}

start_increase_ambiance()
{
    set_exterior_streamed_ambience( "ambient_bog_ext5" );
}

start_decrease_ambiance()
{
    set_exterior_streamed_ambience( "ambient_bog_ext1" );
}

lastsequence_submix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_lastSequence", 0.8 );
}

start_t72_wall_explode_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "t72_wall_explode_mix" );
    thread aud_final_wall_exp_debris();
}

start_t72_hit_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "t72_wall_explode_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "t72_hit_mix" );
}

start_t72_explode_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "t72_hit_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "t72_explode_mix" );
    thread aud_final_tank_exp_debris();
    wait 5;
    soundscripts\_audio_mix_manager::_id_5CF6( "t72_explode_mix" );
}

lastsequence_celebration_submix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_lastSequence", 0.8 );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_lastSequence_celebration", 0.8 );
}

seaknight_rescue_submix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_lastSequence_celebration", 0.8 );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_seaknight_rescue", 0.8 );
}

play_mi17_unload_ennemies( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_1, "targetname" );
    var_3 waittill( "trigger", var_5 );
    var_5 endon( "death" );
    var_5 vehicle_turnengineoff();
    var_5._id_799F = 1;
    var_5 thread handle_single_mi17_sequence_mix();
    var_5 thread maps\_utility::_id_69C6( "scn_mi17_unload_arrival_0" + var_2 );
    var_4 waittill( "trigger", var_5 );
    var_5 thread maps\_utility::_id_6976( "mi17_close_towards_lp", undefined, 1, 1, 0.5, 0.5 );
    var_5 waittill( "unloaded" );
    var_5 thread common_scripts\utility::_id_8EA1( "mi17_close_towards_lp" );
    var_5 thread maps\_utility::_id_69C6( "scn_mi17_unload_leaving_0" + var_2 );
}

start_mi17_sequence()
{
    thread play_mi17_unload_ennemies( "auto8", "auto1", 1 );
    thread play_mi17_unload_ennemies( "auto10", "auto2", 2 );
    wait 5;
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_mi17_reinforcement" );
}

handle_single_mi17_sequence_mix()
{
    var_0 = common_scripts\utility::_id_A070( "unloaded", "death" );
    wait 4;

    if ( !common_scripts\utility::_id_382E( "first_mi17_gone" ) )
        common_scripts\utility::_id_383F( "first_mi17_gone" );
    else
        soundscripts\_audio_mix_manager::_id_5CF6( "mix_mi17_reinforcement" );
}

abrams_audio_node()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );

    switch ( self.targetname )
    {
        case "auto33":
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_01" );
            break;
        case "auto34":
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_02" );
            break;
        case "auto70":
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_03" );
            break;
        case "auto73":
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_04" );
            break;
        case "auto76":
            common_scripts\utility::_id_383F( "abrams_stop_wait_for_player" );
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_04_crush_car" );
            break;
        case "auto87":
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_05" );
            break;
        case "auto88":
            common_scripts\utility::_id_383F( "abrams_stop_for_city_fight" );
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_06" );
            break;
        case "auto138":
            common_scripts\utility::_id_383F( "abrams_stop_for_city_fight" );
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_07" );
            break;
        case "auto183":
            common_scripts\utility::_id_383F( "abrams_stop_for_city_fight" );
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_08" );
            break;
        case "auto298":
            common_scripts\utility::_id_383F( "abrams_stop_for_city_fight" );
            play_abrams_idle_sound( var_0 );
            var_0 thread maps\_utility::_id_69C4( "bog_b_m1a1_tank_move_09" );
            break;
        case "tank_path_4":
            var_0 thread common_scripts\utility::_id_6975( "bog_b_m1a1_tank_idle" );
            break;
    }
}

play_abrams_idle_sound( var_0 )
{
    if ( isdefined( self._id_3C5B ) && !self._id_3C5B )
    {
        var_0 thread common_scripts\utility::_id_6975( "bog_b_m1a1_tank_idle" );

        for (;;)
        {
            if ( self._id_3C5B )
                break;

            wait 0.05;
        }

        var_0 thread common_scripts\utility::_id_8EA1( "bog_b_m1a1_tank_idle" );
    }
    else if ( common_scripts\utility::_id_382E( "abrams_stop_for_city_fight" ) )
    {
        var_0 thread common_scripts\utility::_id_6975( "bog_b_m1a1_tank_idle" );
        common_scripts\utility::_id_384A( "abrams_start_moving_after_city_fight" );
        var_0 thread common_scripts\utility::_id_8EA1( "bog_b_m1a1_tank_idle" );
        common_scripts\utility::_id_3831( "abrams_stop_for_city_fight" );
        common_scripts\utility::_id_3831( "abrams_start_moving_after_city_fight" );
    }
    else if ( common_scripts\utility::_id_382E( "abrams_stop_wait_for_player" ) )
    {
        var_0 thread common_scripts\utility::_id_6975( "bog_b_m1a1_tank_idle" );
        common_scripts\utility::_id_384A( "truck_crush_player_in_position" );
        var_0 thread common_scripts\utility::_id_8EA1( "bog_b_m1a1_tank_idle" );
        common_scripts\utility::_id_3831( "abrams_stop_wait_for_player" );
    }
}

aud_final_wall_exp_debris()
{
    soundscripts\_snd_playsound::_id_872E( "bog_b_final_wall_exp_debris", ( 4779.0, -3910.0, -16.0 ) );
}

aud_final_tank_exp_debris()
{
    soundscripts\_snd_playsound::_id_872E( "final_tank_exp_debris", ( 4859.0, -4353.0, 76.0 ) );
}

set_exterior_streamed_ambience( var_0 )
{
    soundscripts\_audio_zone_manager::_id_1239( "exterior_alley", var_0, 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "exterior_field", var_0, 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "exterior_city", var_0, 0.8 );
}
