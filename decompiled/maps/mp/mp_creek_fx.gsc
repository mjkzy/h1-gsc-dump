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
    level._effect["leaves_ground_gentlewind"] = loadfx( "vfx/wind/leaves_ground_gentlewind" );
    level._effect["creek_ember_smoke_small"] = loadfx( "vfx/map/mp_creek/creek_ember_smoke_small" );
    level._effect["creek_ember_smoke"] = loadfx( "vfx/map/mp_creek/creek_ember_smoke" );
    level._effect["creek_cave_lens_dust"] = loadfx( "vfx/map/mp_creek/creek_cave_lens_dust" );
    level._effect["broadcast_godray_haze"] = loadfx( "vfx/map/mp_broadcast/broadcast_godray_haze" );
    level._effect["mp_creek_flashlight_flare"] = loadfx( "vfx/map/mp_creek/mp_creek_flashlight_flare" );
    level._effect["mp_ground_grassdirt_runner"] = loadfx( "vfx/map/mp_climate/mp_ground_grassdirt_runner" );
    level._effect["mp_creek_leaves_tornado"] = loadfx( "vfx/map/mp_creek/mp_creek_leaves_tornado" );
    level._effect["mp_creek_dragonflys"] = loadfx( "vfx/map/mp_creek/mp_creek_dragonflys" );
    level._effect["mp_creek_area_leaves"] = loadfx( "vfx/map/mp_creek/mp_creek_area_leaves" );
    level._effect["sewage_flies_flying"] = loadfx( "vfx/map/mp_clowntown/sewage_flies_flying" );
    level._effect["mp_creek_cave_dust"] = loadfx( "vfx/map/mp_creek/mp_creek_cave_dust" );
    level._effect["mp_creek_falling_dust"] = loadfx( "vfx/map/mp_creek/mp_creek_falling_dust" );
    level._effect["mp_creek_waterfall_1"] = loadfx( "vfx/map/mp_creek/mp_creek_waterfall_1" );
    level._effect["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._effect["hallway_smoke"] = loadfx( "vfx/map/mp_broadcast/broadcast_hallway_smoke" );
    level._effect["mp_creek_waterfall"] = loadfx( "vfx/map/mp_creek/mp_creek_waterfall" );
    level._effect["leaves_small_fall_gentlewind"] = loadfx( "vfx/wind/leaves_small_fall_gentlewind" );
    level._effect["leaves_fall_gentlewind"] = loadfx( "vfx/wind/leaves_fall_gentlewind" );
    level._effect["fog_daytime"] = loadfx( "fx/weather/fog_daytime" );
    level._effect["mp_overgrown_insects01"] = loadfx( "fx/ambient_runners/mp_overgrown_insects01" );
    level._effect["mp_overgrown_insects02"] = loadfx( "fx/ambient_runners/mp_overgrown_insects02" );
    level._effect["mp_overgrown_insects03"] = loadfx( "fx/ambient_runners/mp_overgrown_insects03" );
    level._effect["mp_overgrown_insects04"] = loadfx( "fx/ambient_runners/mp_overgrown_insects04" );
    level._effect["mp_overgrown_insects05"] = loadfx( "fx/ambient_runners/mp_overgrown_insects05" );
    level._effect["mp_overgrown_fog_daytime01"] = loadfx( "fx/ambient_runners/mp_overgrown_fog_daytime01" );
    level._effect["mp_overgrown_leavesfall01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesfall01" );
    level._effect["mp_overgrown_leavesground01"] = loadfx( "fx/ambient_runners/mp_overgrown_leavesground01" );
    level._id_78BA["flak88_explode"] = "flak88_explode";
    level._effect["hawks"] = loadfx( "fx/misc/hawks" );
    level._effect["sewer_stream_village"] = loadfx( "fx/distortion/mp_creek_stream" );
    level._effect["sewer_stream_village_far"] = loadfx( "fx/misc/stream_creek_far" );
    level._effect["sewer_stream_village_far_fast"] = loadfx( "fx/distortion/mp_creek_stream_fast" );
    level._effect["insect_trail_runner"] = loadfx( "fx/misc/insect_trail_runner" );
    level._effect["toilet_flies"] = loadfx( "fx/misc/insect_trail_runner" );
    level._effect["waterfall_0"] = loadfx( "fx/misc/mp_creek_waterfall1" );
    level._effect["waterfall_1"] = loadfx( "fx/misc/mp_creek_waterfall2" );
    level._effect["waterfall_large"] = loadfx( "fx/misc/mp_creek_waterfall_large" );
    level._effect["light_shaft_dust_large_mp_creek"] = loadfx( "fx/dust/light_shaft_dust_large_mp_creek" );
    level._effect["room_dust_200_mp_creek"] = loadfx( "fx/dust/room_dust_200_blend_mp_creek" );
    level._effect["cave_particulates"] = loadfx( "fx/dust/cave_particulates" );
    level._effect["mp_cave_dripping"] = loadfx( "fx/misc/mp_cave_dripping" );
}
