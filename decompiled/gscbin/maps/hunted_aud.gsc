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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_hunted_global" );
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
    soundscripts\_snd::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    soundscripts\_snd::_id_874D( "snd_music_handler", ::_id_5FFD );
    soundscripts\_snd::_id_874D( "aud_start_default_checkpoint", ::aud_start_default_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_crash_checkpoint", ::aud_start_crash_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_path_checkpoint", ::aud_start_path_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_barn_checkpoint", ::aud_start_barn_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_field_checkpoint", ::aud_start_field_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_basement_checkpoint", ::aud_start_basement_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_farm_checkpoint", ::aud_start_farm_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_creek_checkpoint", ::aud_start_creek_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_greenhouse_checkpoint", ::aud_start_greenhouse_checkpoint );
    soundscripts\_snd::_id_874D( "aud_start_ac130_checkpoint", ::aud_start_ac130_checkpoint );
    soundscripts\_snd::_id_874D( "aud_set_exterior_level_1", ::aud_set_exterior_level_1 );
    soundscripts\_snd::_id_874D( "aud_set_exterior_level_2", ::aud_set_exterior_level_2 );
    soundscripts\_snd::_id_874D( "aud_heli_crashing", ::aud_heli_crashing );
    soundscripts\_snd::_id_874D( "aud_heli_crash_fade_out", ::aud_heli_crash_fade_out );
    soundscripts\_snd::_id_874D( "aud_heli_crash_fade_in", ::aud_heli_crash_fade_in );
    soundscripts\_snd::_id_874D( "aud_heli_slomo", ::aud_heli_slomo );
    soundscripts\_snd::_id_874D( "aud_heli_field_pass", ::aud_heli_field_pass );
    soundscripts\_snd::_id_874D( "aud_barnyard_sequence", ::aud_barnyard_sequence );
    soundscripts\_snd::_id_874D( "aud_ac130_sequence", ::aud_ac130_sequence );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_default_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_crash_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_path_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_barn_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_field_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_basement_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_farm_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_creek_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_greenhouse_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

aud_start_ac130_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::_id_123A( "exterior" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "hunted_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    soundscripts\_audio_mix_manager::_id_5CF6( "hunted_intro_mute", 2 );
    soundscripts\_audio_mix_manager::_id_5CF2( "helicopter_ride_mix" );
}

aud_heli_slomo()
{
    wait 0.4;
    soundscripts\_audio_mix_manager::_id_5CF6( "helicopter_ride_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "helicopter_slowmo_mix" );
    soundscripts\_snd_filters::_id_86DB( "scn_explosion_filter", 0.5 );
}

aud_heli_crashing()
{
    soundscripts\_snd_filters::_id_86DC( 0.1 );
    soundscripts\_audio_mix_manager::_id_5CF6( "helicopter_slowmo_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "helicopter_crashing_mix" );
}

aud_heli_crash_fade_out()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "helicopter_crashing_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "heli_crash_fade_out" );
}

aud_heli_crash_fade_in()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "heli_crash_fade_out" );
}

aud_heli_field_pass()
{
    soundscripts\_audio_mix_manager::_id_5CF2( "heli_field_pass_mix" );
}

aud_barnyard_sequence()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "heli_field_pass_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "barnyard_seq_mix" );
}

aud_ac130_sequence()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "barnyard_seq_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "ac130_destruction_mix" );
}

aud_set_exterior_level_0()
{
    soundscripts\_audio_zone_manager::_id_1239( "exterior", "ambient_hunted_ext0", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "tunnel", "ambient_hunted_ext0", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "interior_wood_open", "ambient_hunted_ext0", 0.8 );
}

aud_set_exterior_level_1()
{
    soundscripts\_audio_zone_manager::_id_1239( "exterior", "ambient_hunted_ext1", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "tunnel", "ambient_hunted_ext1", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "interior_wood_open", "ambient_hunted_ext1", 0.8 );
}

aud_set_exterior_level_2()
{
    soundscripts\_audio_zone_manager::_id_1239( "exterior", "ambient_hunted_ext2", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "tunnel", "ambient_hunted_ext2", 0.8 );
    soundscripts\_audio_zone_manager::_id_1239( "interior_wood_open", "ambient_hunted_ext2", 0.8 );
}
