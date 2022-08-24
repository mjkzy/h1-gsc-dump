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
    level._id_62F8 = 1;
    level.teambased = 1;

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registerroundswitchdvar( level.gametype, 0, 0, 9 );
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
        setdynamicdvar( "scr_killcount_persists", 0 );
    }

    maps\mp\_utility::setcarrierloadouts();
    level.classicgamemode = 1;

    if ( !intiebreaker() )
    {
        level._id_64DA = ::_id_64DA;
        level.onstartgametype = ::onstartgametype;
        level.getspawnpoint = ::getspawnpoint;
        level._id_64E9 = ::_id_64E9;
        level._id_64C0 = ::_id_64C0;
        level._id_64F0 = ::_id_64F0;
        level._id_6466 = ::_id_6466;
        level.onnormaldeath = ::onnormaldeath;
        level.overridewasonlyround = ::wasonlyroundsab;
        game["dialog"]["gametype"] = "sabotage";
        game["dialog"]["offense_obj"] = "capture_objs";
        game["dialog"]["defense_obj"] = "capture_objs";
    }
    else
    {
        level.onstartgametype = ::onstartgametype;
        level.getspawnpoint = ::getspawnpoint;
        level._id_64E9 = ::_id_64E9;
        game["dialog"]["gametype"] = "sabotage";
        game["dialog"]["offense_obj"] = "boost";
        game["dialog"]["defense_obj"] = "boost";
        maps\mp\_utility::_id_7FD8( "numlives", 1 );
        maps\mp\_utility::_id_7FD8( "timeLimit", 0 );
    }

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    var_0 = getent( "sab_bomb_defuse_allies", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_0 = getent( "sab_bomb_defuse_axis", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    setomnvar( "ui_bomb_timer_endtime", 0 );
}

wasonlyroundsab()
{
    if ( maps\mp\_utility::_id_415E( "roundlimit" ) == 0 && maps\mp\_utility::_id_415E( "winlimit" ) == 1 )
        return 1;

    return 0;
}

intiebreaker()
{
    return maps\mp\_utility::_id_5092( game["tiebreaker"] );
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_sab_bombtimer", getmatchrulesdata( "sabData", "bombTimer" ) );
    setdynamicdvar( "scr_sab_planttime", getmatchrulesdata( "sabData", "plantTime" ) );
    setdynamicdvar( "scr_sab_defusetime", getmatchrulesdata( "sabData", "defuseTime" ) );
    setdynamicdvar( "scr_sab_hotpotato", getmatchrulesdata( "sabData", "sharedBombTimer" ) );
    setdynamicdvar( "scr_sab_silentplant", getmatchrulesdata( "sabData", "silentPlant" ) );
    var_0 = getmatchrulesdata( "sabData", "roundSwitch" );
    setdynamicdvar( "scr_sab_roundswitch", var_0 );
    maps\mp\_utility::registerroundswitchdvar( "sab", var_0, 0, 9 );
    setdynamicdvar( "scr_sab_roundlimit", 0 );
    maps\mp\_utility::registerroundlimitdvar( "sab", 0 );
    var_1 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sab_winlimit", var_1 );
    maps\mp\_utility::registerwinlimitdvar( "sab", var_1 );
    setdynamicdvar( "scr_sab_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "sab", 0 );
}

_id_64DA()
{
    maps\mp\gametypes\common_bomb_gameobject::_id_64DA();
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    setclientnamemode( "auto_change" );

    if ( !intiebreaker() )
    {
        maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_SAB" );
        maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_SAB" );

        if ( level.splitscreen )
        {
            maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_SAB" );
            maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_SAB" );
        }
        else
        {
            maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_SAB_SCORE" );
            maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_SAB_SCORE" );
        }

        maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_SAB_HINT" );
        maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_SAB_HINT" );
    }
    else
    {
        maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_WAR" );
        maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_WAR" );

        if ( level.splitscreen )
        {
            maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_WAR" );
            maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_WAR" );
        }
        else
        {
            maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_WAR_SCORE" );
            maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_WAR_SCORE" );
        }

        maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_WAR_HINT" );
        maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_WAR_HINT" );
    }

    initspawns();

    if ( intiebreaker() )
    {
        setdvar( "bg_compassShowEnemies", 1 );
        var_0[0] = "war";
        maps\mp\gametypes\_gameobjects::main( var_0 );
        return;
    }

    var_0[0] = "sab";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    thread _id_9B22();
    thread sabotage();
    thread maps\mp\gametypes\_spectating::allowallyteamspectating();
}

initspawns()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_sab_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::addstartspawnpoints( "mp_sab_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_sab_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_sab_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    level.spawn_axis = [];
    level.spawn_axis_planted = [];
    level.spawn_axis_planted = [];
    level.spawn_axis_planted = [];
    level._id_88C7 = [];
    level.spawn_allies_planted = [];
    level.spawn_allies_planted = [];
    level.spawn_allies_planted = [];
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_sab_spawn" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
        {
            spawnpointerror( var_2 );
            continue;
        }

        switch ( var_2.script_noteworthy )
        {
            case "axis":
                level.spawn_axis[level.spawn_axis.size] = var_2;
            case "axis_planted":
                level.spawn_axis_planted[level.spawn_axis_planted.size] = var_2;
                continue;
            case "allies":
                level._id_88C7[level._id_88C7.size] = var_2;
            case "allies_planted":
                level.spawn_allies_planted[level.spawn_allies_planted.size] = var_2;
                continue;
            default:
                spawnpointerror( var_2 );
                continue;
        }
    }
}

spawnpointerror( var_0 )
{

}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getotherteam( var_0 );

    if ( level.usestartspawns )
        var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_sab_spawn_" + var_0 + "_start" );
    else if ( isdefined( level._id_1545 ) && level._id_1545 && ( isdefined( level._id_1544 ) && var_0 == level._id_1544.team ) )
    {
        if ( var_0 == "axis" )
            var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_axis_planted );
        else
            var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_allies_planted );
    }
    else if ( var_0 == "axis" )
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_axis );
    else
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level._id_88C7 );

    return var_1;
}

_id_64E9()
{
    self._id_5174 = 0;
    self._id_50EF = 0;
    self._id_50C8 = 0;
    self setclientomnvar( "ui_carrying_bomb", self._id_50C8 );

    if ( intiebreaker() )
        thread setplayersuddendeathvalues();
}

_id_9B22()
{
    level._id_688D = maps\mp\_utility::_id_2FCF( "planttime", 5, 0, 20 );
    level._id_27BF = maps\mp\_utility::_id_2FCF( "defusetime", 5, 0, 20 );
    level._id_1551 = maps\mp\_utility::_id_2FCF( "bombtimer", 45, 1, 300 );
    level.hotpotato = maps\mp\_utility::_id_2FD0( "hotpotato", 1, 0, 1 );
    level._id_8572 = maps\mp\_utility::_id_2FD0( "silentplant", 0, 0, 1 );
}

sabotage()
{
    level._id_1545 = 0;
    level._id_1540 = 0;
    maps\mp\gametypes\common_bomb_gameobject::loadbombfx();
    var_0 = getent( "sab_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
        common_scripts\utility::_id_334F( "No sab_bomb_pickup_trig trigger found in map." );
    else
    {
        var_1 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sab_bomb" );

        if ( !isdefined( var_1 ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb script_model found in map." );
            return;
        }

        level._id_7749 = maps\mp\gametypes\common_bomb_gameobject::createbombcarryobject( "neutral", "any", var_0, var_1 );
        thread maps\mp\_utility::streamcarrierweaponstoplayers( level._id_7749, [ "allies", "axis" ], ::shouldstreamcarrierclasstoplayer );
        level._id_7749._id_630A = 1;
        level._id_7749._id_64C2 = ::_id_64C2;
        level._id_7749._id_646F = ::_id_646F;
        level._id_7749._id_6316["allies"].archived = 1;
        level._id_7749._id_6316["axis"].archived = 1;
        level._id_7749._id_1142 = 60.0;
        maps\mp\_utility::_id_7FAE( level._id_7749, "waypoint_bomb" );

        if ( !isdefined( getent( "sab_bomb_axis", "targetname" ) ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb_axis trigger found in map." );
            return;
        }

        if ( !isdefined( getent( "sab_bomb_allies", "targetname" ) ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb_allies trigger found in map." );
            return;
        }

        if ( game["switchedsides"] )
        {
            level._id_1555["allies"] = createbombzone( "allies", getent( "sab_bomb_axis", "targetname" ) );
            level._id_1555["axis"] = createbombzone( "axis", getent( "sab_bomb_allies", "targetname" ) );
            return;
        }

        level._id_1555["allies"] = createbombzone( "allies", getent( "sab_bomb_allies", "targetname" ) );
        level._id_1555["axis"] = createbombzone( "axis", getent( "sab_bomb_axis", "targetname" ) );
    }
}

shouldstreamcarrierclasstoplayer( var_0, var_1 )
{
    if ( var_1.team == var_0 maps\mp\gametypes\_gameobjects::_id_4078() )
        return 0;

    return 1;
}

createbombzone( var_0, var_1 )
{
    var_2 = getentarray( var_1.target, "targetname" );
    var_3 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( var_0, "enemy", "none", var_1, level._id_7749, 0 );
    maps\mp\_utility::_id_7FAE( var_3, "waypoint_esports_sab_target" + var_3.label );
    var_3.onuse = ::onuse;
    var_3._id_6454 = ::_id_6454;
    var_3._id_648E = ::_id_648E;
    var_3._id_6459 = ::_id_6459;
    return var_3;
}

_id_6454( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0.pers["team"] ) )
        maps\mp\gametypes\common_bomb_gameobject::onbeginplantbomb( var_0 );
    else
        maps\mp\gametypes\common_bomb_gameobject::onbegindefusebomb( var_0, level.sabbombmodel );
}

_id_648E( var_0, var_1, var_2 )
{
    var_3 = isdefined( var_1 ) && var_1._id_50EF;
    maps\mp\gametypes\common_bomb_gameobject::onendusebomb( var_1, var_3 );
}

_id_64C2( var_0 )
{
    self._id_1142 = 60.0;
    level.usestartspawns = 0;
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    var_3 = undefined;

    if ( var_1 == maps\mp\gametypes\_gameobjects::_id_4078() )
        var_3 = var_1;

    maps\mp\gametypes\common_bomb_gameobject::oncarrybombpickup( var_0, var_3 );
    var_0 maps\mp\_utility::_id_5655( "obj_destroy", "bomb" );
    var_4[0] = var_0;
    maps\mp\_utility::_id_564B( "bomb_taken", var_1, "bomb", var_4 );

    if ( !level.splitscreen )
    {
        maps\mp\_utility::_id_564B( "bomb_lost", var_2, "bomb" );
        maps\mp\_utility::_id_564B( "obj_defend", var_2, "bomb" );
    }

    if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        var_0 thread maps\mp\_utility::applycarrierclass();

    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );
    maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_target" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_kill" );
    maps\mp\_utility::_id_7FAE( self, "waypoint_bomb" );
    level._id_1555[var_1] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555[var_2] maps\mp\gametypes\_gameobjects::_id_8352( "any" );
}

_id_646F( var_0 )
{
    if ( !level._id_1545 )
    {
        var_1 = maps\mp\gametypes\_gameobjects::_id_4078();
        maps\mp\gametypes\common_bomb_gameobject::oncarrybombdrop( var_1, level._id_65B3[var_1] );
        maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_bomb" );
        maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_bomb" );
        maps\mp\_utility::_id_7FAE( self, "waypoint_bomb" );
        level._id_1555["allies"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
        level._id_1555["axis"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    }
}

onuse( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = level._id_65B3[var_1];

    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0.pers["team"] ) )
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerplantbomb( 1, var_1, var_2 );
        var_3 = maps\mp\gametypes\_gameobjects::_id_3FFA();
        maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_planted" + var_3 );
        level thread _id_1545( self, var_0 );

        if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        {
            var_0 thread maps\mp\_utility::removecarrierclass();
            return;
        }
    }
    else
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerdefusebomb( getdefusetype( var_0 ), var_1, var_2 );
        level thread _id_1536( self, var_0, var_1 );
    }
}

getdefusetype( var_0 )
{
    var_1 = "defuse";

    if ( isdefined( level._id_1544 ) && level._id_1544._id_1547 + 3000 + level._id_27BF * 1000 > gettime() && maps\mp\_utility::_id_5189( level._id_1544 ) )
        var_1 = "ninja_defuse";

    return var_1;
}

_id_6459( var_0 )
{
    var_0 clientiprintlnbold( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

_id_1545( var_0, var_1 )
{
    level endon( "overtime" );
    level._id_1545 = 1;
    var_2 = var_1.pers["team"];
    var_0 maps\mp\gametypes\common_bomb_gameobject::setupzonefordefusing( 0 );
    level.bombplantedby = var_2;
    level._id_7749._id_1142 = undefined;
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_0AA1( "none" );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    maps\mp\_utility::_id_7FAE( level._id_7749, undefined );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_7F5D();
    level.sabbombmodel = level._id_7749.visuals[0];
    setomnvar( "ui_bomb_timer", 1 );
    level._id_27BB = int( gettime() + level._id_1551 * 1000 );
    setgameendtime( level._id_27BB );
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombplanted( level.sabbombmodel.origin + ( 0.0, 0.0, 1.0 ) );
    var_3 = var_0 maps\mp\gametypes\_gameobjects::_id_3FFA();

    if ( var_3 == "_allies" )
        setomnvar( "ui_mlg_game_mode_status_1", 1 );
    else if ( var_3 == "_axis" )
        setomnvar( "ui_mlg_game_mode_status_1", 2 );

    _id_1552();
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_bomb_timer_endtime", 0 );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();

    if ( level.gameended )
        return;

    if ( !level._id_1545 && level.hotpotato )
    {
        var_4 = ( gettime() - level.timepausestart ) / 1000;
        level._id_1551 -= var_4;
    }

    if ( !level._id_1545 )
        return;

    var_5 = level._id_7749.visuals[0].origin;
    level._id_1540 = 1;
    setdvar( "ui_danger_team", "BombExploded" );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombexploded( var_5, 200, var_1 );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555["allies"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555["axis"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    var_0 maps\mp\gametypes\_gameobjects::_id_2B1E();

    if ( level.gameended )
        return;

    setgameendtime( 0 );
    maps\mp\gametypes\_gamescores::_id_0640( var_2, 1 );
    maps\mp\gametypes\_gamescores::_id_9B84( var_2 );
    wait 3;
    level._id_374D = var_2;
    thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["target_destroyed"] );
}

_id_1552()
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    level endon( "game_ended" );
    var_0 = int( level._id_1551 * 1000 + gettime() );
    setomnvar( "ui_bomb_timer_endtime", var_0 );
    level thread _id_4663( var_0 );
    maps\mp\gametypes\_hostmigration::_id_A051( level._id_1551 );
}

_id_4663( var_0 )
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_1 = maps\mp\gametypes\_hostmigration::_id_A0DD();

    if ( var_1 > 0 )
        setomnvar( "ui_bomb_timer_endtime", var_0 + var_1 );
}

_id_41F0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_A0ED( 3 );
    var_0 = maps\mp\_utility::getotherteam( self.pers["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastteammemberalive", self, self.pers["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastenemyalive", self, var_0 );
    level notify( "last_alive", self );
}

_id_64F0()
{
    if ( maps\mp\_utility::_id_5092( level.insuddendeath ) )
        return;

    thread suddendeaththread();
}

suddendeaththread()
{
    level endon( "game_ended" );
    level._id_9366 = 1;
    level.insuddendeath = 1;

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        level.players[var_0] thread sabforcerespawn();
        level.players[var_0] thread setplayersuddendeathvalues();
    }

    setdvar( "bg_compassShowEnemies", 1 );
    maps\mp\_utility::_id_7FD8( "numlives", 1 );
    level.sabsuddendeathtime = 90;
    var_1 = 0;

    while ( var_1 < level.sabsuddendeathtime )
    {
        if ( !level._id_1545 )
        {
            var_1 += 1;
            setgameendtime( gettime() + ( level.sabsuddendeathtime - var_1 ) * 1000 );
        }

        wait 1.0;
    }

    level._id_374D = "none";
    thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["tie"] );
}

sabforcerespawn()
{
    self endon( "spawned_player" );
    self endon( "spawn" );
    self endon( "disconnect" );

    if ( !self._id_4745 )
        return;

    self notify( "force_spawn" );
    wait 0.05;

    if ( self.sessionstate != "playing" || self.health <= 0 )
    {
        while ( self.health <= 0 )
        {
            self notify( "force_spawn" );

            if ( maps\mp\_utility::_id_5129() )
            {
                self._id_1AB3 = 1;
                maps\mp\_utility::_id_1EF2();
            }
            else if ( self.sessionstate == "spectator" && !self._id_A04D && !maps\mp\_utility::_id_5092( self._id_A04E ) )
                thread sabwaitandspawnclient();

            wait 0.25;
        }
    }
}

sabwaitandspawnclient()
{
    self endon( "disconnect" );
    self._id_A04D = 1;
    maps\mp\gametypes\_playerlogic::_id_A008();

    if ( isdefined( self ) )
        self._id_A04D = 0;
}

setplayersuddendeathvalues()
{
    self endon( "disconnect" );
    self setclientdvars( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0, "cg_everyoneHearsEveryone", 0 );
    maps\mp\_utility::_id_3BE1( "prematch_done" );

    while ( self.sessionstate != "playing" || self.health <= 0 )
        wait 0.05;

    thread maps\mp\gametypes\_hud_message::_id_8A68( "sab_overtime" );
}

_id_6466( var_0 )
{
    level._id_374D = "none";

    if ( level._id_1540 )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_1545 )
        {
            level._id_374D = level.bombplantedby;
            maps\mp\gametypes\_gamescores::_id_0640( level.bombplantedby, 1 );
            maps\mp\gametypes\_gamescores::_id_9B84( level.bombplantedby );
            thread maps\mp\gametypes\_gamelogic::_id_315F( level.bombplantedby, game["end_reason"][level.bombplantedby + "_mission_accomplished"] );
        }
        else
            thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["tie"] );
    }
    else if ( level._id_1545 )
    {
        if ( var_0 == level.bombplantedby )
        {
            level.plantingteamdead = 1;
            return;
        }

        level._id_374D = level.bombplantedby;
        maps\mp\gametypes\_gamescores::_id_0640( level.bombplantedby, 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( level.bombplantedby );
        thread maps\mp\gametypes\_gamelogic::_id_315F( level.bombplantedby, game["end_reason"][level._id_65B3[level.bombplantedby] + "_eliminated"] );
    }
    else
    {
        level._id_374D = level._id_65B3[var_0];
        maps\mp\gametypes\_gamescores::_id_0640( level._id_65B3[var_0], 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( level._id_65B3[var_0] );
        thread maps\mp\gametypes\_gamelogic::_id_315F( level._id_65B3[var_0], game["end_reason"][var_0 + "_eliminated"] );
    }
}

_id_1536( var_0, var_1, var_2 )
{
    var_0.bombplantedon = 0;

    if ( maps\mp\_utility::_id_5092( level.insuddendeath ) && isdefined( level.plantingteamdead ) )
    {
        maps\mp\gametypes\_gamescores::_id_0640( var_2, 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( var_2 );
        level._id_374D = var_2;
        thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["bomb_defused"] );
        return;
    }

    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_bomb_timer_endtime", 0 );
    maps\mp\gametypes\_gamelogic::_id_74BC();
    level._id_1545 = 0;

    if ( !maps\mp\_utility::_id_5092( level.insuddendeath ) )
        level._id_9366 = 0;

    level notify( "bomb_defused" );
    var_0 maps\mp\gametypes\common_bomb_gameobject::resetbombzone( level._id_7749, "enemy", "none", 0 );
    maps\mp\_utility::_id_7FAE( var_0, "waypoint_esports_sab_target" + var_0.label );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_0AA1( "any" );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_7FE2( var_1 );
}

_id_64C0( var_0 )
{
    if ( level._id_1540 )
        return;

    var_1 = maps\mp\_utility::_id_3FFC( var_0 );
    var_1 thread _id_41F0();
}

onnormaldeath( var_0, var_1, var_2, var_0 )
{
    if ( var_1._id_5174 )
    {
        thread maps\mp\_matchdata::_id_5838( var_0, "planting" );
        var_2 thread maps\mp\_events::_id_27AE( var_1, var_0 );
    }
    else if ( var_1._id_50C8 )
        thread maps\mp\_matchdata::_id_5838( var_0, "carrying" );
    else if ( var_1._id_50EF )
    {
        thread maps\mp\_matchdata::_id_5838( var_0, "defusing" );
        var_2 thread maps\mp\_events::_id_27AE( var_1, var_0 );
    }
}
