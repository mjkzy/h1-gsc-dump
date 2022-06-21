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
    maps\mp\mp_bog_precache::main();
    maps\mp\mp_bog_fx::main();
    maps\createart\mp_bog_art::main();
    _id_A74C::main();
    _id_A769::init();
    _id_A731::_id_8324( "compass_map_mp_bog" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    setdvar( "compassmaxrange", "1800" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_tonemapHighlightRange", 0 );
    thread misc_rotate_ceilingfans();

    if ( level.gametype == "dom" )
    {
        level.domborderfx["friendly"]["_a"] = "vfx/unique/vfx_marker_dom_night";
        level.domborderfx["friendly"]["_b"] = "vfx/unique/vfx_marker_dom_night_bogb";
        level.domborderfx["friendly"]["_c"] = "vfx/unique/vfx_marker_dom_night";
        level.domborderfx["enemy"]["_a"] = "vfx/unique/vfx_marker_dom_red_night";
        level.domborderfx["enemy"]["_b"] = "vfx/unique/vfx_marker_dom_red_night_bogb";
        level.domborderfx["enemy"]["_c"] = "vfx/unique/vfx_marker_dom_red_night";
        level.domborderfx["neutral"]["_a"] = "vfx/unique/vfx_marker_dom_w_night";
        level.domborderfx["neutral"]["_b"] = "vfx/unique/vfx_marker_dom_w_night_bogb";
        level.domborderfx["neutral"]["_c"] = "vfx/unique/vfx_marker_dom_w_night";
    }
    else if ( level.gametype == "ctf" )
        maps\mp\gametypes\ctf::flagbasefxdark();

    _id_A7BC::setfactiontableoverride( "marines", _id_A7BC::getteamheadiconcol(), "h1_headicon_marines_night" );
    _id_A7BC::setfactiontableoverride( "opfor", _id_A7BC::getteamheadiconcol(), "h1_headicon_opfor_night" );
    level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated_night";
    level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated_night";
    level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1_night";
    level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1_night";
    level.oldschoolfxtype = "unlit";
    maps\mp\_utility::demolitiontriggermove( ( 3559, 1308, 2 ), undefined, ( 357.835, 99.7969, 1.82364 ) );
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin", "targetname" ), ::ceilingfan_rotate_custom );
}

ceilingfan_rotate_custom()
{
    var_0 = 50;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}
