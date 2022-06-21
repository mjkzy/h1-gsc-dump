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
    level._id_058F["godray_ambient_long_mp"] = loadfx( "vfx/lights/godray_ambient_long_mp" );
    level._id_058F["godray_ambient_small_mp"] = loadfx( "vfx/lights/godray_ambient_small_mp" );
    level._id_058F["godray_ambient_mp"] = loadfx( "vfx/lights/godray_ambient_mp" );
    level._id_058F["00_particle_shadow_clouds"] = loadfx( "vfx/cloud/00_particle_shadow_clouds" );
    level._id_058F["smoldering_smk_thin_black"] = loadfx( "vfx/smoke/smoldering_smk_thin_black" );
    level._id_058F["snow_fall_small_mpbloc"] = loadfx( "vfx/snow/snow_fall_small_mpbloc" );
    level._id_058F["barrel_fire_nolight_mp"] = loadfx( "vfx/fire/barrel_fire_nolight_mp" );
    level._id_058F["ground_snow_light_mpbloc"] = loadfx( "vfx/snow/ground_snow_light_mpbloc" );
    level._id_058F["snow_fall_particles_mpbloc"] = loadfx( "vfx/snow/snow_fall_particles_mpbloc" );
    level._id_058F["snow_light"] = loadfx( "fx/weather/snow_light_mp_bloc" );
    level._id_058F["hallway_smoke"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._id_058F["snow_wind"] = loadfx( "fx/weather/snow_wind" );
    level._id_058F["hazy_sun_lensflare"] = loadfx( "vfx/lensflare/hazy_sun_lensflare" );
    level._id_058F["drips_slow"] = loadfx( "fx/misc/drips_slow" );
    level._id_058F["paper_falling"] = loadfx( "fx/misc/paper_falling" );
    level._id_058F["amb_dust_unlit_dayonly"] = loadfx( "vfx/dust/amb_dust_unlit_dayonly" );
    level._id_058F["smoldering_smk_big_black"] = loadfx( "vfx/smoke/smoldering_smk_big_black" );
    level._id_058F["dust_ceiling_agu"] = loadfx( "fx/dust/dust_ceiling_agu" );
}
