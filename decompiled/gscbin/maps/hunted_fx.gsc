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
    level._effect["firelp_vhc_lrg_pm_farview"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["lighthaze"] = loadfx( "vfx/lights/hunted/hunted_headlight" );
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["firelp_small_pm"] = loadfx( "fx/fire/firelp_small_pm" );
    level._effect["firelp_small_pm_a"] = loadfx( "fx/fire/firelp_small_pm_a" );
    level._effect["fog_hunted"] = loadfx( "fx/weather/fog_hunted" );
    level._effect["fog_hunted_a"] = loadfx( "fx/weather/fog_hunted_a" );
    level._effect["bird_pm"] = loadfx( "fx/misc/bird_pm" );
    level._effect["bird_takeoff_pm"] = loadfx( "fx/misc/bird_takeoff_pm" );
    level._effect["leaves"] = loadfx( "fx/misc/leaves" );
    level._effect["leaves_runner"] = loadfx( "fx/misc/leaves_runner" );
    level._effect["leaves_runner_1"] = loadfx( "fx/misc/leaves_runner_1" );
    level._effect["leaves_lp"] = loadfx( "fx/misc/leaves_lp" );
    level._effect["leaves_gl"] = loadfx( "fx/misc/leaves_gl" );
    level._effect["leaves_gl_a"] = loadfx( "fx/misc/leaves_gl_a" );
    level._effect["leaves_gl_b"] = loadfx( "fx/misc/leaves_gl_b" );
    level._effect["hunted_vl"] = loadfx( "fx/misc/hunted_vl" );
    level._effect["hunted_vl_sm"] = loadfx( "fx/misc/hunted_vl_sm" );
    level._effect["hunted_vl_od_lrg"] = loadfx( "fx/misc/hunted_vl_od_lrg" );
    level._effect["hunted_vl_od_lrg_a"] = loadfx( "fx/misc/hunted_vl_od_lrg_a" );
    level._effect["hunted_vl_od_sml"] = loadfx( "fx/misc/hunted_vl_od_sml" );
    level._effect["hunted_vl_od_sml_a"] = loadfx( "fx/misc/hunted_vl_od_sml_a" );
    level._effect["hunted_vl_od_dtl_a"] = loadfx( "fx/misc/hunted_vl_od_dtl_a" );
    level._effect["hunted_vl_od_dtl_b"] = loadfx( "fx/misc/hunted_vl_od_dtl_b" );
    level._effect["mist_hunted_add"] = loadfx( "fx/weather/mist_hunted_add" );
    level._effect["insects_light_hunted"] = loadfx( "fx/misc/insects_light_hunted" );
    level._effect["insects_light_hunted_a"] = loadfx( "fx/misc/insects_light_hunted_a" );
    level._effect["hunted_vl_white_eql"] = loadfx( "fx/misc/hunted_vl_white_eql" );
    level._effect["hunted_vl_white_eql_flare"] = loadfx( "fx/misc/hunted_vl_white_eql_flare" );
    level._effect["hunted_vl_white_eql_a"] = loadfx( "fx/misc/hunted_vl_white_eql_a" );
    level._effect["grenadeexp_fuel"] = loadfx( "fx/explosions/grenadeexp_fuel" );
    level._effect["hunted_fel"] = loadfx( "fx/misc/hunted_fel" );
    level._effect["waterfall_hunted_night"] = loadfx( "fx/misc/waterfall_hunted_night" );
    level._effect["stream_hunted"] = loadfx( "fx/misc/stream_hunted" );
    level._effect["light_godray_moonlight_a"] = loadfx( "vfx/lights/light_godray_moonlight_a" );
    level._effect["light_godray_moonlight_b"] = loadfx( "vfx/lights/light_godray_moonlight_b" );
    level._effect["light_godray_moonlight_sm"] = loadfx( "vfx/lights/light_godray_moonlight_sm" );
    level._effect["light_godray_dust_alone"] = loadfx( "vfx/lights/light_godray_dust_alone" );
    level._effect["light_godray_dust_alone_b"] = loadfx( "vfx/lights/light_godray_dust_alone_b" );
    level._effect["light_godray_dust_alone_c"] = loadfx( "vfx/lights/light_godray_dust_alone_c" );
    level._effect["heli_fire_small_streak_pm_v"] = loadfx( "vfx/map/hunted/heli_fire_small_streak_pm_v" );
    level._effect["heli_fire_small_streak_pm_h"] = loadfx( "vfx/map/hunted/heli_fire_small_streak_pm_h" );
    level._effect["heli_fire_med_streak_pm_h"] = loadfx( "vfx/map/hunted/heli_fire_med_streak_pm_h" );
    level._effect["firelp_large_pm"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["hunted_fog_vista_night"] = loadfx( "vfx/fog/hunted_fog_vista_night" );
    level._effect["village_smolder_night"] = loadfx( "fx/smoke/village_smolder_night" );
    level._effect["hunted_fog_vista_near_fade_night"] = loadfx( "vfx/fog/hunted_fog_vista_near_fade_night" );
    level._effect["leaves_night_a"] = loadfx( "fx/misc/leaves_night_a" );
    level._effect["leaves_night_b"] = loadfx( "fx/misc/leaves_night_b" );
    level._effect["leaves_night_gust_a"] = loadfx( "fx/misc/leaves_night_gust_a" );
    level._effect["leaves_night_gust_b"] = loadfx( "fx/misc/leaves_night_gust_b" );
    level._effect["moth_runner_night"] = loadfx( "fx/misc/moth_runner_night" );
    level._effect["birds_takeoff_night"] = loadfx( "vfx/animal/birds_takeoff_night" );
    level._effect["electrical_spark_loop_night"] = loadfx( "vfx/sparks/electrical_spark_loop_night" );
    level._effect["hunted_heli_smolder_night"] = loadfx( "vfx/map/hunted/hunted_heli_smolder_night" );
    level._effect["hunted_heli_crashsite_explosion_night"] = loadfx( "vfx/map/hunted/hunted_heli_crashsite_explosion_night" );
    level._effect["hunted_heli_crashsite_smoke_sim"] = loadfx( "vfx/map/hunted/hunted_heli_crashsite_smoke_sim" );
    level._effect["hunted_heli_crashsite_fire"] = loadfx( "vfx/map/hunted/hunted_heli_crashsite_fire" );
    level._effect["hunted_heli_crashsite_fire_sm"] = loadfx( "vfx/map/hunted/hunted_heli_crashsite_fire_sm" );
    level._effect["sprite_light_fire_flicker_alone"] = loadfx( "fx/fire/sprite_light_fire_flicker_alone" );
    level._effect["waterfall_splash_base_sm_night"] = loadfx( "vfx/water/waterfall_splash_base_sm_night" );
    level._effect["hunted_street_lights"] = loadfx( "vfx/map/hunted/hunted_street_lights" );
    level._effect["hunted_outdoor_light_fixture"] = loadfx( "vfx/map/hunted/hunted_outdoor_light_fixture" );
    level._effect["hunted_headlight_spotlight_alone"] = loadfx( "vfx/lights/hunted/hunted_headlight_spotlight_alone" );
    level._effect["hunted_headlight_spotlight_offset"] = loadfx( "vfx/lights/hunted/hunted_headlight_spotlight_offset" );
    level._effect["hunted_headlight_omni_offset"] = loadfx( "vfx/lights/hunted/hunted_headlight_omni_offset" );
    level._effect["light_red_tower_blinking_vista_sm"] = loadfx( "vfx/lights/light_red_tower_blinking_vista_sm" );
    level._effect["ripple_flow_distortion_single_no_geo"] = loadfx( "vfx/water/ripple_flow_distortion_single_no_geo" );
    level._effect["ripple_flow_distortion_single"] = loadfx( "vfx/water/ripple_flow_distortion_single" );
    level._effect["water_current_turbulence_01"] = loadfx( "vfx/water/water_current_turbulence_01" );
    level._effect["water_splash_base_sm_night"] = loadfx( "vfx/water/water_splash_base_sm_night" );
    level._effect["insects_firefly_b"] = loadfx( "fx/misc/insects_firefly_b" );
    level._effect["hunted_creek_fog"] = loadfx( "vfx/map/hunted/hunted_creek_fog" );
    level._effect["ripple_flow_distortion_single_med_slow"] = loadfx( "vfx/water/ripple_flow_distortion_single_med_slow" );
    level._effect["ripple_flow_distortion_strip_no_geo"] = loadfx( "vfx/water/ripple_flow_distortion_strip_no_geo" );
    level._effect["ca_gas_station_explosion_light"] = loadfx( "vfx/map/hunted/ca_gas_station_explosion_light" );
    level._effect["ca_gas_station_explosion_light_ground"] = loadfx( "vfx/map/hunted/ca_gas_station_explosion_light_ground" );
    level._effect["ca_gas_station_impact_spread_sims"] = loadfx( "vfx/map/hunted/ca_gas_station_impact_spread_sims" );
    level._effect["ca_gas_station_impact_dirt"] = loadfx( "vfx/map/hunted/ca_gas_station_impact_dirt" );
    level._effect["ca_gas_station_impact_spread"] = loadfx( "vfx/map/hunted/ca_gas_station_impact_spread" );
    level._effect["ca_gas_station_fireball"] = loadfx( "vfx/map/hunted/ca_gas_station_fireball" );
    level._effect["ca_gas_station_fireball_02"] = loadfx( "vfx/map/hunted/ca_gas_station_fireball_02" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "fx/fire/firelp_small_streak_pm_v" );
    level._effect["firelp_med_streak_pm_h"] = loadfx( "fx/fire/firelp_med_streak_pm_h" );
    level._effect["firelp_large_pm"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["ca_gas_station_fires_med"] = loadfx( "vfx/map/hunted/ca_gas_station_fires_med" );
    level._effect["firelp_barrel_pm"] = loadfx( "fx/fire/firelp_barrel_pm" );
    level._effect["ca_gas_station_falling_fires"] = loadfx( "vfx/map/hunted/ca_gas_station_falling_fires" );
    level._effect["ca_intro_dizzy"] = loadfx( "vfx/map/hunted/ca_intro_dizzy" );
    level._effect["ca_intro_falling_fires"] = loadfx( "vfx/map/hunted/ca_intro_falling_fires" );
    level._effect["ca_intro_vista_lights"] = loadfx( "vfx/map/hunted/ca_intro_vista_lights" );
    level._effect["chimney_smoke"] = loadfx( "vfx/smoke/chimney_smoke" );
    level._effect["head_fatal"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit_night" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud_dark" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water_dark" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust_dark" ) );
    level._effect["truck_smoke"] = loadfx( "vfx/dust/veh_dust_kick_up_night" );
    level._effect["flashlight"] = loadfx( "fx/misc/flashlight_night_maps" );

    if ( getdvarint( "sm_enable" ) && getdvar( "r_zfeather" ) != "0" )
        level._effect["spotlight"] = loadfx( "fx/misc/hunted_spotlight_model_night_no_noise" );
    else
        level._effect["spotlight"] = loadfx( "fx/misc/spotlight_large_night" );

    level._id_3891["mi17"] = loadfx( "fx/misc/flares_cobra" );
    level._effect["gasstation_explosion"] = loadfx( "vfx/map/hunted/ca_hunted_gasstation_explosion" );
    level._effect["big_explosion"] = loadfx( "vfx/map/hunted/ca_gas_station_big_explosion" );
    level._effect["small_explosion"] = loadfx( "fx/explosions/small_vehicle_explosion_night" );
    level._effect["tracer_incoming"] = loadfx( "fx/misc/tracer_incoming" );
    level._effect["gas_pump_fire"] = loadfx( "vfx/map/hunted/ca_gas_pump_fire" );
    level._effect["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M" );
    level._effect["tire_fire_med"] = loadfx( "vfx/map/hunted/ca_tire_fire_med" );
    level._effect["heli_dlight_blue"] = loadfx( "vfx/map/hunted/ca_aircraft_light_cockpit_blue" );
    level._effect["heli_dlight_red"] = loadfx( "vfx/map/hunted/ca_aircraft_light_cockpit_red" );
    level._effect["missile_explosion"] = loadfx( "vfx/map/hunted/hunted_intro_heli_explosion" );
    level.destructible_effect_override["fx/explosions/small_vehicle_explosion"] = "fx/explosions/small_vehicle_explosion_night";
    level.destructible_effect_override["fx/smoke/car_damage_whitesmoke"] = "fx/smoke/car_damage_whitesmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke"] = "fx/smoke/car_damage_blacksmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke_fire"] = "fx/smoke/car_damage_blacksmoke_fire_night";
    level.destructible_effect_override["fx/props/car_glass_large"] = "fx/props/car_glass_large_night";
    level.destructible_effect_override["fx/props/car_glass_med"] = "fx/props/car_glass_med_night";
    level.destructible_effect_override["fx/props/car_glass_headlight"] = "fx/props/car_glass_headlight_night";
    level.destructible_effect_override["fx/props/car_glass_brakelight"] = "fx/props/car_glass_brakelight_night";
    _id_974C();
    globalfx_override();
    maps\createfx\hunted_fx::main();
    maps\createfx\hunted_sound::main();
}

globalfx_override()
{
    _id_A5A8::_id_1857( "script_vehicle_bm21_cover_destructible", "headlight_truck_left2", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_bm21_cover_destructible", "headlight_truck_right2", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_bm21_mobile_bed_destructible", "headlight_truck_left2", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_bm21_mobile_bed_destructible", "headlight_truck_right2", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_bm21_mobile_cover", "headlight_truck_left2", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_bm21_mobile_cover", "headlight_truck_right2", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "headlight_truck_left", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "headlight_truck_right", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_truck_lf_night", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_truck_rf_night", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_truck_r_night", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_truck_l_night", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "brakelight_truck_right", "tag_taillight_right", "fx/misc/car_brakelight_truck_r_night", "brakelights" );
    _id_A5A8::_id_1857( "script_vehicle_pickup_4door", "brakelight_truck_left", "tag_taillight_left", "fx/misc/car_brakelight_truck_l_night", "brakelights" );
    _id_A538::override_global_fx( "me_streetlight_01_FX_origin", "vfx/map/hunted/hunted_street_lights", undefined, "hunted_street_lights" );
}

_id_974C()
{
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_cover_destructible", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_bed_destructible", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bm21_mobile_cover", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_pickup_4door", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "brick", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "bark", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "carpet", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "cloth", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "concrete", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "dirt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "flesh", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "foliage", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "glass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "grass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "gravel", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "ice", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "mud", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "paper", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "plaster", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "rock", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "sand", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "snow", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "water", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "wood", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "asphalt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "ceramic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "plastic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "rubber", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "cushion", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "fruit", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "painted metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "default", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_blackhawk_hero", "none", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "brick", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "bark", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "carpet", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "cloth", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "concrete", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "dirt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "flesh", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "foliage", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "glass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "grass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "gravel", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "ice", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "mud", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "paper", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "plaster", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "rock", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "sand", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "snow", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "water", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "wood", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "asphalt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "ceramic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "plastic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "rubber", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "cushion", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "fruit", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "painted metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "default", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly", "none", "fx/treadfx/heli_dust_hunted" );
}

fuel_explosion()
{
    common_scripts\_exploder::_id_3528( 20 );
    common_scripts\utility::_id_69C2( "h1_blackhawk_fuel_explode", ( 2577.57, -8615.74, 373.73 ) );
}

ac130_gas_station()
{
    var_0 = getentarray( "gas_station", "targetname" );
    var_1 = getentarray( "gas_station_d", "targetname" );
    var_2 = getentarray( "big_explosion", "targetname" );
    var_3 = getentarray( "small_explosion", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::hide_ent );
    common_scripts\utility::_id_0D13( var_1, ::swap_ent, ( 7680, 0, 0 ) );
}

hide_ent( var_0 )
{
    self hide();
}

swap_ent( var_0 )
{
    self.origin += var_0;
    self show();
}