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
    level._id_A3AA = _id_4170();
    level.xpscalewithparty = getxpscalewithparty();
    level.scoreinfo = [];
    level.ranktable = [];
    level._id_5A50 = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.maxprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "maxPrestige", 1 ) );
    level.maxrankformaxprestige = int( tablelookup( "mp/rankTable.csv", 0, "maxrankformaxprestige", 1 ) );

    if ( !isdefined( level.xpgamemodescale ) )
        level.xpgamemodescale = 1;

    var_0 = 0;

    for ( var_1 = tablelookup( "mp/rankTable.csv", 0, var_0, 1 ); isdefined( var_1 ) && var_1 != ""; var_1 = tablelookup( "mp/rankTable.csv", 0, var_0, 1 ) )
    {
        level.ranktable[var_0][1] = tablelookup( "mp/rankTable.csv", 0, var_0, 1 );
        level.ranktable[var_0][2] = tablelookup( "mp/rankTable.csv", 0, var_0, 2 );
        level.ranktable[var_0][3] = tablelookup( "mp/rankTable.csv", 0, var_0, 3 );
        level.ranktable[var_0][7] = tablelookup( "mp/rankTable.csv", 0, var_0, 7 );
        var_0++;
    }

    level.maxxp = int( level.ranktable[level._id_5A50][7] );
    level.maxxponext = int( level.ranktable[level._id_5A50][3] );
    maps\mp\gametypes\_misions::_id_1878();
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) && var_0 maps\mp\_utility::_id_7139() )
        {
            var_1 = var_0 _id_409B();
            var_2 = var_0 maps\mp\gametypes\_persistence::_id_8D68( "experience" );

            if ( var_2 < 0 )
                var_2 = 0;

            var_3 = var_0 _meth_84fe() - var_2;
            var_4 = var_0 _meth_84fe();
        }
        else if ( isai( var_0 ) )
        {
            var_0 maps\mp\_utility::_id_7EA5();
            var_2 = var_0.pers["rankxp"];
            var_1 = var_0.pers["prestige"];
            var_3 = 0;
            var_4 = var_2;
        }
        else
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;
            var_4 = var_2;
        }

        var_0.pers["rankxp"] = var_2;
        var_0.pers["redeemedxp"] = var_3;
        var_0.pers["prestige"] = var_1;

        if ( !isdefined( var_0.pers["participation"] ) )
            var_0.pers["participation"] = 0;

        var_5 = _func_2ec( var_0 _id_4137(), var_1 );
        var_0.pers["rank"] = var_5;

        if ( isai( var_0 ) )
            var_0 maps\mp\_utility::set_rank_options_for_bot();

        var_0.xpupdatetotal = 0;
        var_0.bonusupdatetotal = 0;
        var_0._id_357F[0] = 0;
        var_0 setrank( var_5, var_1 );
        var_0 thread processprestigemasteryonspawn( var_1, var_2 );
        var_0 syncxpomnvars();

        if ( var_0.clientid < level.maxlogclients )
        {
            setmatchdata( "players", var_0.clientid, "Prestige", var_1 );
            setmatchdata( "players", var_0.clientid, "rankAtStart", maps\mp\_utility::_id_1E28( var_0.pers["rank"] ) );
        }

        if ( !isdefined( var_0.pers["postGameChallenges"] ) )
            var_0 setclientdvars( "ui_challenge_1_ref", "", "ui_challenge_2_ref", "", "ui_challenge_3_ref", "", "ui_challenge_4_ref", "", "ui_challenge_5_ref", "", "ui_challenge_6_ref", "", "ui_challenge_7_ref", "" );

        var_0 setclientdvar( "ui_promotion", 0 );

        if ( !isdefined( var_0.pers["summary"] ) )
        {
            var_0.pers["summary"] = [];
            var_0.pers["summary"]["xp"] = 0;
            var_0.pers["summary"]["score"] = 0;
            var_0.pers["summary"]["challenge"] = 0;
            var_0.pers["summary"]["match"] = 0;
            var_0.pers["summary"]["misc"] = 0;
            var_0.pers["summary"]["entitlementXP"] = 0;
            var_0.pers["summary"]["clanWarsXP"] = 0;
            var_0.pers["summary"]["matchStartXp"] = var_4;
        }

        if ( getdvar( "virtualLobbyActive" ) != "1" )
        {
            var_0 setclientdvar( "ui_opensummary", 0 );
            var_0 thread maps\mp\gametypes\_misions::_id_9AFE();
        }

        var_0 thread _id_64D6();
    }
}

processprestigemasteryonspawn( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = processprestigemastery( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        self waittill( "spawned_player" );
        maps\mp\_utility::_id_3BE1( "prematch_done" );
        thread maps\mp\gametypes\_hud_message::_id_8A68( var_2 );
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_4170()
{
    var_0 = getdvarint( "scr_xpscale" );

    if ( var_0 > 4 || var_0 < 0 )
        exitlevel( 0 );

    return var_0;
}

getxpscalewithparty()
{
    var_0 = getdvarint( "scr_xpscalewithparty" );

    if ( var_0 > 4 || var_0 < 0 )
        exitlevel( 0 );

    return var_0;
}

_id_518A( var_0 )
{
    if ( isdefined( level.scoreinfo[var_0] ) )
        return 1;
    else
        return 0;
}

_id_72FF( var_0, var_1, var_2, var_3 )
{
    level.scoreinfo[var_0]["value"] = var_1;
    level.scoreinfo[var_0]["allowPlayerScore"] = 0;
    level.scoreinfo[var_0]["playSplash"] = 0;

    if ( isdefined( var_2 ) && var_2 )
        level.scoreinfo[var_0]["allowPlayerScore"] = 1;

    if ( isdefined( var_3 ) && var_3 )
        level.scoreinfo[var_0]["playSplash"] = 1;
}

_id_0AAE( var_0 )
{
    return level.scoreinfo[var_0]["allowPlayerScore"];
}

_id_84A4( var_0 )
{
    return level.scoreinfo[var_0]["playSplash"];
}

_id_40C1( var_0 )
{
    var_1 = "scr_" + level.gametype + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );

    return level.scoreinfo[var_0]["value"];
}

_id_40AF( var_0 )
{
    if ( var_0 > level._id_5A50 )
    {
        var_1 = var_0 - level._id_5A50;
        return level.maxxp + ( var_1 - 1 ) * level.maxxponext;
    }
    else
        return int( level.ranktable[var_0][2] );
}

_id_40B0( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return level.maxxponext;
    else
        return int( level.ranktable[var_0][3] );
}

_id_40AE( var_0 )
{
    if ( var_0 > level._id_5A50 )
    {
        var_1 = var_0 - level._id_5A50;
        return level.maxxp + var_1 * level.maxxponext;
    }
    else
        return int( level.ranktable[var_0][7] );
}

_id_40AC( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return &"RANK_PARAGON_FULL";
    else
        return tablelookupistring( "mp/rankTable.csv", 0, var_0, 16 );
}

_id_40AD( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return var_0 + 1;
    else
        return int( tablelookup( "mp/rankTable.csv", 0, var_0, 13 ) );
}

_id_1208( var_0, var_1, var_2, var_3, var_4 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    if ( _id_84A4( var_0 ) )
        var_1 thread maps\mp\gametypes\_hud_message::medalsplashnotify( var_0 );

    var_1 _id_41FF( var_0, undefined, var_2, var_4, undefined, var_3 );

    if ( _id_0AAE( var_0 ) )
        var_1 maps\mp\gametypes\_gamescores::_id_41FC( var_0, var_1, var_3 );
}

_id_41FF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self.owner ) && !isbot( self ) )
    {
        self.owner _id_41FF( var_0, var_1, var_2, var_3, var_4, var_5 );
        return;
    }

    if ( isai( self ) )
        return;

    if ( !isplayer( self ) )
        return;

    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( level.teambased && ( !level._id_91ED["allies"] || !level._id_91ED["axis"] ) && var_0 != "win" )
        return;

    if ( !level.teambased && level._id_91ED["allies"] + level._id_91ED["axis"] < 2 && var_0 != "win" )
        return;

    if ( isdefined( level._id_2B23 ) && level._id_2B23 )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = _id_40C1( var_0 );

    if ( var_1 == 0 )
        return;

    if ( var_1 > 0 && !isdefined( self._id_5895 ) )
    {
        self._id_5895 = 1;
        lootservicevalidateplaytime( self.xuid );
    }

    var_6 = var_1;
    var_7 = 0;

    switch ( var_0 )
    {
        case "challenge":
        case "tie":
        case "win":
        case "loss":
            break;
        default:
            if ( level._id_A3AA > 1 )
                var_6 = int( var_6 * level._id_A3AA );

            if ( level.xpscalewithparty > 1 && maps\mp\_utility::_id_5092( self.inpartywithotherplayers ) )
                var_6 = int( var_6 * level.xpscalewithparty );

            if ( level.xpgamemodescale > 1 )
                var_6 = int( var_6 * level.xpgamemodescale );

            if ( self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "hasDoubleXPItem" ) )
                var_6 = int( var_6 * 2 );

            if ( isdefined( level._id_626D ) && level._id_626D )
            {
                if ( level.teambased && level._id_6274.team == self.team )
                    var_6 *= level._id_6274._id_A3A9;
                else if ( !level.teambased && level._id_6274.player == self )
                    var_6 *= level._id_6274._id_A3A9;

                var_6 = int( var_6 );
            }

            var_7 = self _meth_852e();
            break;
    }

    var_8 = int( var_6 * var_7 );
    var_9 = _id_40B1();
    _id_4C31( var_6 + var_8 );

    if ( maps\mp\_utility::_id_7139() && _id_9B52( var_9 ) )
        thread _id_9B53();

    _id_9089();
    syncxpomnvars();
    var_10 = maps\mp\gametypes\_misions::_id_5205( var_4 );

    if ( var_10 )
        var_2 = self getcurrentweapon();

    if ( var_0 == "shield_damage" )
    {
        var_2 = self getcurrentweapon();
        var_3 = "MOD_MELEE";
    }

    self.pers["summary"]["clanWarsXP"] += var_8;
    self.pers["summary"]["xp"] += ( var_6 + var_8 );

    switch ( var_0 )
    {
        case "tie":
        case "win":
        case "loss":
            self.pers["summary"]["match"] += var_6;
            break;
        case "challenge":
            self.pers["summary"]["challenge"] += var_6;
            break;
        default:
            if ( _id_518A( var_0 ) )
                self.pers["summary"]["score"] += var_6;
            else
                self.pers["summary"]["misc"] += var_6;

            break;
    }
}

_id_9B52( var_0 )
{
    var_1 = _id_40A9();

    if ( var_1 == self.pers["rank"] )
        return 0;

    var_2 = self.pers["rank"];
    self.pers["rank"] = var_1;
    self setrank( var_1 );
    return 1;
}

_id_9B53()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self.pers["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !maps\mp\_utility::_id_56D9( "game_over" ) )
        level common_scripts\utility::_id_A0A0( "game_over", 0.25 );

    var_1 = self.pers["rank"];
    var_2 = self.pers["prestige"];

    if ( ( var_1 + 1 ) % 50 == 0 )
    {
        var_3 = var_1 + 1;
        maps\mp\gametypes\_misions::_id_6FF6( "ch_" + var_3 + "_paragon" );
    }

    thread maps\mp\gametypes\_hud_message::_id_713B( "ranked_up", var_1, var_2 );

    if ( var_1 <= level._id_5A50 )
    {
        var_4 = level.ranktable[var_1][1];
        var_5 = int( var_4[var_4.size - 1] );

        if ( var_5 > 1 )
            return;
    }

    var_6 = _id_40AC( var_1 );

    for ( var_7 = 0; var_7 < level.players.size; var_7++ )
    {
        var_8 = level.players[var_7];
        var_9 = var_8.pers["team"];

        if ( isdefined( var_9 ) && var_8 != self )
        {
            if ( var_9 == var_0 )
            {
                if ( var_1 > level._id_5A50 )
                {
                    var_8 clientiprintln( &"RANK_PLAYER_WAS_PROMOTED_N", self, var_6, var_1 + 1 );
                    continue;
                }

                var_8 clientiprintln( &"RANK_PLAYER_WAS_PROMOTED", self, var_6 );
            }
        }
    }
}

_id_A3A6( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_1 == 0 )
        return;

    self notify( "xpPointsPopup" );
    self endon( "xpPointsPopup" );
    var_2 = tablelookuprownum( "mp/xp_event_table.csv", 0, var_0 );

    if ( getdvarint( "scr_lua_score" ) )
    {
        if ( var_2 >= 0 )
        {
            self _meth_8561( &"score_event", 2, var_2, var_1 );
            self _meth_8579( &"score_event", 2, var_2, var_1 );
        }

        return;
    }

    self.xpupdatetotal += var_1;
    self setclientomnvar( "ui_points_popup", self.xpupdatetotal );

    if ( !isdefined( var_2 ) || isdefined( var_2 ) && var_2 == -1 )
    {

    }
    else
        self setclientomnvar( "ui_points_popup_event", var_2 );

    wait 1;
    self.xpupdatetotal = 0;
}

_id_40A9()
{
    var_0 = _id_4137();
    var_1 = self.pers["rank"];
    var_2 = _id_409B();

    if ( var_0 < _id_40AF( var_1 ) + _id_40B0( var_1 ) )
        return var_1;
    else
        return _func_2ec( var_0, var_2 );
}

_id_409B()
{
    if ( isai( self ) && isdefined( self.pers["prestige_fake"] ) )
        return self.pers["prestige_fake"];
    else
        return maps\mp\gametypes\_persistence::_id_8D68( "prestige" );
}

_id_40B1()
{
    if ( isdefined( self.pers["rankxp"] ) )
        return self.pers["rankxp"];
    else
        return 0;
}

_id_40B3()
{
    if ( isdefined( self.pers["redeemedxp"] ) )
        return self.pers["redeemedxp"];
    else
        return 0;
}

_id_4137()
{
    return _id_40B1() + _id_40B3();
}

_id_4C31( var_0 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_1 = _id_40B1();
    var_2 = self.pers["prestige"];
    var_3 = level._id_5A50;

    if ( var_2 >= level.maxprestige )
        var_3 = level.maxrankformaxprestige;

    var_4 = _id_40AE( var_3 ) - _id_40B3();
    var_5 = int( min( var_1, var_4 ) ) + var_0;

    if ( var_5 > var_4 )
        var_5 = var_4;

    self.pers["rankxp"] = var_5;
    var_6 = processprestigemastery( var_2, var_5 );

    if ( isdefined( var_6 ) )
        thread maps\mp\gametypes\_hud_message::_id_8A68( var_6 );
}

processprestigemastery( var_0, var_1 )
{
    var_2 = _id_40AE( level._id_5A50 ) - _id_40B3();
    var_3 = _id_40AE( level.maxrankformaxprestige - 1 ) - _id_40B3();

    if ( var_0 == level.maxprestige && var_1 >= var_3 && !isdefined( self.pers["prestigeMaster2"] ) )
    {
        var_4 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_prestige_max" );
        var_5 = var_4 >= 3;
        self.pers["prestigeMaster2"] = self _meth_853e();

        if ( isdefined( self.pers["prestigeMaster2"] ) && !var_5 )
            return "prestigeMaster2";
    }

    if ( var_0 == level.maxprestige && var_1 >= var_2 && !isdefined( self.pers["prestigeMaster"] ) )
    {
        var_4 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_prestige_max" );
        var_5 = var_4 >= 2;
        self.pers["prestigeMaster"] = self _meth_853e();

        if ( isdefined( self.pers["prestigeMaster"] ) && !var_5 )
            return "prestigeMaster";
    }

    return undefined;
}

syncxpomnvars()
{
    var_0 = self.pers["rankxp"];
    var_1 = self.pers["rank"];
    var_2 = self.pers["prestige"];
    var_3 = _id_40AF( var_1 );
    var_4 = _id_40AE( var_1 );
    var_5 = 0;

    if ( var_4 - var_3 > 0 )
    {
        var_5 = ( var_0 - var_3 ) / ( var_4 - var_3 );
        var_5 = clamp( var_5, 0.0, 1.0 );
    }

    if ( var_2 == level.maxprestige && var_1 == level.maxrankformaxprestige )
        var_5 = 1.0;

    self setclientomnvar( "ui_player_xp_rank", var_1 );
    self setclientomnvar( "ui_player_xp_pct", var_5 );
    self setclientomnvar( "ui_player_xp_prestige", var_2 );
}

_id_9089()
{
    var_0 = _id_40B1();
    maps\mp\gametypes\_persistence::_id_8D78( "experience", var_0 );
}
