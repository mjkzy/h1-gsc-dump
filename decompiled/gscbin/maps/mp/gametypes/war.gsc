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
    maps\mp\gametypes\_callbacksetup::SetupCallbacks();
    maps\mp\gametypes\_globallogic::SetupCallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializeMatchRules = ::initializeMatchRules;
        [[ level.initializeMatchRules ]]();
        level thread maps\mp\_utility::reInitializeMatchRulesOnMigration();
    }
    else
    {
        maps\mp\_utility::registerRoundSwitchDvar( level.gametype, 0, 0, 9 );
        maps\mp\_utility::registerTimeLimitDvar( level.gametype, 10 );
        maps\mp\_utility::registerScoreLimitDvar( level.gametype, 75 );
        maps\mp\_utility::registerRoundLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerWinLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerNumLivesDvar( level.gametype, 0 );
        maps\mp\_utility::registerHalfTimeDvar( level.gametype, 0 );
        level.matchRules_damageMultiplier = 0;
        level.matchRules_vampirism = 0;
    }

    level.teamBased = 1;
    level.classicgamemode = 1;
    level.onStartGameType = ::onStartGameType;
    level.getSpawnPoint = ::getSpawnPoint;
    level.onNormalDeath = ::onNormalDeath;

    if ( level.matchRules_damageMultiplier || level.matchRules_vampirism )
        level.modifyPlayerDamage = maps\mp\gametypes\_damage::gamemodeModifyPlayerDamage;

    game["dialog"]["gametype"] = "team_deathmtch";
    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}

initializeMatchRules()
{
    maps\mp\_utility::setCommonRulesFromMatchRulesData();
    setdynamicdvar( "scr_war_roundswitch", 0 );
    maps\mp\_utility::registerRoundSwitchDvar( "war", 0, 0, 9 );
    setdynamicdvar( "scr_war_roundlimit", 1 );
    maps\mp\_utility::registerRoundLimitDvar( "war", 1 );
    setdynamicdvar( "scr_war_winlimit", 1 );
    maps\mp\_utility::registerWinLimitDvar( "war", 1 );
    setdynamicdvar( "scr_war_halftime", 0 );
    maps\mp\_utility::registerHalfTimeDvar( "war", 0 );
}

onStartGameType()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    maps\mp\_utility::setObjectiveText( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveText( "axis", &"OBJECTIVES_WAR" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_WAR" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_WAR" );
    }
    else
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_WAR_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_WAR_SCORE" );
    }

    maps\mp\_utility::setObjectiveHintText( "allies", &"OBJECTIVES_WAR_HINT" );
    maps\mp\_utility::setObjectiveHintText( "axis", &"OBJECTIVES_WAR_HINT" );
    initSpawns();
    var_2[0] = level.gametype;
    maps\mp\gametypes\_gameobjects::main( var_2 );
}

initSpawns()
{
    level.spawnMins = ( 0, 0, 0 );
    level.spawnMaxs = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_tdm_spawn" );
    level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
    setmapcenter( level.mapCenter );
}

getSpawnPoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getOtherTeam( var_0 );

    if ( level._id_9C14 && level.inGracePeriod )
        var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( "mp_tdm_spawn_" + var_0 + "_start" );
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::_id_411F( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2, var_0 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

onNormalDeath( var_0, var_1, var_2 )
{
    level _id_A795::_id_420C( var_1.pers["team"], 1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level._id_65B3[var_1.team]] )
        var_1.finalKill = 1;
}
