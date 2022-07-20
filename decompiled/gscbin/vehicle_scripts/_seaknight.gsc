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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_186C( "seaknight", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_ch46e" );
    maps\_vehicle::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_186A( "allies" );
    maps\_vehicle::_id_1839( ::_id_7F23, ::_id_7EFA );
    maps\_vehicle::_id_1849( %sniper_escape_ch46_rotors, undefined, 0 );
    maps\_vehicle::_id_1873( ::_id_9A3D );
    maps\_vehicle::_id_1857( var_2, "cockpit_red_cargo02", "tag_light_cargo02", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    maps\_vehicle::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_red_blink", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    maps\_vehicle::_id_1857( var_2, "wingtip_green1", "tag_light_L_wing1", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "wingtip_green2", "tag_light_L_wing2", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "wingtip_red1", "tag_light_R_wing1", "fx/misc/aircraft_light_wingtip_red", "running", 0.2 );
    maps\_vehicle::_id_1857( var_2, "wingtip_red2", "tag_light_R_wing2", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    maps\_vehicle::_id_1855();
}

_id_4D10()
{
    self._id_65A7 = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_367F = 652;
    self._id_7957 = 0;
}

_id_7EFA( var_0 )
{
    var_0[1]._id_9CD5 = %ch46_doors_open;
    var_0[1]._id_9CD6 = 0;
    var_0[1]._id_9CD0 = %ch46_doors_close;
    var_0[1]._id_9CD1 = 0;
    var_0[1]._id_9CD7 = "seaknight_door_open";
    var_0[1]._id_9CD2 = "seaknight_door_close";
    var_0[1]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[2]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[3]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[4]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_4B63[0] = %seaknight_pilot_idle;
    var_0[0]._id_4B63[1] = %seaknight_pilot_switches;
    var_0[0]._id_4B63[2] = %seaknight_pilot_twitch;
    var_0[0]._id_4B7E[0] = 1000;
    var_0[0]._id_4B7E[1] = 400;
    var_0[0]._id_4B7E[2] = 200;
    var_0[0]._id_1433 = 0;
    var_0[5]._id_1433 = 0;
    var_0[1]._id_4B63 = %ch46_unload_1_idle;
    var_0[2]._id_4B63 = %ch46_unload_2_idle;
    var_0[3]._id_4B63 = %ch46_unload_3_idle;
    var_0[4]._id_4B63 = %ch46_unload_4_idle;
    var_0[5]._id_4B63[0] = %seaknight_copilot_idle;
    var_0[5]._id_4B63[1] = %seaknight_copilot_switches;
    var_0[5]._id_4B63[2] = %seaknight_copilot_twitch;
    var_0[5]._id_4B7E[0] = 1000;
    var_0[5]._id_4B7E[1] = 400;
    var_0[5]._id_4B7E[2] = 200;
    var_0[0]._id_85AE = "tag_detach";
    var_0[1]._id_85AE = "tag_detach";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[1]._id_4068 = %ch46_unload_1;
    var_0[2]._id_4068 = %ch46_unload_2;
    var_0[3]._id_4068 = %ch46_unload_3;
    var_0[4]._id_4068 = %ch46_unload_4;
    var_0[1]._id_3FD2 = %ch46_load_1;
    var_0[2]._id_3FD2 = %ch46_load_2;
    var_0[3]._id_3FD2 = %ch46_load_3;
    var_0[4]._id_3FD2 = %ch46_load_4;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["passengers"][var_0["passengers"].size] = 1;
    var_0["passengers"][var_0["passengers"].size] = 2;
    var_0["passengers"][var_0["passengers"].size] = 3;
    var_0["passengers"][var_0["passengers"].size] = 4;
    var_0["default"] = var_0["passengers"];
    return var_0;
}

_id_7DDA()
{

}
