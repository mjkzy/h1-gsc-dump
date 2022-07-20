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
    thread _id_80C6();
    thread _id_7E68();
    thread handle_church_explosion();
    level.default_clut = "clut_scoutsniper";
    level.default_lightset = "scoutsniper";
    level.default_visionset = "scoutsniper";
    thread handle_intro_cinematics();
    thread handle_ghillie_wibble();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_9E6E( "scoutsniper", 0 );
    level.playercardbackground maps\_utility::set_light_set_player( "scoutsniper" );
    level.playercardbackground _meth_848c( "clut_scoutsniper", 0.0 );
    setsaveddvar( "sm_sunShadowScale", "0.7" );
}

handle_ghillie_wibble()
{
    var_0 = 0.5;
    var_1 = 1;
    _func_2e8( 0, "x", var_0 );
    _func_2e8( 0, "y", var_1 );
}

handle_intro_cinematics()
{
    common_scripts\utility::_id_384A( "intro" );

    if ( getdvarint( "scoutsniper_use_pre_h1_intro" ) == 1 )
    {
        intro_blur_pre_h1();
        return;
    }

    wait 1;
    var_0 = maps\_cinematography::cinematic_sequence( "intro" );
    var_0 maps\_cinematography::cinseq_key( "init" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 0.2, 10, 1, 0.2 ) maps\_cinematography::cinseq_key_lerp_fov( 63, 0 ) maps\_cinematography::cinseq_key_start_dynamic_dof( 1 );
    var_0 maps\_cinematography::cinseq_key( "resolve_in" ) maps\_cinematography::cinseq_key_time( 3.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.2, 50, 2, 0.1 ) maps\_cinematography::cinseq_key_lerp_fov( 63.5, 2 );
    var_0 maps\_cinematography::cinseq_key( "fast_lerp" ) maps\_cinematography::cinseq_key_time( 5.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 3.2, 100, 0.6, 0.5 ) maps\_cinematography::cinseq_key_lerp_fov( 64.5, 3 );
    var_0 maps\_cinematography::cinseq_key( "focus_out_to_scene" ) maps\_cinematography::cinseq_key_time( 7.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 5, 300, 2, 1 ) maps\_cinematography::cinseq_key_lerp_fov_default( 4 );
    var_0 maps\_cinematography::cinseq_key( "remove_dof" ) maps\_cinematography::cinseq_key_time( 10 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 32, 600, 1, 2 );
    var_0 maps\_cinematography::cinseq_key( "end" ) maps\_cinematography::cinseq_key_time( 13 ) maps\_cinematography::cinseq_key_remove_dyndof( "main" ) maps\_cinematography::cinseq_key_end_dynamic_dof();
    var_0 maps\_cinematography::cinseq_start_sequence();
}

intro_blur_pre_h1()
{
    maps\_utility::_id_27EF( 1, maps\_utility::_id_7DE2, 4.8, 0.25 );
    maps\_utility::_id_27EF( 4, maps\_utility::_id_7DE2, 0, 3 );
}

handle_church_explosion()
{
    for (;;)
    {
        level waittill( "church_explosion_player_screen_fx" );
        level.playercardbackground shellshock( "scoutsniper_church_explo", 3 );
    }
}
