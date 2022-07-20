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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_launchfacility_b_global" );
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
    soundscripts\_snd::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    soundscripts\_snd::_id_874D( "start_warehouse_checkpoint", ::start_warehouse_checkpoint );
    soundscripts\_snd::_id_874D( "start_launchtubes_checkpoint", ::start_launchtubes_checkpoint );
    soundscripts\_snd::_id_874D( "start_vaultdoors_checkpoint", ::start_vaultdoors_checkpoint );
    soundscripts\_snd::_id_874D( "start_controlroom_checkpoint", ::start_controlroom_checkpoint );
    soundscripts\_snd::_id_874D( "start_escape_checkpoint", ::start_escape_checkpoint );
    soundscripts\_snd::_id_874D( "start_elevator_checkpoint", ::start_elevator_checkpoint );
    soundscripts\_snd::_id_874D( "start_hallway_combat_mix", ::hallway_fighting_mix );
    soundscripts\_snd::_id_874D( "start_missile_silo_mix", ::missile_silo_mix );
    soundscripts\_snd::_id_874D( "start_vault_doors_mix", ::vault_doors_mix );
    soundscripts\_snd::_id_874D( "start_control_room_mix", ::control_room_mix );
    soundscripts\_snd::_id_874D( "start_code_input_mix", ::code_input_mix );
    soundscripts\_snd::_id_874D( "start_escape_facility_mix", ::escape_facility_mix );
    soundscripts\_snd::_id_874D( "start_missile_stopped_mix", ::missile_stopped_mix );
    soundscripts\_snd::_id_874D( "mission_failed", ::mission_failed );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "silo" );
}

start_warehouse_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_stone" );
}

start_launchtubes_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_stone" );
}

start_vaultdoors_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_stone" );
}

start_controlroom_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "interior_stone" );
}

start_escape_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "computer_room" );
}

start_elevator_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "medium_room" );
}

hallway_fighting_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "hallway_fighting_mix" );
}

missile_silo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "hallway_fighting_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "missile_silo_mix" );
}

vault_doors_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "missile_silo_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "vault_doors_mix" );
}

control_room_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "vault_doors_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "control_room_mix" );
}

code_input_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "control_room_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "code_input_mix" );
}

missile_stopped_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "code_input_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "missile_stopped_mix" );
}

escape_facility_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "missile_stopped_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "escape_facility_mix" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "launch_fb_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "launch_fb_intro_mute" );
}

mission_failed()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "failure_mix" );
}
