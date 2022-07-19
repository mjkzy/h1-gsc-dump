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
    level._effect["houseFire"] = loadfx( "fx/explosions/ac130_house_explosion" );
    level._effect["fire_bits"] = loadfx( "fx/explosions/ac130_house_fire_bits" );
    level._effect["fire_bits_sm"] = loadfx( "fx/explosions/ac130_house_fire_bits_sm" );
    level._effect["dust_line"] = loadfx( "vfx/map/ac130/ac130_crane_dust_line" );
    level._effect["smk_churn"] = loadfx( "vfx/map/ac130/ac130_house_smk_churn" );
    level._effect["heli_kickup"] = loadfx( "fx/treadfx/ac130_heli_kickup" );
    level._effect["00_particle_shadow_animated_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_e" );
    level._effect["00_particle_shadow_animated_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_med_e" );
    level._effect["00_particle_shadow_animated_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_animated_sm_e" );
    _id_974C();
    maps\createfx\ac130_fx::main();
    maps\createfx\ac130_sound::main();
}

_id_974C()
{
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "brick", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "bark", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "carpet", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "cloth", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "concrete", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "dirt", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "flesh", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "foliage", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "glass", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "grass", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "gravel", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "ice", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "metal", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "mud", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "paper", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "plaster", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "rock", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "sand", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "snow", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "water", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "wood", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "asphalt", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "ceramic", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "plastic", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "rubber", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "cushion", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "fruit", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "painted metal", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "default", "fx/treadfx/ac130_heli_kickup" );
    _id_A59D::_id_8350( "script_vehicle_ch46e_opened_door", "none", "fx/treadfx/ac130_heli_kickup" );
}
