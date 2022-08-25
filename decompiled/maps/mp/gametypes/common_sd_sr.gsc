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

_id_64DA()
{
    maps\mp\gametypes\common_bomb_gameobject::_id_64DA();
}

_id_9B22()
{
    level._id_688D = maps\mp\_utility::_id_2FCF( "planttime", 5, 0, 20 );
    level._id_27BF = maps\mp\_utility::_id_2FCF( "defusetime", 5, 0, 20 );
    level.bombtimer = maps\mp\_utility::_id_2FCF( "bombtimer", 45, 1, 300 );
    level._id_5FE2 = maps\mp\_utility::_id_2FD0( "multibomb", 0, 0, 1 );
    level._id_8572 = maps\mp\_utility::_id_2FD0( "silentplant", 0, 0, 1 );
}

_id_517B( var_0 )
{
    if ( isdefined( level.bombzones ) )
    {
        foreach ( var_2 in level.bombzones )
        {
            if ( distancesquared( self.origin, var_2.trigger.origin ) < 4096 )
                return 0;
        }
    }

    return 1;
}

onnormaldeath( var_0, var_1, var_2 )
{
    if ( game["state"] == "postgame" && ( var_0.team == game["defenders"] || !level.bombplanted ) )
        var_1.finalkill = 1;

    if ( var_0._id_5174 || var_0._id_50EF )
    {
        var_1 thread maps\mp\_events::_id_27AE( var_0, var_2 );

        if ( var_0._id_5174 )
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_" + level.gametype + "_interrupt" );

        if ( var_0._id_50EF )
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_" + level.gametype + "_protector" );
    }

    if ( waseliminatedbyenemy( var_0, var_1 ) )
    {
        var_3 = _id_5140( var_1 );
        var_1 thread maps\mp\_events::_id_305C( var_3, var_0 );
    }
}

waseliminatedbyenemy( var_0, var_1 )
{
    if ( maps\mp\gametypes\_damage::_id_510E( var_0, var_1 ) )
        return 0;

    if ( var_0 maps\mp\gametypes\_playerlogic::_id_5A62() )
        return 0;

    return 1;
}

_id_64C2( var_0 )
{
    maps\mp\gametypes\common_bomb_gameobject::oncarrybombpickup( var_0, game["attackers"] );

    if ( var_0.team == "allies" )
        var_0.objective = 1;
    else
        var_0.objective = 2;

    if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_0.team] ) )
    {
        var_0.isrespawningwithbombcarrierclass = 1;
        var_0 thread maps\mp\_utility::applycarrierclass();
    }

    if ( !level.bombdefused )
    {
        maps\mp\_utility::_id_91FA( "callout_bombtaken", var_0, var_0.team );
        maps\mp\_utility::_id_564B( "bomb_taken", var_0.pers["team"] );
    }
}

bombs()
{
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    var_0 = getent( "sd_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        common_scripts\utility::_id_334F( "No sd_bomb_pickup_trig trigger found in map." );
        return;
    }

    var_1 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sd_bomb" );

    if ( !isdefined( var_1 ) )
    {
        common_scripts\utility::_id_334F( "No sd_bomb script_model found in map." );
        return;
    }

    if ( !level._id_5FE2 )
    {
        level._id_7B74 = maps\mp\gametypes\common_bomb_gameobject::createbombcarryobject( game["attackers"], "friendly", var_0, var_1 );
        thread maps\mp\_utility::streamcarrierweaponstoplayers( level._id_7B74, [ game["attackers"] ], ::shouldstreamcarrierclasstoplayer );

        if ( game["attackers"] == "allies" )
            maps\mp\_utility::_id_7FAE( level._id_7B74, "waypoint_bomb_green" );
        else
            maps\mp\_utility::_id_7FAE( level._id_7B74, "waypoint_bomb_red" );

        level._id_7B74._id_64C2 = ::_id_64C2;
        level._id_7B74._id_646F = ::_id_646F;
    }
    else
    {
        var_0 delete();
        var_1[0] delete();
    }

    level.bombzones = [];
    var_2 = getentarray( "bombzone", "targetname" );
    var_3 = getentarray( "bombzone_augmented", "targetname" );

    if ( maps\mp\_utility::_id_50C4() )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = var_3[var_4].script_label;

            for ( var_6 = 0; var_6 < var_2.size; var_6++ )
            {
                if ( var_2[var_6].script_label == var_5 )
                {
                    _id_7397( var_2[var_6] );
                    break;
                }
            }
        }
    }
    else
    {
        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
            _id_7397( var_3[var_7] );
    }

    var_2 = common_scripts\utility::array_combine( var_2, var_3 );

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        var_0 = var_2[var_7];
        var_1 = getentarray( var_2[var_7].target, "targetname" );
        var_8 = undefined;

        if ( !level._id_5FE2 )
            var_8 = level._id_7B74;

        var_9 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( game["defenders"], "enemy", "any", var_0, var_8, 1 );
        maps\mp\_utility::_id_7FAE( var_9, "waypoint_esports_snd_target" + var_9.label + "_white" );
        var_9._id_6454 = ::_id_6454;
        var_9._id_648E = ::_id_648E;
        var_9.onuse = ::_id_64FB;
        var_9._id_6459 = ::_id_6459;
        level.bombzones[level.bombzones.size] = var_9;
        var_9.bombdefusetrig = getent( var_1[0].target, "targetname" );
        var_9.bombdefusetrig.origin += ( 0.0, 0.0, -10000.0 );
        var_9.bombdefusetrig.label = var_9.label;
        var_9.bombdefusetrig _meth_852A( 1 );
    }

    for ( var_7 = 0; var_7 < level.bombzones.size; var_7++ )
    {
        var_10 = [];

        for ( var_11 = 0; var_11 < level.bombzones.size; var_11++ )
        {
            if ( var_11 != var_7 )
                var_10[var_10.size] = level.bombzones[var_11];
        }

        level.bombzones[var_7]._id_65B1 = var_10;
    }

    setomnvar( "ui_mlg_game_mode_status_1", 0 );
}

shouldstreamcarrierclasstoplayer( var_0, var_1 )
{
    if ( level.bombplanted )
        return 0;

    if ( isdefined( var_0._id_1BAF ) && var_0._id_1BAF == var_1 )
        return 0;

    return 1;
}

_id_7397( var_0 )
{
    var_1 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3._id_79F4 ) || var_3._id_79F4 != "bombzone" )
            continue;

        if ( !isdefined( var_3.script_label ) )
            continue;

        if ( issubstr( var_3.script_label, var_0.script_label ) && issubstr( var_3.script_label, var_0.targetname ) )
            var_3 delete();
    }

    var_5 = getentarray( var_0.target, "targetname" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7.target ) )
        {
            var_8 = getentarray( var_7.target, "targetname" );

            foreach ( var_10 in var_8 )
                var_10 delete();
        }

        var_7 delete();
    }

    var_0 delete();
}

_id_64FB( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0.pers["team"] ) )
    {
        level thread bombplanted( self, var_0 );

        for ( var_1 = 0; var_1 < level.bombzones.size; var_1++ )
        {
            if ( level.bombzones[var_1] == self )
            {
                var_2 = level.bombzones[var_1] maps\mp\gametypes\_gameobjects::_id_3FFA();
                maps\mp\_utility::_id_7FAE( level.bombzones[var_1], "waypoint_esports_snd_planted" + var_2 );
                continue;
            }

            level.bombzones[var_1] maps\mp\gametypes\_gameobjects::_id_2B1E();
            maps\mp\_utility::_id_7FAE( level.bombzones[var_1], undefined );
        }

        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerplantbomb( 1, game["attackers"], game["defenders"] );

        if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_0.team] ) )
        {
            var_0 thread maps\mp\_utility::removecarrierclass();
            return;
        }
    }
    else
        self.bombplantedon = 0;
}

_id_6454( var_0 )
{
    if ( maps\mp\gametypes\_gameobjects::_id_510F( var_0.pers["team"] ) )
        maps\mp\gametypes\common_bomb_gameobject::onbegindefusebomb( var_0, level._id_7B75 );
    else
    {
        maps\mp\gametypes\common_bomb_gameobject::onbeginplantbomb( var_0 );

        if ( level._id_5FE2 )
        {
            for ( var_1 = 0; var_1 < self._id_65B1.size; var_1++ )
            {
                self._id_65B1[var_1] maps\mp\gametypes\_gameobjects::allowuse( "none" );
                self._id_65B1[var_1] maps\mp\gametypes\_gameobjects::_id_8352( "friendly" );
            }
        }
    }
}

_id_648E( var_0, var_1, var_2 )
{
    if ( var_1._id_5174 && level._id_5FE2 && !var_2 )
    {
        for ( var_3 = 0; var_3 < self._id_65B1.size; var_3++ )
        {
            self._id_65B1[var_3] maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
            self._id_65B1[var_3] maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        }
    }

    var_4 = isdefined( var_1 ) && var_1._id_50EF && !var_2;
    maps\mp\gametypes\common_bomb_gameobject::onendusebomb( var_1, var_4 );
}

bombplantedanim( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 playerlinkto( level._id_7B75 );
    var_0 playerlinkedoffsetenable();

    while ( var_0 getcurrentweapon() == self._id_9C1C )
        waittillframeend;

    var_0 unlink();
}

bombplanted( var_0, var_1 )
{
    level.bombplanted = 1;
    var_1.objective = 0;
    level._id_27BB = int( gettime() + level.bombtimer * 1000 );
    setgameendtime( level._id_27BB );
    setomnvar( "ui_bomb_timer", 1 );

    if ( !level._id_5FE2 )
    {
        level._id_7B74 maps\mp\gametypes\_gameobjects::allowcarry( "none" );
        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
        maps\mp\_utility::_id_7FAE( level._id_7B74, undefined );
        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_7F5D();
        level._id_7B75 = level._id_7B74.visuals[0];
    }
    else
    {
        level._id_7B75 = spawn( "script_model", var_1.origin );
        level._id_7B75.angles = var_1.angles;
        level._id_7B75 setmodel( "wpn_h1_briefcase_bomb_npc" );
    }

    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombplanted( level._id_7B75.origin + ( 0.0, 0.0, 1.0 ) );
    var_0 maps\mp\gametypes\_gameobjects::allowuse( "none" );
    var_0 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    var_2 = var_0 maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_3 = var_0.bombdefusetrig;
    var_3.origin = level._id_7B75.origin;
    var_4 = [];
    var_5 = maps\mp\gametypes\_gameobjects::createuseobject( game["defenders"], var_3, var_4, ( 0.0, 0.0, 32.0 ) );
    var_5.label = var_2;
    var_5 maps\mp\gametypes\common_bomb_gameobject::setupzonefordefusing( 1 );
    var_5._id_6454 = ::_id_6454;
    var_5._id_648E = ::_id_648E;
    var_5.onuse = ::_id_64FA;
    var_5._id_6242 = 1;
    var_5._id_4B53 = "defuseObject";

    if ( var_2 == "_a" || var_2 == "_A" )
        setomnvar( "ui_mlg_game_mode_status_1", 1 );
    else if ( var_2 == "_b" || var_2 == "_B" )
        setomnvar( "ui_mlg_game_mode_status_1", 2 );

    bombtimerwait( var_5 isbombsiteb() );
    setomnvar( "ui_bomb_timer", 0 );
    setbombendtime( 0, var_5 isbombsiteb() );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();

    if ( level.gameended || level.bombdefused )
        return;

    level.bombexploded = 1;
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    var_6 = level._id_7B75.origin;
    var_6 += ( 0.0, 0.0, 10.0 );
    level._id_7B75 hide();
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombexploded( var_6, 300, var_1 );

    for ( var_7 = 0; var_7 < level.bombzones.size; var_7++ )
        level.bombzones[var_7] maps\mp\gametypes\_gameobjects::_id_2B1E();

    var_5 maps\mp\gametypes\_gameobjects::_id_2B1E();
    setgameendtime( 0 );
    wait 3;
    _id_7B56( game["attackers"], game["end_reason"]["target_destroyed"] );
}

isbombsiteb()
{
    return self.label == "_b" || self.label == "_B";
}

setbombendtime( var_0, var_1 )
{
    if ( var_1 )
        setomnvar( "ui_bomb_timer_endtime_2", var_0 );
    else
        setomnvar( "ui_bomb_timer_endtime", var_0 );
}

bombtimerwait( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    var_1 = int( level.bombtimer * 1000 + gettime() );
    setbombendtime( var_1, var_0 );
    level thread _id_4663( var_1, var_0 );
    maps\mp\gametypes\_hostmigration::_id_A051( level.bombtimer );
}

_id_4663( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    setbombendtime( 0, var_1 );
    var_2 = maps\mp\gametypes\_hostmigration::_id_A0DD();

    if ( var_2 > 0 )
        setbombendtime( var_0 + var_2, var_1 );
}

_id_646F( var_0 )
{
    maps\mp\gametypes\common_bomb_gameobject::oncarrybombdrop( game["attackers"], game["defenders"] );
}

_id_64FA( var_0 )
{
    var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerdefusebomb( getdefusetype( var_0 ), game["defenders"], game["attackers"] );
    thread bombdefused( isbombsiteb() );
}

getdefusetype( var_0 )
{
    var_1 = "defuse";

    if ( isdefined( level.bombowner ) && maps\mp\_utility::_id_5189( level.bombowner ) )
        var_1 = "ninja_defuse";

    if ( _id_5140( var_0 ) )
        var_1 = "last_man_defuse";

    return var_1;
}

_id_5140( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2 == var_0 )
            continue;

        if ( var_2 maps\mp\gametypes\_playerlogic::_id_5A62() )
            return 0;

        if ( maps\mp\_utility::_id_5189( var_2 ) )
            return 0;
    }

    return 1;
}

bombdefused( var_0 )
{
    maps\mp\gametypes\_gameobjects::_id_2B1E();
    level.bombdefused = 1;
    setbombendtime( 0, var_0 );
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    level notify( "bomb_defused" );
    wait 1.5;
    setgameendtime( 0 );
    _id_7B56( game["defenders"], game["end_reason"]["bomb_defused"] );
}

_id_6459( var_0 )
{
    var_0 clientiprintlnbold( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

_id_64F0()
{
    _id_7B56( game["defenders"], game["end_reason"]["time_limit_reached"] );
}

_id_7B56( var_0, var_1 )
{
    level._id_374D = var_0;

    if ( var_0 == game["attackers"] )
    {
        if ( !isdefined( game["attackerWinCount"] ) )
            game["attackerWinCount"] = 0;

        game["attackerWinCount"]++;
    }
    else if ( var_0 == game["defenders"] )
    {
        if ( !isdefined( game["defenderWinCount"] ) )
            game["defenderWinCount"] = 0;

        game["defenderWinCount"]++;
    }

    if ( var_1 == game["end_reason"]["target_destroyed"] || var_1 == game["end_reason"]["bomb_defused"] )
    {
        var_2 = 1;

        foreach ( var_4 in level.bombzones )
        {
            if ( isdefined( level._id_3743[var_0] ) && level._id_3743[var_0] == var_4._id_534E )
            {
                var_2 = 0;
                break;
            }
        }

        if ( var_2 )
            maps\mp\gametypes\_damage::_id_334E();
    }

    maps\mp\gametypes\_gamescores::_id_420C( var_0, 1 );
    thread maps\mp\gametypes\_gamelogic::_id_315F( var_0, var_1 );
}

_id_1CF1()
{
    wait 0.05;
    var_0 = 0;

    if ( !level.alivecount[game["attackers"]] )
    {
        level._id_8A4A[game["attackers"]].allowenemyspectate = 1;
        var_0 = 1;
    }

    if ( !level.alivecount[game["defenders"]] )
    {
        level._id_8A4A[game["defenders"]].allowenemyspectate = 1;
        var_0 = 1;
    }

    if ( var_0 )
        maps\mp\gametypes\_spectating::_id_9B72();
}

onplayerdisconnect()
{
    level endon( "game_ended" );
    self notify( "onPlayerDisconnect" );
    self endon( "onPlayerDisconnect" );
    self waittill( "disconnect" );
    thread _id_1CF1();
}

_id_6466( var_0 )
{
    if ( level.bombexploded || level.bombdefused )
        return;

    if ( var_0 == "all" )
    {
        if ( level.bombplanted )
            _id_7B56( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_7B56( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level.bombplanted )
            return;

        level thread _id_7B56( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_7B56( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_64C0( var_0 )
{
    if ( level.bombexploded || level.bombdefused )
        return;

    var_1 = maps\mp\_utility::_id_3FFC( var_0 );
    var_1 thread _id_41F0();
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
    maps\mp\gametypes\_misions::_id_55BC();
}

_id_64E0()
{

}
