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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_village_assault_global" );
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
    soundscripts\_snd::_id_874D( "start_town_checkpoint", ::start_town_checkpoint );
    soundscripts\_snd::_id_874D( "start_alasad_barn_checkpoint", ::start_alasad_barn_checkpoint );
    soundscripts\_snd::_id_874D( "start_alasad_house_checkpoint", ::start_alasad_house_checkpoint );
    soundscripts\_snd::_id_874D( "increase_ambient", ::increase_ambient );
    soundscripts\_snd::_id_874D( "settle_ambient", ::settle_ambient );
    soundscripts\_snd::_id_874D( "start_air_support_mix", ::start_air_support_mix );
    soundscripts\_snd::_id_874D( "stop_air_support_mix", ::stop_air_support_mix );
    soundscripts\_snd::_id_874D( "start_interrogationA_black_screen_mix", ::start_interrogationa_black_screen_mix );
    soundscripts\_snd::_id_874D( "start_interrogation_mix", ::start_interrogation_mix );
    soundscripts\_snd::_id_874D( "start_interrogationA_mix", ::start_interrogationa_mix );
    soundscripts\_snd::_id_874D( "start_interrogationB_black_screen_mix", ::start_interrogationb_black_screen_mix );
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

start_town_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_alasad_barn_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

start_alasad_house_checkpoint( var_0 )
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
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", "ambient_village_assault_ext2", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "trainstation_attic", "ambient_village_assault_ext2", 0.8 );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

increase_ambient()
{
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", "ambient_village_assault_ext3", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_dynamic_ambience( "exterior", "exterior3", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "trainstation_attic", "ambient_village_assault_ext3", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_dynamic_ambience( "trainstation_attic", "exterior3", 0.8 );
}

settle_ambient()
{
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", "ambient_village_assault_ext1", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_dynamic_ambience( "exterior", "exterior1", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "trainstation_attic", "ambient_village_assault_ext1", 0.8 );
    soundscripts\_audio_zone_manager::azm_set_zone_dynamic_ambience( "trainstation_attic", "exterior1", 0.8 );
}

start_air_support_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "air_support_mix" );
}

stop_air_support_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "air_support_mix" );
}

start_interrogation_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "interrogation_mix" );
}

start_interrogationa_black_screen_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "interrogationA_black_screen_mix" );
}

start_interrogationa_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "interrogationA_black_screen_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "interrogationA_mix" );
}

start_interrogationb_black_screen_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "interrogationA_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "interrogationB_black_screen_mix" );
}
