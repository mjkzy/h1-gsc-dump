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
    maps\mp\_global_fx_code::_id_422D( "ch_streetlight_02_FX_origin", "fx/misc/lighthaze" );
    maps\mp\_global_fx_code::_id_422D( "me_streetlight_01_FX_origin", "fx/misc/lighthaze_bog_mp" );
    maps\mp\_global_fx_code::_id_422D( "ch_street_light_01_on", "fx/misc/light_glow_white" );
    maps\mp\_global_fx_code::_id_422D( "lamp_post_globe_on", "fx/misc/light_glow_white" );
    maps\mp\_global_fx_code::_id_422D( "highway_lamp_post", "fx/misc/lighthaze_villassault" );
    maps\mp\_global_fx_code::_id_422D( "cs_cargoship_spotlight_on_FX_origin", "fx/misc/lighthaze" );
    maps\mp\_global_fx_code::_id_422D( "com_tires_burning01_FX_origin", "fx/fire/tire_fire_med" );
    maps\mp\_global_fx_code::_id_422D( "icbm_powerlinetower_FX_origin", "fx/misc/power_tower_light_red_blink" );
    maps\mp\_global_fx_code::_id_422D( "icbm_mainframe_FX_origin", "fx/props/icbm_mainframe_lightblink" );
    maps\mp\_global_fx_code::_id_422D( "lighthaze_oilrig_FX_origin", "fx/misc/lighthaze_oilrig" );
    maps\mp\_global_fx_code::_id_422D( "lighthaze_white_FX_origin", "fx/misc/lighthaze_white" );
    maps\mp\_global_fx_code::_id_422D( "light_glow_walllight_white_FX_origin", "fx/misc/light_glow_walllight_white" );
    maps\mp\_global_fx_code::_id_422D( "fluorescent_glow_FX_origin", "fx/misc/fluorescent_glow" );
    maps\mp\_global_fx_code::_id_422D( "light_glow_industrial_FX_origin", "fx/misc/light_glow_industrial" );
    maps\mp\_global_fx_code::_id_422D( "highrise_blinky_tower", "fx/misc/power_tower_light_red_blink_large" );
    maps\mp\_global_fx_code::_id_422D( "light_glow_white_bulb_FX_origin", "fx/misc/light_glow_white_bulb" );
    maps\mp\_global_fx_code::_id_422D( "light_glow_white_lamp_FX_origin", "fx/misc/light_glow_white_lamp" );
    maps\mp\_global_fx_code::_id_422D( "light_red_steady_FX_origin", "fx/misc/tower_light_red_steady", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_blue_steady_FX_origin", "vfx/lights/tower_light_glow_blue_steady", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_orange_steady_FX_origin", "fx/misc/tower_light_orange_steady", -2 );
    maps\mp\_global_fx_code::_id_422D( "glow_stick_pile_FX_origin", "fx/misc/glow_stick_glow_pile", -2 );
    maps\mp\_global_fx_code::_id_422D( "glow_stick_orange_pile_FX_origin", "fx/misc/glow_stick_glow_pile_orange", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_pulse_red_FX_origin", "fx/misc/light_glow_red_generic_pulse", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_pulse_red_FX_origin", "fx/misc/light_glow_red_generic_pulse", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_pulse_orange_FX_origin", "fx/misc/light_glow_orange_generic_pulse", -2 );
    maps\mp\_global_fx_code::_id_422D( "light_red_blink_FX_origin", "fx/misc/power_tower_light_red_blink", -2 );
    maps\mp\_global_fx_code::_id_422D( "flare_ambient_FX_origin", "fx/misc/flare_ambient", undefined, undefined, "emt_road_flare_burn" );
    maps\mp\_global_fx_code::_id_422D( "me_dumpster_fire_FX_origin", "fx/fire/firelp_med_pm_bog_mp", undefined, undefined, "fire_dumpster_medium" );
    maps\mp\_global_fx_code::_id_422D( "barrel_fireFX_origin", "fx/fire/firelp_small_pm_bog_mp", undefined, undefined, "fire_barrel_small" );
    maps\mp\_global_fx_code::_id_422D( "barrel_fireFX_origin_mp_bog", "fx/fire/firelp_small_pm_bog_mp", undefined, undefined, "fire_barrel_small" );
}
