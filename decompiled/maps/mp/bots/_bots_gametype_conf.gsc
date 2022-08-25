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
    _id_805A();
}

_id_8072()
{
    level.bot_funcs["gametype_think"] = ::bot_conf_think;
}

_id_805A()
{
    level.bot_tag_obj_radius = 200;
    level.bot_tag_allowable_jump_height = 38;

    if ( maps\mp\_utility::_id_50C4() )
        level.bot_tag_allowable_jump_height += 170;
}

bot_conf_think()
{
    self notify( "bot_conf_think" );
    self endon( "bot_conf_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_60C2 = gettime() + 500;
    self._id_9107 = [];
    childthread bot_watch_new_tags();

    if ( self._id_67DF == "camper" )
    {
        self._id_20E7 = 0;

        if ( !isdefined( self._id_20E8 ) )
            self._id_20E8 = 0;
    }

    for (;;)
    {
        var_0 = isdefined( self._id_90BE );
        var_1 = 0;

        if ( var_0 && self bothasscriptgoal() )
        {
            var_2 = self botgetscriptgoal();

            if ( maps\mp\bots\_bots_util::bot_vectors_are_equal( self._id_90BE._id_4411, var_2 ) )
            {
                if ( self _meth_8373() )
                    var_1 = 1;
            }
            else if ( maps\mp\bots\_bots_strategy::bot_has_tactical_goal( "kill_tag" ) && self._id_90BE maps\mp\gametypes\_gameobjects::_id_1ACA( self.team ) )
            {
                self._id_90BE = undefined;
                var_0 = 0;
            }
        }

        self botsetflag( "force_sprint", var_1 );
        self._id_9107 = bot_remove_invalid_tags( self._id_9107 );
        var_3 = bot_find_best_tag_from_array( self._id_9107, 1 );
        var_4 = isdefined( var_3 );

        if ( var_0 && !var_4 || !var_0 && var_4 || var_0 && var_4 && self._id_90BE != var_3 )
        {
            self._id_90BE = var_3;
            self botclearscriptgoal();
            self notify( "stop_camping_tag" );
            maps\mp\bots\_bots_personality::_id_1EA3();
            maps\mp\bots\_bots_strategy::bot_abort_tactical_goal( "kill_tag" );
        }

        if ( isdefined( self._id_90BE ) )
        {
            self._id_20E8 = 0;

            if ( self._id_67DF == "camper" && self._id_20E7 )
            {
                self._id_20E8 = 1;

                if ( maps\mp\bots\_bots_personality::_id_8476() )
                {
                    if ( maps\mp\bots\_bots_personality::_id_3753( self._id_90BE._id_4411, 1000 ) )
                        childthread bot_camp_tag( self._id_90BE, "camp" );
                    else
                        self._id_20E8 = 0;
                }
            }

            if ( !self._id_20E8 )
            {
                if ( !maps\mp\bots\_bots_strategy::bot_has_tactical_goal( "kill_tag" ) )
                {
                    var_5 = spawnstruct();
                    var_5._id_79FF = "objective";
                    var_5._id_62F3 = level.bot_tag_obj_radius;
                    maps\mp\bots\_bots_strategy::bot_new_tactical_goal( "kill_tag", self._id_90BE._id_4411, 25, var_5 );
                }
            }
        }

        var_6 = 0;

        if ( isdefined( self.additional_tactical_logic_func ) )
            var_6 = self [[ self.additional_tactical_logic_func ]]();

        if ( !isdefined( self._id_90BE ) )
        {
            if ( !var_6 )
                self [[ self._id_67E1 ]]();
        }

        if ( gettime() > self._id_60C2 )
        {
            self._id_60C2 = gettime() + 500;
            var_7 = bot_find_visible_tags( 1 );
            self._id_9107 = bot_combine_tag_seen_arrays( var_7, self._id_9107 );
        }

        wait 0.05;
    }
}

bot_check_tag_above_head( var_0 )
{
    if ( isdefined( var_0._id_6445 ) && var_0._id_6445 )
    {
        var_1 = self.origin + ( 0.0, 0.0, 55.0 );

        if ( distance2dsquared( var_0.curorigin, var_1 ) < 144 )
        {
            var_2 = var_0.curorigin[2] - var_1[2];

            if ( var_2 > 0 )
            {
                if ( var_2 < level.bot_tag_allowable_jump_height )
                {
                    if ( !isdefined( self._id_5565 ) )
                        self._id_5565 = 0;

                    if ( gettime() - self._id_5565 > 3000 )
                    {
                        self._id_5565 = gettime();
                        thread bot_jump_for_tag();
                    }
                }
                else
                {
                    var_0._id_6445 = 0;
                    return 1;
                }
            }
        }
    }

    return 0;
}

bot_jump_for_tag()
{
    self endon( "death" );
    self endon( "disconnect" );
    self botsetstance( "stand" );
    wait 1.0;
    self _meth_837C( "jump" );
    wait 0.5;

    if ( maps\mp\_utility::_id_50C4() )
        self _meth_837C( "jump" );

    wait 0.5;
    self botsetstance( "none" );
}

bot_watch_new_tags()
{
    for (;;)
    {
        level waittill( "new_tag_spawned", var_0 );
        self._id_60C2 = -1;

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0._id_9E07 ) && var_0._id_9E07 == self || isdefined( var_0.attacker ) && var_0.attacker == self )
            {
                if ( !isdefined( var_0._id_6445 ) && !isdefined( var_0.calculations_in_progress ) )
                {
                    thread calculate_tag_on_path_grid( var_0 );
                    _id_A0BC( var_0 );

                    if ( var_0._id_6445 )
                    {
                        var_1 = spawnstruct();
                        var_1.origin = var_0.curorigin;
                        var_1.tag = var_0;
                        var_2[0] = var_1;
                        self._id_9107 = bot_combine_tag_seen_arrays( var_2, self._id_9107 );
                    }
                }
            }
        }
    }
}

bot_combine_tag_seen_arrays( var_0, var_1 )
{
    var_2 = var_1;

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( var_4.tag == var_7.tag && maps\mp\bots\_bots_util::bot_vectors_are_equal( var_4.origin, var_7.origin ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( !var_5 )
            var_2 = common_scripts\utility::array_add( var_2, var_4 );
    }

    return var_2;
}

bot_is_tag_visible( var_0, var_1, var_2 )
{
    if ( !var_0.calculated_nearest_node )
    {
        var_0._id_6071 = getclosestnodeinsight( var_0.curorigin );
        var_0.calculated_nearest_node = 1;
    }

    if ( isdefined( var_0.calculations_in_progress ) )
        return 0;

    var_3 = var_0._id_6071;
    var_4 = !isdefined( var_0._id_6445 );

    if ( isdefined( var_3 ) && ( var_4 || var_0._id_6445 ) )
    {
        var_5 = var_3 == var_1 || nodesvisible( var_3, var_1, 1 );

        if ( var_5 )
        {
            var_6 = common_scripts\utility::_id_A347( self.origin, self getplayerangles(), var_0.curorigin, var_2 );

            if ( var_6 )
            {
                if ( var_4 )
                {
                    thread calculate_tag_on_path_grid( var_0 );
                    _id_A0BC( var_0 );

                    if ( !var_0._id_6445 )
                        return 0;
                }

                return 1;
            }
        }
    }

    return 0;
}

bot_find_visible_tags( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else
        var_3 = self _meth_8385();

    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else
        var_4 = self _meth_8371();

    var_5 = [];

    if ( isdefined( var_3 ) )
    {
        foreach ( var_7 in level.dogtags )
        {
            if ( var_7 maps\mp\gametypes\_gameobjects::_id_1ACA( self.team ) )
            {
                var_8 = 0;

                if ( !var_0 || var_7.attacker == self )
                {
                    if ( !isdefined( var_7.calculations_in_progress ) )
                    {
                        if ( !isdefined( var_7._id_6445 ) )
                        {
                            level thread calculate_tag_on_path_grid( var_7 );
                            _id_A0BC( var_7 );
                        }

                        var_8 = distancesquared( self.origin, var_7._id_4411 ) < 1000000 && var_7._id_6445;
                    }
                }
                else if ( bot_is_tag_visible( var_7, var_3, var_4 ) )
                    var_8 = 1;

                if ( var_8 )
                {
                    var_9 = spawnstruct();
                    var_9.origin = var_7.curorigin;
                    var_9.tag = var_7;
                    var_5 = common_scripts\utility::array_add( var_5, var_9 );
                }
            }
        }
    }

    return var_5;
}

calculate_tag_on_path_grid( var_0 )
{
    var_0 endon( "reset" );
    var_0.calculations_in_progress = 1;
    var_0._id_6445 = maps\mp\bots\_bots_util::bot_point_is_on_pathgrid( var_0.curorigin, undefined, level.bot_tag_allowable_jump_height + 55 );

    if ( var_0._id_6445 )
    {
        var_0._id_4411 = getgroundposition( var_0.curorigin, 32 );

        if ( !isdefined( var_0._id_4411 ) )
            var_0._id_6445 = 0;
    }

    var_0.calculations_in_progress = undefined;
}

_id_A0BC( var_0 )
{
    while ( !isdefined( var_0._id_6445 ) )
        wait 0.05;
}

bot_find_best_tag_from_array( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
    {
        var_3 = 1409865409;

        foreach ( var_5 in var_0 )
        {
            var_6 = _id_3DF7( var_5.tag );

            if ( !var_1 || var_6 < 2 )
            {
                var_7 = distancesquared( var_5.tag._id_4411, self.origin );

                if ( var_7 < var_3 )
                {
                    var_2 = var_5.tag;
                    var_3 = var_7;
                }
            }
        }
    }

    return var_2;
}

bot_remove_invalid_tags( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3.tag maps\mp\gametypes\_gameobjects::_id_1ACA( self.team ) && maps\mp\bots\_bots_util::bot_vectors_are_equal( var_3.tag.curorigin, var_3.origin ) )
        {
            if ( !bot_check_tag_above_head( var_3.tag ) && var_3.tag._id_6445 )
                var_1 = common_scripts\utility::array_add( var_1, var_3 );
        }
    }

    return var_1;
}

_id_3DF7( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_669D )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team == self.team && var_3 != self )
        {
            if ( isai( var_3 ) )
            {
                if ( isdefined( var_3._id_90BE ) && var_3._id_90BE == var_0 )
                    var_1++;

                continue;
            }

            if ( distancesquared( var_3.origin, var_0.curorigin ) < 160000 )
                var_1++;
        }
    }

    return var_1;
}

bot_camp_tag( var_0, var_1, var_2 )
{
    self notify( "bot_camp_tag" );
    self endon( "bot_camp_tag" );
    self endon( "stop_camping_tag" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    self botsetscriptgoal( self._id_6121, var_1, self.ambush_yaw );
    var_3 = maps\mp\bots\_bots_util::bot_waittill_goal_or_fail();

    if ( var_3 == "goal" )
    {
        var_4 = var_0._id_6071;

        if ( isdefined( var_4 ) )
        {
            var_5 = findentrances( self.origin );
            var_5 = common_scripts\utility::array_add( var_5, var_4 );
            childthread maps\mp\bots\_bots_util::bot_watch_nodes( var_5 );
        }
    }
}
