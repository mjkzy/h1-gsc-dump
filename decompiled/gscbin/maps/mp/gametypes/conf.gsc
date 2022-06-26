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
        maps\mp\_utility::registerScoreLimitDvar( level.gametype, 65 );
        maps\mp\_utility::registerRoundLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerWinLimitDvar( level.gametype, 1 );
        maps\mp\_utility::registerNumLivesDvar( level.gametype, 0 );
        maps\mp\_utility::registerHalfTimeDvar( level.gametype, 0 );
        level.matchRules_damageMultiplier = 0;
        level.matchRules_vampirism = 0;
    }

    level.teamBased = 1;
    level.onStartGameType = ::onStartGameType;
    level.getSpawnPoint = ::getSpawnPoint;
    level.onNormalDeath = ::onNormalDeath;
    level.killstreak_kills = getdvarint( "scr_conf_killstreak_kill", 1 );
    level.killstreak_tag_friendly = getdvarint( "scr_conf_killstreak_tag_friendly", 0 );
    level.killstreak_tag_enemy = getdvarint( "scr_conf_killstreak_tag_enemy", 0 );

    if ( level.matchRules_damageMultiplier || level.matchRules_vampirism )
        level.modifyPlayerDamage = maps\mp\gametypes\_damage::gamemodeModifyPlayerDamage;

    game["dialog"]["gametype"] = "kc_intro";
    game["dialog"]["kill_confirmed"] = "kc_killconfirmed";
    game["dialog"]["kill_denied"] = "kc_killdenied";
    game["dialog"]["kill_lost"] = "kc_killlost";
    game["dialog"]["defense_obj"] = "kc_start";
    game["dialog"]["offense_obj"] = "kc_start";
    level.conf_fx["vanish"] = loadfx( "vfx/unique/dogtag_vanish" );
}

initializeMatchRules()
{
    maps\mp\_utility::setCommonRulesFromMatchRulesData();
    setdynamicdvar( "scr_conf_roundswitch", 0 );
    maps\mp\_utility::registerRoundSwitchDvar( "conf", 0, 0, 9 );
    setdynamicdvar( "scr_conf_roundlimit", 1 );
    maps\mp\_utility::registerRoundLimitDvar( "conf", 1 );
    setdynamicdvar( "scr_conf_winlimit", 1 );
    maps\mp\_utility::registerWinLimitDvar( "conf", 1 );
    setdynamicdvar( "scr_conf_halftime", 0 );
    maps\mp\_utility::registerHalfTimeDvar( "conf", 0 );
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = getmatchrulesdata( "confData", "killstreakPointsType" );

    if ( var_3 == 2 )
    {
        var_0 = 1;
        var_2 = 1;
    }
    else if ( var_3 == 1 )
        var_2 = 1;
    else
        var_0 = 1;

    setdynamicdvar( "scr_conf_killstreak_kill", var_0 );
    setdynamicdvar( "scr_conf_killstreak_tag_friendly", var_1 );
    setdynamicdvar( "scr_conf_killstreak_tag_enemy", var_2 );
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

    maps\mp\_utility::setObjectiveText( "allies", &"OBJECTIVES_CONF" );
    maps\mp\_utility::setObjectiveText( "axis", &"OBJECTIVES_CONF" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_CONF" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_CONF" );
    }
    else
    {
        maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_CONF_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_CONF_SCORE" );
    }

    maps\mp\_utility::setObjectiveHintText( "allies", &"OBJECTIVES_CONF_HINT" );
    maps\mp\_utility::setObjectiveHintText( "axis", &"OBJECTIVES_CONF_HINT" );
    initSpawns();
    level.dogtags = [];
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
        var_2 = maps\mp\gametypes\_spawnlogic::getTeamSpawnPoints( var_0 ); // the function called below this should be something related to "getSpawnpoint_<gamemode>"
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

onNormalDeath( var_0, var_1, var_2 )
{
    level thread spawnDogTags( var_0, var_1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level._id_65B3[var_1.team]] )
        var_1.finalKill = 1;
}

spawnDogTags( var_0, var_1 )
{
    var_2 = var_0.pers["team"];

    if ( isdefined( level.dogtags[var_0.guid] ) )
    {
        playfx( level.conf_fx["vanish"], level.dogtags[var_0.guid].curOrigin );
        level.dogtags[var_0.guid] notify( "reset" );
    }
    else
    {
        if ( !isdefined( level.killconfirmeddogtagenemy ) )
            level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated";

        if ( !isdefined( level.killconfirmeddogtagfriend ) )
            level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated";

        var_3[0] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[0] setModel( level.killconfirmeddogtagenemy );
        var_3[1] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[1] setModel( level.killconfirmeddogtagfriend );
        var_4 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );
        level.dogtags[var_0.guid] = maps\mp\gametypes\_gameobjects::createUseObject( "any", var_4, var_3, ( 0, 0, 16 ) );
        maps\mp\_utility::_objective_delete( level.dogtags[var_0.guid].teamObjIds );
        maps\mp\_utility::_objective_delete( level.dogtags[var_0.guid]._id_6306 );
        maps\mp\_utility::_objective_delete( level.dogtags[var_0.guid]._id_6309 );
        maps\mp\gametypes\_objpoints::deleteObjPoint( level.dogtags[var_0.guid]._id_6316["allies"] );
        maps\mp\gametypes\_objpoints::deleteObjPoint( level.dogtags[var_0.guid]._id_6316["axis"] );
        maps\mp\gametypes\_objpoints::deleteObjPoint( level.dogtags[var_0.guid]._id_6316["mlg"] );
        level.dogtags[var_0.guid] maps\mp\gametypes\_gameobjects::setUseTime( 0 );
        level.dogtags[var_0.guid].onUse = ::onUse;
        level.dogtags[var_0.guid]._id_9E07 = var_0;
        level.dogtags[var_0.guid]._id_9E0A = var_2;
        level.dogtags[var_0.guid].objId = maps\mp\gametypes\_gameobjects::getNextObjID();
        objective_add( level.dogtags[var_0.guid].objId, "invisible", ( 0, 0, 0 ) );
        objective_icon( level.dogtags[var_0.guid].objId, "waypoint_dogtags" );
        level.dogtags[var_0.guid].objidself = maps\mp\gametypes\_gameobjects::getNextObjID();
        objective_add( level.dogtags[var_0.guid].objidself, "invisible", ( 0, 0, 0 ) );
        objective_icon( level.dogtags[var_0.guid].objidself, "waypoint_dogtags_friendlys" );
        level thread clearOnVictimDisconnect( var_0 );
        var_0 thread tagTeamUpdater( level.dogtags[var_0.guid] );
    }

    var_5 = var_0.owner_not + ( 0, 0, 14 );
    level.dogtags[var_0.guid].curOrigin = var_5;
    level.dogtags[var_0.guid].trigger.owner_not = var_5;
    level.dogtags[var_0.guid].visuals[0].owner_not = var_5;
    level.dogtags[var_0.guid].visuals[1].owner_not = var_5;
    level.dogtags[var_0.guid] maps\mp\gametypes\_gameobjects::initializeTagPathVariables();
    level.dogtags[var_0.guid] maps\mp\gametypes\_gameobjects::allowUse( "any" );
    level.dogtags[var_0.guid].visuals[0] thread showToTeam( level.dogtags[var_0.guid], maps\mp\_utility::getOtherTeam( var_2 ) );
    level.dogtags[var_0.guid].visuals[1] thread showToTeam( level.dogtags[var_0.guid], var_2 );
    level.dogtags[var_0.guid].attacker = var_1;
    objective_position( level.dogtags[var_0.guid].objId, var_5 );
    objective_state( level.dogtags[var_0.guid].objId, "active" );
    objective_playerenemyteam( level.dogtags[var_0.guid].objId, var_0 _meth_81B5() );
    objective_position( level.dogtags[var_0.guid].objidself, var_5 );
    objective_state( level.dogtags[var_0.guid].objidself, "active" );
    objective_player( level.dogtags[var_0.guid].objidself, var_0 _meth_81B5() );
    playsoundatpos( var_5, "mp_killconfirm_tags_drop" );
    level.dogtags[var_0.guid].visuals[0] ScriptModelPlayAnim( "mp_dogtag_spin" );
    level.dogtags[var_0.guid].visuals[1] ScriptModelPlayAnim( "mp_dogtag_spin" );
}

showToTeam( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self _meth_8056();

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_1 )
            self ShowToPlayer( var_3 );

        if ( var_3.team == "spectator" && var_1 == "allies" )
            self ShowToPlayer( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self _meth_8056();

        foreach ( var_3 in level.players )
        {
            if ( var_3.team == var_1 )
                self ShowToPlayer( var_3 );

            if ( var_3.team == "spectator" && var_1 == "allies" )
                self ShowToPlayer( var_3 );

            if ( var_0._id_9E0A == var_3.team && var_3 == var_0.attacker )
                objective_state( var_0.objId, "invisible" );
        }
    }
}

onUse( var_0 )
{
    if ( isdefined( var_0.owner ) )
        var_0 = var_0.owner;

    var_1 = var_0.pers["team"];

    if ( var_1 == self._id_9E0A )
    {
        self.trigger _meth_809C( "mp_kc_tag_denied" );

        if ( isplayer( var_0 ) )
            var_0 maps\mp\_utility::_id_5655( "kill_denied" );

        if ( isdefined( self.attacker ) && isplayer( self.attacker ) )
            self.attacker maps\mp\_utility::_id_5655( "kc_killlost" );

        var_2 = self._id_9E07 == var_0;
        var_0 _id_A738::_id_5359( var_2 );

        if ( level.killstreak_tag_friendly )
            maps\mp\gametypes\_damage::incrementkillstreak( var_0 );
    }
    else
    {
        self.trigger _meth_809C( "mp_kc_tag_collected" );

        if ( isplayer( self.attacker ) && self.attacker != var_0 )
            level thread _id_A7B4::_id_1208( "team_confirmed", self.attacker );

        var_0 _id_A738::_id_5356();

        if ( isplayer( var_0 ) )
            var_0 maps\mp\_utility::_id_5655( "kill_confirmed" );

        var_0 _id_A795::_id_420C( var_1, 1 );

        if ( level.killstreak_tag_enemy )
            maps\mp\gametypes\_damage::incrementkillstreak( var_0 );
    }

    level thread _id_A738::_id_5ED2( var_0 );
    _id_7461();
}

_id_7461()
{
    self.attacker = undefined;
    self notify( "reset" );
    self.visuals[0] _meth_8056();
    self.visuals[1] _meth_8056();
    self.curOrigin = ( 0, 0, 1000 );
    self.trigger.owner_not = ( 0, 0, 1000 );
    self.visuals[0].owner_not = ( 0, 0, 1000 );
    self.visuals[1].owner_not = ( 0, 0, 1000 );
    maps\mp\gametypes\_gameobjects::allowUse( "none" );
    objective_state( self.objId, "invisible" );
    objective_state( self.objidself, "invisible" );
}

tagTeamUpdater( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        var_0._id_9E0A = self.pers["team"];
        var_0 _id_7461();
    }
}

clearOnVictimDisconnect( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0.guid;
    var_0 waittill( "disconnect" );

    if ( isdefined( level.dogtags[var_1] ) )
    {
        level.dogtags[var_1] maps\mp\gametypes\_gameobjects::allowUse( "none" );
        playfx( level.conf_fx["vanish"], level.dogtags[var_1].curOrigin );
        level.dogtags[var_1] notify( "reset" );
        wait 0.05;

        if ( isdefined( level.dogtags[var_1] ) )
        {
            objective_delete( level.dogtags[var_1].objId );
            objective_delete( level.dogtags[var_1].objidself );
            level.dogtags[var_1].trigger _meth_80B2();

            for ( var_2 = 0; var_2 < level.dogtags[var_1].visuals.size; var_2++ )
                level.dogtags[var_1].visuals[var_2] _meth_80B2();

            level.dogtags[var_1] notify( "deleted" );
            level.dogtags[var_1] = undefined;
        }
    }
}
