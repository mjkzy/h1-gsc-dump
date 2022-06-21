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
    maps\mp\mp_cargoship_precache::main();
    maps\mp\mp_cargoship_fx::main();
    maps\createart\mp_cargoship_art::main();
    _id_A74C::main();
    _id_A731::_id_8324( "compass_map_mp_cargoship" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
    thread animated_cranes();
    thread animated_boats_precache();
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_tonemapHighlightRange", 0 );
    setdvar( "compassmaxrange", "2100" );
    misc_rotate_fans();
    maps\mp\_fx_trigger::main();

    if ( level.gametype == "dom" )
    {
        level.domborderfx["friendly"]["_a"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["friendly"]["_b"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["friendly"]["_c"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["enemy"]["_a"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["enemy"]["_b"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["enemy"]["_c"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["neutral"]["_a"] = "vfx/unique/vfx_marker_dom_w_mid";
        level.domborderfx["neutral"]["_b"] = "vfx/unique/vfx_marker_dom_w_mid";
        level.domborderfx["neutral"]["_c"] = "vfx/unique/vfx_marker_dom_w_mid";
    }

    _id_A7BC::setfactiontableoverride( "marines", _id_A7BC::getteamheadiconcol(), "h1_headicon_marines_night" );
    _id_A7BC::setfactiontableoverride( "opfor", _id_A7BC::getteamheadiconcol(), "h1_headicon_opfor_night" );
    level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated_night";
    level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated_night";
    level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1_night";
    level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1_night";
    level.oldschoolfxtype = "unlit";
}

misc_rotate_fans()
{
    precachempanim( "rotate_Z_L" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_custom", "targetname" ), ::fan_blade_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate", "targetname" ), ::_id_366A );
}

fan_blade_rotate_custom()
{
    self _meth_8277( "rotate_Z_L" );
}

_id_366A()
{
    var_0 = 600;

    for (;;)
    {
        self _meth_82B9( ( 0, 150, 0 ), var_0 );
        wait(var_0);
    }
}

animated_cranes()
{
    precachempanim( "h1_mp_crane_idle_1" );
    precachempanim( "h1_mp_crane_idle_2" );
    var_0 = getent( "crane1", "targetname" );
    var_1 = getent( "crane2", "targetname" );
    var_0 _meth_8277( "h1_mp_crane_idle_1" );
    var_1 _meth_8277( "h1_mp_crane_idle_2" );
}

animated_boats_precache()
{
    precachempanim( "h1_mp_lifeboat_idle_1" );
    precachempanim( "h1_mp_lifeboat_idle_2" );
    precachempanim( "h1_mp_lifeboat_idle_3" );
    var_0 = getentarray( "animated_boat", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::animated_boats );
}
#using_animtree("animated_props_dlc");

animated_boats()
{
    var_0 = [];
    var_1 = [];
    var_0[0] = "h1_mp_lifeboat_idle_1";
    var_1[0] = %h1_mp_lifeboat_idle_1;
    var_0[1] = "h1_mp_lifeboat_idle_2";
    var_1[1] = %h1_mp_lifeboat_idle_2;
    var_0[2] = "h1_mp_lifeboat_idle_3";
    var_1[2] = %h1_mp_lifeboat_idle_3;

    for (;;)
    {
        var_2 = randomint( 3 );
        self _meth_8277( var_0[var_2] );
        wait(getanimlength( var_1[var_2] ));
    }
}
