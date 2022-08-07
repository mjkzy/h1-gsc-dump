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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_coup_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "music_part2" );
    common_scripts\utility::_id_383D( "music_part3" );
    common_scripts\utility::_id_383D( "music_part4" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread handle_heli_scripted_sfx();
    thread aud_first_bmp();
    thread aud_jeep_event();
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
    soundscripts\_snd::_id_874D( "start_intro_checkpoint", ::start_intro_checkpoint );
    soundscripts\_snd::_id_874D( "start_drive_checkpoint", ::start_drive_checkpoint );
    soundscripts\_snd::_id_874D( "start_doorkick_checkpoint", ::start_doorkick_checkpoint );
    soundscripts\_snd::_id_874D( "start_trashstumble_checkpoint", ::start_trashstumble_checkpoint );
    soundscripts\_snd::_id_874D( "start_runners2_checkpoint", ::start_runners2_checkpoint );
    soundscripts\_snd::_id_874D( "start_alley_checkpoint", ::start_alley_checkpoint );
    soundscripts\_snd::_id_874D( "start_shore_checkpoint", ::start_shore_checkpoint );
    soundscripts\_snd::_id_874D( "start_carexit_checkpoint", ::start_carexit_checkpoint );
    soundscripts\_snd::_id_874D( "start_ending_checkpoint", ::start_ending_checkpoint );
    soundscripts\_snd::_id_874D( "aud_coup_car_open", ::aud_coup_car_open );
    soundscripts\_snd::_id_874D( "aud_coup_enter_car", ::aud_coup_enter_car );
    soundscripts\_snd::_id_874D( "aud_coup_exit_car", ::aud_coup_exit_car );
    soundscripts\_snd::_id_874D( "aud_coup_car_thrown_out", ::aud_coup_car_thrown_out );
    soundscripts\_snd::_id_874D( "aud_exterior_to_bunker", ::aud_exterior_to_bunker );
    soundscripts\_snd::_id_874D( "aud_bunker_to_exterior", ::aud_bunker_to_exterior );
    soundscripts\_snd::_id_874D( "start_slowmo_mix", ::start_slowmo_mix );
    soundscripts\_snd::_id_874D( "stop_slowmo_mix", ::stop_slowmo_mix );
    soundscripts\_snd::_id_874D( "start_coup_player_death_mix", ::start_coup_player_death_mix );
    soundscripts\_snd::_id_874D( "aud_add_stunned_car_event", ::aud_add_stunned_car_event );
    soundscripts\_snd::_id_874D( "aud_stop_stunned_car_event", ::aud_stop_stunned_car_event );
    soundscripts\_snd::_id_874D( "aud_car_sound_node_spawner", ::aud_car_sound_node_spawner );
    soundscripts\_snd::_id_874D( "aud_shutoff_engine", ::aud_shutoff_engine );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_intro_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

start_drive_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_doorkick_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_trashstumble_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_runners2_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_alley_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_shore_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_carexit_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
}

start_ending_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "coup_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "coup_intro_mute", 1 );
}

aud_coup_enter_car()
{
    soundscripts\_audio_zone_manager::_id_123B( "exterior", 0.3 );
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle", 0.3 );
}

aud_coup_exit_car()
{
    soundscripts\_audio_zone_manager::_id_123B( "interior_vehicle", 0.3 );
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle_open", 0.3 );
}

aud_coup_car_open()
{
    soundscripts\_audio_zone_manager::_id_123B( "exterior", 0.3 );
    soundscripts\_audio_zone_manager::_id_123B( "interior_vehicle", 0.3 );
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle_open", 0.3 );
}

aud_coup_car_thrown_out()
{
    soundscripts\_audio_zone_manager::_id_123B( "interior_vehicle_open", 0.3 );
    soundscripts\_audio_zone_manager::_id_123A( "exterior", 0.3 );
}

aud_exterior_to_bunker()
{
    soundscripts\_audio_zone_manager::_id_123B( "exterior", 0.3 );
    soundscripts\_audio_zone_manager::_id_123A( "bunker", 0.3 );
}

aud_bunker_to_exterior()
{
    soundscripts\_audio_zone_manager::_id_123B( "bunker", 5.5 );
    soundscripts\_audio_zone_manager::_id_123A( "exterior", 5.5 );
}

start_slowmo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "dead_man_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "slowmo_mix" );
}

stop_slowmo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "slowmo_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "getting_shot_mix" );
}

start_coup_player_death_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "getting_shot_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "coup_player_death_mix" );
}

aud_add_stunned_car_event()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "stunned_car_mix" );
}

aud_stop_stunned_car_event()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "stunned_car_mix" );
}

aud_curb_stomp_event()
{
    wait 0.7;
    soundscripts\_audio_mix_manager::_id_5CF6( "engine_shutoff_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "curb_stomp_mix" );
    wait 2.5;
    soundscripts\_audio_mix_manager::_id_5CF6( "curb_stomp_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "dead_man_mix" );
}

handle_heli_scripted_sfx()
{
    var_0 = common_scripts\utility::_id_40FB( "auto2187", "targetname" );
    var_1 = common_scripts\utility::_id_40FB( "auto2712", "targetname" );
    var_2 = common_scripts\utility::_id_40FB( "auto2718", "targetname" );
    var_3 = common_scripts\utility::_id_40FB( "auto2601", "targetname" );
    var_0 thread heli_scripted_sfx( "scn_hind_passby_01", "unloaded" );
    var_1 thread heli_scripted_sfx( "scn_hind_passby_02" );
    var_2 thread heli_scripted_sfx( "scn_hind_passby_03" );
    var_3 thread heli_scripted_sfx( "scn_hind_passby_04", "unloaded" );
    var_4 = getent( "alleyway_hind1_trigger", "targetname" );
    var_4 thread three_heli_passby_trig( "scn_alleyway_hind1_0" );
    var_5 = getent( "alleyway_hind2_trigger", "targetname" );
    var_5 thread three_heli_passby_trig( "scn_alleyway_hind2_0" );
}

heli_scripted_sfx( var_0, var_1 )
{
    self waittill( "trigger", var_2 );

    if ( isdefined( var_1 ) )
        var_2 waittill( var_1 );

    var_2 play_helicopter_scripted_sfx( var_0 );
}

three_heli_passby_trig( var_0 )
{
    var_1 = self._id_7B1A;
    self waittill( "trigger", var_2 );
    wait 0.1;
    var_3 = maps\_utility::_id_4153();
    var_4 = 1;

    foreach ( var_6 in var_3 )
    {
        if ( var_6.classname == "script_vehicle_mi24p_hind_desert" && isdefined( var_6._id_7B1A ) && var_6._id_7B1A == var_1 )
        {
            var_6 play_helicopter_scripted_sfx( var_0 + var_4 );
            var_4++;
        }
    }
}

aud_jeep_event()
{
    var_0 = getvehiclenode( "auto2734", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread maps\_utility::_id_69C4( "scn_coup_jeep_hard_turn" );
}

play_helicopter_scripted_sfx( var_0 )
{
    self._id_799F = 1;
    self vehicle_turnengineoff();
    thread maps\_utility::_id_69C4( var_0 );
}

aud_car_sound_node_spawner()
{
    level.car_move_engine_sound_node = spawn( "script_origin", level.car.origin );
    level.car_idle_engine_sound_node = spawn( "script_origin", level.car.origin );
    level.car_move_engine_sound_node linkto( level.car );
    level.car_idle_engine_sound_node linkto( level.car );
}

aud_car_event_handler( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_5 ) )
        soundscripts\_audio_mix_manager::_id_5CF2( var_5 );

    thread aud_car_engine_idle_handler( var_0, var_1, var_2, var_3, var_4 );
    self scalepitch( var_0, var_1 );
    wait(var_2 + var_1);
    self scalepitch( var_3, var_4 );
    wait(var_4);

    if ( isdefined( var_5 ) )
        soundscripts\_audio_mix_manager::_id_5CF6( var_5 );
}

aud_car_engine_idle_handler( var_0, var_1, var_2, var_3, var_4 )
{
    level.car_idle_engine_sound_node scalevolume( 0, 0 );
    waittillframeend;
    level.car_idle_engine_sound_node playloopsound( "scn_coup_car_idle_engine" );
    level.car_idle_engine_sound_node scalevolume( 0.71, var_1 );
    level.car_idle_engine_sound_node scalepitch( var_0, var_1 );
    wait(var_2 + var_1);
    level.car_idle_engine_sound_node scalevolume( 0, var_4 );
    level.car_idle_engine_sound_node scalepitch( var_3, var_4 );
    wait(var_4);
    level.car_idle_engine_sound_node stoploopsound( "scn_coup_car_idle_engine" );
}

aud_play_engine( var_0, var_1 )
{
    self playsound( "scn_coup_car_move_engine_" + var_1 );
}

aud_stop_engine( var_0, var_1 )
{
    self scalevolume( 0, var_1 );
    wait(var_1);
    self _meth_854d( "scn_coup_car_move_engine_" + var_0 );
    self scalevolume( 1, 1 );
}

aud_shutoff_engine()
{
    wait 1.0;
    soundscripts\_audio_mix_manager::_id_5CF2( "engine_shutoff_mix" );
    level.car_move_engine_sound_node playsound( "scn_coup_engine_shutoff" );
    level.car_move_engine_sound_node thread aud_stop_engine( "02", 1 );
}

aud_music_handler()
{
    maps\_utility::_id_6008( "music_coup_intro_01" );
    common_scripts\utility::_id_384A( "music_part2" );
    wait 1.5;
    maps\_utility::_id_6005( 1.0 );
    maps\_utility::_id_6008( "music_coup_intro_02" );
    common_scripts\utility::_id_384A( "music_part3" );
    wait 8.0;
    maps\_utility::_id_5FFC( "music_coup_intro_03", 1.0 );
    common_scripts\utility::_id_384A( "music_part4" );
    wait 1.5;
    maps\_utility::_id_6005( 1.0 );
    maps\_utility::_id_6008( "music_coup_intro_04" );
}

aud_first_bmp()
{
    var_0 = getvehiclenode( "auto707", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread maps\_utility::_id_69C4( "scn_coup_first_bmp" );
}
