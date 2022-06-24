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
    level._effect["00_particle_shadow_citystreets"] = loadfx( "vfx/cloud/00_particle_shadow_citystreets" );
    level._effect["ground_sand_skitter_blowing"] = loadfx( "vfx/sand/ground_sand_skitter_blowing" );
    level._effect["sand_storm_city_streets"] = loadfx( "fx/weather/sand_storm_city_streets" );
    level._effect["sand_storm_distant_dubsided"] = loadfx( "fx/weather/sand_storm_distant_dubsided" );
    level._effect["ambient_hallway_dust_mp"] = loadfx( "vfx/map/mp_citystreets/ambient_hallway_dust_mp" );
    level._effect["roach_flock_scatter_radial_nofly_runner"] = loadfx( "vfx/animal/roach_flock_scatter_radial_nofly_runner" );
    level._effect["ambient_hallway_dust_01"] = loadfx( "vfx/map/ambush/ambient_hallway_dust_01" );
    level._effect["mp_trash_blowing_runner"] = loadfx( "vfx/map/mp_lost/mp_trash_blowing_runner" );
    level._effect["sand_storm_small_mp"] = loadfx( "vfx/map/mp_citystreets/sand_storm_small_mp" );
    level._effect["sand_storm_mp"] = loadfx( "vfx/map/mp_citystreets/sand_storm_mp" );
    level._effect["amb_dust_unlit_dayonly"] = loadfx( "vfx/dust/amb_dust_unlit_dayonly" );
    level._effect["sand_tornado_s_runner"] = loadfx( "vfx/sand/sand_tornado_s_runner" );
    level._effect["fog_bog_a"] = loadfx( "fx/weather/fog_bog_a" );
    level._effect["amb_ash"] = loadfx( "fx/smoke/amb_ash" );
    level._effect["floodlight_white"] = loadfx( "fx/misc/floodlight_white" );
    level._effect["floodlight_yellow"] = loadfx( "fx/misc/floodlight_yellow" );
    level._effect["fluorescent_glow"] = loadfx( "fx/misc/fluorescent_glow" );
}
