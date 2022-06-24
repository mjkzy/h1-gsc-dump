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
    level._id_058F["broadcast_wind_debris"] = loadfx( "vfx/map/mp_broadcast/broadcast_wind_debris" );
    level._id_058F["broadcast_godray_haze"] = loadfx( "vfx/map/mp_broadcast/broadcast_godray_haze" );
    level._id_058F["audio_meter_led"] = loadfx( "vfx/map/mp_broadcast/audio_meter_led" );
    level._id_058F["godray_ambient_long_mp"] = loadfx( "vfx/lights/godray_ambient_long_mp" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["godray_ambient_small_mp"] = loadfx( "vfx/lights/godray_ambient_small_mp" );
    level._id_058F["broadcast_sun_lensflare"] = loadfx( "vfx/map/mp_broadcast/broadcast_sun_lensflare" );
    level._id_058F["computer_light_blue_blink_xsmall"] = loadfx( "vfx/lights/computer_light_blue_blink_xsmall" );
    level._id_058F["computer_light_green_blink_xsmall"] = loadfx( "vfx/lights/computer_light_green_blink_xsmall" );
    level._id_058F["computer_light_red_blink_xsmall"] = loadfx( "vfx/lights/computer_light_red_blink_xsmall" );
    level._id_058F["fan_steam"] = loadfx( "vfx/steam/dlc/fan_steam" );
    level._id_058F["strike_sparks_runner"] = loadfx( "vfx/map/mp_strike/strike_sparks_runner" );
    level._id_058F["light_red_tower_blinking"] = loadfx( "vfx/lights/light_red_tower_blinking" );
    level._id_058F["broadcast_hallway_smoke"] = loadfx( "vfx/map/mp_broadcast/broadcast_hallway_smoke" );
    level._id_058F["broadcast_dust_wind"] = loadfx( "vfx/map/mp_broadcast/broadcast_dust_wind" );
    level._id_058F["amb_dust_unlit_dayonly"] = loadfx( "vfx/dust/amb_dust_unlit_dayonly" );
    level._id_058F["strike_dust_ambient_street"] = loadfx( "vfx/map/mp_strike/strike_dust_ambient_street" );
    level._id_058F["ambient_hallway_dust_01"] = loadfx( "vfx/map/ambush/ambient_hallway_dust_01" );
    level._id_058F["dust_ambient_street"] = loadfx( "vfx/dust/dlc/dust_ambient_street" );
    level._id_058F["dust_falling_ceiling_light_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._id_058F["amb_dust_wind_01"] = loadfx( "vfx/dust/amb_dust_wind_01" );
    level._id_058F["dust_blowing_ground_02_runner"] = loadfx( "vfx/map/mp_solar/dust_blowing_ground_02_runner" );
    level._id_058F["dust_ambient_street_recovery"] = loadfx( "vfx/map/mp_recovery/dust_ambient_street_recovery" );
    level._id_058F["light_skylight_haze"] = loadfx( "vfx/lights/light_skylight_haze" );
    level._id_058F["dust_ambient_interior"] = loadfx( "vfx/fog/dust_ambient_interior" );
    level._id_058F["dust_wind_fast"] = loadfx( "fx/dust/dust_wind_fast" );
    level._id_058F["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_broadcast" );
    level._id_058F["dust_wind_spiral"] = loadfx( "fx/dust/dust_spiral_runner" );
    level._id_058F["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._id_058F["dust_ceiling_ash_large"] = loadfx( "fx/dust/dust_ceiling_ash_large" );
    level._id_058F["light_dust_particles"] = loadfx( "fx/dust/light_dust_particles" );
    level._id_058F["power_tower_light_red_blink"] = loadfx( "fx/misc/power_tower_light_red_blink" );
}
