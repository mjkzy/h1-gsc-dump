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
    level._id_058F["bird_vulture_circle_runner_less"] = loadfx( "vfx/animal/bird_vulture_circle_runner_less" );
    level._id_058F["insects_flies_landing"] = loadfx( "vfx/animal/dlc/insects_flies_landing" );
    level._id_058F["insects_dragonfly_runner_a_mp_killhouse"] = loadfx( "vfx/animal/insects_dragonfly_runner_a_mp_killhouse" );
    level._id_058F["vent_smoke_mp_killhouse"] = loadfx( "vfx/fog/vent_smoke_mp_killhouse" );
    level._id_058F["ambient_ground_fog_mp_killhouse"] = loadfx( "vfx/smoke/ambient_ground_fog_mp_killhouse" );
    level._id_058F["battlefield_smoke_m_slow_mp_killhouse"] = loadfx( "vfx/smoke/battlefield_smoke_m_slow_mp_killhouse" );
    level._id_058F["fog_oriented_edge_fade_mp_killhouse"] = loadfx( "vfx/fog/fog_oriented_edge_fade_mp_killhouse" );
    level._id_058F["ambient_smoke_hangar_mp_killhouse"] = loadfx( "vfx/smoke/ambient_smoke_hangar_mp_killhouse" );
    level._id_058F["floating_room_dust_03_killhouse"] = loadfx( "fx/misc/floating_room_dust_03_killhouse" );
    level._id_058F["ambient_falling_leaves_mp_killhouse"] = loadfx( "vfx/wind/ambient_falling_leaves_mp_killhouse" );
    level._id_058F["drips_slow_mp_killhouse"] = loadfx( "vfx/rain/drips_slow_mp_killhouse" );
    level._id_058F["fx_sunflare_killhouse"] = loadfx( "vfx/lensflare/fx_sunflare_mp_killhouse" );
    level._id_058F["light_rays_moving_long_sm_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_sm_mp_killhouse" );
    level._id_058F["light_rays_moving_large_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_large_mp_killhouse" );
    level._id_058F["light_rays_moving_long_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_mp_killhouse" );
    level._id_058F["light_rays_moving_long_thin_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_thin_mp_killhouse" );
    level._id_058F["light_rays_moving_long_thin_2_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_thin_2_mp_killhouse" );
    level._id_058F["light_rays_moving_long_thin_3_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_thin_3_mp_killhouse" );
    level._id_058F["light_rays_moving_long_thin_4_mp_killhouse"] = loadfx( "vfx/lights/light_rays_moving_long_thin_4_mp_killhouse" );
    level._id_058F["fluorescent_mp_killhouse"] = loadfx( "vfx/lights/fluorescent_mp_killhouse" );
    level._id_058F["light_spotlight_long_mp_killhouse"] = loadfx( "vfx/lights/light_spotlight_long_mp_killhouse" );
}
