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

_id_4D73()
{
    if ( isdefined( level._id_2B2D ) && level._id_2B2D )
        return;

    maps\_vehicle_code::_id_816E();
    level._id_4806 = common_scripts\utility::_id_0CDD( level._id_4806, maps\_utility::_id_40FE( "helicopter_crash_location", "targetname" ) );
    common_scripts\utility::_id_0CF0( getentarray( "colmap_vehicle", "targetname" ), maps\_utility::_id_284E );
    maps\_vehicle_code::_id_82E3();
    common_scripts\utility::_id_0D13( getentarray( "truckjunk", "targetname" ), maps\_vehicle_code::_id_9882 );
    common_scripts\utility::_id_0D13( getentarray( "truckjunk", "script_noteworthy" ), maps\_vehicle_code::_id_9882 );
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "truckjunk", "targetname" ), maps\_vehicle_code::_id_9882 );
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "truckjunk", "script_noteworthy" ), maps\_vehicle_code::_id_9882 );
    maps\_vehicle_code::_id_8042();
    maps\_vehicle_code::_id_82DC();
    var_0 = maps\_vehicle_code::_id_6ECF();
    maps\_vehicle_code::_id_82E4( var_0 );

    if ( isdefined( level._id_6545 ) )
        common_scripts\utility::_id_0CF0( level._id_9D1C, ::_id_97D7 );
    else
        common_scripts\utility::_id_0CF0( level._id_9D1C, maps\_vehicle_code::_id_97D5 );

    level._id_9D1C = undefined;
    level._id_56E2 = getentarray( "script_vehicle", "code_classname" ).size > 0;
    maps\_utility::_id_0764( "invulerable_frags", &"SCRIPT_INVULERABLE_FRAGS", undefined );
    maps\_utility::_id_0764( "invulerable_bullets", &"SCRIPT_INVULERABLE_BULLETS", undefined );
    common_scripts\utility::_id_23C8( "aircraft_wash_math" );

    if ( isdefined( level.helicopter_landed_fx_override ) )
    {
        foreach ( var_3, var_2 in level.helicopter_landed_fx_override )
            level._heli_landed_fx[loadfx( var_3 )] = loadfx( var_2 );
    }

    set_crush_vehicle_clips( undefined, "postcrushed", 0 );
}

_id_97D7( var_0 )
{
    var_0._id_6544 = 1;
}

_id_9D17( var_0, var_1, var_2 )
{
    return maps\_vehicle_code::_id_0689( var_0, var_1, var_2 );
}

_id_23DE( var_0 )
{
    var_1 = _id_7B3C( var_0 );

    foreach ( var_3 in var_1 )
        level thread _id_427A( var_3 );

    return var_1;
}

_id_427A( var_0 )
{
    return maps\_vehicle_code::_id_05C6( var_0 );
}

_id_7B3C( var_0 )
{
    return maps\_vehicle_code::_id_062F( var_0 );
}

_id_9D41( var_0 )
{
    return maps\_vehicle_code::_id_068B( var_0 );
}

waittill_vehiclespawn( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isspawner( var_1 ) )
        var_1 waittill( "spawned", var_1 );

    return var_1;
}

waittill_vehiclespawn_noteworthy( var_0 )
{
    level waittill( "new_vehicle_spawned" + var_0, var_1 );
    return var_1;
}

_id_530E( var_0, var_1 )
{
    return maps\_vehicle_code::_id_05DA( var_0, var_1 );
}

vehicle_flag_arrived( var_0 )
{
    if ( !isdefined( self.vehicle_flags ) )
        self.vehicle_flags = [];

    while ( !isdefined( self.vehicle_flags[var_0] ) )
    {
        self waittill( "vehicle_flag_arrived", var_1 );

        if ( var_0 == var_1 )
            return;
    }
}

_id_1862( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_9CAA ) )
        level._id_9CAA = [];

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = ( 0.0, 0.0, 0.0 );

    var_6 = spawnstruct();
    var_6._id_6379 = var_0;
    var_6._id_7131 = var_1;
    var_6._id_5A2A = var_2;
    var_6._id_5C40 = var_3;
    var_6._id_1488 = var_4;
    var_6._id_27C0 = var_5;
    level._id_9CAA[level._id_9F54] = var_6;
}

_id_1865( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_9D2C ) )
        level._id_9D2C = [];

    var_6 = _id_1861( var_1, var_2, var_3, var_4, var_5 );
    precacherumble( var_0 );
    var_6._id_7675 = var_0;
    level._id_9D2C[level._id_9F54] = var_6;
}

_id_1866( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( level._id_9D2D ) )
        level._id_9D2D = [];

    var_7 = _id_1861( var_2, var_3, var_4, var_5, var_6 );
    precacherumble( var_1 );
    var_7._id_7675 = var_1;
    level._id_9D2D[var_0] = var_7;
}

_id_1867( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_1861( var_1, var_2, var_3, var_4, var_5 );
    var_6._id_7675 = var_0;
    self._id_9D2E = var_6;
    _id_9CF1();
    thread maps\_vehicle_code::_id_9D2C();
}

_id_1846( var_0, var_1, var_2 )
{
    var_3 = level._id_9F54;

    if ( !isdefined( level._id_9CA6 ) )
        level._id_9CA6 = [];

    level._id_9CA6[var_3] = _id_1861( var_0, var_1, var_2 );
}

build_deathquake_with_classname( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_9CA6 ) )
        level._id_9CA6 = [];

    level._id_9CA6[var_0] = _id_1861( var_1, var_2, var_3 );
}

_id_1861( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_782D = var_0;
    var_5.duration = var_1;
    var_5.radius = var_2;

    if ( isdefined( var_3 ) )
        var_5._id_1318 = var_3;

    if ( isdefined( var_4 ) )
        var_5._id_711D = var_4;

    return var_5;
}

_id_184D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    var_11 = spawnstruct();
    var_11._id_3018 = loadfx( var_0 );
    var_11.tag = var_1;
    var_11._id_8899 = var_2;
    var_11._id_182E = var_5;
    var_11._id_27C0 = var_4;
    var_11._id_A00D = var_6;
    var_11._id_8D81 = var_7;
    var_11._id_6237 = var_8;
    var_11._id_136B = var_3;
    var_11._id_7C77 = var_9;
    var_11._id_7340 = var_10;
    return var_11;
}

_id_1844( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    if ( !isdefined( level.script ) )
        level.script = tolower( getdvar( "mapname" ) );

    level._id_9F7B = var_1;
    level._id_9F56 = var_2;
    level._id_9F7A = 1;
    level._id_9F54 = var_0;

    if ( !isdefined( level._id_9CA7 ) )
        level._id_9CA7 = [];

    if ( !_id_505C( var_0 ) )
        level._id_9CA7[var_0] = [];

    level._id_9CA8[var_0] = 1;

    if ( !isdefined( level._id_9CA7[var_0] ) )
        level._id_9CA7[var_0] = [];

    level._id_9CA7[var_0][level._id_9CA7[var_0].size] = _id_184D( var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
    level._id_9F7A = undefined;
}

swap_deathfx_effect_only( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_9CA7 ) )
        return;

    var_4 = 0;

    foreach ( var_6 in level._id_9CA7[var_0] )
    {
        if ( isdefined( var_6._id_3018 ) && !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_6._id_3018 ) && isdefined( var_1 ) )
            continue;

        if ( isdefined( var_6._id_3018 ) && isdefined( var_1 ) && var_6._id_3018 != loadfx( var_1 ) )
            continue;

        if ( var_6.tag != var_2 )
            continue;

        if ( isdefined( var_3 ) )
            var_6._id_3018 = loadfx( var_3 );
        else
            var_6._id_3018 = undefined;

        var_4 = 1;
    }

    if ( !var_4 )
        return;
}

_id_1842( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = level._id_9F54;

    if ( _id_505C( var_11 ) )
        return;

    if ( !isdefined( level._id_9CA7[var_11] ) )
        level._id_9CA7[var_11] = [];

    level._id_9CA7[var_11][level._id_9CA7[var_11].size] = _id_184D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_1843( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = level._id_9F54;
    level._id_9F54 = "script_model";
    _id_1842( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    level._id_9F54 = var_11;
}

_id_1841( var_0, var_1 )
{
    override_deathanim( level._id_9F54, var_1, var_0 );
}

override_deathanim( var_0, var_1, var_2 )
{
    if ( !isdefined( level.vehicle_deathanim ) )
        level.vehicle_deathanim = [];

    var_3 = var_0;

    if ( isdefined( var_1 ) )
        var_3 = var_3 + "_" + var_1;

    if ( !isdefined( var_2 ) )
    {
        level.vehicle_deathanim[var_3] = undefined;
        return;
    }

    level.vehicle_deathanim[var_3] = process_deathanim( var_0, var_2 );
}

custom_deathanim( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        self.vehicle_deathanim = undefined;
        return;
    }

    self.vehicle_deathanim = process_deathanim( self.classname, var_0 );
}

process_deathanim( var_0, var_1 )
{
    if ( !isdefined( var_1.is_directional ) )
        var_1.is_directional = 0;

    if ( var_1.is_directional )
    {

    }

    if ( !isdefined( var_1._id_1E99 ) )
        var_1._id_1E99 = 0;

    if ( !isdefined( var_1.clear_anims_time ) )
        var_1.clear_anims_time = 0;

    if ( !isdefined( var_1.alter_velocity ) )
        var_1.alter_velocity = 0;

    if ( !isdefined( var_1.alter_velocity_speed ) )
        var_1.alter_velocity_speed = 0;

    if ( !isdefined( var_1.alter_velocity_accel ) )
        var_1.alter_velocity_accel = 40;

    if ( !isdefined( var_1.alter_velocity_decel ) )
        var_1.alter_velocity_decel = 20;

    if ( !isdefined( var_1.delay_crash ) )
        var_1.delay_crash = 0;

    if ( !isdefined( var_1.delay_crash_time ) )
        var_1.delay_crash_time = -1;

    if ( !isdefined( var_1.delay_crash_force_end ) )
        var_1.delay_crash_force_end = 0;

    if ( !isdefined( var_1.turn_off_engine ) )
        var_1.turn_off_engine = 1;

    if ( !isdefined( var_1.can_damage ) )
        var_1.can_damage = 0;

    if ( !isdefined( var_1.delete_time ) )
        var_1.delete_time = -1;

    if ( !isdefined( var_1.notetrack_notifies ) )
        var_1.notetrack_notifies = [];

    if ( !isdefined( var_1._id_2643 ) )
        var_1._id_2643 = 1;

    return var_1;
}

validate_deathanim_directional( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;

    foreach ( var_7, var_6 in var_0 )
    {
        switch ( var_7 )
        {
            case "front":
                var_1 = 1;
                continue;
            case "rear":
                var_2 = 1;
                continue;
            case "left":
                var_3 = 1;
                continue;
            case "right":
                var_4 = 1;
                continue;
        }
    }

    var_8 = var_0.size == 4 && ( var_1 && var_2 && var_3 && var_4 );
    return var_8;
}

_id_505C( var_0 )
{
    if ( !isdefined( level._id_9CA8 ) )
        return 0;

    if ( !isdefined( level._id_9CA8[var_0] ) )
        return 0;

    if ( isdefined( level._id_9F7A ) )
        return 1;

    return level._id_9CA8[var_0];
}

_id_1864( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = level._id_9F54;
    level._id_9F54 = "rocket_death" + var_11;
    _id_1842( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    level._id_9F54 = var_11;
}

_id_399A()
{
    return maps\_vehicle_code::_id_05AF();
}

_id_4259()
{
    self._id_4257 = 1;
}

_id_4258()
{
    self._id_4257 = 0;
}

_id_5BD2()
{
    return maps\_vehicle_code::_id_05EF();
}

_id_5BD3()
{
    return maps\_vehicle_code::_id_05F0();
}

_id_51FD()
{
    return isdefined( self.vehicletype );
}

_id_185C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( level._id_9D0D ) )
        level._id_9D0D = [];

    var_12 = level._id_9F54;

    if ( !isdefined( level._id_9D0D[var_12] ) )
        level._id_9D0D[var_12] = [];

    precachemodel( var_2 );
    precacheitem( var_3 );
    var_13 = spawnstruct();
    var_13.tag = var_1;
    var_13._id_5CA0 = var_2;
    var_13._id_5CA1 = var_3;
    var_13._id_6EA3 = var_4;
    var_13._id_6E73 = var_5;
    var_13._id_4EA0 = var_6;
    var_13._id_4944 = var_7;
    var_13._id_4943 = var_8;
    var_13._id_77D2 = var_9;
    var_13._id_77D1 = var_10;
    var_13._id_5C8B = var_11;
    level._id_9D0D[var_12][level._id_9D0D[var_12].size] = var_13;
}

_id_1872( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( level._id_9D0C ) )
        level._id_9D0C = [];

    var_9 = level._id_9F54;

    if ( !isdefined( level._id_9D0C[var_9] ) )
        level._id_9D0C[var_9] = [];

    precachemodel( var_2 );
    precacheturret( var_0 );
    var_10 = spawnstruct();
    var_10._id_4C5C = var_0;
    var_10.tag = var_1;
    var_10.model = var_2;
    var_10.maxrange = var_3;
    var_10._id_279B = var_4;
    var_10._id_284B = var_5;
    var_10._id_2794 = var_6;
    var_10._id_2795 = var_7;

    if ( isdefined( var_8 ) )
        var_10._id_637D = var_8;

    level._id_9D0C[var_9][level._id_9D0C[var_9].size] = var_10;
}

_id_9CEB()
{
    return maps\_vehicle_code::_id_0687();
}

_id_5031()
{
    return maps\_vehicle_code::_id_05D6();
}

_id_9CF1()
{
    self notify( "kill_rumble_forever" );
}

_id_5F3A( var_0, var_1 )
{
    if ( !isdefined( self._id_9882 ) )
        return;

    foreach ( var_3 in self._id_9882 )
    {
        if ( var_3 == var_0 )
            continue;

        var_3 unlink();

        if ( isdefined( var_3._id_79FD ) )
        {
            var_3 linkto( var_0, var_3._id_79FD, var_3._id_12FD, var_3._id_12F2 );
            continue;
        }

        if ( isdefined( var_1 ) )
        {
            var_3 linkto( var_0, var_1 );
            continue;
        }

        var_3 linkto( var_0 );
    }
}

_id_2FC3()
{
    if ( _id_5118() )
        self._id_5D40.origin = self gettagorigin( "tag_ground" );
    else
    {
        self._id_5D40.origin = self.origin;
        self._id_5D40.angles = self.angles;
    }

    self show();
    _id_5F23( self );
    maps\_vehicle_code::_id_5F3B( self );
    thread maps\_vehicle_code::_id_5F18( self );
    maps\_vehicle_code::_id_5F0C( self );
    self._id_5D41 = 0;
    self._id_5D40 delete();
    self._id_5D40 = undefined;

    if ( maps\_vehicle_code::_id_472F() )
    {
        self notify( "stop_kicking_up_dust" );
        thread maps\_vehicle_code::_id_0995();
    }

    return self._id_5D40;
}

_id_5F23( var_0 )
{
    if ( !isdefined( self._id_750A ) )
        return;

    var_1 = self._id_750A;

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = maps\_vehicle_aianim::_id_0BE9( self, var_3._id_9D1B );

        if ( isdefined( var_4._id_66B4 ) )
            continue;

        var_3 unlink();
        var_3 linkto( var_0, var_4._id_85AE, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

        if ( isai( var_3 ) )
        {
            var_3 _meth_81ca( var_0 gettagorigin( var_4._id_85AE ) );
            continue;
        }

        var_3.origin = var_0 gettagorigin( var_4._id_85AE );
    }
}

get_script_vehicles()
{
    var_0 = [];
    var_1 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_3 in var_1 )
    {
        if ( !isspawner( var_3 ) )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_897C( var_0 )
{
    var_1 = [];
    var_1 = maps\_vehicle_code::_id_897E( var_0 );
    return var_1;
}

get_vehicles_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_555C ) )
            var_1[var_1.size] = var_4._id_555C;
    }

    return var_1;
}

_id_8978( var_0 )
{
    var_1 = _id_897C( var_0 );
    return var_1[0];
}

get_vehicle_from_targetname( var_0 )
{
    var_1 = get_vehicles_from_targetname( var_0 );
    return var_1[0];
}

vehicle_spawner_has_targetname( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = var_0._id_9D45;

    if ( !isdefined( var_2 ) )
        return 0;

    if ( !isdefined( var_2.targetname ) )
        return 0;

    if ( var_2.targetname != var_1 )
        return 0;

    return 1;
}

_id_8979( var_0 )
{
    var_1 = _id_897C( var_0 );
    thread _id_427A( var_1[0] );
    return var_1[0];
}

_id_897D( var_0 )
{
    var_1 = _id_897C( var_0 );

    foreach ( var_3 in var_1 )
        thread _id_427A( var_3 );

    return var_1;
}

_id_0994( var_0 )
{
    thread maps\_vehicle_code::_id_0995( var_0 );
}

_id_9D6E()
{
    maps\_vehicle_code::_id_A2FF( 1 );
}

_id_9D6D()
{
    maps\_vehicle_code::_id_A2FF( 0 );
}

_id_1857( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_9CFE ) )
        level._id_9CFE = [];

    if ( !isdefined( level._id_9D00 ) )
        level._id_9D00 = [];

    if ( isdefined( level._id_9D00[var_4] ) && !level._id_9F7A )
        return;

    var_6 = spawnstruct();
    var_6.name = var_1;
    var_6.tag = var_2;
    var_6._id_27C0 = var_5;
    var_6._id_3018 = loadfx( var_3 );
    level._id_9CFE[var_0][var_1] = var_6;
    maps\_vehicle_code::_id_442A( var_0, var_1, "all" );

    if ( isdefined( var_4 ) )
        maps\_vehicle_code::_id_442A( var_0, var_1, var_4 );
}

_id_1858( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level.script ) )
        level.script = tolower( getdvar( "mapname" ) );

    level._id_9F54 = var_0;
    _id_1857( var_0, var_1, var_2, var_3, var_4, var_5 );
    level._id_9F7A = 0;
    level._id_9D00[var_4] = 1;
}

_id_1850( var_0, var_1 )
{
    if ( !isdefined( level._id_9CE3 ) )
        level._id_9CE3 = [];

    level._id_9CE3[var_0] = var_1;
}

_id_1845( var_0, var_1, var_2, var_3 )
{
    if ( var_0 != level._id_9F56 && level._id_9F56 != "script_model" )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    precachemodel( var_0 );
    precachemodel( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
    {
        level._id_9CAE[var_0] = var_1;
        level._id_9CAF[var_0] = var_2;
    }
    else
    {
        level._id_9CAE[var_3] = var_1;
        level._id_9CAF[var_3] = var_2;
    }
}

_id_1868( var_0 )
{
    precacheshellshock( var_0 );
    level._id_9D39[level._id_9F54] = var_0;
}

_id_1853( var_0 )
{
    if ( !isdefined( level._id_9CE6 ) )
        level._id_9CE6 = [];

    if ( !isdefined( level._id_9CE6[level._id_9F56] ) )
        level._id_9CE6[level._id_9F56] = [];

    level._id_9CE6[level._id_9F56][level._id_9CE6[level._id_9F56].size] = var_0;
}

_id_1849( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 10;

    level._id_9CB8[level._id_9F56] = var_0;

    if ( isdefined( var_1 ) )
        level._id_9CBB[level._id_9F56] = var_1;

    level._id_9CBA[level._id_9F56] = var_2;

    if ( isdefined( var_3 ) )
        level._id_9CB9[level._id_9F56] = var_3;
}

_id_186C( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.script ) )
        level.script = tolower( getdvar( "mapname" ) );

    if ( isdefined( var_2 ) )
        var_0 = var_2;

    if ( var_0 != "script_model" )
        precachevehicle( var_0 );

    if ( !isdefined( level._id_9CA7 ) )
        level._id_9CA7 = [];

    if ( !isdefined( level.vehicle_deathanim ) )
        level.vehicle_deathanim = [];

    if ( !isdefined( level._id_9CA7[var_3] ) )
        level._id_9CA7[var_3] = [];

    level._id_9D55[var_3] = "axis";
    level._id_9CF9[var_3] = 999;
    level._id_9CE0[var_1] = 0;
    level._id_9D0A[var_1] = [];
    level._id_9F56 = var_1;
    level._id_9F7B = var_0;
    level._id_9F54 = var_3;
}

_id_184B( var_0 )
{
    level._id_9CC1[level._id_9F56] = loadfx( var_0 );
}

_id_186E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
    {
        _id_7EFD( var_0, var_1, var_2, undefined, var_4 );

        if ( isdefined( var_3 ) && var_3 )
        {
            _id_7EFD( var_0, var_1, var_2, "_bank", var_4 );
            _id_7EFD( var_0, var_1, var_2, "_bank_lg", var_4 );
        }
    }
    else
    {
        var_0 = level._id_9F54;
        maps\_treadfx::main( var_0 );
    }
}

_id_1871( var_0, var_1, var_2, var_3, var_4 )
{
    _id_186E( var_0, var_1 + "_script_model", var_2, var_3, var_4 );
}

_id_1870( var_0, var_1 )
{
    if ( !isdefined( level._id_0686 ) )
        level._id_0686 = [];

    if ( !isdefined( level._id_0686[var_0] ) )
        level._id_0686[var_0] = spawnstruct();

    level._id_0686[var_0]._id_9106 = var_1;
}

_id_186F( var_0, var_1 )
{
    if ( !isdefined( level._id_0686 ) )
        level._id_0686 = [];

    if ( !isdefined( level._id_0686[var_0] ) )
        level._id_0686[var_0] = spawnstruct();

    level._id_0686[var_0]._id_3E81 = var_1;
}

_id_183A( var_0, var_1 )
{
    var_2 = _id_3E82();

    foreach ( var_4 in var_2 )
        _id_7EFD( var_0, var_4 );
}

_id_7EFD( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_0685 ) )
        level._id_0685 = [];

    if ( !isdefined( level._vehicle_effect_name ) )
        level._vehicle_effect_name = [];

    if ( !isdefined( level._vehicle_sound_effect ) )
        level._vehicle_sound_effect = [];

    if ( isdefined( var_3 ) )
    {
        var_1 += var_3;
        var_2 += var_3;

        if ( isdefined( var_4 ) )
            var_4 += var_3;
    }

    if ( isdefined( var_2 ) )
        update_vehicle_effect( var_0, var_1, var_2, var_4 );
    else if ( isdefined( level._id_0685[var_0] ) && isdefined( level._id_0685[var_0][var_1] ) )
    {
        level._id_0685[var_0][var_1] = undefined;
        level._vehicle_sound_effect[var_0][var_1] = var_4;
    }
}

_id_3E82()
{
    var_0 = [];
    var_0[var_0.size] = "brick";
    var_0[var_0.size] = "bark";
    var_0[var_0.size] = "carpet";
    var_0[var_0.size] = "cloth";
    var_0[var_0.size] = "concrete";
    var_0[var_0.size] = "dirt";
    var_0[var_0.size] = "flesh";
    var_0[var_0.size] = "foliage";
    var_0[var_0.size] = "glass";
    var_0[var_0.size] = "grass";
    var_0[var_0.size] = "gravel";
    var_0[var_0.size] = "ice";
    var_0[var_0.size] = "metal";
    var_0[var_0.size] = "mud";
    var_0[var_0.size] = "paper";
    var_0[var_0.size] = "plaster";
    var_0[var_0.size] = "rock";
    var_0[var_0.size] = "sand";
    var_0[var_0.size] = "snow";
    var_0[var_0.size] = "water";
    var_0[var_0.size] = "wood";
    var_0[var_0.size] = "asphalt";
    var_0[var_0.size] = "ceramic";
    var_0[var_0.size] = "plastic";
    var_0[var_0.size] = "rubber";
    var_0[var_0.size] = "cushion";
    var_0[var_0.size] = "fruit";
    var_0[var_0.size] = "paintedmetal";
    var_0[var_0.size] = "riotshield";
    var_0[var_0.size] = "slush";
    var_0[var_0.size] = "default";
    return var_0;
}

update_vehicle_effect( var_0, var_1, var_2, var_3 )
{
    level._id_0685[var_0][var_1] = loadfx( var_2 );
    level._vehicle_effect_name[var_0][var_1] = var_2;
    level._vehicle_sound_effect[var_0][var_1] = var_3;
    var_4 = maps\_treadfx::get_surface_types_variation( var_1 );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        level._id_0685[var_0][var_4[var_5]] = loadfx( var_2 );
        level._vehicle_effect_name[var_0][var_4[var_5]] = var_2;
        level._vehicle_sound_effect[var_0][var_4[var_5]] = var_3;
    }
}

add_vehicle_fx_to_bank( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( level._vehicle_effect_bank ) )
        level._vehicle_effect_bank = [];

    var_1 = _id_3E82();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        level._vehicle_effect_bank[var_0][var_4] = loadfx( var_0 );
        var_2 = maps\_treadfx::get_surface_types_variation( var_4 );

        foreach ( var_6 in var_2 )
            level._vehicle_effect_bank[var_0][var_6] = loadfx( var_0 );
    }
}

switch_vehicle_fx( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    if ( !isdefined( level._vehicle_effect_bank[var_1] ) )
        return;

    var_2 = _id_3E82();
    var_3 = 0;
    var_4 = 0;
    var_5 = "";
    var_6 = [];

    foreach ( var_8 in var_2 )
    {
        var_4 = level._id_0685[var_0][var_8];
        var_5 = level._vehicle_effect_name[var_0][var_8];
        var_3 = level._vehicle_effect_bank[var_1][var_8];
        override_vehicle_effect( var_0, var_8, var_5, var_4, var_3, var_1 );
        var_6 = maps\_treadfx::get_surface_types_variation( var_8 );

        foreach ( var_10 in var_6 )
            override_vehicle_effect( var_0, var_10, var_5, var_4, var_3, var_1 );
    }
}

override_vehicle_effect( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level._id_0685[var_0][var_1] = var_4;
    level._vehicle_effect_name[var_0][var_1] = var_5;
    level._vehicle_effect_bank[var_2][var_1] = var_3;
}

_id_186A( var_0 )
{
    level._id_9D55[level._id_9F54] = var_0;
}

_id_185A( var_0, var_1, var_2, var_3 )
{
    level._id_9CE0[level._id_9F56] = 1;

    if ( isdefined( var_0 ) )
        level._id_9D0A[level._id_9F56][var_0] = 1;

    if ( isdefined( var_1 ) )
        level._id_9D0A[level._id_9F56][var_1] = 1;

    if ( isdefined( var_2 ) )
        level._id_9D0A[level._id_9F56][var_2] = 1;

    if ( isdefined( var_3 ) )
        level._id_9D0A[level._id_9F56][var_3] = 1;
}

_id_183C( var_0 )
{
    level._id_9C92[level._id_9F54] = var_0;
}

_id_184F( var_0 )
{
    level._id_9CDB[level._id_9F54] = var_0;
}

_id_1839( var_0, var_1 )
{
    var_2 = level._id_9F54;
    level._id_9C82[var_2] = [[ var_0 ]]();

    if ( isdefined( var_1 ) )
        level._id_9C82[var_2] = [[ var_1 ]]( level._id_9C82[var_2] );
}

build_aianims_with_classname( var_0, var_1, var_2 )
{
    level._id_9C82[var_0] = [[ var_1 ]]();

    if ( isdefined( var_2 ) )
        level._id_9C82[var_0] = [[ var_2 ]]( level._id_9C82[var_0] );
}

_id_184C( var_0 )
{
    level._id_9CC7[level._id_9F54] = var_0;
}

_id_183B( var_0 )
{
    level._id_9C8D[level._id_9F54] = [[ var_0 ]]();
}

_id_1873( var_0 )
{
    level._id_9D69[level._id_9F54] = [[ var_0 ]]();
}

_id_1856( var_0, var_1, var_2 )
{
    var_3 = level._id_9F54;
    level._id_9CF9[var_3] = var_0;
    level._id_9CFB[var_3] = var_1;
    level._id_9CFA[var_3] = var_2;
}

_id_1847( var_0 )
{
    level._id_9CB1[level._id_9F56] = loadfx( var_0 );
}

_id_1848( var_0, var_1 )
{
    if ( isdefined( level._id_9CA0 ) )
        return;

    if ( var_0 != level._id_9F56 )
        return;

    var_2 = spawnstruct();
    var_2.model = var_0;
    var_2 maps\_utility::_id_6EBA( var_1 );
    level._id_2922[level._id_9F56] = var_1;
}

_id_1859( var_0 )
{
    level._id_9D76[level._id_9F7B][level._id_9F54] = var_0;
}

_id_501D()
{
    return self._id_5D41;
}

_id_9D05( var_0, var_1, var_2 )
{
    maps\_vehicle_aianim::_id_57BF( var_0, undefined, var_2 );
}

_id_9D06( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    maps\_vehicle_aianim::_id_57BF( var_3, var_1, var_2 );
}

_id_183F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_9CA5 ) )
        level._id_9CA5 = [];

    var_6 = spawnstruct();
    var_6._id_27C0 = var_0;
    var_6.duration = var_1;
    var_6.height = var_2;
    var_6.radius = var_3;
    var_6._id_91E7 = var_4;
    var_6._id_91E8 = var_5;
    level._id_9CA5[level._id_9F54] = var_6;
}

_id_5EFC( var_0, var_1 )
{
    return maps\_vehicle_code::_id_05FC( var_0, var_1 );
}

_id_8977()
{
    var_0 = maps\_utility::_id_8975();

    if ( isdefined( self._id_7AD3 ) )
    {
        if ( !_id_5118() )
            var_0 vehphys_setspeed( self._id_7AD3 );
    }

    var_0 thread _id_427A( var_0 );
    return var_0;
}

_id_9CCD( var_0 )
{
    var_1 = [];
    var_2 = self.classname;

    if ( !isdefined( level._id_9D69[var_2] ) )
        return var_1;

    var_3 = level._id_9D69[var_2];

    if ( !isdefined( var_0 ) )
        return var_1;

    foreach ( var_5 in self._id_750A )
    {
        foreach ( var_7 in var_3[var_0] )
        {
            if ( var_5._id_9D1B == var_7 )
                var_1[var_1.size] = var_5;
        }
    }

    return var_1;
}

_id_9C7F( var_0 )
{
    return maps\_vehicle_aianim::_id_0C57( var_0 );
}

_id_9D67( var_0 )
{
    return maps\_vehicle_code::_id_068D( var_0 );
}

_id_9D62()
{
    self endon( "death" );
    self endon( "stop_scanning_turret" );
    var_0 = randomint( 2 );

    while ( isdefined( self ) )
    {
        if ( common_scripts\utility::_id_2006() )
        {
            maps\_vehicle_code::_id_9C84( 0 );
            wait(randomfloatrange( 2, 10 ));
        }

        if ( var_0 == 0 )
        {
            var_1 = randomintrange( 10, 30 );
            var_0 = 1;
        }
        else
        {
            var_1 = randomintrange( -30, -10 );
            var_0 = 0;
        }

        maps\_vehicle_code::_id_9C84( var_1 );
        wait(randomfloatrange( 2, 10 ));
    }
}

_id_9D61()
{
    self notify( "stop_scanning_turret" );
}

_id_9CCB()
{
    self endon( "death" );
    var_0 = [];
    var_1 = self._id_0DF6;

    if ( !isdefined( self._id_0DF6 ) )
        return var_0;

    var_2 = var_1;
    var_2._id_2240 = 0;

    while ( isdefined( var_2 ) )
    {
        if ( isdefined( var_2._id_2240 ) && var_2._id_2240 == 1 )
            break;

        var_0 = common_scripts\utility::_id_0CDA( var_0, var_2 );
        var_2._id_2240 = 1;

        if ( !isdefined( var_2.target ) )
            break;

        if ( !_id_5118() )
        {
            var_2 = getvehiclenode( var_2.target, "targetname" );
            continue;
        }

        var_2 = maps\_utility::_id_3F82( var_2.target, "targetname" );
    }

    return var_0;
}

_id_9D02( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    maps\_vehicle_code::_id_5748( var_0, var_1 );
}

_id_9D01( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    maps\_vehicle_code::_id_5746( var_0, var_1 );
}

_id_9D3F( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self.classname ) || !isdefined( var_0 ) )
        return;

    if ( !isdefined( level._id_9CFE[self.classname] ) )
        return;

    var_1 = level._id_9CFE[self.classname][var_0];

    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1._id_27C0 ) )
        var_2 = var_1._id_27C0;
    else
        var_2 = 0;

    self endon( "death" );
    childthread common_scripts\utility::_id_6168( ::playfxontag, var_2, var_1._id_3018, self, var_1.tag );
    self._id_5744[var_0] = 1;
}

_id_9D3E( var_0 )
{
    if ( !isdefined( self._id_5744 ) )
        return;

    if ( !isdefined( self._id_5744[var_0] ) )
        return;

    var_1 = level._id_9CFE[self.classname][var_0];

    if ( !isdefined( var_1 ) )
        return;

    stopfxontag( var_1._id_3018, self, var_1.tag );
    self._id_5744[var_0] = undefined;
}

_id_9D4D( var_0, var_1 )
{
    self setswitchnode( var_0, var_1 );
    self._id_0DF6 = var_1;
    thread _id_9D17();
}

_id_9D4C( var_0, var_1, var_2 )
{
    return maps\_vehicle_code::_id_068C( var_0, var_1, var_2 );
}

_id_9D1E( var_0 )
{
    return maps\_vehicle_code::_id_068A( var_0 );
}

_id_1855( var_0 )
{
    if ( !isdefined( level._id_4810 ) )
        level._id_4810 = [];

    if ( !isdefined( var_0 ) )
        var_0 = level._id_9F7B;

    level._id_4810[var_0] = 1;
}

_id_1854( var_0 )
{
    if ( !isdefined( level._id_0997 ) )
        level._id_0997 = [];

    if ( !isdefined( var_0 ) )
        var_0 = level._id_9F7B;

    level._id_0997[var_0] = 1;
}

_id_1869( var_0 )
{
    if ( !isdefined( level._id_9D40 ) )
        level._id_9D40 = [];

    if ( !isdefined( var_0 ) )
        var_0 = level._id_9F7B;

    level._id_9D40[var_0] = 1;
}

_id_9D34( var_0 )
{
    if ( isdefined( self._id_4786 ) )
        self.health = var_0 + self._id_4786;
    else
        self.health = var_0;

    self._id_2516 = self.health;
}

_id_1863( var_0 )
{
    if ( !isdefined( level._id_9D24 ) )
        level._id_9D24 = [];

    level._id_9D24[level._id_9F54] = var_0;
}

_id_5118()
{
    return maps\_vehicle_code::_id_05D8();
}

_id_50B0()
{
    return maps\_vehicle_code::_id_05D7();
}

_id_3D4B()
{
    return maps\_vehicle_code::_id_05B3();
}
#using_animtree("vehicles");

_id_9D58( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !var_1 )
    {
        self._id_5D40 = spawn( "script_model", self.origin );
        self._id_5D40 setmodel( self.model );
        self._id_5D40.origin = self.origin;
        self._id_5D40.angles = self.angles;
        self._id_5D40 useanimtree( #animtree );
    }
    else
    {
        self._id_5D40 show();
        self._id_5D40 unlink();
        self._id_5D40.origin = self.origin;
        self._id_5D40.angles = self.angles;
    }

    self transfermarkstonewscriptmodel( self._id_5D40 );
    self hide();
    thread maps\_vehicle_code::_id_5D38();
    _id_5F23( self._id_5D40 );
    maps\_vehicle_code::_id_5F3B( self._id_5D40 );
    _id_5F3A( self._id_5D40, var_0 );
    thread maps\_vehicle_code::_id_5F18( self._id_5D40 );
    maps\_vehicle_code::_id_5F0C( self._id_5D40, var_0 );
    maps\_vehicle_code::_id_21D3( self._id_5D40 );

    if ( isdefined( self.customvehicletodummytransferfunc ) )
        self thread [[ self.customvehicletodummytransferfunc ]]( self._id_5D40, var_0 );

    self._id_5D41 = 1;

    if ( maps\_vehicle_code::_id_472F() )
    {
        self notify( "stop_kicking_up_dust" );
        thread maps\_vehicle_code::_id_0995( self._id_5D40 );
    }

    return self._id_5D40;
}

_id_1840( var_0 )
{
    if ( !isdefined( level._id_9CA9 ) )
        level._id_9CA9 = [];

    var_1 = spawnstruct();
    var_1._id_27C0 = var_0;
    level._id_9CA9[level._id_9F54] = var_1;
}

_id_30C6()
{
    level._id_9D42 = 1;
}

tank_crush( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = _id_9D58();
    var_9 = 7;
    var_10 = 5;
    var_11 = 5;
    self vehicle_setspeed( var_9, var_10, var_11 );
    var_12 = getanimlength( var_2 );
    var_13 = var_12 / 3;
    var_14 = var_12 / 3;
    var_15 = var_0.origin;
    var_16 = var_0.angles;
    var_17 = anglestoforward( var_16 );
    var_18 = anglestoup( var_16 );
    var_19 = anglestoright( var_16 );
    var_20 = getstartorigin( var_15, var_16, var_2 );
    var_21 = getstartangles( var_15, var_16, var_2 );
    var_22 = anglestoforward( var_21 );
    var_23 = anglestoup( var_21 );
    var_24 = anglestoright( var_21 );
    var_25 = anglestoforward( var_8.angles );
    var_26 = anglestoup( var_8.angles );
    var_27 = anglestoright( var_8.angles );
    var_28 = var_15 - var_20;
    var_29 = vectordot( var_28, var_22 );
    var_30 = vectordot( var_28, var_23 );
    var_31 = vectordot( var_28, var_24 );
    var_32 = spawn( "script_origin", var_8.origin );
    var_32.origin += maps\_utility::vector_multiply( var_25, var_29 );
    var_32.origin += maps\_utility::vector_multiply( var_26, var_30 );
    var_32.origin += maps\_utility::vector_multiply( var_27, var_31 );
    var_28 = anglestoforward( var_16 );
    var_29 = vectordot( var_28, var_22 );
    var_30 = vectordot( var_28, var_23 );
    var_31 = vectordot( var_28, var_24 );
    var_33 = maps\_utility::vector_multiply( var_25, var_29 );
    var_33 += maps\_utility::vector_multiply( var_26, var_30 );
    var_33 += maps\_utility::vector_multiply( var_27, var_31 );
    var_32.angles = vectortoangles( var_33 );

    if ( isdefined( var_5 ) )
        level thread common_scripts\utility::_id_69C2( var_5, var_15 );

    var_8 linkto( var_32 );
    var_0 useanimtree( var_4 );
    var_8 useanimtree( var_4 );
    var_34 = tank_crush_fx_validation( level._id_0685["tankcrush"]["window_med_left"], level._id_0685["tankcrush"]["window_med"] );
    var_35 = tank_crush_fx_validation( level._id_0685["tankcrush"]["window_med_right"], level._id_0685["tankcrush"]["window_med"] );
    var_36 = tank_crush_fx_validation( level._id_0685["tankcrush"]["window_large_back"], level._id_0685["tankcrush"]["window_large"] );
    var_37 = tank_crush_fx_validation( level._id_0685["tankcrush"]["window_large_front"], level._id_0685["tankcrush"]["window_large"] );

    if ( tank_crush_has_notetracks( var_3 ) )
    {
        var_0 thread notetrack_tank_crush_fx_on_tag( "tag_window_left_glass_fx", var_34, "veh_glass_break_small", "left_glass_fx", var_3 );
        var_0 thread notetrack_tank_crush_fx_on_tag( "tag_window_right_glass_fx", var_35, "veh_glass_break_small", "right_glass_fx", var_3 );
        var_0 thread notetrack_tank_crush_fx_on_tag( "tag_windshield_back_glass_fx", var_36, "veh_glass_break_large", "back_glass_fx", var_3 );
        var_0 thread notetrack_tank_crush_fx_on_tag( "tag_windshield_front_glass_fx", var_37, "veh_glass_break_large", "front_glass_fx", var_3 );
    }
    else
    {
        var_0 thread tank_crush_fx_on_tag( "tag_window_left_glass_fx", var_34, "veh_glass_break_small", 0.2 );
        var_0 thread tank_crush_fx_on_tag( "tag_window_right_glass_fx", var_35, "veh_glass_break_small", 0.4 );
        var_0 thread tank_crush_fx_on_tag( "tag_windshield_back_glass_fx", var_36, "veh_glass_break_large", 0.7 );
        var_0 thread tank_crush_fx_on_tag( "tag_windshield_front_glass_fx", var_37, "veh_glass_break_large", 1.5 );
    }

    var_0 _meth_8140( "tank_crush_anim", var_15, var_16, var_3 );
    var_8 _meth_8140( "tank_crush_anim", var_32.origin, var_32.angles, var_2 );

    if ( isdefined( var_7 ) )
        thread [[ var_7 ]]( var_0 );

    var_32 moveto( var_15, var_13, var_13 / 2, var_13 / 2 );
    var_32 rotateto( var_16, var_13, var_13 / 2, var_13 / 2 );
    wait(var_13);
    var_12 -= var_13;
    var_12 -= var_14;
    set_crush_vehicle_clips( var_0, "precrushed", 0 );
    set_crush_vehicle_clips( var_0, "postcrushed", 1 );
    wait(var_12);
    var_38 = spawn( "script_model", var_20 );
    var_38.angles = var_21;
    var_39 = var_38 localtoworldcoords( getmovedelta( var_2, 0, 1 ) );
    var_40 = var_21 + ( 0, getangledelta( var_2, 0, 1 ), 0 );
    var_38 delete();
    var_41 = anglestoforward( var_40 );
    var_42 = anglestoup( var_40 );
    var_43 = anglestoright( var_40 );
    var_44 = self getattachpos( var_1 );
    var_25 = anglestoforward( var_44[1] );
    var_26 = anglestoup( var_44[1] );
    var_27 = anglestoright( var_44[1] );
    var_28 = var_15 - var_39;
    var_29 = vectordot( var_28, var_41 );
    var_30 = vectordot( var_28, var_42 );
    var_31 = vectordot( var_28, var_43 );
    var_32.final_origin = var_44[0];
    var_32.final_origin += maps\_utility::vector_multiply( var_25, var_29 );
    var_32.final_origin += maps\_utility::vector_multiply( var_26, var_30 );
    var_32.final_origin += maps\_utility::vector_multiply( var_27, var_31 );
    var_28 = anglestoforward( var_16 );
    var_29 = vectordot( var_28, var_41 );
    var_30 = vectordot( var_28, var_42 );
    var_31 = vectordot( var_28, var_43 );
    var_33 = maps\_utility::vector_multiply( var_25, var_29 );
    var_33 += maps\_utility::vector_multiply( var_26, var_30 );
    var_33 += maps\_utility::vector_multiply( var_27, var_31 );
    var_32.final_angles = vectortoangles( var_33 );

    if ( getdvar( "debug_tankcrush" ) == "1" )
    {
        thread maps\_utility::_id_2DB9( level.player, self.origin, 1, 0, 0, var_12 / 2 );
        thread maps\_utility::_id_2DB9( level.player, var_39, 0, 1, 0, var_12 / 2 );
        thread maps\_utility::_id_2DBA( level.player, var_32, 0, 0, 1, var_12 / 2 );
    }

    if ( isdefined( var_6 ) && var_6 )
    {
        var_45 = 1;
        var_46 = distance( self.origin, var_1.origin );
        var_47 = var_46 / var_14;
        self vehicle_setspeed( var_47, var_47 * 0.05 );
    }

    var_32 moveto( var_32.final_origin, var_14, var_14 / 2, var_14 / 2 );
    var_32 rotateto( var_32.final_angles, var_14, var_14 / 2, var_14 / 2 );
    wait(var_14);
    self attachpath( var_1 );

    if ( isdefined( var_6 ) && var_6 )
        self vehicle_setspeed( var_9, var_10, var_11 );

    _id_2FC3();
}

set_crush_vehicle_clips( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( var_1 != "precrushed" && var_1 != "postcrushed" )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = [];

    if ( isdefined( var_0 ) && isdefined( var_0.targetname ) )
        var_3 = getentarray( var_0.targetname + "_" + var_1 + "_clip", "targetname" );
    else
    {
        var_4 = getentarray( "script_brushmodel", "classname" );

        foreach ( var_6 in var_4 )
        {
            if ( isdefined( var_6.targetname ) && issubstr( var_6.targetname, var_1 ) )
                var_3 = common_scripts\utility::_id_0CDA( var_3, var_6 );
        }
    }

    foreach ( var_9 in var_3 )
    {
        if ( var_2 )
        {
            var_9 solid();
            continue;
        }

        var_9 notsolid();
    }
}

tank_crush_fx_on_tag( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        wait(var_3);

    playfxontag( var_1, self, var_0 );

    if ( isdefined( var_2 ) )
        thread maps\_utility::_id_69C5( var_2, var_0 );
}

notetrack_tank_crush_fx_on_tag( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !animhasnotetrack( var_4, var_3 ) )
        return;

    var_5 = getanimlength( var_4 );
    var_6 = getnotetracktimes( var_4, var_3 );
    var_5 *= var_6[0];
    wait(var_5);
    playfxontag( var_1, self, var_0 );

    if ( isdefined( var_2 ) )
        thread maps\_utility::_id_69C5( var_2, var_0 );
}

tank_crush_fx_validation( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        return var_0;

    if ( isdefined( var_1 ) )
        return var_1;
}

tank_crush_has_notetracks( var_0 )
{
    if ( animhasnotetrack( var_0, "left_glass_fx" ) )
        return 1;

    if ( animhasnotetrack( var_0, "right_glass_fx" ) )
        return 1;

    if ( animhasnotetrack( var_0, "back_glass_fx" ) )
        return 1;

    if ( animhasnotetrack( var_0, "front_glass_fx" ) )
        return 1;

    return 0;
}

heli_squashes_stuff( var_0 )
{
    self endon( "death" );
    level endon( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isalive( var_1 ) )
        {
            if ( var_1.team == "allies" && var_1 != level.player )
                continue;

            var_1 dodamage( var_1.health + 150, ( 0.0, 0.0, 0.0 ) );
        }
    }
}

show_rigs( var_0 )
{
    wait 0.01;
    thread maps\_vehicle_aianim::_id_406B( self, var_0 );

    if ( !self._id_750A.size )
        return;

    for ( var_1 = 0; var_1 < self._id_750A.size; var_1++ )
        thread maps\_vehicle_aianim::_id_406B( self, self._id_750A[var_1]._id_9D1B );
}

build_exploder_event_with_targetname( var_0, var_1, var_2, var_3 )
{
    thread build_exploder_event_with_targetname_internal( var_0, var_1, var_2, var_3 );
}

build_exploder_event_with_targetname_internal( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\_utility::_id_4155( var_0 );
    var_4 waittill( "spawned", var_5 );
    build_exploder_event_internal( var_5, var_1, var_2, var_3 );
}

build_exploder_event( var_0, var_1, var_2, var_3 )
{
    thread build_exploder_event_internal( var_0, var_1, var_2, var_3 );
}

build_exploder_event_internal( var_0, var_1, var_2, var_3 )
{
    var_0 waittill( var_1 );

    if ( isdefined( var_3 ) )
        wait(var_3);

    common_scripts\_exploder::_id_3528( var_2 );
}

volume_up( var_0 )
{
    self notify( "new_volume_command" );
    self endon( "new_volume_command" );
    self endon( "death" );
    self scalevolume( 0, 0 );

    if ( isdefined( self._id_86CE ) )
        self._id_86CE = 0;
    else
        self vehicle_turnengineon();

    self scalevolume( 1.0, var_0 );
    wait(var_0);
}

volume_down( var_0 )
{
    self notify( "new_volume_command" );
    self endon( "new_volume_command" );
    self endon( "death" );
    self scalevolume( 0.0, var_0 );
    wait(var_0);

    if ( isdefined( self._id_86CE ) )
        self._id_86CE = 1;
    else
        self vehicle_turnengineoff();
}

lerp_enginesound( var_0, var_1, var_2 )
{

}
