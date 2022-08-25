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

beautiful_corner()
{
    if ( !common_scripts\_ca_beautiful_corner::_id_4DD7() )
        return 0;

    common_scripts\utility::_id_383D( "lighting_player_interior" );
    common_scripts\utility::_id_383D( "player_made_it" );
    common_scripts\utility::_id_383D( "seaknight_guards_boarding" );
    common_scripts\_ca_blockout::init();
    maps\village_defend_fx::main();
    maps\village_defend_anim::main();
    maps\village_defend_precache::main();
    maps\createart\village_defend_art::main();
    maps\_load::main();
    level thread maps\village_defend_amb::main();
    maps\village_defend_lighting::main();
    thread _id_6504();
    thread player_position();
    beautiful_corner_settings();
    common_scripts\_ca_beautiful_corner::activate();
    return 1;
}

beautiful_corner_settings()
{
    level.beautiful_weapon = "m4_gl_mp";
    level.beautiful_views = common_scripts\utility::array_add( level.beautiful_views, "beautiful_corner_0" );
    level.beautiful_views = common_scripts\utility::array_add( level.beautiful_views, "beautiful_corner_1" );
    level.beautiful_views = common_scripts\utility::array_add( level.beautiful_views, "beautiful_corner_2" );
    level.beautiful_visions["beautiful_corner_0"] = "village_defend";
    level.beautiful_visions["beautiful_corner_1"] = "village_defend";
    level.beautiful_visions["beautiful_corner_2"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_0"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_1"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_2"] = "village_defend";
    level.beautiful_cluts["beautiful_corner_0"] = "clut_village_defend_base";
    level.beautiful_cluts["beautiful_corner_1"] = "clut_village_defend_base";
    level.beautiful_cluts["beautiful_corner_2"] = "clut_village_defend_base";
    level.beautiful_dof["beautiful_corner_0"]["fstop"] = 3.3;
    level.beautiful_dof["beautiful_corner_0"]["focus_distance"] = 500;
    level.beautiful_dof["beautiful_corner_0"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_0"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_1"]["fstop"] = 2.45;
    level.beautiful_dof["beautiful_corner_1"]["focus_distance"] = 500;
    level.beautiful_dof["beautiful_corner_1"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_1"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_2"]["fstop"] = 2.0;
    level.beautiful_dof["beautiful_corner_2"]["focus_distance"] = 1000.0;
    level.beautiful_dof["beautiful_corner_2"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_2"]["aperture_speed"] = 1.0;
}

player_position()
{
    var_0 = getent( "info_player_start", "classname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
}

_id_6504()
{
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_1" );
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_2" );
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_3" );
}

remove_barbed_wire_walls( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();
}
