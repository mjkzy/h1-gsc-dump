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
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
    level thread sun_rise_handling_init();
    level.nightvisionlightset = "icbm_nightvision";
    _func_144( "icbm_nightvision" );
}

_id_4D05()
{
    common_scripts\utility::_id_383D( "stop_snow" );
}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "icbm", 0 );
    level.playercardbackground _id_A5A4::set_light_set_player( "icbm" );
    level.playercardbackground _meth_848c( "clut_icbm", 0.0 );
}

sun_rise_handling_init()
{
    level waittill( "setup_initial_level_lighting" );
    thread set_interior_vision();
    level.sunriseinterpcolors = [];
    init_sun_color( "sun", ( 0.1, 0.1, 0.1 ) );
    set_exterior_vision_and_light_set( "icbm_sunrise0", "icbm", 0.05 );
    var_0 = getent( "sunrise2", "targetname" );
    var_1 = getent( "sunrise3", "targetname" );
    var_2 = getent( "sunrise4", "targetname" );
    var_0.invisible = 60;
    var_1.invisible = 20;
    var_2.invisible = 20;
    thread handle_sunrise2_colors();
    wait 0.05;
    _id_A5A4::_id_9E6E( "icbm_sunrise0", 0 );
    level.playercardbackground _meth_848c( "clut_icbm_sunrise0", 0.0 );
    thread sunrise_lerp_loop();
}

handle_sunrise2_colors()
{
    var_0 = getent( "sunrise2", "targetname" );
    var_0 waittill( "trigger" );
    setsaveddvar( "sm_sunEnable", 1 );
    setsaveddvar( "sm_spotEnable", 1 );
    var_1 = var_0.invisible;
    sun_set_lerp_parameters( "sun", _id_A5A4::vector_multiply( ( 1, 0.65, 0.4 ), 1 ), var_1 );
    level.playercardbackground _meth_848c( "clut_icbm_sunrise2", var_1 );
    set_exterior_vision_and_light_set( "icbm_sunrise2", "icbm_sunrise_02", var_1 );
    thread stop_snow();
    thread handle_sunrise3_colors();
}

set_global_sunrise2()
{
    set_exterior_vision_and_light_set( "icbm_sunrise2", "icbm_sunrise_02", 2 );
}

skip_to_sunrise2()
{
    var_0 = getent( "sunrise2", "targetname" );
    wait 0.1;
    var_0.invisible = 0.05;
    var_0 notify( "trigger" );
}

stop_snow()
{
    common_scripts\utility::_id_383F( "stop_snow" );
}

remove_cloud_cover()
{
    var_0 = _id_A5A4::_id_3FA9( "cloud_cover" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();
}

handle_sunrise3_colors()
{
    var_0 = getent( "sunrise3", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = var_0.invisible;
    sun_set_lerp_parameters( "sun", _id_A5A4::vector_multiply( ( 1, 0.8, 0.6 ), 1 ), var_1 );
    set_exterior_vision_and_light_set( "icbm_sunrise3", "icbm_sunrise_03", var_1 );
    level.playercardbackground _meth_848c( "clut_icbm_sunrise3", var_1 );
    thread handle_sunrise4_colors();
}

skip_to_sunrise3()
{
    var_0 = getent( "sunrise2", "targetname" );
    var_1 = getent( "sunrise3", "targetname" );
    var_0.invisible = 0.05;
    var_1.invisible = 0.05;
    wait 0.1;
    var_0 notify( "trigger" );
    wait 0.1;
    var_1 notify( "trigger" );
}

handle_sunrise4_colors()
{
    var_0 = getent( "sunrise4", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = var_0.invisible;
    sun_set_lerp_parameters( "sun", _id_A5A4::vector_multiply( ( 1, 1, 1 ), 1 ), var_1 );
    set_exterior_vision_and_light_set( "icbm_sunrise4", "icbm_sunrise_04", var_1 );
    level.playercardbackground _meth_848c( "clut_icbm_sunrise4", var_1 );
}

skip_to_sunrise4()
{
    var_0 = getent( "sunrise2", "targetname" );
    var_1 = getent( "sunrise3", "targetname" );
    var_2 = getent( "sunrise4", "targetname" );
    var_0.invisible = 0.05;
    var_1.invisible = 0.05;
    var_2.invisible = 0.05;
    wait 0.1;
    var_0 notify( "trigger" );
    wait 0.1;
    var_1 notify( "trigger" );
    wait 0.1;
    var_2 notify( "trigger" );
}

launchvision()
{
    wait 5;
    thread handle_launch_cinematic_effects();
    level.playercardbackground _id_A5A4::set_light_set_player( "icbm_launch" );
    _id_A5A4::_id_9E6E( "icbm_launch", 0.5 );
    level.playercardbackground _meth_848c( "clut_icbm_launch", 0.5 );
    wait 2;
    _id_A5A4::_id_9E6E( "icbm_sunrise4", 5 );
    level.playercardbackground _id_A5A4::set_light_set_player( "icbm_sunrise_04" );
    level.playercardbackground _meth_848c( "clut_icbm_sunrise4", 5 );
    level notify( "missile_vision_done" );
}

handle_launch_cinematic_effects()
{
    var_0 = getent( "icbm_missile01", "targetname" );
    var_1 = getent( "icbm_missile02", "targetname" );
    maps\_cinematography::dyndof( "missile" ) maps\_cinematography::dyndof_values( 0.2, -1, 10, 1 ) maps\_cinematography::dyndof_reference_entity( var_0 ) maps\_cinematography::dyndof_angles( -15, 15 ) maps\_cinematography::dyndof_view_model_fstop_scale( 200 );
    maps\_cinematography::dyndof( "missile2" ) maps\_cinematography::dyndof_values( 0.2, -1, 10, 1 ) maps\_cinematography::dyndof_reference_entity( var_1 ) maps\_cinematography::dyndof_angles( -15, 15 ) maps\_cinematography::dyndof_view_model_fstop_scale( 200 );
    maps\_cinematography::dyndof( "everywhere_else" ) maps\_cinematography::dyndof_values( 10, 1200, 5, 1 ) maps\_cinematography::dyndof_autofocus( 1 );
    maps\_cinematography::dyndof_system_start( 1 );
    level waittill( "missile_vision_done" );
    maps\_cinematography::dyndof_system_end();
}

set_interior_vision()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "player_is_inside" );
        _id_A5A4::_id_7F00( "icbm_village_interior", 2 );
        _id_A5A4::_id_9E6E( "icbm_village_interior", 2 );
        level.playercardbackground _id_A5A4::set_light_set_player( "icbm_village_interior" );
        common_scripts\utility::_id_3857( "player_is_inside" );
        _id_A5A4::_id_7F00( level.outside_vision_set, 2 );
        _id_A5A4::_id_9E6E( level.outside_vision_set, 6 );
        level.playercardbackground _id_A5A4::set_light_set_player( level.outside_light_set );
    }
}

lerp_sun_color( var_0, var_1 )
{
    var_2 = level.sunriseinterpcolors[var_0];
    var_2["timePassed"] += var_1;

    if ( var_2["timePassed"] >= var_2["timeTotal"] )
        var_2["timePassed"] = var_2["timeTotal"];

    var_3 = var_2["start"];
    var_4 = var_2["target"];
    var_5 = var_2["timePassed"] / var_2["timeTotal"];
    var_2["current"] = _id_A5A4::vector_multiply( var_3, 1 - var_5 ) + _id_A5A4::vector_multiply( var_4, var_5 );
    level.sunriseinterpcolors[var_0] = var_2;
    return var_2["current"];
}

set_exterior_vision_and_light_set( var_0, var_1, var_2 )
{
    level.outside_vision_set = var_0;
    level.outside_light_set = var_1;

    if ( !level.playerisinside )
    {
        _id_A5A4::_id_7F00( level.outside_vision_set, var_2 );
        _id_A5A4::_id_9E6E( level.outside_vision_set, var_2 );
        level.playercardbackground _id_A5A4::set_light_set_player( level.outside_light_set );
    }
}

init_sun_color( var_0, var_1 )
{
    var_2["start"] = var_1;
    var_2["target"] = var_1;
    var_2["current"] = var_1;
    var_2["timePassed"] = 0;
    var_2["timeTotal"] = 1;
    level.sunriseinterpcolors[var_0] = var_2;
}

sun_set_lerp_parameters( var_0, var_1, var_2 )
{
    var_3 = level.sunriseinterpcolors[var_0];
    var_3["start"] = var_3["current"];
    var_3["target"] = var_1;
    var_3["timePassed"] = 0;
    var_3["timeTotal"] = var_2;
    level.sunriseinterpcolors[var_0] = var_3;
}

sunrise_lerp_loop()
{
    var_0 = 0.05;

    for (;;)
    {
        var_1 = lerp_sun_color( "sun", var_0 );
        setsunlight( var_1[0], var_1[1], var_1[2] );
        wait(var_0);
    }
}

beautiful_corner_lighting()
{
    level notify( "setup_initial_level_lighting" );
    var_0 = getdvar( "start" );
    wait 0.1;

    switch ( var_0 )
    {
        case "house2":
        case "rescued":
        case "tower":
        case "fense":
            skip_to_sunrise2();
            break;
        case "base":
        case "base2":
            skip_to_sunrise3();
            break;
        case "launch":
            skip_to_sunrise4();
            break;
    }
}
