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
    level._id_099B = loadfx( "vfx/map/village_defend/village_defend_clusterbomb" );
    level.mortareffect = loadfx( "fx/explosions/artilleryExp_dirt_brown_va" );
    level.bombstrike = loadfx( "fx/explosions/wall_explosion_pm_a" );
    level.fx_airstrike_afterburner = loadfx( "fx/fire/jet_afterburner" );
    level.fx_airstrike_contrail = loadfx( "fx/smoke/jet_contrail" );
    level.fx_airstrike_contrail_02 = loadfx( "fx/smoke/jet_contrail_02" );
    level.smokegrenade = loadfx( "fx/smoke/h1_ca_smoke_grenade_low" );
    level._effect["smokescreen_barbed_wire"] = loadfx( "fx/smoke/h1_ca_smoke_grenade_low_close" );
    level.megaexplosion = loadfx( "fx/explosions/powerTower_explosion" );
    level._effect["fx_sunflare_village_defend"] = loadfx( "vfx/lensflare/fx_sunflare_village_defend" );
    level._effect["village_smolder_black_smoke_sm"] = loadfx( "fx/smoke/village_smolder_black_smoke_sm" );
    level._effect["village_smolder_black_smoke"] = loadfx( "fx/smoke/village_smolder_black_smoke" );
    level._effect["village_smolder_heli"] = loadfx( "fx/smoke/village_smolder_heli" );
    level._effect["waterfall_splash_base_sm"] = loadfx( "vfx/water/waterfall_splash_base_sm" );
    level._effect["00_particle_shadow_animated_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_d" );
    level._effect["00_particle_shadow_animated_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_d" );
    level._effect["00_particle_shadow_animated_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_d" );
    level._effect["00_particle_shadow_static_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_d" );
    level._effect["00_particle_shadow_static_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_d" );
    level._effect["00_particle_shadow_static_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_d" );
    level._effect["electrical_spark_loop"] = loadfx( "vfx/sparks/electrical_spark_loop" );
    level._effect["fire_drip"] = loadfx( "vfx/fire/fire_drip" );
    level._effect["village_defend_vista_smoke_stacks"] = loadfx( "vfx/map/village_defend/village_defend_vista_smoke_stacks" );
    level._effect["fire_burnt_surface_line"] = loadfx( "vfx/fire/fire_burnt_surface_line" );
    level._effect["ca_smoke_sim_window_01"] = loadfx( "vfx/smoke/ca_smoke_sim_window_01" );
    level._effect["village_fog_vista"] = loadfx( "vfx/fog/village_fog_vista" );
    level._effect["village_fog_vista_lrg"] = loadfx( "vfx/fog/village_fog_vista_lrg" );
    level._effect["village_fog_vista_near_fade"] = loadfx( "vfx/fog/village_fog_vista_near_fade" );
    level._effect["village_fog_vista_near_fade_sm"] = loadfx( "vfx/fog/village_fog_vista_near_fade_sm" );
    level._effect["village_morning_fog"] = loadfx( "fx/smoke/village_morning_fog" );
    level._effect["village_morning_fog_02"] = loadfx( "fx/smoke/village_morning_fog_02" );
    level._effect["village_morning_fog_03"] = loadfx( "fx/smoke/village_morning_fog_03" );
    level._effect["village_morning_fog_03b"] = loadfx( "fx/smoke/village_morning_fog_03b" );
    level._effect["village_morning_fog_04"] = loadfx( "fx/smoke/village_morning_fog_04" );
    level._effect["village_morning_fog_05"] = loadfx( "fx/smoke/village_morning_fog_05" );
    level._effect["village_morning_fog_06"] = loadfx( "fx/smoke/village_morning_fog_06" );
    level._effect["village_smolder"] = loadfx( "fx/smoke/village_smolder" );
    level._effect["village_smolder_church"] = loadfx( "fx/smoke/village_smolder_church" );
    level._effect["village_smolder_church_windows"] = loadfx( "fx/smoke/village_smolder_church_windows" );
    level._effect["village_smolder_alt"] = loadfx( "fx/smoke/village_smolder_alt" );
    level._effect["firelp_small_dl"] = loadfx( "fx/fire/firelp_small_dl" );
    level._effect["insect_trail_runner"] = loadfx( "fx/misc/insect_trail_runner" );
    level._effect["moth_runner"] = loadfx( "fx/misc/moth_runner" );
    level._effect["insects_carcass_runner"] = loadfx( "fx/misc/insects_carcass_runner" );
    level._effect["insects_carcass_runner_far"] = loadfx( "fx/misc/insects_carcass_runner_far" );
    level._effect["lava"] = loadfx( "fx/misc/lava" );
    level._effect["lava_a"] = loadfx( "fx/misc/lava_a" );
    level._effect["lava_b"] = loadfx( "fx/misc/lava_b" );
    level._effect["lava_c"] = loadfx( "fx/misc/lava_c" );
    level._effect["lava_d"] = loadfx( "fx/misc/lava_d" );
    level._effect["lava_ash_runner"] = loadfx( "fx/misc/lava_ash_runner" );
    level._effect["firelp_small_dl_h"] = loadfx( "fx/fire/firelp_small_dl_h" );
    level._effect["firelp_small_dl"] = loadfx( "fx/fire/firelp_small_dl" );
    level._effect["village_def_vl_sml"] = loadfx( "fx/misc/village_def_vl_sml" );
    level._effect["village_def_vl_sml_a"] = loadfx( "fx/misc/village_def_vl_sml_a" );
    level._effect["village_vl_sml"] = loadfx( "fx/misc/village_vl_sml" );
    level._effect["village_vl_sml_half_opaque"] = loadfx( "fx/misc/village_vl_sml_half_opaque" );
    level._effect["village_vl_sml_opaque"] = loadfx( "fx/misc/village_vl_sml_opaque" );
    level._effect["village_vl_sml_child"] = loadfx( "fx/misc/village_vl_sml_child" );
    level._effect["village_vl_int"] = loadfx( "fx/misc/village_vl_int" );
    level._effect["village_vl_int_a"] = loadfx( "fx/misc/village_vl_int_a" );
    level._effect["village_vl_lrg"] = loadfx( "fx/misc/village_vl_lrg" );
    level._effect["village_cloud_far"] = loadfx( "fx/weather/village_cloud_far" );
    level._effect["icbm_dust_int"] = loadfx( "fx/smoke/icbm_dust_int" );
    level._effect["ambient_particles_light_cone_sm"] = loadfx( "vfx/dust/ambient_particles_light_cone_sm" );
    level._effect["village_bounce"] = loadfx( "fx/misc/village_bounce" );
    level._effect["hawks"] = loadfx( "fx/misc/hawks" );
    level._effect["leaves_runner_pine"] = loadfx( "fx/misc/leaves_runner_pine" );
    level._effect["birds_village_runner"] = loadfx( "fx/misc/birds_village_runner" );
    level._effect["birds_village_runner_far"] = loadfx( "fx/misc/birds_village_runner_far" );
    level._effect["sewer_stream_village"] = loadfx( "fx/distortion/sewer_stream_village" );
    level._effect["sewer_stream_village_far"] = loadfx( "fx/distortion/sewer_stream_village_far" );
    level._effect["fire_lp_smk_s_light_burst"] = loadfx( "vfx/fire/fire_lp_smk_s_light_burst" );
    level._effect["impact_scorchmark_med_burst"] = loadfx( "vfx/fire/impact_scorchmark_med_burst" );
    level._effect["trail_smk_dark_sm_fire"] = loadfx( "vfx/trail/trail_smk_dark_sm_fire" );
    level._effect["fireplace_fire_mp"] = loadfx( "vfx/fire/fireplace_fire_mp" );
    level._effect["village_defend_chimney_smoke"] = loadfx( "vfx/map/village_defend/village_defend_chimney_smoke" );
    level._effect["ripple_flow_distortion_strip_no_geo_fast"] = loadfx( "vfx/water/ripple_flow_distortion_strip_no_geo_fast" );
    level._effect["ripple_flow_distortion_strip_heavy_foam"] = loadfx( "vfx/water/ripple_flow_distortion_strip_heavy_foam" );
    level._effect["water_drip"] = loadfx( "vfx/water/falling_drip_ceil_village_defend" );
    level._effect["water_trickle"] = loadfx( "vfx/water/falling_pipe_water_trickle_straight_continue" );
    level._effect["splash_up"] = loadfx( "fx/water/splash_village_defend" );
    level._effect["village_defend_pond ripples"] = loadfx( "vfx/map/village_defend/village_defend_pond_ripples" );
    level._effect["shower_spray"] = loadfx( "fx/misc/shower_spray" );
    level._effect["rain_noise"] = loadfx( "fx/weather/rain_noise" );
    level._effect["rain_noise_ud"] = loadfx( "fx/weather/rain_noise_ud" );
    level._effect["belltower_explosion"] = loadfx( "fx/explosions/belltower_explosion" );
    level._effect["belltower_explosion_windows"] = loadfx( "fx/explosions/belltower_explosion_windows" );
    level._effect["tracer_incoming"] = loadfx( "fx/misc/tracer_incoming" );
    level._effect["killzone_marker"] = loadfx( "fx/misc/ui_flagbase_gold_verticle" );
    level._effect["killzone_marker_red"] = loadfx( "fx/misc/ui_flagbase_gold_verticle_red" );
    level._effect["turret_overheat_haze"] = loadfx( "fx/distortion/abrams_exhaust" );
    level._effect["turret_overheat_smoke"] = loadfx( "fx/distortion/armored_car_overheat" );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud_dark" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    _id_974C();
    maps\createfx\village_defend_fx::main();
    maps\createfx\village_defend_sound::main();
}

_id_974C()
{
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "brick", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "bark", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "carpet", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "cloth", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "concrete", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "dirt", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "flesh", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "foliage", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "glass", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "grass", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "gravel", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "ice", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "metal", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "mud", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "paper", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "plaster", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "rock", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "sand", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "snow", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "water", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "water_waist", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "water_knee", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "water_ankle", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "wood", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "asphalt", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "ceramic", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "plastic", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "rubber", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "cushion", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "fruit", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "painted metal", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "default", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_t72_tank_woodland", "none", "fx/treadfx/tread_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "brick", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "bark", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "carpet", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "cloth", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "concrete", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "dirt", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "flesh", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "foliage", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "glass", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "grass", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "gravel", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "ice", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "metal", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "mud", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "paper", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "plaster", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "rock", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "sand", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "snow", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "water", "fx/treadfx/seaknight_water" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "water_waist", "fx/treadfx/seaknight_water" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "water_knee", "fx/treadfx/seaknight_water" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "water_ankle", "fx/treadfx/seaknight_water" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "wood", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "asphalt", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "ceramic", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "plastic", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "rubber", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "cushion", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "fruit", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "painted metal", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "default", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_ch46e", "none", "fx/treadfx/heli_dust_village_defend" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "brick", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "bark", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "carpet", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cloth", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "concrete", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "dirt", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "flesh", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "foliage", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "glass", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "grass", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "gravel", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ice", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "metal", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "mud", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "paper", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plaster", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rock", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "sand", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "snow", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "wood", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "asphalt", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "ceramic", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "plastic", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "rubber", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "cushion", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "fruit", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "painted metal", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "default", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
    _id_A59D::_id_8350( "script_vehicle_mi17_woodland_fly_cheap", "none", "fx/treadfx/heli_dust_village_defend", "h1r_village_defend_mi17_helicopter_wind" );
}