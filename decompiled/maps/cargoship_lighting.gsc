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
    precache_lighting_and_fx();
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
    thread generic_lights_flickering();
    setup_lighting_triggers();
    setup_lights_triggers();
    thread init_emergency_lights();
    thread explosion_lerping();
}

precache_lighting_and_fx()
{
    precacheshader( "overlay_hunted_red" );
    precacheshader( "overlay_hunted_black" );
    precacheshader( "credits_iw_presents" );
    precacheshader( "credits_cod4" );
}

_id_4D05()
{

}

_id_80C6()
{

}

setup_lighting_triggers()
{
    var_0 = getentarray( "script_lightset_change", "targetname" );
    common_scripts\utility::array_thread( var_0, ::lighting_trigger_think );
}

lighting_trigger_think()
{
    if ( !isdefined( self.script_noteworthy ) )
        return;

    if ( self.script_noteworthy == "special" )
    {
        thread special_lighting_trigger_think();
        return;
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( self.script_noteworthy != level.current_light_set )
            apply_lighting_pass_cargoship( self.script_noteworthy );
    }
}

_id_7E68()
{
    setsaveddvar( "sm_sunSampleSizeNear", ".5" );
    setsaveddvar( "r_specularColorScale", "3" );
    setsaveddvar( "sm_cacheSpotShadowsEnabled", 0 );
    setsaveddvar( "sm_cacheSunShadowEnabled", 0 );
    setsaveddvar( "r_useSunShadowPortals", 1 );
    setsaveddvar( "fx_cast_shadow", 0 );
    apply_lighting_pass_cargoship( "cargoship_intro", 0.0 );
}

apply_lighting_pass_cargoship( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "cargoship_intro":
            if ( !isdefined( var_1 ) )
                var_1 = 0.0;

            maps\_utility::_id_7F00( "cargoship_intro", var_1 );
            maps\_utility::_id_9E6E( "cargoship_intro", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_intro" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            maps\_utility::_id_7F00( "cargoship_exterior", var_1 );
            maps\_utility::_id_9E6E( "cargoship_exterior", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior_helitrans_vision":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            maps\_utility::_id_7F00( "cargoship_introtransit", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_interior":
            if ( !isdefined( var_1 ) )
                var_1 = 3.0;

            maps\_utility::_id_7F00( "cargoship_interior_upperdeck", var_1 );
            maps\_utility::_id_9E6E( "cargoship_interior_upperdeck", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_upperdeck" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_interior_transition":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            maps\_utility::_id_7F00( "cargoship_interior_transition", var_1 );
            maps\_utility::_id_9E6E( "cargoship_interior_transition", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_transition" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_explosion":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            maps\_utility::_id_7F00( "cargoship_explosion", 0.2 );
            wait 0.3;
            maps\_utility::_id_9E6E( "cargoship_interior_cargohold_alert", var_1 );
            maps\_utility::_id_7F00( "cargoship_interior_cargohold_alert_igc", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold_alert" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_escape":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            maps\_utility::_id_7F00( "cargoship_interior_cargohold_alert", var_1 );
            maps\_utility::_id_9E6E( "cargoship_interior_cargohold_alert", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold_alert" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior_outro":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            maps\_utility::_id_7F00( "cargoship_exterior_outro", var_1 );
            maps\_utility::_id_395E( "cargoship_exterior" );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior_outro" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_outro":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            maps\_utility::_id_7F00( "cargoship_outro", var_1 );
            maps\_utility::_id_9E6E( "cargoship_outro", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_outro" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
        default:
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            maps\_utility::_id_9E6E( "cargoship_exterior", var_1 );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior" );
            level.player _meth_848C( "clut_cargoship", var_1 );
            break;
    }

    level.current_light_set = var_0;
}

activate_outside_lights()
{
    level.current_lights = "outside";
    activate_lights( "lights_outside", 1 );
    activate_lights( "lights_inside", 0 );
    activate_lights( "lights_cabin_stern_side", 0 );
    activate_lights( "lights_cabin_stern_side2", 0 );
}

activate_lights( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_3 = getentarray( var_0, "targetname" );
    var_4 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    foreach ( var_6 in var_3 )
        var_6 set_light_intensity( !var_1, var_2 );

    foreach ( var_6 in var_4 )
        var_6 set_light_intensity( !var_1, var_2 );
}

set_light_intensity( var_0, var_1 )
{
    var_2 = self;
    var_3 = getentarray( self.target, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_5._id_7A99 ) && var_5._id_7A99 == "light" )
        {
            var_2 = var_5;
            break;
        }
    }

    if ( isdefined( var_2 ) && ( !isdefined( var_2.tv ) || var_2.tv maps\_interactive_objects::is_tv_emitting_light() ) )
    {
        if ( !isdefined( var_2.old_light_intensity ) )
            var_2.old_light_intensity = var_2 getlightintensity();

        var_2 setlightintensity( common_scripts\utility::_id_9294( var_0, 0.0, var_2.old_light_intensity ) );

        if ( isdefined( var_1 ) )
            var_2 _meth_8494( var_1 );
    }
}

setup_lights_triggers()
{
    activate_outside_lights();
    var_0 = getentarray( "script_lights_change", "targetname" );
    common_scripts\utility::array_thread( var_0, ::lights_trigger_think );
}

lights_trigger_think()
{
    if ( !isdefined( self.script_noteworthy ) )
        return;

    for (;;)
    {
        self waittill( "trigger" );

        if ( self.script_noteworthy != level.current_lights )
            apply_lights_change( self.script_noteworthy );
    }
}

apply_lights_change( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = strtok( self._id_7A99, ":; " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = tolower( var_3 );
        var_5 = var_4 == "on";
        var_6 = var_4 == "off";

        if ( var_5 || var_6 )
        {
            var_2++;
            var_7 = strtok( var_1[var_2], ", " );

            for ( var_8 = 0; var_8 < var_7.size; var_8++ )
            {
                var_9 = var_7[var_8];
                activate_lights( var_9, var_5 );
            }
        }
    }

    level.current_lights = var_0;
}

generic_lights_flickering()
{
    thread maps\_lighting::_id_5D3A( "flicker_1", 0, 200, 3000, undefined, undefined, 0.005, 0.5, 0.005, 0.05, undefined, undefined, 100 );
}

aftdeck_lights_flickering()
{
    thread maps\_lighting::_id_5D3A( "flicker_3", 0, 150, 8000, undefined, undefined, 0.005, 0.5, 0.005, 0.05, undefined, undefined, 100 );
}

cargohold_lights_flickering()
{
    thread maps\_lighting::_id_5D3A( "flicker_2", 0, 200, 8000, undefined, undefined, 0.005, 0.5, 0.005, 0.6, undefined, undefined, 100 );
}

sinking_ship_lights_flickering()
{
    thread maps\_lighting::_id_5D3A( "flicker_4", 0, 2, 100, undefined, undefined, 0.005, 0.5, 0.005, 0.6, undefined, undefined, 100 );
}

init_emergency_lights()
{
    var_0 = getentarray( "emergency_light", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.code_classname == "light" )
            var_2 setlightintensity( 0 );
    }
}

activate_emergency_lights()
{
    var_0 = getentarray( "emergency_light", "targetname" );
    var_1 = getentarray( "emergency_light_rotator", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_4 = common_scripts\utility::_id_8959();
        var_4.origin = var_3.origin;
        var_4.angles = var_3.angles;
        var_4 linkto( var_3 );
        playfxontag( common_scripts\utility::_id_3FA8( "emergency_light" ), var_4, "tag_origin" );
    }

    foreach ( var_7 in var_0 )
    {
        if ( var_7.code_classname == "light" )
            var_7 setlightintensity( var_7._id_7A18 );

        var_8 = undefined;

        if ( isdefined( var_7._id_7A26 ) )
            var_8 = getent( var_7._id_7A26, "script_linkname" );

        if ( !isdefined( var_8 ) )
            var_8 = var_7;

        var_7 thread emergency_light_rotation( anglestoup( var_8.angles ) );
    }
}

emergency_light_rotation( var_0 )
{
    var_1 = 18;

    for (;;)
    {
        var_2 = anglestoaxis( self.angles );
        var_2["forward"] = rotatepointaroundvector( var_0, var_2["forward"], var_1 );
        var_2["right"] = rotatepointaroundvector( var_0, var_2["right"], var_1 );
        var_2["up"] = vectorcross( var_2["forward"], var_2["right"] );
        self.angles = axistoangles( var_2["forward"], var_2["right"], var_2["up"] );
        wait 0.05;
    }
}

explosion_lerping()
{
    common_scripts\utility::_id_384A( "escape_explosion" );
    maps\_lighting::_id_56A0( "fire", 0, 250000 );
    maps\_lighting::_id_56A0( "fire_crate", 0, 250000 );
    maps\_lighting::_id_56A0( "price_fall_fill", 0, 55000 );
    maps\_lighting::_id_56A0( "gaz_fall_rim", 1, 20000 );
    wait 8;
    maps\_lighting::_id_56A0( "gaz_fall_rim", 0, 0 );
    maps\_lighting::_id_56A0( "gaz_rim", 0, 65000 );
    wait 5;
    maps\_lighting::_id_56A0( "price_fill", 0, 65000 );
    maps\_lighting::_id_56A0( "price_bounce", 0, 15000 );
    maps\_lighting::_id_56A0( "price_fall_fill", 1, 0 );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    maps\_lighting::_id_56A0( "price_fill", 1, 0 );
    maps\_lighting::_id_56A0( "gaz_rim", 1, 0 );
    maps\_lighting::_id_56A0( "price_bounce", 1, 0 );
}

special_lighting_trigger_think()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( common_scripts\utility::_id_382E( "escape_exterior_visionset" ) )
            var_0 = "cargoship_exterior_outro";
        else
            var_0 = "cargoship_exterior";

        if ( var_0 != level.current_light_set )
            apply_lighting_pass_cargoship( var_0 );
    }
}
