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
    level._effect["strike_particle_shadow_clouds"] = loadfx( "vfx/map/mp_strike/strike_particle_shadow_clouds" );
    level._effect["strike_clouds"] = loadfx( "vfx/map/mp_strike/strike_clouds" );
    level._effect["strike_leaves_ground"] = loadfx( "vfx/map/mp_strike/strike_leaves_ground" );
    level._effect["strike_insects_flies_wall"] = loadfx( "vfx/map/mp_strike/strike_insects_flies_wall" );
    level._effect["strike_leaves_blown_constant"] = loadfx( "vfx/map/mp_strike/strike_leaves_blown_constant" );
    level._effect["strike_leaves_blowing_slow"] = loadfx( "vfx/map/mp_strike/strike_leaves_blowing_slow" );
    level._effect["strike_house_fire_smoke"] = loadfx( "vfx/map/mp_strike/strike_house_fire_smoke" );
    level._effect["strike_smoke_chimney_small"] = loadfx( "vfx/map/mp_strike/strike_smoke_chimney_small" );
    level._effect["strike_amb_dust_unlit_dayonly"] = loadfx( "vfx/map/mp_strike/strike_amb_dust_unlit_dayonly" );
    level._effect["strike_dust_ambient_street"] = loadfx( "vfx/map/mp_strike/strike_dust_ambient_street" );
    level._effect["strike_sparks_runner"] = loadfx( "vfx/map/mp_strike/strike_sparks_runner" );
    level._effect["strike_tire_fire"] = loadfx( "vfx/map/mp_strike/strike_tire_fire" );
    level._effect["strike_spark_loop"] = loadfx( "vfx/map/mp_strike/strike_spark_loop" );
    level._effect["strike_electrical_spark_loop"] = loadfx( "vfx/map/mp_strike/strike_electrical_spark_loop" );
    level._effect["strike_tank_fire_hatch"] = loadfx( "vfx/map/mp_strike/strike_tank_fire_hatch" );
    level._effect["strike_fire_loop_source_far"] = loadfx( "vfx/map/mp_strike/strike_fire_loop_source_far" );
    level._effect["strike_barrel_fire"] = loadfx( "vfx/map/mp_strike/strike_barrel_fire" );
    level._effect["strike_fire_med_licks_loop"] = loadfx( "vfx/map/mp_strike/strike_fire_med_licks_loop" );
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm_nodistort" );
    level._effect["dust_wind_fast"] = loadfx( "fx/dust/dust_wind_fast" );
    level._effect["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_yel_loop" );
    level._effect["dust_wind_spiral"] = loadfx( "fx/dust/dust_spiral_runner" );
    level._effect["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_S" );
    level._effect["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._effect["paper_falling"] = loadfx( "fx/misc/paper_falling" );
    thread misc_rotate_ceilingfans();
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin", "targetname" ), ::ceilingfan_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_slow", "targetname" ), ::ceilingfan_rotate_slow_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_med", "targetname" ), ::ceilingfan_rotate_med_custom );
}

ceilingfan_rotate_custom()
{
    var_0 = 600;
    var_1 = 20000;

    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_slow_custom()
{
    var_0 = 50;
    var_1 = 20000;

    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_med_custom()
{
    var_0 = 150;
    var_1 = 20000;

    for (;;)
    {
        self rotatevelocity( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}
