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

_id_4140( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7674[var_1]._id_2FCE;
            break;
        case "game":
            var_2 = level._id_3C02[var_1]._id_2FCE;
            break;
        case "team":
            var_2 = level._id_9205[var_1]._id_2FCE;
            break;
        case "player":
            var_2 = level._id_6D74[var_1]._id_2FCE;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_2FCE;
            break;
        case "weapon":
            var_2 = level._id_A2F2[var_1]._id_2FCE;
            break;
        case "hardpoint":
            var_2 = level._id_46CE[var_1]._id_2FCE;
            break;
        case "hud":
            var_2 = level._id_4AFF[var_1]._id_2FCE;
            break;
        default:
            var_2 = undefined;
            break;
    }

    var_3 = getdvarint( var_2 );
    return var_3;
}

_id_413F( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7674[var_1]._id_2FCE;
            break;
        case "game":
            var_2 = level._id_3C02[var_1]._id_2FCE;
            break;
        case "team":
            var_2 = level._id_9205[var_1]._id_2FCE;
            break;
        case "player":
            var_2 = level._id_6D74[var_1]._id_2FCE;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_2FCE;
            break;
        case "weapon":
            var_2 = level._id_A2F2[var_1]._id_2FCE;
            break;
        case "hardpoint":
            var_2 = level._id_46CE[var_1]._id_2FCE;
            break;
        case "hud":
            var_2 = level._id_4AFF[var_1]._id_2FCE;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_4142( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7674[var_1]._id_9C53;
            break;
        case "game":
            var_2 = level._id_3C02[var_1]._id_9C53;
            break;
        case "team":
            var_2 = level._id_9205[var_1]._id_9C53;
            break;
        case "player":
            var_2 = level._id_6D74[var_1]._id_9C53;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_9C53;
            break;
        case "weapon":
            var_2 = level._id_A2F2[var_1]._id_9C53;
            break;
        case "hardpoint":
            var_2 = level._id_46CE[var_1]._id_9C53;
            break;
        case "hud":
            var_2 = level._id_4AFF[var_1]._id_9C53;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_4141( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7674[var_1]._id_560C;
            break;
        case "game":
            var_2 = level._id_3C02[var_1]._id_560C;
            break;
        case "team":
            var_2 = level._id_9205[var_1]._id_560C;
            break;
        case "player":
            var_2 = level._id_6D74[var_1]._id_560C;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_560C;
            break;
        case "weapon":
            var_2 = level._id_A2F2[var_1]._id_560C;
            break;
        case "hardpoint":
            var_2 = level._id_46CE[var_1]._id_560C;
            break;
        case "hud":
            var_2 = level._id_4AFF[var_1]._id_560C;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_803A( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "rule":
            var_3 = level._id_7674[var_1]._id_2FCE;
            break;
        case "game":
            var_3 = level._id_3C02[var_1]._id_2FCE;
            break;
        case "team":
            var_3 = level._id_9205[var_1]._id_2FCE;
            break;
        case "player":
            var_3 = level._id_6D74[var_1]._id_2FCE;
            break;
        case "class":
            var_3 = level._id_1E40[var_1]._id_2FCE;
            break;
        case "weapon":
            var_3 = level._id_A2F2[var_1]._id_2FCE;
            break;
        case "hardpoint":
            var_3 = level._id_46CE[var_1]._id_2FCE;
            break;
        case "hud":
            var_3 = level._id_4AFF[var_1]._id_2FCE;
            break;
        default:
            var_3 = undefined;
            break;
    }

    setdvar( var_3, var_2 );
}

_id_8039( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "rule":
            level._id_7674[var_1]._id_560C = var_2;
            break;
        case "game":
            level._id_3C02[var_1]._id_560C = var_2;
            break;
        case "team":
            level._id_9205[var_1]._id_560C = var_2;
            break;
        case "player":
            level._id_6D74[var_1]._id_560C = var_2;
            break;
        case "class":
            level._id_1E40[var_1]._id_560C = var_2;
            break;
        case "weapon":
            level._id_A2F2[var_1]._id_560C = var_2;
            break;
        case "hardpoint":
            level._id_46CE[var_1]._id_560C = var_2;
            break;
        case "hud":
            level._id_4AFF[var_1]._id_560C = var_2;
            break;
        default:
            break;
    }
}

_id_72FA( var_0, var_1, var_2, var_3 )
{
    if ( isstring( var_3 ) )
        var_3 = getdvar( var_2, var_3 );
    else
        var_3 = getdvarint( var_2, var_3 );

    switch ( var_0 )
    {
        case "rule":
            if ( !isdefined( level._id_7674[var_1] ) )
                level._id_7674[var_1] = spawnstruct();

            level._id_7674[var_1]._id_9C53 = var_3;
            level._id_7674[var_1]._id_560C = var_3;
            level._id_7674[var_1]._id_2FCE = var_2;
            break;
        case "game":
            if ( !isdefined( level._id_3C02[var_1] ) )
                level._id_3C02[var_1] = spawnstruct();

            level._id_3C02[var_1]._id_9C53 = var_3;
            level._id_3C02[var_1]._id_560C = var_3;
            level._id_3C02[var_1]._id_2FCE = var_2;
            break;
        case "team":
            if ( !isdefined( level._id_9205[var_1] ) )
                level._id_9205[var_1] = spawnstruct();

            level._id_9205[var_1]._id_9C53 = var_3;
            level._id_9205[var_1]._id_560C = var_3;
            level._id_9205[var_1]._id_2FCE = var_2;
            break;
        case "player":
            if ( !isdefined( level._id_6D74[var_1] ) )
                level._id_6D74[var_1] = spawnstruct();

            level._id_6D74[var_1]._id_9C53 = var_3;
            level._id_6D74[var_1]._id_560C = var_3;
            level._id_6D74[var_1]._id_2FCE = var_2;
            break;
        case "class":
            if ( !isdefined( level._id_1E40[var_1] ) )
                level._id_1E40[var_1] = spawnstruct();

            level._id_1E40[var_1]._id_9C53 = var_3;
            level._id_1E40[var_1]._id_560C = var_3;
            level._id_1E40[var_1]._id_2FCE = var_2;
            break;
        case "weapon":
            if ( !isdefined( level._id_A2F2[var_1] ) )
                level._id_A2F2[var_1] = spawnstruct();

            level._id_A2F2[var_1]._id_9C53 = var_3;
            level._id_A2F2[var_1]._id_560C = var_3;
            level._id_A2F2[var_1]._id_2FCE = var_2;
            break;
        case "hardpoint":
            if ( !isdefined( level._id_46CE[var_1] ) )
                level._id_46CE[var_1] = spawnstruct();

            level._id_46CE[var_1]._id_9C53 = var_3;
            level._id_46CE[var_1]._id_560C = var_3;
            level._id_46CE[var_1]._id_2FCE = var_2;
            break;
        case "hud":
            if ( !isdefined( level._id_4AFF[var_1] ) )
                level._id_4AFF[var_1] = spawnstruct();

            level._id_4AFF[var_1]._id_9C53 = var_3;
            level._id_4AFF[var_1]._id_560C = var_3;
            level._id_4AFF[var_1]._id_2FCE = var_2;
            break;
    }
}

init()
{
    level._id_1F12 = [];
    level._id_99E0 = 1;
    level._id_7674 = [];
    level._id_3C02 = [];
    level._id_9205 = [];
    level._id_6D74 = [];
    level._id_1E40 = [];
    level._id_A2F2 = [];
    level._id_46CE = [];
    level._id_4AFF = [];

    if ( level.console )
    {
        _id_72FA( "game", "graceperiod", "scr_game_graceperiod", 15 );
        _id_72FA( "game", "graceperiod_ds", "scr_game_graceperiod_ds", 20 );
    }
    else
    {
        _id_72FA( "game", "playerwaittime", "scr_game_playerwaittime", 15 );
        _id_72FA( "game", "playerwaittime_ds", "scr_game_playerwaittime_ds", 20 );
    }

    _id_72FA( "game", "matchstarttime", "scr_game_matchstarttime", 15 );
    _id_72FA( "game", "roundstarttime", "scr_game_roundstarttime", 5 );
    _id_72FA( "game", "onlyheadshots", "scr_game_onlyheadshots", 0 );
    _id_72FA( "game", "allowkillcam", "scr_game_allowkillcam", 1 );
    _id_72FA( "game", "spectatetype", "scr_game_spectatetype", 2 );
    _id_72FA( "game", "lockspectatepov", "scr_game_lockspectatorpov", 0 );
    _id_72FA( "game", "deathpointloss", "scr_game_deathpointloss", 0 );
    _id_72FA( "game", "suicidepointloss", "scr_game_suicidepointloss", 0 );
    _id_72FA( "game", "suicidespawndelay", "scr_game_suicidespawndelay", 0 );
    _id_72FA( "team", "teamkillpointloss", "scr_team_teamkillpointloss", 0 );
    _id_72FA( "team", "fftype", "scr_team_fftype", 0 );
    _id_72FA( "team", "teamkillspawndelay", "scr_team_teamkillspawndelay", 20 );
    _id_72FA( "team", "teamkillkicklimit", "scr_team_teamkillkicklimit", 0 );
    _id_72FA( "player", "maxhealth", "scr_player_maxhealth", 100 );
    _id_72FA( "player", "healthregentime", "scr_player_healthregentime", 5 );
    _id_72FA( "player", "forcerespawn", "scr_player_forcerespawn", 1 );
    _id_72FA( "weapon", "allowfrag", "scr_weapon_allowfrags", 1 );
    _id_72FA( "weapon", "allowsmoke", "scr_weapon_allowsmoke", 1 );
    _id_72FA( "weapon", "allowflash", "scr_weapon_allowflash", 1 );
    _id_72FA( "weapon", "allowc4", "scr_weapon_allowc4", 1 );
    _id_72FA( "weapon", "allowclaymores", "scr_weapon_allowclaymores", 1 );
    _id_72FA( "weapon", "allowrpgs", "scr_weapon_allowrpgs", 1 );
    _id_72FA( "weapon", "allowmines", "scr_weapon_allowmines", 1 );
}
