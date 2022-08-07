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

init()
{
    level.killstreakspawnshield = 0;
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    level._id_1F11 = undefined;
    level._id_2AF8 = 0;
    level._id_62AC = 0;
    level._id_62AB = 0;
    level.badspawncount["axis"] = 0;
    level.badspawncount["allies"] = 0;
    level.players = [];
    level.participants = [];
    level.characters = [];
    level._id_89FE = [];
    level._id_4407 = [];
    level._id_5CC2 = [];
    level._id_1B9C = [];
    level._id_99BB = [];
    level._id_78FE = [];
    level._id_99EF = [];
    level._id_94F1 = [];
    level.activeplayerlistupdatetime = -1;
    level.activeplayerlist = [];
    maps\mp\gametypes\_legacyspawnlogic::init();
    level thread _id_94C0();

    if ( !maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
    {
        level thread _id_64C8();
        level thread _id_8A03();
        level thread _id_9508();
        level thread _id_94B7();
        level thread _id_94C1();
    }

    for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
        level.teamspawnpoints[level.teamnamelist[var_0]] = [];
}

_id_94C1()
{
    for (;;)
    {
        self waittill( "host_migration_end" );

        foreach ( var_1 in level.participants )
            var_1.canperformclienttraces = canperformclienttraces( var_1 );
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level thread _id_8D01( var_0 );
        level thread updatespawnsightsforplayer( var_0 );
    }
}

_id_8D01( var_0 )
{
    var_0 endon( "disconnect" );
    var_0.canperformclienttraces = canperformclienttraces( var_0 );

    if ( !var_0.canperformclienttraces )
        return;

    wait 0.05;
    var_0 setclientspawnsighttraces( level._id_1F11 );
}

updatespawnsightsforplayer( var_0 )
{
    while ( isdefined( var_0 ) )
    {
        var_1 = var_0 common_scripts\utility::_id_A071( "death", "disconnect", "joined_spectators", "joined_team" );
        removespawnsightsforplayer( var_0 );

        if ( var_1 == "disconnect" )
            break;
    }
}

calculatespawntospawnsights()
{
    var_0 = ( 0.0, 0.0, 64.0 );

    foreach ( var_2 in level.spawnpoints )
    {
        var_2.fullsightspawns = [];
        var_2.cornersightspawns = [];
        var_2.trackplayersights = 1;
    }

    foreach ( var_2 in level.spawnpoints )
    {
        if ( !maps\mp\_utility::_id_5092( var_2.trackplayersights ) )
            continue;

        var_5 = var_2.origin + var_0;

        foreach ( var_7 in level.spawnpoints )
        {
            var_8 = var_7.origin + var_0;
            var_9 = spawnsighttrace( var_2, var_5, var_8, var_2.info_player_start );

            if ( var_9 > 0.95 )
            {
                var_2.fullsightspawns[var_2.fullsightspawns.size] = var_7;
                continue;
            }

            if ( var_9 > 0.0 )
                var_2.cornersightspawns[var_2.cornersightspawns.size] = var_7;
        }
    }
}

canperformclienttraces( var_0 )
{
    if ( level._id_2AF8 )
        return 0;

    if ( !isdefined( level._id_1F11 ) )
        return 0;

    if ( isai( var_0 ) )
        return 0;

    if ( var_0 ishost() )
        return 0;

    return 1;
}

addstartspawnpoints( var_0, var_1 )
{
    var_2 = _id_40DD( var_0 );

    if ( !var_2.size )
    {
        if ( !maps\mp\_utility::_id_5092( var_1 ) )
        {

        }

        return;
    }

    if ( !isdefined( level._id_8D3D ) )
        level._id_8D3D = [];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] _id_8A00();
        var_2[var_3]._id_7C63 = 0;
        level._id_8D3D[level._id_8D3D.size] = var_2[var_3];
    }

    foreach ( var_5 in var_2 )
    {
        var_5._id_4C68 = 1;
        var_6 = anglestoforward( var_5.angles );

        foreach ( var_8 in var_2 )
        {
            if ( var_5 == var_8 )
                continue;

            var_9 = vectornormalize( var_8.origin - var_5.origin );
            var_10 = vectordot( var_6, var_9 );

            if ( var_10 > 0.86 )
            {
                var_5._id_4C68 = 0;
                break;
            }
        }
    }

    if ( !maps\mp\_utility::_id_5092( var_1 ) )
    {
        var_13 = var_2.size;
        var_14 = level._id_8D3D.size;
        addstartspawnpoints( var_0 + "_overflow", 1 );
        var_15 = level._id_8D3D.size - var_14;
    }
}

addspawnpoints( var_0, var_1 )
{
    if ( !isdefined( level.spawnpoints ) )
        level.spawnpoints = [];

    if ( !isdefined( level.teamspawnpoints[var_0] ) )
        level.teamspawnpoints[var_0] = [];

    var_2 = [];
    var_2 = _id_40DD( var_1 );

    if ( !isdefined( level._id_1F11 ) )
        level._id_1F11 = var_1;

    if ( !var_2.size )
        return;

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4._id_4DB5 ) )
        {
            var_4 _id_8A00();
            level.spawnpoints[level.spawnpoints.size] = var_4;
        }

        level.teamspawnpoints[var_0][level.teamspawnpoints[var_0].size] = var_4;
    }
}

_id_8A00()
{
    var_0 = self;
    level.spawnmins = _id_3519( level.spawnmins, var_0.origin );
    level.spawnmaxs = _id_3518( level.spawnmaxs, var_0.origin );
    var_0.forward = anglestoforward( var_0.angles );
    var_0._id_856B = var_0.origin + ( 0.0, 0.0, 50.0 );
    var_0._id_55DF = gettime();
    var_0._id_65D1 = 1;
    var_0._id_4DB5 = 1;
    var_0._id_0B03 = [];
    var_1 = 1024;

    if ( !bullettracepassed( var_0._id_856B, var_0._id_856B + ( 0, 0, var_1 ), 0, undefined ) )
    {
        var_2 = var_0._id_856B + var_0.forward * 100;

        if ( !bullettracepassed( var_2, var_2 + ( 0, 0, var_1 ), 0, undefined ) )
            var_0._id_65D1 = 0;
    }

    var_3 = anglestoright( var_0.angles );
    _id_07C9( var_0, var_0.origin + var_3 * 45 );
    _id_07C9( var_0, var_0.origin - var_3 * 45 );
    _id_4E25( var_0 );
}

_id_07C9( var_0, var_1 )
{
    var_2 = playerphysicstrace( var_0.origin, var_0.origin + ( 0.0, 0.0, 18.0 ) );
    var_3 = var_2[2] - var_0.origin[2];
    var_4 = ( var_1[0], var_1[1], var_1[2] + var_3 );
    var_5 = playerphysicstrace( var_2, var_4 );

    if ( var_5 != var_4 )
        return;

    var_6 = droptoground( var_4 );

    if ( abs( var_6[2] - var_1[2] ) > 128 )
        return;

    var_0._id_0B03[var_0._id_0B03.size] = var_6;
}

_id_40DD( var_0 )
{
    if ( !isdefined( level._id_89FE ) )
        level._id_89FE = [];

    if ( !isdefined( level._id_89FE[var_0] ) )
    {
        level._id_89FE[var_0] = [];
        level._id_89FE[var_0] = getspawnarray( var_0 );

        foreach ( var_2 in level._id_89FE[var_0] )
            var_2.classname = var_0;
    }

    return level._id_89FE[var_0];
}

cananyplayerseeffaspawnpoint( var_0 )
{
    var_1 = ( 0.0, 0.0, 64.0 );
    var_2 = var_0.origin + var_1;

    foreach ( var_4 in level.players )
    {
        if ( var_4.sharpturnlookaheaddist != "playing" )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_4 ) )
            continue;

        if ( var_4 == self )
            continue;

        var_5 = var_4.origin + var_1;

        if ( sighttracepassed( var_2, var_5, 0, var_4 ) )
            return 1;
    }

    return 0;
}

getstartspawnffa( var_0 )
{
    if ( !isdefined( level.ffastartspawnpoints ) )
        level.ffastartspawnpoints = [];

    if ( !isdefined( level.ffastartspawnpoints[var_0] ) )
    {
        var_1 = getteamspawnpoints( var_0 );
        level.ffastartspawnpoints[var_0] = [];

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3.script_parentname ) && var_3.script_parentname == "start_spawn" )
                level.ffastartspawnpoints[var_0][level.ffastartspawnpoints[var_0].size] = var_3;
        }
    }

    var_5 = undefined;

    if ( level.ffastartspawnpoints[var_0].size >= level.players.size )
        var_5 = _id_40D8( level.ffastartspawnpoints[var_0], 1 );

    if ( !isdefined( var_5 ) )
    {
        var_6 = getteamspawnpoints( var_0 );
        var_6 = common_scripts\utility::_id_0CF5( var_6 );

        foreach ( var_8 in var_6 )
        {
            if ( !isdefined( var_8.ffastartspawnsighted ) )
                var_8.ffastartspawnsighted = 0;
            else if ( var_8.ffastartspawnsighted )
                continue;

            if ( cananyplayerseeffaspawnpoint( var_8 ) )
            {
                var_8.ffastartspawnsighted = 1;
                continue;
            }

            if ( canspawn( var_8.origin ) && !positionwouldtelefrag( var_8.origin ) )
            {
                var_5 = var_8;
                break;
            }
        }

        if ( !isdefined( var_5 ) )
            var_5 = _id_40D8( var_6 );
    }

    return var_5;
}

_id_40D8( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_0 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns( var_0 );
    var_0 = common_scripts\utility::_id_0CF5( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( canspawn( var_3.origin ) && !positionwouldtelefrag( var_3.origin ) )
            return var_3;
    }

    if ( !maps\mp\_utility::_id_5092( var_1 ) && var_0.size > 0 )
        return var_0[var_0.size - 1];

    return undefined;
}

getbeststartspawn( var_0 )
{
    var_1 = _id_40DD( var_0 );
    var_2 = _id_40DB( var_1 );

    if ( !isdefined( var_2 ) )
    {
        var_3 = _id_40DD( var_0 + "_overflow" );
        var_2 = _id_40DB( var_3 );
    }

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_40D8( var_1 );
        var_2._id_7C63 = 1;
    }

    return var_2;
}

getrandomstartspawn( var_0 )
{
    var_1 = _id_40DD( var_0 );
    var_2 = _id_40D8( var_1, 1 );

    if ( !isdefined( var_2 ) )
    {
        var_3 = _id_40DD( var_0 + "_overflow" );
        var_2 = _id_40D8( var_3, 1 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = _id_40D8( var_1 );

    return var_2;
}

_id_40DB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_0 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_7C63 )
            continue;

        if ( var_3._id_4C68 )
        {
            var_1 = var_3;
            break;
        }

        var_1 = var_3;
    }

    if ( isdefined( var_1 ) )
        var_1._id_7C63 = 1;

    return var_1;
}

_id_40D7( var_0, var_1 )
{
    for (;;)
        wait 5;
}

_id_94C0()
{
    for (;;)
    {
        level._id_4407 = getentarray( "grenade", "classname" );
        wait 0.05;
    }
}

_id_9508()
{
    for (;;)
    {
        level._id_5CC2 = getentarray( "rocket", "classname" );
        wait 0.05;
    }
}

_id_94B7()
{
    for (;;)
    {
        level._id_1B9C = getentarray( "care_package", "targetname" );
        wait 0.05;
    }
}

getteamspawnpoints( var_0 )
{
    return level.teamspawnpoints[var_0];
}

_id_5170()
{
    if ( !isdefined( level._id_66DA ) )
    {
        var_0 = getallnodes();
        level._id_66DA = isdefined( var_0 ) && var_0.size > 150;
    }

    return level._id_66DA;
}

_id_084E()
{
    if ( isdefined( level.ishorde ) && level.ishorde )
        level notify( "participant_added", self );

    level.participants[level.participants.size] = self;
}

_id_73AC()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.participants.size; var_1++ )
    {
        if ( level.participants[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level.participants.size - 1; var_1++ )
                level.participants[var_1] = level.participants[var_1 + 1];

            level.participants[var_1] = undefined;
            break;
        }
    }
}

addtocharactersarray()
{
    level.characters[level.characters.size] = self;
}

removefromcharactersarray()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.characters.size; var_1++ )
    {
        if ( level.characters[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level.characters.size - 1; var_1++ )
                level.characters[var_1] = level.characters[var_1 + 1];

            level.characters[var_1] = undefined;
            break;
        }
    }
}

_id_8A03()
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    while ( !isdefined( level.spawnpoints ) || level.spawnpoints.size == 0 )
        wait 0.05;

    calculatespawntospawnsights();
    level thread _id_8A02();
    level thread spawnpointclientsightupdate();
    level thread _id_89FF();
}

updateactiveplayerlist()
{
    var_0 = gettime();

    if ( level.activeplayerlistupdatetime == var_0 )
        return;

    level.activeplayerlistupdatetime = var_0;
    level.activeplayerlist = [];
    level._id_0719 = 0;
    var_1 = level.gametype;
    var_2 = 0;

    if ( var_1 == "dm" || var_1 == "gun" )
        var_2 = 1;

    foreach ( var_4 in level.characters )
    {
        var_4.isactiveplayer = 0;

        if ( isplayer( var_4 ) && var_2 && ( var_4.sharpturnlookaheaddist == "playing" || var_4.sharpturnlookaheaddist == "dead" ) )
            level._id_0719++;

        if ( !maps\mp\_utility::_id_5189( var_4 ) )
            continue;

        if ( isplayer( var_4 ) && var_4.sharpturnlookaheaddist != "playing" )
            continue;

        var_4._id_89ED = _id_40DE( var_4 );

        if ( var_4._id_89ED == "spectator" )
            continue;

        var_5 = _id_4091( var_4 );
        var_6 = var_4 geteye();
        var_6 = ( var_6[0], var_6[1], var_4.origin[2] + var_5 );
        var_4._id_89EE = var_5;
        var_4._id_8A13 = var_6;
        var_4.isactiveplayer = 1;
        level.activeplayerlist[level.activeplayerlist.size] = var_4;
    }
}

spawnpointclientsightupdate()
{
    level.maxclientupdatesperframe = 200;
    var_0 = 0;
    var_1 = 0;
    updateactiveplayerlist();

    for (;;)
    {
        if ( var_1 )
        {
            wait 0.05;
            var_0 = 0;
            var_1 = 0;
            updateactiveplayerlist();
        }

        var_2 = level.spawnpoints;
        var_2 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns( var_2 );
        var_1 = 1;

        for ( var_3 = 0; var_3 < level.characters.size; var_3++ )
        {
            var_4 = level.characters[var_3];

            if ( !var_4.canperformclienttraces )
                continue;

            if ( !var_4.isactiveplayer )
            {
                removespawnsightsforplayer( var_4 );
                continue;
            }

            for ( var_5 = 0; var_5 < level.spawnpoints.size; var_5++ )
            {
                var_0++;
                var_6 = level.spawnpoints[var_5];
                var_7 = var_4 _meth_857b( var_6.classname );
                var_8 = var_6.fullsightsplayers[var_4.guid];
                var_9 = isdefined( var_8 );
                var_10 = var_6.cornersightsplayers[var_4.guid];
                var_11 = isdefined( var_10 );
                var_12 = 0;

                if ( var_9 )
                    var_12 = var_8.titleunlocked;
                else if ( var_11 )
                    var_12 = var_10.titleunlocked;

                if ( var_7 <= var_12 )
                    continue;

                var_13 = var_4 clientspawnsighttracepassed( var_6.info_player_start, var_6.classname );

                if ( var_13 >= 1.0 )
                {
                    if ( var_9 )
                        var_8.titleunlocked = var_7;
                    else
                    {
                        if ( var_11 )
                            removecornersightsfromspawnforplayer( var_6, var_4 );

                        addfullsightspawnforplayer( var_6, var_4, var_7 );
                    }

                    continue;
                }

                if ( var_13 >= 0.5 && level._id_0719 <= 8 )
                {
                    if ( var_11 )
                        var_10.titleunlocked = var_7;
                    else
                    {
                        if ( var_9 )
                            removefullsightsfromspawnforplayer( var_6, var_4 );

                        addcornersightspawnforplayer( var_6, var_4, var_7 );
                    }

                    continue;
                }

                if ( var_11 )
                    removecornersightsfromspawnforplayer( var_6, var_4 );

                if ( var_9 )
                    removefullsightsfromspawnforplayer( var_6, var_4 );
            }

            if ( var_0 + level.spawnpoints.size > level.maxclientupdatesperframe )
            {
                wait 0.05;
                var_0 = 0;
                var_1 = 0;
                updateactiveplayerlist();
            }
        }
    }
}

_id_8A02()
{
    if ( isdefined( level.skipspawnsighttraces ) && level.skipspawnsighttraces )
        return;

    level.maxtraceperframe = 36;
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        if ( var_1 )
        {
            wait 0.05;
            var_0 = 0;
            var_1 = 0;
            updateactiveplayerlist();
        }

        var_2 = level.spawnpoints;
        var_2 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns( var_2 );
        var_1 = 1;

        foreach ( var_4 in var_2 )
        {
            var_4._id_5609 = gettime();
            var_5 = 0;

            foreach ( var_7 in level.activeplayerlist )
            {
                var_8 = var_4.origin + ( 0, 0, var_7._id_89EE );
                var_9 = var_7._id_8A13;
                removespawnsightsfromspawnforplayer( var_4, var_7 );
                var_10 = spawnsighttrace( var_4, var_8, var_9, var_4.info_player_start );
                var_0++;
                var_5++;

                if ( !var_10 )
                    continue;

                if ( var_10 > 0.95 )
                {
                    addfullsightspawnforplayer( var_4, var_7, gettime() );
                    continue;
                }

                if ( level._id_0719 > 8 )
                    continue;

                addcornersightspawnforplayer( var_4, var_7, gettime() );
            }

            if ( var_0 + var_5 > level.maxtraceperframe )
            {
                wait 0.05;
                var_0 = 0;
                var_1 = 0;
                updateactiveplayerlist();
            }
        }
    }
}

_id_89FF()
{
    var_0 = gettime();
    var_1 = 4;
    var_2 = 0;
    updateactiveplayerlist();

    for (;;)
    {
        var_3 = level.spawnpoints;
        var_3 = maps\mp\gametypes\_spawnscoring::checkdynamicspawns( var_3 );
        var_4 = 0;

        foreach ( var_6 in var_3 )
        {
            _id_1F02( var_6 );
            var_2++;

            foreach ( var_8 in level.activeplayerlist )
            {
                if ( var_8._id_89ED == "spectator" )
                    continue;

                if ( isdefined( level.spawndistanceteamskip ) && var_8._id_89ED == level.spawndistanceteamskip )
                    continue;

                var_9 = distancesquared( var_8.origin, var_6.origin );

                if ( var_9 < var_6._id_5C45[var_8._id_89ED] )
                    var_6._id_5C45[var_8._id_89ED] = var_9;

                var_6._id_2B83[var_8._id_89ED] += var_9;
                var_6._id_93FE[var_8._id_89ED]++;

                if ( var_9 < 1638400 )
                {
                    if ( maps\mp\_utility::_id_5189( var_8 ) )
                        var_6._id_606E[var_8._id_89ED]++;
                }
            }

            if ( var_2 == var_1 )
            {
                var_4 = 1;
                wait 0.05;
                updateactiveplayerlist();
                var_0 = gettime();
                var_2 = 0;
            }
        }

        if ( !var_4 )
        {
            wait 0.05;
            updateactiveplayerlist();
            var_0 = gettime();
            var_2 = 0;
        }
    }
}

_id_40DE( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = var_0.team;

    return var_1;
}

_id_4E25( var_0 )
{
    _id_1F03( var_0 );
    _id_1F02( var_0 );
}

_id_1F03( var_0 )
{
    if ( level.teambased )
    {
        foreach ( var_2 in level.teamnamelist )
            _id_1F09( var_0, var_2 );
    }
    else
        _id_1F09( var_0, "all" );
}

_id_1F02( var_0 )
{
    if ( level.teambased )
    {
        foreach ( var_2 in level.teamnamelist )
            _id_1F08( var_0, var_2 );
    }
    else
        _id_1F08( var_0, "all" );
}

_id_1F09( var_0, var_1 )
{
    var_0._id_3AE2[var_1] = 0;
    var_0.fullsightsplayers = [];
    var_0._id_222B[var_1] = 0;
    var_0.cornersightsplayers = [];
}

_id_1F08( var_0, var_1 )
{
    var_0._id_2B83[var_1] = 0;
    var_0._id_5C45[var_1] = 9999999;
    var_0._id_93FE[var_1] = 0;
    var_0._id_606E[var_1] = 0;
}

removespawnsightsfromspawnforplayer( var_0, var_1 )
{
    removefullsightsfromspawnforplayer( var_0, var_1 );
    removecornersightsfromspawnforplayer( var_0, var_1 );
}

removefullsightsfromspawnforplayer( var_0, var_1 )
{
    var_2 = var_0.fullsightsplayers[var_1.guid];

    if ( isdefined( var_2 ) )
    {
        var_0._id_3AE2[var_2.team]--;
        var_0.fullsightsplayers[var_1.guid] = undefined;
    }
}

removecornersightsfromspawnforplayer( var_0, var_1 )
{
    var_2 = var_0.cornersightsplayers[var_1.guid];

    if ( isdefined( var_2 ) )
    {
        var_0._id_222B[var_2.team]--;
        var_0.cornersightsplayers[var_1.guid] = undefined;
    }
}

removespawnsightsforplayer( var_0 )
{
    if ( !isdefined( level.spawnpoints ) )
        return;

    foreach ( var_2 in level.spawnpoints )
    {
        if ( !maps\mp\_utility::_id_5092( var_2.trackplayersights ) )
            continue;

        removespawnsightsfromspawnforplayer( var_2, var_0 );
    }
}

addspawnsights( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    foreach ( var_3 in var_0.fullsightspawns )
        addfullsightspawnforplayer( var_3, var_1, gettime() );

    foreach ( var_6 in var_0.cornersightspawns )
        addcornersightspawnforplayer( var_6, var_1, gettime() );
}

addfullsightspawnforplayer( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    var_1._id_89ED = _id_40DE( var_1 );
    var_0._id_3AE2[var_1._id_89ED]++;
    var_3 = spawnstruct();
    var_3.playercardbackground = var_1;
    var_3.titleunlocked = var_2;
    var_3.team = var_1._id_89ED;
    var_0.fullsightsplayers[var_1.guid] = var_3;
}

addcornersightspawnforplayer( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    var_1._id_89ED = _id_40DE( var_1 );
    var_0._id_222B[var_1._id_89ED]++;
    var_3 = spawnstruct();
    var_3.playercardbackground = var_1;
    var_3.titleunlocked = var_2;
    var_3.team = var_1._id_89ED;
    var_0.cornersightsplayers[var_1.guid] = var_3;
}

_id_4091( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        return 64.0;

    var_2 = var_0 getstance();

    if ( var_2 == "stand" )
        return 64.0;

    if ( var_2 == "crouch" )
        return 44.0;

    return 32.0;
}

_id_07EE( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = _id_40DE( var_3 );

        if ( var_0._id_3AE2[var_4] )
            continue;

        var_5 = spawnsighttrace( var_0, var_0._id_856B, var_3.origin + ( 0.0, 0.0, 50.0 ), var_0.info_player_start );

        if ( !var_5 )
            continue;

        if ( var_5 > 0.95 )
        {
            var_0._id_3AE2[var_4]++;
            continue;
        }

        var_0._id_222B[var_4]++;
    }
}

_id_373D( var_0 )
{
    var_1 = gettime();
    self._id_55DD = var_0;
    self._id_55DF = var_1;
    var_0._id_55DF = var_1;
    var_0._id_55DE = self.team;

    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        var_0.lastspawnedplayer = self;
    else
    {
        removespawnsightsforplayer( self );
        addspawnsights( var_0, self );
    }
}

_id_351A( var_0 )
{
    var_1 = _id_40DD( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level.spawnmins = _id_3519( level.spawnmins, var_1[var_2].origin );
        level.spawnmaxs = _id_3518( level.spawnmaxs, var_1[var_2].origin );
    }
}

_id_3519( var_0, var_1 )
{
    if ( var_0[0] > var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] > var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] > var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_3518( var_0, var_1 )
{
    if ( var_0[0] < var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] < var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] < var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

findboxcenter( var_0, var_1 )
{
    var_2 = ( 0.0, 0.0, 0.0 );
    var_2 = var_1 - var_0;
    var_2 = ( var_2[0] / 2, var_2[1] / 2, var_2[2] / 2 ) + var_0;
    return var_2;
}

_id_7FA6()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    _id_351A( "mp_tdm_spawn_allies_start" );
    _id_351A( "mp_tdm_spawn_axis_start" );
    level.mapcenter = findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

_id_84BB()
{
    return level.ingraceperiod && ( !isdefined( level._id_62A5 ) || level._id_62A5 == 0 );
}

_id_7273( var_0 )
{
    if ( !isdefined( self._id_89E4 ) )
        self._id_89E4 = spawnstruct();

    self._id_89E4._id_89FD = var_0;
}
