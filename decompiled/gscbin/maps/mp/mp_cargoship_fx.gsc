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
    level._effect["fog_vista_corridor_cargoship_mp_"] = loadfx( "vfx/fog/fog_vista_corridor_cargoship_mp_" );
    level._effect["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._effect["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._effect["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._effect["coolaidmanbrick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._effect["rain_heavy_mist"] = loadfx( "fx/weather/rain_heavy_mist_mpcargoship" );
    level._effect["rain_heavy"] = loadfx( "fx/weather/rain_heavy_mpcargoship" );
    level._effect["lightning"] = loadfx( "vfx/lightning/lightning_runner_mp_cargoship" );
    level._effect["spotlight"] = loadfx( "vfx/lights/light_cone_streetlight_cargoship_mp" );
    level._effect["cgoshp_drips"] = loadfx( "fx/misc/cgoshp_drips_mp" );
    level._effect["cgoshp_drips_a"] = loadfx( "fx/misc/cgoshp_drips_mp" );
    level._effect["mp_cargoship_rain_noise01"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise01" );
    level._effect["mp_cargoship_rain_noise02"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise02" );
    level._effect["mp_cargoship_rain_noise03"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise03" );
    level._effect["mp_cargoship_rain_noise04"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise04" );
    level._effect["mp_cargoship_rain_noise05"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise05" );
    level._effect["mp_cargoship_rain_noise_ud01"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise_ud01" );
    level._effect["mp_cargoship_rain_noise_ud02"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise_ud02" );
    level._effect["mp_cargoship_rain_noise_ud03"] = loadfx( "fx/ambient_runners/mp_cargoship_rain_noise_ud03" );
    level._effect["screen_rain_mp"] = loadfx( "vfx/rain/screen_heavy_rain_cargoship_mp" );
    level._effect["cargoship_light_tip_red"] = loadfx( "fx/misc/cargoship_mp_light_tip_red" );
    level._effect["cargoship_light_tip_green"] = loadfx( "fx/misc/cargoship_mp_light_tip_green" );
    level._effect["cargoship_light_tip_white"] = loadfx( "fx/misc/cargoship_mp_light_tip_white" );
    level._effect["water_pipe_leak_interior_loop_cgoshp"] = loadfx( "vfx/water/water_pipe_leak_interior_loop_cgoshp" );
    level._effect["heavy_mist_cargoship_mp"] = loadfx( "fx/weather/heavy_mist_cargoship_mp" );
    level._effect["battlefield_smokebank_bog_a"] = loadfx( "fx/smoke/battlefield_smokebank_bog_a" );
    level._effect["lightning strikes"] = loadfx( "vfx/lightning/lightning_strike_runner_cargoship_mp" );
    level._effect["lightning strikes vista"] = loadfx( "vfx/lightning/lightning_strike_vista_runner_cargoship_mp" );
    level._effect["fog vista"] = loadfx( "vfx/fog/fog_vista_cargoship_mp" );
    level._effect["dust_ambient_interior"] = loadfx( "vfx/dust/dust_ambient_interior_cargoship_mp" );
}
