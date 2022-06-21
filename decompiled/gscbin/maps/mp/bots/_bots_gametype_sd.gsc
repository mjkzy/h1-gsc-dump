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
    _id_8072();
    _id_16D7();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::_id_16D8;
    level._id_161B["should_start_cautious_approach"] = ::_id_847E;
    level._id_161B["know_enemies_on_start"] = undefined;
    level._id_161B["notify_enemy_bots_bomb_used"] = ::_id_6206;
}

_id_16D7()
{
    _id_8060();
}

_id_8060()
{
    level._id_1744 = 1;
    level._id_4DD0 = 3000;
    maps\mp\bots\_bots_gametype_common::_id_16F1();
    maps\mp\bots\_bots_util::_id_172D();
    level._id_16D6 = [];
    level._id_16D6["axis"] = [];
    level._id_16D6["allies"] = [];
    level._id_15EB["atk_bomber"] = ::_id_0D86;
    level._id_15EB["clear_target_zone"] = ::_id_1ED9;
    level._id_15EB["defend_planted_bomb"] = ::_id_27A7;
    level._id_15EB["defuser"] = ::_id_152B;
    level._id_15EB["investigate_someone_using_bomb"] = ::_id_4FA1;
    level._id_15EB["camp_bomb"] = ::_id_1A36;
    level._id_15EB["defender"] = ::_id_27AD;
    level._id_15EB["backstabber"] = ::_id_125B;
    level._id_15EB["random_killer"] = ::_id_7115;
    var_0 = maps\mp\bots\_bots_gametype_common::bot_verify_and_cache_bombzones( [ "_a", "_b" ] );

    if ( var_0 )
    {
        foreach ( var_2 in level._id_1555 )
            var_2 thread maps\mp\bots\_bots_gametype_common::monitor_bombzone_control();

        thread _id_16D5();
        level._id_1628 = 1;
    }
}

_id_16D8()
{
    self notify( "bot_sd_think" );
    self endon( "bot_sd_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_4700 = undefined;

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );
    self _meth_834F( "use_obj_path_style", 1 );
    var_0 = game["attackers"];
    var_1 = 1;

    if ( isdefined( level._id_7B74 ) && isdefined( level._id_7B74._id_1BAF ) && level._id_7B74._id_1BAF == self && isdefined( self._id_759A ) && self._id_759A == "atk_bomber" )
        var_1 = 0;

    if ( var_1 )
    {
        self._id_759A = undefined;

        if ( isdefined( level._id_0D84 ) && level._id_0D84 == self )
            level._id_0D84 = undefined;
    }

    self._id_8FFF = undefined;
    self._id_4700 = 0;
    self._id_0D85 = 0;
    self._id_7B3A = undefined;
    self._id_27AC = undefined;
    self._id_27BC = 0;

    if ( !isdefined( level._id_4DC7 ) && !level._id_5FE2 )
    {
        level._id_4DC7 = level._id_7B74.curOrigin;
        level._id_4DC8 = getclosestnodeinsight( level._id_7B74.curOrigin );
    }

    if ( self.team == var_0 && !isdefined( level._id_1A4B ) )
    {
        var_2 = 0;

        if ( !level._id_5FE2 )
        {
            var_3 = maps\mp\bots\_bots_gametype_common::_id_3DC9( var_0 );

            foreach ( var_5 in var_3 )
            {
                if ( !isai( var_5 ) )
                    var_2 = 1;
            }
        }

        if ( var_2 )
        {
            var_7 = 6000;
            level._id_1A4B = gettime() + var_7;
            badplace_cylinder( "bomb", var_7 / 1000, level._id_7B74.curOrigin, 75, 300, var_0 );
        }
    }

    for (;;)
    {
        wait(randomintrange( 1, 3 ) * 0.05);

        if ( self.helmet <= 0 )
            continue;

        self._id_4700 = 1;

        if ( !isdefined( self._id_759A ) )
            _id_4DDB();

        if ( isdefined( self._id_8FFF ) )
            continue;

        if ( self.team == var_0 )
        {
            if ( !level._id_5FE2 && isdefined( level._id_1A4B ) && gettime() < level._id_1A4B && !isdefined( level._id_7B74._id_1BAF ) )
            {
                if ( !maps\mp\bots\_bots_util::_id_165E( level._id_7B74.curOrigin ) )
                {
                    var_8 = getclosestnodeinsight( level._id_7B74.curOrigin );

                    if ( isdefined( var_8 ) )
                    {
                        var_9["nearest_node_to_center"] = var_8;
                        maps\mp\bots\_bots_strategy::_id_16C2( level._id_7B74.curOrigin, 900, var_9 );
                    }
                    else
                        level._id_1A4B = gettime();
                }
            }
            else
                self [[ level._id_15EB[self._id_759A] ]]();

            continue;
        }

        if ( level._id_1545 )
        {
            if ( distancesquared( self.owner_not, level._id_7B75.owner_not ) > squared( level._id_703F * 2 ) )
            {
                if ( !isdefined( self._id_27AC ) )
                {
                    self._id_27AC = 1;
                    self _meth_8377( "scripted" );
                }
            }
            else if ( isdefined( self._id_27AC ) && !isdefined( self._id_7B3A ) )
            {
                self._id_27AC = undefined;
                self _meth_8377( undefined );
            }
        }

        if ( level._id_1545 && isdefined( level._id_152A ) && self._id_759A != "defuser" )
        {
            if ( !maps\mp\bots\_bots_util::_id_165E( level._id_7B75.owner_not ) )
            {
                self _meth_8354();
                maps\mp\bots\_bots_strategy::_id_16C2( level._id_7B75.owner_not, level._id_703F );
            }

            continue;
        }

        self [[ level._id_15EB[self._id_759A] ]]();
    }
}

_id_153A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_834F( "disable_movement", 1 );
    self _meth_8350( "stand" );
    wait(var_0);
    self _meth_834F( "disable_movement", 0 );
    self _meth_8350( "none" );
}

_id_0D86()
{
    self endon( "new_role" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    if ( isdefined( level._id_7B74 ) && isdefined( level._id_7B74._id_1BAF ) && isalive( level._id_7B74._id_1BAF ) && level._id_7B74._id_1BAF != self )
        wait 0.7;

    if ( !self._id_50C8 && !level._id_5FE2 )
    {
        if ( isdefined( level._id_7B74 ) )
        {
            if ( !isdefined( self._id_550E ) )
                self._id_550E = level._id_7B74.curOrigin;

            if ( distancesquared( self._id_550E, level._id_7B74.curOrigin ) > 4 )
            {
                self _meth_8354();
                self._id_550E = level._id_7B74.curOrigin;
            }
        }

        if ( self._id_0D85 >= 2 )
        {
            var_1 = getnodesinradiussorted( level._id_7B74.curOrigin, 512, 0 );
            var_2 = undefined;

            foreach ( var_4 in var_1 )
            {
                if ( !var_4 _meth_8384() )
                {
                    var_2 = var_4;
                    break;
                }
            }

            if ( isdefined( var_2 ) )
            {
                self _meth_8352( var_2.owner_not, 20, "critical" );
                maps\mp\bots\_bots_util::_id_172E();

                if ( isdefined( level._id_7B74 ) && !isdefined( level._id_7B74._id_1BAF ) )
                    level._id_7B74 maps\mp\gametypes\_gameobjects::_id_7FE2( self );

                __asm_jump( loc_5C4 );
            }

            return;
        }

        if ( !self _meth_8363() )
        {
            var_6 = 15;
            var_7 = 32;
            var_8 = maps\mp\bots\_bots_util::_id_16C3( "BotGetClosestNavigablePoint", maps\mp\bots\_bots_util::_id_3AE5, level._id_7B74.curOrigin, var_6 + var_7, self );

            if ( isdefined( var_8 ) )
            {
                var_9 = self _meth_8352( level._id_7B74.curOrigin, 0, "critical" );

                if ( var_9 )
                {
                    childthread _id_153B();
                    return;
                }
            }
            else
            {
                var_1 = getnodesinradiussorted( level._id_7B74.curOrigin, 512, 0 );

                if ( var_1.size > 0 )
                {
                    self _meth_8352( var_1[0].owner_not, 0, "critical" );
                    maps\mp\bots\_bots_util::_id_172E();
                }

                if ( isdefined( level._id_7B74 ) && !isdefined( level._id_7B74._id_1BAF ) )
                {
                    var_8 = maps\mp\bots\_bots_util::_id_16C3( "BotGetClosestNavigablePoint", maps\mp\bots\_bots_util::_id_3AE5, level._id_7B74.curOrigin, var_6 + var_7, self );

                    if ( !isdefined( var_8 ) )
                        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_7FE2( self );
                }
            }
        }
    }
    else
    {
        if ( isdefined( self._id_2D22 ) && gettime() < self._id_2D22 )
            return;

        if ( !isdefined( level._id_1535 ) )
            level._id_1535 = level._id_1555[randomint( level._id_1555.size )];

        var_10 = level._id_1535;
        self._id_1554 = var_10;

        if ( !isdefined( level._id_4DC9 ) || gettime() - level._id_4DC9 < level._id_4DD0 )
        {
            level._id_4DC9 = gettime() + level._id_4DD0;
            thread _id_153A( level._id_4DD0 / 1000 );
            wait(level._id_4DD0 / 1000);
        }

        self _meth_8354();

        if ( level._id_0E0F == "rush" )
        {
            self _meth_8377( "scripted" );
            var_11 = maps\mp\bots\_bots_gametype_common::get_bombzone_node_to_plant_on( var_10, 1 );
            self _meth_8352( var_11.owner_not, 0, "critical" );
        }

        var_12 = maps\mp\bots\_bots_util::_id_172E();

        if ( var_12 == "goal" )
        {
            var_13 = _id_3E56() - gettime();
            var_14 = var_13 - level._id_688D * 2 * 1000;
            var_15 = gettime() + var_14;

            if ( var_14 > 0 )
                maps\mp\bots\_bots_util::_id_172F( var_14 );

            var_16 = gettime() >= var_15;
            var_17 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_688D + 2, "bomb_planted", var_16 );
            self _meth_8354();

            if ( var_17 )
            {
                maps\mp\bots\_bots_strategy::_id_1604();
                _id_16EE( "defend_planted_bomb" );
            }
            else if ( var_14 > 5000 )
                self._id_2D22 = gettime() + 5000;
        }
    }
}

_id_3E56()
{
    if ( level._id_1545 )
        return level._id_27BB;
    else
        return gettime() + _id_A793::_id_4131();
}

_id_153B()
{
    self notify( "bomber_monitor_no_path" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "goal" );
    self endon( "bomber_monitor_no_path" );
    level._id_7B74 endon( "pickup_object" );

    for (;;)
    {
        self waittill( "no_path" );
        self._id_0D85++;
    }
}

_id_1ED9()
{
    self endon( "new_role" );

    if ( isdefined( level._id_0D84 ) )
    {
        if ( level._id_0E0F == "rush" )
        {
            if ( !isdefined( self._id_7E61 ) )
            {
                if ( !level._id_5FE2 )
                {
                    var_0["nearest_node_to_center"] = level._id_4DC8;
                    maps\mp\bots\_bots_strategy::_id_16C2( level._id_4DC7, 900, var_0 );
                    wait(randomfloatrange( 0.0, 4.0 ));
                    maps\mp\bots\_bots_strategy::_id_15EF();
                }

                self._id_7E61 = 1;
            }

            if ( self _meth_8379( "strategyLevel" ) > 0 )
                _id_7E3C();

            if ( isai( level._id_0D84 ) && isdefined( level._id_0D84._id_1554 ) )
                var_1 = level._id_0D84._id_1554;
            else if ( isdefined( level._id_1535 ) )
                var_1 = level._id_1535;
            else
                var_1 = maps\mp\bots\_bots_gametype_common::_id_3759( level._id_0D84 );

            if ( !maps\mp\bots\_bots_util::_id_165E( var_1.curOrigin ) )
            {
                var_0["min_goal_time"] = 2;
                var_0["max_goal_time"] = 4;
                var_0["override_origin_node"] = common_scripts\utility::_id_710E( var_1._id_174F );
                maps\mp\bots\_bots_strategy::_id_16C2( var_1.curOrigin, level._id_703F, var_0 );
            }
        }
    }
}

_id_27A7()
{
    self endon( "new_role" );

    if ( level._id_1545 )
    {
        if ( level._id_0E0F == "rush" )
            _id_2AA5();

        if ( !maps\mp\bots\_bots_util::_id_165E( level._id_7B75.owner_not ) )
        {
            var_0["score_flags"] = "strongly_avoid_center";
            maps\mp\bots\_bots_strategy::_id_16C2( level._id_7B75.owner_not, level._id_703F, var_0 );
        }
    }
}

_id_152B()
{
    self endon( "new_role" );

    if ( level._id_1536 )
        return;

    var_0 = _id_376F();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = common_scripts\utility::_id_3CCB( level._id_7B75.owner_not, var_0._id_174F );
    var_2 = ( level._id_7B75.owner_not[0], level._id_7B75.owner_not[1], var_1[0].owner_not[2] );

    if ( self._id_27BC <= 1 )
        var_3 = _id_1BD8( var_2, undefined );
    else
    {
        self _meth_8354();
        var_3 = self _meth_8352( var_2, 20, "critical" );
    }

    if ( !var_3 )
        return;

    var_4 = maps\mp\bots\_bots_util::_id_172E();

    if ( var_4 == "bad_path" )
    {
        self._id_27BC++;

        if ( self._id_27BC >= 4 )
        {
            for (;;)
            {
                var_5 = getnodesinradiussorted( var_2, 50, 0 );
                var_6 = self._id_27BC - 4;

                if ( var_5.size <= var_6 )
                {
                    var_7 = botgetclosestnavigablepoint( var_2, 50, self );

                    if ( isdefined( var_7 ) )
                        self _meth_8352( var_7, 20, "critical" );
                    else
                        break;
                }
                else
                    self _meth_8352( var_5[var_6].owner_not, 20, "critical" );

                var_4 = maps\mp\bots\_bots_util::_id_172E();

                if ( var_4 == "bad_path" )
                {
                    self._id_27BC++;
                    continue;
                }

                break;
            }
        }
    }

    if ( var_4 == "goal" )
    {
        var_8 = _id_3E56() - gettime();
        var_9 = var_8 - level._id_27BF * 2 * 1000;
        var_10 = gettime() + var_9;

        if ( var_9 > 0 )
            maps\mp\bots\_bots_util::_id_172F( var_9 );

        var_11 = gettime() >= var_10;
        var_12 = level._id_7B75.owner_not[2] - self.owner_not[2];
        var_13 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_27BF + 2, "bomb_defused", var_11, var_12 > 40 );

        if ( !var_13 && self._id_27BC >= 4 )
            self._id_27BC++;

        self _meth_8354();
        maps\mp\bots\_bots_strategy::_id_1604();
    }
}

_id_4FA1()
{
    self endon( "new_role" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    var_0 = maps\mp\bots\_bots_gametype_common::_id_3759( self );
    self _meth_8353( common_scripts\utility::_id_710E( var_0._id_174F ), "critical" );
    var_1 = maps\mp\bots\_bots_util::_id_172E();

    if ( var_1 == "goal" )
    {
        wait 2;
        _id_16EE( self._id_6F44 );
    }
}

_id_1A36()
{
    self endon( "new_role" );

    if ( isdefined( level._id_7B74._id_1BAF ) )
    {
        if ( self._id_6F44 == "defender" )
            self._id_27A9 = maps\mp\bots\_bots_gametype_common::_id_3759( self );

        _id_16EE( self._id_6F44 );
    }
    else if ( !maps\mp\bots\_bots_util::_id_165E( level._id_7B74.curOrigin ) )
    {
        var_0["nearest_node_to_center"] = level._id_7B74._id_6072;
        maps\mp\bots\_bots_strategy::_id_16C2( level._id_7B74.curOrigin, level._id_703F, var_0 );
    }
}

_id_27AD()
{
    self endon( "new_role" );

    if ( !maps\mp\bots\_bots_util::_id_165E( self._id_27A9.curOrigin ) )
    {
        var_0["score_flags"] = "strict_los";
        var_0["override_origin_node"] = common_scripts\utility::_id_710E( self._id_27A9._id_174F );
        maps\mp\bots\_bots_strategy::_id_16C2( self._id_27A9.curOrigin, level._id_703F, var_0 );
    }
}

_id_125B()
{
    self endon( "new_role" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    if ( !isdefined( self._id_125A ) )
        self._id_125A = "1_move_to_midpoint";

    if ( self._id_125A == "1_move_to_midpoint" )
    {
        var_0 = level._id_1555[0].curOrigin;
        var_1 = level._id_1555[1].curOrigin;
        var_2 = ( ( var_0[0] + var_1[0] ) * 0.5, ( var_0[1] + var_1[1] ) * 0.5, ( var_0[2] + var_1[2] ) * 0.5 );
        var_3 = getnodesinradiussorted( var_2, 512, 0 );

        if ( var_3.size == 0 )
        {
            _id_16EE( "random_killer" );
            return;
        }

        var_4 = undefined;
        var_5 = int( var_3.size * ( var_3.size + 1 ) * 0.5 );
        var_6 = randomint( var_5 );

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            var_8 = var_3.size - var_7;

            if ( var_6 < var_8 )
            {
                var_4 = var_3[var_7];
                break;
            }

            var_6 -= var_8;
        }

        self _meth_8377( "scripted" );
        var_9 = self _meth_8353( var_4, "guard" );

        if ( var_9 )
        {
            var_10 = maps\mp\bots\_bots_util::_id_172E();

            if ( var_10 == "goal" )
            {
                wait(randomfloatrange( 1.0, 4.0 ));
                self._id_125A = "2_move_to_enemy_spawn";
            }
        }
    }

    if ( self._id_125A == "2_move_to_enemy_spawn" )
    {
        var_11 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_sd_spawn_attacker" );
        var_12 = common_scripts\utility::_id_710E( var_11 );
        self _meth_8377( "scripted" );
        var_9 = self _meth_8352( var_12.owner_not, 250, "guard" );

        if ( var_9 )
        {
            var_10 = maps\mp\bots\_bots_util::_id_172E();

            if ( var_10 == "goal" )
                self._id_125A = "3_move_to_bombzone";
        }
    }

    if ( self._id_125A == "3_move_to_bombzone" )
    {
        if ( !isdefined( self._id_1553 ) )
            self._id_1553 = randomint( level._id_1555.size );

        self _meth_8377( undefined );
        var_9 = self _meth_8352( common_scripts\utility::_id_710E( level._id_1555[self._id_1553]._id_174F ).owner_not, 160, "objective" );

        if ( var_9 )
        {
            var_10 = maps\mp\bots\_bots_util::_id_172E();

            if ( var_10 == "goal" )
            {
                self _meth_8354();
                self._id_125A = "2_move_to_enemy_spawn";
                self._id_1553 = 1 - self._id_1553;
            }
        }
    }
}

_id_7115()
{
    self endon( "new_role" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    self [[ self._id_67E1 ]]();
}

_id_7E3C()
{
    if ( !isdefined( self._id_0B08 ) )
    {
        self _meth_834F( "force_sprint", 1 );
        self._id_0B08 = 1;
    }
}

_id_2AA5()
{
    if ( isdefined( self._id_0B08 ) )
    {
        self _meth_834F( "force_sprint", 0 );
        self._id_0B08 = undefined;
    }
}

_id_7EB6()
{
    if ( !isdefined( self._id_7B3A ) )
    {
        self _meth_8377( "scripted" );
        self._id_7B3A = 1;
    }
}

_id_1BD8( var_0, var_1 )
{
    var_2 = level._id_1B4A;
    var_3["entrance_points_index"] = var_1;
    maps\mp\bots\_bots_strategy::_id_15D1( var_0, var_2, var_3 );
    wait 0.05;

    while ( distancesquared( self.owner_not, var_0 ) > var_2 * var_2 && maps\mp\bots\_bots_util::_id_165D() )
    {
        if ( _id_3E56() - gettime() < 20000 )
        {
            _id_7EB6();
            _id_7E3C();
            break;
        }

        wait 0.05;
    }

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    return self _meth_8352( var_0, 20, "critical" );
}

_id_6206( var_0 )
{
    var_1 = maps\mp\bots\_bots_gametype_common::get_ai_hearing_bomb_plant_sound( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_759A ) )
            var_3 _id_16EE( "investigate_someone_using_bomb" );
    }
}

_id_847E( var_0 )
{
    var_1 = 2000;
    var_2 = var_1 * var_1;

    if ( var_0 )
    {
        if ( _id_3E56() - gettime() < 15000 )
            return 0;

        var_3 = 0;
        var_4 = common_scripts\utility::_id_3D4F( self.team );

        foreach ( var_6 in level.players )
        {
            if ( !isdefined( var_6.team ) )
                continue;

            if ( isalive( var_6 ) && var_6.team == var_4 )
                var_3 = 1;
        }

        return var_3;
    }
    else
        return distancesquared( self.owner_not, self._id_15F2 ) <= var_2 && self _meth_8373();
}

_id_3E32( var_0 )
{
    var_1 = [];
    var_2 = maps\mp\bots\_bots_gametype_common::_id_3DC9( game["defenders"] );

    foreach ( var_4 in var_2 )
    {
        if ( isai( var_4 ) && isdefined( var_4._id_759A ) && var_4._id_759A == "defender" )
        {
            if ( isdefined( var_4._id_27A9 ) && var_4._id_27A9 == var_0 )
                var_1 = common_scripts\utility::_id_0CDA( var_1, var_4 );

            continue;
        }

        if ( distancesquared( var_4.owner_not, var_0.curOrigin ) < level._id_703F * level._id_703F )
            var_1 = common_scripts\utility::_id_0CDA( var_1, var_4 );
    }

    return var_1;
}

_id_376F()
{
    foreach ( var_1 in level._id_1555 )
    {
        if ( !isdefined( var_1._id_9345 ) )
            continue;

        if ( distancesquared( var_1._id_9345.owner_not, var_1.curOrigin ) < 90000 )
            return var_1;
    }

    return undefined;
}

_id_3E6B( var_0 )
{
    var_0 = "_" + tolower( var_0 );

    for ( var_1 = 0; var_1 < level._id_1555.size; var_1++ )
    {
        if ( level._id_1555[var_1].land == var_0 )
            return level._id_1555[var_1];
    }
}

_id_153D()
{
    self endon( "stopped_being_bomb_carrier" );
    self endon( "new_role" );
    common_scripts\utility::_id_A069( "death", "disconnect" );
    level._id_0D84 = undefined;
    level._id_550A = gettime();

    if ( isdefined( self ) )
        self._id_759A = undefined;

    var_0 = maps\mp\bots\_bots_gametype_common::_id_3DC9( game["attackers"], 1 );
    _id_3989( var_0, undefined );
}

_id_153C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stopped_being_bomb_carrier" );
    level._id_7B74 endon( "pickup_object" );
    level._id_7B74 waittill( "reset" );

    if ( maps\mp\_utility::_id_50B1( self ) )
        self _meth_8354();

    _id_16EE( "atk_bomber" );
}

_id_7E83()
{
    level._id_0D84 = self;
    _id_16EE( "atk_bomber" );
    thread _id_153D();

    if ( !level._id_5FE2 )
        thread _id_153C();

    if ( isai( self ) )
    {
        maps\mp\bots\_bots_strategy::_id_15F9();

        if ( level._id_0E0F == "rush" && self _meth_8379( "strategyLevel" ) > 0 )
            _id_7E3C();
    }
}

_id_4DDB()
{
    if ( self.team == game["attackers"] )
    {
        if ( level._id_1545 )
            _id_16EE( "defend_planted_bomb" );
        else if ( !isdefined( level._id_0D84 ) )
            _id_7E83();
        else if ( level._id_0E0F == "rush" )
            _id_16EE( "clear_target_zone" );
    }
    else
    {
        var_0 = _id_3E30( "backstabber" );
        var_1 = _id_3E30( "defender" );
        var_2 = level._id_16B2[self._id_67DF];
        var_3 = self _meth_8379( "strategyLevel" );

        if ( var_2 == "active" )
        {
            if ( !isdefined( self._id_759A ) && level._id_0A8E && var_3 > 0 )
            {
                if ( var_0.size == 0 )
                    _id_16EE( "backstabber" );
                else
                {
                    var_4 = 1;

                    foreach ( var_6 in var_0 )
                    {
                        var_7 = level._id_16B2[var_6._id_67DF];

                        if ( var_7 == "active" )
                        {
                            var_4 = 0;
                            break;
                        }
                    }

                    if ( var_4 )
                    {
                        _id_16EE( "backstabber" );
                        var_0[0] _id_16EE( undefined );
                    }
                }
            }

            if ( !isdefined( self._id_759A ) )
            {
                if ( var_1.size < 4 )
                    _id_16EE( "defender" );
            }

            if ( !isdefined( self._id_759A ) )
            {
                var_9 = randomint( 4 );

                if ( var_9 == 3 && level._id_0A9C && var_3 > 0 )
                    _id_16EE( "random_killer" );
                else if ( var_9 == 2 && level._id_0A8E && var_3 > 0 )
                    _id_16EE( "backstabber" );
                else
                    _id_16EE( "defender" );
            }
        }
        else if ( var_2 == "stationary" )
        {
            if ( !isdefined( self._id_759A ) )
            {
                if ( var_1.size < 4 )
                    _id_16EE( "defender" );
                else
                {
                    foreach ( var_11 in var_1 )
                    {
                        var_12 = level._id_16B2[var_11._id_67DF];

                        if ( var_12 == "active" )
                        {
                            _id_16EE( "defender" );
                            var_11 _id_16EE( undefined );
                            break;
                        }
                    }
                }
            }

            if ( !isdefined( self._id_759A ) && level._id_0A8E && var_3 > 0 )
            {
                if ( var_0.size == 0 )
                    _id_16EE( "backstabber" );
            }

            if ( !isdefined( self._id_759A ) )
                _id_16EE( "defender" );
        }

        if ( self._id_759A == "defender" )
        {
            var_14 = level._id_1555;

            if ( _id_46F8( self.team ) )
                var_14 = _id_3E15( self.team );

            if ( var_14.size == 1 )
                self._id_27A9 = var_14[0];
            else
            {
                var_15 = _id_3E32( var_14[0] );
                var_16 = _id_3E32( var_14[1] );

                if ( var_15.size < var_16.size )
                    self._id_27A9 = var_14[0];
                else if ( var_16.size < var_15.size )
                    self._id_27A9 = var_14[1];
                else
                    self._id_27A9 = common_scripts\utility::_id_710E( var_14 );
            }
        }
    }
}

_id_16EE( var_0 )
{
    if ( isai( self ) )
    {
        maps\mp\bots\_bots_strategy::_id_15EF();
        self _meth_8377( undefined );
    }

    self._id_6F44 = self._id_759A;
    self._id_759A = var_0;
    self notify( "new_role" );
}

_id_16EF( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "new_role" );
    wait(var_1);
    _id_16EE( var_0 );
}

_id_3989( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_4 thread _id_16EF( var_1, randomfloatrange( 0.0, var_2 ) );
            continue;
        }

        var_4 thread _id_16EE( var_1 );
    }
}

_id_3E15( var_0 )
{
    return level._id_16D6[var_0];
}

_id_46F8( var_0 )
{
    var_1 = _id_3E15( var_0 );
    return var_1.size > 0;
}

_id_3E30( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.participants )
    {
        if ( isalive( var_3 ) && maps\mp\_utility::_id_51CE( var_3 ) && isdefined( var_3._id_759A ) && var_3._id_759A == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_16D5()
{
    level notify( "bot_sd_ai_director_update" );
    level endon( "bot_sd_ai_director_update" );
    level endon( "game_ended" );
    level._id_0A8E = randomint( 3 ) <= 1;
    level._id_0A9C = randomint( 3 ) <= 1;
    level._id_0E0F = "rush";
    level._id_703F = 725;
    level._id_1B4A = 140;

    for (;;)
    {
        if ( isdefined( level._id_7B74 ) && isdefined( level._id_7B74._id_1BAF ) && !isai( level._id_7B74._id_1BAF ) )
            level._id_1535 = maps\mp\bots\_bots_gametype_common::_id_3759( level._id_7B74._id_1BAF );

        var_0 = 0;

        if ( !level._id_1545 )
        {
            var_1 = maps\mp\bots\_bots_gametype_common::_id_3DC9( game["attackers"] );

            foreach ( var_3 in var_1 )
            {
                if ( var_3._id_50C8 )
                {
                    level._id_1A4B = gettime();

                    if ( !isdefined( level._id_0D84 ) || var_3 != level._id_0D84 )
                    {
                        if ( isdefined( level._id_0D84 ) && isalive( level._id_0D84 ) )
                        {
                            level._id_0D84 _id_16EE( undefined );
                            level._id_0D84 notify( "stopped_being_bomb_carrier" );
                        }

                        var_0 = 1;
                        var_3 _id_7E83();
                    }
                }
            }

            if ( !level._id_5FE2 && !isdefined( level._id_7B74._id_1BAF ) )
            {
                var_5 = getclosestnodeinsight( level._id_7B74.curOrigin );

                if ( isdefined( var_5 ) )
                {
                    level._id_7B74._id_6072 = var_5;
                    var_6 = 0;
                    var_7 = maps\mp\bots\_bots_gametype_common::_id_3DC9( game["defenders"], 1 );

                    foreach ( var_9 in var_7 )
                    {
                        var_10 = var_9 _meth_8385();
                        var_11 = var_9 _meth_8379( "strategyLevel" );

                        if ( var_11 > 0 && var_9._id_759A != "camp_bomb" && isdefined( var_10 ) && nodesvisible( var_5, var_10, 1 ) )
                        {
                            var_12 = var_9 _meth_8371();

                            if ( common_scripts\utility::_id_A347( var_9.owner_not, var_9 _meth_8338(), level._id_7B74.curOrigin, var_12 ) )
                            {
                                if ( var_11 >= 2 || distancesquared( var_9.owner_not, level._id_7B74.curOrigin ) < squared( 700 ) )
                                {
                                    var_6 = 1;
                                    break;
                                }
                            }
                        }
                    }

                    if ( var_6 )
                    {
                        foreach ( var_9 in var_7 )
                        {
                            if ( var_9._id_759A != "camp_bomb" && var_9 _meth_8379( "strategyLevel" ) > 0 )
                                var_9 _id_16EE( "camp_bomb" );
                        }
                    }
                }
            }

            var_16 = level._id_1555;

            if ( _id_46F8( game["defenders"] ) )
                var_16 = _id_3E15( game["defenders"] );

            for ( var_17 = 0; var_17 < var_16.size; var_17++ )
            {
                for ( var_18 = 0; var_18 < var_16.size; var_18++ )
                {
                    var_19 = _id_3E32( var_16[var_17] );
                    var_20 = _id_3E32( var_16[var_18] );

                    if ( var_19.size > var_20.size + 1 )
                    {
                        var_21 = [];

                        foreach ( var_3 in var_19 )
                        {
                            if ( isai( var_3 ) )
                                var_21 = common_scripts\utility::_id_0CDA( var_21, var_3 );
                        }

                        if ( var_21.size > 0 )
                        {
                            var_24 = common_scripts\utility::_id_710E( var_21 );
                            var_24 maps\mp\bots\_bots_strategy::_id_15EF();
                            var_24._id_27A9 = var_16[var_18];
                        }
                    }
                }
            }
        }
        else
        {
            if ( isdefined( level._id_0D84 ) )
                level._id_0D84 = undefined;

            if ( !isdefined( level._id_152A ) || !isalive( level._id_152A ) )
            {
                var_25 = [];
                var_26 = _id_3E30( "defender" );
                var_27 = _id_3E30( "backstabber" );
                var_28 = _id_3E30( "random_killer" );

                if ( var_26.size > 0 )
                    var_25 = var_26;
                else if ( var_27.size > 0 )
                    var_25 = var_27;
                else if ( var_28.size > 0 )
                    var_25 = var_28;

                if ( var_25.size > 0 )
                {
                    var_29 = common_scripts\utility::_id_3CCB( level._id_7B75.owner_not, var_25 );
                    level._id_152A = var_29[0];
                    level._id_152A _id_16EE( "defuser" );
                    level._id_152A maps\mp\bots\_bots_strategy::_id_15F9();
                    level._id_152A thread _id_27BD();
                }
            }

            if ( !isdefined( level._id_7B51 ) )
            {
                level._id_7B51 = 1;
                var_30 = maps\mp\bots\_bots_gametype_common::_id_3DC9( game["attackers"] );

                foreach ( var_3 in var_30 )
                {
                    if ( isdefined( var_3._id_759A ) )
                    {
                        if ( var_3._id_759A == "atk_bomber" )
                        {
                            var_3 thread _id_16EE( undefined );
                            continue;
                        }

                        if ( var_3._id_759A != "defend_planted_bomb" )
                            var_3 thread _id_16EF( "defend_planted_bomb", randomfloatrange( 0.0, 3.0 ) );
                    }
                }
            }
        }

        wait 0.5;
    }
}

_id_27BD()
{
    common_scripts\utility::_id_A069( "death", "disconnect" );
    level._id_152A = undefined;
}
