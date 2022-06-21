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
    level._id_7137 = 0;
    level.onStartGameType = ::onStartGameType;
    level.getSpawnPoint = ::getSpawnPoint;
    level._id_64E9 = ::_id_64E9;
    maps\mp\_utility::registerNumLivesDvar( level.gametype, 0 );
    maps\mp\_utility::registerTimeLimitDvar( level.gametype, 0 );
    maps\mp\_utility::registerScoreLimitDvar( level.gametype, 1 );
    maps\mp\_utility::registerHalfTimeDvar( level.gametype, 0 );
    level._id_1E38 = level._id_1E2E;
    level._id_1E2E = ::_id_5BB1;
    game["menu_team"] = "main";
    game["menu_class_allies"] = "main";
    game["menu_class_axis"] = "main";
    game["menu_changeclass_allies"] = "main";
    game["menu_changeclass_axis"] = "main";
    game["menu_changeclass"] = "menu_cac_assault";
    game["allies"] = "sentinel_vl";
    game["axis"] = "atlas";
}

_id_5BB1( var_0 )
{
    level.inGracePeriod = 1;
    self._id_4729 = 0;
    [[ level._id_1E38 ]]( var_0 );
}

onStartGameType()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    maps\mp\_utility::setObjectiveText( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveText( "axis", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveScoreText( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveScoreText( "axis", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveHintText( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::setObjectiveHintText( "axis", &"OBJECTIVES_WAR" );
    _id_4D5D();
    var_0[0] = level.gametype;
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level._id_6F09 = 0;
    level._id_6F0A = 0;
}

_id_4D5D()
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

getSpawnPoint( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level.players.size; var_1++ )
        {
            if ( level.players[var_1] == self )
            {
                var_0 = var_1;
                break;
            }
        }
    }

    var_2 = getentarray( "player_pos", "targetname" );
    var_3 = undefined;

    foreach ( var_3 in var_2 )
    {
        if ( var_3.script_parentname == "" + var_0 )
            break;
    }

    if ( !isdefined( var_3 ) )
        var_3 = var_2[0];

    self._id_117A = var_3;
    return var_3;
}

_id_64E9()
{
    if ( isdefined( level._id_9EAA ) )
        self [[ level._id_9EAA ]]();
}
