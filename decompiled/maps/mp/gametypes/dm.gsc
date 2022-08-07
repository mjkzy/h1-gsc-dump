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
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 30 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 30 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.classicgamemode = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onnormaldeath = ::onnormaldeath;
    level.onplayerscore = ::onplayerscore;

    if ( getdvarint( "party_maxPlayers", 18 ) == 2 )
        level.xpgamemodescale = 2;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    setteammode( "ffa" );
    game["dialog"]["gametype"] = "freeforall";
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata( 1 );
    setdynamicdvar( "scr_dm_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "dm", 1 );
    setdynamicdvar( "scr_dm_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "dm", 1 );
    setdynamicdvar( "scr_dm_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "dm", 0 );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_DM" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_DM" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DM" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DM_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_DM_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_DM_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0[0] = "dm";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
}

getspawnpoint()
{
    if ( level.ingraceperiod )
        var_0 = maps\mp\gametypes\_spawnlogic::getstartspawnffa( self.team );
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.team );
        var_0 = maps\mp\gametypes\_spawnscoring::getspawnpoint_freeforall( var_1 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_0 );
    return var_0;
}

onnormaldeath( var_0, var_1, var_2 )
{
    var_3 = 0;

    foreach ( var_5 in level.players )
    {
        if ( isdefined( var_5.score ) && var_5.score > var_3 )
            var_3 = var_5.score;
    }

    if ( game["state"] == "postgame" && var_1.score >= var_3 )
        var_1.finalkill = 1;
}

onplayerscore( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::_id_40C1( var_0 );
    var_1 maps\mp\_utility::_id_7F6B( var_1.extrascore0 + var_3 );
    var_1 maps\mp\gametypes\_gamescores::_id_9B65( var_1, var_3 );

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
