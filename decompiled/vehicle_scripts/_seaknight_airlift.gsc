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
    maps\_vehicle::_id_186C( "seaknight_airlift", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_ch46e" );
    maps\_vehicle::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_186A( "allies" );
    maps\_vehicle::_id_1849( %sniper_escape_ch46_rotors, undefined, 0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_red_cargo_1", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red", "back", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_L_godray1", "tag_fx_L_window_1", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_L_godray2", "tag_fx_L_window_2", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_L_godray3", "tag_fx_L_window_3", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_L_godray4", "tag_fx_L_window_4", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_L_godray5", "tag_fx_window_gun", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_blue_cockpit_1", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue_airlift", "interior", 0.1 );
    maps\_vehicle::_id_1857( var_2, "cockpit_red_cargo_2", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red", "back2", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_R_godray1", "tag_fx_R_window_1", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_R_godray2", "tag_fx_R_window_2", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_R_godray3", "tag_fx_R_window_3", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_R_godray4", "tag_fx_R_window_4", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_blue_cockpit_2", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue_airlift", "interior2", 0.1 );
    maps\_vehicle::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_red_blink", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    maps\_vehicle::_id_1857( var_2, "wingtip_green1", "tag_light_L_wing1", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "wingtip_green2", "tag_light_L_wing2", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "wingtip_red1", "tag_light_R_wing1", "fx/misc/aircraft_light_wingtip_red", "running", 0.2 );
    maps\_vehicle::_id_1857( var_2, "wingtip_red2", "tag_light_R_wing2", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_red_cargo_3", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red_rescue", "back3", 0.0 );
    maps\_vehicle::_id_1855();
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    thread _id_7DDA();
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
    return var_0;
}

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 0; var_1++ )
        var_0[var_1] = spawnstruct();

    return var_0;
}

_id_9A3D()
{

}

_id_7DDA()
{
    while ( !isdefined( level.seaknight ) )
        wait 0.05;

    var_0 = spawn( "script_model", level.seaknight.origin );
    var_0 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_0.origin = level.seaknight gettagorigin( "body_animate_jnt" );
    var_0.angles = level.seaknight.angles;
    var_0 linkto( level.seaknight, "body_animate_jnt" );
    var_0 = spawn( "script_model", level.seaknight.origin );
    var_0 setmodel( "vehicle_ch46e_wires" );
    var_0.origin = level.seaknight gettagorigin( "body_animate_jnt" );
    var_0.angles = level.seaknight.angles;
    var_0 linkto( level.seaknight, "body_animate_jnt" );
}
