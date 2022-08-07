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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_aftermath_global" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_intro_stinger" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_intro_radio_vo" );
    soundscripts\_audio_zone_manager::_id_123A( "interior_vehicle" );
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
    soundscripts\_snd::_id_874D( "aud_start_mix_player_dying", ::aud_start_mix_player_dying );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_player_falls()
{
    soundscripts\_audio_zone_manager::_id_122C( 1 );
    soundscripts\_snd_filters::_id_86DB( "blur_event_filter", 0.5 );

    if ( !isdefined( level.heartbeat_ent ) )
    {
        level.heartbeat_ent = spawn( "script_origin", level.playercardbackground.origin );
        level.heartbeat_ent linkto( level.playercardbackground );
    }

    level.heartbeat_ent stoploopsound();
    level.playercardbackground playsound( "h1_heartbeat_fall" );
    level.playercardbackground thread maps\_utility::_id_69C4( "scn_player_fall_impact" );
}

aud_player_recover()
{
    soundscripts\_snd_filters::_id_86DC( 2 );
    soundscripts\_audio_zone_manager::_id_122C( 0 );
    level.playercardbackground thread maps\_utility::_id_69C4( "breathing_better" );
}

aud_player_dying_slowly()
{
    level waittill( "helicopterfall_bodysense" );
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_intro_radio_vo" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_player_dying_slowly" );
}

aud_start_mix_player_dying()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_player_dying_slowly" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_player_dying" );
    level.heartbeat_ent stoploopsound();
    level.playercardbackground thread maps\_utility::_id_69C4( "h1_aftermath_final_stinger_front" );
    level.playercardbackground thread maps\_utility::_id_69C4( "heartbeat_death" );
    level.playercardbackground thread common_scripts\utility::_id_8EA1( level.playerbreathalias );
    wait 0.1;
    level.heartbeat_ent delete();
}

aud_player_walking_foley( var_0 )
{
    if ( var_0 == "crouch" )
        level.playercardbackground maps\_utility::_id_27EF( 0.4, maps\_utility::_id_69C4, "step_prone_gravel_aftermath" );
    else if ( var_0 == "prone" )
        level.playercardbackground maps\_utility::_id_27EF( 0.4, maps\_utility::_id_69C4, "step_prone_plr_gravel_aftermath" );
    else
        level.playercardbackground maps\_utility::_id_27EF( 0.4, maps\_utility::_id_69C4, "step_crchwalk_plr_gravel_aftermath" );
}
