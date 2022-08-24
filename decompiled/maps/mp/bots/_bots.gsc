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
    if ( isdefined( level._id_2409 ) && level._id_2409 )
        return;

    if ( getdvarint( "virtualLobbyActive" ) == 1 )
        return;

    if ( getdvarint( "r_reflectionProbeGenerate" ) == 1 )
        return;

    _id_8072();
    maps\mp\bots\_bots_personality::_id_825A();
    level._id_1262 = ::badplace_cylinder;
    level._id_1263 = ::badplace_delete;

    if ( isdefined( level.bot_killstreak_setup_func ) )
        [[ level.bot_killstreak_setup_func ]]();
    else
        maps\mp\bots\_bots_ks::_id_167A();

    maps\mp\bots\_bots_loadout::init();
    level thread init();
}

_id_8072()
{
    level.bot_funcs = [];
    level.bot_funcs["bots_spawn"] = ::_id_88D8;
    level.bot_funcs["bots_add_scavenger_bag"] = ::_id_15A4;
    level.bot_funcs["bots_add_to_level_targets"] = maps\mp\bots\_bots_util::_id_15A6;
    level.bot_funcs["bots_remove_from_level_targets"] = maps\mp\bots\_bots_util::_id_16CD;
    level.bot_funcs["bots_make_entity_sentient"] = ::_id_1697;
    level.bot_funcs["think"] = ::_id_170F;
    level.bot_funcs["on_killed"] = ::_id_6440;
    level.bot_funcs["should_do_killcam"] = ::_id_16F9;
    level.bot_funcs["get_attacker_ent"] = maps\mp\bots\_bots_util::_id_1634;
    level.bot_funcs["should_pickup_weapons"] = ::_id_16FB;
    level.bot_funcs["on_damaged"] = ::_id_15E9;
    level.bot_funcs["gametype_think"] = ::_id_277D;
    level.bot_funcs["leader_dialog"] = maps\mp\bots\_bots_util::_id_1681;
    level.bot_funcs["player_spawned"] = ::_id_16BA;
    level.bot_funcs["should_start_cautious_approach"] = maps\mp\bots\_bots_strategy::_id_847B;
    level.bot_funcs["know_enemies_on_start"] = ::_id_167D;
    level.bot_funcs["bot_get_rank_xp_and_prestige"] = ::_id_163B;
    level.bot_funcs["bot_set_rank_options"] = ::bot_set_rank_options;
    level.bot_funcs["ai_3d_sighting_model"] = ::_id_159F;
    level.bot_funcs["dropped_weapon_think"] = ::_id_1716;
    level.bot_funcs["dropped_weapon_cancel"] = ::_id_847F;
    level.bot_funcs["crate_can_use"] = ::_id_2364;
    level.bot_funcs["post_teleport"] = ::_id_16BC;
    level._id_16C9 = [];
    level._id_16C9["allies"] = maps\mp\bots\_bots_personality::_id_16C8;
    level._id_16C9["axis"] = maps\mp\bots\_bots_personality::_id_16C8;
    level._id_1611["capture"] = maps\mp\bots\_bots_strategy::_id_375F;
    level._id_1611["capture_zone"] = maps\mp\bots\_bots_strategy::_id_3760;
    level._id_1611["protect"] = maps\mp\bots\_bots_strategy::_id_3762;
    level._id_1611["bodyguard"] = maps\mp\bots\_bots_strategy::_id_375E;
    level._id_1611["patrol"] = maps\mp\bots\_bots_strategy::_id_3761;
    maps\mp\bots\_bots_gametype_war::_id_8072();
}

codecallback_leaderdialog( var_0, var_1 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["leader_dialog"] ) )
        self [[ level.bot_funcs["leader_dialog"] ]]( var_0, var_1 );
}

init()
{
    thread _id_5E06();
    thread _id_171A();
    _id_4D93();

    if ( !_id_84AE() )
        return;

    _id_72C0();
    var_0 = botautoconnectenabled();

    if ( var_0 == "enabled_fill_open" || var_0 == "enabled_fill_open_dev" )
    {
        setmatchdata( "hasBots", 1 );
        level thread _id_15DF();
    }
    else
        level thread _id_16A5();
}

_id_4D93()
{
    if ( !isdefined( level._id_237E ) )
        level._id_237E = 500;

    if ( !isdefined( level._id_237A ) )
        level._id_237A = 3000;

    level._id_16AC = 3000;
    level._id_16CF["recruit"] = "rpg_mp";
    level._id_16CF["regular"] = "rpg_mp";
    level._id_16CF["hardened"] = "rpg_mp";
    level._id_16CF["veteran"] = "rpg_mp";
    level._id_160A = "h1_ak47";
    level._id_A3EF = getzonecount();
    _id_4D94();
    level thread maps\mp\bots\_bots_gametype_oldschool::bot_oldschool_init();
}

_id_4D94()
{
    if ( isdefined( level._id_925C ) )
        var_0 = [[ level._id_925C ]]();
    else
        var_0 = getallnodes();

    level._id_169C = 0;
    level._id_1699 = 0;
    level._id_169D = 0;
    level._id_169A = 0;
    level._id_169E = 0;
    level._id_169B = 0;

    if ( var_0.size > 1 )
    {
        level._id_169C = var_0[0].origin[0];
        level._id_1699 = var_0[0].origin[0];
        level._id_169D = var_0[0].origin[1];
        level._id_169A = var_0[0].origin[1];
        level._id_169E = var_0[0].origin[2];
        level._id_169B = var_0[0].origin[2];

        for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1].origin;

            if ( var_2[0] < level._id_169C )
                level._id_169C = var_2[0];

            if ( var_2[0] > level._id_1699 )
                level._id_1699 = var_2[0];

            if ( var_2[1] < level._id_169D )
                level._id_169D = var_2[1];

            if ( var_2[1] > level._id_169A )
                level._id_169A = var_2[1];

            if ( var_2[2] < level._id_169E )
                level._id_169E = var_2[2];

            if ( var_2[2] > level._id_169B )
                level._id_169B = var_2[2];
        }
    }

    level._id_1698 = ( ( level._id_169C + level._id_1699 ) / 2, ( level._id_169D + level._id_169A ) / 2, ( level._id_169E + level._id_169B ) / 2 );
    level._id_1729 = 1;
}

_id_16BC()
{
    level._id_1729 = undefined;
    _id_4D94();
}

_id_84AE()
{
    return 1;
}

_id_72C0()
{
    wait 1;

    foreach ( var_1 in level.players )
    {
        if ( isbot( var_1 ) )
        {
            var_1._id_3344 = 1;
            var_1._id_170E = var_1.team;
            var_1._id_1703 = 1;
            var_1 thread [[ level.bot_funcs["think"] ]]();
        }
    }
}

_id_16BA()
{
    _id_16EC();
}

_id_16EC()
{
    if ( !isdefined( self._id_15D8 ) )
    {
        if ( !_id_1620() )
        {
            while ( !isdefined( level._id_1695 ) )
                wait 0.05;

            if ( isdefined( self._id_6613 ) )
                self._id_15D8 = [[ self._id_6613 ]]();
            else
                self._id_15D8 = maps\mp\bots\_bots_personality::_id_16F3();
        }
        else
            self._id_15D8 = self.class;
    }
}

_id_A1F1()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) && level.players.size > 0 )
        {
            level._id_6D3C = common_scripts\utility::_id_0CDA( level._id_6D3C, var_0 );
            childthread _id_174A( var_0 );
            childthread _id_1749( var_0 );
            childthread _id_174B( var_0 );
        }
    }
}

_id_174A( var_0 )
{
    var_0 endon( "bots_human_disconnected" );

    while ( !common_scripts\utility::_id_0CE4( level.players, var_0 ) )
        wait 0.05;

    var_0 notify( "bots_human_spawned" );
}

_id_1749( var_0 )
{
    var_0 endon( "bots_human_spawned" );
    var_0 waittill( "disconnect" );
    var_0 notify( "bots_human_disconnected" );
}

_id_174B( var_0 )
{
    var_0 common_scripts\utility::_id_A069( "bots_human_spawned", "bots_human_disconnected" );
    level._id_6D3C = common_scripts\utility::_id_0CF6( level._id_6D3C, var_0 );
}

_id_5DD8()
{
    level._id_6D3C = [];
    childthread _id_A1F1();

    for (;;)
    {
        if ( level._id_6D3C.size > 0 )
            level._id_6729 = 1;
        else
            level._id_6729 = 0;

        wait 0.5;
    }
}

_id_15C5( var_0 )
{
    if ( maps\mp\_utility::_id_59E3() )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( maps\mp\gametypes\_teams::_id_3FDD( var_0 ) )
        return 1;

    return 0;
}

_id_15AA()
{
    if ( isdefined( level._id_1744 ) && level._id_1744 )
        return 0;

    if ( isdefined( level._id_59EA ) && level._id_59EA )
        return 0;

    return 1;
}

_id_15DF( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "bot_connect_monitor" );
    self endon( "bot_connect_monitor" );
    level._id_6729 = 0;
    childthread _id_5DD8();
    maps\mp\gametypes\_hostmigration::_id_A052( 0.5 );
    var_2 = 1.5;

    if ( !isdefined( level._id_15DB ) )
        level._id_15DB = 0;

    if ( !isdefined( level._id_15DC ) )
        level._id_15DC = 0;

    if ( !isdefined( level._id_15DA ) )
        level._id_15DA = 0;

    for (;;)
    {
        if ( level._id_6729 )
        {
            maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
            continue;
        }

        var_3 = isdefined( level._id_1748 ) || !level.teambased;
        var_4 = botgetteamlimit( 0 );
        var_5 = botgetteamlimit( 1 );
        var_6 = botgetteamdifficulty( 0 );
        var_7 = botgetteamdifficulty( 1 );
        var_11 = "allies";

        if ( isdefined( level.bot_last_team_ally ) )
            var_11 = level.bot_last_team_ally;

        var_12 = "axis";

        if ( isdefined( level.bot_last_team_enemy ) )
            var_12 = level.bot_last_team_enemy;

        var_13 = _id_15D9();
        var_14 = _id_1BC7( var_13, "humans" );

        if ( var_14 > 1 )
        {
            var_15 = _id_1632();

            if ( !maps\mp\_utility::_id_59E3() && isdefined( var_15 ) && var_15 != "spectator" )
            {
                var_11 = var_15;
                var_12 = maps\mp\_utility::getotherteam( var_15 );
            }
            else
            {
                var_16 = _id_1BC7( var_13, "humans_allies" );
                var_17 = _id_1BC7( var_13, "humans_axis" );

                if ( var_17 > var_16 )
                {
                    var_11 = "axis";
                    var_12 = "allies";
                }
            }
        }
        else
        {
            var_18 = _id_3DA3();

            if ( isdefined( var_18 ) )
            {
                var_19 = var_18 _id_163A();

                if ( isdefined( var_19 ) && var_19 != "spectator" )
                {
                    var_11 = var_19;
                    var_12 = maps\mp\_utility::getotherteam( var_19 );
                }
            }
        }

        level.bot_last_team_ally = var_11;
        level.bot_last_team_enemy = var_12;
        var_20 = maps\mp\bots\_bots_util::_id_163D();
        var_21 = maps\mp\bots\_bots_util::_id_163D();
        var_22 = maps\mp\bots\_bots_util::_id_162C();

        if ( var_20 + var_21 < var_22 )
        {
            if ( var_20 < var_4 )
                var_20++;
            else if ( var_21 < var_5 )
                var_21++;
        }

        var_23 = _id_1BC7( var_13, "humans_" + var_11 );
        var_24 = _id_1BC7( var_13, "humans_" + var_12 );
        var_25 = var_23 + var_24;
        var_26 = _id_1BC7( var_13, "spectator" );
        var_27 = 0;

        for ( var_28 = 0; var_26 > 0; var_26-- )
        {
            var_29 = var_23 + var_27 + 1 <= var_20;
            var_30 = var_24 + var_28 + 1 <= var_21;

            if ( var_29 && !var_30 )
            {
                var_27++;
                continue;
            }

            if ( !var_29 && var_30 )
            {
                var_28++;
                continue;
            }

            if ( var_29 && var_30 )
            {
                if ( var_26 % 2 == 1 )
                {
                    var_27++;
                    continue;
                }

                var_28++;
            }
        }

        var_31 = _id_1BC7( var_13, "bots_" + var_11 );
        var_32 = _id_1BC7( var_13, "bots_" + var_12 );
        var_33 = var_31 + var_32;

        if ( var_33 > 0 )
            level._id_15DB = 1;

        var_34 = 0;

        if ( !level._id_15DA )
        {
            var_34 = !_id_1633();

            if ( !var_34 )
                level._id_15DA = 1;
        }

        if ( var_34 )
        {
            var_35 = !isonlinegame();
            var_36 = !var_3 && var_5 != var_4 && !level._id_15DB && ( level._id_15DC < 10 || !maps\mp\_utility::_id_3BDD( "prematch_done" ) );
            var_37 = 0;

            if ( var_35 || var_36 || var_37 )
            {
                level._id_15DC += var_2;
                maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
                continue;
            }
        }

        var_38 = int( min( var_20 - var_23 - var_27, var_4 ) );
        var_39 = int( min( var_21 - var_24 - var_28, var_5 ) );
        var_40 = 1;
        var_41 = var_38 + var_39 + var_14;
        var_42 = var_4 + var_5 + var_14;

        for ( var_43 = [ -1, -1 ]; var_41 < var_22 && var_41 < var_42; var_40 = !var_40 )
        {
            if ( var_40 && var_38 < var_4 && _id_15C5( var_11 ) )
                var_38++;
            else if ( !var_40 && var_39 < var_5 && _id_15C5( var_12 ) )
                var_39++;

            var_41 = var_38 + var_39 + var_14;

            if ( var_43[var_40] == var_41 )
                break;

            var_43[var_40] = var_41;
        }

        level._id_169F[var_11] = int( var_38 + var_23 + var_27 );
        level._id_169F[var_12] = int( var_39 + var_24 + var_28 );
        _id_9AC6();

        if ( var_4 == var_5 && !var_3 && var_27 == 1 && var_28 == 0 && var_39 > 0 )
        {
            if ( !isdefined( level._id_16C1 ) && maps\mp\_utility::_id_3BDD( "prematch_done" ) )
                level._id_16C1 = gettime();

            if ( var_34 && ( !isdefined( level._id_16C1 ) || gettime() - level._id_16C1 < 10000 ) )
                var_39--;
        }

        var_45 = var_38 - var_31;
        var_46 = var_39 - var_32;
        var_47 = 1;

        if ( var_3 )
        {
            var_48 = var_20 + var_21;
            var_49 = var_4 + var_5;
            var_50 = var_23 + var_24;
            var_51 = var_31 + var_32;
            var_52 = int( min( var_48 - var_50, var_49 ) );
            var_53 = var_52 - var_51;

            if ( var_53 == 0 )
                var_47 = 0;
            else if ( var_53 > 0 )
            {
                var_45 = int( var_53 / 2 ) + var_53 % 2;
                var_46 = int( var_53 / 2 );
            }
            else if ( var_53 < 0 )
            {
                var_54 = var_53 * -1;
                var_45 = -1 * int( min( var_54, var_31 ) );
                var_46 = -1 * ( var_54 + var_45 );
            }
        }
        else if ( !maps\mp\_utility::_id_59E3() && ( var_45 * var_46 < 0 && maps\mp\_utility::_id_3BDD( "prematch_done" ) && _id_15AA() ) )
        {
            var_55 = int( min( abs( var_45 ), abs( var_46 ) ) );

            if ( var_45 > 0 )
                _id_5F03( var_55, var_12, var_11, var_6 );
            else if ( var_46 > 0 )
                _id_5F03( var_55, var_11, var_12, var_7 );

            var_47 = 0;
        }

        if ( var_47 )
        {
            if ( var_46 < 0 )
                _id_2F3E( var_46 * -1, var_12 );

            if ( var_45 < 0 )
                _id_2F3E( var_45 * -1, var_11 );

            if ( var_46 > 0 )
                level thread _id_88D8( var_46, var_12, undefined, undefined, "spawned_enemies", var_7 );

            if ( var_45 > 0 )
                level thread _id_88D8( var_45, var_11, undefined, undefined, "spawned_allies", var_6 );

            if ( var_46 > 0 && var_45 > 0 )
                level common_scripts\utility::_id_A09A( "spawned_enemies", "spawned_allies" );
            else if ( var_46 > 0 )
                level waittill( "spawned_enemies" );
            else if ( var_45 > 0 )
                level waittill( "spawned_allies" );
        }

        if ( var_7 != var_6 )
        {
            _id_174C( var_12, var_7 );
            _id_174C( var_11, var_6 );
        }

        maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
    }
}

_id_16A5()
{
    level endon( "game_ended" );
    self notify( "bot_monitor_team_limits" );
    self endon( "bot_monitor_team_limits" );
    maps\mp\gametypes\_hostmigration::_id_A052( 0.5 );
    var_0 = 1.5;

    for (;;)
    {
        level._id_169F["allies"] = 0;
        level._id_169F["axis"] = 0;

        foreach ( var_2 in level.players )
        {
            if ( isdefined( var_2.team ) && ( var_2.team == "allies" || var_2.team == "axis" ) )
                level._id_169F[var_2.team]++;
        }

        _id_9AC6();
        maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    }
}

_id_9AC6()
{
    if ( isdefined( level.agentarray ) )
    {
        foreach ( var_1 in level.agentarray )
        {
            if ( isdefined( var_1.isactive ) && var_1.isactive )
            {
                if ( maps\mp\_utility::_id_51CE( var_1 ) && isdefined( var_1.team ) && ( var_1.team == "allies" || var_1.team == "axis" ) )
                    level._id_169F[var_1.team]++;
            }
        }
    }
}

_id_163A()
{
    if ( isdefined( self.team ) )
        return self.team;

    if ( isdefined( self.pers["team"] ) )
        return self.pers["team"];

    return undefined;
}

_id_1632()
{
    foreach ( var_1 in level.players )
    {
        if ( !isai( var_1 ) && var_1 ishost() )
            return var_1 _id_163A();
    }

    return "spectator";
}

_id_1633()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level.players )
    {
        if ( !isai( var_4 ) )
        {
            if ( var_4 ishost() )
                var_0 = 1;

            if ( _id_6BB8( var_4 ) )
            {
                var_1 = 1;

                if ( var_4 ishost() )
                    var_2 = 1;
            }
        }
    }

    return var_2 || var_1 && !var_0;
}

_id_6BB8( var_0 )
{
    if ( isdefined( var_0.team ) && var_0.team != "spectator" )
        return 1;

    if ( isdefined( var_0._id_8A4B ) && var_0._id_8A4B )
        return 1;

    if ( var_0 _meth_842d() )
        return 1;

    return 0;
}

_id_15D9()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        var_2 = level.players[var_1];

        if ( isdefined( var_2 ) && isdefined( var_2.team ) )
        {
            var_0 = _id_1BC6( var_0, "all" );
            var_0 = _id_1BC6( var_0, var_2.team );

            if ( isbot( var_2 ) )
            {
                var_0 = _id_1BC6( var_0, "bots" );
                var_0 = _id_1BC6( var_0, "bots_" + var_2.team );
                continue;
            }

            var_0 = _id_1BC6( var_0, "humans" );
            var_0 = _id_1BC6( var_0, "humans_" + var_2.team );
        }
    }

    return var_0;
}

_id_1BC6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [];

    if ( !isdefined( var_0[var_1] ) )
        var_0[var_1] = 0;

    var_0[var_1] += 1;
    return var_0;
}

_id_1BC7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0[var_1] ) )
        return 0;

    return var_0[var_1];
}

_id_5F03( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level.players )
    {
        if ( !isdefined( var_5.team ) )
            continue;

        if ( isdefined( var_5._id_2148 ) && var_5._id_2148 && isbot( var_5 ) && var_5.team == var_1 )
        {
            var_5._id_170E = var_2;

            if ( isdefined( var_3 ) )
                var_5 maps\mp\bots\_bots_util::_id_16EB( var_3 );

            var_5 notify( "luinotifyserver", "team_select", _id_1696( var_2 ) );
            wait 0.05;
            var_5 notify( "luinotifyserver", "class_select", var_5._id_15D8 );
            var_0--;

            if ( var_0 <= 0 )
                break;
            else
                wait 0.1;
        }
    }
}

_id_174C( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( isdefined( var_3._id_2148 ) && var_3._id_2148 && isbot( var_3 ) && var_3.team == var_0 )
        {
            if ( var_1 != var_3 botgetdifficulty() )
                var_3 maps\mp\bots\_bots_util::_id_16EB( var_1 );
        }
    }
}

_id_1603()
{
    kick( self.entity_number, "EXE_PLAYERKICKED_BOT_BALANCE" );
    wait 0.1;
}

_id_2F3E( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( isdefined( var_4._id_2148 ) && var_4._id_2148 && isbot( var_4 ) && ( !isdefined( var_1 ) || isdefined( var_4.team ) && var_4.team == var_1 ) )
            var_2[var_2.size] = var_4;
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        if ( !maps\mp\_utility::_id_5189( var_2[var_6] ) )
        {
            var_2[var_6] _id_1603();
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_2[var_6] );
            var_0--;
        }
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        var_2[var_6] _id_1603();
        var_0--;
    }
}

_id_1696( var_0 )
{
    if ( var_0 == "axis" )
        return 0;
    else if ( var_0 == "allies" )
        return 1;
    else if ( var_0 == "autoassign" || var_0 == "random" )
        return 2;
    else
        return 3;
}

_id_88D7( var_0, var_1, var_2 )
{
    var_3 = gettime() + 60000;

    while ( !self canspawntestclient() )
    {
        if ( gettime() >= var_3 )
        {
            kick( self.entity_number, "EXE_PLAYERKICKED_BOT_BALANCE" );
            var_2._id_06BA = 1;
            return;
        }

        wait 0.05;

        if ( !isdefined( self ) )
        {
            var_2._id_06BA = 1;
            return;
        }
    }

    maps\mp\gametypes\_hostmigration::_id_A052( randomfloatrange( 0.25, 2.0 ) );

    if ( !isdefined( self ) )
    {
        var_2._id_06BA = 1;
        return;
    }

    self spawntestclient();
    self._id_3344 = 1;
    self._id_170E = var_0;

    if ( isdefined( var_2._id_2A5F ) )
        maps\mp\bots\_bots_util::_id_16EB( var_2._id_2A5F );

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();

    self thread [[ level.bot_funcs["think"] ]]();
    var_2._id_71D4 = 1;
}

_id_88D8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = gettime() + 10000;
    var_7 = [];
    var_8 = var_7.size;

    while ( level.players.size < maps\mp\bots\_bots_util::_id_162C() && var_7.size < var_0 && gettime() < var_6 )
    {
        maps\mp\gametypes\_hostmigration::_id_A052( 0.05 );
        var_9 = addbot( "" );

        if ( !isdefined( var_9 ) )
        {
            if ( isdefined( var_3 ) && var_3 )
            {
                if ( isdefined( var_4 ) )
                    self notify( var_4 );

                return;
            }

            maps\mp\gametypes\_hostmigration::_id_A052( 1 );
            continue;
        }
        else
        {
            var_10 = spawnstruct();
            var_10._id_159E = var_9;
            var_10._id_71D4 = 0;
            var_10._id_06BA = 0;
            var_10.index = var_8;
            var_10._id_2A5F = var_5;
            var_7[var_7.size] = var_10;
            var_10._id_159E thread _id_88D7( var_1, var_2, var_10 );
            var_8++;
        }
    }

    var_11 = 0;
    var_6 = gettime() + 60000;

    while ( var_11 < var_7.size && gettime() < var_6 )
    {
        var_11 = 0;

        foreach ( var_10 in var_7 )
        {
            if ( var_10._id_71D4 || var_10._id_06BA )
                var_11++;
        }

        wait 0.05;
    }

    if ( isdefined( var_4 ) )
        self notify( var_4 );
}

_id_1621()
{
    if ( maps\mp\_utility::_id_59E3() && self.sessionteam != "none" )
        var_0 = 0;
    else if ( !maps\mp\_utility::_id_59E3() && !maps\mp\_utility::forceautoassign() && maps\mp\_utility::_id_0AB0() )
        var_0 = 1;
    else
        var_0 = 0;

    return !var_0;
}

_id_1620()
{
    return isdefined( level._id_1746 ) && level._id_1746;
}

_id_170F()
{
    self notify( "bot_think" );
    self endon( "bot_think" );
    self endon( "disconnect" );

    while ( !isdefined( self.pers["team"] ) )
        wait 0.05;

    level._id_4722 = 1;

    if ( _id_1621() )
        self._id_170E = self.pers["team"];

    var_0 = self._id_170E;

    if ( !isdefined( var_0 ) )
        var_0 = self.pers["team"];

    self.entity_number = self getentitynumber();
    var_1 = 0;

    if ( !isdefined( self._id_1703 ) )
    {
        var_1 = 1;
        self._id_1703 = 1;

        if ( !_id_1621() )
        {
            var_2 = self.pers["team"] != "spectator" && !isdefined( self._id_170E );

            if ( !var_2 )
            {
                self notify( "luinotifyserver", "team_select", _id_1696( var_0 ) );
                wait 0.5;

                if ( self.pers["team"] == "spectator" )
                {
                    _id_1603();
                    return;
                }
            }
        }
    }

    for (;;)
    {
        maps\mp\bots\_bots_util::_id_16EB( self botgetdifficulty() );
        self._id_2A5F = self botgetdifficulty();
        var_3 = self botgetdifficultysetting( "advancedPersonality" );

        if ( var_1 && isdefined( var_3 ) && var_3 != 0 )
            maps\mp\bots\_bots_personality::_id_15B0();

        maps\mp\bots\_bots_personality::_id_15AD();

        if ( var_1 )
        {
            _id_16EC();

            if ( !_id_1620() )
            {
                if ( maps\mp\_utility::ishodgepodgeph() && var_0 == game["attackers"] && game["roundsPlayed"] > 0 )
                    wait 0.5;

                self notify( "luinotifyserver", "class_select", self._id_15D8 );
            }

            if ( self.health == 0 )
                self waittill( "spawned_player" );

            if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["know_enemies_on_start"] ) )
                self thread [[ level.bot_funcs["know_enemies_on_start"] ]]();

            var_1 = 0;
        }

        maps\mp\bots\_bots_loadout::bot_modify_behavior_from_loadout();
        bot_modify_behavior_from_tweakables();
        _id_16D0();
        wait 0.1;
        self waittill( "death" );
        _id_7476();
        self waittill( "spawned_player" );
    }
}

bot_set_rank_options()
{
    if ( !isdefined( self.pers["shouldApplyEmblemToWeapon"] ) )
        self.pers["shouldApplyEmblemToWeapon"] = self.pers["rank"] >= 29 && common_scripts\utility::_id_2006();

    if ( !isdefined( self.pers["shouldApplyEmblemToCharacter"] ) )
        self.pers["shouldApplyEmblemToCharacter"] = self.pers["rank"] >= 19 && common_scripts\utility::_id_2006();
}

bot_modify_behavior_from_tweakables()
{
    if ( maps\mp\gametypes\_tweakables::_id_4142( "game", "onlyheadshots" ) )
        self botsetflag( "only_headshots", 1 );
}

_id_7476()
{
    self endon( "started_spawnPlayer" );

    while ( !self._id_A04D )
        wait 0.05;

    if ( maps\mp\gametypes\_playerlogic::_id_6081() )
    {
        while ( self._id_A04D )
        {
            if ( self.sessionstate == "spectator" )
            {
                if ( getdvarint( "numlives" ) == 0 || self.pers["lives"] > 0 )
                    self _meth_837c( "use", 0.5 );
            }

            wait 1.0;
        }
    }
}

_id_1667()
{
    return self _meth_837b();
}

_id_163B()
{
    var_0 = spawnstruct();

    if ( !_id_1667() )
    {
        if ( !isdefined( self.pers["rankxp"] ) )
            self.pers["rankxp"] = 0;

        if ( !isdefined( self.pers["prestige"] ) )
            self.pers["prestige"] = 0;

        var_0._id_713C = self.pers["rankxp"];
        var_0.prestige = self.pers["prestige"];
        return var_0;
    }

    var_1 = self botgetdifficulty();
    var_2 = "bot_rank_" + var_1;
    var_3 = "bot_prestige_" + var_1;
    var_4 = self.pers[var_2];
    var_5 = self.pers[var_3];
    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_0._id_713C = var_4;
    else
    {
        if ( !isdefined( var_6 ) )
            var_6 = _id_16CA( var_1 );

        var_7 = var_6["rank"];
        var_8 = maps\mp\gametypes\_rank::_id_40AF( var_7 );
        var_9 = maps\mp\gametypes\_rank::_id_40AE( var_7 );
        var_10 = randomintrange( var_8, var_9 );
        self.pers[var_2] = var_10;
        var_0._id_713C = var_10;
    }

    if ( isdefined( var_5 ) )
        var_0.prestige = var_5;
    else
    {
        if ( !isdefined( var_6 ) )
            var_6 = _id_16CA( var_1 );

        var_11 = var_6["prestige"];
        self.pers[var_3] = var_11;
        var_0.prestige = var_11;
    }

    return var_0;
}

_id_159F( var_0 )
{
    thread _id_15A0( var_0 );
}

_id_15A0( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( isalive( self ) && !self botcanseeentity( var_0 ) && common_scripts\utility::_id_A347( self.origin, self getplayerangles(), var_0.origin, self _meth_8371() ) )
            self botgetimperfectenemyinfo( var_0, var_0.origin );

        wait 0.1;
    }
}

_id_16CA( var_0 )
{
    var_1 = [];
    var_1["rank"] = 0;
    var_1["prestige"] = 0;

    if ( var_0 == "default" )
        return var_1;

    if ( !isdefined( level._id_16D3 ) )
    {
        level._id_16D3 = [];
        level._id_16D3["recruit"][0] = 0;
        level._id_16D3["recruit"][1] = 1;
        level._id_16D3["regular"][0] = 20;
        level._id_16D3["regular"][1] = 28;
        level._id_16D3["hardened"][0] = 40;
        level._id_16D3["hardened"][1] = 48;
        level._id_16D3["veteran"][0] = 50;
        level._id_16D3["veteran"][1] = 54;
    }

    if ( !isdefined( level._id_16D2 ) )
    {
        level._id_16D2 = [];
        level._id_16D2["recruit"][0] = 0;
        level._id_16D2["recruit"][1] = 0;
        level._id_16D2["regular"][0] = 0;
        level._id_16D2["regular"][1] = 0;
        level._id_16D2["hardened"][0] = 0;
        level._id_16D2["hardened"][1] = 0;
        level._id_16D2["veteran"][0] = 0;
        level._id_16D2["veteran"][1] = level.maxprestige;
    }

    var_1["rank"] = randomintrange( level._id_16D3[var_0][0], level._id_16D3[var_0][1] + 1 );
    var_1["prestige"] = randomintrange( level._id_16D2[var_0][0], level._id_16D2[var_0][1] + 1 );
    return var_1;
}

_id_2364( var_0 )
{
    if ( isagent( self ) && !isdefined( var_0._id_175D ) )
        return 0;

    return 1;
}

_id_3DA3()
{
    var_0 = undefined;
    var_1 = getentarray( "player", "classname" );

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            if ( isdefined( var_1[var_2] ) && isdefined( var_1[var_2]._id_2148 ) && var_1[var_2]._id_2148 && !isai( var_1[var_2] ) && ( !isdefined( var_0 ) || var_0.team == "spectator" ) )
                var_0 = var_1[var_2];
        }
    }

    return var_0;
}

_id_15E9( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( self ) || !isalive( self ) )
        return;

    if ( var_2 == "MOD_FALLING" || var_2 == "MOD_SUICIDE" )
        return;

    if ( var_1 <= 0 )
        return;

    if ( !isdefined( var_4 ) )
    {
        if ( !isdefined( var_0 ) )
            return;

        var_4 = var_0;
    }

    if ( isdefined( var_4 ) )
    {
        if ( level.teambased )
        {
            if ( isdefined( var_4.team ) && var_4.team == self.team )
                return;
            else if ( isdefined( var_0 ) && isdefined( var_0.team ) && var_0.team == self.team )
                return;
        }

        var_6 = maps\mp\bots\_bots_util::_id_1634( var_0, var_4 );

        if ( isdefined( var_6 ) )
            self botsetattacker( var_6 );
    }
}

_id_6440( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self botclearscriptenemy();
    self botclearscriptgoal();
    var_10 = maps\mp\bots\_bots_util::_id_1634( var_1, var_0 );

    if ( isdefined( var_10 ) && var_10.classname == "misc_turret" && isdefined( var_10.chopper ) )
        var_10 = var_10.chopper;

    if ( isdefined( var_10 ) && ( var_10.classname == "script_vehicle" || var_10.classname == "script_model" ) && isdefined( var_10._id_4818 ) )
    {
        var_11 = self botgetdifficultysetting( "launcherRespawnChance" );

        if ( randomfloat( 1.0 ) < var_11 )
            self._id_7477 = 1;
    }
}

_id_16F9()
{
    var_5 = 0.0;
    var_6 = self botgetdifficulty();

    if ( var_6 == "recruit" )
        var_5 = 0.1;
    else if ( var_6 == "regular" )
        var_5 = 0.4;
    else if ( var_6 == "hardened" )
        var_5 = 0.7;
    else if ( var_6 == "veteran" )
        var_5 = 1.0;

    return randomfloat( 1.0 ) < 1.0 - var_5;
}

_id_16FB()
{
    if ( maps\mp\_utility::_id_5131() )
        return 0;

    return 1;
}

_id_16D0()
{
    thread _id_1719();
    thread maps\mp\bots\_bots_strategy::_id_1717();
    self thread [[ level.bot_funcs["dropped_weapon_think"] ]]();
    thread maps\mp\bots\_bots_gametype_oldschool::bot_think_oldschool();
    thread maps\mp\bots\_bots_ks::_id_1713();
    thread maps\mp\bots\_bots_ks::_id_1718();
    thread _id_1712();
}

_id_1719( var_0 )
{
    var_1 = "spawned_player";

    if ( isdefined( var_0 ) && var_0 )
        var_1 = "death";

    self notify( "bot_think_watch_enemy" );
    self endon( "bot_think_watch_enemy" );
    self endon( var_1 );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_5523 = 0;

    for (;;)
    {
        if ( isdefined( self.enemy ) )
        {
            if ( self botcanseeentity( self.enemy ) )
                self._id_5523 = gettime();
        }

        wait 0.05;
    }
}

_id_1716()
{
    self notify( "bot_think_seek_dropped_weapons" );
    self endon( "bot_think_seek_dropped_weapons" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = 0;

        if ( maps\mp\bots\_bots_util::_id_16AB() )
        {
            if ( self [[ level.bot_funcs["should_pickup_weapons"] ]]() && !maps\mp\bots\_bots_util::_id_1664() )
            {
                var_1 = getentarray( "dropped_weapon", "targetname" );
                var_2 = common_scripts\utility::_id_3CCB( self.origin, var_1 );

                if ( var_2.size > 0 )
                {
                    var_3 = var_2[0];
                    _id_16D9( var_3 );
                }
            }
        }

        wait(randomfloatrange( 0.25, 0.75 ));
    }
}

_id_16D9( var_0 )
{
    if ( maps\mp\bots\_bots_strategy::_id_1649( "seek_dropped_weapon", var_0 ) == 0 )
    {
        var_1 = undefined;

        if ( var_0.targetname == "dropped_weapon" )
        {
            var_2 = 1;
            var_3 = self getweaponslistprimaries();

            foreach ( var_5 in var_3 )
            {
                if ( var_0.model == getweaponmodel( var_5 ) )
                    var_2 = 0;
            }

            if ( var_2 )
                var_1 = ::_id_16B9;
        }

        var_7 = spawnstruct();
        var_7._id_62E1 = var_0;
        var_7._id_79FE = 12;
        var_7._id_844D = level.bot_funcs["dropped_weapon_cancel"];
        var_7._id_06ED = var_1;
        maps\mp\bots\_bots_strategy::_id_16A9( "seek_dropped_weapon", var_0.origin, 100, var_7 );
    }
}

_id_16B9( var_0 )
{
    self _meth_837c( "use", 2 );
    wait 2;
}

_id_847F( var_0 )
{
    if ( !isdefined( var_0._id_62E1 ) )
        return 1;

    if ( var_0._id_62E1.targetname == "dropped_weapon" )
    {
        if ( maps\mp\bots\_bots_util::_id_1641() > 0 )
            return 1;
    }
    else if ( var_0._id_62E1.targetname == "dropped_knife" )
    {
        if ( maps\mp\bots\_bots_util::_id_1650() )
        {
            self._id_425A = undefined;
            return 1;
        }
    }

    return 0;
}

_id_167D()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( gettime() > 15000 )
        return;

    while ( !maps\mp\_utility::_id_3BE2() || !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        wait 0.05;

    var_0 = undefined;
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3 ) && isdefined( self.team ) && isdefined( var_3.team ) && !isalliedsentient( self, var_3 ) )
        {
            if ( !isdefined( var_3._id_1706 ) )
                var_0 = var_3;

            if ( isai( var_3 ) && !isdefined( var_3._id_1705 ) )
                var_1 = var_3;
        }
    }

    if ( isdefined( var_0 ) )
    {
        self._id_1705 = 1;
        var_0._id_1706 = 1;
        self _meth_8169( var_0 );
    }

    if ( isdefined( var_1 ) )
    {
        var_1._id_1705 = 1;
        self._id_1706 = 1;
        var_1 _meth_8169( self );
    }
}

_id_1697( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        return self makeentitysentient( var_0, var_1 );
    else
        return self makeentitysentient( var_0 );
}

_id_1712()
{
    self notify( "bot_think_gametype" );
    self endon( "bot_think_gametype" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    self thread [[ level.bot_funcs["gametype_think"] ]]();
}

_id_277D()
{

}

_id_5E06()
{
    maps\mp\bots\_bots_util::_id_172D();
    level.bot_smoke_sight_clip_small = getent( "smoke_grenade_sight_clip_small", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_small ) )
        return;

    level.bot_smoke_sight_clip_medium = getent( "smoke_grenade_sight_clip_medium", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_medium ) )
        return;

    level.bot_smoke_sight_clip_large = getent( "smoke_grenade_sight_clip_large", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_large ) )
        return;

    for (;;)
    {
        level waittill( "smoke", var_0, var_1 );
        var_2 = maps\mp\_utility::_id_8F5C( var_1, "_lefthand" );

        if ( var_2 == "h1_smokegrenade_mp" )
            var_0 thread _id_460E();
    }
}

_id_460E()
{
    self waittill( "explode", var_0 );
    var_1 = common_scripts\utility::_id_8959();
    var_1 show();
    var_1.origin = var_0;
    var_2 = 0.3;
    wait(var_2);
    var_2 = 0.65;
    var_1 clonebrushmodeltoscriptmodel( level.bot_smoke_sight_clip_small );
    wait(var_2);
    var_2 = 1.5;
    var_1 clonebrushmodeltoscriptmodel( level.bot_smoke_sight_clip_medium );
    wait(var_2);
    var_2 = 7.95;
    var_1 clonebrushmodeltoscriptmodel( level.bot_smoke_sight_clip_large );
    wait(var_2);
    var_1 delete();
}

_id_15A4( var_0 )
{
    var_1 = 0;
    var_0._id_175D = "scavenger_bag";
    var_0._id_175B = 1;

    if ( !isdefined( level._id_16D4 ) )
        level._id_16D4 = [];

    foreach ( var_4, var_3 in level._id_16D4 )
    {
        if ( !isdefined( var_3 ) )
        {
            var_1 = 1;
            level._id_16D4[var_4] = var_0;
            break;
        }
    }

    if ( !var_1 )
        level._id_16D4[level._id_16D4.size] = var_0;

    foreach ( var_6 in level.participants )
    {
        if ( isai( var_6 ) && var_6 maps\mp\_utility::_hasperk( "specialty_scavenger" ) )
            var_6 notify( "new_crate_to_take" );
    }
}

_id_171A()
{
    var_0 = getentarray( "bot_flag_set", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        var_2 thread _id_1618( var_2.script_noteworthy );
    }
}

_id_1618( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( maps\mp\_utility::_id_50AD( var_1 ) )
        {
            var_1 notify( "flag_trigger_set_" + var_0 );
            var_1 botsetflag( var_0, 1 );
            var_1 thread _id_1619( var_0 );
        }
    }
}

_id_1619( var_0 )
{
    self endon( "flag_trigger_set_" + var_0 );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    waittillframeend;
    waitframe;
    self botsetflag( var_0, 0 );
}
