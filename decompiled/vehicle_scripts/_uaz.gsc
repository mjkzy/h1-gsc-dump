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
    maps\_vehicle::_id_186C( "uaz", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1848( "vehicle_uaz_hardtop_destructible", "vehicle_uaz_hardtop" );
    maps\_vehicle::_id_1848( "vehicle_uaz_light_destructible", "vehicle_uaz_light" );
    maps\_vehicle::_id_1848( "vehicle_uaz_open_destructible", "vehicle_uaz_open" );
    maps\_vehicle::_id_1848( "vehicle_uaz_open_for_ride", "vehicle_uaz_open" );
    maps\_vehicle::_id_1848( "vehicle_uaz_fabric_destructible", "vehicle_uaz_fabric" );
    maps\_vehicle::_id_183C( 1 );
    maps\_vehicle::_id_1845( "vehicle_uaz_fabric", "vehicle_uaz_fabric_dsr" );
    maps\_vehicle::_id_1845( "vehicle_uaz_hardtop", "vehicle_uaz_hardtop_dsr" );
    maps\_vehicle::_id_1845( "vehicle_uaz_open", "vehicle_uaz_open_dsr" );
    maps\_vehicle::_id_1845( "vehicle_uaz_hardtop_thermal", "vehicle_uaz_hardtop_thermal" );
    maps\_vehicle::_id_1845( "vehicle_uaz_open_for_ride" );
    maps\_vehicle::_id_1842( "fx/explosions/small_vehicle_explosion", undefined, "explo_metal_rand" );
    maps\_vehicle::_id_1862( ( 0, 0, 32 ), 300, 200, 100, 0 );
    maps\_vehicle::_id_1849( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_1846( 1, 1.6, 500 );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_186A( "axis" );
    maps\_vehicle::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{
    self._id_1E9A = 1;
}

_id_7EFA( var_0 )
{
    if ( getdvarint( "use_old_uaz_anims" ) == 1 )
    {
        var_0[0]._id_9CD5 = %uaz_driver_exit_into_run_door;
        var_0[1]._id_9CD5 = %uaz_passenger_exit_into_run_door;
    }
    else
    {
        var_0[0]._id_9CD5 = %h1_uaz_driver_exit_into_idle_door;
        var_0[1]._id_9CD5 = %h1_uaz_passenger_exit_into_idle_door;
    }

    var_0[0]._id_9CD0 = %uaz_driver_enter_from_huntedrun_door;
    var_0[1]._id_9CD0 = %uaz_passenger_enter_from_huntedrun_door;
    var_0[0]._id_9CD8 = "front_door_left_jnt";
    var_0[1]._id_9CD8 = "front_door_right_jnt";
    var_0[2]._id_9CD8 = "rear_door_left_jnt";
    var_0[3]._id_9CD8 = "rear_door_right_jnt";
    var_0[0]._id_9CD2 = "truck_door_open";
    var_0[1]._id_9CD2 = "truck_door_open";
    var_0[2]._id_9CD2 = "truck_door_open";
    var_0[3]._id_9CD2 = "truck_door_open";
    var_0[0]._id_9CD3 = "front_door_left_jnt";
    var_0[1]._id_9CD3 = "front_door_right_jnt";
    var_0[2]._id_9CD3 = "rear_door_left_jnt";
    var_0[3]._id_9CD3 = "rear_door_right_jnt";
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_guy0";
    var_0[3]._id_85AE = "tag_guy1";
    var_0[4]._id_85AE = "tag_guy2";
    var_0[5]._id_85AE = "tag_guy3";
    var_0[0]._id_4B63 = %uaz_driver_idle_drive;
    var_0[1]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[2]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[3]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[4]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[5]._id_4B63 = %uaz_passenger_idle_drive;

    if ( getdvarint( "use_old_uaz_anims" ) == 1 )
    {
        var_0[0]._id_4068 = %uaz_driver_exit_into_run;
        var_0[1]._id_4068 = %uaz_passenger_exit_into_run;
        var_0[2]._id_4068 = %uaz_driver_exit_into_run;
        var_0[3]._id_4068 = %uaz_passenger_exit_into_run;
    }
    else
    {
        var_0[0]._id_4068 = %h1_uaz_driver_exit_into_idle;
        var_0[0].getout_ik = 1;
        var_0[1]._id_4068 = %h1_uaz_passenger_exit_into_idle;
        var_0[1].getout_ik = 1;
        var_0[2]._id_4068 = %h1_uaz_driver_exit_into_idle;
        var_0[2].getout_ik = 1;
        var_0[3]._id_4068 = %h1_uaz_passenger_exit_into_idle;
        var_0[3].getout_ik = 1;
    }

    var_0[0]._id_3FD2 = %uaz_driver_enter_from_huntedrun;
    var_0[1]._id_3FD2 = %uaz_passenger_enter_from_huntedrun;
    return var_0;
}
