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

_id_15ED()
{
    var_0 = _id_15EC( self._id_24BD );

    if ( isdefined( var_0 ) && var_0.size > 0 )
        return common_scripts\utility::_id_710E( var_0 ).owner_not;

    return undefined;
}

_id_15EC( var_0, var_1 )
{
    if ( isdefined( self._id_27A3 ) )
        return maps\mp\bots\_bots_util::_id_162D( var_0, self._id_27A3, var_1 );

    return [];
}

_id_162B( var_0, var_1, var_2 )
{
    if ( self _meth_8379( "allowGrenades" ) == 0 )
        return undefined;

    var_3 = [];
    var_3[var_3.size] = var_0;

    if ( isdefined( var_1 ) )
        var_3[var_3.size] = var_1;

    if ( isdefined( var_1 ) )
        var_3[var_3.size] = var_2;

    if ( var_3.size == 0 )
        return undefined;

    var_4 = self _meth_82CC();
    var_5 = [];

    foreach ( var_7 in var_4 )
    {
        if ( self _meth_82F5( var_7 ) > 0 || self _meth_82F6( var_7 ) > 0 )
            var_5[var_5.size] = var_7;
    }

    if ( var_5.size <= 0 )
        return undefined;

    foreach ( var_10 in var_3 )
    {
        foreach ( var_7 in var_5 )
        {
            if ( maps\mp\bots\_bots_util::bot_item_matches_purpose( var_10, var_7 ) )
            {
                var_12["purpose"] = var_10;

                if ( isweaponmanuallydetonatedbyemptythrow( var_7 ) || isweaponmanuallydetonatedbydoubletap( var_7 ) )
                    var_12["item_action"] = "throw";
                else
                    var_12["item_action"] = "attack";

                var_12["weap_name"] = var_7;
                return var_12;
            }
        }
    }
}

_id_16E8( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "bot_set_ambush_trap" );
    self endon( "bot_set_ambush_trap" );

    if ( !isdefined( var_0 ) )
        return 0;

    var_5 = undefined;

    if ( !isdefined( var_4 ) && isdefined( var_1 ) && var_1.size > 0 )
    {
        if ( !isdefined( var_2 ) )
            return 0;

        var_6 = [];
        var_7 = undefined;

        if ( isdefined( var_3 ) )
            var_7 = anglestoforward( ( 0, var_3, 0 ) );

        foreach ( var_9 in var_1 )
        {
            if ( !isdefined( var_7 ) )
            {
                var_6[var_6.size] = var_9;
                continue;
            }

            if ( distancesquared( var_9.owner_not, var_2.owner_not ) > 90000 )
            {
                if ( vectordot( var_7, vectornormalize( var_9.owner_not - var_2.owner_not ) ) < 0.4 )
                    var_6[var_6.size] = var_9;
            }
        }

        if ( var_6.size > 0 )
        {
            var_5 = common_scripts\utility::_id_710E( var_6 );
            var_11 = getnodesinradius( var_5.owner_not, 300, 50 );
            var_12 = [];

            foreach ( var_14 in var_11 )
            {
                if ( !isdefined( var_14._id_15AC ) )
                    var_12[var_12.size] = var_14;
            }

            var_11 = var_12;
            var_4 = self _meth_8362( var_11, min( var_11.size, 3 ), "node_trap", var_2, var_5 );
        }
    }

    if ( isdefined( var_4 ) )
    {
        var_16 = undefined;

        if ( var_0["purpose"] == "trap_directional" && isdefined( var_5 ) )
        {
            var_17 = vectortoangles( var_5.owner_not - var_4.owner_not );
            var_16 = var_17[1];
        }

        if ( self _meth_8363() && self _meth_835B() != "critical" && self _meth_835B() != "tactical" )
            self _meth_8354();

        var_18 = self _meth_8353( var_4, "guard", var_16 );

        if ( var_18 )
        {
            var_19 = maps\mp\bots\_bots_util::_id_172E();

            if ( var_19 == "goal" )
            {
                thread maps\mp\bots\_bots_util::_id_161A( "stand", 4.0 );

                if ( !isdefined( self.enemy ) || !self _meth_836D( self.enemy ) )
                {
                    thread maps\mp\bots\_bots_util::bot_disable_movement_for_time( 4.0 );
                    var_20 = ( 0, 0, 0 );

                    if ( var_0["weap_name"] == "h1_claymore_mp" )
                        var_20 = ( 0, 0, 55 );

                    if ( isdefined( var_16 ) )
                        self _meth_836B( var_5.owner_not + var_20, 3.0, "script_forced" );
                    else
                        self _meth_836B( self.owner_not + var_20 + anglestoforward( self _meth_8338() ) * 50, 3.0, "script_forced" );

                    self _meth_8312( var_0["weap_name"] );

                    while ( self _meth_830E() != var_0["weap_name"] )
                        wait 0.05;

                    bot_try_use_ambush_item( var_0["item_action"] );
                    self._id_0B66 = undefined;
                    thread _id_16E9( "grenade_fire" );
                    thread _id_16E9( "missile_fire" );
                    var_21 = common_scripts\utility::_id_9294( var_0["purpose"] == "tacticalinsertion", 6.0, 3.0 );
                    common_scripts\utility::_id_A073( var_21, "missile_fire", "grenade_fire" );
                    wait 0.05;
                    self notify( "ambush_trap_ent" );

                    if ( isdefined( self._id_0B66 ) && var_0["purpose"] == "c4" )
                        thread bot_watch_c4_detonate( self._id_0B66, 300 );

                    self._id_0B66 = undefined;
                    wait(randomfloat( 0.25 ));
                    self notify( "bot_force_stance_for_time" );
                    self _meth_8350( "none" );
                    self _meth_8312( "none" );
                    self notify( "bot_disable_movement_for_time" );
                    self _meth_834F( "disable_movement", 0 );
                    self _meth_836B( undefined );
                }
            }

            return 1;
        }
    }

    return 0;
}

bot_try_use_ambush_item( var_0 )
{
    self endon( "grenade_pullback" );

    for (;;)
    {
        self _meth_837C( var_0 );
        wait 0.5;
    }
}

_id_16E9( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "bot_set_ambush_trap" );
    self endon( "ambush_trap_ent" );
    level endon( "game_ended" );
    self waittill( var_0, var_1 );
    self._id_0B66 = var_1;
}

bot_watch_c4_detonate( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_2 = var_1 * var_1;

    for (;;)
    {
        if ( distancesquared( self.owner_not, var_0.owner_not ) > var_2 )
        {
            var_3 = self _meth_817A( var_0.owner_not, 1.0 );

            if ( var_3 < var_2 )
            {
                self _meth_837C( "use", 0.25 );
                wait 0.5;
                self _meth_837C( "use", 0.25 );
                return;
            }
        }

        wait(randomfloatrange( 0.25, 1.0 ));
    }
}

_id_15D1( var_0, var_1, var_2 )
{
    thread _id_15F0( var_0, var_1, "capture", var_2 );
}

_id_15D2( var_0, var_1, var_2, var_3 )
{
    var_3["capture_trigger"] = var_2;
    thread _id_15F0( var_0, var_1, "capture_zone", var_3 );
}

_id_16C2( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 12;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 18;

    thread _id_15F0( var_0, var_1, "protect", var_2 );
}

_id_16AD( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 0.0;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 0.01;

    thread _id_15F0( var_0, var_1, "patrol", var_2 );
}

_id_1646( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 15;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 20;

    thread _id_15F0( var_0, var_1, "bodyguard", var_2 );
}

_id_15F0( var_0, var_1, var_2, var_3 )
{
    self notify( "started_bot_defend_think" );
    self endon( "started_bot_defend_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "defend_stop" );
    thread _id_27B0();

    if ( isdefined( self._id_15F1 ) || self _meth_835B() == "camp" )
        self _meth_8354();

    self._id_15F1 = 1;
    self._id_15F7 = var_2;

    if ( var_2 == "capture_zone" )
    {
        self._id_15F5 = undefined;
        self._id_15F3 = var_1;
        self._id_15F6 = var_3["capture_trigger"];
    }
    else
    {
        self._id_15F5 = var_1;
        self._id_15F3 = undefined;
        self._id_15F6 = undefined;
    }

    if ( maps\mp\_utility::_id_5112( var_0 ) )
    {
        self._id_15EE = var_0;
        childthread _id_5D82();
    }
    else
    {
        self._id_15EE = undefined;
        self._id_15F2 = var_0;
    }

    self _meth_8350( "none" );
    var_4 = undefined;
    var_5 = 6;
    var_6 = 10;
    self._id_27B5 = [];

    if ( isdefined( var_3 ) )
    {
        self._id_27A3 = var_3["entrance_points_index"];
        self._id_15F4 = var_3["override_origin_node"];

        if ( isdefined( var_3["score_flags"] ) )
        {
            if ( isarray( var_3["score_flags"] ) )
                self._id_27B5 = var_3["score_flags"];
            else
                self._id_27B5[0] = var_3["score_flags"];
        }

        if ( isdefined( var_3["override_goal_type"] ) )
            var_4 = var_3["override_goal_type"];

        if ( isdefined( var_3["min_goal_time"] ) )
            var_5 = var_3["min_goal_time"];

        if ( isdefined( var_3["max_goal_time"] ) )
            var_6 = var_3["max_goal_time"];

        if ( isdefined( var_3["override_entrances"] ) && var_3["override_entrances"].size > 0 )
        {
            self._id_27B4 = var_3["override_entrances"];
            self._id_27A3 = self.nearz + " " + gettime();

            foreach ( var_8 in self._id_27B4 )
            {
                var_8._id_7020[self._id_27A3] = maps\mp\bots\_bots_util::_id_332B( var_8.owner_not, maps\mp\bots\_bots_util::_id_27A8(), "prone" );
                wait 0.05;
                var_8._id_2480[self._id_27A3] = maps\mp\bots\_bots_util::_id_332B( var_8.owner_not, maps\mp\bots\_bots_util::_id_27A8(), "crouch" );
                wait 0.05;
            }
        }

        self._id_27A6 = var_3["objective_radius"];
    }

    if ( !isdefined( self._id_15EE ) )
    {
        var_10 = undefined;

        if ( isdefined( var_3 ) && isdefined( var_3["nearest_node_to_center"] ) )
            var_10 = var_3["nearest_node_to_center"];

        if ( !isdefined( var_10 ) && isdefined( self._id_15F4 ) )
            var_10 = self._id_15F4;

        if ( !isdefined( var_10 ) && isdefined( self._id_15F6 ) && isdefined( self._id_15F6._id_6071 ) )
            var_10 = self._id_15F6._id_6071;

        if ( !isdefined( var_10 ) )
            var_10 = getclosestnodeinsight( maps\mp\bots\_bots_util::_id_27A8() );

        if ( !isdefined( var_10 ) )
        {
            var_11 = maps\mp\bots\_bots_util::_id_27A8();
            var_12 = getnodesinradiussorted( var_11, 256, 0 );

            for ( var_13 = 0; var_13 < var_12.size; var_13++ )
            {
                var_14 = vectornormalize( var_12[var_13].owner_not - var_11 );
                var_15 = var_11 + var_14 * 15;

                if ( sighttracepassed( var_15, var_12[var_13].owner_not, 0, undefined ) )
                {
                    var_10 = var_12[var_13];
                    break;
                }

                wait 0.05;

                if ( sighttracepassed( var_15 + ( 0, 0, 55 ), var_12[var_13].owner_not + ( 0, 0, 55 ), 0, undefined ) )
                {
                    var_10 = var_12[var_13];
                    break;
                }

                wait 0.05;
            }
        }

        self._id_6122 = var_10;
    }

    var_16 = level._id_1611[var_2];

    if ( !isdefined( var_4 ) )
    {
        var_4 = "guard";

        if ( var_2 == "capture" || var_2 == "capture_zone" )
            var_4 = "objective";
    }

    var_17 = maps\mp\bots\_bots_util::_id_165A();

    if ( var_2 == "protect" )
        childthread _id_7040();

    for (;;)
    {
        self._id_6F38 = self._id_24BB;
        self._id_24BB = undefined;
        self._id_24BA = undefined;
        self._id_24BC = undefined;
        var_18 = isdefined( var_3["entrance_points_index"] ) && isarray( var_3["entrance_points_index"] );
        self._id_24BD = _id_19C9( var_17, var_18 );
        var_19 = self _meth_835B();
        var_20 = maps\mp\bots\_bots_util::_id_1644( var_4, var_19 );

        if ( !var_20 )
        {
            wait 0.25;
            continue;
        }

        var_21 = var_5;
        var_22 = var_6;
        var_23 = 1;

        if ( isdefined( self._id_27B3 ) )
        {
            self._id_24BC = self._id_27B3;
            self._id_27B3 = undefined;
            var_23 = 0;
            var_21 = 1.0;
            var_22 = 2.0;
        }
        else if ( isdefined( self._id_27B1 ) )
        {
            self._id_24BB = self._id_27B1;
            self._id_27B1 = undefined;
        }
        else
        {
            if ( isdefined( level._id_0886 ) && level._id_0886[self.team] )
            {
                if ( !common_scripts\utility::_id_0CE4( self._id_27B5, "avoid_aerial_enemies" ) )
                    self._id_27B5[self._id_27B5.size] = "avoid_aerial_enemies";
            }

            self [[ var_16 ]]();
        }

        self _meth_8354();
        var_24 = "";

        if ( isdefined( self._id_24BB ) || isdefined( self._id_24BC ) )
        {
            if ( var_23 && maps\mp\bots\_bots_util::_id_1662() && !isplayer( var_0 ) && isdefined( self._id_27A3 ) )
            {
                var_25 = _id_162B( "trap_directional", "trap", "c4" );

                if ( isdefined( var_25 ) )
                {
                    var_26 = maps\mp\bots\_bots_util::_id_162D( undefined, self._id_27A3 );
                    _id_16E8( var_25, var_26, self._id_6122 );
                }
            }

            if ( isdefined( self._id_24BC ) )
            {
                var_27 = undefined;

                if ( isdefined( self._id_24BA ) )
                    var_27 = self._id_24BA[1];

                self _meth_8352( self._id_24BC, 0, var_4, var_27, self._id_27A6 );
            }
            else if ( !isdefined( self._id_24BA ) )
                self _meth_8353( self._id_24BB, var_4, undefined, self._id_27A6 );
            else
                self _meth_8353( self._id_24BB, var_4, self._id_24BA[1], self._id_27A6 );

            if ( var_17 )
            {
                if ( !isdefined( self._id_6F38 ) || !isdefined( self._id_24BB ) || self._id_6F38 != self._id_24BB )
                    self _meth_8350( "none" );
            }

            var_28 = self _meth_8358();
            self notify( "new_defend_goal" );
            maps\mp\bots\_bots_util::_id_A1EC();

            if ( var_4 == "objective" )
            {
                _id_27AF();
                self _meth_8372( 1.0 );
                self _meth_834F( "cautious", 0 );
            }

            if ( self _meth_8363() )
            {
                var_29 = self _meth_8358();

                if ( maps\mp\bots\_bots_util::_id_172A( var_29, var_28 ) )
                    var_24 = maps\mp\bots\_bots_util::_id_172E( 20, "defend_force_node_recalculation" );
            }

            if ( var_24 == "goal" )
            {
                if ( var_17 )
                    self _meth_8350( self._id_24BD );

                childthread _id_27B6();
            }
        }

        if ( var_24 != "goal" )
        {
            wait 0.25;
            continue;
        }

        var_30 = randomfloatrange( var_21, var_22 );
        var_24 = common_scripts\utility::_id_A073( var_30, "node_relinquished", "goal_changed", "script_goal_changed", "defend_force_node_recalculation", "bad_path" );

        if ( ( var_24 == "node_relinquished" || var_24 == "bad_path" || var_24 == "goal_changed" || var_24 == "script_goal_changed" ) && ( self._id_24BD == "crouch" || self._id_24BD == "prone" ) )
            self _meth_8350( "none" );
    }
}

_id_19C9( var_0, var_1 )
{
    var_2 = "stand";

    if ( var_0 )
    {
        var_3 = 100;
        var_4 = 0;
        var_5 = 0;
        var_6 = self _meth_8379( "strategyLevel" );

        if ( var_6 == 1 )
        {
            var_3 = 20;
            var_4 = 25;
            var_5 = 55;
        }
        else if ( var_6 >= 2 )
        {
            var_3 = 10;
            var_4 = 20;
            var_5 = 70;
        }

        var_7 = randomint( 100 );

        if ( var_7 < var_4 )
            var_2 = "crouch";
        else if ( var_7 < var_4 + var_5 )
            var_2 = "prone";

        var_8 = !isdefined( var_1 ) || !var_1;

        if ( var_8 && var_2 == "prone" )
        {
            var_9 = _id_15EC( "prone" );
            var_10 = _id_27A5( "prone" );

            if ( var_10.size >= var_9.size )
                var_2 = "crouch";
        }

        if ( var_8 && var_2 == "crouch" )
        {
            var_11 = _id_15EC( "crouch" );
            var_12 = _id_27A5( "crouch" );

            if ( var_12.size >= var_11.size )
                var_2 = "stand";
        }
    }

    return var_2;
}

_id_847B( var_0 )
{
    var_1 = 1250;
    var_2 = var_1 * var_1;

    if ( var_0 )
    {
        if ( self _meth_8379( "strategyLevel" ) == 0 )
            return 0;

        if ( self._id_15F7 == "capture_zone" && self _meth_80AB( self._id_15F6 ) )
            return 0;

        return distancesquared( self.owner_not, self._id_15F2 ) > var_2 * 0.75 * 0.75;
    }
    else if ( self _meth_8373() && distancesquared( self.owner_not, self._id_15F2 ) < var_2 )
    {
        var_3 = self _meth_837A();
        return 0 <= var_3 && var_3 <= var_1;
    }
    else
        return 0;
}

_id_8158( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( isdefined( var_1 ) )
        var_2.owner_not = var_1;
    else
        var_2.owner_not = var_0.owner_not;

    var_2.node_relinquished = var_0;
    var_2._id_3A11 = 0;
    return var_2;
}

_id_27AF()
{
    self notify( "defense_cautious_approach" );
    self endon( "defense_cautious_approach" );
    level endon( "game_ended" );
    self endon( "defend_force_node_recalculation" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "defend_stop" );
    self endon( "started_bot_defend_think" );

    if ( ![[ level._id_161B["should_start_cautious_approach"] ]]( 1 ) )
        return;

    var_0 = self _meth_8358();
    var_1 = self _meth_8374();
    var_2 = 1;
    var_3 = 0.2;

    while ( var_2 )
    {
        wait 0.25;

        if ( !self _meth_8363() )
            return;

        var_4 = self _meth_8358();

        if ( !maps\mp\bots\_bots_util::_id_172A( var_0, var_4 ) )
            return;

        var_3 += 0.25;

        if ( var_3 >= 0.5 )
        {
            var_3 = 0.0;

            if ( [[ level._id_161B["should_start_cautious_approach"] ]]( 0 ) )
                var_2 = 0;
        }
    }

    self _meth_8372( 1.8 );
    self _meth_834F( "cautious", 1 );
    var_5 = self _meth_836E();

    if ( !isdefined( var_5 ) || var_5.size <= 2 )
        return;

    self._id_57FD = [];
    var_6 = 1000;

    if ( isdefined( level._id_703F ) )
        var_6 = level._id_703F;

    var_7 = var_6 * var_6;
    var_8 = getnodesinradius( self._id_15F2, var_6, 0, 500 );

    if ( var_8.size <= 0 )
        return;

    var_9 = 5 + self _meth_8379( "strategyLevel" ) * 2;
    var_10 = int( min( var_9, var_8.size ) );
    var_11 = self _meth_836F( var_8, 15, var_10, "node_protect", maps\mp\bots\_bots_util::_id_27A8(), "ignore_occupancy" );

    for ( var_12 = 0; var_12 < var_11.size; var_12++ )
    {
        var_13 = _id_8158( var_11[var_12] );
        self._id_57FD = common_scripts\utility::_id_0CDA( self._id_57FD, var_13 );
    }

    var_14 = botgetmemoryevents( 0, gettime() - 60000, 1, "death", 0, self );

    foreach ( var_16 in var_14 )
    {
        if ( distancesquared( var_16, self._id_15F2 ) < var_7 )
        {
            var_17 = getclosestnodeinsight( var_16 );

            if ( isdefined( var_17 ) )
            {
                var_13 = _id_8158( var_17, var_16 );
                self._id_57FD = common_scripts\utility::_id_0CDA( self._id_57FD, var_13 );
            }
        }
    }

    if ( isdefined( self._id_27A3 ) )
    {
        var_19 = maps\mp\bots\_bots_util::_id_162D( "stand", self._id_27A3 );

        for ( var_12 = 0; var_12 < var_19.size; var_12++ )
        {
            var_13 = _id_8158( var_19[var_12] );
            self._id_57FD = common_scripts\utility::_id_0CDA( self._id_57FD, var_13 );
        }
    }

    if ( self._id_57FD.size == 0 )
        return;

    childthread _id_5D70();
    var_20 = self _meth_835B();
    var_21 = self _meth_8359();
    var_22 = self _meth_835A();
    wait 0.05;

    for ( var_23 = 1; var_23 < var_5.size - 2; var_23++ )
    {
        maps\mp\bots\_bots_util::_id_172F();
        var_24 = getlinkednodes( var_5[var_23] );

        if ( var_24.size == 0 )
            continue;

        var_25 = [];

        for ( var_12 = 0; var_12 < var_24.size; var_12++ )
        {
            if ( !common_scripts\utility::_id_A347( self.owner_not, self _meth_8338(), var_24[var_12].owner_not, 0 ) )
                continue;

            for ( var_26 = 0; var_26 < self._id_57FD.size; var_26++ )
            {
                var_16 = self._id_57FD[var_26];

                if ( nodesvisible( var_16.node_relinquished, var_24[var_12], 1 ) )
                {
                    var_25 = common_scripts\utility::_id_0CDA( var_25, var_24[var_12] );
                    var_26 = self._id_57FD.size;
                }
            }
        }

        if ( var_25.size == 0 )
            continue;

        var_27 = self _meth_8362( var_25, 1 + var_25.size * 0.15, "node_hide" );

        if ( isdefined( var_27 ) )
        {
            var_28 = [];

            for ( var_12 = 0; var_12 < self._id_57FD.size; var_12++ )
            {
                if ( nodesvisible( self._id_57FD[var_12].node_relinquished, var_27, 1 ) )
                {
                    if ( distance2dsquared( self._id_57FD[var_12].owner_not, var_27.owner_not ) > 3600 )
                        var_28 = common_scripts\utility::_id_0CDA( var_28, self._id_57FD[var_12] );
                }
            }

            self _meth_8354();
            self _meth_8353( var_27, "critical" );
            childthread _id_5D71();
            var_29 = maps\mp\bots\_bots_util::_id_172E( undefined, "cautious_approach_early_out" );
            self notify( "stop_cautious_approach_early_out_monitor" );

            if ( var_29 == "cautious_approach_early_out" )
                break;

            if ( var_29 == "goal" )
            {
                for ( var_12 = 0; var_12 < var_28.size; var_12++ )
                {
                    if ( distance2dsquared( self.owner_not, var_28[var_12].owner_not ) < 1600 )
                        continue;

                    for ( var_30 = 0; var_28[var_12]._id_3A11 < 18 && var_30 < 3.6; var_30 += 0.25 )
                    {
                        self _meth_836B( var_28[var_12].owner_not + ( 0, 0, self _meth_82EF() ), 0.25, "script_search" );
                        wait 0.25;
                    }
                }
            }
        }

        wait 0.05;
    }

    self notify( "stop_location_monitoring" );
    self _meth_8354();

    if ( isdefined( var_1 ) )
        self _meth_8353( var_1, var_20, var_22 );
    else
        self _meth_8352( self._id_24BC, var_21, var_20, var_22 );
}

_id_5D71()
{
    self endon( "cautious_approach_early_out" );
    self endon( "stop_cautious_approach_early_out_monitor" );
    var_0 = undefined;

    if ( isdefined( self._id_15F5 ) )
        var_0 = self._id_15F5 * self._id_15F5;
    else if ( isdefined( self._id_15F3 ) )
    {
        var_1 = _id_15D3();
        var_0 = var_1 * var_1;
    }

    wait 0.05;

    for (;;)
    {
        if ( distancesquared( self.owner_not, self._id_15F2 ) < var_0 )
            self notify( "cautious_approach_early_out" );

        wait 0.05;
    }
}

_id_5D70()
{
    self endon( "stop_location_monitoring" );
    var_0 = 10000;

    for (;;)
    {
        var_1 = self _meth_8385();

        if ( isdefined( var_1 ) )
        {
            var_2 = self _meth_8371();

            for ( var_3 = 0; var_3 < self._id_57FD.size; var_3++ )
            {
                if ( nodesvisible( var_1, self._id_57FD[var_3].node_relinquished, 1 ) )
                {
                    var_4 = common_scripts\utility::_id_A347( self.owner_not, self _meth_8338(), self._id_57FD[var_3].owner_not, var_2 );
                    var_5 = !var_4 || self._id_57FD[var_3]._id_3A11 < 17;

                    if ( var_5 && distancesquared( self.owner_not, self._id_57FD[var_3].owner_not ) < var_0 )
                    {
                        var_4 = 1;
                        self._id_57FD[var_3]._id_3A11 = 18;
                    }

                    if ( var_4 )
                    {
                        self._id_57FD[var_3]._id_3A11++;

                        if ( self._id_57FD[var_3]._id_3A11 >= 18 )
                        {
                            self._id_57FD[var_3] = self._id_57FD[self._id_57FD.size - 1];
                            self._id_57FD[self._id_57FD.size - 1] = undefined;
                            var_3--;
                        }
                    }
                }
            }
        }

        wait 0.05;
    }
}

_id_7040()
{
    self notify( "protect_watch_allies" );
    self endon( "protect_watch_allies" );
    var_0 = [];
    var_1 = 1050;
    var_2 = var_1 * var_1;
    var_3 = 900;

    if ( isdefined( level._id_703F ) )
        var_3 = level._id_703F;

    for (;;)
    {
        var_4 = gettime();
        var_5 = _id_1640( self._id_15F2, var_3 );

        foreach ( var_7 in var_5 )
        {
            var_8 = var_7._id_3314;

            if ( !isdefined( var_8 ) )
                var_8 = var_7 _meth_81B5();

            if ( !isdefined( var_0[var_8] ) )
                var_0[var_8] = var_4 - 1;

            if ( !isdefined( var_7._id_5537 ) )
                var_7._id_5537 = var_4 - 10001;

            if ( var_7.helmet == 0 && isdefined( var_7._id_2671 ) && var_4 - var_7._id_2671 < 5000 )
            {
                if ( var_4 - var_7._id_5537 > 10000 && var_4 > var_0[var_8] )
                {
                    if ( isdefined( var_7.laststand ) && isdefined( var_7.laststand.team ) && var_7.laststand.team == common_scripts\utility::_id_3D4F( self.team ) )
                    {
                        if ( distancesquared( var_7.body.owner_not, self.owner_not ) < var_2 )
                        {
                            self _meth_8375( var_7.laststand, var_7.body.owner_not );
                            var_9 = getclosestnodeinsight( var_7.body.owner_not );

                            if ( isdefined( var_9 ) )
                            {
                                self._id_27B3 = var_9.owner_not;
                                self notify( "defend_force_node_recalculation" );
                            }

                            var_7._id_5537 = var_4;
                        }

                        var_0[var_8] = var_4 + 10000;
                    }
                }
            }
        }

        wait(( randomint( 5 ) + 1 ) * 0.05);
    }
}

_id_27B2()
{
    if ( isdefined( self._id_27B4 ) )
        return self._id_27B4;
    else if ( maps\mp\bots\_bots_util::_id_165A() )
        return _id_15EC( self._id_24BD, 1 );
    else if ( maps\mp\bots\_bots_util::_id_1662() || maps\mp\bots\_bots_util::_id_1659() )
    {
        var_0 = findentrances( self.owner_not );
        return var_0;
    }
}

_id_27B6()
{
    self notify( "defense_watch_entrances_at_goal" );
    self endon( "defense_watch_entrances_at_goal" );
    self endon( "new_defend_goal" );
    self endon( "script_goal_changed" );
    var_0 = self _meth_8385();
    var_1 = undefined;

    if ( maps\mp\bots\_bots_util::_id_165A() )
    {
        var_2 = _id_27B2();
        var_1 = [];

        if ( isdefined( var_0 ) )
        {
            foreach ( var_4 in var_2 )
            {
                if ( nodesvisible( var_0, var_4, 1 ) )
                    var_1 = common_scripts\utility::_id_0CDA( var_1, var_4 );
            }
        }

        if ( var_1.size == 0 )
            var_1 = findentrances( self.owner_not );
    }
    else if ( maps\mp\bots\_bots_util::_id_1662() || maps\mp\bots\_bots_util::_id_1659() )
    {
        var_1 = _id_27B2();

        if ( isdefined( var_0 ) && !issubstr( self _meth_830E(), "riotshield" ) )
        {
            if ( nodesvisible( var_0, self._id_6122, 1 ) )
                var_1 = common_scripts\utility::_id_0CDA( var_1, self._id_6122 );
        }
    }

    if ( isdefined( var_1 ) )
    {
        childthread maps\mp\bots\_bots_util::_id_1736( var_1 );

        if ( maps\mp\bots\_bots_util::_id_1659() )
            childthread _id_16A7();
        else
            childthread _id_16A6();
    }
}

_id_16A6()
{
    self notify( "bot_monitor_watch_entrances_at_goal" );
    self endon( "bot_monitor_watch_entrances_at_goal" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );

    while ( !isdefined( self._id_A1EA ) )
        wait 0.05;

    var_0 = level._id_161B["get_watch_node_chance"];

    for (;;)
    {
        var_1 = 0.8;
        var_2 = 1.0;

        if ( common_scripts\utility::_id_0CE4( self._id_27B5, "strict_los" ) )
        {
            var_1 = 1.0;
            var_2 = 0.5;
        }

        foreach ( var_4 in self._id_A1EA )
        {
            if ( var_4 == self._id_6122 )
            {
                var_4._id_A1E9[self._id_3314] = var_1;
                continue;
            }

            var_4._id_A1E9[self._id_3314] = var_2;
        }

        var_6 = isdefined( var_0 );

        if ( !var_6 )
            _id_6FBD( 0.5 );

        foreach ( var_4 in self._id_A1EA )
        {
            if ( var_6 )
            {
                var_8 = self [[ var_0 ]]( var_4 );
                var_4._id_A1E9[self._id_3314] *= var_8;
            }

            if ( _id_332E( var_4 ) )
                var_4._id_A1E9[self._id_3314] *= 0.5;
        }

        wait(randomfloatrange( 0.5, 0.75 ));
    }
}

_id_16A7()
{
    self notify( "bot_monitor_watch_entrances_bodyguard" );
    self endon( "bot_monitor_watch_entrances_bodyguard" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );

    while ( !isdefined( self._id_A1EA ) )
        wait 0.05;

    for (;;)
    {
        var_0 = anglestoforward( self._id_15EE _meth_8338() ) * ( 1, 1, 0 );
        var_0 = vectornormalize( var_0 );

        foreach ( var_2 in self._id_A1EA )
        {
            var_2._id_A1E9[self._id_3314] = 1.0;
            var_3 = var_2.owner_not - self._id_15EE.owner_not;
            var_3 = vectornormalize( var_3 );
            var_4 = vectordot( var_0, var_3 );

            if ( var_4 > 0.6 )
                var_2._id_A1E9[self._id_3314] *= 0.33;
            else if ( var_4 > 0 )
                var_2._id_A1E9[self._id_3314] *= 0.66;

            if ( !_id_332A( var_2 ) )
                var_2._id_A1E9[self._id_3314] *= 0.5;
        }

        wait(randomfloatrange( 0.4, 0.6 ));
    }
}

_id_332A( var_0 )
{
    var_1 = getnodezone( var_0 );
    var_2 = vectornormalize( var_0.owner_not - self.owner_not );

    for ( var_3 = 0; var_3 < level._id_A3EF; var_3++ )
    {
        if ( botzonegetcount( var_3, self.team, "enemy_predict" ) > 0 )
        {
            if ( isdefined( var_1 ) && var_3 == var_1 )
                return 1;
            else
            {
                var_4 = vectornormalize( getzoneorigin( var_3 ) - self.owner_not );
                var_5 = vectordot( var_2, var_4 );

                if ( var_5 > 0.2 )
                    return 1;
            }
        }
    }

    return 0;
}

_id_6FBD( var_0 )
{
    if ( self._id_A1EA.size <= 0 )
        return;

    var_1 = self._id_A1EA;

    for ( var_2 = 0; var_2 < level._id_A3EF; var_2++ )
    {
        if ( botzonegetcount( var_2, self.team, "enemy_predict" ) <= 0 )
            continue;

        if ( var_1.size == 0 )
            break;

        var_3 = vectornormalize( getzoneorigin( var_2 ) - self.owner_not );

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        {
            var_5 = getnodezone( var_1[var_4] );
            var_6 = 0;

            if ( isdefined( var_5 ) && var_2 == var_5 )
                var_6 = 1;
            else
            {
                var_7 = vectornormalize( var_1[var_4].owner_not - self.owner_not );
                var_8 = vectordot( var_7, var_3 );

                if ( var_8 > 0.2 )
                    var_6 = 1;
            }

            if ( var_6 )
            {
                var_1[var_4]._id_A1E9[self._id_3314] *= var_0;
                var_1[var_4] = var_1[var_1.size - 1];
                var_1[var_1.size - 1] = undefined;
                var_4--;
            }
        }
    }
}

_id_332E( var_0 )
{
    var_1 = _id_163F( self._id_15F2 );

    foreach ( var_3 in var_1 )
    {
        if ( _id_332F( var_3, var_0 ) )
            return 1;
    }

    return 0;
}

_id_332F( var_0, var_1 )
{
    var_2 = anglestoforward( var_0 _meth_8338() );
    var_3 = vectornormalize( var_1.owner_not - var_0.owner_not );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0.6 )
        return 1;

    return 0;
}

_id_163F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        if ( isdefined( level._id_703F ) )
            var_1 = level._id_703F;
        else
            var_1 = 900;
    }

    var_2 = [];
    var_3 = _id_1640( var_0, var_1 );

    foreach ( var_5 in var_3 )
    {
        if ( !isai( var_5 ) || var_5 maps\mp\bots\_bots_util::_id_165E( var_0 ) )
            var_2 = common_scripts\utility::_id_0CDA( var_2, var_5 );
    }

    return var_2;
}

_id_1640( var_0, var_1 )
{
    var_2 = var_1 * var_1;
    var_3 = [];

    for ( var_4 = 0; var_4 < level._id_669D.size; var_4++ )
    {
        var_5 = level._id_669D[var_4];

        if ( var_5 != self && isdefined( var_5.team ) && var_5.team == self.team && maps\mp\_utility::_id_51CE( var_5 ) )
        {
            if ( distancesquared( var_0, var_5.owner_not ) < var_2 )
                var_3 = common_scripts\utility::_id_0CDA( var_3, var_5 );
        }
    }

    return var_3;
}

_id_27B0()
{
    level endon( "game_ended" );
    self endon( "started_bot_defend_think" );
    self endon( "defend_stop" );
    self endon( "disconnect" );
    self waittill( "death" );

    if ( isdefined( self ) )
        thread _id_15EF();
}

_id_15EF()
{
    self notify( "defend_stop" );
    self._id_15F1 = undefined;
    self._id_15F2 = undefined;
    self._id_15F5 = undefined;
    self._id_15F3 = undefined;
    self._id_15F7 = undefined;
    self._id_15F6 = undefined;
    self._id_15F4 = undefined;
    self._id_15EE = undefined;
    self._id_27B5 = undefined;
    self._id_6122 = undefined;
    self._id_27B3 = undefined;
    self._id_27B1 = undefined;
    self._id_27A6 = undefined;
    self._id_6F38 = undefined;
    self._id_24BB = undefined;
    self._id_24BA = undefined;
    self._id_24BC = undefined;
    self._id_27A3 = undefined;
    self._id_27B4 = undefined;
    self _meth_8354();
    self _meth_8350( "none" );
}

_id_27A5( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_669D )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team == self.team && var_3 != self && isai( var_3 ) && var_3 maps\mp\bots\_bots_util::_id_165D() && var_3._id_24BD == var_0 )
        {
            if ( var_3._id_15F7 == self._id_15F7 && maps\mp\bots\_bots_util::_id_165E( var_3._id_15F2 ) )
                var_1 = common_scripts\utility::_id_0CDA( var_1, var_3 );
        }
    }

    return var_1;
}

_id_5D82()
{
    var_0 = 0;
    var_1 = 175;
    var_2 = self._id_15EE.owner_not;
    var_3 = 0;
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( self._id_15EE ) )
            thread _id_15EF();

        self._id_15F2 = self._id_15EE.owner_not;
        self._id_6122 = self._id_15EE _meth_8385();

        if ( !isdefined( self._id_6122 ) )
            self._id_6122 = self _meth_8385();

        if ( self _meth_835B() != "none" )
        {
            var_5 = self _meth_8358();
            var_6 = self._id_15EE _meth_8336();
            var_7 = lengthsquared( var_6 );

            if ( var_7 > 100 )
            {
                var_0 = 0;

                if ( distancesquared( var_2, self._id_15EE.owner_not ) > var_1 * var_1 )
                {
                    var_2 = self._id_15EE.owner_not;
                    var_4 = 1;
                    var_8 = vectornormalize( var_5 - self._id_15EE.owner_not );
                    var_9 = vectornormalize( var_6 );

                    if ( vectordot( var_8, var_9 ) < 0.1 )
                    {
                        self notify( "defend_force_node_recalculation" );
                        wait 0.25;
                    }
                }
            }
            else
            {
                var_0 += 0.05;

                if ( var_3 > 100 && var_4 )
                {
                    var_2 = self._id_15EE.owner_not;
                    var_4 = 0;
                }

                if ( var_0 > 0.5 )
                {
                    var_10 = distancesquared( var_5, self._id_15F2 );

                    if ( var_10 > self._id_15F5 * self._id_15F5 )
                    {
                        self notify( "defend_force_node_recalculation" );
                        wait 0.25;
                    }
                }
            }

            var_3 = var_7;

            if ( abs( self._id_15EE.owner_not[2] - var_5[2] ) >= 50 )
            {
                self notify( "defend_force_node_recalculation" );
                wait 0.25;
            }
        }

        wait 0.05;
    }
}

_id_375F()
{
    var_0 = _id_15ED();
    var_1 = maps\mp\bots\_bots_util::_id_1613( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F5, var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_0 - var_1.owner_not );
            self._id_24BA = vectortoangles( var_2 );
        }
        else
        {
            var_3 = vectornormalize( var_1.owner_not - maps\mp\bots\_bots_util::_id_27A8() );
            self._id_24BA = vectortoangles( var_3 );
        }

        self._id_24BB = var_1;
    }
    else if ( isdefined( var_0 ) )
        _id_1648( var_0, undefined );
    else
        _id_1648( undefined, maps\mp\bots\_bots_util::_id_27A8() );
}

_id_3760()
{
    var_0 = _id_15ED();
    var_1 = maps\mp\bots\_bots_util::_id_1614( self._id_15F3, var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_0 - var_1.owner_not );
            self._id_24BA = vectortoangles( var_2 );
        }
        else
        {
            var_3 = vectornormalize( var_1.owner_not - maps\mp\bots\_bots_util::_id_27A8() );
            self._id_24BA = vectortoangles( var_3 );
        }

        self._id_24BB = var_1;
    }
    else if ( isdefined( var_0 ) )
        _id_1648( var_0, undefined );
    else
        _id_1648( undefined, maps\mp\bots\_bots_util::_id_27A8() );
}

_id_3762()
{
    var_0 = maps\mp\bots\_bots_util::_id_1612( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F5 );

    if ( isdefined( var_0 ) )
    {
        var_1 = vectornormalize( maps\mp\bots\_bots_util::_id_27A8() - var_0.owner_not );
        self._id_24BA = vectortoangles( var_1 );
        self._id_24BB = var_0;
    }
    else
        _id_1648( maps\mp\bots\_bots_util::_id_27A8(), undefined );
}

_id_375E()
{
    var_0 = maps\mp\bots\_bots_util::_id_1615( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F5 );

    if ( isdefined( var_0 ) )
        self._id_24BB = var_0;
    else
    {
        var_1 = self _meth_8385();

        if ( isdefined( var_1 ) )
            self._id_24BB = var_1;
        else
            self._id_24BC = self.owner_not;
    }
}

_id_3761()
{
    var_0 = undefined;
    var_1 = getnodesinradius( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F5, 0 );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_0 = self _meth_8362( var_1, 1 + var_1.size * 0.5, "node_traffic" );

    if ( isdefined( var_0 ) )
        self._id_24BB = var_0;
    else
        _id_1648( undefined, maps\mp\bots\_bots_util::_id_27A8() );
}

_id_1648( var_0, var_1 )
{
    if ( self._id_15F7 == "capture_zone" )
        self._id_24BC = maps\mp\bots\_bots_util::_id_16B6( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F3, ::_id_15CB );
    else
        self._id_24BC = maps\mp\bots\_bots_util::_id_16B7( maps\mp\bots\_bots_util::_id_27A8(), self._id_15F5, ::_id_15CB, 0.15, 0.9 );

    if ( isdefined( var_0 ) )
    {
        var_2 = vectornormalize( var_0 - self._id_24BC );
        self._id_24BA = vectortoangles( var_2 );
    }
    else if ( isdefined( var_1 ) )
    {
        var_2 = vectornormalize( self._id_24BC - var_1 );
        self._id_24BA = vectortoangles( var_2 );
    }
}

_id_15CB( var_0 )
{
    if ( _id_15D5( var_0, 1, 1, 1 ) )
        return 0;

    return 1;
}

_id_15D5( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < level._id_669D.size; var_4++ )
    {
        var_5 = level._id_669D[var_4];

        if ( var_5.team == self.team && var_5 != self )
        {
            if ( isai( var_5 ) )
            {
                if ( var_2 )
                {
                    if ( distancesquared( var_0, var_5.owner_not ) < 441 )
                        return 1;
                }

                if ( var_3 && var_5 _meth_8363() )
                {
                    var_6 = var_5 _meth_8358();

                    if ( distancesquared( var_0, var_6 ) < 441 )
                        return 1;
                }

                continue;
            }

            if ( var_1 )
            {
                if ( distancesquared( var_0, var_5.owner_not ) < 441 )
                    return 1;
            }
        }
    }

    return 0;
}

_id_15D3()
{
    var_0 = 0;

    if ( isdefined( self._id_15F3 ) )
    {
        foreach ( var_2 in self._id_15F3 )
        {
            var_3 = distance( self._id_15F2, var_2.owner_not );
            var_0 = max( var_3, var_0 );
        }
    }

    return var_0;
}

_id_1717()
{
    self notify( "bot_think_tactical_goals" );
    self endon( "bot_think_tactical_goals" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_90AF = [];
    self.tactical_goal_in_action_thread = 0;

    for (;;)
    {
        if ( self._id_90AF.size > 0 && !maps\mp\bots\_bots_util::_id_1664() )
        {
            var_0 = self._id_90AF[0];

            if ( !isdefined( var_0._id_06BA ) )
            {
                self notify( "start_tactical_goal" );

                if ( isdefined( var_0._id_8CC3 ) )
                    self [[ var_0._id_8CC3 ]]( var_0 );

                childthread _id_A1E4( var_0 );
                var_1 = "tactical";

                if ( isdefined( var_0._id_4251 ) )
                    var_1 = var_0._id_4251;

                if ( maps\mp\_utility::_id_5092( var_0.clear_prev_goal ) )
                    self _meth_8354();

                self _meth_8352( var_0._id_424F, var_0._id_4250, var_1, var_0.goal_yaw, var_0._id_62F3, var_0.short_term_goal );
                var_2 = maps\mp\bots\_bots_util::_id_172E( undefined, "stop_tactical_goal" );
                self notify( "stop_goal_aborted_watch" );

                if ( var_2 == "goal" )
                {
                    if ( isdefined( var_0._id_06ED ) )
                    {
                        self.tactical_goal_in_action_thread = 1;
                        self [[ var_0._id_06ED ]]( var_0 );
                        self.tactical_goal_in_action_thread = 0;
                    }
                }

                if ( var_2 != "script_goal_changed" )
                    self _meth_8354();

                if ( isdefined( var_0._id_3151 ) )
                    self [[ var_0._id_3151 ]]( var_0 );
            }

            self._id_90AF = common_scripts\utility::_id_0CF6( self._id_90AF, var_0 );
        }

        wait 0.05;
    }
}

_id_A1E4( var_0 )
{
    self endon( "stop_tactical_goal" );
    self endon( "stop_goal_aborted_watch" );
    wait 0.05;

    for (;;)
    {
        if ( isdefined( var_0._id_06BA ) || isdefined( var_0._id_844D ) && self [[ var_0._id_844D ]]( var_0 ) )
            self notify( "stop_tactical_goal" );

        wait 0.05;
    }
}

_id_16A9( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.unlockpoints = var_0;
    var_4._id_424F = var_1;

    if ( isdefined( self._id_64B9 ) )
    {
        if ( !common_scripts\utility::_id_0CE4( self._id_64B9, var_0 ) )
            return;
    }

    var_4._id_6FBE = var_2;
    var_4._id_62E1 = var_3._id_62E1;
    var_4._id_4251 = var_3._id_79FF;
    var_4.goal_yaw = var_3._id_7A00;
    var_4._id_4250 = 0;

    if ( isdefined( var_3._id_79FE ) )
        var_4._id_4250 = var_3._id_79FE;

    var_4._id_8CC3 = var_3._id_8CC3;
    var_4._id_3151 = var_3._id_3151;
    var_4._id_844D = var_3._id_844D;
    var_4._id_06ED = var_3._id_06ED;
    var_4._id_62F3 = var_3._id_62F3;
    var_4.short_term_goal = var_3.short_term_goal;
    var_4.optional_params = var_3.optional_params;
    var_4.clear_prev_goal = var_3.clear_prev_goal;

    for ( var_5 = 0; var_5 < self._id_90AF.size; var_5++ )
    {
        if ( var_4._id_6FBE > self._id_90AF[var_5]._id_6FBE )
            break;
    }

    for ( var_6 = self._id_90AF.size - 1; var_6 >= var_5; var_6-- )
        self._id_90AF[var_6 + 1] = self._id_90AF[var_6];

    self._id_90AF[var_5] = var_4;
}

_id_1649( var_0, var_1 )
{
    if ( !isdefined( self._id_90AF ) )
        return 0;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in self._id_90AF )
        {
            if ( var_3.unlockpoints == var_0 )
            {
                if ( isdefined( var_1 ) && isdefined( var_3._id_62E1 ) )
                {
                    return var_3._id_62E1 == var_1;
                    continue;
                }

                return 1;
            }
        }

        return 0;
    }
    else
        return self._id_90AF.size > 0;
}

bot_get_active_tactical_goals_of_type( var_0 )
{
    var_1 = [];

    if ( isdefined( self._id_90AF ) )
    {
        foreach ( var_3 in self._id_90AF )
        {
            if ( !maps\mp\_utility::_id_5092( var_3._id_06BA ) && var_3.unlockpoints == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_15A1( var_0, var_1 )
{
    if ( !isdefined( self._id_90AF ) )
        return;

    foreach ( var_3 in self._id_90AF )
    {
        if ( var_3.unlockpoints == var_0 )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isdefined( var_3._id_62E1 ) && var_3._id_62E1 == var_1 )
                    var_3._id_06BA = 1;

                continue;
            }

            var_3._id_06BA = 1;
        }
    }
}

_id_15F9()
{
    self._id_64B9[0] = "map_interactive_object";

    foreach ( var_1 in self._id_90AF )
    {
        if ( var_1.unlockpoints != "map_interactive_object" )
            var_1._id_06BA = 1;
    }
}

_id_1604()
{
    self._id_64B9 = undefined;
}

_id_16A0()
{
    var_0 = gettime();

    if ( !isdefined( self._id_553E ) || var_0 - self._id_553E > 1000 )
    {
        self._id_553E = var_0;
        var_1 = _id_162B( "tacticalinsertion" );

        if ( !isdefined( var_1 ) )
            return 0;

        if ( isdefined( self.enemy ) && self _meth_836D( self.enemy ) )
            return 0;

        var_2 = getzonenearest( self.owner_not );

        if ( !isdefined( var_2 ) )
            return 0;

        var_3 = botzonenearestcount( var_2, self.team, 1, "enemy_predict", ">", 0 );

        if ( !isdefined( var_3 ) )
            return 0;

        var_4 = getnodesinradius( self.owner_not, 500, 0 );

        if ( var_4.size <= 0 )
            return 0;

        var_5 = self _meth_8362( var_4, var_4.size * 0.15, "node_hide" );

        if ( !isdefined( var_5 ) )
            return 0;

        return _id_16E8( var_1, undefined, undefined, undefined, var_5 );
    }

    return 0;
}
