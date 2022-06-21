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
        maps\mp\_utility::registerRoundSwitchDvar( level.gametype, 1, 0, 9 );
        maps\mp\_utility::registerTimeLimitDvar( level.gametype, 2.5 );
        maps\mp\_utility::registerScoreLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerRoundLimitDvar( level.gametype, 0 );
        maps\mp\_utility::registerWinLimitDvar( level.gametype, 4 );
        maps\mp\_utility::registerNumLivesDvar( level.gametype, 1 );
        maps\mp\_utility::registerHalfTimeDvar( level.gametype, 0 );
        level.matchRules_damageMultiplier = 0;
        level.matchRules_vampirism = 0;
        setdynamicdvar( "scr_killcount_persists", 0 );
    }

    level._id_62F8 = 1;
    level.teamBased = 1;
    level.classicgamemode = 1;
    level._id_64DA = maps\mp\gametypes\common_sd_sr::_id_64DA;
    level.onStartGameType = ::onStartGameType;
    level.getSpawnPoint = ::getSpawnPoint;
    level._id_64E9 = ::_id_64E9;
    level._id_64D3 = ::_id_64D3;
    level._id_6466 = maps\mp\gametypes\common_sd_sr::_id_6466;
    level._id_64C0 = maps\mp\gametypes\common_sd_sr::_id_64C0;
    level._id_64F0 = maps\mp\gametypes\common_sd_sr::_id_64F0;
    level.onNormalDeath = maps\mp\gametypes\common_sd_sr::onNormalDeath;
    level._id_3BF5 = maps\mp\gametypes\common_sd_sr::_id_517B;
    level._id_0AAB = 0;

    if ( level.matchRules_damageMultiplier || level.matchRules_vampirism )
        level.modifyPlayerDamage = maps\mp\gametypes\_damage::gamemodeModifyPlayerDamage;

    game["dialog"]["gametype"] = "searchdestroy";
    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    maps\mp\gametypes\common_sd_sr::setbombendtime( 0, 0 );
    maps\mp\gametypes\common_sd_sr::setbombendtime( 0, 1 );
}

initializeMatchRules()
{
    maps\mp\_utility::setCommonRulesFromMatchRulesData();
    var_0 = getmatchrulesdata( "sdData", "roundLength" );
    setdynamicdvar( "scr_sd_timelimit", var_0 );
    maps\mp\_utility::registerTimeLimitDvar( "sd", var_0 );
    var_1 = getmatchrulesdata( "sdData", "roundSwitch" );
    setdynamicdvar( "scr_sd_roundswitch", var_1 );
    maps\mp\_utility::registerRoundSwitchDvar( "sd", var_1, 0, 9 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sd_winlimit", var_2 );
    maps\mp\_utility::registerWinLimitDvar( "sd", var_2 );
    setdynamicdvar( "scr_sd_bombtimer", getmatchrulesdata( "sdData", "bombTimer" ) );
    setdynamicdvar( "scr_sd_planttime", getmatchrulesdata( "sdData", "plantTime" ) );
    setdynamicdvar( "scr_sd_defusetime", getmatchrulesdata( "sdData", "defuseTime" ) );
    setdynamicdvar( "scr_sd_multibomb", getmatchrulesdata( "sdData", "multiBomb" ) );
    setdynamicdvar( "scr_sd_silentplant", getmatchrulesdata( "sdData", "silentPlant" ) );
    setdynamicdvar( "scr_sd_roundlimit", 0 );
    maps\mp\_utility::registerRoundLimitDvar( "sd", 0 );
    setdynamicdvar( "scr_sd_scorelimit", 1 );
    maps\mp\_utility::registerScoreLimitDvar( "sd", 1 );
    setdynamicdvar( "scr_sd_halftime", 0 );
    maps\mp\_utility::registerHalfTimeDvar( "sd", 0 );
}

onStartGameType()
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

    setclientnamemode( "manual_change" );
    maps\mp\gametypes\common_bomb_gameobject::loadbombfx();
    maps\mp\_utility::setObjectiveText( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
    maps\mp\_utility::setObjectiveText( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::setObjectiveScoreText( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
        maps\mp\_utility::setObjectiveScoreText( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::setObjectiveScoreText( game["attackers"], &"OBJECTIVES_SD_ATTACKER_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( game["defenders"], &"OBJECTIVES_SD_DEFENDER_SCORE" );
    }

    maps\mp\_utility::setObjectiveHintText( game["attackers"], &"OBJECTIVES_SD_ATTACKER_HINT" );
    maps\mp\_utility::setObjectiveHintText( game["defenders"], &"OBJECTIVES_SD_DEFENDER_HINT" );
    initSpawns();
    var_2[0] = "sd";
    var_2[1] = "bombzone";
    var_2[2] = "blocker";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread maps\mp\gametypes\common_sd_sr::_id_9B22();
    maps\mp\_utility::setcarrierloadouts();
    thread maps\mp\gametypes\common_sd_sr::_id_1549();
    thread _id_A7BB::allowallyteamspectating();
}

initSpawns()
{
    level.spawnMins = ( 0, 0, 0 );
    level.spawnMaxs = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_sd_spawn_attacker" );
    maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_sd_spawn_defender" );
    level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
    setmapcenter( level.mapCenter );
}

getSpawnPoint()
{
    var_0 = "mp_sd_spawn_defender";

    if ( self.pers["team"] == game["attackers"] )
        var_0 = "mp_sd_spawn_attacker";

    var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( var_0 );
    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_64E9()
{
    var_0 = maps\mp\_utility::_id_5092( self.isrespawningwithbombcarrierclass );

    if ( maps\mp\_utility::_id_5112( self ) )
    {
        self._id_5174 = 0;
        self._id_50EF = 0;

        if ( !var_0 )
        {
            self._id_50C8 = 0;
            self.offense_level = 0;
        }
    }

    if ( isplayer( self ) && !var_0 )
    {
        if ( level._id_5FE2 && self.pers["team"] == game["attackers"] )
            self _meth_82F8( "ui_carrying_bomb", 1 );
        else
            self _meth_82F8( "ui_carrying_bomb", 0 );
    }

    maps\mp\_utility::_id_7F6B( 0 );

    if ( isdefined( self.pers["plants"] ) )
        maps\mp\_utility::_id_7F6B( self.pers["plants"] );

    maps\mp\_utility::_id_7F6C( 0 );

    if ( isdefined( self.pers["defuses"] ) )
        maps\mp\_utility::_id_7F6C( self.pers["defuses"] );

    self.isrespawningwithbombcarrierclass = undefined;
    level notify( "spawned_player" );
    thread maps\mp\gametypes\common_sd_sr::onplayerdisconnect();
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isplayer( self ) )
        self _meth_82F8( "ui_carrying_bomb", 0 );

    thread maps\mp\gametypes\common_sd_sr::_id_1CF1();
}
