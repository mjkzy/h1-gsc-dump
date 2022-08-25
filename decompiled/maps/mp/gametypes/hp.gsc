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
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registertimelimitdvar( level.gametype, 30 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 300 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.teambased = 1;
    level._id_7130 = maps\mp\_utility::_id_3FDB( "scr_hp_radom_selection", 0 );
    level._id_4AA8 = 0;
    level._id_A3F2 = 60;
    level._id_4DE4 = maps\mp\_utility::_id_3FDB( "scr_hp_zone_delay", 0 );
    level._id_6C6D = 6;
    level._id_78A3 = 0;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level._id_64D3 = ::_id_64D3;
    level._id_64DA = ::_id_64DA;
    game["dialog"]["gametype"] = "hpt_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    if ( !level._id_4DE4 )
    {
        game["dialog"]["offense_obj"] = "null";
        game["dialog"]["defense_obj"] = "null";
    }

    game["objective_active"] = "mp_killstreak_radar";
    game["objective_gained_sound"] = "h1_mp_war_objective_taken";
    game["objective_lost_sound"] = "h1_mp_war_objective_lost";
    game["objective_contested_sound"] = "mp_obj_notify_neg_sml";
    level._id_5594 = 0;
    level._id_A3F8 = [];
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
    maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
    maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
    setdynamicdvar( "scr_hp_radom_selection", getmatchrulesdata( "hpData", "randomZones" ) );
    setdynamicdvar( "scr_hp_zone_delay", getmatchrulesdata( "hpData", "initDelay" ) );
}

_id_64DA()
{
    level._id_62FD = &"MP_CONTROL_KOTH";
    level._id_62FB = &"MP_CAPTURE_KOTH";
    level._id_62FC = &"MP_DEFEND_KOTH";
    level._id_4B4A = "waypoint_captureneutral";
    level._id_4B49 = "waypoint_captureneutral";
    level._id_4B32 = "waypoint_capture";
    level._id_4B31 = "waypoint_capture";
    level._id_4B39 = "waypoint_defend";
    level._id_4B38 = "waypoint_defend";
    level._id_4B36 = "waypoint_contested";
    level._id_4B35 = "waypoint_contested";
    level._id_4B4B = "waypoint_esports_hardpoint_white";
    level._id_4B30 = "waypoint_esports_hardpoint_blue";
    level._id_4B4D = "waypoint_esports_hardpoint_red";
    level._id_4B37 = "waypoint_contested";
    level._id_A3F7 = &"MP_KOTH_AVAILABLE_IN";
    level._id_A3F1 = &"MP_KOTH_MOVING_IN";
}

_id_9B41( var_0, var_1 )
{
    game["strings"]["objective_hint_allies"] = var_0;
    game["strings"]["objective_hint_axis"] = var_1;
}

_id_9B40( var_0 )
{
    _id_9B41( var_0, var_0 );
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_KOTH" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_KOTH" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_KOTH" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_KOTH" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_KOTH_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_KOTH_SCORE" );
    }

    if ( level._id_4DE4 )
        _id_9B40( level._id_62FD );
    else
        _id_9B40( level._id_62FB );

    setclientnamemode( "auto_change" );
    initspawns();
    var_2[0] = "hp";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    setomnvar( "ui_mlg_game_mode_status_2", 0 );
    level thread _id_64C8();
    level thread _id_8348();
    level thread _id_46CD();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_3BFA = 0;
        var_0.objective = 0;
        var_0._id_940F = [];
    }
}

initspawns()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_hp_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_hp_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_hp_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_hp_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getotherteam( var_0 );

    if ( level.usestartspawns && level.ingraceperiod )
        var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_hp_spawn_" + var_0 + "_start" );
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D6( var_2 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_4AA9()
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_9B98();
    setomnvar( "ui_mlg_game_mode_status_1", level._id_A3DD._id_3BF8._id_62AF["allies"] );
    setomnvar( "ui_mlg_game_mode_status_2", level._id_A3DD._id_3BF8._id_62AF["axis"] );
}

_id_892F()
{
    if ( level._id_7130 )
        level._id_A3DD = _id_4046();
    else
        level._id_A3DD = _id_4045();

    _id_7FBB();
    level._id_A3DD namedborderhidden();
}

_id_4AA7()
{
    level endon( "game_ended" );
    level endon( "zone_moved" );
    level._id_4AA8 = gettime();

    for (;;)
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::allowuse( "any" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::setusetime( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_834B( &"MP_CAPTURING_OBJECTIVE" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 1 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_600A( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_1AC3( 1 );
        level._id_A3DD._id_3BF8.onuse = ::_id_64FF;
        var_0 = level common_scripts\utility::_id_A070( "zone_captured", "zone_destroyed" );

        if ( var_0 == "zone_destroyed" )
            continue;

        var_1 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "allies" )
            _id_9B41( level._id_62FC, level._id_62FB );
        else if ( var_1 == "axis" )
            _id_9B41( level._id_62FB, level._id_62FC );
        else
            _id_9B41( level._id_62FB, level._id_62FB );

        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::allowuse( "none" );
        level._id_A3DD._id_3BF8.onuse = undefined;
        level._id_A3DD._id_3BF8._id_64F6 = ::_id_6502;
        level._id_A3DD._id_3BF8._id_6462 = ::_id_6500;
        level._id_A3DD._id_3BF8._id_64F4 = ::_id_6501;
        level waittill( "zone_destroyed", var_2 );
        thread _id_39CB( var_1 );

        if ( isdefined( var_2 ) )
        {
            level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( var_2 );
            continue;
        }

        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( "none" );
    }
}

_id_9B20()
{
    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            var_2 = var_1;

            if ( var_1.team == "spectator" || var_1.sessionstate == "spectator" )
                var_2 = var_1 getspectatingplayer();

            if ( !maps\mp\_utility::_id_5189( var_2 ) )
            {
                var_1 _id_7F7A( var_1, 0 );
                continue;
            }

            if ( var_2._id_940F.size == 0 )
            {
                var_1 _id_7F7A( var_1, 0 );
                continue;
            }

            foreach ( var_4 in var_2._id_940F )
            {
                if ( var_4 == level._id_A3DD._id_3BF8.trigger )
                {
                    var_1 _id_7F7A( var_1, 1 );
                    break;
                }

                var_1 _id_7F7A( var_1, 0 );
            }
        }

        wait 0.05;
    }
}

_id_7F7A( var_0, var_1 )
{
    var_2 = 0;

    if ( var_1 )
    {
        var_2 = 1;

        if ( isdefined( level._id_A3DD._id_3BF8._id_50E5 ) && level._id_A3DD._id_3BF8._id_50E5 )
            var_2 = 2;
    }

    if ( var_2 != var_0._id_3BFA )
    {
        var_0 setclientomnvar( "ui_hardpoint", var_2 );
        var_0._id_3BFA = var_2;
        var_0.objective = var_2;
    }
}

_id_46CD()
{
    level endon( "game_ended" );
    level._id_A3F5 = -100000;
    level._id_A3DD = _id_3F97();
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    level childthread _id_9B20();

    for (;;)
    {
        maps\mp\_utility::_id_6DDD( "mp_suitcase_pickup" );
        maps\mp\_utility::_id_38F7( "gamemode_objective" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 1 );
        level._id_A3DD._id_3BF8._id_64F7 = ::_id_4AA9;
        level._id_A3F5 = gettime();

        if ( level._id_4DE4 )
        {
            _id_8354( level._id_A3DD );
            level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
            level._id_A3DD namedborderneutral();
            _id_9B40( level._id_62FD );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_4DE4 );
            wait(level._id_4DE4);
        }

        waitframe;
        _id_7FBB( level._id_A3DD );
        maps\mp\_utility::_id_564B( "hp_online", undefined, "gamemode_objective" );
        _id_9B40( level._id_62FB );
        level thread maps\mp\_utility::_id_6DDD( game["objective_active"] );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_3114();
        level._id_A3DD._id_3BF8._id_1B4B = 0;
        level._id_A3DD namedborderneutral();

        if ( level._id_A3F2 )
        {
            thread _id_5F9D( level._id_A3F2 );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_A3F2 );
        }
        else
            level._id_A3F0 = 0;

        _id_4AA7();
        var_0 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();
        level._id_A3DD._id_3BF8._id_557E = undefined;
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_2B1E();
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::allowuse( "none" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_600A( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        level._id_A3DD namedborderhidden();
        level notify( "zone_reset" );

        if ( isdefined( level._id_4AA5 ) && level._id_4AA5 == 1 )
            level waittill( "ready_for_next_hp_zone" );

        _id_892F();
        wait 0.5;
        thread _id_39CB( var_0 );
        wait 0.5;
    }
}

_id_39CB( var_0 )
{
    var_1 = level.players;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.pers["team"] == var_0 )
        {
            var_3 notify( "force_spawn" );
            wait 0.1;
        }
    }
}

_id_64FF( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = maps\mp\_utility::getotherteam( var_1 );
    var_3 = gettime();
    var_0 logstring( "zone captured" );
    level._id_A3DD._id_3BF8._id_50E5 = 0;
    level.usestartspawns = 0;
    _id_802A( var_1 );
    level._id_A3DD namedborderowned( var_1 );

    if ( !isdefined( self._id_557E ) || self._id_557E != var_1 )
    {
        var_4 = [];
        var_5 = getarraykeys( self._id_940D[var_1] );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            var_4[var_5[var_6]] = self._id_940D[var_1][var_5[var_6]];

        level thread _id_41B9( var_4, var_3, var_1, self._id_557E );
        level thread maps\mp\_utility::_id_564B( "hp_secured", var_1, "gamemode_objective" );
        level thread maps\mp\_utility::_id_564B( "hp_lost", var_2, "gamemode_objective" );
    }

    level thread maps\mp\_utility::_id_6DDD( game["objective_gained_sound"], var_1 );
    level thread maps\mp\_utility::_id_6DDD( game["objective_lost_sound"], var_2 );
    level._id_4AA6 = var_1;
    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );

    if ( isdefined( self._id_557E ) && self._id_557E != var_1 )
    {
        for ( var_7 = 0; var_7 < level.players.size; var_7++ )
        {
            var_0 = level.players[var_7];

            if ( var_0.pers["team"] == var_1 )
            {
                if ( isdefined( var_0.lastkilldefendertime ) && var_0.lastkilldefendertime + 500 > gettime() )
                    var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_killedLastContester" );
            }
        }
    }

    level thread awardcapturepoints( var_1, self._id_557E );
    self._id_1B4B++;
    self._id_557E = var_1;
    maps\mp\gametypes\_gameobjects::_id_600A( 1 );
    level notify( "zone_captured" );
    level notify( "zone_captured" + var_1 );
}

_id_41B9( var_0, var_1, var_2, var_3 )
{
    var_4 = getarraykeys( var_0 );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = var_0[var_4[var_5]].player;
        var_6 _id_9AFB( var_3 );

        if ( !_id_519A( var_6 ) )
        {
            var_6 maps\mp\gametypes\_misions::_id_6FF6( "ch_hpcaptures" );

            if ( level._id_4AA8 + 500 > var_1 )
                var_6 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_immediateCapture" );

            var_6 thread maps\mp\_events::_id_7C06();
        }
        else
        {

        }

        wait 0.05;
    }
}

namedbordervisible( var_0, var_1 )
{
    if ( !isdefined( self.namedborders[var_0] ) )
        return;

    foreach ( var_3 in self.namedborders[var_0] )
    {
        var_3 notify( "stopShowFXToTeam" );

        if ( var_1 )
        {
            var_3._id_8D56 = "show";
            var_3 show();
            continue;
        }

        var_3._id_8D56 = "hide";
        var_3 hide();
    }
}

namedbordershowtoteam( var_0, var_1 )
{
    if ( !isdefined( self.namedborders[var_0] ) )
        return;

    foreach ( var_3 in self.namedborders[var_0] )
    {
        var_3._id_8D56 = "showToTeam";
        var_3 notify( "stopShowFXToTeam" );
        var_3 thread maps\mp\_utility::_id_850E( var_1 );
    }
}

namedborderhidden()
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 0 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedborderneutral()
{
    namedbordervisible( "neutral", 1 );
    namedbordervisible( "contested", 0 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedbordercontested()
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 1 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedborderowned( var_0 )
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 0 );
    namedbordershowtoteam( "friendly", var_0 );
    namedbordershowtoteam( "enemy", maps\mp\_utility::getotherteam( var_0 ) );
}

_id_6502()
{
    level notify( "zone_destroyed" );
    level._id_4AA6 = "neutral";
    level._id_A3DD._id_3BF8._id_50E5 = 0;

    if ( self._id_62AF["axis"] == 0 && self._id_62AF["allies"] == 0 )
    {
        level._id_A3DD._id_3BF8._id_A1CB = 1;
        _id_7FBB();
        level._id_A3DD namedborderneutral();
    }
}

_id_6500()
{
    var_0 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();
    level._id_A3DD._id_3BF8._id_A1C1 = 1;
    level._id_A3DD._id_3BF8._id_50E5 = 1;
    _id_7F40();
    level._id_A3DD namedbordercontested();
    level thread maps\mp\_utility::_id_6DDD( game["objective_contested_sound"] );
    maps\mp\_utility::_id_564B( "hp_contested", undefined, "gamemode_objective" );
}

_id_6501( var_0 )
{
    level._id_A3DD._id_3BF8._id_50E5 = 0;
    _id_802A( var_0 );
    level._id_A3DD namedborderowned( var_0 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F3A( var_0 );
}

_id_7FBB( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3DD;

    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B49 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B4A );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B49 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B4A );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B4B );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B4B );
}

_id_8354( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3DD;

    var_1 = "waypoint_waitfor_flag_neutral";
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", var_1 );
}

_id_7F40()
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B35 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B36 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B35 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B36 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B37 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B37 );
}

_id_802A( var_0 )
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B38 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B39 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B31 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B32 );

    if ( var_0 == "allies" )
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B30 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B30 );
    }
    else
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B4D );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B4D );
    }
}

_id_5F9D( var_0 )
{
    level endon( "game_ended" );
    level endon( "zone_reset" );
    level._id_A3F4 = gettime() + var_0 * 1000;
    level._id_A3F0 = 0;
    wait(var_0);

    if ( !isdefined( level._id_A3DD._id_3BF8._id_A1C1 ) || level._id_A3DD._id_3BF8._id_A1C1 == 0 )
    {
        if ( !isdefined( level._id_A3DD._id_3BF8._id_A1CB ) || level._id_A3DD._id_3BF8._id_A1CB == 0 )
        {
            var_1 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

            foreach ( var_3 in level.players )
            {
                if ( var_3.pers["team"] == var_1 )
                    var_3 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_controlZoneEntirely" );
            }
        }
    }

    level._id_A3F0 = 1;
    level notify( "zone_moved" );
}

awardcapturepoints( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "zone_destroyed" );
    level endon( "zone_reset" );
    level endon( "zone_moved" );
    level notify( "awardCapturePointsRunning" );
    level endon( "awardCapturePointsRunning" );
    var_2 = 1;
    var_3 = 1;

    while ( !level.gameended )
    {
        wait(var_2);
        maps\mp\gametypes\_hostmigration::_id_A0DD();

        if ( !level._id_A3DD._id_3BF8._id_50E5 )
        {
            if ( level._id_78A3 )
                var_3 = level._id_A3DD._id_3BF8._id_62AF[var_0];

            var_4 = level._id_A3DD._id_3BF8._id_940D[var_0];
            var_5 = getarraykeys( var_4 );

            for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            {
                var_7 = var_4[var_5[var_6]].player;

                if ( !isplayer( var_7 ) )
                    continue;

                var_7 thread maps\mp\_events::holdhardpointevent();
            }

            maps\mp\gametypes\_gamescores::_id_420C( var_0, var_3 );
        }
    }
}

_id_20CC( var_0, var_1 )
{
    var_2 = var_0._id_7A18;
    var_3 = var_1._id_7A18;

    if ( !isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( !isdefined( var_2 ) && isdefined( var_3 ) )
        return 1;

    if ( isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( var_2 > var_3 )
        return 1;

    return 0;
}

_id_4179( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = 1;

    for ( var_3 = var_1.size; var_2; var_3-- )
    {
        var_2 = 0;

        for ( var_4 = 0; var_4 < var_3 - 1; var_4++ )
        {
            if ( _id_20CC( var_1[var_4], var_1[var_4 + 1] ) )
            {
                var_5 = var_1[var_4];
                var_1[var_4] = var_1[var_4 + 1];
                var_1[var_4 + 1] = var_5;
                var_2 = 1;
            }
        }
    }

    return var_1;
}

_id_8348()
{
    var_0 = _id_4179( "hp_zone_center" );
    var_1 = getentarray( "hp_zone_trigger", "targetname" );
    level._id_A3F6 = _id_59F1( var_0, var_1 );
    var_2 = _id_4179( "hp_zone_center_augmented" );
    var_3 = getentarray( "hp_zone_trigger_augmented", "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
    {
        var_2 = _id_59F1( var_2, var_3 );

        if ( maps\mp\_utility::_id_50C4() )
        {
            foreach ( var_5 in var_2 )
            {
                for ( var_6 = 0; var_6 < level._id_A3F6.size; var_6++ )
                {
                    if ( level._id_A3F6[var_6]._id_7A18 == var_5._id_7A18 )
                        level._id_A3F6[var_6] = var_5;
                }
            }
        }
    }

    level.all_hp_zones = level._id_A3F6;
    return 1;
}

_id_59F1( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = 0;
        var_4 = var_0[var_2];
        var_4._id_9754 = undefined;

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( var_4 istouching( var_1[var_5] ) )
            {
                if ( isdefined( var_4._id_9754 ) )
                {
                    var_3 = 1;
                    break;
                }

                var_4._id_9754 = var_1[var_5];
                break;
            }
        }

        if ( !isdefined( var_4._id_9754 ) )
        {
            if ( !var_3 )
                continue;
        }

        var_4._id_9820 = var_4._id_9754.origin;
        var_6 = [];
        var_6[0] = var_4;
        var_4.namedborders = [];

        if ( isdefined( var_4.target ) )
        {
            var_7 = getentarray( var_4.target, "targetname" );

            foreach ( var_9 in var_7 )
            {
                var_10 = var_9.script_noteworthy;

                if ( isdefined( var_10 ) )
                {
                    if ( !isdefined( var_4.namedborders[var_10] ) )
                        var_4.namedborders[var_10] = [];

                    var_11 = var_4.namedborders[var_10].size;
                    var_4.namedborders[var_10][var_11] = var_9;
                    continue;
                }

                var_6[var_6.size] = var_9;
            }
        }

        var_4._id_3BF8 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_4._id_9754, var_6, ( 0.0, 0.0, 0.0 ) );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_2B1E();
        _id_7FBB( var_4 );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 0 );
        var_4._id_9754._id_9C09 = var_4._id_3BF8;
        var_4._id_3BF8._id_6316["allies"] _meth_8518( var_4._id_9754 );
        var_4._id_3BF8._id_6316["axis"] _meth_8518( var_4._id_9754 );
        var_4._id_3BF8._id_6316["mlg"] _meth_8518( var_4._id_9754 );
        var_4 _id_8326();
        var_4 namedborderhidden();
    }

    return var_0;
}

_id_8326()
{
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_hp_spawn" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_2B82 = distancesquared( var_0[var_1].origin, self.origin );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        for ( var_3 = var_1 - 1; var_3 >= 0 && var_2._id_2B82 < var_0[var_3]._id_2B82; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];

        var_0[var_3 + 1] = var_2;
    }

    var_4 = [];
    var_5 = [];
    var_6 = [];
    var_7 = [];
    var_8 = var_0.size / 3;

    for ( var_1 = 0; var_1 <= var_8; var_1++ )
        var_4[var_4.size] = var_0[var_1];

    while ( var_1 < var_0.size )
    {
        var_7[var_7.size] = var_0[var_1];

        if ( var_1 <= var_8 * 2 )
            var_5[var_5.size] = var_0[var_1];
        else
            var_6[var_6.size] = var_0[var_1];

        var_1++;
    }

    self._id_3BF8._id_6078 = var_4;
    self._id_3BF8._id_5C10 = var_5;
    self._id_3BF8._id_366E = var_6;
    self._id_3BF8._id_65C2 = var_7;
}

_id_3F97()
{
    var_0 = level._id_A3F6[0];
    level._id_6F7B = 0;
    return var_0;
}

_id_4045()
{
    var_0 = ( level._id_6F7B + 1 ) % level._id_A3F6.size;
    var_1 = level._id_A3F6[var_0];
    level._id_6F7B = var_0;
    return var_1;
}

_id_854A()
{
    level._id_A3F8 = common_scripts\utility::array_randomize( level._id_A3F6 );

    if ( level._id_A3DD == level._id_A3F8[0] )
        level._id_A3F8 = maps\mp\_utility::_id_9001( level._id_A3F8, 0, randomintrange( 1, level._id_A3F8.size ) );
}

_id_4046()
{
    if ( level._id_A3F8.size == 0 )
        _id_854A();

    var_0 = level._id_A3F8[0];
    var_1 = [];

    for ( var_2 = 1; var_2 < level._id_A3F8.size; var_2++ )
        var_1[var_2 - 1] = level._id_A3F8[var_2];

    level._id_A3F8 = var_1;
    return var_0;
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) )
        return;

    if ( maps\mp\gametypes\_damage::_id_510E( self, var_1 ) )
        return;

    if ( var_1 == self )
        return;

    if ( !isdefined( level._id_A3DD ) )
        return;

    var_10 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

    if ( !isdefined( var_10 ) || var_10 == "neutral" )
        return;

    if ( isdefined( var_4 ) && maps\mp\_utility::iskillstreakweapon( var_4 ) )
        return;

    var_11 = 0;

    if ( !level._id_A3DD._id_3BF8._id_50E5 && var_1 istouching( level._id_A3DD._id_9754 ) )
    {
        var_11 = 1;
        var_1 thread maps\mp\_events::_id_53B4( self, var_9 );
    }

    if ( self istouching( level._id_A3DD._id_9754 ) )
    {
        var_1.lastkilldefendertime = gettime();

        if ( var_11 )
            return;

        if ( self.team == var_10 )
            var_1 thread maps\mp\_events::assaultobjectiveevent( self, var_9 );
        else
        {
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_zoneDefense" );
            var_1 thread maps\mp\_events::_id_27AE( self, var_9 );
            var_1 maps\mp\_utility::_id_7F6C( var_1.pers["defends"] );
        }
    }
}

_id_648D( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_A3F6.size; var_1++ )
        level._id_A3F6[var_1]._id_3BF8 maps\mp\gametypes\_gameobjects::allowuse( "none" );
}

_id_9AFB( var_0 )
{
    if ( !isdefined( self._id_1B44 ) )
    {
        self._id_6294 = 0;
        self._id_1B44 = 0;
    }

    if ( !isdefined( var_0 ) || var_0 == "neutral" )
        return;

    self._id_6294++;
    var_1 = maps\mp\_utility::_id_412C() / 60000;

    if ( isplayer( self ) && isdefined( self._id_9372["total"] ) )
        var_1 = max( self._id_9372["total"], 1 ) / 60;

    self._id_1B44 = self._id_6294 / var_1;

    if ( self._id_1B44 > self._id_6294 )
        self._id_1B44 = self._id_6294;
}

_id_519A( var_0 )
{
    if ( !level.rankedmatch )
        return 0;

    if ( var_0._id_1B44 > level._id_6C6D )
        return 1;

    return 0;
}
