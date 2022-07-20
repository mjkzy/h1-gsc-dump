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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_186C( "mi17_noai", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_mi17_woodland" );
    maps\_vehicle::_id_1845( "vehicle_mi17_woodland_fly" );
    maps\_vehicle::_id_1845( "vehicle_mi17_woodland_fly_cheap" );
    var_3 = [];
    var_3["vehicle_mi17_woodland"] = "fx/explosions/helicopter_explosion_mi17_woodland";
    var_3["vehicle_mi17_woodland_fly"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    var_3["vehicle_mi17_woodland_fly_cheap"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    var_3["vehicle_mi-28_flying"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    maps\_vehicle::_id_1842( "vfx/fire/fire_helicopter_engine", "tag_engine_right", undefined, 1, undefined, undefined, 1.05, 1 );
    maps\_vehicle::_id_1842( "vfx/fire/fire_helicopter_engine", "tag_engine_left", undefined, 1, 1.05, undefined, 1.05, 1 );
    maps\_vehicle::_id_1842( "vfx/explosion/vehicle_mi17_flames_crashing_runner", "tag_deathfx", "mi17_helicopter_dying_loop", 1, 1.05, 1, 0.0, 1 );
    maps\_vehicle::_id_1842( "vfx/explosion/vehicle_mi17_smoke_crashing_runner", "tag_deathfx", undefined, 1, 1.05, undefined, 3.5, 1 );
    maps\_vehicle::_id_1842( "vfx/explosion/vehicle_mi17_aerial_explosion", "tag_deathfx", "mi17_helicopter_hit", undefined, undefined, undefined, 0.05, 1 );
    maps\_vehicle::_id_1842( "vfx/explosion/vehicle_mi17_aerial_second_explosion", "tag_deathfx", "mi17_helicopter_secondary_exp", undefined, undefined, undefined, 3.5, 1 );
    maps\_vehicle::_id_1842( var_3[var_0], undefined, "mi17_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    maps\_vehicle::_id_1849( %mi17_heli_rotors, undefined, 0 );
    maps\_vehicle::_id_186E();
    maps\_vehicle::_id_1856( 999, 500, 1500 );
    maps\_vehicle::_id_1865( "tank_rumble", 0.15, 4.5, 600, 1, 1 );
    maps\_vehicle::_id_186A( "axis" );
    maps\_vehicle::_id_1857( var_2, "cockpit_blue_cargo01", "tag_light_cargo01", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    maps\_vehicle::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    maps\_vehicle::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_white_blink", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    maps\_vehicle::_id_1857( var_2, "wingtip_green", "tag_light_L_wing", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_1857( var_2, "wingtip_red", "tag_light_R_wing", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    maps\_vehicle::_id_1855();
    set_deathanim_scene();
}

_id_4D10()
{
    self._id_65A7 = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_367F = 710;
    self._id_7957 = 0;
    maps\_vehicle::_id_9D02( "running" );
    maps\_vehicle::_id_9D02( "interior" );
}

set_deathanim_scene()
{
    var_0 = spawnstruct();
    var_0._id_0C7A = [];
    var_0._id_0C7A = common_scripts\utility::_id_0CDA( var_0._id_0C7A, %mi17_heli_hitreact_flyin_01 );
    var_0._id_0C7A = common_scripts\utility::_id_0CDA( var_0._id_0C7A, %mi17_heli_hitreact_flyin_02 );
    var_0.delay_crash = 1;
    maps\_vehicle::_id_1841( var_0 );
    var_1 = spawnstruct();
    var_1._id_0C7A = [];
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_front );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_rear );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_left );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_right );
    var_1.alter_velocity = 1;
    var_1.delay_crash = 1;
    maps\_vehicle::_id_1841( var_1, "unloading" );
    var_2 = spawnstruct();
    var_2._id_0C7A = [];
    var_2._id_0C7A = common_scripts\utility::_id_0CDA( var_2._id_0C7A, %mi17_heli_hitreact_left );
    var_2._id_0C7A = common_scripts\utility::_id_0CDA( var_2._id_0C7A, %mi17_heli_hitreact_right );
    var_2.alter_velocity = 1;
    var_2.delay_crash = 1;
    maps\_vehicle::_id_1841( var_2, "unloaded" );
}
