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
    level._effect["steam_coffee_slow_coup"] = loadfx( "vfx/steam/steam_coffee_slow_coup" );
    level._effect["birds_flyout_coup"] = loadfx( "vfx/animal/birds_flyout_coup" );
    level._effect["lensflare_floodlight_on_airlift"] = loadfx( "vfx/lights/lensflare_floodlight_on_airlift" );
    level._effect["paint_spray_coup"] = loadfx( "vfx/unique/paint_spray_coup" );
    level._effect["execution_muzzleflash"] = loadfx( "vfx/muzzleflash/execution_flash_view_coup" );
    level._effect["execution_shell_eject"] = loadfx( "fx/shellejects/execution_pistol" );
    level._effect["ak47_muzzleflash"] = loadfx( "fx/muzzleflashes/ak47_flash_wv" );
    level._effect["ak47_shelleject"] = loadfx( "fx/muzzleflashes/ak47_flash_wv" );
    level._effect["fx_sunflare_the_coup"] = loadfx( "vfx/lensflare/fx_sunflare_the_coup" );
    level._effect["fly"] = loadfx( "vfx/animal/insects_flies_garbage_coup" );
    level._effect["birds_takeoff"] = loadfx( "fx/misc/birds_takeoff_coup" );
    level._effect["bird_seagull_flock_large"] = loadfx( "fx/misc/bird_seagull_flock_large" );
    level._effect["car_interior"] = loadfx( "fx/misc/coup_car_interior" );
    level._effect["firelp_med_pm"] = loadfx( "vfx/fire/vehicle_fire_med_coup" );
    level._effect["firelp_small_pm"] = loadfx( "vfx/fire/fire_ext_small_coup" );
    level._effect["firelp_small_pm_a"] = loadfx( "vfx/fire/fire_ext_xsmall_coup" );
    level._effect["dust_wind_slow_yel"] = loadfx( "fx/dust/dust_wind_slow_yel_loop_coup" );
    level._effect["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_loop_coup" );
    level._effect["dust_wind_spiral"] = loadfx( "vfx/dust/dust_spiral_runner_coup" );
    level._effect["ground_sand_scroll"] = loadfx( "vfx/sand/ground_sand_skitter_coup" );
    level._effect["ambient_sand_lingering_coup"] = loadfx( "vfx/sand/ambient_sand_lingering_coup" );
    level._effect["00_particle_shadow_static_med_coup"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_coup" );
    level._effect["cloud_med"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_coup" );
    level._effect["heat_distortion_mirage_med"] = loadfx( "vfx/distortion/heat_distortion_mirage_med_coup" );
    level._effect["wavebreak_runner"] = loadfx( "vfx/water/wavebreak_runner_coup" );
    level._effect["paper_sheet_01_blowing"] = loadfx( "vfx/wind/paper_sheet_01_blowing_coup" );
    level._effect["hawk"] = loadfx( "fx/weather/hawk" );
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
    _id_974C();
    maps\createfx\coup_fx::main();
    maps\createfx\coup_sound::main();
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "brick", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "bark", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "carpet", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "cloth", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "concrete", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "dirt", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "flesh", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "foliage", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "glass", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "grass", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "gravel", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "ice", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "mud", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "paper", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "plaster", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "rock", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "sand", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "snow", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "water", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "wood", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "asphalt", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "ceramic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "plastic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "rubber", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "cushion", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "fruit", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "painted metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "default", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bmp", "none", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "brick", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "bark", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "carpet", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "cloth", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "concrete", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "dirt", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "flesh", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "foliage", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "glass", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "grass", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "gravel", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "ice", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "mud", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "paper", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "plaster", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "rock", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "sand", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "snow", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "water", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "wood", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "asphalt", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "ceramic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "plastic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "rubber", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "cushion", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "fruit", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "painted metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "default", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_luxurysedan", "none", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "brick", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "bark", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "carpet", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "cloth", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "concrete", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "dirt", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "flesh", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "foliage", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "glass", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "grass", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "gravel", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "ice", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "mud", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "paper", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "plaster", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "rock", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "sand", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "snow", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "water", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "wood", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "asphalt", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "ceramic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "plastic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "rubber", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "cushion", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "fruit", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "painted metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "default", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_bm21_mobile_bed", "none", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "brick", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "bark", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "carpet", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "cloth", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "concrete", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "dirt", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "flesh", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "foliage", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "glass", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "grass", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "gravel", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "ice", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "mud", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "paper", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "plaster", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "rock", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "sand", "fx/treadfx/tread_dust_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "snow", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "water", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "wood", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "asphalt", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "ceramic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "plastic", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "rubber", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "cushion", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "fruit", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "painted metal", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "default", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_80s_sedan1_silv", "none", "fx/treadfx/tread_road_coup" );
    maps\_treadfx::_id_7F1E( "script_vehicle_mi17_woodland_fly", "fx/treadfx/tread_empty_default" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly", "sand", "fx/treadfx/heli_dust_default_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_mi17_woodland_fly", "water", "fx/treadfx/heli_water_coup" );
    maps\_treadfx::_id_8350( "script_vehicle_mi24p_hind_desert", "water", "fx/treadfx/heli_water_coup" );
}
