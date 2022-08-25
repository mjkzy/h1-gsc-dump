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

bot_get_nodes_in_cone( var_0, var_1, var_2, var_3 )
{
    var_4 = getnodesinradius( self.origin, var_1, var_0 );
    var_5 = [];
    var_6 = self _meth_8385();
    var_7 = anglestoforward( self getplayerangles() );
    var_8 = vectornormalize( var_7 * ( 1.0, 1.0, 0.0 ) );

    foreach ( var_10 in var_4 )
    {
        var_11 = vectornormalize( ( var_10.origin - self.origin ) * ( 1.0, 1.0, 0.0 ) );
        var_12 = vectordot( var_11, var_8 );

        if ( var_12 > var_2 )
        {
            if ( !var_3 || isdefined( var_6 ) && nodesvisible( var_10, var_6, 1 ) )
                var_5[var_5.size] = var_10;
        }
    }

    return var_5;
}

bot_goal_can_override( var_0, var_1 )
{
    if ( var_0 == "none" )
        return var_1 == "none";
    else if ( var_0 == "hunt" )
        return var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "guard" )
        return var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "objective" )
        return var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "critical" )
        return var_1 == "critical" || var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "tactical" )
        return 1;
}

bot_set_personality( var_0 )
{
    self botsetpersonality( var_0 );
    maps\mp\bots\_bots_personality::bot_assign_personality_functions();
    self botclearscriptgoal();
}

bot_set_difficulty( var_0, var_1 )
{
    if ( var_0 == "default" )
        var_0 = bot_choose_difficulty_for_default();

    var_3 = self botgetdifficulty();
    self botsetdifficulty( var_0 );

    if ( isplayer( self ) && var_3 != var_0 )
    {
        maps\mp\_utility::_id_7EA5();
        var_4 = _func_2EC( maps\mp\gametypes\_rank::_id_4137(), 0 );
        self.pers["rank"] = var_4;
        var_5 = self.pers["prestige"];
        self setrank( var_4, var_5 );
    }
}

bot_choose_difficulty_for_default()
{
    if ( !isdefined( level.bot_difficulty_defaults ) )
    {
        level.bot_difficulty_defaults = [];
        level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "easy";
        level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "normal";
        level.bot_difficulty_defaults[level.bot_difficulty_defaults.size] = "hard";
    }

    if ( !isdefined( level.bot_next_difficulty_type_index ) )
        level.bot_next_difficulty_type_index = [];

    if ( !isdefined( level.bot_next_difficulty_type_index["allies"] ) )
        level.bot_next_difficulty_type_index["allies"] = 0;

    if ( !isdefined( level.bot_next_difficulty_type_index["axis"] ) )
        level.bot_next_difficulty_type_index["axis"] = 0;

    if ( !isdefined( level.bot_next_difficulty_type_index["all"] ) )
        level.bot_next_difficulty_type_index["all"] = 0;

    if ( !isdefined( self.pers["bot_chosen_difficulty"] ) )
    {
        var_0 = undefined;

        if ( level.teambased )
        {
            var_1 = self.team;

            if ( !isdefined( var_1 ) )
                var_1 = self.bot_team;

            if ( !isdefined( var_1 ) )
                var_1 = self.pers["team"];
        }
        else
            var_1 = "all";

        var_0 = level.bot_next_difficulty_type_index[var_1];
        var_2 = level.bot_difficulty_defaults[var_0];
        self.pers["bot_chosen_difficulty"] = get_difficulty_for_difficulty_type( var_2 );
        level.bot_next_difficulty_type_index[var_1] = ( level.bot_next_difficulty_type_index[var_1] + 1 ) % level.bot_difficulty_defaults.size;
    }

    return self.pers["bot_chosen_difficulty"];
}

get_difficulty_for_difficulty_type( var_0 )
{
    if ( var_0 == "easy" )
        return "recruit";
    else if ( var_0 == "normal" )
        return "regular";
    else if ( var_0 == "hard" )
        return common_scripts\utility::_id_710E( [ "hardened", "veteran" ] );
    else
    {

    }
}

bot_is_capturing()
{
    if ( bot_is_defending() )
    {
        if ( self.bot_defending_type == "capture" || self.bot_defending_type == "capture_zone" )
            return 1;
    }

    return 0;
}

bot_is_patrolling()
{
    if ( bot_is_defending() )
    {
        if ( self.bot_defending_type == "patrol" )
            return 1;
    }

    return 0;
}

bot_is_protecting()
{
    if ( bot_is_defending() )
    {
        if ( self.bot_defending_type == "protect" )
            return 1;
    }

    return 0;
}

bot_is_bodyguarding()
{
    if ( bot_is_defending() )
    {
        if ( self.bot_defending_type == "bodyguard" )
            return 1;
    }

    return 0;
}

bot_is_defending()
{
    return isdefined( self.bot_defending );
}

bot_is_defending_point( var_0 )
{
    if ( bot_is_defending() )
    {
        if ( bot_vectors_are_equal( self.bot_defending_center, var_0 ) )
            return 1;
    }

    return 0;
}

bot_is_guarding_player( var_0 )
{
    if ( bot_is_bodyguarding() && self.bot_defend_player_guarding == var_0 )
        return 1;

    return 0;
}

_id_332B( var_0, var_1, var_2 )
{
    var_3 = ( 0.0, 0.0, 11.0 );
    var_4 = ( 0.0, 0.0, 40.0 );
    var_5 = undefined;

    if ( var_2 == "stand" )
        return 1;
    else if ( var_2 == "crouch" )
        var_5 = var_4;
    else if ( var_2 == "prone" )
        var_5 = var_3;

    return sighttracepassed( var_1 + var_5, var_0 + var_5, 0, undefined );
}

_id_3D64( var_0, var_1 )
{
    var_2 = _id_3AE9( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        var_2 = _id_7347( var_2 );
        var_2 = _id_3CBC( var_2 );
    }

    return var_2;
}

_id_3AEA( var_0, var_1 )
{
    return getpathdist( var_0, var_1 );
}

_id_3AE9( var_0, var_1 )
{
    return getnodesonpath( var_0, var_1 );
}

_id_3AE5( var_0, var_1, var_2 )
{
    return botgetclosestnavigablepoint( var_0, var_1, var_2 );
}

_id_6126( var_0, var_1 )
{
    if ( !isdefined( self._id_6444 ) )
        return 0;

    if ( isdefined( self._id_6444[var_0] ) && isdefined( self._id_6444[var_0][var_1] ) && self._id_6444[var_0][var_1] )
        return 1;

    if ( isdefined( self._id_6444[var_1] ) && isdefined( self._id_6444[var_1][var_0] ) && self._id_6444[var_1][var_0] )
        return 1;

    return 0;
}

_id_3CBC( var_0 )
{
    var_1 = var_0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = getlinkednodes( var_0[var_2] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !common_scripts\utility::array_contains( var_1, var_3[var_4] ) )
                var_1 = common_scripts\utility::array_add( var_1, var_3[var_4] );
        }
    }

    return var_1;
}

_id_3EBE( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( nodesvisible( var_4, var_1, 1 ) )
            var_2 = common_scripts\utility::array_add( var_2, var_4 );
    }

    return var_2;
}

_id_7347( var_0 )
{
    var_0[var_0.size - 1] = undefined;
    var_0[0] = undefined;
    return common_scripts\utility::array_removeundefined( var_0 );
}

bot_waittill_bots_enabled( var_0 )
{
    while ( !bot_bots_enabled_or_added( var_0 ) )
        wait 0.5;
}

bot_bots_enabled_or_added( var_0 )
{
    if ( botautoconnectenabled() != "off" )
        return 1;

    if ( isdefined( level.ai_game_mode ) && level.ai_game_mode )
        return 1;

    if ( bots_exist( var_0 ) )
        return 1;

    return 0;
}

bot_waittill_out_of_combat_or_time( var_0 )
{
    var_1 = gettime();

    for (;;)
    {
        if ( isdefined( var_0 ) )
        {
            if ( gettime() > var_1 + var_0 )
                return;
        }

        if ( !isdefined( self.enemy ) )
            return;
        else if ( !bot_in_combat() )
            return;

        wait 0.05;
    }
}

bot_in_combat( var_0 )
{
    if ( self._id_5523 == 0 )
        return 0;

    var_1 = gettime() - self._id_5523;
    var_2 = level.bot_out_of_combat_time;

    if ( isdefined( var_0 ) )
        var_2 = var_0;

    return var_1 < var_2;
}

bot_waittill_goal_or_fail( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) && isdefined( var_2 ) )
    {

    }

    var_3 = [ "goal", "bad_path", "no_path", "node_relinquished", "script_goal_changed" ];

    if ( isdefined( var_1 ) )
        var_3[var_3.size] = var_1;

    if ( isdefined( var_2 ) )
        var_3[var_3.size] = var_2;

    if ( isdefined( var_0 ) )
        var_4 = common_scripts\utility::_id_A06B( var_3, var_0 );
    else
        var_4 = common_scripts\utility::_id_A06D( var_3 );

    return var_4;
}

bot_usebutton_wait( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    childthread _id_9BD5();
    var_3 = common_scripts\utility::_id_A073( var_0, var_1, var_2, "use_button_no_longer_pressed", "finished_use" );
    self notify( "stop_usebutton_watcher" );
    return var_3;
}

_id_9BD5( var_0, var_1 )
{
    self endon( "stop_usebutton_watcher" );
    wait 0.05;

    while ( self usebuttonpressed() )
        wait 0.05;

    self notify( "use_button_no_longer_pressed" );
}

bots_exist( var_0 )
{
    foreach ( var_2 in level._id_669D )
    {
        if ( isai( var_2 ) )
        {
            if ( isdefined( var_0 ) && var_0 )
            {
                if ( !maps\mp\_utility::_id_51CE( var_2 ) )
                    continue;
            }

            return 1;
        }
    }

    return 0;
}

bot_get_entrances_for_stance_and_index( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_3323 ) && !isdefined( self._id_27B4 ) )
        return undefined;

    if ( isarray( var_1 ) )
    {
        if ( isdefined( var_2 ) && var_2 )
        {
            var_3 = undefined;
            var_4 = 999999999;

            foreach ( var_6 in var_1 )
            {
                var_7 = common_scripts\utility::array_find( level._id_3320, var_6 );
                var_8 = level._id_3321[var_7];
                var_9 = distancesquared( self.origin, var_8 );

                if ( var_9 < var_4 )
                {
                    var_3 = var_6;
                    var_4 = var_9;
                }
            }

            var_1 = var_3;
        }
        else
            var_1 = common_scripts\utility::_id_710E( var_1 );
    }

    var_11 = [];

    if ( isdefined( self._id_27B4 ) )
        var_11 = self._id_27B4;
    else
        var_11 = level._id_3322[var_1];

    if ( !isdefined( var_0 ) || var_0 == "stand" )
        return var_11;
    else if ( var_0 == "crouch" )
    {
        var_12 = [];

        foreach ( var_14 in var_11 )
        {
            if ( var_14._id_2480[var_1] )
                var_12 = common_scripts\utility::array_add( var_12, var_14 );
        }

        return var_12;
    }
    else if ( var_0 == "prone" )
    {
        var_12 = [];

        foreach ( var_14 in var_11 )
        {
            if ( var_14._id_7020[var_1] )
                var_12 = common_scripts\utility::array_add( var_12, var_14 );
        }

        return var_12;
    }

    return undefined;
}

bot_find_node_to_guard_player( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = self.bot_defend_player_guarding getvelocity();

    if ( lengthsquared( var_4 ) > 100 )
    {
        var_5 = getnodesinradius( var_0, var_1 * 1.75, var_1 * 0.5, 500 );
        var_6 = [];
        var_7 = vectornormalize( var_4 );

        for ( var_8 = 0; var_8 < var_5.size; var_8++ )
        {
            var_9 = vectornormalize( var_5[var_8].origin - self.bot_defend_player_guarding.origin );

            if ( vectordot( var_9, var_7 ) > 0.1 )
                var_6[var_6.size] = var_5[var_8];
        }
    }
    else
        var_6 = getnodesinradius( var_0, var_1, 0, 500 );

    if ( isdefined( var_2 ) && var_2 )
    {
        var_10 = vectornormalize( self.bot_defend_player_guarding.origin - self.origin );
        var_11 = var_6;
        var_6 = [];

        foreach ( var_13 in var_11 )
        {
            var_9 = vectornormalize( var_13.origin - self.bot_defend_player_guarding.origin );

            if ( vectordot( var_10, var_9 ) > 0.2 )
                var_6[var_6.size] = var_13;
        }
    }

    var_15 = [];
    var_16 = [];
    var_17 = [];

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        var_18 = distancesquared( var_6[var_8].origin, var_0 ) > 10000;
        var_19 = abs( var_6[var_8].origin[2] - self.bot_defend_player_guarding.origin[2] ) < 50;

        if ( var_18 )
            var_15[var_15.size] = var_6[var_8];

        if ( var_19 )
            var_16[var_16.size] = var_6[var_8];

        if ( var_18 && var_19 )
            var_17[var_17.size] = var_6[var_8];

        if ( var_8 % 100 == 99 )
            wait 0.05;
    }

    if ( var_17.size > 0 )
        var_3 = self botnodepick( var_17, var_17.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );

    if ( !isdefined( var_3 ) )
    {
        wait 0.05;

        if ( var_16.size > 0 )
            var_3 = self botnodepick( var_16, var_16.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );

        if ( !isdefined( var_3 ) && var_15.size > 0 )
        {
            wait 0.05;
            var_3 = self botnodepick( var_15, var_15.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );
        }
    }

    return var_3;
}

bot_find_node_to_capture_point( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = getnodesinradius( var_0, var_1, 0, 500 );

    if ( var_4.size > 0 )
        var_3 = self botnodepick( var_4, var_4.size * 0.15, "node_capture", var_0, var_2, self._id_27B5 );

    return var_3;
}

bot_find_node_to_capture_zone( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
        var_2 = self botnodepick( var_0, var_0.size * 0.15, "node_capture", undefined, var_1, self._id_27B5 );

    return var_2;
}

bot_find_node_that_protects_point( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = getnodesinradius( var_0, var_1, 0, 500 );

    if ( var_3.size > 0 )
        var_2 = self botnodepick( var_3, var_3.size * 0.15, "node_protect", var_0, self._id_27B5 );

    return var_2;
}

bot_pick_random_point_in_radius( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;
    var_6 = getnodesinradius( var_0, var_1, 0, 500 );

    if ( isdefined( var_6 ) && var_6.size >= 2 )
        var_5 = bot_find_random_midpoint( var_6, var_2 );

    if ( !isdefined( var_5 ) )
    {
        if ( !isdefined( var_3 ) )
            var_3 = 0;

        if ( !isdefined( var_4 ) )
            var_4 = 1;

        var_7 = randomfloatrange( self.bot_defending_radius * var_3, self.bot_defending_radius * var_4 );
        var_8 = anglestoforward( ( 0, randomint( 360 ), 0 ) );
        var_5 = var_0 + var_8 * var_7;
    }

    return var_5;
}

bot_pick_random_point_from_set( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_1.size >= 2 )
        var_3 = bot_find_random_midpoint( var_1, var_2 );

    if ( !isdefined( var_3 ) )
    {
        var_4 = common_scripts\utility::_id_710E( var_1 );
        var_5 = var_4.origin - var_0;
        var_3 = var_0 + vectornormalize( var_5 ) * length( var_5 ) * randomfloat( 1.0 );
    }

    return var_3;
}

bot_find_random_midpoint( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = common_scripts\utility::array_randomize( var_0 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        for ( var_5 = var_4 + 1; var_5 < var_3.size; var_5++ )
        {
            var_6 = var_3[var_4];
            var_7 = var_3[var_5];

            if ( nodesvisible( var_6, var_7, 1 ) )
            {
                var_2 = ( ( var_6.origin[0] + var_7.origin[0] ) * 0.5, ( var_6.origin[1] + var_7.origin[1] ) * 0.5, ( var_6.origin[2] + var_7.origin[2] ) * 0.5 );

                if ( isdefined( var_1 ) && self [[ var_1 ]]( var_2 ) == 1 )
                    return var_2;
            }
        }
    }

    return var_2;
}

_id_27A8()
{
    if ( isdefined( self.bot_defending_override_origin_node ) )
        return self.bot_defending_override_origin_node.origin;
    else if ( isdefined( self.bot_defending_center ) )
        return self.bot_defending_center;

    return undefined;
}

bot_allowed_to_use_killstreaks()
{
    if ( maps\mp\_utility::_id_513B() )
        return 0;

    if ( bot_is_remote_or_linked() )
        return 0;

    if ( self isusingturret() )
        return 0;

    if ( isdefined( level._id_6273 ) )
        return 0;

    if ( isdefined( self._id_9A04 ) && self._id_9A04 )
        return 0;

    if ( isdefined( self._id_219B ) && self._id_219B )
        return 0;

    if ( self isoffhandweaponreadytothrow() )
        return 0;

    if ( maps\mp\_utility::_id_3FAA() > 0 )
    {
        var_0 = 1;

        foreach ( var_2 in level._id_669D )
        {
            if ( isalive( var_2 ) && !isalliedsentient( self, var_2 ) )
                var_0 = 0;
        }

        if ( var_0 )
            return 0;
    }

    if ( !bot_in_combat( 500 ) )
        return 1;

    if ( !isalive( self.enemy ) )
        return 1;

    return 0;
}

bot_recent_point_of_interest()
{
    var_0 = undefined;
    var_1 = botmemoryflags( "investigated", "killer_died" );
    var_2 = botmemoryflags( "investigated" );
    var_3 = common_scripts\utility::_id_710E( botgetmemoryevents( 0, gettime() - 10000, 1, "death", var_1, self ) );

    if ( isdefined( var_3 ) )
    {
        var_0 = var_3;
        self.bot_memory_goal_time = 10000;
    }
    else
    {
        var_4 = undefined;

        if ( self botgetscriptgoaltype() != "none" )
            var_4 = self botgetscriptgoal();

        var_5 = botgetmemoryevents( 0, gettime() - 45000, 1, "kill", var_2, self );
        var_6 = botgetmemoryevents( 0, gettime() - 45000, 1, "death", var_1, self );
        var_3 = common_scripts\utility::_id_710E( common_scripts\utility::array_combine( var_5, var_6 ) );

        if ( isdefined( var_3 ) > 0 && ( !isdefined( var_4 ) || distancesquared( var_4, var_3 ) > 1000000 ) )
        {
            var_0 = var_3;
            self.bot_memory_goal_time = 45000;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_7 = getzonenearest( var_0 );
        var_8 = getzonenearest( self.origin );

        if ( isdefined( var_7 ) && isdefined( var_8 ) && var_8 != var_7 )
        {
            var_9 = botzonegetcount( var_7, self.team, "ally" ) + botzonegetcount( var_7, self.team, "path_ally" );

            if ( var_9 > 1 )
                var_0 = undefined;
        }
    }

    if ( isdefined( var_0 ) )
        self.bot_memory_goal = var_0;

    return var_0;
}

bot_draw_cylinder( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

bot_draw_cylinder_think( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

bot_draw_circle( var_0, var_1, var_2, var_3, var_4 )
{

}

bot_get_total_gun_ammo()
{
    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self.weaponlist ) && self.weaponlist.size > 0 )
        var_1 = self.weaponlist;
    else
        var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_0 += self getweaponammoclip( var_3 );
        var_0 += self getweaponammostock( var_3 );
    }

    return var_0;
}

bot_out_of_ammo()
{
    var_0 = undefined;

    if ( isdefined( self.weaponlist ) && self.weaponlist.size > 0 )
        var_0 = self.weaponlist;
    else
        var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( self getweaponammoclip( var_2 ) > 0 )
            return 0;

        if ( self getweaponammostock( var_2 ) > 0 )
            return 0;
    }

    return 1;
}

bot_get_grenade_ammo()
{
    var_0 = 0;
    var_1 = self getweaponslistoffhands();

    foreach ( var_3 in var_1 )
        var_0 += self getweaponammostock( var_3 );

    return var_0;
}

bot_item_matches_purpose( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "trap_directional":
            switch ( var_1 )
            {
                case "h1_claymore_mp":
                    return 1;
            }

            break;
        case "c4":
            switch ( var_1 )
            {
                case "h1_c4_mp":
                    return 1;
            }

            break;
    }

    return 0;
}

bot_watch_nodes( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self notify( "bot_watch_nodes" );
    self endon( "bot_watch_nodes" );
    self endon( "bot_watch_nodes_stop" );
    self endon( "using_remote" );
    self endon( "disconnect" );
    self endon( "death" );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    wait 1.0;
    var_8 = 1;
    var_9 = squared( self botgetscriptgoalradius() );

    while ( var_8 )
    {
        if ( self bothasscriptgoal() && self _meth_8373() )
        {
            if ( distancesquared( self botgetscriptgoal(), self.origin ) < var_9 )
            {
                if ( length( self getvelocity() ) <= 1 )
                    var_8 = 0;
            }
        }

        if ( var_8 )
            wait 0.05;
    }

    var_10 = self.origin;
    var_11 = ( 0, 0, self _meth_82EF() );

    if ( isdefined( var_0 ) )
    {
        self._id_A1EA = [];

        foreach ( var_13 in var_0 )
        {
            var_14 = 0;

            if ( distance2dsquared( self.origin, var_13.origin ) <= 40 )
                var_14 = 1;

            var_15 = self geteye();
            var_16 = vectordot( ( 0.0, 0.0, 1.0 ), vectornormalize( var_13.origin + var_11 - var_15 ) );

            if ( abs( var_16 ) > 0.92 )
                var_14 = 1;

            if ( !var_14 )
                self._id_A1EA[self._id_A1EA.size] = var_13;
        }
    }

    if ( !isdefined( self._id_A1EA ) )
        return;

    thread _id_A1EB();
    self._id_A1EA = common_scripts\utility::array_randomize( self._id_A1EA );

    foreach ( var_13 in self._id_A1EA )
        var_13._id_A1E9[self._id_3314] = 1.0;

    var_20 = gettime();
    var_21 = var_20;
    var_22 = [];
    var_23 = undefined;

    if ( isdefined( var_1 ) )
        var_23 = ( 0, var_1, 0 );

    var_24 = isdefined( var_23 ) && isdefined( var_2 );
    var_25 = undefined;

    for (;;)
    {
        var_26 = gettime();
        self notify( "still_watching_nodes" );
        var_27 = self _meth_8371();

        if ( isdefined( var_3 ) && var_26 >= var_3 )
            return;

        if ( maps\mp\bots\_bots_strategy::bot_has_tactical_goal() )
        {
            self _meth_836B( undefined );
            wait 0.2;
            continue;
        }

        if ( !self bothasscriptgoal() || !self _meth_8373() )
        {
            wait 0.2;
            continue;
        }

        if ( isdefined( var_25 ) && var_25._id_A1E9[self._id_3314] == 0.0 )
            var_21 = var_26;

        if ( self._id_A1EA.size > 0 )
        {
            var_28 = 0;

            if ( isdefined( self.enemy ) )
            {
                var_29 = self _meth_81C5( self.enemy );
                var_30 = self _meth_81C4( self.enemy );

                if ( var_30 && var_26 - var_30 < 5000 )
                {
                    var_31 = vectornormalize( var_29 - self.origin );
                    var_32 = 0;

                    for ( var_33 = 0; var_33 < self._id_A1EA.size; var_33++ )
                    {
                        var_34 = vectornormalize( self._id_A1EA[var_33].origin - self.origin );
                        var_35 = vectordot( var_31, var_34 );

                        if ( var_35 > var_32 )
                        {
                            var_32 = var_35;
                            var_25 = self._id_A1EA[var_33];
                            var_28 = 1;
                        }
                    }
                }
            }

            if ( !var_28 && var_26 >= var_21 )
            {
                var_36 = [];

                for ( var_33 = 0; var_33 < self._id_A1EA.size; var_33++ )
                {
                    var_13 = self._id_A1EA[var_33];
                    var_37 = var_13 getnodenumber();

                    if ( var_24 && !common_scripts\utility::_id_A347( self.origin, var_23, var_13.origin, var_2 ) )
                        continue;

                    if ( distance2dsquared( self.origin, var_13.origin ) <= 10 )
                        continue;

                    if ( !isdefined( var_22[var_37] ) )
                        var_22[var_37] = 0;

                    if ( common_scripts\utility::_id_A347( self.origin, self getplayerangles(), var_13.origin, var_27 ) )
                        var_22[var_37] = var_26;

                    for ( var_38 = 0; var_38 < var_36.size; var_38++ )
                    {
                        if ( var_22[var_36[var_38] getnodenumber()] > var_22[var_37] )
                            break;
                    }

                    var_36 = common_scripts\utility::array_insert( var_36, var_13, var_38 );
                }

                var_25 = undefined;

                for ( var_33 = 0; var_33 < var_36.size; var_33++ )
                {
                    if ( randomfloat( 1 ) > var_36[var_33]._id_A1E9[self._id_3314] )
                        continue;

                    var_25 = var_36[var_33];
                    var_21 = var_26 + randomintrange( 3000, 5000 );
                    break;
                }
            }

            if ( isdefined( var_25 ) )
            {
                var_39 = var_25.origin + var_11;

                if ( distance2dsquared( self.origin, var_39 ) <= 10 )
                {
                    self _meth_836B( undefined );
                    var_25 = undefined;
                    var_21 = 0;
                }
                else
                    self _meth_836B( var_39, 0.4, "script_search" );
            }
        }

        wait 0.2;
    }
}

_id_A1EC()
{
    self notify( "bot_watch_nodes_stop" );

    if ( isdefined( self._id_A1EA ) )
    {
        foreach ( var_1 in self._id_A1EA )
            var_1._id_A1E9[self._id_3314] = undefined;
    }

    self._id_A1EA = undefined;
}

_id_A1EB()
{
    self notify( "watch_nodes_aborted" );
    self endon( "watch_nodes_aborted" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A073( 0.5, "still_watching_nodes" );

        if ( !isdefined( var_0 ) || var_0 != "still_watching_nodes" )
        {
            _id_A1EC();
            return;
        }
    }
}

bot_leader_dialog( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 != ( 0.0, 0.0, 0.0 ) )
    {
        if ( !common_scripts\utility::_id_A347( self.origin, self getplayerangles(), var_1, self _meth_8371() ) )
        {
            var_2 = self botpredictseepoint( var_1 );

            if ( isdefined( var_2 ) )
                self _meth_836B( var_2 + ( 0.0, 0.0, 40.0 ), 1.0, "script_seek" );
        }

        self botmemoryevent( "known_enemy", undefined, var_1 );
    }
}

bot_get_known_attacker( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1.classname ) )
    {
        if ( var_1.classname == "grenade" )
        {
            if ( isdefined( var_0 ) && var_0.classname == "worldspawn" )
                return undefined;

            if ( !bot_ent_is_anonymous_mine( var_1 ) )
                return var_0;
        }
        else if ( var_1.classname == "rocket" )
        {
            if ( isdefined( var_1._id_9CC4 ) )
                return var_1._id_9CC4;

            if ( isdefined( var_1.type ) && ( var_1.type == "remote" || var_1.type == "odin" ) )
                return var_1;

            if ( isdefined( var_1.owner ) )
                return var_1.owner;
        }
        else if ( var_1.classname == "worldspawn" || var_1.classname == "trigger_hurt" )
            return undefined;

        return var_1;
    }

    return var_0;
}

bot_ent_is_anonymous_mine( var_0 )
{
    var_1 = var_0._id_A2C6;

    if ( !isdefined( var_1 ) )
        var_1 = var_0._id_A2DF;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( issubstr( var_1, "c4_mp" ) )
        return 1;

    if ( issubstr( var_1, "claymore_mp" ) )
        return 1;

    if ( issubstr( var_1, "proximity_explosive_mp" ) )
        return 1;

    return 0;
}

bot_vectors_are_equal( var_0, var_1 )
{
    return var_0[0] == var_1[0] && var_0[1] == var_1[1] && var_0[2] == var_1[2];
}

bot_add_to_bot_level_targets( var_0 )
{
    var_0._id_488B = [];

    if ( var_0.bot_interaction_type == "use" )
        bot_add_to_bot_use_targets( var_0 );
    else if ( var_0.bot_interaction_type == "damage" )
        bot_add_to_bot_damage_targets( var_0 );
    else
    {

    }
}

bot_remove_from_bot_level_targets( var_0 )
{
    var_0.already_used = 1;
    level._id_56D1 = common_scripts\utility::array_remove( level._id_56D1, var_0 );
}

bot_add_to_bot_use_targets( var_0 )
{
    if ( !issubstr( var_0.code_classname, "trigger_use" ) )
        return;

    if ( !isdefined( var_0.target ) )
        return;

    if ( isdefined( var_0.bot_target ) )
        return;

    if ( !isdefined( var_0._id_9BE9 ) )
        return;

    var_1 = getnodearray( var_0.target, "targetname" );

    if ( var_1.size != 1 )
        return;

    var_0.bot_target = var_1[0];

    if ( !isdefined( level._id_56D1 ) )
        level._id_56D1 = [];

    level._id_56D1 = common_scripts\utility::array_add( level._id_56D1, var_0 );
}

bot_add_to_bot_damage_targets( var_0 )
{
    if ( !issubstr( var_0.code_classname, "trigger_damage" ) )
        return;

    var_1 = getnodearray( var_0.target, "targetname" );

    if ( var_1.size != 2 )
        return;

    var_0.bot_targets = var_1;

    if ( !isdefined( level._id_56D1 ) )
        level._id_56D1 = [];

    level._id_56D1 = common_scripts\utility::array_add( level._id_56D1, var_0 );
}

bot_get_string_index_for_integer( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_5, var_4 in var_0 )
    {
        if ( var_2 == var_1 )
            return var_5;

        var_2++;
    }

    return undefined;
}

bot_get_zones_within_dist( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_A3EF; var_2++ )
    {
        var_3 = getzonenodeforindex( var_2 );
        var_3._id_9E7E = 0;
    }

    var_4 = getzonenodeforindex( var_0 );
    return bot_get_zones_within_dist_recurs( var_4, var_1 );
}

bot_get_zones_within_dist_recurs( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = getnodezone( var_0 );
    var_0._id_9E7E = 1;
    var_3 = getlinkednodes( var_0 );

    foreach ( var_5 in var_3 )
    {
        if ( !var_5._id_9E7E )
        {
            var_6 = distance( var_0.origin, var_5.origin );

            if ( var_6 < var_1 )
            {
                var_7 = bot_get_zones_within_dist_recurs( var_5, var_1 - var_6 );
                var_2 = common_scripts\utility::array_combine( var_7, var_2 );
            }
        }
    }

    return var_2;
}

bot_crate_is_command_goal( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_20B9 ) && var_0._id_20B9;
}

bot_get_max_players_on_team( var_0 )
{
    return level.bot_max_players_on_team[var_0];
}

bot_get_team_limit()
{
    return int( bot_get_client_limit() / 2 );
}

bot_get_client_limit()
{
    var_0 = getdvarint( "party_maxplayers", 0 );
    var_0 = max( var_0, getdvarint( "party_maxPrivatePartyPlayers", 0 ) );

    if ( var_0 > level._id_5A29 )
        return level._id_5A29;

    return var_0;
}

bot_queued_process_level_thread()
{
    self notify( "bot_queued_process_level_thread" );
    self endon( "bot_queued_process_level_thread" );
    wait 0.05;

    for (;;)
    {
        if ( isdefined( level.bot_queued_process_queue ) && level.bot_queued_process_queue.size > 0 )
        {
            var_0 = level.bot_queued_process_queue[0];

            if ( isdefined( var_0 ) && isdefined( var_0.owner ) )
            {
                var_1 = undefined;

                if ( isdefined( var_0._id_6694 ) )
                    var_1 = var_0.owner [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692, var_0._id_6693, var_0._id_6694 );
                else if ( isdefined( var_0._id_6693 ) )
                    var_1 = var_0.owner [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692, var_0._id_6693 );
                else if ( isdefined( var_0._id_6692 ) )
                    var_1 = var_0.owner [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692 );
                else if ( isdefined( var_0._id_6691 ) )
                    var_1 = var_0.owner [[ var_0._id_3AE4 ]]( var_0._id_6691 );
                else
                    var_1 = var_0.owner [[ var_0._id_3AE4 ]]();

                var_0.owner notify( var_0._id_603E, var_1 );
            }

            var_2 = [];

            for ( var_3 = 1; var_3 < level.bot_queued_process_queue.size; var_3++ )
                var_2[var_3 - 1] = level.bot_queued_process_queue[var_3];

            level.bot_queued_process_queue = var_2;
        }

        wait 0.05;
    }
}

bot_queued_process( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level.bot_queued_process_queue ) )
        level.bot_queued_process_queue = [];

    foreach ( var_8, var_7 in level.bot_queued_process_queue )
    {
        if ( var_7.owner == self && var_7.name == var_0 )
        {
            self notify( var_7.name );
            level.bot_queued_process_queue[var_8] = undefined;
        }
    }

    var_7 = spawnstruct();
    var_7.owner = self;
    var_7.name = var_0;
    var_7._id_603E = var_7.name + "_done";
    var_7._id_3AE4 = var_1;
    var_7._id_6691 = var_2;
    var_7._id_6692 = var_3;
    var_7._id_6693 = var_4;
    var_7._id_6694 = var_5;
    level.bot_queued_process_queue[level.bot_queued_process_queue.size] = var_7;

    if ( !isdefined( level.bot_queued_process_level_thread_active ) )
    {
        level.bot_queued_process_level_thread_active = 1;
        level thread bot_queued_process_level_thread();
    }

    self waittill( var_7._id_603E, var_9 );
    return var_9;
}

bot_is_remote_or_linked()
{
    return maps\mp\_utility::_id_51E3() || self islinked();
}

bot_get_low_on_ammo( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self.weaponlist ) && self.weaponlist.size > 0 )
        var_1 = self.weaponlist;
    else
        var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_4 = weaponclipsize( var_3 );
        var_5 = self getweaponammostock( var_3 );

        if ( var_5 <= var_4 )
            return 1;

        if ( self getfractionmaxammo( var_3 ) <= var_0 )
            return 1;
    }

    return 0;
}

bot_point_is_on_pathgrid( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 256;

    if ( !isdefined( var_2 ) )
        var_2 = 50;

    var_3 = getnodesinradiussorted( var_0, var_1, 0, var_2, "Path" );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_0 + ( 0.0, 0.0, 30.0 );
        var_7 = var_5.origin + ( 0.0, 0.0, 30.0 );
        var_8 = physicstrace( var_6, var_7 );

        if ( bot_vectors_are_equal( var_8, var_7 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

bot_monitor_enemy_camp_spots( var_0 )
{
    level endon( "game_ended" );
    self notify( "bot_monitor_enemy_camp_spots" );
    self endon( "bot_monitor_enemy_camp_spots" );
    level._id_3205 = [];
    level._id_3204 = [];
    level._id_3203 = [];

    for (;;)
    {
        wait 1.0;
        var_1 = [];

        if ( !isdefined( var_0 ) )
            continue;

        foreach ( var_3 in level._id_669D )
        {
            if ( !isdefined( var_3.team ) )
                continue;

            if ( var_3 [[ var_0 ]]() && !isdefined( var_1[var_3.team] ) )
            {
                level._id_3203[var_3.team] = undefined;
                level._id_3205[var_3.team] = var_3 _meth_8432( 1 );

                if ( isdefined( level._id_3205[var_3.team] ) )
                {
                    if ( !isdefined( level._id_3204[var_3.team] ) || !common_scripts\utility::array_contains( level._id_3205[var_3.team], level._id_3204[var_3.team] ) )
                        level._id_3204[var_3.team] = common_scripts\utility::_id_710E( level._id_3205[var_3.team] );

                    if ( isdefined( level._id_3204[var_3.team] ) )
                    {
                        var_4 = [];

                        foreach ( var_6 in level._id_669D )
                        {
                            if ( !isdefined( var_6.team ) )
                                continue;

                            if ( var_6 [[ var_0 ]]() && var_6.team == var_3.team )
                                var_4[var_4.size] = var_6;
                        }

                        var_4 = sortbydistance( var_4, level._id_3204[var_3.team] );

                        if ( var_4.size > 0 )
                            level._id_3203[var_3.team] = var_4[0];
                    }
                }

                var_1[var_3.team] = 1;
            }
        }
    }
}

bot_valid_camp_assassin()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isai( self ) )
        return 0;

    if ( !isdefined( self.team ) )
        return 0;

    if ( self.team == "spectator" )
        return 0;

    if ( !isalive( self ) )
        return 0;

    if ( !maps\mp\_utility::_id_50B1( self ) )
        return 0;

    if ( !isdefined( self._id_67DF ) || self._id_67DF == "camper" )
        return 0;

    return 1;
}

bot_update_camp_assassin()
{
    if ( !isdefined( level._id_3203 ) )
        return;

    if ( !isdefined( level._id_3203[self.team] ) )
        return;

    if ( level._id_3203[self.team] == self )
    {
        maps\mp\bots\_bots_strategy::bot_defend_stop();
        self _meth_8352( level._id_3204[self.team], 128, "objective", undefined, 256 );
        bot_waittill_goal_or_fail();
    }
}

bot_force_stance_for_time( var_0, var_1 )
{
    self notify( "bot_force_stance_for_time" );
    self endon( "bot_force_stance_for_time" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self botsetstance( var_0 );
    wait(var_1);
    self botsetstance( "none" );
}

bot_disable_movement_for_time( var_0 )
{
    self notify( "bot_disable_movement_for_time" );
    self endon( "bot_disable_movement_for_time" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self botsetflag( "disable_movement", 1 );
    wait(var_0);
    self botsetflag( "disable_movement", 0 );
}

bot_get_active_and_stowed_weapons()
{
    var_0["active"] = self getcurrentweapon();

    if ( weaponclass( var_0["active"] ) == "rocketlauncher" || !maps\mp\gametypes\_weapons::_id_5185( var_0["active"] ) )
        var_0["active"] = common_scripts\utility::_id_3FFD();

    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 != var_0["active"] )
            var_0["stowed"] = var_3;
    }

    return var_0;
}
