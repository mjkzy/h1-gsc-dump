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

_id_3FC9()
{
    _id_9B49();

    if ( !level.placement["all"].size )
        return undefined;
    else
        return level.placement["all"][0];
}

_id_3FCA( var_0 )
{
    var_1 = [];

    if ( var_0 < 0 )
        return var_1;

    _id_9B49();

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( level.placement["all"].size == var_2 )
            break;

        var_1[var_2] = level.placement["all"][var_2];
    }

    return var_1;
}

_id_4010()
{
    _id_9B49();
    var_0 = level.placement["all"];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level.placement["all"][0] )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_9B65( var_0, var_1 )
{
    if ( level.teambased )
        return;

    var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", var_0.extrascore0 );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "score", var_1 );
}

displaypoints( var_0 )
{
    if ( !level.hardcoremode )
    {
        var_1 = maps\mp\gametypes\_rank::_id_40C1( var_0 );
        thread maps\mp\gametypes\_rank::_id_A3A6( var_0, var_1 );
    }
}

_id_41FC( var_0, var_1, var_2 )
{
    if ( isdefined( var_1.owner ) )
        var_1 = var_1.owner;

    if ( !isplayer( var_1 ) )
        return;

    var_1 displaypoints( var_0 );
    var_3 = var_1.pers["score"];
    onplayerscore( var_0, var_1, var_2 );
    var_4 = var_1.pers["score"] - var_3;

    if ( var_4 == 0 )
        return;

    if ( var_1.pers["score"] < 65535 )
        var_1.score = var_1.pers["score"];

    if ( level.teambased )
    {
        var_1 maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", var_1.score );
        var_1 maps\mp\gametypes\_persistence::_id_8D50( "score", var_4 );
    }

    if ( !level.teambased )
    {
        level thread _id_7C87();
        var_1 maps\mp\gametypes\_gamelogic::_id_1D16();
    }

    var_1 maps\mp\gametypes\_gamelogic::_id_1D1A();
}

onplayerscore( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( level.onplayerscore ) )
        var_3 = [[ level.onplayerscore ]]( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = maps\mp\gametypes\_rank::_id_40C1( var_0 );

    var_1.pers["score"] += var_3 * level.objectivepointsmod;
}

_id_063D( var_0, var_1 )
{
    if ( var_1 == var_0.pers["score"] )
        return;

    var_0.pers["score"] = var_1;
    var_0.score = int( min( var_0.pers["score"], 65535 ) );
    var_0 thread maps\mp\gametypes\_gamelogic::_id_1D1A();
}

_id_05B8( var_0 )
{
    return var_0.pers["score"];
}

_id_420C( var_0, var_1 )
{
    var_1 *= level.objectivepointsmod;
    _id_0640( var_0, _id_05BD( var_0 ) + var_1 );
    level notify( "update_team_score", var_0, _id_05BD( var_0 ) );
    thread _id_420D();
}

_id_420D()
{
    level endon( "update_team_score" );
    level endon( "game_ended" );
    waitframe;
    var_0 = _id_416F();

    if ( !level.splitscreen && var_0 != "none" && var_0 != level.waswinning && gettime() - level.laststatustime > 5000 && maps\mp\_utility::_id_40C2() != 1 )
    {
        level.laststatustime = gettime();
        maps\mp\_utility::_id_564B( "lead_taken", var_0, "status" );

        if ( level.waswinning != "none" )
            maps\mp\_utility::_id_564B( "lead_lost", level.waswinning, "status" );
    }

    if ( var_0 != "none" )
    {
        level.waswinning = var_0;
        var_1 = _id_05BD( var_0 );
        var_2 = maps\mp\_utility::_id_415E( "scorelimit" );

        if ( var_1 == 0 || var_2 == 0 )
            return;

        var_3 = var_1 / var_2 * 100;

        if ( var_3 > level._id_78A2 )
            setnojipscore( 1 );
    }
}

_id_416F()
{
    var_0 = level.teamnamelist;
    var_1 = var_0[0];
    var_2 = game["teamScores"][var_0[0]];
    var_3 = 1;

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        if ( game["teamScores"][var_0[var_4]] > var_2 )
        {
            var_1 = var_0[var_4];
            var_2 = game["teamScores"][var_0[var_4]];
            var_3 = 1;
            continue;
        }

        if ( game["teamScores"][var_0[var_4]] == var_2 )
        {
            var_3 += 1;
            var_1 = "none";
        }
    }

    return var_1;
}

_id_0640( var_0, var_1 )
{
    if ( var_1 == game["teamScores"][var_0] )
        return;

    game["teamScores"][var_0] = var_1;
    _id_9B84( var_0 );

    if ( maps\mp\_utility::_id_4E3F() && !isdefined( level._id_662E ) || isdefined( level._id_662E ) && !level._id_662E )
        thread maps\mp\gametypes\_gamelogic::_id_64E6();
    else
    {
        thread maps\mp\gametypes\_gamelogic::_id_1D1F( var_0 );
        thread maps\mp\gametypes\_gamelogic::_id_1D1A();
    }
}

_id_9B84( var_0 )
{
    var_1 = 0;

    if ( !maps\mp\_utility::_id_5194() || !maps\mp\_utility::_id_5160() )
        var_1 = _id_05BD( var_0 );
    else
        var_1 = game["roundsWon"][var_0];

    setteamscore( var_0, var_1 );
}

_id_05BD( var_0 )
{
    return game["teamScores"][var_0];
}

_id_7C88()
{
    level notify( "updating_scores" );
    level endon( "updating_scores" );
    wait 0.05;
    maps\mp\_utility::_id_A0F4();

    foreach ( var_1 in level.players )
        var_1 updatescores();
}

_id_7C87()
{
    level notify( "updating_dm_scores" );
    level endon( "updating_dm_scores" );
    wait 0.05;
    maps\mp\_utility::_id_A0F4();

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        level.players[var_0] updatedmscores();
        level.players[var_0].updateddmscores = 1;
    }
}

_id_739E()
{
    var_0 = 0;
    var_1 = level.placement["all"].size;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( level.placement["all"][var_3] == self )
            var_2 = 1;

        if ( var_2 )
            level.placement["all"][var_3] = level.placement["all"][var_3 + 1];
    }

    if ( !var_2 )
        return;

    level.placement["all"][var_1 - 1] = undefined;

    if ( level.multiteambased )
        _id_5FDE();

    if ( level.teambased )
    {
        _id_9B82();
        return;
    }

    var_1 = level.placement["all"].size;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = level.placement["all"][var_3];
        var_4 notify( "update_outcome" );
    }
}

_id_9B49()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2._id_214A ) )
            continue;

        if ( var_2.pers["team"] == "spectator" || var_2.pers["team"] == "none" )
            continue;

        var_0[var_0.size] = var_2;
    }

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_2 = var_0[var_4];
        var_5 = var_2.score;

        if ( !level.teambased )
            var_5 = var_2.extrascore0;

        for ( var_6 = var_4 - 1; var_6 >= 0 && _id_3F19( var_2, var_0[var_6] ) == var_2; var_6-- )
            var_0[var_6 + 1] = var_0[var_6];

        var_0[var_6 + 1] = var_2;
    }

    level.placement["all"] = var_0;

    if ( level.multiteambased )
        _id_5FDE();
    else if ( level.teambased )
        _id_9B82();
}

_id_3F19( var_0, var_1 )
{
    if ( var_0.score > var_1.score )
        return var_0;

    if ( var_1.score > var_0.score )
        return var_1;

    if ( var_0.deaths < var_1.deaths )
        return var_0;

    if ( var_1.deaths < var_0.deaths )
        return var_1;

    if ( common_scripts\utility::_id_2006() )
        return var_0;
    else
        return var_1;
}

_id_9B82()
{
    var_0["allies"] = [];
    var_0["axis"] = [];
    var_0["spectator"] = [];
    var_1 = level.placement["all"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_1[var_3];
        var_5 = var_4.pers["team"];
        var_0[var_5][var_0[var_5].size] = var_4;
    }

    level.placement["allies"] = var_0["allies"];
    level.placement["axis"] = var_0["axis"];
}

_id_5FDE()
{
    var_0["spectator"] = [];

    foreach ( var_2 in level.teamnamelist )
        var_0[var_2] = [];

    var_4 = level.placement["all"];
    var_5 = var_4.size;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = var_4[var_6];
        var_8 = var_7.pers["team"];
        var_0[var_8][var_0[var_8].size] = var_7;
    }

    foreach ( var_2 in level.teamnamelist )
        level.placement[var_2] = var_0[var_2];
}

_id_4DD5()
{
    wait 0.2;
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;
        var_2 = level.players;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = var_2[var_3];

            if ( !isdefined( var_4 ) )
                continue;

            if ( isdefined( var_4.updateddmscores ) )
                continue;

            var_4.updateddmscores = 1;
            var_4 updatedmscores();
            var_1 = 1;
            wait 0.5;
        }

        if ( !var_1 )
            wait 3;
    }
}
