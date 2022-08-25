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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_launchfacility_a_global" );
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
    soundscripts\_snd::_id_874D( "start_container_checkpoint", ::start_container_checkpoint );
    soundscripts\_snd::_id_874D( "start_tarmac_checkpoint", ::start_tarmac_checkpoint );
    soundscripts\_snd::_id_874D( "start_gate_checkpoint", ::start_gate_checkpoint );
    soundscripts\_snd::_id_874D( "start_vents_checkpoint", ::start_vents_checkpoint );
    soundscripts\_snd::_id_874D( "start_gimme_sitrep_music_mix", ::start_gimme_sitrep_music_mix );
    soundscripts\_snd::_id_874D( "start_blow_the_gate_mix", ::start_blow_the_gate_mix );
    soundscripts\_snd::_id_874D( "start_tarmac_mix", ::start_tarmac_mix );
    soundscripts\_snd::_id_874D( "start_vents_mix", ::start_vents_mix );
    soundscripts\_snd::_id_874D( "start_rappel_mix", ::start_rappel_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_container_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_tarmac_checkpoint( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "tarmac_mix" );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_gate_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_vents_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
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
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_gimme_sitrep_music_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "gimme_sitrep_music_mix" );
}

start_blow_the_gate_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "gimme_sitrep_music_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "blow_the_gate_mix" );
}

start_tarmac_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "blow_the_gate_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "tarmac_mix" );
}

start_vents_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "tarmac_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "vents_mix" );
}

start_rappel_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "vents_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "rappel_mix" );
}

bmp_start_moving()
{
    thread common_scripts\utility::_id_8EA1( "bmp_idle_low" );
    thread common_scripts\utility::_id_6975( "bmp_engine_low", undefined, 0, 0.7 );
}

bmp_stop_moving()
{
    thread common_scripts\utility::_id_8EA1( "bmp_engine_low" );
    thread common_scripts\utility::_id_6975( "bmp_idle_low", undefined, 0.3, 0.7 );
}
