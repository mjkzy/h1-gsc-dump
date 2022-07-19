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

start_court()
{
    level.playercardbackground setorigin( getnode( "start_leaving_apartment", "targetname" ).origin );
}

start_melee()
{
    _id_A5E8::_id_870C( "start_melee_checkpoint" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_0, ::_id_2819 );
    thread melee_sequence();
    level.playercardbackground setplayerangles( ( 0, 240, 0 ) );
    level.playercardbackground setorigin( ( 10181.9, 708.265, 100.567 ) );
}

start_breach()
{
    _id_A5E8::_id_870C( "start_breach_checkpoint" );
    common_scripts\utility::_id_383F( "second_floor_door_breach_initiated" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_0, ::_id_2819 );
    thread melee_sequence();
    level.playercardbackground setplayerangles( ( 0, 180, 0 ) );
    level.playercardbackground setorigin( ( 9976.2, 423.6, 236 ) );
    thread second_floor_door_breach_setup();

    for (;;)
    {
        var_1 = getent( "second_floor_door_breach_trigger", "script_noteworthy" );
        var_1 notify( "trigger" );
        wait 1;
    }
}

second_floor_door_breach_setup()
{
    for (;;)
    {
        second_floor_door_breach_guys( 1 );
        var_0 = getent( "apartment_second_floor_door_breach", "targetname" );
        var_0 connectpaths();
        var_0 door_opens( -1 );
    }
}

start_apart()
{
    thread melee_sequence();
    level.playercardbackground setplayerangles( ( 0, 240, 0 ) );
    level.playercardbackground setorigin( ( 10181.9, 708.265, 100.567 ) );
}

spawn_guys_that_run_away( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::spawn_guy_that_runs_away );
}

spawn_guy_that_runs_away()
{
    self.count = 1;
    var_0 = _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = var_0.pathlookaheaddist;
    var_0.pathlookaheaddist = 0;
    var_0 waittill( "goal" );
    var_0.pathlookaheaddist = var_1;
}

delayed_spawn_and_kill( var_0, var_1 )
{
    wait(var_1);
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2 _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_3 ) )
        return;

    var_3 kill();
}

ai_walk_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0.team == "axis" )
            return;

        var_0 _id_A5A4::_id_22DA( "on" );

        if ( !common_scripts\utility::_id_382E( "night_vision" ) )
        {
            common_scripts\utility::_id_383F( "night_vision" );
            var_1 = getent( "green_friendly", "targetname" );
            var_1 _id_A510::_id_0C24( var_1, "night_vision" );
        }
    }
}

friendlies_wait_for_ambush_then_fight_back()
{
    self endon( "death" );
    self.pantssize = 1;
    self.goalheight = 48;
    common_scripts\utility::_id_384A( "friendlies_take_fire" );
    self.pantssize = 0;
}

rooftop_damage_trigger()
{
    var_0 = getent( "rooftop_damage_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_0 delete();
    common_scripts\utility::_id_383F( "rooftop_guys_fall_back" );
}

bridge_truck_pauses_then_leaves()
{
    var_0 = _id_A5A8::_id_8978( "bridge_truck_pause" );
    var_0 drives();
    getvehiclenode( "bridge_pause_node", "script_noteworthy" ) waittill( "trigger" );
    var_0 vehicle_setspeed( 0, 12 );
    wait 10;
    var_0 vehicle_setspeed( 25, 10 );
}

bridge_damage_trigger()
{
    var_0 = getent( "bridge_damage_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            break;

        if ( !isdefined( var_1.team ) )
            continue;

        if ( var_1.team == "axis" )
            common_scripts\utility::_id_383F( "bridge_walkers_attack" );
    }

    common_scripts\utility::_id_383F( "bridge_damage_trigger" );
}

bridge_runners()
{
    wait 3;
    var_0 = _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = getnode( var_0._not_team, "targetname" );
    var_0 _meth_81a9( var_1 );
    var_0.invisible = 0;
    var_0.index = 1;
    var_0.goalradius = 64;
    var_0 waittill( "goal" );

    if ( level.bridge_damage_trigger == "cleared" )
    {
        level.bridge_damage_trigger = "set";
        thread bridge_damage_trigger();
    }

    _id_A5A4::_id_9FA1( "bridge_damage_trigger", 13 );
    common_scripts\utility::_id_383F( "bridge_runners_flee" );
    _id_A5A4::waitspread( 1, 5 );
    var_1 = getnode( "early_bridge_node", "targetname" );
    var_0 _meth_81a9( var_1 );
}

bridge_truck_drives( var_0 )
{
    _id_A5A8::_id_23DE( var_0 );
}

vehicle_delete_trigger()
{
    level endon( "player_enters_laundrymat" );
    var_0 = getent( "vehicle_delete_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 delete();
    }
}

bad_infantry_attack()
{
    level.bad_infantry_count = 0;
    var_0 = getentarray( "tank_killing_guy", "targetname" );
}

bad_infantry_spawner()
{
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 1, 2 ));

        if ( level.bad_infantry_count >= 10 )
        {
            level waittill( "bad_infantry_died" );
            continue;
        }

        self.count = 1;
        var_0 = self stalingradspawn();

        if ( _id_A5A4::_id_88F1( var_0 ) )
            continue;

        var_0 thread bad_infantry_think();
    }
}

bad_infantry_think()
{
    level.bad_infantry_count++;
    var_0 = getnode( "tank_kill_node", "targetname" );

    if ( isalive( level.goodtank ) )
        self _meth_816b( level.goodtank );

    self _meth_81a9( var_0 );
    self.goalradius = 384;
    thread bad_infantry_reaches_goal_and_deletes();
    self waittill( "death" );
    level.bad_infantry_count--;
    level notify( "bad_infantry_died" );
}

bad_infantry_reaches_goal_and_deletes()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

stop_at_node( var_0 )
{
    self notify( "new_stop_node" );
    thread stop_at_node_thread( var_0 );
}

stop_at_node_thread( var_0 )
{
    self endon( "new_stop_node" );
    self endon( "death" );
    getvehiclenode( var_0, "script_noteworthy" ) waittill( "trigger" );
    self vehicle_setspeed( 0, 100 );
}

opens_fire()
{
    thread open_fire_thread();
}

open_fire_thread()
{
    self endon( "death" );
    self endon( "stop_firing" );
    self._id_24FD endon( "death" );

    for (;;)
    {
        self fireweapon();
        wait(randomfloatrange( 5, 12 ));
    }
}

stop_firing_when_target_dies()
{
    thread stop_firing_when_target_dies_thread();
}

stop_firing_when_target_dies_thread()
{
    self._id_24FD waittill( "death" );
    stops_firing();
}

stops_firing()
{
    self notify( "stop_firing" );
}

targets_tank( var_0 )
{
    thread targets_tank_thread( var_0 );
}

targets_tank_thread( var_0 )
{
    wait 0.11;
    self setturrettargetent( var_0, ( 0, 0, 60 ) );
    self._id_24FD = var_0;
}

becomes_vulnerable()
{
    _id_A5A8::_id_4258();
    self.helmet = 1;
}

drives()
{
    thread _id_A5A8::_id_427A( self );
}

heli_riders_spawn_and_delete()
{
    self waittill( "spawned", var_0 );

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    var_0 endon( "death" );
    level waittill( "heli_gone" );
    var_0 delete();
}

heli_guys_run_in()
{
    wait 3;
    var_0 = getentarray( "heli_squad_spawner", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1] _id_A5A4::_id_88C3();

        if ( _id_A5A4::_id_88F1( var_2 ) )
            continue;

        var_2.goalradius = 200;
        var_2 _meth_81aa( ( 8131.3, 2652.8, 87.8 ) );
    }
}

helicopter_drops_off_guys()
{
    var_0 = getentarray( "heli_squad", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::heli_riders_spawn_and_delete );
    var_1 = getent( "heli_path", "targetname" );
    var_2 = _id_A5A8::_id_8978( "heli" );
    var_2.helmet = 10000000;
    var_2 vehicle_setspeed( 150, 35, 35 );
    var_2 neargoalnotifydist( 500 );

    for (;;)
    {
        if ( !isdefined( var_1._not_team ) )
            break;

        var_1 = getent( var_1._not_team, "targetname" );
        var_2 setgoalyaw( var_1.angles[1] );
        var_2 setgoalpos( var_1.origin, 1 );

        while ( distance( var_2.origin, var_1.origin ) >= 500 )
            wait 0.05;
    }

    var_2 neargoalnotifydist( 50 );
    var_2 waittill( "near_goal" );
    var_2 notify( "unload" );
    wait 8;
    thread heli_guys_run_in();
    var_2 vehicle_setspeed( 50, 15, 15 );
    var_2 neargoalnotifydist( 500 );
    var_1 = getent( "heli_retreat_path", "targetname" );

    for (;;)
    {
        var_2 setgoalpos( var_1.origin, 1 );

        while ( distance( var_2.origin, var_1.origin ) >= 500 )
            wait 0.05;

        var_2 vehicle_setspeed( 150, 25, 15 );

        if ( !isdefined( var_1._not_team ) )
            break;

        var_1 = getent( var_1._not_team, "targetname" );
        var_2 setgoalyaw( var_1.angles[1] );
    }

    var_2 delete();
    level notify( "heli_gone" );
}

draw_dest_line( var_0 )
{
    self notify( "new_dest_line" );
    self endon( "new_dest_line" );

    for (;;)
        wait 0.05;
}

helicopter_flies_by_overhead( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    var_4 = _id_A5A8::_id_8978( var_0 );

    if ( var_0 == "alley_heli" )
    {
        var_4 setmaxpitchroll( 25, 45 );
        var_4 setyawspeed( 50, 25 );
    }

    var_4 heli_flies( var_2, var_3 );
}

helicopters_flies_by_overhead( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    var_4 = _id_A5A8::_id_897C( var_0 );
    var_4 = common_scripts\utility::_id_0CF5( var_4 );
    var_5 = 3;

    for ( var_6 = 0; var_6 < var_4.size - var_5; var_6++ )
        var_4[var_6] thread heli_flies( var_2, var_3 );

    for ( var_6 = var_4.size - var_5; var_6 < var_4.size; var_6++ )
        var_4[var_6] delete();
}

heli_flies( var_0, var_1 )
{
    self endon( "death" );
    self._id_7B04 = 0;
    self.helmet = 10000000;
    self setturningability( 1 );
    _id_A5AA::helipath( self._not_team, var_0, var_1 );
    self delete();
}

lookatpath( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    self setlookatent( var_1 );
    wait 1.5;
}

aim_trigger_think()
{
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( var_0[var_1._id_9A29] ) )
            continue;

        var_0[var_1._id_9A29] = 1;
        thread aimsatself( var_1 );
    }
}

aimsatself( var_0 )
{
    var_1 = getent( self._not_team, "targetname" );
    var_0 endon( "death" );
    var_0 _id_A5A4::_id_22CF( var_1 );

    while ( var_0 istouching( self ) )
    {
        wait 0.05;
        continue;
    }

    var_0 _id_A5A4::_id_22CF();
}

acquire_ai()
{
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( var_0[var_1._id_9A29] ) )
            continue;

        var_0[var_1._id_9A29] = 1;
        var_1 thread ai_tells_trigger_he_died( self );
    }
}

ai_tells_trigger_he_died( var_0 )
{
    self waittill( "death" );

    if ( self istouching( var_0 ) )
    {
        var_0.deaths++;
        var_0 notify( "died" );
    }
}

street_guys_run_for_it()
{
    self endon( "death" );
    var_0 = getnode( self._not_team, "targetname" );
    self _meth_81a9( var_0 );
    self.goalradius = 32;
    self.index = 1;
    self setthreatbiasgroup( "street_guys" );
    common_scripts\utility::_id_384A( "street_guys_run" );
    _id_A5A4::waitspread( 0, 3 );

    for (;;)
    {
        self waittill( "goal" );

        if ( !isdefined( var_0._not_team ) )
            break;

        var_0 = getnode( var_0._not_team, "targetname" );
        self _meth_81a9( var_0 );
    }

    if ( !self _meth_81c2( level.playercardbackground ) )
        self delete();
}

ai_enters_apartment( var_0 )
{
    level.apartment_reach++;
    var_1 = getnode( "right_house_node", "targetname" );
    _id_A5A4::waitspread( 0.01, 2.5 );
    self _meth_81a9( var_1 );
    self.index = 1;
    self.goalradius = 32;
    self waittill( "goal" );
    var_1 = getnode( var_1._not_team, "targetname" );
    self _meth_81a9( var_1 );
    self waittill( "goal" );
    var_1 = getnode( var_0, "targetname" );
    self _meth_81a9( var_1 );
    self waittill( "goal" );
    self.index = 0;
    level.apartment_reach--;

    if ( !level.apartment_reach )
        common_scripts\utility::_id_383F( "reached_apartment" );
}

door_opens( var_0 )
{
    self playsound( "wood_door_kick" );
    var_1 = -140;

    if ( isdefined( var_0 ) )
        var_1 *= var_0;

    self rotateyaw( var_1, 0.3, 0, 0.3 );
    self connectpaths();
}

wave()
{
    thread waveproc();
}

waveproc()
{
    self notify( "do_a_wave" );
    self endon( "do_a_wave" );
    self setflaggedanimrestart( "wave", level._id_78AC[self._id_0C72]["wave"], 1, 0.1, 1 );
    wait 3;
    self _meth_8144( level._id_78AC[self._id_0C72]["wave"], 0.1 );
}

notetrackprinter( var_0 )
{
    self endon( "death" );
    self notify( "notetrackprinter" + var_0 );
    self endon( "notetrackprinter" + var_0 );

    for (;;)
        self waittill( var_0, var_1 );
}

target_spot_delayed( var_0, var_1 )
{
    self endon( "death" );
    wait(var_1);
    _id_A5A4::_id_22CF( var_0 );
}

melee_sequence()
{
    var_0 = getent( "start_melee", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" );
    var_2 = getent( var_1._not_team, "targetname" );
    var_2._id_7A40 = 1;
    var_3 = getent( "melee_enemy_spawner", "targetname" );
    var_3._id_7A40 = 1;
    var_4 = getnode( var_2._not_team, "targetname" );
    var_5 = getent( "player_breaks_melee_sequence", "targetname" );
    var_6 = getent( "melee_ai_trigger", "targetname" );
    var_7 = getnode( var_3._not_team, "targetname" );
    var_0 waittill( "trigger" );
    var_8 = var_2 _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_8 ) )
        return;

    var_8.ignoreforfixednodesafecheck = 1;
    var_8.ignoretriggers = 1;
    var_8.pathlookaheaddist = 0;
    var_8.pathrandompercent = 0;
    var_8.goalheight = 64;
    var_8.goalradius = 32;
    var_8.ikweight = 1;
    var_9 = var_3 _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_9 ) )
        return;

    var_9.ignoretriggers = 1;
    var_9.ignoreforfixednodesafecheck = getdvarint( "use_old_meleestruggle" ) == 0;
    var_9.goalradius = 32;
    var_9.helmet = 1;
    var_9 _meth_81a7( 1 );
    var_9.dontavoidplayer = 1;
    var_9 setthreatbiasgroup( "melee_struggle_guy" );
    var_9 thread _id_06DF( var_8 );
    var_1 waittill( "trigger" );

    if ( level._id_8C36 != "melee" )
    {

    }

    common_scripts\utility::_id_383F( "melee_sequence_begins" );
    _id_A5A4::_id_1143( "melee_sequence" );
    var_8 _meth_81a9( var_7 );
    var_8._id_2D3A = 1;
    var_8.goalradius = 4;
    var_6 waittill( "trigger", var_10 );

    if ( getdvarint( "use_old_meleestruggle" ) == 1 )
    {
        if ( var_10 == var_8 && !common_scripts\utility::_id_382E( "player_interupts_melee_struggle" ) )
        {
            var_8.ikweight = 0;
            melee_sequence_plays_out( var_8, var_9 );

            if ( isdefined( var_8 ) )
            {
                var_8 _meth_854d( level._id_78BA["paulsen"]["melee"] );
                var_8 playsound( "bog_scn_melee_struggle_end" );
            }

            if ( isalive( var_9 ) && !var_9 _meth_81c2( level.playercardbackground ) )
                var_9 kill();
        }
        else if ( isalive( var_8 ) )
            var_8._id_2D3A = 0;
    }
    else
    {
        var_8.ikweight = 0;
        melee_sequence_plays_out( var_8, var_9 );

        if ( isdefined( var_8 ) )
        {
            var_8 _meth_854d( level._id_78BA["paulsen"]["melee"] );
            var_8 playsound( "bog_scn_melee_struggle_end" );
        }

        if ( isalive( var_8 ) )
            var_8._id_2D3A = 0;

        if ( isalive( var_9 ) )
            var_9.ignoreforfixednodesafecheck = 0;
    }

    if ( isalive( var_9 ) )
    {
        var_9._id_2652 = undefined;
        var_9.ignoretriggers = 0;
        var_9 _meth_8143();
    }

    if ( isalive( var_8 ) )
    {
        level.saved_friendly = var_8;
        level.saved_friendly thread _id_A5A4::_id_58D7();
        var_8 setthreatbiasgroup( "friendlies_under_unreachable_enemies" );
        var_8 _id_A5A4::_id_7E0B();
        var_8 _id_A5A4::_id_7E38( "p" );
        var_8.a._id_612E = 0;
        var_8.ignoreforfixednodesafecheck = 0;
        var_8.ikweight = 0;
        var_8.index = 1;
    }
    else
        _id_A5A4::_id_4E8A( "b", "p" );

    common_scripts\utility::_id_383F( "melee_sequence_complete" );
}

_id_06DF( var_0 )
{
    self waittill( "death", var_1 );

    if ( !isalive( var_0 ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( !isplayer( var_1 ) )
        return;

    _id_A5A4::_id_41DD( "RESCUE_ROYCEWICZ" );
}

melee_sequence_plays_out( var_0, var_1 )
{
    level endon( "stop_melee_sequence" );

    if ( !isalive( var_0 ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    var_0 endon( "death" );
    var_1 endon( "death" );
    var_0._id_0C72 = "paulsen";
    var_1._id_0C72 = "emslie";
    var_1._id_2652 = var_1 _id_A5A4::_id_3EF5( "death" );
    var_2 = [];
    var_2[0] = var_0;
    var_2[1] = var_1;
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3.origin = ( 9705, 1207, 112 );
    var_3.angles = ( 0, 294, 0 );
    var_0.allowdeath = 1;
    var_1.allowdeath = 1;
    var_0.end_melee_animation = "stand_death";
    var_0 thread saved_from_melee( var_1 );
    var_0.helmet = 1;
    var_0 thread _id_A510::_id_0C24( var_0, "gah" );
    var_3 _id_A510::_id_0C18( var_2, "melee" );
}

paulsen_end_standdeath( var_0 )
{
    var_0.end_melee_animation = undefined;
}

paulsen_start_backdeath1( var_0 )
{
    var_0.end_melee_animation = "back_death1";
    var_0.a._id_612E = 1;
    var_0 notify( "new_end_melee_animation" );
}

paulsen_start_backdeath2( var_0 )
{
    var_0.end_melee_animation = "back_death2";
    var_0.a._id_612E = 1;
    var_0 notify( "new_end_melee_animation" );
}

paulsen_end_fire( var_0 )
{
    var_0.a._id_55D7 = gettime();
    var_0 thread _id_A5A4::_id_69C5( "scn_melee_custom_m4carbine_fire", "tag_flash" );
    playfxontag( common_scripts\utility::_id_3FA8( "special_fire" ), var_0, "tag_flash" );
    var_1 = var_0 gettagangles( "tag_flash" );
    var_2 = anglestoforward( var_1 );
    var_3 = _id_A5A4::vector_multiply( var_2, 5000 );
    var_4 = var_0 gettagorigin( "tag_flash" );
    var_5 = var_4 + var_3;
    var_6 = bullettrace( var_4, var_5, 0, undefined );
    playfx( common_scripts\utility::_id_3FA8( "flesh_hit" ), var_6["position"], ( 0, 0, 1 ) );
    thread common_scripts\utility::_id_69C2( "bullet_large_flesh", var_6["position"] );
    var_7 = var_6["position"];
    var_2 = anglestoforward( ( 0, self.angles[1], 0 ) );
    var_3 = _id_A5A4::vector_multiply( var_2, -5 );
    var_7 += var_3;
    var_6 = bullettrace( var_7 + ( 0, 0, 5 ), var_7 + ( 0, 0, -50 ), 0, undefined );
    playfx( common_scripts\utility::_id_3FA8( "blood_pool" ), var_6["position"], ( 0, 0, 1 ) );
}

orient_to_guy( var_0 )
{
    self endon( "stop_orienting" );
    var_1 = var_0.origin;

    for (;;)
    {
        if ( isdefined( var_0 ) && isdefined( var_0.origin ) )
            var_1 = var_0.origin;

        var_2 = vectortoangles( var_1 - self.origin );
        var_3 = var_2[1] - 20;
        self _meth_8193( "face angle", var_3 );
        wait 0.05;
    }
}

saved_from_melee( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    var_1 = var_0.origin;

    if ( !isdefined( self.end_melee_animation ) )
        self waittill( "new_end_melee_animation" );

    if ( self.end_melee_animation == "stand_death" )
    {
        thread _id_A510::_id_0BB5( self, "gravity", self.end_melee_animation );
        thread orient_to_guy( var_0 );
    }
    else
        thread _id_A510::_id_0C24( self, self.end_melee_animation );

    common_scripts\utility::_id_A087( self.end_melee_animation, "damage" );
    self notify( "stop_orienting" );
    self._id_2D3A = 0;
}

threatbias_lower_trigger()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isdefined( var_0.normal_threatbias ) )
            var_0.normal_threatbias = var_0.threatsightdelayfalloff;
        else if ( var_0.normal_threatbias != var_0.threatsightdelayfalloff )
            continue;

        var_0.threatsightdelayfalloff -= 1500;
        wait 2;
    }
}

threatbias_normal_trigger()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isdefined( var_0.normal_threatbias ) )
            continue;

        var_0.threatsightdelayfalloff = var_0.normal_threatbias;
        wait 2;
    }
}

spawn_guy_from_targetname( var_0 )
{
    var_1 = spawn_guys_from_targetname( var_0 );
    return var_1[0];
}

spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 _id_A5A4::_id_88C3();
        _id_A5A4::_id_88F1( var_5 );
        var_1[var_1.size] = var_5;
    }

    return var_1;
}

force_spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 stalingradspawn();
        _id_A5A4::_id_88F1( var_5 );
        var_1[var_1.size] = var_5;
    }

    return var_1;
}

vis_blocker_waits_for_deletion()
{
    var_0 = getent( "vis_blocker_delete_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "vis_blocking_brush", "targetname" );
    var_1 delete();
}

enable_pacifists_to_attack_me()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            continue;

        var_0 setthreatbiasgroup( "friendlies_under_unreachable_enemies" );
    }
}

ignores_unreachable_enemies()
{
    self setthreatbiasgroup( "friendlies_flanking_apartment" );
    self.index = 1;
}

set_threatbias_group( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

wait_until_its_time_to_flank()
{
    var_0 = getent( "moveup_trigger", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" );
    var_1 _id_A5A4::_id_9FC8( 10 );
}

waittill_triggered_by_ai( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            continue;

        if ( !isdefined( var_0 ) )
            return;

        if ( var_1.classname == "worldspawn" )
            continue;

        if ( var_0 == var_1.team )
            return;
    }
}

tally_pacifists()
{
    waitframe;
    var_0 = getaiarray();
    var_1["axis"] = 0;
    var_1["allies"] = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3.pantssize )
            var_1[var_3.team]++;
    }
}

put_function_on_spawners( var_0, var_1 )
{
    common_scripts\utility::_id_0D13( var_0, ::spawner_runs_function_on_spawn, var_1 );
}

spawner_runs_function_on_spawn( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_1 );

        if ( _id_A5A4::_id_88F1( var_1 ) )
            continue;

        var_1 [[ var_0 ]]();
    }
}

alley_roof_guy()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "player_enters_roof" );
    var_0 = getnodearray( "roof_node", "targetname" );
    var_0 = common_scripts\utility::_id_0CF5( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.roof_occupied ) )
            continue;

        var_2.roof_occupied = 1;
        self _meth_81a9( var_2 );
        self.goalradius = 64;
        return;
    }
}

alley_smg_playerseeker()
{
    self setthreatbiasgroup( "player_seeker" );
    self _meth_8170( randomintrange( 100, 225 ), 0 );
    var_0 = randomintrange( 300, 400 );
    self _meth_8171( var_0, var_0 + 200 );
    self.pathlookaheaddist = 185;
    self.pathrandompercent = 185;
}

alley_sniper_engagementdistance()
{
    self _meth_8170( 450, 450 );
    self _meth_8171( 1500, 2500 );
}

alley_smg_engagementdistance()
{
    self _meth_8170( 350, 0 );
    self _meth_8171( 450, 550 );
}

alley_close_smg_engagementdistance()
{
    self _meth_8170( 0, 0 );
    self _meth_8171( 200, 300 );
}

toggle_alley_badplace()
{
    var_0 = getent( "friendly_badplace_arc", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" );
    var_2 = var_0.origin;
    var_3 = var_2 - var_1.origin;
    var_0 delete();
    var_1 delete();

    for (;;)
    {
        common_scripts\utility::_id_384A( "player_near_alley_building" );
        badplace_arc( "alley_badplace", 0, var_2, 0, 64, var_3, 5, 5, "allies" );
        common_scripts\utility::_id_3857( "player_near_alley_building" );
        badplace_delete( "alley_badplace" );
    }
}

ambush_clear()
{
    common_scripts\utility::_id_383F( "friendlies_take_fire" );
    common_scripts\utility::_id_383F( "respawn_friendlies" );
    var_0 = getentarray( "pacifist_rubble_guys", "targetname" );
    _id_A5A4::_id_0CE5( var_0 );
}

start_bog()
{
    _id_A5E8::_id_870C( "start_bog_checkpoint" );
    ambush_clear();
    _id_A5A4::_id_1ECF();
    _id_A5A4::_id_7EA2( "r", "y" );
    level._id_7474 = getent( "auto2840", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( ( 6782.4, 336.4, 66 ) );
    _id_A5A4::_id_88F1( level._id_6F7C );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    var_0 = getaiarray( "allies" );
    var_0 = common_scripts\utility::_id_0CF6( var_0, level._id_6F7C );
    _id_A5A4::_id_0CE5( var_0 );
    var_1 = force_spawn_guys_from_targetname( "bog_friendly_start" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7402 );
    level.playercardbackground setplayerangles( ( 0, 241, 0 ) );
    level.playercardbackground setorigin( ( 6872.2, 547.4, 93 ) );
    bog_is_under_attack();
}

bog_fight_until_flag()
{
    thread _id_A5A4::_id_58D7();
    common_scripts\utility::_id_384A( "entered_bog" );
    _id_A5A4::_id_8EA4();
}

bog_is_under_attack()
{
    var_0 = getentarray( "initial_bog_fighters", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::bog_fight_until_flag );
}

start_alley()
{
    _id_A5E8::_id_870C( "start_alley_checkpoint" );
    ambush_clear();
    level._id_7474 = getent( "alley_respawn", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( ( 9695.2, 372.3, 76 ) );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C _id_A5A4::_id_7E38( "c" );
    level._id_6F7C _id_A5A4::_id_5926();
    var_0 = getaiarray( "allies" );
    var_0 = _id_A5A4::_id_735E( var_0 );
    _id_A5A4::_id_0CE5( var_0 );
    var_1 = force_spawn_guys_from_targetname( "alley_friendly_spawners" );
    var_1 = _id_A5A4::_id_7339( var_1, "g" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7402 );
    level.playercardbackground setplayerangles( ( 0, 255, 0 ) );
    level.playercardbackground setorigin( ( 9838.94, 960.646, 76 ) );
    thread maps\bog_a::open_laundrymat();
    common_scripts\utility::_id_383F( "alley_enemies_spawn" );
}

start_javelin()
{
    ambush_clear();
    _id_A5A4::_id_1ECF();
    _id_A5A4::_id_7EA2( "r", "y" );
    level._id_7474 = getent( "alley_respawn", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( ( 8812.1, -557.4, 212 ) );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    getent( "playerseeker_spawn_trigger", "script_noteworthy" ) delete();
    level.playercardbackground setplayerangles( ( 0, 255, 0 ) );
    level.playercardbackground setorigin( ( 8636.5, -578.8, 190.9 ) );
    var_0 = getaiarray( "allies" );
    var_0 = common_scripts\utility::_id_0CF6( var_0, level._id_6F7C );
    _id_A5A4::_id_0CE5( var_0 );
    var_1 = force_spawn_guys_from_targetname( "start_alley_spawn" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7402 );
    _id_A5A4::_id_7016( "y", "r" );
    maps\bog_a::defend_the_roof_with_javelin();
}

announce_backblast()
{
    level endon( "bmps_are_dead" );
    common_scripts\utility::_id_382F( "bmps_are_dead" );

    for (;;)
    {
        while ( !player_fires_javelin() )
            wait 0.05;

        wait 1.5;
        level.javelin_helper thread _id_A510::_id_0C21( level.javelin_helper, "backblast_clear" );
    }
}

set_flag_when_bmps_are_dead()
{
    var_0 = spawnstruct();
    var_0.count = 0;
    level.bmps_killed_by_player = 0;

    for ( var_1 = 1; var_1 <= 4; var_1++ )
        thread bridge_bmp_rolls_in( "bridge_bmp" + var_1, var_0 );

    var_0 waittill( "bmps_are_dead" );
    common_scripts\utility::_id_383F( "bmps_are_dead" );
}

bmps_target_stuff_until_they_flee()
{
    level endon( "overpass_baddies_flee" );
    common_scripts\utility::_id_382F( "overpass_baddies_flee" );

    for (;;)
    {
        var_0 = getentarray( "new_bmp_target", "targetname" );
        var_1 = common_scripts\utility::_id_710E( var_0 );
        self setturrettargetent( var_1 );
        wait(randomfloatrange( 2, 3 ));
        self fireweapon();
        wait(randomfloatrange( 3, 5 ));
    }
}

bmp_drives_for_awhile()
{
    self endon( "death" );
    drives();
    _id_A5A8::vehicle_flag_arrived( "bmp_in_position" );
    self vehicle_setspeed( 0, 925 );

    if ( !common_scripts\utility::_id_382E( "overpass_baddies_flee" ) )
        bmps_target_stuff_until_they_flee();

    common_scripts\utility::_id_384A( "overpass_baddies_flee" );
    self vehicle_setspeed( 15, 2 );
}

bridge_bmp_is_shot_at()
{
    self endon( "death" );

    for (;;)
    {
        if ( !isalive( self ) )
            break;

        var_0 = self.helmet;
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_2.classname ) && !isplayer( var_2 ) )
        {
            self.helmet = var_0;
            continue;
        }

        if ( var_5 != "MOD_PROJECTILE" )
            continue;

        if ( var_1 < 800 )
            continue;

        level.bmps_killed_by_player++;
        _id_A5A4::arcademode_kill( self.origin, "explosive", 500 );
        level.javelin_helper _id_A5A4::_id_27EF( 1, _id_A510::_id_0C21, level.javelin_helper, "hit_target_" + level.bmps_killed_by_player );
        _id_A5A8::_id_4258();
        radiusdamage( self.origin, 150, self.helmet + 500, self.helmet + 500 );
    }
}

bridge_bmp_rolls_in( var_0, var_1 )
{
    var_1.count++;
    var_2 = _id_A5A8::_id_8978( var_0 );
    var_3 = ( 0, 0, 60 );
    target_set( var_2, var_3 );
    target_setattackmode( var_2, "top" );
    target_setjavelinonly( var_2, 1 );
    var_2.helmet = 20000;
    var_2 _id_A5A8::_id_4259();
    var_2 thread bmp_drives_for_awhile();
    var_2 bridge_bmp_is_shot_at();
    common_scripts\utility::_id_383F( "bmp_got_killed" );
    var_1.count--;

    if ( var_1.count <= 2 )
    {
        common_scripts\utility::_id_383F( "overpass_baddies_flee" );
        var_1 notify( "bmps_are_dead" );
    }

    if ( var_1.count <= 0 )
    {
        if ( level.bmps_killed_by_player == 4 )
            _id_A5A4::_id_41DD( "FEEL_THE_HEAT" );

        common_scripts\utility::_id_383F( "all_bmps_dead" );
    }

    if ( isdefined( var_2 ) )
        target_remove( var_2 );
}

wait_until_alley_is_clear_of_enemies()
{
    var_0 = getent( "alley_enemy_volume", "targetname" );

    for (;;)
    {
        var_1 = getaiarray( "axis" );
        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = var_1[var_3];

            if ( var_0 istouching( var_4 ) )
                var_2[var_2.size] = var_4;
        }

        if ( !var_2.size )
            break;

        var_5 = spawnstruct();
        common_scripts\utility::_id_0D13( var_2, ::toucher_dies, var_5 );
        ent_waits_for_death_or_timeout( var_5, 5 );
    }
}

ent_waits_for_death_or_timeout( var_0, var_1 )
{
    var_0 endon( "toucher_died" );
    wait(var_1);
    var_0 waittill( "toucher_died" );
}

toucher_dies( var_0 )
{
    self waittill( "death" );
    var_0 notify( "toucher_died" );
}

set_all_ai_ignoreme( var_0 )
{
    var_1 = getaiarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2].ignoretriggers = var_0;
}

wait_until_mortars_are_dead()
{
    var_0 = spawnstruct();
    var_0.count = 0;
    var_1 = getentarray( "mortar_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::mortar_trigger, var_0 );
    var_0 waittill( "mortars_complete" );
    objective_state( 5, "done" );
}

mortar_trigger( var_0 )
{
    var_0.count++;
    self waittill( "trigger" );
    self.count = 0;
    var_1 = getentarray( self._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::mortar_guys, self );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    self waittill( "mortar_guys_are_dead" );
    var_0.count--;

    if ( !var_0.count )
        var_0 notify( "mortars_complete" );
}

mortar_guys( var_0 )
{
    var_0.count++;
    self _meth_81aa( self.origin );
    self.goalradius = 64;
    self waittill( "death" );
    var_0.count--;

    if ( !var_0.count )
        var_0 notify( "mortar_guys_are_dead" );
}

wait_until_its_time_to_breach_the_third_floor_room( var_0 )
{
    while ( distance( var_0.origin, level.playercardbackground.origin ) > 250 )
    {
        wait 0.05;

        if ( level.playercardbackground.origin[2] < var_0.origin[2] - 32 )
            return 0;
    }

    return 1;
}

verify_that_allies_are_undeletable()
{

}

assign_the_two_closest_friendlies_to_the_player()
{
    for ( var_0 = 0; var_0 < 2; var_0++ )
        _id_A5A4::_id_7016( "y", "r" );
}

magic_laser_light_show()
{
    var_0 = getentarray( "magic_laser", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::magic_laser_lights );
}

magic_laser_lights()
{
    var_0 = getentarray( self._not_team, "targetname" );
    var_1 = var_0.size - 3;
    var_2 = getent( self._id_7A26, "script_linkname" );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = spawn( "script_model", ( 0, 0, 0 ) );
        var_4.origin = self.origin;
        var_4 setmodel( "tag_laser" );
        var_4 thread laser_targets_points( var_0, "lasers_shift_fire", var_2.origin, 0.75, 1.25 );
    }

    var_2 delete();
    self delete();
}

street_laser_light_show()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "player_nears_first_building" );
        common_scripts\utility::_id_3831( "stop_street_lasers" );
        var_0 = getentarray( "street_laser", "targetname" );
        common_scripts\utility::_id_0D13( var_0, ::street_laser_lights );
        common_scripts\utility::_id_3857( "player_nears_first_building" );
        common_scripts\utility::_id_383F( "stop_street_lasers" );
    }
}

street_laser_lights()
{
    var_0 = getentarray( self._not_team, "targetname" );
    var_1 = 4;

    if ( var_1 > var_0.size )
        var_1 = var_0.size;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = spawn( "script_model", ( 0, 0, 0 ) );
        var_3.origin = self.origin;
        var_3 setmodel( "tag_laser" );
        var_3 thread laser_targets_points( var_0, "stop_street_lasers", undefined, 0.15, 0.9 );
    }
}

laser_targets_points( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawn( "script_origin", ( 0, 0, 0 ) );
    thread draw_laser_line( var_5 );
    var_6 = undefined;
    var_7 = 0;

    for ( var_8 = -1; !common_scripts\utility::_id_382E( var_1 ); var_6._id_9BF4 = undefined )
    {
        var_9 = randomint( var_0.size );

        for (;;)
        {
            var_6 = var_0[var_9];

            if ( var_9 != var_8 && !isdefined( var_6._id_9BF4 ) )
            {
                var_8 = var_9;
                break;
            }

            var_9++;

            if ( var_9 >= var_0.size )
                var_9 = 0;
        }

        if ( !var_7 )
        {
            var_5.origin = var_6.origin;
            var_7 = 1;
        }
        else
        {
            var_10 = distance( var_5.origin, var_6.origin ) * 0.015;
            var_10 *= randomfloatrange( var_3, var_4 );
            var_5 moveto( var_6.origin, var_10, var_10 * 0.3, var_10 * 0.3 );
            laser_waits( var_1, var_10 );
        }

        var_5 thread laser_jitters();
        laser_waits( var_1, randomfloatrange( 1, 5 ) );
        var_5 notify( "stop_jitter" );
    }

    var_5 thread laser_jitters();
    _id_A5A4::waitspread( 2 );
    var_5 notify( "stop_jitter" );

    if ( isdefined( var_2 ) )
    {
        var_2 += common_scripts\utility::_id_712D( 25 );
        var_2 = ( var_2[0], var_2[1], var_5.origin[2] );
        var_10 = distance( var_5.origin, var_2 ) * 0.002;
        var_10 *= randomfloatrange( var_3, var_4 );
        var_5 moveto( var_2, var_10, var_10 * 0.3, var_10 * 0.3 );
        wait(var_10);
    }
    else
        wait(randomfloat( 0.1 ));

    self notify( "stop_line" );
    self laseroff();
    var_5 delete();
    self delete();
}

laser_waits( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    level endon( var_0 );
    wait(var_1);
}

laser_jitters()
{
    self endon( "stop_jitter" );
    var_0 = self.origin;

    for (;;)
    {
        var_1 = var_0 + common_scripts\utility::_id_712D( 3 );
        var_2 = randomfloatrange( 0.05, 0.2 );
        self moveto( var_1, var_2 );
        wait(var_2);
    }
}

modulate_laser()
{
    self.dolaser = 0;
    self endon( "stop_line" );

    for (;;)
    {
        level.playercardbackground _id_A5A4::_id_32E0( "nightvision_on" );
        self.dolaser = 1;
        self laseron();
        level.playercardbackground _id_A5A4::_id_32E4( "nightvision_on" );
        self.dolaser = 0;
        self laseroff();
    }
}

get_laser()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0.origin = self.origin;
    var_0 setmodel( "tag_laser" );
    return var_0;
}

draw_laser_line( var_0 )
{
    self endon( "stop_line" );
    thread modulate_laser();
    wait 0.05;
    self.angles = vectortoangles( var_0.origin - self.origin );
    wait 0.05;

    for (;;)
    {
        self rotateto( vectortoangles( var_0.origin - self.origin ), 0.1 );

        if ( self.dolaser )
        {

        }

        wait 0.1;
    }
}

enemies_respond_to_attack( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_3831( var_2 );
    var_3 = getentarray( var_0, "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, ::attack_player_when_attacked, var_2 );
    setignoremegroup( "player", var_1 );
    common_scripts\utility::_id_384A( var_2 );
    setthreatbias( "player", var_1, 50000 );
}

upstairs_enemies_respond_to_attack()
{
    enemies_respond_to_attack( "upper_floor_enemies", "upstairs_unreachable_enemies", "unreachable_enemies_under_attack" );

    if ( common_scripts\utility::_id_382E( "lasers_have_moved" ) )
    {
        setthreatbias( "player", "upstairs_unreachable_enemies", 0 );
        setthreatbias( "friendlies_under_unreachable_enemies", "upstairs_unreachable_enemies", 0 );
    }
}

window_enemies_respond_to_attack()
{
    enemies_respond_to_attack( "window_enemies", "upstairs_window_enemies", "window_enemies_under_attack" );
}

second_floor_laser_light_show()
{
    common_scripts\utility::_id_384A( "magic_lasers_turn_on" );
    thread magic_laser_light_show();
    wait_until_its_time_to_move_lasers();
    common_scripts\utility::_id_383F( "lasers_shift_fire" );
    wait 2;
    common_scripts\utility::_id_383F( "lasers_have_moved" );
}

attack_player_when_attacked( var_0 )
{
    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    if ( isspawner( self ) )
    {
        _id_A5A4::_id_0798( ::attack_player_when_attacked, var_0 );
        return;
    }

    level endon( var_0 );
    self waittill( "death", var_1 );

    if ( !isdefined( self ) )
        return;

    if ( isplayer( var_1 ) )
        common_scripts\utility::_id_383F( var_0 );
}

wait_until_its_time_to_move_lasers()
{
    level endon( "magic_lasers_turn_off" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "watch_your_fire" );
    _id_A5A4::_id_70BD( "shifting_fire" );
}

set_talker()
{
    for (;;)
    {
        self.info_player_start++;

        if ( self.info_player_start >= self._id_44CE.size )
            self.info_player_start = 0;

        if ( isalive( self._id_44CE[self.info_player_start] ) )
        {
            self._id_9133 = self._id_44CE[self.info_player_start];
            return;
        }
    }
}

wait_until_player_goes_into_second_floor_or_melee_sequence_completes()
{
    level endon( "melee_sequence_complete" );
    _id_A5A4::_id_9FC0( "hint_guy_trigger" );
}

wait_then_go()
{
    self _meth_81aa( self.origin );
    self.goalheight = 64;
    self.goalradius = 32;
    wait 0.5;
    var_0 = getnode( self._not_team, "targetname" );
    self _meth_81a9( var_0 );
}

die_shortly()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    _id_A5A4::waitspread( 0, 8 );
    self kill( ( 0, 0, 0 ) );
}

wait_while_enemies_are_alive_near_player()
{
    for (;;)
    {
        var_0 = 0;
        var_1 = getaiarray( "axis" );

        if ( !var_1.size )
            return;

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( distance( var_3.origin, level.playercardbackground.origin ) < 240 )
            {
                var_0 = 1;
                break;
            }
        }

        if ( !var_0 )
            return;

        wait 0.05;
    }
}

aim_at_target()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        if ( isdefined( self.enemy ) )
        {
            if ( var_0 )
            {
                self _meth_816a();
                var_0 = 0;
            }

            wait 1;
            continue;
        }

        var_0 = 1;
        self _meth_816b( common_scripts\utility::_id_710E( level.aim_targets ) );
        wait(randomfloatrange( 1, 4.5 ));
    }
}

clear_player_threatbias_vs_apartment_enemies()
{
    setthreatbias( "player", "upstairs_unreachable_enemies", 0 );
    setthreatbias( "player", "upstairs_window_enemies", 0 );
}

stick_me_to_my_spot()
{
    self.melee_fired = 0;
    self _meth_81aa( self.origin );
    self.goalradius = 16;
}

ignore_suppression_until_ambush()
{
    self endon( "death" );
    self.index = 1;
    self.pantssize = 1;
    common_scripts\utility::_id_384A( "friendlies_take_fire" );
    self.pantssize = 0;
    self.index = 0;
}

increase_goal_radius_when_friendlies_flank()
{
    self endon( "death" );
    self.goalheight = 60;
    self.goalradius = 128;
    common_scripts\utility::_id_384A( "pacifist_guys_move_up" );
    self.goalradius = 3050;
    self _meth_8170( randomintrange( 0, 125 ), 0 );
    var_0 = randomintrange( 250, 350 );
    self _meth_8171( var_0, var_0 + 100 );
    self setthreatbiasgroup( "pacifist_lower_level_enemies" );
    self.index = 1;
}

debug_player_damage()
{
    for (;;)
    {
        level.playercardbackground waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
        level.hitenemy = var_1;
        var_8 = 5;
    }
}

initial_friendly_setup()
{
    _id_A5A4::_id_88F1( self );
    self._id_0C72 = "generic";
    self._id_5F65 = 1;
    self.goalradius = 16;
    self _meth_81aa( self.origin );
    self.pantssize = 1;
}

bridge_friendly_spawns()
{
    self endon( "death" );

    if ( !isdefined( self._id_79E6 ) )
        _id_A5A4::_id_7E38( "y" );

    set_engagement_to_closer();
    self.index = 1;
    self.ikweight = 1;
    self.pantssize = 1;
    common_scripts\utility::_id_384A( "friendlies_move_up_the_bridge" );
    self.pantssize = 0;
}

small_pathenemy()
{
    self.pathlookaheaddist = 50;
    self.pathrandompercent = 50;
}

magic_rpgs_fire()
{
    var_0 = getentarray( self._not_team, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        magicbullet( "rpg_straight", self.origin, var_0[var_1].origin );
        wait(randomfloatrange( 1.5, 5 ));
    }
}

magic_rpg_fires( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 magic_rpgs_fire();
}

_id_2819()
{
    self delete();
}

set_engagement_to_closer()
{
    self _meth_8170( 0, 0 );
    self _meth_8171( 1000, 3000 );
}

set_min_engagement_distance( var_0, var_1 )
{
    self _meth_8170( var_0, var_1 );
}

set_max_engagement_distance( var_0, var_1 )
{
    self _meth_8171( var_0, var_1 );
}

incoming_rpg()
{
    magic_rpg_fires( "magic_rpg1" );
    wait 2.5;
    magic_rpg_fires( "magic_rpg2" );
}

ambushed_guys_die()
{
    wait 1.5;
    var_0 = getentarray( "ambushed_guy", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::killme );
}

killme()
{
    self kill( ( 0, 0, 0 ) );
}

waitspread_death( var_0 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    _id_A5A4::waitspread( var_0 );
    killme();
}

slowdown()
{
    self endon( "death" );
    self.weapon_change = 5000;
    wait 0.4;
    self _meth_81aa( self.origin );
}

set_ignore_suppression( var_0 )
{
    self.index = var_0;
}

wait_until_price_triggers_or_player_reaches_bridge_end()
{
    level endon( "player_reaches_end_of_bridge" );

    if ( common_scripts\utility::_id_382E( "player_reaches_end_of_bridge" ) )
        return;

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 != level._id_6F7C )
            continue;

        break;
    }
}

promoted_cyan_guy_leads_player_to_apartment( var_0 )
{
    if ( self._id_79E6 != "c" )
        return;

    thread cyan_guys_lead_player_to_apartment();
}

wait_until_player_gets_close_or_enters_apartment()
{
    level endon( "friendlies_move_into_apartment" );

    while ( distance( self.origin, level.playercardbackground.origin ) > 128 )
    {
        if ( self _meth_81c2( level.playercardbackground ) )
        {
            var_0 = level.playercardbackground getplayerangles();
            var_1 = anglestoforward( var_0 );
            var_2 = vectornormalize( self.origin - level.playercardbackground.origin );
            var_3 = vectordot( var_1, var_2 );

            if ( var_3 > 0.8 )
                return;
        }

        wait 1;
    }
}

cyan_guys_lead_player_to_apartment()
{
    self endon( "death" );
    self endon( "damage_notdone" );
    wait_until_player_gets_close_or_enters_apartment();
    _id_A5A4::_id_7E38( "b" );

    if ( self == level._id_6F7C )
        thread price_signals_player_into_apartment();

    if ( !_id_A5A4::_id_5036() )
        thread _id_A5A4::_id_58D7();

    common_scripts\utility::_id_384A( "pit_guys_cleared" );
    self.ignoreforfixednodesafecheck = 1;
    common_scripts\utility::_id_384A( "friendlies_storm_second_floor" );
    self.ignoreforfixednodesafecheck = 0;
}

price_signals_player_into_apartment()
{
    if ( common_scripts\utility::_id_382E( "friendlies_storm_second_floor" ) )
        return;

    level endon( "friendlies_storm_second_floor" );
    var_0 = getnode( "price_underground_node", "targetname" );

    while ( !var_0 _id_A510::_id_0BFF( level._id_6F7C, "wait_approach" ) )
    {

    }

    var_0 _id_A510::_id_0C24( level._id_6F7C, "wait_approach" );
    thread price_waits_at_node_and_waves( var_0, "vas_stops_leading" );
    thread price_recovers_from_waving( var_0 );
}

price_recovers_from_waving( var_0 )
{
    common_scripts\utility::_id_384A( "friendlies_storm_second_floor" );
    level notify( "vas_stops_leading" );
    level common_scripts\utility::_id_383F( "vas_stops_leading" );
}

wait_for_player_to_disrupt_second_floor_or_leave()
{
    level endon( "player_leaves_second_floor" );
    common_scripts\utility::_id_384A( "player_disrupts_second_floor" );
}

manual_mg_fire()
{
    self endon( "stop_firing" );
    self.turret_fires = 1;

    for (;;)
    {
        var_0 = randomfloatrange( 0.2, 0.7 ) * 20;

        if ( self.turret_fires )
        {
            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self shootturret();
                wait 0.05;
            }
        }

        wait(randomfloat( 0.5 ));
    }
}

_id_9F91( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0 waittill( "death" );
}

scr_setmode( var_0 )
{
    self setmode( var_0 );
}

flank_guy()
{
    level.flank_guy = getent( "flank_guy", "targetname" );
    _id_A5A4::_id_88F1( level.flank_guy );
    level.flank_guy.goalradius = 8;
    level.flank_guy.pantssize = 1;
    level.flank_guy _meth_81ce( "crouch" );
    level.flank_guy thread _id_A5A4::_id_58D7();
    level.flank_guy.ignoretriggers = 1;
    level.flank_guy _id_A5A4::_id_5926();
    level.flank_guy.index = 1;
}

rooftop_guys_attack()
{
    self endon( "death" );
    _id_A5A4::waitspread( 5 );

    for ( var_0 = 0; var_0 < self.count; var_0++ )
    {
        var_1 = _id_A5A4::_id_88C3();

        if ( _id_A5A4::_id_88F1( var_1 ) )
            return;

        var_1 waittill( "death" );
    }
}

hint_guy_gets_the_players_attention()
{
    self.ignoretriggers = 1;
    self.index = 1;
    self endon( "death" );
    wait 2.5;
    _id_A581::_id_4241();
    wait 3;
    self.ignoretriggers = 0;
    self.goalradius = 2048;
}

upstairs_unreachable_enemies()
{
    _id_A5A4::_id_0798( ::ignore_suppression_until_ambush );
    _id_A5A4::_id_0798( ::small_pathenemy );
    _id_A5A4::_id_0798( ::set_threatbias_group, "upstairs_unreachable_enemies" );
}

upstairs_window_enemies()
{
    _id_A5A4::_id_0798( ::ignore_suppression_until_ambush );
    _id_A5A4::_id_0798( ::set_threatbias_group, "upstairs_window_enemies" );
}

teleport_purple_guys_closer()
{
    var_0 = _id_A5A4::_id_3D7A( "allies", "p" );
    var_1 = getentarray( "purple_teleport_org", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( isalive( level.saved_friendly ) && var_3 == level.saved_friendly )
            continue;

        if ( var_3.origin[2] + 37 > var_1[var_2].origin[2] )
            continue;

        var_3 _meth_81c9( var_1[var_2].origin );
    }
}

remove_corner_ai_blocker()
{
    var_0 = getent( "corner_ai_blocker", "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 connectpaths();
        var_0 delete();
    }
}

wait_until_price_nears_balcony()
{
    var_0 = getent( "price_gap_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level._id_6F7C )
            return;

        var_1 thread _id_A5A4::_id_4BAC();
    }
}

wait_until_player_nears_balcony()
{
    level.balcony_objective_org = ( 10216.3, 174.7, 239.5 );
    var_0 = ( level.balcony_objective_org[0], level.balcony_objective_org[1], 0 );

    while ( distance( var_0, ( level.playercardbackground.origin[0], level.playercardbackground.origin[1], 0 ) ) > 200 )
        wait 0.25;
}

price_congrates()
{
    self waittill( "death", var_0 );

    if ( isalive( var_0 ) && isplayer( var_0 ) )
    {
        wait 2.5;
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "good_job" );
    }
}

player_is_on_mg()
{
    var_0 = getent( "apartment_window_mg_1", "targetname" );
    var_1 = var_0 getturretowner();

    if ( !isalive( var_1 ) )
        return 0;

    return isplayer( var_1 );
}

debug_pain()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "pain", var_0, var_1, var_2, var_3, var_4, var_5 );
        var_6 = undefined;
    }
}

shoot_mg_targets()
{
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "player_enters_apartment_rubble_area", _id_A5A4::_id_7C82, "stop_firing" );
    thread stop_firing_when_shot();
    var_0 = getentarray( self._not_team, "targetname" );

    for (;;)
    {
        var_1 = common_scripts\utility::_id_710E( var_0 );
        self settargetentity( var_1 );
        wait(randomfloatrange( 1, 5 ));
    }
}

explosive_damage( var_0 )
{
    return issubstr( var_0, "GRENADE" );
}

stop_firing_when_shot()
{
    level endon( "player_enters_apartment_rubble_area" );
    var_0 = getent( self._id_7A26, "script_linkname" );
    var_1 = randomintrange( 2, 3 );

    for (;;)
    {
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !isplayer( var_3 ) )
            continue;

        if ( explosive_damage( var_6 ) )
        {
            self.turret_fires = 0;
            thread _id_A5A4::arcademode_kill( self.origin, var_6, 100 );
            return;
        }

        var_1--;

        if ( var_1 > 0 )
            continue;

        var_1 = randomintrange( 3, 4 );
        self.turret_fires = 0;
        wait(randomfloatrange( 7, 10 ));
        self.turret_fires = 1;
    }
}

price_waits_at_node_and_waves( var_0, var_1 )
{
    common_scripts\utility::_id_382F( var_1 );
    var_2 = 1;

    for (;;)
    {
        var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "wait_idle", undefined, "stop_idle" );
        wait(randomfloat( 0.1 ));
        var_0 notify( "stop_idle" );

        if ( var_2 )
            var_0 _id_A510::_id_0C24( level._id_6F7C, "wave1" );
        else
        {
            if ( common_scripts\utility::_id_382E( "friendlies_move_up_the_bridge" ) )
                objective_ring( 2 );

            var_0 _id_A510::_id_0C24( level._id_6F7C, "wave2" );
        }

        if ( level common_scripts\utility::_id_382E( var_1 ) )
        {
            level._id_6F7C _meth_8143();
            return;
        }

        var_2 = !var_2;
    }
}
#using_animtree("vehicles");

cobra_crash()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0._id_9D45 ) )
        {
            if ( var_0._id_9D45.teambalanced != "heli_crash" )
                continue;
        }

        _id_A5E8::_id_870C( "start_cobra_crash_sequence" );
        var_1 = spawn( "script_model", ( 0, 0, 0 ) );
        var_1.origin = var_0.origin;
        var_1.angles = var_0.angles;
        var_1 setmodel( var_0.motiontrackerenabled );
        var_1 useanimtree( #animtree );
        var_1 _meth_8140( "blah", var_1.origin, var_1.angles, %cobra_crash );
        var_0 delete();
        playfxontag( common_scripts\utility::_id_3FA8( "heli_aerial_explosion_large" ), var_1, "tag_body" );
        var_1 playsound( "helicopter_hit" );
        _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_058E, 0.4, 1.2, var_1.origin, 6000 );
        var_1 playloopsound( "helicopter_dying_loop" );
        var_1 thread _id_A5A4::_id_69C6( "helicopter_dying_layer" );
        var_1 thread tailfx();
        wait 2;
        playfxontag( common_scripts\utility::_id_3FA8( "heli_aerial_explosion" ), var_1, "tail_rotor_jnt" );
        var_1 playsound( "helicopter_hit" );
        wait 1;
        playfxontag( common_scripts\utility::_id_3FA8( "heli_aerial_explosion" ), var_1, "tag_deathfx" );
        var_1 playsound( "helicopter_hit" );
        wait 2;
        common_scripts\_exploder::_id_3528( 2 );
        thread floating_crash_heli();
        var_1 notify( "stop_tail_fx" );
        var_1 delete();
        wait 2;
        _id_A5E8::_id_870C( "stop_cobra_crash_sequence" );
        wait 3;
    }
}

floating_crash_heli()
{
    thread floating_object( "floating_crash_heli", 5, 3.5, 5, 0.2, 0.25 );
}

floating_object( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    level endon( "stop_all_floating_objects" );
    var_7 = getent( var_0, "script_noteworthy" );
    var_7 endon( "stop_floating" );

    if ( isdefined( var_6 ) )
        playfx( var_6, var_7.origin );

    for (;;)
    {
        var_1 *= -1;
        var_8 = randomfloatrange( var_2, var_3 );
        var_7 movez( var_1, var_8, var_4, var_5 );
        wait(var_8);
    }
}

tailfx()
{
    self endon( "stop_tail_fx" );
    var_0 = [];
    var_0[var_0.size] = "tail_rotor_jnt";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "smoke_trail_heli" ), var_4 );
        }

        wait 0.05;
    }
}

helis_ambient()
{
    thread helicopter_flies_by_overhead( "intro_heli", 5, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_helib", 5.85, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli2", 9, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli2b", 9.95, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli3", 14, 135, 95 );
    thread helicopter_flies_by_overhead( "intro_heli3b", 14.95, 135, 95 );
    common_scripts\utility::_id_384A( "armada_passes_by" );
    var_0 = [];
    var_0 = add_heli_set( "intro_heli", 95, 95 );
    var_0 = add_heli_set( "intro_heli2", 95, 95 );
    var_0 = add_heli_set( "intro_heli3", 135, 95 );
    var_0 = add_heli_set( "intro_heli4", 165, 95 );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_0CF5( var_0 );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];
            thread helicopter_flies_by_overhead( var_2["heli1"], 0, var_2["maxspeed"], var_2["accell"] );
            thread helicopter_flies_by_overhead( var_2["heli2"], 0.8, var_2["maxspeed"], var_2["accell"] );
            wait(randomfloatrange( 8, 12 ));
        }
    }
}

add_heli_set( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3["heli1"] = var_0;
    var_3["heli2"] = var_0 + "b";
    var_3["maxspeed"] = var_1;
    var_3["accell"] = var_2;
    return var_3;
}

die_soon( var_0 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    wait(var_0);
    self kill( ( 0, 0, 0 ) );
}

player_has_javelin()
{
    var_0 = level.playercardbackground getweaponslistprimaries();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( issubstr( var_0[var_1], "avelin" ) )
            return 1;
    }

    return 0;
}

player_using_javelin()
{
    return issubstr( level.playercardbackground getcurrentweapon(), "avelin" );
}

player_fires_javelin()
{
    return level.playercardbackground isfiring() && issubstr( level.playercardbackground getcurrentweapon(), "avelin" );
}

overpass_baddies_attack()
{
    level endon( "overpass_baddies_flee" );
    wait 5;
    var_0 = getentarray( "bridge_spawner", "targetname" );

    for (;;)
    {
        if ( getaiarray( "axis" ).size >= 18 )
        {
            wait 180;
            continue;
        }

        var_1 = common_scripts\utility::_id_710E( var_0 );
        var_1.count = 3;
        var_1 thread _id_A581::_id_38F3();
        wait 5;
    }
}

die_asap()
{
    self endon( "death" );

    while ( self _meth_81c2( level.playercardbackground ) )
        wait 0.2;

    self delete();
}

shanty_run()
{
    if ( isdefined( self._not_team ) )
    {
        var_0 = getent( self._not_team, "targetname" );
        var_0.trigger_num = self.trigger_num + 1;
        var_0 thread shanty_run();
    }

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        var_1.trigger_num = self.trigger_num;

        if ( isplayer( var_1 ) )
        {
            level notify( "new_player_trigger_num" );
            continue;
        }

        var_1 notify( "new_trigger_num" );
    }
}

waittill_new_trigger_num()
{
    self endon( "new_trigger_num" );
    level waittill( "new_player_trigger_num" );
}

shanty_allies_cqb_through()
{
    self endon( "death" );
    _id_A51C::assign_nodes_intelligently_for_squad( 1 );
    common_scripts\utility::_id_384A( "start_shanty_run" );
    _id_A51C::assign_nodes_intelligently_for_squad( 0 );
    var_0 = getentarray( "shanty_destination", "targetname" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    self.goalradius = 128;
    self.invisible = 0;
    _id_A5A4::_id_2A74();
    _id_A581::_id_4248( var_1 );
    self.invisible = 96;

    if ( self == level._id_6F7C )
    {
        var_2 = getent( "price_spawner", "targetname" );
        level._id_6F7C _id_A5A4::_id_7E38( var_2._id_79E6 );
    }
    else
    {
        if ( self == level.mark )
        {
            var_3 = getent( "mark_spawner", "targetname" );
            level.mark _id_A5A4::_id_7E38( var_3._id_79E6 );
            return;
        }

        if ( level.ending_bog_redshirts >= 2 )
        {
            var_4 = getent( "ally_charge_bog_org", "targetname" ).origin;
            self _meth_81aa( var_4 );

            if ( isdefined( self._id_58D7 ) )
                _id_A5A4::_id_8EA4();

            self.helmet = 1;
            return;
        }

        level.ending_bog_redshirts++;

        if ( level.ending_bog_redshirts == 1 )
        {
            _id_A5A4::_id_7E38( "r" );
            return;
        }

        _id_A5A4::_id_7E38( "b" );
    }
}

shanty_allies_cqb_end()
{
    self endon( "death" );
    var_0 = getent( "end_cqb_walk", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    wait(randomfloatrange( 0.5, 3.5 ));
    var_1 _id_A5A4::_id_2A8D();
    var_1._id_A154 = 0;
}

shanty_ai_think()
{
    _id_A5A4::_id_2A74();
    self.trigger_num = 0;
    self endon( "death" );
    self.invisible = 0;
    self endon( "reached_shanty_end" );

    if ( self != level._id_6F7C )
        self._id_0C72 = "generic";

    for (;;)
    {
        waittill_new_trigger_num();

        if ( level.playercardbackground.trigger_num - self.trigger_num >= 2 )
        {
            self._id_5F65 = 1.21;
            continue;
        }

        if ( level.playercardbackground.trigger_num - self.trigger_num == 1 )
        {
            self._id_5F65 = 1.1;
            continue;
        }

        if ( level.playercardbackground.trigger_num - self.trigger_num == 0 )
        {
            self._id_5F65 = 1.0;
            continue;
        }

        if ( level.playercardbackground.trigger_num - self.trigger_num == -1 )
        {
            self._id_5F65 = 1.0;
            continue;
        }

        if ( level.playercardbackground.trigger_num - self.trigger_num == -2 )
        {
            self._id_5F65 = 1.0;
            continue;
        }

        if ( level.playercardbackground.trigger_num - self.trigger_num <= -3 )
        {
            var_0 = ( gettime() - level.shanty_timer ) * 0.001;
            var_1 = var_0 + randomfloatrange( 2, 3 );
            level.shanty_timer = gettime();

            if ( var_1 > 0 )
                wait(var_1);

            if ( level.playercardbackground.trigger_num - self.trigger_num <= -3 )
                self _meth_81aa( self.origin );
        }
    }
}

shanty_ai_sprint()
{
    _id_A5A4::_id_2A74();
    self.trigger_num = 0;

    if ( self != level._id_6F7C )
        self._id_0C72 = "generic";

    _id_A5A4::_id_7EAB( "sprint" );
}

showplaybackrate()
{
    self endon( "death" );

    for (;;)
        wait 0.05;
}

magic_rpgs_fire_randomly()
{
    _id_A5A4::waitspread( 1, 6 );
    magic_rpgs_fire();
}

magic_rpg_trigger()
{
    level endon( "stop_shanty_rockets" );
    self waittill( "trigger" );
    var_0 = getentarray( self._not_team, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] magic_rpgs_fire();
        wait(randomfloatrange( 1.5, 5 ));
    }
}

bog_ambient_fighting()
{
    self endon( "death" );
    thread _id_A5A4::_id_58D7();
    self.goalradius = 1450;
    common_scripts\utility::_id_384A( "kill_bog_ambient_fighting" );
    _id_A5A4::_id_8EA4();
    self delete();
}

take_cover_against_overpass()
{
    if ( isdefined( self.fence_guy ) )
        return;

    self endon( "death" );
    _id_A5A4::_id_2A74();
    self _meth_81aa( self.origin );
    _id_A5A4::waitspread( 2 );
    self.fixednode = 0;
    self.goalradius = 2048;
}

alley_balcony_guy()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "price_in_alley_position" );
    magicbullet( "rpg_straight", self.origin + ( 0, 0, 10 ), self.origin );
}

lose_goal_volume()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0 thread _id_A5A4::_id_4BAC();
        var_0.dont_use_goal_volume = 1;
    }
}

wait_until_javelin_guy_died_or_must_die()
{
    if ( !isalive( self ) )
        return;

    self waittill( "death" );
}

die_after_spawn( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self kill( ( 0, 0, 0 ) );
}

wait_until_price_reaches_his_trigger()
{
    var_0 = getent( "price_alley_trig", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 != level._id_6F7C )
            continue;

        return;
    }
}

wait_for_friendlies_to_reach_alley_goal()
{
    var_0 = gettime() + 15000;

    for (;;)
    {
        if ( check_allies_in_position() )
            return;

        if ( gettime() > var_0 )
            return;

        wait 0.1;
    }
}

check_allies_in_position()
{
    var_0 = _id_A5A4::_id_3D7A( "allies", "y" );
    var_1 = _id_A5A4::_id_3D7A( "allies", "o" );
    var_2 = common_scripts\utility::_id_0CDD( var_0, var_1 );
    var_3 = var_2.size - 2;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2[var_4];

        if ( !isdefined( var_5.goalpos ) )
            continue;

        if ( distance( var_5.origin, var_5.goalpos ) > 60 )
            continue;

        var_3--;

        if ( var_3 <= 0 )
            return 1;
    }

    return 0;
}

shanty_fence_cut_setup()
{
    var_0 = _id_A5A4::_id_88D1( "fence" );
    var_1 = getent( "shanty_fence_org", "targetname" );
    var_1 thread _id_A510::_id_0BC7( var_0, "fence_cut" );
    level.shanty_fence = var_0;
}

shanty_fence_cut()
{
    var_0 = level.shanty_fence;
    var_1 = getent( "shanty_fence_org", "targetname" );
    var_2 = getent( "shanty_fence_clip", "targetname" );
    var_2 connectpaths();
    var_0._id_0C72 = "fence";
    var_0 _id_A5A4::_id_0D61();
    var_3 = level.fence_guys[0];
    var_4 = level.fence_guys[1];
    var_3._id_0C72 = "fence_guy1";
    var_4._id_0C72 = "fence_guy2";
    var_5 = [];
    var_5[var_5.size] = var_3;
    var_5[var_5.size] = var_4;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        var_1 _id_A510::_id_0BF8( var_5, "fence_cut" );
    else
        var_1 _id_A510::_id_0BF2( var_5, "fence_cut" );

    common_scripts\utility::_id_0D13( var_5, ::set_allowpain, 0 );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_7F71, 1 );
    var_1 thread _id_A510::_id_0C24( var_0, "fence_cut" );

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        var_2 _id_A5A4::_id_27EF( 12.45, _id_A5A4::_id_7C71 );
        _id_A5A4::_id_27EF( 12.45, _id_A5A4::_id_070A, "shanty_after_fence" );
    }

    var_3 _meth_81a7( 1 );

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        var_1 thread _id_A510::_id_0BB1( var_5, "gravity", "fence_cut" );
    else
        var_1 thread _id_A510::_id_0C18( var_5, "fence_cut" );

    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_7E38, "r" );
    var_1 waittill( "fence_cut" );
    var_3 _meth_81a7( 0 );

    if ( getdvarint( "use_old_fence_cutting" ) != 1 )
    {
        var_4 waittillmatch( "single anim", "anim_movement = \"run\"" );
        var_2 delete();
        _id_A5A4::_id_070A( "shanty_after_fence_r" );
        wait 2;
        _id_A5A4::_id_070A( "shanty_after_fence_o" );
    }

    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_8EA4 );
    common_scripts\utility::_id_0D13( var_5, ::set_allowpain, 1 );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_7F71, 0 );
}

set_allowpain( var_0 )
{
    self.allowpain = var_0;
}

wait_until_deathflag_enemies_remaining( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for (;;)
    {
        var_3 = 0;
        var_4 = level._id_265B[var_0]["spawners"];
        var_5 = getarraykeys( var_4 );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_4[var_5[var_6]] ) )
                var_3 += var_4[var_5[var_6]].count;
        }

        var_3 += level._id_265B[var_0]["ai"].size;
        level.temp_deathflagcount = var_3;

        if ( var_3 <= var_1 )
            break;

        wait 1;
    }
}

friendlies_charge_alley_early()
{
    wait_until_deathflag_enemies_remaining( "alley_cleared", 6 );
    common_scripts\utility::_id_383F( "friendlies_charge_alley" );
}

second_floor_door_breach_guys( var_0 )
{
    var_1 = getent( "apartment_second_floor_door_breach", "targetname" );
    var_2 = _id_A5A4::_id_88D1( "door" );
    var_1 hide();
    var_1 linkto( var_2, "door_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 = getnode( "second_floor_door_breach_node", "targetname" );
    level.door_mod = ( -20, -5.35, 0 );
    var_4 = spawn( "script_origin", var_3.origin + level.door_mod );
    level.door_ent = var_4;
    var_4.angles = var_3.angles + ( 0, 270, 0 );
    var_4 thread _id_A510::_id_0BC7( var_2, "door_breach" );
    var_5 = spawn( "script_origin", var_3.origin + ( -20, -13, 0 ) );
    var_5.angles = var_3.angles;
    common_scripts\utility::_id_384A( "second_floor_door_breach_initiated" );
    remove_corner_ai_blocker();

    if ( var_0 )
    {
        var_6 = _id_A5A4::get_guy_with_script_noteworthy_from_spawner( "second_floor_right_door_breach_guy" );
        var_7 = _id_A5A4::get_guy_with_script_noteworthy_from_spawner( "second_floor_left_door_breach_guy" );
    }
    else
    {
        var_7 = _id_A5A4::_id_3CF4( "p" );
        var_7 _id_A5A4::_id_5926();
        var_7 _id_A5A4::_id_1EB8();
        var_6 = _id_A5A4::_id_3CF5( "b", "shotgun" );

        if ( !isalive( var_6 ) )
            var_6 = _id_A5A4::_id_3CF5( "p", "shotgun" );

        if ( !isalive( var_6 ) )
        {
            var_8 = getent( "player_sees_breach_spawner", "targetname" );

            while ( level.playercardbackground istouching( var_8 ) )
                wait 0.1;

            var_6 = _id_A5A4::get_guy_with_script_noteworthy_from_spawner( "second_floor_left_door_breach_guy" );
        }

        var_6 _id_A5A4::_id_5926();
        var_6 _id_A5A4::_id_1EB8();
    }

    var_7.goalheight = 64;
    var_6.goalheight = 64;
    var_7._id_0C72 = "second_floor_left_guy";
    var_6._id_0C72 = "second_floor_right_guy";

    if ( !isdefined( var_7._id_58D7 ) )
        var_7 thread _id_A5A4::_id_58D7();

    if ( !isdefined( var_6._id_58D7 ) )
        var_6 thread _id_A5A4::_id_58D7();

    var_9 = [];
    var_9[var_9.size] = var_7;
    var_9[var_9.size] = var_6;
    var_5 _id_A510::_id_0BF6( var_9, "door_breach_setup", "door_breach_setup_idle", "stop_door_breach_idle" );
    var_5 notify( "stop_door_breach_idle" );
    var_5 _id_A510::_id_0C18( var_9, "door_breach_setup" );
    var_5 thread _id_A510::_id_0BDD( var_9, "door_breach_idle", "stop_loop" );
    second_floor_waittill_breach( var_9 );

    if ( common_scripts\utility::_id_382E( "player_enters_laundrymat" ) )
    {
        common_scripts\utility::_id_0D13( var_9, _id_A5A4::_id_8EA4 );
        common_scripts\utility::_id_0D13( var_9, _id_A5A4::_id_057D );
        return;
    }

    var_5 notify( "stop_loop" );
    var_5 thread _id_A510::_id_0C18( var_9, "door_breach" );
    var_6 waittillmatch( "single anim", "kick" );
    var_4 thread _id_A510::_id_0C24( var_2, "door_breach" );
    var_1 connectpaths();
    var_1 playsound( "wood_door_kick" );
    var_7.goalradius = 32;
    var_6.goalradius = 32;
    var_7.threatsightdelayfalloff = 5500;
    var_7._id_1300 = 1000;
    var_6._id_1300 = 1000;
    var_10 = spawn_guys_from_targetname( var_3._not_team );

    for ( var_11 = 0; var_11 < var_10.size; var_11++ )
    {
        var_12 = var_10[var_11];
        var_12._id_1300 = 0;
        var_12.goalradius = 8;
        var_12.helmet = 1;
        var_12.pathlookaheaddist = 0;
        var_12.pathrandompercent = 0;
        var_12 _meth_81ce( "stand" );

        if ( isdefined( var_12._not_team ) )
            var_12 thread maps\bog_a::wait_then_go_to_target();
    }

    wait 2;
    var_7 _meth_81aa( var_7.origin );
    var_5 waittill( "door_breach" );

    for ( var_11 = 0; var_11 < var_10.size; var_11++ )
    {
        if ( isalive( var_10[var_11] ) )
            var_10[var_11] waittill( "death" );
    }

    var_6._id_1300 = 1;
    var_13 = getnode( "left_guy_breach_node", "targetname" );
    var_14 = getnode( "right_guy_breach_node", "targetname" );
    var_7._id_1300 = 1;
    var_7 _meth_81aa( var_7.origin );
    var_7.goalradius = 64;
    var_6 _id_A510::_id_0C24( var_6, "clear" );
    var_3 = getnode( "second_floor_clear_node", "targetname" );
    var_7 _meth_81a9( var_3 );
    var_7.goalradius = 32;
    var_3 = getnode( "second_floor_wait_node", "targetname" );
    var_6 _meth_81a9( var_3 );
    var_7 waittill( "goal" );
    var_7.threatsightdelayfalloff = 0;
    var_7 _id_A510::_id_0C24( var_7, "clear" );
    var_7 _id_A510::_id_0C24( var_7, "three_coming_out" );
    wait 1;
    var_7 _id_A5A4::scrub();
    var_7 _meth_81a9( var_13 );
    var_7.goalradius = 32;

    if ( !var_0 )
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "roger_that" );

    var_6 _id_A510::_id_0C24( var_6, "clear" );
    var_6 _id_A5A4::scrub();
    var_6 _meth_81a9( var_14 );
    var_6.goalradius = 32;

    if ( var_0 )
    {
        var_7 waittill( "goal" );

        for ( var_11 = 0; var_11 < var_9.size; var_11++ )
            var_9[var_11] delete();

        return;
    }

    common_scripts\utility::_id_384A( "alley_enemies_spawn" );
    var_6 thread door_breach_guy_leaves( "right_leave_node" );
    var_7 thread door_breach_guy_leaves( "left_leave_node" );
}

door_breach_guy_leaves( var_0 )
{
    self endon( "death" );
    var_1 = getnode( var_0, "targetname" );
    self _meth_81a9( var_1 );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A0AC );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "player_enters_laundrymat" );
    _id_A5A4::_id_2BDD();
    wait(randomfloat( 2 ));
    _id_A5A4::_id_7E38( "g" );
    self.ignoreforfixednodesafecheck = 1;
}

second_floor_waittill_breach( var_0 )
{
    _id_A5A4::_id_07BE( _id_A5A4::_id_9FC0, "second_floor_door_breach_trigger" );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "player_enters_laundrymat" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_A5A4::_id_07BE( _id_A5A4::_id_A0AD, 0.3 );

    _id_A5A4::_id_2BDD();
}

waittill_player_not_looking( var_0 )
{
    for (;;)
    {
        if ( !_id_A5A4::_id_6B91( var_0, 0.7 ) )
            break;

        wait 0.1;
    }
}

update_obj_on_dropped_jav( var_0 )
{
    level endon( "overpass_baddies_flee" );
    common_scripts\utility::_id_382F( "overpass_baddies_flee" );

    for (;;)
    {
        var_1 = getentarray( "weapon_javelin", "classname" );

        if ( !var_1.size )
        {
            wait 0.05;
            continue;
        }

        var_2 = var_1[0];
        var_2 thread _id_A5A4::_id_076A( "overpass_baddies_flee" );
        objective_position( 4, var_2.origin );

        for (;;)
        {
            var_1 = getentarray( "weapon_javelin", "classname" );

            if ( !var_1.size )
                break;

            wait 0.05;
        }

        objective_position( 4, var_0 );
    }
}

wait_for_fence_guys_to_be_drafted()
{
    if ( !isdefined( level.fence_guys ) )
        level.fence_guys = [];

    if ( level.fence_guys.size >= 2 )
        return;

    level notify( "drafting_fence_guys" );
    level endon( "drafting_fence_guys" );

    for (;;)
    {
        var_0 = getaiarray( "allies" );
        var_0 = _id_A5A4::_id_735E( var_0 );

        if ( !var_0.size )
        {
            wait 0.5;
            continue;
        }

        var_1 = var_0[0];
        var_1 thread _id_A5A4::_id_58D7();
        var_1 _id_A5A4::_id_5926();
        var_1 _id_A5A4::_id_7E38( "r" );
        var_1.fence_guy = 1;
        level.fence_guys[level.fence_guys.size] = var_1;

        if ( level.fence_guys.size >= 2 )
            break;
    }
}

disable_nvg()
{
    common_scripts\utility::_id_384A( "player_enters_laundrymat" );
    wait 4.0;
    level.playercardbackground _id_A5A4::_id_2B4A( "disable_nvg" );
}

update_apartment_objective_position()
{
    self waittill( "trigger" );
    var_0 = getent( self._not_team, "targetname" );
    objective_position( 2, var_0.origin );
}
