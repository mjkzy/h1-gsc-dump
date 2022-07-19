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
    _id_7E68();
    setup_church_lighting();
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    level.default_clut = "clut_village_defend";
    level.default_lightset = "village_defend";
    level.default_visionset = "village_defend";
    thread handle_player_on_chopper_cinematic();
}

_id_4D05()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "village_defend", 0 );
    level.playercardbackground _id_A5A4::set_light_set_player( "village_defend" );
    level.playercardbackground _meth_848c( "clut_village_defend", 0.0 );
}

setup_church_lighting()
{
    var_0 = getent( "village_defend_church_light", "targetname" );
    var_1 = getentarray( "village_defend_church_models", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 _meth_8477( var_0.origin );
}

handle_player_on_chopper_cinematic()
{
    wait 0.05;
    common_scripts\utility::_id_384A( "seaknight_guards_boarding" );
    var_0 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0.pitch_scale = 0.9;
    var_0._id_A3B7 = 0.5;
    var_0.roll_scale = 0.2;
    var_0.duration = 7;
    var_0.duration_fade_up = 2;
    var_0.duration_fade_down = 4;
    var_0.frequency_pitch = 10;
    var_0.frequency_roll = 4;
    var_0.frequency_yaw = 2;
    var_1 = maps\_cinematography::cinematic_sequence( "heli_exfil" );
    var_1 maps\_cinematography::cinseq_key( "takeoff_shake" ) maps\_cinematography::cinseq_key_time( 10 ) maps\_cinematography::cinseq_key_screen_shake( var_0 );
    var_1 maps\_cinematography::cinseq_key( "begin_dof" ) maps\_cinematography::cinseq_key_time( 10.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 3.2, 400, 2, 0.5 ) maps\_cinematography::cinseq_key_start_dynamic_dof( 1 );
    var_1 maps\_cinematography::cinseq_key( "finalize_blur_out" ) maps\_cinematography::cinseq_key_time( 17.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 0.2, 75, 0.1, 0.1 );
    var_1 maps\_cinematography::cinseq_start_sequence();
}
