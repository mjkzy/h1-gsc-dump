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
    thread toggle_breach_lightset_triggers();
    thread override_scriptmodel_lightorigins();
    thread handle_shield_dof();
    thread handle_jump_dof();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    maps\_utility::_id_9E6E( "airplane", 0 );
    level.player maps\_utility::set_light_set_player( "airplane" );
    level.player _meth_848C( "airplane", 0.0 );
}

toggle_breach_lightset_triggers()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
        return;

    var_0 = getent( "breach_blowout_trig", "targetname" );
    var_1 = getent( "breach_aftermath_trig", "targetname" );
    var_2 = getent( "breach_aftermath2_trig", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 common_scripts\utility::_id_97CC();
    var_2 common_scripts\utility::_id_97CC();
    level waittill( "fuselage_breached" );
    var_0 common_scripts\utility::_id_97CE();
    wait 0.8;
    var_0 common_scripts\utility::_id_97CC();
    var_1 common_scripts\utility::_id_97CE();

    if ( level.player istouching( var_1 ) )
        wait 0.3;

    var_1 common_scripts\utility::_id_97CC();
    var_2 common_scripts\utility::_id_97CE();
}

handle_shield_dof()
{
    wait 0.05;
    common_scripts\utility::_id_384A( "player_approach_human_shield" );
    maps\_cinematography::dyndof( "main" ) maps\_cinematography::dyndof_values( 3.2, 400, 5, 1 ) maps\_cinematography::dyndof_autofocus( 1 );
    thread maps\_cinematography::dyndof_system_start( 1 );
}

handle_jump_dof()
{
    wait 0.05;
    common_scripts\utility::_id_384A( "exit_door_blown" );
    maps\_cinematography::dyndof( "main" ) maps\_cinematography::dyndof_values( 2, 600, 5, 1 ) maps\_cinematography::dyndof_autofocus( 1 );
    thread maps\_cinematography::dyndof_system_start( 1 );
    var_0 = getent( "trig_exit_door", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "plane_shell", "targetname" );
    var_2 = maps\_cinematography::cinematic_sequence( "freefall" );
    var_2 maps\_cinematography::cinseq_key( "moving_out_door" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.6, 80, 10, 3 );
    var_2 maps\_cinematography::cinseq_key( "out_door" ) maps\_cinematography::cinseq_key_time( 1 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.6, 200, 10, 3 );
    var_2 maps\_cinematography::cinseq_key( "over_wing" ) maps\_cinematography::cinseq_key_time( 2 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.2, 150, 10, 3 );
    var_2 maps\_cinematography::cinseq_key( "focus_plane" ) maps\_cinematography::cinseq_key_time( 3 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.6, -1, 10, 3 ) maps\_cinematography::cinseq_key_dyndof_ref_ent( "main", var_1 ) maps\_cinematography::cinseq_key_lerp_fov( 60, 3 );
    var_2 maps\_cinematography::cinseq_start_sequence();
}

override_scriptmodel_lightorigins()
{
    common_scripts\utility::_id_76B9( "override_light_origin", ::set_new_lighting_origin );
    var_0 = getent( "door_light_origin_override", "script_noteworthy" );

    if ( isdefined( var_0 ) )
    {
        var_1 = getent( "right_door_model", "script_noteworthy" );
        var_2 = getent( "left_door_model", "script_noteworthy" );
        var_3 = [ var_1, var_2 ];

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5 ) )
                var_5 _meth_8477( var_0.origin );
        }
    }
}

set_new_lighting_origin()
{
    if ( isdefined( self.target ) && self.target != "" )
    {
        var_0 = getent( self.target, "targetname" );

        if ( isdefined( var_0 ) )
            self _meth_8477( var_0.origin );
    }
}
