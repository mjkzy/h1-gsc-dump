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
    maps\mp\mp_crash_snow_precache::main();
    maps\mp\mp_crash_snow_fx::main();
    maps\createart\mp_crash_snow_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::setupminimap( "compass_map_mp_crash_snow" );
    level.heli_model_allies_override = "vehicle_cobra_helicopter_fly_crash_snow";
    level.heli_model_axis_override = "h1_vehicle_mi24_hind_crash_snow";
    level.airstrike_model_allies_override = "h1_mp_crash_snow_xmas_sleigh_with_reindeer_01_dlc";
    level.airstrike_model_axis_override = "h1_mp_crash_snow_xmas_sleigh_with_reindeer_01_dlc";
    level.airstrike_plane_fx_func = ::airstrikeplanefx;
    level.airstrike_close_sound = "veh_mig29_close_loop_wntr";
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "r_specularcolorscale", "1" );
    setdvar( "compassmaxrange", "1600" );
    level thread light_delete();
    level thread _id_64C8();
}

airstrikeplanefx( var_0 )
{
    playfxontag( common_scripts\utility::_id_3FA8( "sleigh_glow_trail" ), self, "tag_engine_right" );
    playfxontag( common_scripts\utility::_id_3FA8( "sleigh_glow_trail" ), self, "tag_engine_left" );
    playfxontag( common_scripts\utility::_id_3FA8( "sleigh_rudolph_nose" ), self, "tag_light_nose" );
}

light_delete()
{
    wait 0.3;
    thread light_geo_delete();
    thread light_model_delete();
}

light_geo_delete()
{
    var_0 = getentarray( "script_brushmodel", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1].script_noteworthy ) )
            continue;

        if ( var_0[var_1].script_noteworthy == "tube_light_geo" )
            var_0[var_1] delete();
    }
}

light_model_delete()
{
    var_0 = getentarray( "script_model", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1].script_noteworthy ) )
            continue;

        if ( var_0[var_1].script_noteworthy == "tube_light_geo" )
            var_0[var_1] delete();
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_6EFA = ::_id_6D29;
    }
}

_id_6D29( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    playerplaysnowfx();
}

playerplaysnowfx()
{
    self._id_487B = 1;
    var_0 = ( 0.0, 0.0, 30.0 );
    var_1 = self getstance();

    if ( var_1 == "crouch" )
        var_0 = ( 0.0, 0.0, 20.0 );
    else if ( var_1 == "prone" )
        var_0 = ( 0.0, 0.0, 10.0 );

    playfx( common_scripts\utility::_id_3FA8( "deathfx_xmas_snow" ), self.origin + var_0 );
}
