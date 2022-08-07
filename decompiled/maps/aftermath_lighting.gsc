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
    _id_4D05();
    level.cheat_invert_override = "_bright";
    thread _id_80C6();
    thread _id_7E68();

    if ( getdvarint( "no_cinematic_fx" ) != 1 )
    {
        thread player_dof_attenuation();
        thread handle_building_collapses();
    }
}

_id_4D05()
{
    common_scripts\utility::_id_383D( "player_blur" );
}

_id_80C6()
{
    if ( getdvarint( "no_cinematic_fx" ) != 1 )
        return;
}

player_dof_attenuation()
{
    wait 18.5;
    maps\_cinematography::dyndof( "constant_fallout" ) maps\_cinematography::dyndof_values( 1.7, 140, 1.2, 0.6 ) maps\_cinematography::dyndof_autofocus( 1 );
    maps\_cinematography::dyndof_system_start( 1 );
    var_0 = maps\_cinematography::cinematic_sequence( "constant_blur" );
    var_0 maps\_cinematography::cinseq_key( "begin_blur" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_values( "constant_fallout", 1.2, 140, 1.4, 0.6 );
    var_0 maps\_cinematography::cinseq_key( "end_blur" ) maps\_cinematography::cinseq_key_time( 2 ) maps\_cinematography::cinseq_key_dyndof_values( "constant_fallout", 1.7, 180, 1.4, 0.6 );

    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( "collapse" ) )
        {
            var_0 maps\_cinematography::cinseq_key( "end_blur" ) maps\_cinematography::cinseq_key_time( randomfloatrange( 2, 4 ) );
            var_0 maps\_cinematography::cinseq_start_sequence();
            wait(randomfloatrange( 2, 3 ));
            continue;
        }

        wait 0.1;
    }
}

scale_value( var_0, var_1, var_2 )
{
    return ( var_1 - var_0 ) * var_2 + var_0;
}

player_random_blur()
{
    wait 15;
    maps\_cinematography::dyndof( "fainting_blur" ) maps\_cinematography::dyndof_values( 0.4, 1, 10, 1 );
    var_0 = maps\_cinematography::cinematic_sequence( "chopper_blur" );
    var_1 = var_0 maps\_cinematography::cinseq_key( "start_blur" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_values( "fainting_blur", 4.5, 25, 0.4, 0.2 ) maps\_cinematography::cinseq_key_lerp_fov( 64, 1.5 );
    var_1 maps\_cinematography::cinseq_key_dyndof_priority( "fainting_blur", 1 ) maps\_cinematography::cinseq_key_gauss_blur( 1.5, 2 );
    var_0 maps\_cinematography::cinseq_key( "slow_fov" ) maps\_cinematography::cinseq_key_time( 1 ) maps\_cinematography::cinseq_key_lerp_fov( 63.5, 1.5 );
    var_0 maps\_cinematography::cinseq_key( "end_blur" ) maps\_cinematography::cinseq_key_time( 3.5 ) maps\_cinematography::cinseq_key_dyndof_priority( "fainting_blur", -1 );
    var_0 maps\_cinematography::cinseq_key( "finalize_fov" ) maps\_cinematography::cinseq_key_time( 4 ) maps\_cinematography::cinseq_key_lerp_fov_default( 2.5 ) maps\_cinematography::cinseq_key_gauss_blur( 0.25, 2 );
    wait(randomfloatrange( 0.25, 0.75 ));

    while ( !common_scripts\utility::_id_382E( "building_collapse_back" ) && !common_scripts\utility::_id_382E( "building_collapse_side" ) )
    {
        common_scripts\utility::_id_383F( "player_blur" );
        var_2 = randomfloatrange( 0.5, 1.5 );
        var_0 maps\_cinematography::cinseq_key( "end_blur" ) maps\_cinematography::cinseq_key_time( 2.5 + var_2 );
        var_0 maps\_cinematography::cinseq_key( "finalize_fov" ) maps\_cinematography::cinseq_key_time( 3 + var_2 );
        var_0 maps\_cinematography::cinseq_start_sequence();
        common_scripts\utility::_id_3831( "player_blur" );
        wait(randomfloatrange( 4, 10 ));
    }

    thread player_fallen();
}

handle_building_collapses()
{
    wait 0.05;
    maps\_cinematography::dyndof( "building_view" ) maps\_cinematography::dyndof_values( 3.2, 2500, 6, 0.1 ) maps\_cinematography::dyndof_priority( -1 );
    var_0 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0.duration = 4;
    var_0.duration_fade_down = 2;
    var_0.duration_fade_up = 0.75;
    var_0.pitch_scale = 0.2;
    var_0._id_A3B7 = 0.17;
    var_0.roll_scale = 0.11;
    var_0.frequency_pitch = 9;
    var_0.frequency_yaw = 15;
    var_0.frequency_roll = 12;
    var_1 = [];

    for ( var_2 = 1; var_2 <= 5; var_2++ )
    {
        var_1[var_2] = maps\_cinematography::cinematic_sequence( "building_collapse_" + var_2 );
        var_3 = var_1[var_2] maps\_cinematography::cinseq_key( "set_dof" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_priority( "building_view", 10 );
        var_4 = var_1[var_2] maps\_cinematography::cinseq_key( "camera_shake" ) maps\_cinematography::cinseq_key_time( 0.4 ) maps\_cinematography::cinseq_key_screen_shake( var_0 );
        var_3 = var_1[var_2] maps\_cinematography::cinseq_key( "remove_dof" ) maps\_cinematography::cinseq_key_time( 2 ) maps\_cinematography::cinseq_key_dyndof_priority( "building_view", -2 );
    }

    for (;;)
    {
        var_5 = 0;
        level waittill( "building_collapse", var_5 );

        if ( var_5 > 0 && var_5 <= 5 )
            var_1[var_5] maps\_cinematography::cinseq_start_sequence();
    }
}

player_fallen()
{
    common_scripts\utility::_id_3857( "collapse" );
    maps\_cinematography::dyndof( "constant_fallout" ) maps\_cinematography::dyndof_values( 1.8, 200, 1.4, 0.6 );
    setblur( 0, 0 );
}

_id_7E68()
{
    maps\_utility::_id_9E6E( "aftermath", 0 );
    level.playercardbackground maps\_utility::set_light_set_player( "aftermath" );
    level.playercardbackground _meth_848c( "clut_h1_aftermath", 0.0 );
    thread set_level_lighting_default();
    thread set_level_lighting_pain();
    thread set_level_lighting_glow();
    enableouterspacemodellighting( ( 10000.0, 10000.0, 10000.0 ), ( 0.5, 0.5, 0.5 ) );
}

set_level_lighting_default()
{
    for (;;)
    {
        level waittill( "aftermath_lighting_default", var_0 );
        level.playercardbackground maps\_utility::set_light_set_player( "aftermath" );
        level.playercardbackground _meth_848c( "clut_h1_aftermath", var_0 );
    }
}

set_level_lighting_pain()
{
    for (;;)
    {
        level waittill( "aftermath_lighting_pain", var_0 );
        level.playercardbackground maps\_utility::set_light_set_player( "aftermath" );
        level.playercardbackground _meth_848c( "clut_h1_aftermath_pain", var_0 );
        var_1 = maps\_cinematography::cinseq_create_screen_shake_struct();
        var_1.duration = 1;
        var_1.duration_fade_down = 0.6;
        var_1.duration_fade_up = 0;
        var_1.pitch_scale = 2;
        var_1._id_A3B7 = 1.8;
        var_1.roll_scale = 1.1;
        var_1.frequency_pitch = 10;
        var_1.frequency_yaw = 15;
        var_1.frequency_roll = 12;
        var_2 = maps\_cinematography::cinematic_sequence( "fall_to_ground" );
        var_3 = var_2 maps\_cinematography::cinseq_key( "impact" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_priority( "fall_dof", 10 ) maps\_cinematography::cinseq_key_dyndof_values( "fall_dof", 0.2, 5, 20, 5 );
        var_3 maps\_cinematography::cinseq_key_screen_shake( var_1 );
        var_2 maps\_cinematography::cinseq_key( "remove_blur" ) maps\_cinematography::cinseq_key_time( 2 ) maps\_cinematography::cinseq_key_dyndof_priority( "fall_dof", 10 ) maps\_cinematography::cinseq_key_dyndof_values( "fall_dof", 6.4, 800, 0.5, 5 );
        var_2 maps\_cinematography::cinseq_key( "blur_gone" ) maps\_cinematography::cinseq_key_time( 4 ) maps\_cinematography::cinseq_key_remove_dyndof( "fall_dof" );
        var_2 maps\_cinematography::cinseq_start_sequence();
        return;
    }
}

set_level_lighting_glow()
{
    for (;;)
    {
        level waittill( "aftermath_lighting_glow", var_0 );
        level.playercardbackground maps\_utility::set_light_set_player( "aftermath_glow" );
        level.playercardbackground _meth_848c( "clut_h1_aftermath_glow", var_0 );
    }
}
