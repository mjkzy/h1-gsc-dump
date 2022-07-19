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
    level._id_78BA["knife_sequence"] = "parabolic_knife_sequence";
    level._effect["knife_stab"] = loadfx( "fx/misc/parabolic_knife_stab" );
    level._effect["fog_icbm"] = loadfx( "fx/weather/fog_icbm" );
    level._effect["fog_icbm_a"] = loadfx( "fx/weather/fog_icbm_a" );
    level._effect["fog_icbm_b"] = loadfx( "fx/weather/fog_icbm_b" );
    level._effect["fog_icbm_c"] = loadfx( "fx/weather/fog_icbm_c" );
    level._effect["leaves_runner_lghtr"] = loadfx( "fx/misc/leaves_runner_lghtr" );
    level._effect["leaves_runner_lghtr_1"] = loadfx( "fx/misc/leaves_runner_lghtr_1" );
    level._effect["insect_trail_runner_icbm"] = loadfx( "fx/misc/insect_trail_runner_icbm" );
    level._effect["cloud_bank_low_icbm"] = loadfx( "fx/weather/cloud_bank_low_icbm" );
    level._effect["cloud_bank"] = loadfx( "fx/weather/cloud_bank" );
    level._effect["cloud_cover"] = loadfx( "fx/weather/cloud_cover_icbm" );
    level._effect["cloud_bank_a"] = loadfx( "fx/weather/cloud_bank_a" );
    level._effect["cloud_bank_far"] = loadfx( "fx/weather/cloud_bank_far" );
    level._effect["moth_runner"] = loadfx( "fx/misc/moth_runner" );
    level._effect["hawks"] = loadfx( "fx/misc/hawks" );
    level._effect["mist_icbm"] = loadfx( "fx/weather/mist_icbm" );
    level._effect["icbm_vl_int"] = loadfx( "fx/misc/icbm_vl_int" );
    level._effect["icbm_vl_od"] = loadfx( "fx/misc/icbm_vl_od" );
    level._effect["icbm_vl_od_a"] = loadfx( "fx/misc/icbm_vl_od_a" );
    level._effect["icbm_vl_int_wide"] = loadfx( "fx/misc/icbm_vl_int_wide" );
    level._effect["icbm_vl"] = loadfx( "fx/misc/icbm_vl" );
    level._effect["icbm_vl_a"] = loadfx( "fx/misc/icbm_vl_a" );
    level._effect["icbm_vl_a_int"] = loadfx( "fx/misc/icbm_vl_a_int" );
    level._effect["icbm_vl_a_sm"] = loadfx( "fx/misc/icbm_vl_a_sm" );
    level._effect["icbm_vl_b"] = loadfx( "fx/misc/icbm_vl_b" );
    level._effect["icbm_vl_int_ls"] = loadfx( "fx/misc/icbm_vl_int_ls" );
    level._effect["icbm_dust_int"] = loadfx( "fx/smoke/icbm_dust_int" );
    level._effect["icbm_smoke_add"] = loadfx( "fx/smoke/icbm_smoke_add" );
    level._effect["icbm_smoke_add_clr"] = loadfx( "fx/smoke/icbm_smoke_add_clr" );
    level._effect["icbm_smoke_add_clr_a"] = loadfx( "fx/smoke/icbm_smoke_add_clr_a" );
    level._effect["birds_icbm_runner"] = loadfx( "fx/misc/birds_icbm_runner" );
    level._effect["grenade_smoke"] = loadfx( "fx/props/american_smoke_grenade" );
    level._effect["snow_light"] = loadfx( "fx/weather/snow_light_icbm" );
    level._effect["smoke_geotrail_icbm"] = loadfx( "fx/smoke/smoke_geotrail_icbm" );
    level._effect["icbm_launch"] = loadfx( "fx/smoke/icbm_launch" );
    level._effect["flashlight"] = loadfx( "fx/misc/flashlight" );
    level._effect["powerTower_leg"] = loadfx( "fx/props/powerTower_leg" );
    level._effect["powerTower_crash"] = loadfx( "fx/dust/powerTower_crash" );
    level._effect["vehicle_explosion"] = loadfx( "fx/explosions/large_vehicle_explosion" );
    level._effect["powertower_explosion"] = loadfx( "fx/explosions/powertower_explosion_icbm" );
    level._effect["powertower_explosion_02"] = loadfx( "fx/explosions/powertower_explosion_icbm_02" );
    level._effect["powerTower_spark_exp"] = loadfx( "fx/explosions/powerTower_spark_exp" );
    level._effect["powerTower_spark_exp_sm"] = loadfx( "fx/explosions/powerTower_spark_exp_sm" );
    level._effect["icbm_post_light_red"] = loadfx( "fx/misc/icbm_post_light_red" );
    level._effect["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light_icbm" );
    level._effect["tower_c4_exp_dust"] = loadfx( "fx/dust/tower_c4_exp_dust" );
    level._effect["tower_c4_down_dust"] = loadfx( "fx/dust/tower_c4_down_dust" );
    level._effect["freezespray"] = loadfx( "fx/props/freezespray_icbm" );
    level._effect["firelp_med_pm_icbm"] = loadfx( "fx/fire/firelp_med_pm_icbm" );
    level._effect["firelp_med_pm_grow_icbm"] = loadfx( "fx/fire/firelp_med_pm_grow_icbm" );
    level._effect["firelp_med_pm_icbm_smokeonly"] = loadfx( "vfx/map/icbm/firelp_med_pm_icbm_smokeonly" );
    level._effect["sparks_ground_tower_wire"] = loadfx( "vfx/map/icbm/sparks_ground_tower_wire_icbm" );
    level._effect["smk_tower_cut"] = loadfx( "vfx/map/icbm/smk_tower_cut" );
    level._effect["falling_snowchunks_icbm"] = loadfx( "vfx/map/icbm/falling_snowchunks_icbm" );
    level._effect["heli_dust_flyover_snow"] = loadfx( "vfx/map/icbm/heli_dust_flyover_snow" );
    level._effect["heli_dust_flyover_snow_less"] = loadfx( "vfx/map/icbm/heli_dust_flyover_snow_less" );
    level._effect["elec_sparks_exp_icbm"] = loadfx( "vfx/map/icbm/elec_sparks_exp_icbm" );
    level._effect["electrical_spark_loop_icbm"] = loadfx( "vfx/map/icbm/electrical_spark_loop_icbm" );
    level._effect["electricity_online_icbm"] = loadfx( "vfx/map/icbm/electricity_online_icbm" );
    level._effect["fx_sunflare_icbm"] = loadfx( "vfx/lensflare/fx_sunflare_icbm" );
    level._effect["hunted_headlight_spotlight_alone"] = loadfx( "vfx/lights/hunted/hunted_headlight_spotlight_alone" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_snow" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "snow", loadfx( "fx/impacts/footstep_snow" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    override_uaz_fx();
    maps\createfx\icbm_fx::main();
    maps\createfx\icbm_sound::main();
}

playereffect()
{
    level endon( "stop_snow" );
    var_0 = getentarray( "player", "classname" )[0];

    for (;;)
    {
        playfx( level._effect["snow_light"], var_0.origin + ( 0, 0, 300 ), var_0.origin + ( 0, 0, 350 ) );
        wait 0.075;
    }
}

cloudcover()
{
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 16297.7, -22377.5, 352.957 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 11919.2, -21866.1, 317.02 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 9175.91, -21694.6, 317.02 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 6279.5, -22038.7, 170.964 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 4398.43, -20449.8, 180.961 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 2362.25, -19845.8, 552.572 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -15;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 16297.7, -22377.5, 352.957 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 11886.4, -21637.4, 317.02 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 9210.19, -21701.7, 317.02 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 6279.5, -22038.7, 290.964 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 4398.43, -20449.8, 268.961 );
    var_0.v["angles"] = ( 86.0004, 179.999, 0 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
    var_0 = common_scripts\utility::_id_242E( "cloud_cover" );
    var_0.v["origin"] = ( 1306.07, -19108, 470.969 );
    var_0.v["angles"] = ( 89.9996, 12.6698, -167.33 );
    var_0.v["fxid"] = "cloud_cover";
    var_0.v["delay"] = -100;
}

override_uaz_fx()
{
    _id_A5A8::_id_1857( "script_vehicle_uaz_hardtop_destructible", "headlight_truck_left2", "tag_headlight_left", "vfx/map/icbm/car_headlight_icbm", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_uaz_hardtop_destructible", "headlight_truck_right2", "tag_headlight_right", "vfx/map/icbm/car_headlight_icbm", "headlights" );
    _id_A5A8::_id_1857( "script_vehicle_uaz_hardtop_destructible", "brakelight_troops_right", "tag_light_right_back", "vfx/map/icbm/car_brakelight_icbm", "brakelights" );
    _id_A5A8::_id_1857( "script_vehicle_uaz_hardtop_destructible", "brakelight_troops_left", "tag_light_left_back", "vfx/map/icbm/car_brakelight_icbm", "brakelights" );
}