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
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    level._effect["00_particle_shadow_animated_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_d" );
    level._effect["00_particle_shadow_animated_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_d" );
    level._effect["00_particle_shadow_animated_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_d" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e" );
    level._effect["00_particle_shadow_static_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_d" );
    level._effect["00_particle_shadow_static_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_d" );
    level._effect["00_particle_shadow_static_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_d" );
    level._effect["church_roof_exp"] = loadfx( "fx/explosions/church_roof_explosion_agu" );
    level._effect["church_roof_lg_exp"] = loadfx( "fx/explosions/church_roof_explosion_lg_agu" );
    level._effect["dust_wind_leaves_chernobyl"] = loadfx( "fx/dust/dust_wind_scoutsniper" );
    level._effect["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._effect["dust_ceiling_ash_large"] = loadfx( "fx/dust/dust_ceiling_ash_large_agu" );
    level._effect["dust_ceiling_agu"] = loadfx( "fx/dust/dust_ceiling_agu" );
    level._effect["dust_ceiling_agu_sm"] = loadfx( "fx/dust/dust_ceiling_agu_sm" );
    level._effect["amb_dust_agu_sm"] = loadfx( "fx/dust/amb_dust_agu_sm" );
    level._effect["light_shaft_dust_med"] = loadfx( "fx/dust/light_shaft_dust_med" );
    level._effect["light_shaft_dust_large"] = loadfx( "fx/dust/light_shaft_dust_large" );
    level._effect["room_dust_200"] = loadfx( "fx/dust/room_dust_200_agu" );
    level._effect["room_dust_100"] = loadfx( "fx/dust/room_dust_100_agu" );
    level._effect["leaves_fall_gentlewind"] = loadfx( "fx/misc/leaves_fall_gentlewind" );
    level._effect["dust_wind_spiral"] = loadfx( "fx/dust/dust_spiral_runner" );
    level._effect["fog_oriented_edge_fade"] = loadfx( "vfx/fog/fog_oriented_edge_fade" );
    level._effect["horizon_flash_runner_agu"] = loadfx( "fx/weather/horizon_flash_runner_agu" );
    level._effect["bird"] = loadfx( "fx/misc/bird" );
    level._effect["bird_takeoff"] = loadfx( "fx/misc/bird_takeoff" );
    level._effect["pigeon_01_scoutsniper"] = loadfx( "vfx/map/scoutsniper/pigeon_01_scoutsniper" );
    level._effect["dust_leaves_heli"] = loadfx( "vfx/map/scoutsniper/dust_leaves_heli" );
    level._effect["trash_tornado_heli"] = loadfx( "vfx/map/scoutsniper/trash_tornado_heli" );
    level._effect["light_beam_fog_only"] = loadfx( "vfx/map/scoutsniper/light_beam_fog_only" );
    level._effect["leaves_runner_lghtr"] = loadfx( "vfx/wind/leaves_runner" );
    level._effect["leaves_a"] = loadfx( "vfx/wind/leaves_a" );
    level._effect["ghillie_leaves"] = loadfx( "fx/misc/gilli_leaves" );
    level._effect["water_splash_bodydump"] = loadfx( "fx/impacts/water_splash_bodydump" );
    level._effect["dog_bite_blood"] = loadfx( "fx/impacts/flesh_hit_body_fatal_exit" );
    level._id_3891["hind"] = loadfx( "fx/misc/flares_cobra" );
    level._effect["glass_break"] = loadfx( "fx/props/car_glass_large" );
    level._effect["village_morning_fog_scoutsniper"] = loadfx( "fx/smoke/village_morning_fog_scoutsniper" );
    level._effect["light_beam_fog_scoutsniper"] = loadfx( "fx/smoke/light_beam_fog_scoutsniper" );
    level._effect["light_beam_dark_scoutsniper"] = loadfx( "fx/smoke/light_beam_dark_scoutsniper" );
    level._effect["light_beam_fog_long_scoutsniper"] = loadfx( "fx/smoke/light_beam_fog_long_scoutsniper" );
    level._effect["battlefield_smoke_m_slow_agu"] = loadfx( "vfx/smoke/dlc/battlefield_smoke_m_slow_agu" );
    level._effect["ash_cloud_freq_lrg_loop_agu"] = loadfx( "vfx/ash/ash_cloud_freq_lrg_loop_agu" );
    level._effect["leaves_tornado_s_runner"] = loadfx( "vfx/wind/leaves_tornado_s_runner" );
    level._effect["light_beam_fog_mote_window"] = loadfx( "vfx/map/scoutsniper/light_beam_fog_mote_window" );
    level._effect["light_beam_center_small_window"] = loadfx( "vfx/map/scoutsniper/light_beam_center_sm_window" );
    level._effect["falling_water_narrow_scoutsniper"] = loadfx( "vfx/map/scoutsniper/falling_water_narrow_scoutsniper" );
    level._effect["falling_water_scoutsniper"] = loadfx( "vfx/map/scoutsniper/falling_water_scoutsniper" );
    level._effect["fx_sunflare_scoutsniper"] = loadfx( "vfx/lensflare/fx_sunflare_scoutsniper" );
    maps\createfx\scoutsniper_fx::main();
    maps\createfx\scoutsniper_sound::main();
}
