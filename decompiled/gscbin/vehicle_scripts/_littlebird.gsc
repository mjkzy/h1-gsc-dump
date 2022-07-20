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

_id_0CD0( var_0, var_1 )
{
    return issubstr( var_0, "armed" ) || issubstr( var_1, "armed" );
}
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    if ( _id_0CD0( var_0, var_2 ) )
        vehicle_scripts\_attack_heli::_id_6EFB();

    if ( issubstr( var_2, "bench" ) )
    {
        precachemodel( "vehicle_sentinel_littlebird_benchleft" );
        precachemodel( "vehicle_sentinel_littlebird_benchright" );
    }

    maps\_vehicle::_id_186C( "littlebird", var_0, var_1, var_2 );
    maps\_vehicle::_id_1859( ::_id_4D10 );
    maps\_vehicle::_id_1845( "vehicle_little_bird_armed" );
    maps\_vehicle::_id_1845( "vehicle_little_bird_bench" );

    if ( issubstr( var_2, "kva" ) || issubstr( var_2, "atlas" ) || issubstr( var_2, "sentinel" ) )
        maps\_vehicle::_id_1849( %mil_helicopter_littlebird_ai_rotors, undefined, 0, 3.0 );
    else
        maps\_vehicle::_id_1849( %mi28_rotors, undefined, 0, 3.0 );

    maps\_vehicle::_id_1842( "fx/explosions/helicopter_explosion_secondary_small", "tag_engine", "littlebird_helicopter_secondary_exp", undefined, undefined, undefined, 0.0, 1 );
    maps\_vehicle::_id_1842( "vfx/trail/trail_fire_smoke_l", "tag_engine", "littlebird_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
    maps\_vehicle::_id_1842( "fx/explosions/helicopter_explosion_secondary_small", "tag_engine", undefined, undefined, undefined, undefined, 2.5, 1 );
    maps\_vehicle::_id_1842( "vfx/explosion/vehicle_littlebird_explosion_a", undefined, "littlebird_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    maps\_vehicle::_id_1864( "vfx/explosion/vehicle_littlebird_explosion_a", "tag_deathfx", "littlebird_helicopter_crash", undefined, undefined, undefined, undefined, 1, undefined, 0 );
    maps\_vehicle::_id_1846( 0.8, 1.6, 2048 );
    maps\_vehicle::_id_186E( var_2, "default", "vfx/treadfx/heli_dust_default" );
    maps\_vehicle::_id_1856( 799 );
    maps\_vehicle::_id_186A( "axis" );
    maps\_vehicle::_id_185A();
    maps\_vehicle::_id_1873( ::_id_9A3D );
    maps\_vehicle::_id_1839( ::_id_7F23, ::_id_7EFA );
    var_3 = randomfloatrange( 0, 1 );
    maps\_vehicle::_id_1857( var_2, "white_blink", "TAG_LIGHT_BELLY", "vfx/lights/aircraft_light_white_blink", "running", var_3 );
    maps\_vehicle::_id_1857( var_2, "red_blink1", "TAG_LIGHT_TAIL1", "vfx/lights/aircraft_light_red_blink", "running", var_3 );
    maps\_vehicle::_id_1857( var_2, "red_blink2", "TAG_LIGHT_TAIL2", "vfx/lights/aircraft_light_red_blink", "running", var_3 );
    maps\_vehicle::_id_1857( var_2, "headlight_nose", "tag_light_nose", "vfx/lights/headlight_gaz", "headlights", 0.0 );
    var_4 = "littlebird_gunpod";
    maps\_vehicle::_id_1872( var_4, "TAG_MINIGUN_ATTACH_LEFT", "vehicle_mil_helicopter_littlebird_gunpodleft" );
    maps\_vehicle::_id_1872( var_4, "TAG_MINIGUN_ATTACH_RIGHT", "vehicle_mil_helicopter_littlebird_gunpodright" );
    maps\_vehicle::_id_1855();
    vehicle_scripts\_littlebird_landing::_id_4D0D();
}

_id_4D10()
{
    self endon( "death" );
    self._id_65A7 = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_7957 = 0;
    self._id_2D30 = 1;
    self._id_9D08 = 6;
    thread vehicle_scripts\_littlebird_landing::_id_57B1();
    thread _id_0DE7();
    thread maps\_vehicle::_id_9D02( "running" );

    if ( issubstr( self.classname, "sentinel" ) )
        self hidepart( "main_rotor_static_jnt" );

    waitframe;

    if ( !_id_0CD0( self.motiontrackerenabled, self.classname ) )
    {
        maps\_vehicle::_id_5BD2();

        foreach ( var_1 in self._id_5BD5 )
            var_1 hide();
    }

    thread vehicle_scripts\_littlebird_aud::_id_45B5();
    self._id_3069 = ::_id_57AE;
    maps\_utility::_id_0749( ::_id_57AD );
}

_id_84C2()
{
    if ( issubstr( self.classname, "sentinel" ) )
    {
        self hidepart( "main_rotor_static_jnt" );
        self showpart( "main_rotor_jnt" );
    }
}

_id_84F0()
{
    if ( issubstr( self.classname, "sentinel" ) )
    {
        self showpart( "main_rotor_static_jnt" );
        self hidepart( "main_rotor_jnt" );
    }
}

_id_0DE7()
{
    switch ( self.classname )
    {
        case "script_vehicle_littlebird_sentinel_bench":
        case "script_vehicle_littlebird_atlas_bench":
            self attach( "vehicle_sentinel_littlebird_benchleft", "TAG_BENCH_ATTACH_LEFT" );
            self attach( "vehicle_sentinel_littlebird_benchright", "TAG_BENCH_ATTACH_RIGHT" );
            break;
        default:
            break;
    }
}

_id_7EFA( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 8; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_pilot1";
    var_0[1]._id_85AE = "tag_pilot2";
    var_0[2]._id_85AE = "tag_detach_right";
    var_0[3]._id_85AE = "tag_detach_right";
    var_0[4]._id_85AE = "tag_detach_right";
    var_0[5]._id_85AE = "tag_detach_left";
    var_0[6]._id_85AE = "tag_detach_left";
    var_0[7]._id_85AE = "tag_detach_left";
    var_0[0]._id_4B63[0] = %helicopter_pilot1_idle;
    var_0[0]._id_4B63[1] = %helicopter_pilot1_twitch_clickpannel;
    var_0[0]._id_4B63[2] = %helicopter_pilot1_twitch_lookback;
    var_0[0]._id_4B63[3] = %helicopter_pilot1_twitch_lookoutside;
    var_0[0]._id_4B7E[0] = 500;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    var_0[0]._id_4B7E[3] = 100;
    var_0[1]._id_4B63[0] = %helicopter_pilot2_idle;
    var_0[1]._id_4B63[1] = %helicopter_pilot2_twitch_clickpannel;
    var_0[1]._id_4B63[2] = %helicopter_pilot2_twitch_lookoutside;
    var_0[1]._id_4B63[3] = %helicopter_pilot2_twitch_radio;
    var_0[1]._id_4B7E[0] = 450;
    var_0[1]._id_4B7E[1] = 100;
    var_0[1]._id_4B7E[2] = 100;
    var_0[1]._id_4B7E[3] = 100;
    var_0[2]._id_4B63[0] = %little_bird_casual_idle_guy1;
    var_0[3]._id_4B63[0] = %little_bird_casual_idle_guy3;
    var_0[4]._id_4B63[0] = %little_bird_casual_idle_guy2;
    var_0[5]._id_4B63[0] = %little_bird_casual_idle_guy1;
    var_0[6]._id_4B63[0] = %little_bird_casual_idle_guy3;
    var_0[7]._id_4B63[0] = %little_bird_casual_idle_guy2;
    var_0[2]._id_4B7E[0] = 100;
    var_0[3]._id_4B7E[0] = 166;
    var_0[4]._id_4B7E[0] = 122;
    var_0[5]._id_4B7E[0] = 177;
    var_0[6]._id_4B7E[0] = 136;
    var_0[7]._id_4B7E[0] = 188;
    var_0[2]._id_4B63[1] = %little_bird_aim_idle_guy1;
    var_0[3]._id_4B63[1] = %little_bird_aim_idle_guy3;
    var_0[4]._id_4B63[1] = %little_bird_aim_idle_guy2;
    var_0[5]._id_4B63[1] = %little_bird_aim_idle_guy1;
    var_0[7]._id_4B63[1] = %little_bird_aim_idle_guy2;
    var_0[2]._id_4B7E[1] = 200;
    var_0[3]._id_4B7E[1] = 266;
    var_0[4]._id_4B7E[1] = 156;
    var_0[5]._id_4B7E[1] = 277;
    var_0[7]._id_4B7E[1] = 288;
    var_0[2]._id_4B64 = %little_bird_alert_idle_guy1;
    var_0[3]._id_4B64 = %little_bird_alert_idle_guy3;
    var_0[4]._id_4B64 = %little_bird_alert_idle_guy2;
    var_0[5]._id_4B64 = %little_bird_alert_idle_guy1;
    var_0[6]._id_4B64 = %little_bird_alert_idle_guy3;
    var_0[7]._id_4B64 = %little_bird_alert_idle_guy2;
    var_0[2]._id_4B65 = %little_bird_alert_2_aim_guy1;
    var_0[3]._id_4B65 = %little_bird_alert_2_aim_guy3;
    var_0[4]._id_4B65 = %little_bird_alert_2_aim_guy2;
    var_0[5]._id_4B65 = %little_bird_alert_2_aim_guy1;
    var_0[6]._id_4B65 = %little_bird_alert_2_aim_guy3;
    var_0[7]._id_4B65 = %little_bird_alert_2_aim_guy2;
    var_0[2]._id_4068 = %little_bird_dismount_guy1;
    var_0[3]._id_4068 = %little_bird_dismount_guy3;
    var_0[4]._id_4068 = %little_bird_dismount_guy2;
    var_0[5]._id_4068 = %little_bird_dismount_guy1;
    var_0[6]._id_4068 = %little_bird_dismount_guy3;
    var_0[7]._id_4068 = %little_bird_dismount_guy2;
    var_0[2]._id_57B7 = 1;
    var_0[3]._id_57B7 = 1;
    var_0[4]._id_57B7 = 1;
    var_0[5]._id_57B7 = 1;
    var_0[6]._id_57B7 = 1;
    var_0[7]._id_57B7 = 1;
    var_0[2]._id_3FD2 = %little_bird_mount_guy1;
    var_0[2]._id_3FD3 = "mount_finish";
    var_0[3]._id_3FD2 = %little_bird_mount_guy3;
    var_0[3]._id_3FD3 = "mount_finish";
    var_0[4]._id_3FD2 = %little_bird_mount_guy2;
    var_0[4]._id_3FD3 = "mount_finish";
    var_0[5]._id_3FD2 = %little_bird_mount_guy1;
    var_0[5]._id_3FD3 = "mount_finish";
    var_0[6]._id_3FD2 = %little_bird_mount_guy3;
    var_0[6]._id_3FD3 = "mount_finish";
    var_0[7]._id_3FD2 = %little_bird_mount_guy2;
    var_0[7]._id_3FD3 = "mount_finish";
    var_0[2]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[3]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[4]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[5]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[6]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[7]._id_3FD4 = maps\_vehicle_aianim::_id_449C;
    var_0[2]._id_6EAF = %little_bird_aim_2_prelanding_guy1;
    var_0[3]._id_6EAF = %little_bird_aim_2_prelanding_guy3;
    var_0[4]._id_6EAF = %little_bird_aim_2_prelanding_guy2;
    var_0[5]._id_6EAF = %little_bird_aim_2_prelanding_guy1;
    var_0[6]._id_6EAF = %little_bird_aim_2_prelanding_guy3;
    var_0[7]._id_6EAF = %little_bird_aim_2_prelanding_guy2;
    var_0[2]._id_6EB0 = %little_bird_prelanding_idle_guy1;
    var_0[3]._id_6EB0 = %little_bird_prelanding_idle_guy3;
    var_0[4]._id_6EB0 = %little_bird_prelanding_idle_guy2;
    var_0[5]._id_6EB0 = %little_bird_prelanding_idle_guy1;
    var_0[6]._id_6EB0 = %little_bird_prelanding_idle_guy3;
    var_0[7]._id_6EB0 = %little_bird_prelanding_idle_guy2;
    var_0[0]._id_1433 = 0;
    var_0[1]._id_1433 = 0;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["first_guy_left"] = [];
    var_0["first_guy_right"] = [];
    var_0["left"] = [];
    var_0["right"] = [];
    var_0["passengers"] = [];
    var_0["default"] = [];
    var_0["first_guy_left"][0] = 5;
    var_0["first_guy_right"][0] = 2;
    var_0["stage_guy_left"][0] = 7;
    var_0["stage_guy_right"][0] = 4;
    var_0["left"][var_0["left"].size] = 5;
    var_0["left"][var_0["left"].size] = 6;
    var_0["left"][var_0["left"].size] = 7;
    var_0["right"][var_0["right"].size] = 2;
    var_0["right"][var_0["right"].size] = 3;
    var_0["right"][var_0["right"].size] = 4;
    var_0["passengers"][var_0["passengers"].size] = 2;
    var_0["passengers"][var_0["passengers"].size] = 3;
    var_0["passengers"][var_0["passengers"].size] = 4;
    var_0["passengers"][var_0["passengers"].size] = 5;
    var_0["passengers"][var_0["passengers"].size] = 6;
    var_0["passengers"][var_0["passengers"].size] = 7;
    var_0["default"] = var_0["passengers"];
    return var_0;
}

_id_57AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_4 == "MOD_ENERGY" && isdefined( self._id_3069 ) )
        self thread [[ self._id_3069 ]]( var_1, var_4 );
}

_id_57AE( var_0, var_1 )
{
    self endon( "death" );
    self endon( "in_air_explosion" );
    self notify( "emp_death" );
    maps\_vehicle::_id_9D01( "all" );
    self._id_9D4B = 1;
    var_2 = self vehicle_getvelocity();
    var_3 = 250;

    if ( isdefined( level._id_3DC4 ) )
        var_4 = [[ level._id_3DC4 ]]();
    else
    {
        var_5 = ( self.origin[0] + var_2[0] * 5, self.origin[1] + var_2[1] * 5, self.origin[2] - 2000 );
        var_4 = bullettrace( self.origin, var_5, 0, self )["position"];
    }

    self notify( "newpath" );
    self notify( "deathspin" );
    thread _id_57AB();
    var_6 = 1000;
    self vehicle_setspeed( var_6, 40, 1000 );
    self neargoalnotifydist( var_3 );
    self setgoalpos( var_4, 0 );
    thread _id_57AC( var_4, var_3, var_6 );
    common_scripts\utility::_id_A069( "goal", "near_goal" );
    self notify( "stop_crash_loop_sound" );
    self notify( "crash_done" );
    self._id_0B0C = 1;
    self._id_3118 = 1;
    maps\_vehicle_code::_id_9CF0( var_0, var_1 );

    if ( getdvar( "mapname" ) == "lab" )
        _id_1CD0();

    self kill( self.origin, var_0 );
}

_id_1CD0()
{
    if ( !isdefined( level._id_74B9 ) )
        level._id_74B9 = 0;

    level._id_74B9++;

    if ( level._id_74B9 >= 10 )
        maps\_utility::_id_41DD( "LEVEL_10A" );
}

_id_57AB()
{
    self endon( "crash_done" );
    self clearlookatent();
    self setyawspeed( 400, 100, 100 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_0 = randomintrange( 90, 120 );
        self settargetyaw( self.angles[1] + var_0 );
        wait 0.5;
    }
}

_id_57AC( var_0, var_1, var_2 )
{
    self endon( "crash_done" );
    self clearlookatent();
    self setyawspeed( 400, 100, 100 );
    var_3 = 400;
    var_4 = 100;
    var_5 = undefined;
    var_6 = 90 * randomintrange( -2, 3 );

    for (;;)
    {
        if ( self.origin[2] < var_0[2] + var_1 )
            self notify( "near_goal" );

        wait 0.05;
    }
}

_id_4809()
{
    self endon( "crash_done" );
    self clearlookatent();
    self setyawspeed( 400, 100, 100 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_0 = randomintrange( 90, 120 );
        self settargetyaw( self.angles[1] + var_0 );
        wait 0.5;
    }
}
