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

near_tv()
{
    level endon( "tvstation_entered" );

    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::_id_383F( "near_tv" );

        while ( level.player istouching( self ) )
            wait 1;

        stopcinematicingame();
        level notify( "away_from_tv" );
        common_scripts\utility::_id_3831( "near_tv" );
    }
}

movies_on_tvs()
{
    level endon( "stop_asad_recording" );
    wait 2;
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        common_scripts\utility::_id_384C( "tvstation_entered", "near_tv" );
        start_movie_loop();
    }
}

start_movie_loop()
{
    level endon( "away_from_tv" );
    level endon( "stop_asad_recording" );

    for (;;)
    {
        cinematicingameloopresident( "asad_speech_180" );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}

flashbang_hint()
{
    var_0 = getent( "flashbang_hint", "targetname" );
    var_0 waittill( "trigger" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "throwflash" );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "player_has_flashed" ) )
        thread maps\armada::keyhint( &"ARMADA_HINT_FLASH", "flash", "+smoke", 10 );

    var_1 = getentarray( "hq_breachers", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isalive( var_1[var_2] ) )
            var_1[var_2] dodamage( var_1[var_2].health + 100, var_1[var_2].origin );
    }
}

flag_on_flash()
{
    notifyoncommand( "player_flash", "-smoke" );
    level.player waittill( "player_flash" );
    common_scripts\utility::_id_383F( "player_has_flashed" );
}

quiet_circling_helicopters()
{
    var_0 = get_vehiclearray( "circling_heli", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] vehicle_turnengineoff();
}

add_damage_recorder()
{
    self.player_damage_done = 0;
    self.non_player_damage_done = 0;
}

_id_6ACA()
{
    return self.player_damage_done * 1.75 > self.non_player_damage_done;
}

init_pickup_technical()
{
    var_0 = maps\_vehicle_code::_id_05BE();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.classname ) )
        {
            if ( var_2.classname == "script_vehicle_pickup_technical" )
                var_2 thread pickup_technical_think();
        }
    }
}

init_pickup_technical_badplace()
{
    var_0 = maps\_vehicle_code::_id_05BE();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.classname ) )
        {
            if ( var_2.classname == "script_vehicle_pickup_technical" )
                var_2._id_2554 = ::pickup_technical_custombadplace;
        }
    }
}

pickup_technical_custombadplace()
{
    var_0 = 300;
    self endon( "kill_badplace_forever" );

    if ( !self vehicle_isphysveh() )
        self endon( "death" );

    self endon( "delete" );
    var_1 = getent( "PickupTechnicalBadBlaceVolume", "targetname" );
    var_2 = isdefined( level._id_9CE0[self.model] ) && level._id_9CE0[self.model];
    var_3 = 0.1;
    var_4 = 17;
    var_5 = 17;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_6 = self vehicle_getspeed();

        if ( var_6 <= 0 )
        {
            wait(var_3);
            continue;
        }

        if ( var_6 < 5 )
            var_7 = 200;
        else if ( var_6 > 5 && var_6 < 8 )
            var_7 = 350;
        else
            var_7 = 500;

        if ( isdefined( self._id_1268 ) )
            var_7 *= self._id_1268;

        if ( var_2 )
            var_8 = anglestoforward( self gettagangles( "tag_turret" ) );
        else
            var_8 = anglestoforward( self.angles );

        var_1.origin = self.origin;
        var_1.angles = ( 0.0, self.angles[1], 0.0 );
        badplace_arc( self._id_9A29 + "arc", var_3, self.origin, var_7 * 1.9, var_0, var_8, var_4, var_5, "axis", "team3", "allies" );
        badplace_brush( self._id_9A29 + "bru", var_3, var_1, "axis", "allies" );
        wait(var_3 + 0.05);
    }
}

pickup_arcade_setup()
{
    add_damage_recorder();
    pickup_check_damage();

    if ( _id_6ACA() )
        thread maps\_arcademode::arcademode_add_points( self.origin, 1, "explosive", 200 );
}

pickup_check_damage()
{
    self endon( "pickup_death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.player )
        {
            self.player_damage_done += var_0;
            continue;
        }

        if ( var_1 != self && isdefined( var_1.team ) && var_1.team != "axis" )
            self.non_player_damage_done += var_0;
    }
}

pickup_check_death()
{
    while ( isdefined( self.model ) && self.model != "vehicle_pickup_technical_destroyed" )
        waittillframeend;

    self notify( "pickup_death" );
}

pickup_technical_think()
{
    self waittill( "spawned", var_0 );
    var_0._id_0DF4[0].a._id_2B20 = 1;
    var_0._id_0DF4[0]._id_2AF7 = 1;

    if ( maps\_utility::_id_0CC3() )
        var_0 thread pickup_arcade_setup();

    var_0.tail_gate = spawn( "script_model", var_0 gettagorigin( "tag_rear_tailgate" ) );
    var_0.tail_gate setmodel( "vehicle_pickup_rear_tailgate" );
    var_0.tail_gate linkto( var_0, "tag_rear_tailgate", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0.tailgate_clip = getent( "tailgate_clip", "targetname" );
    var_0.tailgate_clip.origin = var_0 gettagorigin( "tag_rear_tailgate" ) + ( 0.0, 0.0, 12.0 );
    var_0.tailgate_clip.angles = var_0 gettagangles( "tag_rear_tailgate" );
    var_0.tailgate_clip linkto( var_0, "tag_rear_tailgate" );
    var_0 thread vehicle_tail_gate_remove();
    var_1 = spawn( "script_model", var_0._id_5BD5[0] gettagorigin( "tag_flash" ) );
    var_1 linkto( var_0._id_5BD5[0], "tag_flash", ( -25.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0.col_clip = getent( "col_clip_pickup", "targetname" );
    var_0.col_clip.origin = var_0._id_5BD5[0].origin + ( 0.0, 0.0, -12.0 );
    var_0.col_clip.angles = var_0._id_5BD5[0] gettagangles( "tag_flash" );
    var_0.col_clip linkto( var_0._id_5BD5[0], "tag_flash" );
    var_0 thread vehicle_gun_clip_remove();
    var_0 thread pickup_check_death();

    for (;;)
    {
        var_2 = level.player istouching( var_1 );
        var_3 = isdefined( var_0.model ) && var_0.model == "vehicle_pickup_technical_destroyed";
        var_4 = var_2 || var_3 || var_0._id_0DF4[0].health <= 0;

        if ( var_4 )
        {
            if ( var_2 )
                level.player kill();

            var_1 delete();
            break;
        }

        wait 0.5;
    }
}

init_heli_turrets()
{
    level.heli_turrets = [];
    maps\_vehicle::waittill_vehiclespawn_noteworthy( "circling_heli" );
    wait 0.1;
    var_0 = get_vehiclearray( "circling_heli", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::setup_circling_heli_turret );
}

circling_helis_fire()
{
    while ( level.heli_turrets.size == 0 )
        wait 1;

    common_scripts\utility::_id_0D13( level.heli_turrets, ::circling_heli_minigun_firethread );
    common_scripts\utility::_id_0D13( level.heli_turrets, ::heli_minigun_targetthread, 10 );
}

intro_helis_fire()
{
    common_scripts\utility::_id_0D13( level.heli_turrets, ::intro_heli_minigun_firethread );
    common_scripts\utility::_id_0D13( level.heli_turrets, ::heli_minigun_targetthread, 2 );
    common_scripts\utility::_id_384A( "kill_rpgs" );
    level notify( "helis_stop_firing" );
}

setup_circling_heli_turret()
{
    var_0 = "tag_gun_l";
    var_1 = spawnturret( "misc_turret", self gettagorigin( var_0 ), "heli_minigun_noai" );
    var_1 setmodel( "weapon_saw_MG_setup" );
    var_1 linkto( self, var_0, ( 0.0, 0.0, -24.0 ), ( 0.0, 90.0, 0.0 ) );
    var_1 maketurretinoperable();
    var_1 setmode( "manual" );
    var_1 setturretteam( "allies" );
    var_1 setconvergencetime( 0, "yaw" );
    var_1 setconvergencetime( 0, "pitch" );
    level.heli_turrets[level.heli_turrets.size] = var_1;
}

intro_heli_minigun_firethread()
{
    level endon( "helis_stop_firing" );
    level.miniguns_firing = 1;

    for (;;)
    {
        if ( level.miniguns_firing )
        {
            var_0 = randomintrange( 3, 7 );

            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self shootturret();
                wait 0.1;
            }
        }

        wait(randomfloatrange( 0.5, 2 ));
    }
}

circling_heli_minigun_firethread()
{
    level endon( "helis_stop_firing" );
    level.miniguns_firing = 1;

    for (;;)
    {
        if ( level.miniguns_firing )
        {
            var_0 = randomintrange( 3, 7 );

            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self shootturret();
                wait 0.1;
            }
        }

        if ( randomint( 3 ) == 0 )
            wait(randomintrange( 5, 8 ));

        wait(randomfloatrange( 0.5, 2 ));
    }
}

heli_minigun_targetthread( var_0 )
{
    level endon( "helis_stop_firing" );
    var_1 = getent( "minigun_target", "targetname" );
    self settargetentity( var_1 );

    for (;;)
    {
        var_2 = getaiarray( "axis" );
        var_2 = remove_technical_enemies_from_array( var_2 );

        if ( var_2.size > 0 )
        {
            level.miniguns_firing = 1;
            var_1 = var_2[randomint( var_2.size )];
            self settargetentity( var_1 );
        }
        else
            level.miniguns_firing = 0;

        wait(var_0);
    }
}

remove_technical_enemies_from_array( var_0 )
{
    var_1 = [];
    var_2 = 5500;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3].script_noteworthy ) )
        {
            if ( var_0[var_3].script_noteworthy == "technical_enemies" )
                continue;
        }

        if ( distancesquared( var_0[var_3].origin, self.origin ) > var_2 * var_2 )
            continue;

        var_1[var_1.size] = var_0[var_3];
    }

    return var_1;
}

draw_target()
{
    for (;;)
    {
        maps\_debug::_id_2DD0( self.origin, self.angles );
        wait 0.05;
    }
}

get_vehiclearray( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !isspawner( var_2[var_4] ) )
        {
            if ( var_2[var_4].code_classname == "script_vehicle" )
                var_3[var_3.size] = var_2[var_4];
        }
    }

    return var_3;
}

vehicle_gun_clip_remove()
{
    self waittill( "pickup_death" );
    self.col_clip delete();
}

vehicle_tail_gate_remove()
{
    self waittill( "pickup_death" );
    self.tailgate_clip delete();
    self.tail_gate delete();
}
