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
        maps\mp\_utility::registertimelimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 200 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 1 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.teambased = 1;
    level.classicgamemode = 1;
    level.allowneutral = 0;
    level.checkscorelimitonframeend = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level._id_64D3 = ::_id_64D3;
    level._id_64E9 = ::_id_64E9;
    level._id_2D01 = gettime();
    level.allowboostingabovetriggerradius = 1;
    level._id_2CF1 = maps\mp\_utility::_id_3F9D( "scr_dom_capture_time", 10 );
    level._id_44FD = 1;
    level.halftimeonscorelimitsettimetobeat = 0;
    level._id_9335["axis"]["time"] = 0;
    level._id_9335["axis"]["awarded"] = 0;
    level._id_9335["allies"]["time"] = 0;
    level._id_9335["allies"]["awarded"] = 0;
    level.alliescapturing = [];
    level.axiscapturing = [];
    level._id_2CED = spawnstruct();

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    level.domborderfx = [];
    level.domborderfx["friendly"] = [];
    level.domborderfx["friendly"]["_a"] = "vfx/unique/vfx_marker_dom";
    level.domborderfx["friendly"]["_b"] = "vfx/unique/vfx_marker_dom";
    level.domborderfx["friendly"]["_c"] = "vfx/unique/vfx_marker_dom";
    level.domborderfx["enemy"] = [];
    level.domborderfx["enemy"]["_a"] = "vfx/unique/vfx_marker_dom_red";
    level.domborderfx["enemy"]["_b"] = "vfx/unique/vfx_marker_dom_red";
    level.domborderfx["enemy"]["_c"] = "vfx/unique/vfx_marker_dom_red";
    level.domborderfx["neutral"] = [];
    level.domborderfx["neutral"]["_a"] = "vfx/unique/vfx_marker_dom_white";
    level.domborderfx["neutral"]["_b"] = "vfx/unique/vfx_marker_dom_white";
    level.domborderfx["neutral"]["_c"] = "vfx/unique/vfx_marker_dom_white";
    game["dialog"]["gametype"] = "domination";
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_dom_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "dom", 1 );
    setdynamicdvar( "scr_dom_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "dom", 1 );
    var_0 = getmatchrulesdata( "domData", "halfTime" );
    setdynamicdvar( "scr_dom_halftime", var_0 );
    maps\mp\_utility::registerhalftimedvar( "dom", var_0 );
    setdynamicdvar( "scr_dom_capture_time", getmatchrulesdata( "domData", "captureTime" ) );
    setdynamicdvar( "scr_dom_allowNeutral", getmatchrulesdata( "domData", "allowNeutral" ) );
    setdynamicdvar( "scr_dom_halftimeswitchsides", getmatchrulesdata( "domData", "halfTimeSwitchSides" ) );
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

    if ( game["status"] == "halftime" )
        setomnvar( "ui_current_round", 2 );
    else if ( game["status"] == "overtime" )
        setomnvar( "ui_current_round", 3 );
    else if ( game["status"] == "overtime_halftime" )
        setomnvar( "ui_current_round", 4 );

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_DOM" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_DOM" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DOM" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DOM" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DOM_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DOM_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_DOM_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_DOM_HINT" );
    setclientnamemode( "auto_change" );
    initspawns();
    _id_6EDA();
    var_2[0] = "dom";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    setomnvar( "ui_mlg_game_mode_status_2", 0 );
    setomnvar( "ui_mlg_game_mode_status_3", 0 );
    level thread _id_2CF9();
    level thread _id_9B12();
    level thread _id_9B39();
    level thread _id_9B64();
    level._id_44FC = maps\mp\_utility::_id_2FD0( "halftimeswitchsides", 1, 0, 1 );
    level.allowneutral = maps\mp\_utility::_id_2FD0( "allowNeutral", 0, 0, 1 );
}

_id_9B64()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread updatecaptures();
        var_0 thread _id_9B11();
    }
}

updatecaptures()
{
    waitframe;
    maps\mp\_utility::_id_7F6B( self.pers["captures"] );
}

_id_9B11()
{
    waitframe;
    maps\mp\_utility::_id_7F6C( self.pers["defends"] );
}

_id_9B39()
{
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            var_1.objective = 0;

            foreach ( var_3 in level._id_2CF9 )
            {
                if ( var_1 istouching( var_3._id_56D9 ) )
                {
                    if ( var_3._id_62AF["axis"] * var_3._id_62AF["allies"] > 0 )
                        var_1.objective = 1;
                    else if ( var_3._id_663A == "neutral" )
                    {
                        if ( var_1.team == "allies" )
                            var_1.objective = 2;
                        else
                            var_1.objective = 3;
                    }
                    else if ( var_3._id_663A == "allies" )
                    {
                        if ( var_1.team == "allies" )
                            var_1.objective = 4;
                        else
                            var_1.objective = 5;
                    }
                    else if ( var_3._id_663A == "axis" )
                    {
                        if ( var_1.team == "axis" )
                            var_1.objective = 6;
                        else
                            var_1.objective = 7;
                    }

                    if ( var_1.objective > 0 )
                    {
                        if ( var_3.label == "_b" )
                        {
                            var_1.objective += 7;
                            continue;
                        }

                        if ( var_3.label == "_c" )
                            var_1.objective += 14;
                    }
                }
            }
        }

        wait 0.05;
    }
}

_id_6EDA()
{
    game["neutral"] = "neutral";
    level.flagmodels["marines"]["friendly"] = "h1_flag_mp_domination_usmc_blue";
    level.flagmodels["marines"]["enemy"] = "h1_flag_mp_domination_usmc_red";
    level.flagmodels["sas"]["friendly"] = "h1_flag_mp_domination_sas_blue";
    level.flagmodels["sas"]["enemy"] = "h1_flag_mp_domination_sas_red";
    level.flagmodels["opfor"]["friendly"] = "h1_flag_mp_domination_arab_blue";
    level.flagmodels["opfor"]["enemy"] = "h1_flag_mp_domination_arab_red";
    level.flagmodels["russian"]["friendly"] = "h1_flag_mp_domination_spetsnaz_blue";
    level.flagmodels["russian"]["enemy"] = "h1_flag_mp_domination_spetsnaz_red";
    level.flagmodels["neutral"]["friendly"] = "h1_flag_mp_domination_default";
    level.flagmodels["neutral"]["enemy"] = "h1_flag_mp_domination_default";
    level._id_3863["marines"] = [];
    level._id_3863["marines"]["friendly"] = undefined;
    level._id_3863["marines"]["enemy"] = undefined;
    level._id_3863["sas"] = [];
    level._id_3863["sas"]["friendly"] = undefined;
    level._id_3863["sas"]["enemy"] = undefined;
    level._id_3863["opfor"] = [];
    level._id_3863["opfor"]["friendly"] = undefined;
    level._id_3863["opfor"]["enemy"] = undefined;
    level._id_3863["russian"] = [];
    level._id_3863["russian"]["friendly"] = undefined;
    level._id_3863["russian"]["enemy"] = undefined;
    level._id_3863["neutral"] = [];
    level._id_3863["neutral"]["friendly"] = undefined;
    level._id_3863["neutral"]["enemy"] = undefined;
    var_0 = [ "marines", "sas", "opfor", "russian", "neutral" ];

    foreach ( var_2 in var_0 )
    {
        level.boarderfxid[var_2] = [];
        var_3 = [ "friendly", "enemy" ];

        foreach ( var_5 in var_3 )
        {
            level.boarderfxid[var_2][var_5] = [];
            var_6 = [ "_a", "_b", "_c" ];

            foreach ( var_8 in var_6 )
            {
                if ( var_2 == "neutral" )
                {
                    level.boarderfxid[var_2][var_5][var_8] = loadfx( level.domborderfx[var_2][var_8] );
                    continue;
                }

                level.boarderfxid[var_2][var_5][var_8] = loadfx( level.domborderfx[var_5][var_8] );
            }
        }
    }
}

initspawns()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_dom_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_dom_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dom_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dom_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( level.usestartspawns && level.ingraceperiod )
    {
        if ( game["switchedsides"] )
            var_0 = maps\mp\_utility::getotherteam( var_0 );

        var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( "mp_dom_spawn_" + var_0 + "_start" );
    }
    else if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        var_1 = getspawnpointlegacy( var_0 );
    else
    {
        var_2 = _id_410E( var_0 );
        var_3 = maps\mp\_utility::getotherteam( var_0 );
        var_4 = _id_410E( var_3 );
        var_5 = _id_4099( var_2, var_4 );
        var_6 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D4( var_6, var_5 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_410E( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_2CF9 )
    {
        if ( var_3._id_663A == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_4099( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = 0;
    var_2[1] = 0;
    var_2[2] = 0;
    var_3 = self.pers["team"];

    if ( var_0.size == level._id_2CF9.size )
    {
        var_4 = var_3;
        var_5 = level.bestspawnflag[var_3];
        var_2[var_5._id_9C09._id_2D00] = 1;
        return var_2;
    }

    if ( var_0.size == 1 && var_1.size == 2 )
    {
        var_6 = maps\mp\_utility::getotherteam( self.team );
        var_7 = maps\mp\gametypes\_gamescores::_getteamscore( var_6 ) - maps\mp\gametypes\_gamescores::_getteamscore( self.team );

        if ( var_7 > 25 )
        {
            var_8 = _id_4133( var_0[0] );
            var_9 = _id_4133( var_1[0] );
            var_10 = _id_4133( var_1[1] );

            if ( var_8 > 80000 && var_9 > 80000 && var_10 > 80000 )
                return var_2;
        }
    }

    if ( var_0.size > 0 )
    {
        foreach ( var_12 in var_0 )
            var_2[var_12._id_2D00] = 1;

        return var_2;
    }
    else
    {
        var_4 = var_3;
        var_6 = maps\mp\_utility::getotherteam( var_4 );
        var_5 = level.bestspawnflag[var_4];

        if ( var_1.size > 0 && var_1.size < level._id_2CF9.size )
        {
            var_5 = _id_4146( var_4, undefined, 0 );
            level.bestspawnflag[var_4] = var_5;
        }

        if ( var_5 == level.bestspawnflag[var_6] )
        {
            var_5 = _id_4146( var_4, level.bestspawnflag[var_6], 1 );
            level.bestspawnflag[var_4] = var_5;
        }

        var_2[var_5._id_9C09._id_2D00] = 1;
        return var_2;
    }

    return var_2;
}

_id_4133( var_0 )
{
    return gettime() - var_0._id_1B5D;
}

_id_2CF9()
{
    level._id_55FB["allies"] = 0;
    level._id_55FB["axis"] = 0;
    var_0 = getentarray( "flag_primary", "targetname" );
    var_1 = getentarray( "flag_primary_augmented", "targetname" );

    if ( var_0.size < 2 )
        return;

    if ( maps\mp\_utility::_id_50C4() )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2].script_label;

            for ( var_4 = 0; var_4 < var_0.size; var_4++ )
            {
                if ( var_0[var_4].script_label == var_3 )
                {
                    var_0[var_4] delete();
                    break;
                }
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            var_1[var_5] delete();
    }

    level._id_386B = [];
    level._id_386B = common_scripts\utility::array_combine( var_0, var_1 );
    level._id_2CF9 = [];

    for ( var_5 = 0; var_5 < level._id_386B.size; var_5++ )
    {
        var_6 = level._id_386B[var_5];

        if ( isdefined( var_6.target ) )
            var_7[0] = getent( var_6.target, "targetname" );
        else
        {
            var_7[0] = spawn( "script_model", var_6.origin );
            var_7[0].angles = var_6.angles;
        }

        var_7[1] = spawn( "script_model", var_7[0].origin );
        var_7[1].angles = var_7[0].angles;
        var_7[0] thread maps\mp\_utility::_id_850E( "allies" );
        var_7[1] thread maps\mp\_utility::_id_850E( "axis" );
        var_8 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_6, var_7, ( 0.0, 0.0, 100.0 ) );
        var_8 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
        var_8 maps\mp\gametypes\_gameobjects::setusetime( level._id_2CF1 );
        var_8 maps\mp\gametypes\_gameobjects::_id_834B( &"MP_SECURING_POSITION" );
        var_9 = var_8 maps\mp\gametypes\_gameobjects::_id_3FFA();
        var_8.label = var_9;
        var_8 updatedomicon();
        var_8 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        var_8.onuse = ::onuse;
        var_8._id_6454 = ::_id_6454;
        var_8._id_64FC = ::_id_64FC;
        var_8._id_648E = ::_id_648E;
        var_8.onnumtouchingchanged = ::onnumtouchingchanged;
        var_8._id_6242 = 1;
        var_8.contesteduiprogress = 1;
        var_8._id_4B53 = "domFlag";
        var_8._id_46E3 = 0;
        var_8._id_3818 = 1;
        var_10 = var_7[0].origin + ( 0.0, 0.0, 32.0 );
        var_11 = var_7[0].origin + ( 0.0, 0.0, -32.0 );
        var_12 = bullettrace( var_10, var_11, 0, var_7[0] );
        var_13 = vectortoangles( var_12["normal"] );
        var_8.baseeffectforward = anglestoforward( var_13 );
        var_8.baseeffectright = anglestoright( var_13 );
        var_8.baseeffectpos = var_12["position"];
        var_7[0].origin = var_12["position"];
        var_7[1].origin = var_12["position"];
        var_8 thread _id_9BA1( 1 );
        level._id_386B[var_5]._id_9C09 = var_8;

        if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        {
            level._id_386B[var_5].adjflags = [];
            level._id_386B[var_5].nearbyspawns = [];
        }

        var_8._id_56D9 = level._id_386B[var_5];
        level._id_2CF9[level._id_2CF9.size] = var_8;
    }

    var_14 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn_axis_start" );
    var_15 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn_allies_start" );
    level._id_8D38["allies"] = var_15[0].origin;
    level._id_8D38["axis"] = var_14[0].origin;
    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = _id_4146( "allies", undefined, 0 );
    level.bestspawnflag["axis"] = _id_4146( "axis", level.bestspawnflag["allies"], 0 );

    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        flagsetuplegacy();
    else
        _id_386D();
}

domseticon( var_0, var_1 )
{
    var_2 = self._id_20D0[var_0];

    if ( !isdefined( var_2 ) || var_2 != var_1 )
        maps\mp\gametypes\_gameobjects::_id_7F12( var_0, var_1 );

    var_3 = self._id_A350[var_0];

    if ( !isdefined( var_3 ) || var_3 != var_1 )
        maps\mp\gametypes\_gameobjects::_id_7F13( var_0, var_1 );
}

updatedomicon()
{
    self notify( "updateDomIcon" );
    self endon( "updateDomIcon" );
    waitframe;
    var_0 = !self._id_62AF["allies"] && !self._id_62AF["axis"];
    var_1 = self._id_62AF["allies"] && self._id_62AF["axis"];
    var_2 = maps\mp\gametypes\_gameobjects::_id_4078();

    if ( var_1 )
    {
        domseticon( "enemy", "waypoint_contested" + self.label );
        domseticon( "friendly", "waypoint_contested" + self.label );
        domseticon( "mlg", "waypoint_contested" + self.label );
    }
    else if ( var_2 != "neutral" )
    {
        var_3 = maps\mp\_utility::getotherteam( var_2 );
        var_4 = self._id_62AF[var_3];

        if ( var_4 )
        {
            domseticon( "enemy", "waypoint_taking" + self.label );
            domseticon( "friendly", "waypoint_losing" + self.label );

            if ( var_2 == "allies" )
            {
                domseticon( "mlg", "waypoint_esports_dom_blue_losing" + self.label );
                return;
            }

            domseticon( "mlg", "waypoint_esports_dom_red_losing" + self.label );
            return;
            return;
        }

        domseticon( "enemy", "waypoint_capture" + self.label );
        domseticon( "friendly", "waypoint_defend" + self.label );

        if ( var_2 == "allies" )
        {
            domseticon( "mlg", "waypoint_esports_dom_blue" + self.label );
            return;
        }

        domseticon( "mlg", "waypoint_esports_dom_red" + self.label );
        return;
        return;
    }
    else if ( var_0 )
    {
        domseticon( "enemy", "waypoint_captureneutral" + self.label );
        domseticon( "friendly", "waypoint_captureneutral" + self.label );
        domseticon( "mlg", "waypoint_esports_dom_white" + self.label );
    }
    else
    {
        domseticon( "enemy", "waypoint_taking" + self.label );
        domseticon( "friendly", "waypoint_losing" + self.label );

        if ( self._id_62AF["allies"] )
            domseticon( "mlg", "waypoint_esports_dom_blue_taking" + self.label );
        else
            domseticon( "mlg", "waypoint_esports_dom_red_taking" + self.label );
    }
}

_id_4146( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = undefined;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    for ( var_5 = 0; var_5 < level._id_386B.size; var_5++ )
    {
        var_6 = level._id_386B[var_5];

        if ( !var_2 && var_6 _id_3F98() != "neutral" )
            continue;

        var_7 = distancesquared( var_6.origin, level._id_8D38[var_0] );

        if ( ( !isdefined( var_1 ) || var_6 != var_1 ) && ( !isdefined( var_3 ) || var_7 < var_4 ) )
        {
            var_4 = var_7;
            var_3 = var_6;
        }
    }

    return var_3;
}

_id_6454( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::_id_4078();
    self._id_2A4E = 0;
    maps\mp\gametypes\_gameobjects::setusetime( level._id_2CF1 );

    if ( var_1 == "neutral" )
        _id_8D7D( "securing" + self.label, var_0.team );
    else
    {
        if ( var_1 == "allies" )
        {
            level.alliescapturing[level.alliescapturing.size] = self.label;
            var_2 = "axis";
            return;
        }

        level.axiscapturing[level.axiscapturing.size] = self.label;
        var_2 = "allies";
    }
}

_id_64FC( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_gameobjects::_id_4078();

    if ( var_1 > 0.05 && var_2 && !self._id_2A4E )
    {
        if ( var_3 == "neutral" )
        {
            _id_8D7D( "securing" + self.label, var_0 );
            self._id_6F72 = maps\mp\_utility::getotherteam( var_0 );
        }
        else
        {
            _id_8D7D( "losing" + self.label, var_3, 1 );
            _id_8D7D( "securing" + self.label, var_0 );
        }

        self._id_2A4E = 1;
    }
    else if ( level.allowneutral && var_1 > 0.49 && var_2 && self._id_2A4E && var_3 != "neutral" )
    {
        maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        _id_9BA1();
        _id_8D7D( "lost" + self.label, var_3, 1 );
        level thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_0 );
        level thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_lost", var_3 );
        _id_9B93( self.label, "neutral" );
        thread _id_41E7( self._id_940D[var_0] );
    }
}

_id_8D7D( var_0, var_1, var_2 )
{
    var_3 = gettime();

    if ( gettime() < level._id_55FB[var_1] + 5000 && ( !isdefined( var_2 ) || !var_2 ) )
        return;

    thread _id_27E1( var_0, var_1 );
    level._id_55FB[var_1] = gettime();
}

_id_648E( var_0, var_1, var_2 )
{
    if ( isplayer( var_1 ) )
        var_1 setclientomnvar( "ui_capture_icon", 0 );

    if ( var_0 == "allies" )
        common_scripts\utility::array_remove( level.alliescapturing, self.label );
    else
        common_scripts\utility::array_remove( level.axiscapturing, self.label );
}

onnumtouchingchanged( var_0, var_1, var_2 )
{
    updatedomicon();
}

_id_9BA1( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        waitframe;

    if ( !isremovedentity( self.visuals[0] ) )
    {
        var_1 = self._id_663A;
        var_2 = level.flagmodels[game[var_1]]["friendly"];
        var_3 = level.flagmodels[game[var_1]]["enemy"];
        var_4 = self.visuals[0];
        var_5 = self.visuals[1];
        var_6 = common_scripts\utility::_id_9294( var_1 == "allies", var_4, var_5 );
        var_7 = common_scripts\utility::_id_9294( var_1 == "allies", var_5, var_4 );
        var_6 setmodel( var_2 );
        var_7 setmodel( var_3 );
        _id_3A99( var_4.origin, anglestoup( var_4.angles ) );
    }
}

_id_3A99( var_0, var_1 )
{
    var_2 = self._id_663A;
    var_3 = maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_4 = level._id_3863[game[var_2]]["friendly"];
    var_5 = level.boarderfxid[game[var_2]]["friendly"][var_3];
    var_6 = level._id_3863[game[var_2]]["enemy"];
    var_7 = level.boarderfxid[game[var_2]]["enemy"][var_3];
    _id_3A9A();

    if ( isdefined( var_4 ) )
        self._id_3AAA = maps\mp\_utility::_id_89DD( var_4, var_2, var_0, var_1 );

    if ( isdefined( var_5 ) )
        self._id_3A92 = maps\mp\_utility::_id_89DD( var_5, var_2, var_0, var_1 );

    if ( isdefined( var_6 ) )
        self._id_32AB = maps\mp\_utility::_id_89DD( var_6, maps\mp\_utility::getotherteam( var_2 ), var_0, var_1 );

    if ( isdefined( var_7 ) )
        self._id_32A7 = maps\mp\_utility::_id_89DD( var_7, maps\mp\_utility::getotherteam( var_2 ), var_0, var_1 );
}

_id_3A9A()
{
    if ( isdefined( self._id_3AAA ) )
        self._id_3AAA delete();

    if ( isdefined( self._id_3A92 ) )
        self._id_3A92 delete();

    if ( isdefined( self._id_32AB ) )
        self._id_32AB delete();

    if ( isdefined( self._id_32A7 ) )
        self._id_32A7 delete();
}

_id_9B93( var_0, var_1 )
{
    var_2 = "ui_mlg_game_mode_status_1";

    if ( var_0 == "_b" )
        var_2 = "ui_mlg_game_mode_status_2";

    if ( var_0 == "_c" )
        var_2 = "ui_mlg_game_mode_status_3";

    if ( var_1 == "allies" )
        setomnvar( var_2, -1 );
    else if ( var_1 == "axis" )
        setomnvar( var_2, 1 );
    else
        setomnvar( var_2, 0 );
}

onuse( var_0 )
{
    var_1 = var_0.team;
    var_2 = maps\mp\gametypes\_gameobjects::_id_4078();
    var_3 = maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_4 = 0;

    if ( self._id_3818 && var_3 == "_b" )
        var_4 = 1;

    self._id_1B5D = gettime();
    self._id_3818 = 0;
    self._id_46E3 = 1;

    if ( isdefined( self._id_6631 ) )
        self._id_6631 = 0;
    else
        self._id_6631 = 1;

    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );
    updatedomicon();
    _id_9BA1();
    level.usestartspawns = 0;

    if ( var_2 == "neutral" )
    {
        var_5 = maps\mp\_utility::getotherteam( var_1 );
        _id_8D7D( "secured" + self.label, var_1, 1 );
        _id_8D7D( "enemy_has" + self.label, var_5, 1 );
        level thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_1 );
    }
    else
    {
        if ( _id_4111( var_1 ) == level._id_386B.size )
        {
            _id_8D7D( "secure_all", var_1 );
            _id_8D7D( "lost_all", var_2 );
        }
        else
        {
            _id_8D7D( "secured" + self.label, var_1, 1 );
            _id_8D7D( "lost" + self.label, var_2, 1 );
        }

        level thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_1 );
        level thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_lost", var_2 );
        level.bestspawnflag[var_2] = self._id_56D9;
    }

    _id_9B93( self.label, var_1 );
    forcecapturehudoff( self._id_940D[var_1] );
    thread _id_41E6( self._id_940D[var_1], var_4 );
}

forcecapturehudoff( var_0 )
{
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0[var_1[var_2]].player;

        if ( !isplayer( var_3 ) )
            continue;

        var_3 setclientomnvar( "ui_capture_icon", 0 );
    }
}

_id_41E6( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = maps\mp\gametypes\_gameobjects::_id_3F79();

    if ( isdefined( var_2.owner ) )
        var_2 = var_2.owner;

    if ( isplayer( var_2 ) )
        level thread maps\mp\_utility::_id_91FA( "callout_securedposition" + self.label, var_2 );

    var_3 = getarraykeys( var_0 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_2 = var_0[var_3[var_4]].player;

        if ( isdefined( var_2.owner ) )
            var_2 = var_2.owner;

        if ( !isplayer( var_2 ) )
            continue;

        var_2 thread maps\mp\_events::_id_2CF0( var_1 );
        var_2 thread _id_9B0B();
        wait 0.05;
    }
}

_id_41E7( var_0 )
{
    level endon( "game_ended" );
    var_1 = maps\mp\gametypes\_gameobjects::_id_3F79();

    if ( isdefined( var_1.owner ) )
        var_1 = var_1.owner;

    if ( isplayer( var_1 ) )
        level thread maps\mp\_utility::_id_91FA( "callout_neutralized_position" + self.label, var_1 );

    var_2 = getarraykeys( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1 = var_0[var_2[var_3]].player;

        if ( isdefined( var_1.owner ) )
            var_1 = var_1.owner;

        if ( !isplayer( var_1 ) )
            continue;

        var_1 thread maps\mp\_events::_id_2CFC();
        wait 0.05;
    }
}

_id_27E1( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.1;
    maps\mp\_utility::_id_A0F4();
    maps\mp\_utility::_id_564B( var_0, var_1 );
}

_id_27E2( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    wait 0.1;
    maps\mp\_utility::_id_A0F4();
    maps\mp\_utility::_id_5650( var_0, var_1, var_2, var_3 );
}

_id_9B12()
{
    level endon( "game_ended" );

    while ( !level.gameended )
    {
        var_0 = _id_4077();

        if ( var_0.size )
        {
            var_1 = undefined;
            var_2 = undefined;
            var_3 = [];

            foreach ( var_5 in var_0 )
            {
                var_6 = var_5 maps\mp\gametypes\_gameobjects::_id_4078();

                if ( !isdefined( var_3[var_6] ) )
                    var_3[var_6] = 0;

                var_3[var_6]++;

                if ( !isdefined( var_1 ) || var_1 < var_5._id_1B5D )
                    var_1 = var_5._id_1B5D;

                if ( !isdefined( var_2 ) )
                    var_2 = var_6;

                if ( var_2 != var_6 )
                    var_2 = "none";
            }

            var_8 = maps\mp\_utility::_id_40C2();

            if ( var_8 && maps\mp\_utility::_id_3FC0() && level._id_44FD && ( game["status"] == "normal" || game["status"] == "overtime" ) )
                var_8 = int( var_8 / 2 + 0.5 );

            if ( var_8 > 0 )
            {
                var_9 = undefined;

                foreach ( var_6, var_11 in var_3 )
                {
                    if ( var_11 + maps\mp\gametypes\_gamescores::_getteamscore( var_6 ) >= var_8 )
                    {
                        if ( !isdefined( var_9 ) )
                        {
                            var_9 = var_6;
                            continue;
                        }

                        var_9 = undefined;
                        break;
                    }
                }

                if ( isdefined( var_9 ) )
                    var_3[var_9] = var_8 - maps\mp\gametypes\_gamescores::_getteamscore( var_9 );
            }

            foreach ( var_6, var_11 in var_3 )
                maps\mp\gametypes\_gamescores::_id_420C( var_6, var_11 );

            if ( var_0.size == 3 && var_2 != "none" && level.players.size > 5 )
            {
                level._id_9335[var_2]["time"] = gettime() - var_1;
                level._id_9335[maps\mp\_utility::getotherteam( var_2 )]["time"] = 0;

                if ( level._id_9335[var_2]["time"] > 60000 && level._id_9335["axis"]["awarded"] == 0 )
                {
                    level._id_9335["axis"]["awarded"] = 1;

                    foreach ( var_14 in level.players )
                    {
                        if ( var_14.team != var_2 )
                            continue;

                        var_14 maps\mp\gametypes\_misions::_id_6FF6( "ch_dom_tripcap" );
                    }
                }
            }
            else
            {
                level._id_9335["axis"]["time"] = 0;
                level._id_9335["allies"]["time"] = 0;
            }
        }

        var_16 = 0;
        var_17 = 0;
        var_18 = 0;

        foreach ( var_20 in level._id_2CF9 )
        {
            if ( var_20.label == "_a" )
            {
                if ( var_20._id_46E3 == 1 )
                    var_17 = 1;

                continue;
            }

            if ( var_20.label == "_c" )
            {
                if ( var_20._id_46E3 == 1 )
                    var_18 = 1;
            }
        }

        if ( var_17 == 1 || var_18 == 1 )
            var_16 = 1;

        if ( maps\mp\_utility::_id_59E3() && !level.allowneutral && !var_16 && _id_3F6B() > 120000 && !getdvarint( "force_ranking" ) )
        {
            level._id_374D = "none";
            thread maps\mp\gametypes\_gamelogic::_id_315F( "none", game["end_reason"]["time_limit_reached"] );
            return;
        }

        wait 5.0;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_3F6B()
{
    return gettime() - level._id_2D01;
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) )
        return;

    if ( maps\mp\gametypes\_damage::_id_510E( self, var_1 ) )
        return;

    if ( var_1 == self )
        return;

    if ( isdefined( var_4 ) && maps\mp\_utility::iskillstreakweapon( var_4 ) )
        return;

    var_10 = 0;
    var_11 = self;

    foreach ( var_13 in var_1._id_940F )
    {
        if ( var_13 != level._id_386B[0] && var_13 != level._id_386B[1] && var_13 != level._id_386B[2] )
            continue;

        var_14 = var_13._id_9C09._id_663A;

        if ( var_1.team != var_14 )
        {
            var_1 thread maps\mp\_events::_id_53B4( var_11, var_9 );
            var_10 = 1;
        }
    }

    var_16 = 90000;

    foreach ( var_13 in level._id_386B )
    {
        var_14 = var_13._id_9C09._id_663A;
        var_18 = distancesquared( var_13.origin, var_11.origin );
        var_19 = distancesquared( var_13.origin, var_1.origin );

        if ( var_14 == var_1.team )
        {
            if ( var_18 < var_16 || var_19 < var_16 )
            {
                var_1 thread maps\mp\_events::_id_27AE( var_11, var_9 );
                var_1 maps\mp\_utility::_id_7F6C( var_1.pers["defends"] );
            }
        }

        if ( var_10 )
            break;

        if ( var_14 == var_11.team )
        {
            if ( var_19 < var_16 || var_18 < var_16 )
                var_1 thread maps\mp\_events::assaultobjectiveevent( self, var_9 );
        }
    }
}

_id_4077()
{
    var_0 = [];

    foreach ( var_2 in level._id_2CF9 )
    {
        if ( var_2 maps\mp\gametypes\_gameobjects::_id_4078() != "neutral" && isdefined( var_2._id_1B5D ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_4111( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        if ( level._id_2CF9[var_2] maps\mp\gametypes\_gameobjects::_id_4078() == var_0 )
            var_1++;
    }

    return var_1;
}

_id_3F98()
{
    return self._id_9C09 maps\mp\gametypes\_gameobjects::_id_4078();
}

_id_386D()
{
    foreach ( var_1 in level._id_2CF9 )
    {
        switch ( var_1.label )
        {
            case "_a":
                var_1._id_2D00 = 0;
                continue;
            case "_b":
                var_1._id_2D00 = 1;
                continue;
            case "_c":
                var_1._id_2D00 = 2;
                continue;
        }
    }

    var_3 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn" );

    foreach ( var_5 in var_3 )
    {
        var_5.preferreddompoint = undefined;

        if ( isdefined( var_5.script_noteworthy ) )
        {
            if ( var_5.script_noteworthy == "a_override" )
            {
                var_5.preferreddompoint = 0;
                continue;
            }
            else if ( var_5.script_noteworthy == "b_override" )
            {
                var_5.preferreddompoint = 1;
                continue;
            }
            else if ( var_5.script_noteworthy == "c_override" )
            {
                var_5.preferreddompoint = 2;
                continue;
            }
        }

        var_5._id_6077 = _id_4033( var_5 );

        switch ( var_5._id_6077._id_9C09._id_2D00 )
        {
            case 0:
                var_5.preferreddompoint = 0;
                continue;
            case 1:
                var_5.preferreddompoint = 1;
                continue;
            case 2:
                var_5.preferreddompoint = 2;
                continue;
        }
    }
}

_id_4033( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnlogic::_id_5170();
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in level._id_2CF9 )
    {
        var_6 = undefined;

        if ( var_1 )
            var_6 = getpathdist( var_0.origin, var_5._id_56D9.origin, 999999 );

        if ( !isdefined( var_6 ) || var_6 == -1 )
            var_6 = distancesquared( var_5._id_56D9.origin, var_0.origin );

        if ( !isdefined( var_2 ) || var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2._id_56D9;
}

_id_64E9()
{

}

_id_9B0B()
{
    if ( !isdefined( self._id_22CD ) )
    {
        self._id_6294 = 0;
        self._id_22CD = 0;
    }

    self._id_6294++;

    if ( maps\mp\_utility::_id_4024() < 1 )
        return;

    self._id_22CD = self._id_6294 / maps\mp\_utility::_id_4024();
}

_id_3F25()
{
    if ( self._id_22CD < 4 )
        return 1;
    else
        return 0.25;
}

getspawnpointlegacy( var_0 )
{
    var_1 = undefined;
    var_2 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn" );
    var_3 = 0;
    var_4 = 0;
    var_5 = self.pers["team"];
    var_6 = maps\mp\_utility::getotherteam( var_5 );

    for ( var_7 = 0; var_7 < level._id_386B.size; var_7++ )
    {
        var_8 = level._id_386B[var_7] _id_3F98();

        if ( var_8 == var_5 )
        {
            var_3++;
            continue;
        }

        if ( var_8 == var_6 )
            var_4++;
    }

    if ( var_3 == level._id_386B.size )
    {
        var_9 = level.bestspawnflag[maps\mp\_utility::getotherteam( self.pers["team"] )];
        var_1 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( var_2, getspawnsboundingflag( var_9 ) );
    }
    else if ( var_3 > 0 )
        var_1 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( var_2, getboundaryflagspawns( var_5 ) );
    else
    {
        var_10 = undefined;

        if ( var_4 > 0 && var_4 < level._id_386B.size )
            var_10 = _id_4146( var_5 );

        if ( !isdefined( var_10 ) )
            var_10 = level.bestspawnflag[self.pers["team"]];

        level.bestspawnflag[self.pers["team"]] = var_10;
        var_1 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( var_2, var_10.nearbyspawns );
    }

    if ( !isdefined( var_1 ) )
    {
        if ( var_0 == "axis" )
        {
            var_11 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn_axis_start" );
            var_1 = maps\mp\gametypes\_legacyspawnlogic::_id_40D8( var_11 );
        }
        else
        {
            var_12 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn_allies_start" );
            var_1 = maps\mp\gametypes\_legacyspawnlogic::_id_40D8( var_12 );
        }
    }

    return var_1;
}

getboundaryflags()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_386B.size; var_1++ )
    {
        for ( var_2 = 0; var_2 < level._id_386B[var_1].adjflags.size; var_2++ )
        {
            if ( level._id_386B[var_1]._id_9C09 maps\mp\gametypes\_gameobjects::_id_4078() != level._id_386B[var_1].adjflags[var_2]._id_9C09 maps\mp\gametypes\_gameobjects::_id_4078() )
            {
                var_0[var_0.size] = level._id_386B[var_1];
                break;
            }
        }
    }

    return var_0;
}

getboundaryflagspawns( var_0 )
{
    var_1 = [];
    var_2 = getboundaryflags();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_0 ) && var_2[var_3] _id_3F98() != var_0 )
            continue;

        for ( var_4 = 0; var_4 < var_2[var_3].nearbyspawns.size; var_4++ )
            var_1[var_1.size] = var_2[var_3].nearbyspawns[var_4];
    }

    return var_1;
}

getspawnsboundingflag( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        var_3 = level._id_386B[var_2];

        if ( var_3 == var_0 )
            continue;

        var_4 = 0;

        for ( var_5 = 0; var_5 < var_3.adjflags.size; var_5++ )
        {
            if ( var_3.adjflags[var_5] == var_0 )
            {
                var_4 = 1;
                break;
            }
        }

        if ( !var_4 )
            continue;

        for ( var_5 = 0; var_5 < var_3.nearbyspawns.size; var_5++ )
            var_1[var_1.size] = var_3.nearbyspawns[var_5];
    }

    return var_1;
}

flagsetuplegacy()
{
    var_0 = [];

    foreach ( var_2 in level._id_386B )
        var_0[var_2.script_label] = var_2;

    var_4 = [];

    switch ( level.script )
    {
        case "mp_bog_summer":
        case "mp_bog":
        case "mp_countdown":
        case "mp_broadcast":
        case "mp_citystreets":
        case "mp_overgrown":
        case "mp_pipeline":
            var_4["_a"] = [ "_b", "_c" ];
            var_4["_b"] = [ "_a", "_c" ];
            var_4["_c"] = [ "_a", "_b" ];
            break;
        case "mp_crash_snow":
        case "mp_farm_spring":
        case "mp_cargoship":
        case "mp_backlot":
        case "mp_bloc":
        case "mp_convoy":
        case "mp_crash":
        case "mp_crossfire":
        case "mp_farm":
        case "mp_shipment":
        case "mp_showdown":
        case "mp_strike":
        case "mp_vacant":
        case "mp_killhouse":
        case "mp_creek":
        case "mp_carentan":
        default:
            var_4["_a"] = [ "_b" ];
            var_4["_b"] = [ "_a", "_c" ];
            var_4["_c"] = [ "_b" ];
            break;
    }

    foreach ( var_2 in level._id_386B )
    {
        var_6 = var_4[var_2.script_label];

        foreach ( var_8 in var_6 )
            var_2.adjflags[var_2.adjflags.size] = var_0[var_8];
    }

    var_11 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dom_spawn" );

    for ( var_12 = 0; var_12 < var_11.size; var_12++ )
    {
        var_13 = undefined;

        if ( isdefined( var_11[var_12]._id_7A26 ) )
        {
            switch ( var_11[var_12]._id_7A26 )
            {
                case "flag1":
                    var_13 = var_0["_a"];
                    break;
                case "flag2":
                    var_13 = var_0["_b"];
                    break;
                case "flag3":
                    var_13 = var_0["_c"];
                    break;
                default:
                    break;
            }
        }

        if ( !isdefined( var_13 ) )
        {
            var_14 = undefined;

            foreach ( var_2 in level._id_386B )
            {
                var_16 = distancesquared( var_2.origin, var_11[var_12].origin );

                if ( !isdefined( var_13 ) || var_16 < var_14 )
                {
                    var_13 = var_2;
                    var_14 = var_16;
                }
            }
        }

        var_13.nearbyspawns[var_13.nearbyspawns.size] = var_11[var_12];
    }
}
