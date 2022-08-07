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
    level._effect["fog_bog_a"] = loadfx( "fx/weather/fog_bog_a_02" );
    level._effect["fog_bog_a_darker"] = loadfx( "fx/weather/fog_bog_a_darker" );
    level._effect["antiair_runner"] = loadfx( "fx/misc/antiair_runner_cloudy_bog_a" );
    level._effect["tunnel_smoke_bog_a"] = loadfx( "fx/smoke/tunnel_smoke_bog_a" );
    level._effect["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_bog_a" );
    level._effect["building_back_smoke_bog_a"] = loadfx( "fx/smoke/building_back_smoke_bog_a" );
    level._effect["hallway_smoke_dark"] = loadfx( "fx/smoke/hallway_smoke_dark" );
    level._effect["heli_explosion"] = loadfx( "fx/explosions/helicopter_explosion_bog_a" );
    level._effect["heli_aerial_explosion"] = loadfx( "fx/explosions/aerial_explosion_bog_a" );
    level._effect["heli_aerial_explosion_large"] = loadfx( "fx/explosions/aerial_explosion_large_bog_a" );
    level._effect["explosion_light"] = loadfx( "fx/explosions/explosion_light_runner_bog_a" );
    level._effect["special_fire"] = loadfx( "fx/muzzleflashes/m16_flash_wv" );
    level._effect["blood_pool"] = loadfx( "fx/impacts/deathfx_bloodpool" );
    level._effect["flesh_hit"] = loadfx( "fx/impacts/flesh_hit" );
    level._effect["freezespray"] = loadfx( "fx/props/freezespray" );
    level._effect["beacon_glow"] = loadfx( "fx/misc/h1_ca_ui_pickup_available" );
    level._effect["ash_falling_bog_a"] = loadfx( "fx/misc/ash_falling_bog_a" );
    level._effect["thin_black_smoke_M_bog_a"] = loadfx( "fx/smoke/thin_black_smoke_M_bog_a" );
    level._effect["thin_black_smoke_L_bog_a"] = loadfx( "fx/smoke/thin_black_smoke_L_bog_a" );
    level._effect["smoke_window_slow_fb_sm"] = loadfx( "vfx/smoke/smoke_window_sm_bog_a" );
    level._effect["hunted_fog_vista_night"] = loadfx( "vfx/fog/hunted_fog_vista_night" );
    level._effect["streetlight_bog_a_fx"] = loadfx( "vfx/lights/light_cone_streetlight_bog_a" );
    level._effect["leaves_runner_bog_a"] = loadfx( "vfx/map/bog_a/leaves_runner_bog_a" );
    level._effect["firelp_small_pm"] = loadfx( "fx/fire/firelp_small_pm_bog_a" );
    level._effect["firelp_small_pm_a"] = loadfx( "fx/fire/firelp_small_pm_a_bog_a" );
    level._effect["firelp_med_pm_w_tail"] = loadfx( "fx/fire/firelp_med_pm_w_tail" );
    level._effect["firelp_barrel_pm"] = loadfx( "fx/fire/firelp_barrel_pm_bog_a" );
    level._effect["smoke_trail_heli"] = loadfx( "fx/fire/fire_smoke_trail_L_bog_a" );
    level._effect["fire_window_bog_a"] = loadfx( "vfx/fire/window_fire_mwr_bog_a" );
    level._effect["fire_remain_building_mwr"] = loadfx( "vfx/map/bog_a/fire_remain_building_mwr" );
    level._effect["fire_remain_building_sm_mwr"] = loadfx( "vfx/map/bog_a/fire_remain_building_sm_mwr" );
    level._effect["building_debris_fall"] = loadfx( "vfx/map/bog_a/building_debris_fall" );
    level._effect["falling_water_narrow_bog_a"] = loadfx( "vfx/map/bog_a/falling_water_narrow_bog_a" );
    level._effect["falling_water_bog_a"] = loadfx( "vfx/map/bog_a/falling_water_bog_a" );
    level._effect["vl_a_bog_a"] = loadfx( "vfx/map/bog_a/vl_a_bog_a" );
    level._effect["vista_back_smoke_bog_a"] = loadfx( "vfx/map/bog_a/vista_back_smoke_bog_a" );
    level._effect["smoke_sm_bog_a"] = loadfx( "vfx/map/bog_a/smoke_sm_bog_a" );
    level._effect["smoke_lg_bog_a"] = loadfx( "vfx/map/bog_a/smoke_lg_bog_a" );
    level._effect["fx_sunflare_bog_a"] = loadfx( "vfx/lensflare/fx_sunflare_bog_a" );
    level._effect["wall_explosion_pm"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["wall_explosion_pm_a"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["wall_explosion_pm_b"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["exploder"]["1006"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["exploder"]["1000"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["exploder"]["1007"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["exploder"]["1005"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["exploder"]["1004"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["exploder"]["1003"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["exploder"]["1002"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["exploder"]["1001"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_02" );
    level._effect["exploder"]["1008"] = loadfx( "vfx/map/bog_a/ca_explosion_wall_01" );
    level._effect["lightning"] = loadfx( "fx/weather/horizon_flash_runner_bog_a" );
    level._effect["lightning_bolt_lrg"] = loadfx( "fx/weather/horizon_flash_runner_bog_a" );
    level._effect["lightning_bolt"] = loadfx( "fx/weather/horizon_flash_runner_bog_a" );
    level.destructible_effect_override["fx/explosions/small_vehicle_explosion"] = "fx/explosions/small_vehicle_explosion_night";
    level.destructible_effect_override["fx/smoke/car_damage_whitesmoke"] = "fx/smoke/car_damage_whitesmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke"] = "fx/smoke/car_damage_blacksmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke_fire"] = "fx/smoke/car_damage_blacksmoke_fire_night";
    level.destructible_effect_override["fx/props/car_glass_large"] = "fx/props/car_glass_large_night";
    level.destructible_effect_override["fx/props/car_glass_med"] = "fx/props/car_glass_med_night";
    level.destructible_effect_override["fx/props/car_glass_headlight"] = "fx/props/car_glass_headlight_night";
    level.destructible_effect_override["fx/props/car_glass_brakelight"] = "fx/props/car_glass_brakelight_night";
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "metal", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust" ) );
    globalfx_override();
    _id_974C();
    thread horizon_flashes();
    maps\createfx\bog_a_fx::main();
    maps\createfx\bog_a_sound::main();
}

horizon_flashes()
{
    for (;;)
    {
        var_0 = randomfloatrange( 1, 4 );
        var_1 = randomint( 3 );
        wait(var_0);
        common_scripts\_exploder::_id_3528( 10 + var_1 );
    }
}

globalfx_override()
{
    maps\_global_fx::override_global_fx( "barrel_fireFX_origin", "fx/fire/firelp_barrel_pm_bog_a", undefined, "fire_barrel_small", "fire_wood_small" );
    maps\_global_fx::override_global_fx( "me_dumpster_fire_FX_origin", "fx/fire/firelp_med_pm_bog_a", undefined, "fire_dumpster_medium", "fire_metal_small" );
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "brick", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "bark", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "carpet", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "cloth", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "concrete", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "dirt", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "flesh", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "foliage", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "glass", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "grass", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "gravel", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "ice", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "metal", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "mud", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "paper", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "plaster", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "rock", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "sand", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "snow", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "water", "vfx/map/bog_a/heli_dust_water_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "wood", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "asphalt", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "ceramic", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "plastic", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "rubber", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "cushion", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "fruit", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "painted metal", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "default", "vfx/map/bog_a/heli_dust_bog_a" );
    maps\_treadfx::_id_8350( "script_vehicle_cobra_helicopter_fly_low", "none", "vfx/map/bog_a/heli_dust_bog_a" );
}
