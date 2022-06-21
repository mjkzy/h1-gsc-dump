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
        maps\mp\_utility::registerTimeLimitDvar( level.gametype, 10 );
        maps\mp\_utility::registerScoreLimitDvar( level.gametype, 30 );
        maps\mp\_utility::registerWinLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerRoundLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerNumLivesDvar( level.gametype, 0 );
        maps\mp\_utility::registerHalfTimeDvar( level.gametype, 0 );
        maps\mp\_utility::registerScoreLimitDvar( level.gametype, 30 );
        level.matchRules_damageMultiplier = 0;
        level.matchRules_vampirism = 0;
    }

    level.classicgamemode = 1;
    level.onStartGameType = ::onStartGameType;
    level.getSpawnPoint = ::getSpawnPoint;
    level.onNormalDeath = ::onNormalDeath;
    level.onPlayerScore = ::onPlayerScore;

    if ( getdvarint( "party_maxPlayers", 18 ) == 2 )
        level.xpgamemodescale = 2;

    if ( level.matchRules_damageMultiplier || level.matchRules_vampirism )
        level.modifyPlayerDamage = maps\mp\gametypes\_damage::gamemodeModifyPlayerDamage;

    setteammode( "ffa" );
    game["dialog"]["gametype"] = "freeforall";
}

initializeMatchRules()
{
    maps\mp\_utility::setCommonRulesFromMatchRulesData( 1 );
    setdynamicdvar( "scr_dm_winlimit", 1 );
    maps\mp\_utility::registerWinLimitDvar( "dm", 1 );
    setdynamicdvar( "scr_dm_roundlimit", 1 );
    maps\mp\_utility::registerRoundLimitDvar( "dm", 1 );
    setdynamicdvar( "scr_dm_halftime", 0 );
    maps\mp\_utility::registerHalfTimeDvar( "dm", 0 );
}

onStartGameType()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setObjectiveText( "allies", &"OBJECTIVES_DM" );
    maps\mp\_utility::setObjectiveText( "axis", &"OBJECTIVES_DM" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_DM" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_DM_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    maps\mp\_utility::setObjectiveHintText( "allies", &"OBJECTIVES_DM_HINT" );
    maps\mp\_utility::setObjectiveHintText( "axis", &"OBJECTIVES_DM_HINT" );
    level.spawnMins = ( 0, 0, 0 );
    level.spawnMaxs = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_dm_spawn" );
    level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
    setmapcenter( level.mapCenter );
    var_0[0] = "dm";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.QuickMessageToAll = 1;
}

getSpawnPoint()
{
    if ( level.inGracePeriod )
        var_0 = maps\mp\gametypes\_spawnlogic::getstartspawnffa( self.team );
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::_id_411F( self.team );
        var_0 = _id_A7BA::_id_40D5( var_1 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_0 );
    return var_0;
}

onNormalDeath( var_0, var_1, var_2 )
{
    var_3 = 0;

    foreach ( var_5 in level.players )
    {
        if ( isdefined( var_5.score ) && var_5.score > var_3 )
            var_3 = var_5.score;
    }

    if ( game["state"] == "postgame" && var_1.score >= var_3 )
        var_1.finalKill = 1;
}

onPlayerScore( var_0, var_1, var_2 )
{
    var_3 = _id_A7B4::_id_40C1( var_0 );
    var_1 maps\mp\_utility::_id_7F6B( var_1.extrascore0 + var_3 );
    var_1 _id_A795::_id_9B65( var_1, var_3 );

    if ( isscoringevent( var_0 ) )
        return 1;
    else
        return 0;
}

isscoringevent( var_0 )
{
    switch ( var_0 )
    {
        case "kill":
        case "airstrike_mp_kill":
        case "helicopter_mp_kill":
            return 1;
    }

    return 0;
}
