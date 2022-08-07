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
    maps\_vehicle::_id_186C( "bm21", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_bm21_mobile", "vehicle_bm21_mobile_dstry" );
    precachemodel( "projectile_bm21_missile" );
    maps\_vehicle::_id_1842( "fx/explosions/small_vehicle_explosion", "tag_fx_tank", "explo_metal_rand", undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_med_pm", "tag_deathfx", "fire_metal_medium", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_cab", undefined, undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_1842( "fx/explosions/grenadeexp_default", "tag_missile18", "explo_metal_rand", undefined, undefined, undefined, 0.5 );
    maps\_vehicle::_id_1842( "fx/explosions/grenadeexp_default", "tag_fx_tank", "explo_metal_rand", undefined, undefined, undefined, 0.8 );
    maps\_vehicle::_id_1842( "fx/explosions/grenadeexp_default", "tag_missile14", "explo_metal_rand", undefined, undefined, undefined, 1.0 );
    maps\_vehicle::_id_1842( "fx/explosions/grenadeexp_default", "tag_flash", "explo_metal_rand", undefined, undefined, undefined, 1.4 );
    maps\_vehicle::_id_1842( "fx/explosions/vehicle_explosion_bm21", undefined, "car_explode", undefined, undefined, undefined, 2.6 );
    maps\_vehicle::_id_1842( "fx/explosions/vehicle_explosion_bm21_tires", "tag_deathfx", undefined, undefined, undefined, undefined, 2.6 );
    maps\_vehicle::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_tire_right_r", undefined, undefined, undefined, undefined, 2.7 );
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_186A( "allies" );
    maps\_vehicle::_id_1849( %bm21_driving_idle_forward, %bm21_driving_idle_backward, 10 );
    var_3 = var_2;
    maps\_vehicle::_id_1857( var_3, "headlight_bm21_left", "tag_headlight_left", "fx/misc/car_headlight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "headlight_bm21_right", "tag_headlight_right", "fx/misc/car_headlight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "parkinglight_bm21_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "parkinglight_bm21_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "taillight_bm21_right", "tag_taillight_right", "fx/misc/car_taillight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "taillight_bm21_left", "tag_taillight_left", "fx/misc/car_taillight_bm21", "headlights" );
    maps\_vehicle::_id_1857( var_3, "breaklight_bm21_right", "tag_taillight_right", "fx/misc/car_brakelight_bm21", "brakelights" );
    maps\_vehicle::_id_1857( var_3, "breaklight_bm21_left", "tag_taillight_left", "fx/misc/car_brakelight_bm21", "brakelights" );
}

_id_4D10()
{
    self._id_5CBF = "projectile_bm21_missile";
    self._id_5CCA = [];
    self._id_5CCA[0] = "tag_missile1";
    self._id_5CCA[1] = "tag_missile2";
    self._id_5CCA[2] = "tag_missile3";
    self._id_5CCA[3] = "tag_missile4";
    self._id_5CCA[4] = "tag_missile5";
    self._id_5CCA[5] = "tag_missile6";
    self._id_5CCA[6] = "tag_missile7";
    self._id_5CCA[7] = "tag_missile8";
    self._id_5CCA[8] = "tag_missile9";
    self._id_5CCA[9] = "tag_missile10";
    self._id_5CCA[10] = "tag_missile11";
    self._id_5CCA[11] = "tag_missile12";
    self._id_5CCA[12] = "tag_missile13";
    self._id_5CCA[13] = "tag_missile14";
    self._id_5CCA[14] = "tag_missile15";
    self._id_5CCA[15] = "tag_missile16";
    self._id_5CCA[16] = "tag_missile17";
    self._id_5CCA[17] = "tag_missile18";
    self._id_5CCA[18] = "tag_missile19";
    self._id_5CCA[19] = "tag_missile20";
    self._id_5CCA[20] = "tag_missile21";
    self._id_5CCA[21] = "tag_missile22";
    self._id_5CCA[22] = "tag_missile23";
    self._id_5CCA[23] = "tag_missile24";
    self._id_5CCA[24] = "tag_missile25";
    self._id_5CCA[25] = "tag_missile26";
    thread maps\_vehicle_missile::main();
}
