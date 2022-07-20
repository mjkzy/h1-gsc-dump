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
    maps\_vehicle::_id_186C( "technical", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_pickup_technical", "vehicle_pickup_technical_destroyed", 3 );
    maps\_vehicle::_id_1872( "50cal_turret_technical", "tag_50cal", "weapon_pickup_technical_mg50cal", undefined, undefined, 2.9 );
    maps\_vehicle::_id_1849( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_tank", "smallfire", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_1842( "fx/explosions/ammo_cookoff", "tag_fx_bed", undefined, undefined, undefined, undefined, 0.5 );
    maps\_vehicle::_id_1842( "fx/explosions/Vehicle_Explosion_Pickuptruck", "tag_deathfx", "car_explode", undefined, undefined, undefined, 2.9 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_small_pm_a", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 3 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_cab", "fire_metal_medium", undefined, undefined, 1, 3.01 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_small_pm_a", "tag_engine_left", "smallfire", undefined, undefined, 1, 3.01 );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_186A( "allies" );
    maps\_vehicle::_id_1839( ::_id_7F23, ::_id_7EFA );
    maps\_vehicle::_id_1873( ::_id_9A3D );
    maps\_vehicle::_id_1857( var_2, "headlight_truck_left", "tag_headlight_left", "fx/misc/car_headlight_truck_L", "headlights" );
    maps\_vehicle::_id_1857( var_2, "headlight_truck_right", "tag_headlight_right", "fx/misc/car_headlight_truck_R", "headlights" );
    maps\_vehicle::_id_1857( var_2, "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_truck_LF", "headlights" );
    maps\_vehicle::_id_1857( var_2, "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_truck_RF", "headlights" );
    maps\_vehicle::_id_1857( var_2, "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_truck_R", "headlights" );
    maps\_vehicle::_id_1857( var_2, "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_truck_L", "headlights" );
    maps\_vehicle::_id_1857( var_2, "brakelight_truck_right", "tag_taillight_right", "fx/misc/car_brakelight_truck_R", "brakelights" );
    maps\_vehicle::_id_1857( var_2, "brakelight_truck_left", "tag_taillight_left", "fx/misc/car_brakelight_truck_L", "brakelights" );
    maps\_vehicle::_id_183F( 0.5, 3, 512, 700, "axis", "allies" );
    maps\_vehicle::_id_1840( 2.9 );
    maps\_vehicle::_id_1862( ( 0, 0, 53 ), 512, 300, 20, 1, 2.9 );
}

_id_7EFA( var_0 )
{
    return var_0;
}

_id_4D10()
{
    _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 6000;
    var_2 = 1.0;
    vehicle_scripts\_technical_aud::snd_init_technical();
    thread _id_5D80();

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_3 = distance( self.origin, level.playercardbackground.origin );

            if ( var_0 && var_3 > var_1 )
            {
                vehicle_scripts\_technical_aud::snd_stop_technical( var_2 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_3 < var_1 )
            {
                vehicle_scripts\_technical_aud::snd_start_technical();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_technical_aud::snd_stop_technical( var_2 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    var_0 = 1.0;
    vehicle_scripts\_technical_aud::snd_stop_technical( var_0 );
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 3; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_gunner";
    var_0[2]._id_85AE = "tag_passenger";
    var_0[0]._id_4B63[0] = %technical_driver_idle;
    var_0[0]._id_4B63[1] = %technical_driver_duck;
    var_0[0]._id_4B7E[0] = 1000;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0].death = %technical_driver_fallout;
    var_0[2].death = %technical_passenger_fallout;
    var_0[0]._id_9A43 = 0.9;
    var_0[1]._id_9A43 = 0.9;
    var_0[2]._id_9A43 = 0.9;
    var_0[2]._id_4B63[0] = %technical_passenger_idle;
    var_0[2]._id_4B63[1] = %technical_passenger_duck;
    var_0[2]._id_4B7E[0] = 1000;
    var_0[2]._id_4B7E[1] = 100;
    var_0[0]._id_4068 = %technical_driver_climb_out;
    var_0[2]._id_4068 = %technical_passenger_climb_out;
    var_0[1]._id_5BD5 = 0;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["passenger_and_gunner"] = [];
    var_0["all"] = [];
    var_1 = "passenger_and_gunner";
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_1 = "passengers";
    var_0[var_1][var_0[var_1].size] = 2;
    var_0["default"] = var_0["all"];
    return var_0;
}
