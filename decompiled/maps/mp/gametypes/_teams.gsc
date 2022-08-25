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
    _id_4E15();
    level._id_91E9 = getdvarint( "scr_teambalance" );
    level._id_5A29 = getdvarint( "sv_maxclients" );
    _id_7FE7();
    level._id_3A2A = [];

    if ( level.teambased )
    {
        level thread _id_64C8();
        level thread _id_9B7F();
        wait 0.15;
        level thread _id_9B4D();
    }
    else
    {
        level thread _id_64B0();
        wait 0.15;
        level thread _id_9B1B();
    }
}

_id_4E15()
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    setdvar( "g_TeamName_Allies", _id_411C( "allies" ) );
    setdvar( "g_TeamIcon_Allies", _id_4118( "allies" ) );
    setdvar( "g_TeamIcon_MyAllies", _id_4118( "allies" ) );
    setdvar( "g_TeamIcon_EnemyAllies", _id_4118( "allies" ) );
    var_0 = _id_410B( "allies" );
    setdvar( "g_ScoresColor_Allies", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_TeamName_Axis", _id_411C( "axis" ) );
    setdvar( "g_TeamIcon_Axis", _id_4118( "axis" ) );
    setdvar( "g_TeamIcon_MyAxis", _id_4118( "axis" ) );
    setdvar( "g_TeamIcon_EnemyAxis", _id_4118( "axis" ) );
    var_0 = _id_410B( "axis" );
    setdvar( "g_ScoresColor_Axis", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_ScoresColor_Spectator", ".25 .25 .25" );
    setdvar( "g_ScoresColor_Free", ".76 .78 .10" );
    setdvar( "g_teamTitleColor_MyTeam", ".6 .8 .6" );
    setdvar( "g_teamTitleColor_EnemyTeam", "1 .45 .5" );
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64B4();
        var_0 thread _id_64B3();
        var_0 thread _id_64D6();
        var_0 thread _id_950B();
    }
}

_id_64B0()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_94BF();
    }
}

_id_64B4()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_9B86();
    }
}

_id_64B3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        self.pers["teamTime"] = undefined;
    }
}

updateinpartywithotherplayers()
{
    if ( !isai( self ) && maps\mp\_utility::_id_59E3() )
    {
        var_0 = _func_309( self.xuid );

        if ( !isdefined( self.inpartywithotherplayers ) || var_0 != self.inpartywithotherplayers )
        {

        }

        self.inpartywithotherplayers = var_0;
    }
}

_id_950B()
{
    self endon( "disconnect" );
    lootservicestarttrackingplaytime( self.xuid );
    updateinpartywithotherplayers();
    self._id_9372["allies"] = 0;
    self._id_9372["axis"] = 0;
    self._id_9372["other"] = 0;
    maps\mp\_utility::_id_3BE1( "prematch_done" );

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( self.sessionteam == "allies" )
            {
                self._id_9372["allies"]++;
                self._id_9372["total"]++;
            }
            else if ( self.sessionteam == "axis" )
            {
                self._id_9372["axis"]++;
                self._id_9372["total"]++;
            }
            else if ( self.sessionteam == "spectator" )
                self._id_9372["other"]++;
        }

        if ( !maps\mp\_utility::_id_5092( self.inpartywithotherplayers ) )
            updateinpartywithotherplayers();

        wait 1.0;
    }
}

_id_9B4D()
{
    if ( !level.rankedmatch )
        return;

    level endon( "game_ended" );

    for (;;)
    {
        maps\mp\gametypes\_hostmigration::_id_A0DD();

        foreach ( var_1 in level.players )
            var_1 _id_9B4A();

        wait 1.0;
    }
}

_id_9B4A()
{
    if ( isai( self ) )
        return;

    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( self._id_9372["allies"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedAllies", self._id_9372["allies"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["allies"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["allies"] );
    }

    if ( self._id_9372["axis"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedOpfor", self._id_9372["axis"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["axis"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["axis"] );
    }

    if ( self._id_9372["other"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedOther", self._id_9372["other"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["other"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["other"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self._id_9372["allies"] = 0;
    self._id_9372["axis"] = 0;
    self._id_9372["other"] = 0;
}

_id_9B86()
{
    if ( game["state"] != "playing" )
        return;

    self.pers["teamTime"] = gettime();
}

_id_9B80()
{
    for (;;)
    {
        var_0 = getdvarint( "scr_teambalance" );

        if ( level._id_91E9 != var_0 )
            level._id_91E9 = getdvarint( "scr_teambalance" );

        wait 1;
    }
}

_id_9B7F()
{
    level._id_91F4 = level._id_5A29 / 2;
    level thread _id_9B80();
    wait 0.15;

    if ( level._id_91E9 && maps\mp\_utility::_id_5194() )
    {
        if ( isdefined( game["BalanceTeamsNextRound"] ) )
            iprintlnbold( &"MP_AUTOBALANCE_NEXT_ROUND" );

        level waittill( "restarting" );

        if ( isdefined( game["BalanceTeamsNextRound"] ) )
        {
            level balanceteams();
            game["BalanceTeamsNextRound"] = undefined;
        }
        else if ( !_id_410A() )
            game["BalanceTeamsNextRound"] = 1;
    }
    else
    {
        level endon( "game_ended" );

        for (;;)
        {
            if ( level._id_91E9 )
            {
                if ( !_id_410A() )
                {
                    iprintlnbold( &"MP_AUTOBALANCE_SECONDS", 15 );
                    wait 15.0;

                    if ( !_id_410A() )
                        level balanceteams();
                }

                wait 59.0;
            }

            wait 1.0;
        }
    }
}

_id_410A()
{
    level.team["allies"] = 0;
    level.team["axis"] = 0;
    var_0 = level.players;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "allies" )
        {
            level.team["allies"]++;
            continue;
        }

        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "axis" )
            level.team["axis"]++;
    }

    if ( level.team["allies"] > level.team["axis"] + level._id_91E9 || level.team["axis"] > level.team["allies"] + level._id_91E9 )
        return 0;
    else
        return 1;
}

balanceteams()
{
    iprintlnbold( game["strings"]["autobalance"] );
    var_0 = [];
    var_1 = [];
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3].pers["teamTime"] ) )
            continue;

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
        {
            var_0[var_0.size] = var_2[var_3];
            continue;
        }

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
            var_1[var_1.size] = var_2[var_3];
    }

    var_4 = undefined;

    while ( var_0.size > var_1.size + 1 || var_1.size > var_0.size + 1 )
    {
        if ( var_0.size > var_1.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                if ( isdefined( var_0[var_5]._id_2D1A ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_0[var_5];
                    continue;
                }

                if ( var_0[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_0[var_5];
            }

            var_4 [[ level._id_64EF ]]( "axis" );
        }
        else if ( var_1.size > var_0.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            {
                if ( isdefined( var_1[var_5]._id_2D1A ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_1[var_5];
                    continue;
                }

                if ( var_1[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_1[var_5];
            }

            var_4 [[ level._id_64EF ]]( "allies" );
        }

        var_4 = undefined;
        var_0 = [];
        var_1 = [];
        var_2 = level.players;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
            {
                var_0[var_0.size] = var_2[var_3];
                continue;
            }

            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
                var_1[var_1.size] = var_2[var_3];
        }
    }
}

_id_7F7B( var_0 )
{

}

_id_802B( var_0, var_1 )
{

}

_id_7FE7()
{
    if ( level.multiteambased )
    {
        for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
            _id_802B( level.teamnamelist[var_0], game[level.teamnamelist[var_0]] );
    }
    else
    {
        _id_802B( "allies", game["allies"] );
        _id_802B( "axis", game["axis"] );
    }

    _id_7F7B( getmapcustom( "environment" ) );
}

_id_6C81( var_0, var_1, var_2 )
{
    if ( isagent( self ) && !getdvarint( "virtualLobbyActive", 0 ) )
        return 1;

    if ( isdefined( var_0 ) )
        var_0 = maps\mp\_utility::_id_3F11( var_0 ) + "_mp";

    self _meth_84B6( self._id_2236, var_0, var_1, var_2 );
    self._id_9F32 = "american";
    self setclothtype( "vestlight" );
    return 1;
}

_id_9C51( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = validatecostume( var_0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[var_2] )
            return 0;
    }

    return 1;
}

_id_3F4F()
{
    var_0 = randomcostume();
    return var_0;
}

_id_3FC1()
{
    var_0 = 2;

    if ( self.pers["team"] == "axis" )
        var_0 = 1;

    var_1 = getcostumefromtable( level._id_46C9, var_0 );
    return var_1;
}

verifycostume()
{
    if ( !_id_9C51( self._id_2236 ) )
    {
        if ( isdefined( self._id_7DAC ) && _id_9C51( self._id_7DAC ) )
            self._id_2236 = self._id_7DAC;
        else
        {
            self._id_2236 = _id_3F4F();

            if ( isplayer( self ) )
                maps\mp\gametypes\_class::_id_1B15( self._id_2236 );

            self._id_7DAC = self._id_2236;
        }
    }
}

applycostume( var_0, var_1, var_2 )
{
    verifycostume();
    var_3 = _id_6C81( var_0, var_1, var_2 );
    self notify( "player_model_set" );
}

_id_2242()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.teamnamelist.size; var_1++ )
        var_0[level.teamnamelist[var_1]] = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] == self )
            continue;

        if ( level.players[var_1].pers["team"] == "spectator" )
            continue;

        if ( isdefined( level.players[var_1].pers["team"] ) )
            var_0[level.players[var_1].pers["team"]]++;
    }

    return var_0;
}

_id_94BF()
{
    self endon( "disconnect" );
    lootservicestarttrackingplaytime( self.xuid );
    updateinpartywithotherplayers();
    self._id_9372["allies"] = 0;
    self._id_9372["axis"] = 0;
    self._id_9372["other"] = 0;

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( isdefined( self.pers["team"] ) && self.pers["team"] == "allies" && self.sessionteam != "spectator" )
            {
                self._id_9372["allies"]++;
                self._id_9372["total"]++;
            }
            else if ( isdefined( self.pers["team"] ) && self.pers["team"] == "axis" && self.sessionteam != "spectator" )
            {
                self._id_9372["axis"]++;
                self._id_9372["total"]++;
            }
            else
                self._id_9372["other"]++;
        }

        if ( !maps\mp\_utility::_id_5092( self.inpartywithotherplayers ) )
            updateinpartywithotherplayers();

        wait 1.0;
    }
}

_id_9B1B()
{
    if ( !level.rankedmatch )
        return;

    var_0 = 0;

    for (;;)
    {
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
            level.players[var_0] _id_9B1A();

        wait 1.0;
    }
}

_id_9B1A()
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( isai( self ) )
        return;

    if ( self._id_9372["allies"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedAllies", self._id_9372["allies"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["allies"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["allies"] );
    }

    if ( self._id_9372["axis"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedOpfor", self._id_9372["axis"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["axis"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["axis"] );
    }

    if ( self._id_9372["other"] )
    {
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedOther", self._id_9372["other"] );
        maps\mp\gametypes\_persistence::_id_8D51( "timePlayedTotal", self._id_9372["other"] );
        maps\mp\gametypes\_persistence::_id_8D54( "round", "timePlayed", self._id_9372["other"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self._id_9372["allies"] = 0;
    self._id_9372["axis"] = 0;
    self._id_9372["other"] = 0;
}

_id_3FDD( var_0 )
{
    if ( maps\mp\_utility::iscoop() )
        return 1;

    var_1 = 0;
    var_2 = 0;
    var_3 = level.players;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_0 )
        {
            var_1++;

            if ( isbot( var_5 ) )
                var_2++;
        }
    }

    if ( var_1 < level._id_91F4 )
        return 1;
    else if ( var_2 > 0 )
        return 1;
    else if ( level.gametype == "infect" )
        return 1;
    else if ( maps\mp\_utility::ishodgepodgemm() )
        return 1;
    else
        return 0;
}

_id_64D6()
{
    level endon( "game_ended" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_5FDC( var_0 )
{
    return tablelookupistring( "mp/MTTable.csv", 0, var_0, 1 );
}

_id_5FDB( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 2 );
}

_id_5FDA( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 3 );
}

getteamnamecol()
{
    return 1;
}

_id_411B( var_0 )
{
    return factiontableistringlookup( var_0, getteamnamecol() );
}

getteamshortnamecol()
{
    return 2;
}

_id_411C( var_0 )
{
    return factiontableistringlookup( var_0, getteamshortnamecol() );
}

getteamforfeitedstringcol()
{
    return 4;
}

_id_4115( var_0 )
{
    return factiontableistringlookup( var_0, getteamforfeitedstringcol() );
}

getteameliminatedstringcol()
{
    return 3;
}

_id_410F( var_0 )
{
    return factiontableistringlookup( var_0, getteameliminatedstringcol() );
}

getteamiconcol()
{
    return 5;
}

_id_4118( var_0 )
{
    return factiontablelookup( var_0, getteamiconcol() );
}

getteamhudiconcol()
{
    return 6;
}

_id_4117( var_0 )
{
    return factiontablelookup( var_0, getteamhudiconcol() );
}

getteamheadiconcol()
{
    return 17;
}

_id_4116( var_0 )
{
    return factiontablelookup( var_0, getteamheadiconcol() );
}

getteamvoiceprefixcol()
{
    return 7;
}

_id_4120( var_0 )
{
    return factiontablelookup( var_0, getteamvoiceprefixcol() );
}

getteamspawnmusiccol()
{
    return 8;
}

_id_411E( var_0 )
{
    return factiontablelookup( var_0, getteamspawnmusiccol() );
}

getteamwinmusiccol()
{
    return 9;
}

_id_4121( var_0 )
{
    return factiontablelookup( var_0, getteamwinmusiccol() );
}

getteamflagmodelcol()
{
    return 10;
}

_id_4114( var_0 )
{
    return factiontablelookup( var_0, getteamflagmodelcol() );
}

getteamflagcarrymodelcol()
{
    return 11;
}

_id_4110( var_0 )
{
    return factiontablelookup( var_0, getteamflagcarrymodelcol() );
}

getteamflagiconcol()
{
    return 12;
}

_id_4113( var_0 )
{
    return factiontablelookup( var_0, getteamflagiconcol() );
}

getteamflagfxcol()
{
    return 13;
}

_id_4112( var_0 )
{
    return factiontablelookup( var_0, getteamflagfxcol() );
}

getteamcolorredcol()
{
    return 14;
}

getteamcolorgreencol()
{
    return 15;
}

getteamcolorbluecol()
{
    return 16;
}

_id_410B( var_0 )
{
    return ( maps\mp\_utility::_id_8F5A( factiontablelookup( var_0, getteamcolorredcol() ) ), maps\mp\_utility::_id_8F5A( factiontablelookup( var_0, getteamcolorgreencol() ) ), maps\mp\_utility::_id_8F5A( factiontablelookup( var_0, getteamcolorbluecol() ) ) );
}

getteamcratemodelcol()
{
    return 18;
}

_id_410C( var_0 )
{
    return factiontablelookup( var_0, getteamcratemodelcol() );
}

getteamdeploymodelcol()
{
    return 19;
}

_id_410D( var_0 )
{
    return factiontablelookup( var_0, getteamdeploymodelcol() );
}

setfactiontableoverride( var_0, var_1, var_2 )
{
    if ( !isdefined( level.factiontableoverrides ) )
        level.factiontableoverrides = [];

    if ( !isdefined( level.factiontableoverrides[var_0] ) )
        level.factiontableoverrides[var_0] = [];

    level.factiontableoverrides[var_0][var_1] = var_2;
}

getfactiontableoverride( var_0, var_1 )
{
    var_2 = game[var_0];

    if ( isdefined( level.factiontableoverrides ) && isdefined( level.factiontableoverrides[var_2] ) )
        return level.factiontableoverrides[var_2][var_1];

    return undefined;
}

factiontablelookup( var_0, var_1 )
{
    var_2 = getfactiontableoverride( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return tablelookup( "mp/factionTable.csv", 0, game[var_0], var_1 );
}

factiontableistringlookup( var_0, var_1 )
{
    var_2 = getfactiontableoverride( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], var_1 );
}
