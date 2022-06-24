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
    maps\mp\mp_carentan_precache::main();
    maps\createart\mp_carentan_art::main();
    maps\mp\mp_carentan_fx::main();
    _id_A74C::main();
    _id_A731::_id_8324( "compass_map_mp_carentan" );
    level.airstrikeheightscale = 1.4;
    game["allies"] = "sas";
    game["axis"] = "russian";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "urban";
    game["axis_soldiertype"] = "urban";
    _id_A74A::_id_422D( "ct_street_lamp_glow_FX_origin", "fx/misc/ct_street_lamp_glow", undefined, "light_street_lamp" );
    _id_A74A::_id_422D( "vent_small_FX_origin", "vfx/steam/steam_vent_small", undefined, "steam_vent_small" );
    _id_A74A::_id_422D( "utility_light_FX_origin", "vfx/lights/spotlight_yellow_mp_carentan", undefined, "light_utilities" );
    _id_A74A::_id_422D( "street_wall_light_FX_origin", "vfx/lights/light_spotlight_long_mp_carentan", undefined, "light_street_wall" );
    _id_A74A::_id_422D( "street_wall_light_sml_FX_origin", "vfx/lights/light_spotlight_mp_carentan", undefined, "light_street_wall_sml" );
    _id_A74A::_id_422D( "com_studio_light_FX_origin", "vfx/lights/light_studiolight_mp_carentan", undefined, "com_studio_light" );
    setdvar( "compassmaxrange", "2500" );

    if ( level.gametype == "dom" )
    {
        level.domborderfx["friendly"]["_a"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["friendly"]["_b"] = "vfx/unique/vfx_marker_dom_med_carentanb";
        level.domborderfx["friendly"]["_c"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["enemy"]["_a"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["enemy"]["_b"] = "vfx/unique/vfx_marker_dom_red_med_carentanb";
        level.domborderfx["enemy"]["_c"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["neutral"]["_a"] = "vfx/unique/vfx_marker_dom_w_mid";
        level.domborderfx["neutral"]["_b"] = "vfx/unique/vfx_marker_dom_w_med_carentanb";
        level.domborderfx["neutral"]["_c"] = "vfx/unique/vfx_marker_dom_w_mid";
    }

    _id_A7BC::setfactiontableoverride( "marines", _id_A7BC::getteamheadiconcol(), "h1_headicon_marines_night" );
    _id_A7BC::setfactiontableoverride( "opfor", _id_A7BC::getteamheadiconcol(), "h1_headicon_opfor_night" );
    _id_A7BC::setfactiontableoverride( "sas", _id_A7BC::getteamheadiconcol(), "h1_headicon_sas_night" );
    _id_A7BC::setfactiontableoverride( "russian", _id_A7BC::getteamheadiconcol(), "h1_headicon_russian_night" );
    level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated_night";
    level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated_night";
    level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1_night";
    level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1_night";
    level.oldschoolfxtype = "unlit";
}
