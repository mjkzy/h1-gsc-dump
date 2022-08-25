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

_id_825A()
{
    level.bot_personality = [];
    level.bot_personality_list = [];
    level.bot_personality["active"][0] = "default";
    level.bot_personality["active"][1] = "run_and_gun";
    level.bot_personality["active"][2] = "cqb";
    level.bot_personality["stationary"][0] = "camper";
    level.bot_personality_type = [];

    foreach ( var_5, var_1 in level.bot_personality )
    {
        foreach ( var_3 in var_1 )
        {
            level.bot_personality_type[var_3] = var_5;
            level.bot_personality_list[level.bot_personality_list.size] = var_3;
        }
    }

    level.bot_personality_types_desired = [];
    level.bot_personality_types_desired["active"] = 4;
    level.bot_personality_types_desired["stationary"] = 1;
    level.bot_pers_init = [];
    level.bot_pers_init["default"] = ::_id_4D30;
    level.bot_pers_init["camper"] = ::_id_4D2F;
    level.bot_pers_update["default"] = ::_id_9AD2;
    level.bot_pers_update["camper"] = ::_id_9AD1;
}

bot_assign_personality_functions()
{
    self._id_67DF = self botgetpersonality();
    self.pers["personality"] = self._id_67DF;
    self._id_67E0 = level.bot_pers_init[self._id_67DF];

    if ( !isdefined( self._id_67E0 ) )
        self._id_67E0 = level.bot_pers_init["default"];

    self [[ self._id_67E0 ]]();
    self._id_67E1 = level.bot_pers_update[self._id_67DF];

    if ( !isdefined( self._id_67E1 ) )
        self._id_67E1 = level.bot_pers_update["default"];
}

bot_balance_personality()
{
    if ( isdefined( self._id_67E2 ) && self._id_67E2 )
        return;

    if ( isdefined( self.pers["personality"] ) )
    {
        self botsetpersonality( self.pers["personality"] );
        return;
    }

    var_0 = self.team;

    if ( !isdefined( var_0 ) && !isdefined( self.bot_team ) )
        var_0 = self.pers["team"];

    var_1 = getarraykeys( level.bot_personality_types_desired );
    var_2 = [];
    var_3 = [];

    foreach ( var_9, var_5 in level.bot_personality )
    {
        var_3[var_9] = 0;

        foreach ( var_7 in var_5 )
            var_2[var_7] = 0;
    }

    foreach ( var_11 in level._id_669D )
    {
        if ( var_11 == self )
            continue;

        if ( !maps\mp\_utility::_id_51CE( var_11 ) || !isdefined( var_11._id_46E0 ) )
            continue;

        if ( isdefined( var_11.team ) && var_11.team == var_0 || !level.teambased )
        {
            var_7 = var_11 botgetpersonality();
            var_9 = level.bot_personality_type[var_7];
            var_2[var_7] += 1;
            var_3[var_9] += 1;
        }
    }

    var_13 = [];

    foreach ( var_15 in var_1 )
        var_13[var_15] = int( var_3[var_15] / level.bot_personality_types_desired[var_15] );

    var_17 = undefined;

    for ( var_18 = 0; var_18 < var_1.size && !isdefined( var_17 ); var_18++ )
    {
        var_19 = var_1[var_18];
        var_20 = 1;

        for ( var_21 = 0; var_21 < var_1.size; var_21++ )
        {
            var_22 = var_1[var_21];

            if ( var_19 != var_22 )
            {
                if ( var_13[var_19] >= var_13[var_22] )
                    var_20 = 0;
            }
        }

        if ( var_20 )
            var_17 = var_19;
    }

    if ( !isdefined( var_17 ) )
    {
        var_23 = [];

        foreach ( var_15 in var_1 )
            var_23[var_15] = level.bot_personality_types_desired[var_15] - var_3[var_15] % level.bot_personality_types_desired[var_15];

        var_26 = 0;

        foreach ( var_15 in var_1 )
            var_26 += var_23[var_15];

        var_29 = randomfloat( var_26 );

        foreach ( var_15 in var_1 )
        {
            if ( var_29 < var_23[var_15] )
            {
                var_17 = var_15;
                break;
            }

            var_29 -= var_23[var_15];
        }
    }

    var_32 = undefined;
    var_33 = undefined;
    var_34 = 9999;
    var_35 = undefined;
    var_36 = -9999;
    var_37 = common_scripts\utility::array_randomize( level.bot_personality[var_17] );

    foreach ( var_7 in var_37 )
    {
        if ( var_2[var_7] < var_34 )
        {
            var_33 = var_7;
            var_34 = var_2[var_7];
        }

        if ( var_2[var_7] > var_36 )
        {
            var_35 = var_7;
            var_36 = var_2[var_7];
        }
    }

    if ( var_36 - var_34 >= 2 )
        var_32 = var_33;
    else
        var_32 = common_scripts\utility::_id_710E( level.bot_personality[var_17] );

    if ( self botgetpersonality() != var_32 )
        self botsetpersonality( var_32 );

    self._id_46E0 = 1;
}

_id_4D2F()
{
    _id_1EA3();
}

_id_4D30()
{
    _id_1EA3();
}

_id_9AD1()
{
    if ( _id_8476() && !maps\mp\bots\_bots_util::bot_is_defending() && !maps\mp\bots\_bots_util::bot_is_remote_or_linked() )
    {
        var_0 = self botgetscriptgoaltype();
        var_1 = 0;

        if ( !isdefined( self._id_1A41 ) )
            self._id_1A41 = 0;

        var_2 = var_0 == "hunt";
        var_3 = gettime() > self._id_1A41 + 10000;

        if ( ( !var_2 || var_3 ) && !maps\mp\bots\_bots_util::bot_out_of_ammo() )
        {
            if ( !self bothasscriptgoal() )
                bot_random_path();

            if ( isdefined( level.override_find_camp_node ) )
                var_1 = [[ level.override_find_camp_node ]]();

            if ( !var_1 )
            {
                var_1 = _id_3757();

                if ( !var_1 )
                    self._id_1A41 = gettime();
            }
        }

        if ( isdefined( var_1 ) && var_1 )
        {
            self.ambush_entrances = maps\mp\bots\_bots_util::bot_queued_process( "bot_find_ambush_entrances", ::bot_find_ambush_entrances, self._id_6121, 1 );
            var_4 = maps\mp\bots\_bots_strategy::bot_get_ambush_trap_item( "trap_directional", "trap", "c4" );

            if ( isdefined( var_4 ) )
            {
                var_5 = gettime();
                maps\mp\bots\_bots_strategy::bot_set_ambush_trap( var_4, self.ambush_entrances, self._id_6121, self.ambush_yaw );
                var_5 = gettime() - var_5;

                if ( var_5 > 0 && isdefined( self.ambush_end ) && isdefined( self._id_6121 ) )
                {
                    self.ambush_end += var_5;
                    self._id_6121.bot_ambush_end = self.ambush_end + 10000;
                }
            }

            if ( !maps\mp\bots\_bots_strategy::bot_has_tactical_goal() && !maps\mp\bots\_bots_util::bot_is_defending() && isdefined( self._id_6121 ) )
            {
                self botsetscriptgoal( self._id_6121, "camp", self.ambush_yaw );
                thread _id_1ED2( "bad_path", "node_relinquished", "out_of_ammo" );
                thread _id_A1ED();
                thread bot_add_ambush_time_delayed( "clear_camper_data", "goal" );
                thread bot_watch_entrances_delayed( "clear_camper_data", "bot_add_ambush_time_delayed", self.ambush_entrances, self.ambush_yaw );
                return;
            }
        }
        else
        {
            if ( var_0 == "camp" )
                self botclearscriptgoal();

            _id_9AD2();
        }
    }
}

_id_9AD2()
{
    var_0 = undefined;
    var_1 = self bothasscriptgoal();

    if ( var_1 )
        var_0 = self botgetscriptgoal();

    if ( !maps\mp\bots\_bots_strategy::bot_has_tactical_goal() && !maps\mp\bots\_bots_util::bot_is_remote_or_linked() )
    {
        var_2 = undefined;
        var_3 = undefined;

        if ( var_1 )
        {
            var_2 = distancesquared( self.origin, var_0 );
            var_3 = self botgetscriptgoalradius();
            var_4 = var_3 * 2;

            if ( isdefined( self.bot_memory_goal ) && var_2 < var_4 * var_4 )
            {
                var_5 = botmemoryflags( "investigated" );
                botflagmemoryevents( 0, gettime() - self.bot_memory_goal_time, 1, self.bot_memory_goal, var_4, "kill", var_5, self );
                botflagmemoryevents( 0, gettime() - self.bot_memory_goal_time, 1, self.bot_memory_goal, var_4, "death", var_5, self );
                self.bot_memory_goal = undefined;
                self.bot_memory_goal_time = undefined;
            }
        }

        if ( !var_1 || var_2 < var_3 * var_3 )
        {
            var_6 = bot_random_path();
            var_7 = 25;

            if ( maps\mp\_utility::_id_5092( self.encourage_explosive_use ) )
                var_7 = 50;

            if ( var_6 && randomfloat( 100 ) < var_7 )
            {
                var_8 = maps\mp\bots\_bots_strategy::bot_get_ambush_trap_item( "trap_directional", "trap" );

                if ( isdefined( var_8 ) )
                {
                    var_9 = self botgetscriptgoal();

                    if ( isdefined( var_9 ) )
                    {
                        var_10 = getclosestnodeinsight( var_9 );

                        if ( isdefined( var_10 ) )
                        {
                            var_11 = bot_find_ambush_entrances( var_10, 0 );
                            var_12 = maps\mp\bots\_bots_strategy::bot_set_ambush_trap( var_8, var_11, var_10 );

                            if ( !isdefined( var_12 ) || var_12 )
                            {
                                self botclearscriptgoal();
                                var_6 = bot_random_path();
                            }
                        }
                    }
                }
            }

            if ( var_6 )
                thread _id_1ED2( "enemy", "bad_path", "goal", "node_relinquished", "search_end" );
        }
    }
}

_id_1ED2( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "clear_script_goal_on" );
    self endon( "clear_script_goal_on" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "start_tactical_goal" );
    var_5 = self botgetscriptgoal();
    var_6 = 1;

    while ( var_6 )
    {
        var_7 = common_scripts\utility::_id_A070( var_0, var_1, var_2, var_3, var_4, "script_goal_changed" );
        var_6 = 0;
        var_8 = 1;

        if ( var_7 == "node_relinquished" || var_7 == "goal" || var_7 == "script_goal_changed" )
        {
            if ( !self bothasscriptgoal() )
                var_8 = 0;
            else
            {
                var_9 = self botgetscriptgoal();
                var_8 = maps\mp\bots\_bots_util::bot_vectors_are_equal( var_5, var_9 );
            }
        }

        if ( var_7 == "enemy" && isdefined( self.enemy ) )
        {
            var_8 = 0;
            var_6 = 1;
        }

        if ( var_8 )
            self botclearscriptgoal();
    }
}

_id_A1ED()
{
    self notify( "watch_out_of_ammo" );
    self endon( "watch_out_of_ammo" );
    self endon( "death" );
    self endon( "disconnect" );

    while ( !maps\mp\bots\_bots_util::bot_out_of_ammo() )
        wait 0.5;

    self notify( "out_of_ammo" );
}

bot_add_ambush_time_delayed( var_0, var_1 )
{
    self notify( "bot_add_ambush_time_delayed" );
    self endon( "bot_add_ambush_time_delayed" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        self endon( var_0 );

    self endon( "node_relinquished" );
    self endon( "bad_path" );
    var_2 = gettime();

    if ( isdefined( var_1 ) )
        self waittill( var_1 );

    if ( isdefined( self.ambush_end ) && isdefined( self._id_6121 ) )
    {
        self.ambush_end += gettime() - var_2;
        self._id_6121.bot_ambush_end = self.ambush_end + 10000;
    }

    self notify( "bot_add_ambush_time_delayed" );
}

bot_watch_entrances_delayed( var_0, var_1, var_2, var_3 )
{
    self notify( "bot_watch_entrances_delayed" );

    if ( var_2.size > 0 )
    {
        self endon( "bot_watch_entrances_delayed" );
        self endon( "death" );
        self endon( "disconnect" );
        self endon( var_0 );
        self endon( "node_relinquished" );
        self endon( "bad_path" );

        if ( isdefined( var_1 ) )
            self waittill( var_1 );

        self endon( "path_enemy" );
        childthread maps\mp\bots\_bots_util::bot_watch_nodes( var_2, var_3, 0, self.ambush_end );
        childthread bot_monitor_watch_entrances_camp();
    }
}

bot_monitor_watch_entrances_camp()
{
    self notify( "bot_monitor_watch_entrances_camp" );
    self endon( "bot_monitor_watch_entrances_camp" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );
    self endon( "disconnect" );
    self endon( "death" );

    while ( !isdefined( self._id_A1EA ) )
        wait 0.05;

    while ( isdefined( self._id_A1EA ) )
    {
        foreach ( var_1 in self._id_A1EA )
            var_1._id_A1E9[self._id_3314] = 1.0;

        maps\mp\bots\_bots_strategy::_id_6FBD( 0.5 );
        wait(randomfloatrange( 0.5, 0.75 ));
    }
}

bot_find_ambush_entrances( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = [];
    var_3 = findentrances( var_0.origin );

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        wait 0.05;
        var_4 = var_0.type != "Cover Stand" && var_0.type != "Conceal Stand";

        if ( var_4 && var_1 )
            var_3 = self _meth_837E( var_3, "node_exposure_vis", var_0.origin, "crouch" );

        foreach ( var_6 in var_3 )
        {
            if ( distancesquared( self.origin, var_6.origin ) < 90000 )
                continue;

            if ( var_4 && var_1 )
            {
                wait 0.05;

                if ( !maps\mp\bots\_bots_util::_id_332B( var_6.origin, var_0.origin, "crouch" ) )
                    continue;
            }

            var_2[var_2.size] = var_6;
        }
    }

    return var_2;
}

bot_filter_ambush_inuse( var_0 )
{
    var_1 = [];
    var_2 = gettime();
    var_3 = var_0.size;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( !isdefined( var_5.bot_ambush_end ) || var_2 > var_5.bot_ambush_end )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

bot_filter_ambush_vicinity( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = [];
    var_5 = var_2 * var_2;

    if ( level.teambased )
    {
        foreach ( var_7 in level._id_669D )
        {
            if ( !maps\mp\_utility::_id_5189( var_7 ) )
                continue;

            if ( !isdefined( var_7.team ) )
                continue;

            if ( var_7.team == var_1.team && var_7 != var_1 && isdefined( var_7._id_6121 ) )
                var_4[var_4.size] = var_7._id_6121.origin;
        }
    }

    var_9 = var_4.size;
    var_10 = var_0.size;

    for ( var_11 = 0; var_11 < var_10; var_11++ )
    {
        var_12 = 0;
        var_13 = var_0[var_11];

        for ( var_14 = 0; !var_12 && var_14 < var_9; var_14++ )
        {
            var_15 = distancesquared( var_4[var_14], var_13.origin );
            var_12 = var_15 < var_5;
        }

        if ( !var_12 )
            var_3[var_3.size] = var_13;
    }

    return var_3;
}

_id_1EA3()
{
    self notify( "clear_camper_data" );

    if ( isdefined( self._id_6121 ) && isdefined( self._id_6121.bot_ambush_end ) )
        self._id_6121.bot_ambush_end = undefined;

    self._id_6121 = undefined;
    self._id_6E21 = undefined;
    self.ambush_yaw = undefined;
    self.ambush_entrances = undefined;
    self.ambush_duration = randomintrange( 20000, 30000 );
    self.ambush_end = -1;
}

_id_8476()
{
    if ( maps\mp\bots\_bots_strategy::bot_has_tactical_goal() )
        return 0;

    if ( gettime() > self.ambush_end )
        return 1;

    if ( !self bothasscriptgoal() )
        return 1;

    return 0;
}

_id_3757()
{
    self notify( "find_camp_node" );
    self endon( "find_camp_node" );
    return maps\mp\bots\_bots_util::bot_queued_process( "find_camp_node_worker", ::_id_3758 );
}

_id_3758()
{
    self notify( "find_camp_node_worker" );
    self endon( "find_camp_node_worker" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_1EA3();

    if ( level._id_A3EF <= 0 )
        return 0;

    var_0 = getzonenearest( self.origin );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = self getplayerangles();

    if ( isdefined( var_0 ) )
    {
        var_4 = botzonenearestcount( var_0, self.team, -1, "enemy_predict", ">", 0, "ally", "<", 1 );

        if ( !isdefined( var_4 ) )
            var_4 = botzonenearestcount( var_0, self.team, -1, "enemy_predict", ">", 0 );

        if ( isdefined( var_4 ) )
        {
            var_5 = getzonenodeforindex( var_4 );
            var_6 = getlinkednodes( var_5 );

            if ( var_6.size == 0 )
                var_4 = undefined;
        }

        if ( !isdefined( var_4 ) )
        {
            var_7 = -1;
            var_8 = -1;

            for ( var_9 = 0; var_9 < level._id_A3EF; var_9++ )
            {
                var_5 = getzonenodeforindex( var_9 );
                var_6 = getlinkednodes( var_5 );

                if ( var_6.size > 0 )
                {
                    var_10 = common_scripts\utility::_id_710E( getzonenodes( var_9 ) );
                    var_11 = isdefined( var_10.targetname ) && var_10.targetname == "no_bot_random_path";

                    if ( !var_11 )
                    {
                        var_12 = distance2dsquared( getzoneorigin( var_9 ), self.origin );

                        if ( var_12 > var_7 )
                        {
                            var_7 = var_12;
                            var_8 = var_9;
                        }
                    }
                }
            }

            var_4 = var_8;
        }

        var_13 = getzonepath( var_0, var_4 );

        if ( !isdefined( var_13 ) || var_13.size == 0 )
            return 0;

        for ( var_14 = 0; var_14 <= int( var_13.size / 2 ); var_14++ )
        {
            var_1 = var_13[var_14];
            var_2 = var_13[int( min( var_14 + 1, var_13.size - 1 ) )];

            if ( botzonegetcount( var_2, self.team, "enemy_predict" ) != 0 )
                break;
        }

        if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 != var_2 )
        {
            var_3 = getzoneorigin( var_2 ) - getzoneorigin( var_1 );
            var_3 = vectortoangles( var_3 );
        }
    }

    var_15 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_16 = 1;
        var_17 = 1;
        var_18 = 0;

        while ( var_16 )
        {
            var_19 = getzonenodesbydist( var_1, 800 * var_17, 1 );

            if ( var_19.size > 1024 )
                var_19 = getzonenodes( var_1, 0 );

            wait 0.05;
            var_20 = randomint( 100 );

            if ( var_20 < 66 && var_20 >= 33 )
                var_3 = ( var_3[0], var_3[1] + 45, 0 );
            else if ( var_20 < 33 )
                var_3 = ( var_3[0], var_3[1] - 45, 0 );

            if ( var_19.size > 0 )
            {
                while ( var_19.size > 1024 )
                    var_19[var_19.size - 1] = undefined;

                var_21 = int( clamp( var_19.size * 0.15, 1, 10 ) );

                if ( var_18 )
                    var_19 = self _meth_836F( var_19, var_21, var_21, "node_camp", anglestoforward( var_3 ), "lenient" );
                else
                    var_19 = self _meth_836F( var_19, var_21, var_21, "node_camp", anglestoforward( var_3 ) );

                var_19 = bot_filter_ambush_inuse( var_19 );

                if ( !isdefined( self._id_1A47 ) || !self._id_1A47 )
                {
                    var_22 = 800;
                    var_19 = bot_filter_ambush_vicinity( var_19, self, var_22 );
                }

                if ( var_19.size > 0 )
                    var_15 = common_scripts\utility::_id_711C( var_19 );
            }

            if ( isdefined( var_15 ) )
                var_16 = 0;
            else if ( isdefined( self._id_1A43 ) )
            {
                if ( var_17 == 1 && !var_18 )
                    var_17 = 3;
                else if ( var_17 == 3 && !var_18 )
                    var_18 = 1;
                else if ( var_17 == 3 && var_18 )
                    var_16 = 0;
            }
            else
                var_16 = 0;

            if ( var_16 )
                wait 0.05;
        }
    }

    if ( !isdefined( var_15 ) || !self _meth_835E( var_15 ) )
        return 0;

    self._id_6121 = var_15;
    self.ambush_end = gettime() + self.ambush_duration;
    self._id_6121.bot_ambush_end = self.ambush_end;
    self.ambush_yaw = var_3[1];
    return 1;
}

_id_3753( var_0, var_1 )
{
    _id_1EA3();

    if ( isdefined( var_0 ) )
        self._id_6E21 = var_0;
    else
    {
        var_2 = undefined;
        var_3 = getnodesinradius( self.origin, 5000, 0, 2000 );

        if ( var_3.size > 0 )
            var_2 = self botnodepick( var_3, var_3.size * 0.25, "node_traffic" );

        if ( isdefined( var_2 ) )
            self._id_6E21 = var_2.origin;
        else
            return 0;
    }

    var_4 = 2000;

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    var_5 = getnodesinradius( self._id_6E21, var_4, 0, 1000 );
    var_6 = undefined;

    if ( var_5.size > 0 )
    {
        var_7 = int( max( 1, int( var_5.size * 0.15 ) ) );
        var_5 = self _meth_836F( var_5, var_7, var_7, "node_ambush", self._id_6E21 );
    }

    var_5 = bot_filter_ambush_inuse( var_5 );

    if ( var_5.size > 0 )
        var_6 = common_scripts\utility::_id_711C( var_5 );

    if ( !isdefined( var_6 ) || !self _meth_835E( var_6 ) )
        return 0;

    self._id_6121 = var_6;
    self.ambush_end = gettime() + self.ambush_duration;
    self._id_6121.bot_ambush_end = self.ambush_end;
    var_8 = vectornormalize( self._id_6E21 - self._id_6121.origin );
    var_9 = vectortoangles( var_8 );
    self.ambush_yaw = var_9[1];
    return 1;
}

bot_random_path()
{
    if ( maps\mp\bots\_bots_util::bot_is_remote_or_linked() )
        return 0;

    var_0 = level.bot_random_path_function[self.team];
    return self [[ var_0 ]]();
}

bot_random_path_default()
{
    var_0 = 0;
    var_1 = 50;

    if ( self._id_67DF == "camper" )
        var_1 = 0;

    var_2 = undefined;

    if ( randomint( 100 ) < var_1 )
        var_2 = maps\mp\bots\_bots_util::bot_recent_point_of_interest();

    if ( !isdefined( var_2 ) )
    {
        var_3 = self botfindnoderandom();

        if ( isdefined( var_3 ) )
            var_2 = var_3.origin;
    }

    if ( isdefined( var_2 ) )
        var_0 = self _meth_8352( var_2, 128, "hunt" );

    return var_0;
}

bot_setup_callback_class()
{
    if ( maps\mp\bots\_bots_loadout::bot_setup_loadout_callback() )
        return "callback";
    else
        return "class0";
}
