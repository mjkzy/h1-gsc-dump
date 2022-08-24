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
    level._id_67DA = [];
    maps\mp\gametypes\_class::init();
    maps\mp\gametypes\_misions::init();
    maps\mp\gametypes\_playercards::init();
    maps\mp\gametypes\_rank::init();

    if ( getdvarint( "virtualLobbyActive", 0 ) > 0 )
        return;

    level thread _id_9AFA();
    level thread _id_9BCA();
}

_id_4D95()
{
    self._id_1838 = [];

    if ( maps\mp\_utility::_id_7139() )
    {
        self._id_1838["totalShots"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "totalShots" );
        self._id_1838["accuracy"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "accuracy" );
        self._id_1838["misses"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "misses" );
        self._id_1838["hits"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "hits" );
        self._id_1838["timePlayedAllies"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "timePlayedAllies" );
        self._id_1838["timePlayedOpfor"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "timePlayedOpfor" );
        self._id_1838["timePlayedOther"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "timePlayedOther" );
        self._id_1838["timePlayedTotal"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "timePlayedTotal" );
    }

    self._id_1837 = [];
    self._id_1837["round"] = [];
    self._id_1837["round"]["timePlayed"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "timePlayed" );
}

_id_8D68( var_0 )
{
    return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0 );
}

_id_8D78( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
}

_id_8D50( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( isdefined( var_2 ) )
    {
        var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_2 );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_2, var_1 + var_3 );
    }
    else
    {
        var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0 );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 + var_3 );
    }
}

_id_8D6A( var_0, var_1 )
{
    if ( var_0 == "round" )
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), var_0, var_1 );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
}

_id_8D7A( var_0, var_1, var_2 )
{
    if ( isagent( self ) )
        return;

    if ( maps\mp\_utility::_id_4FA6() )
        return;

    if ( var_0 == "round" )
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), var_0, var_1, var_2 );
    else
    {
        if ( !maps\mp\_utility::_id_7139() )
            return;

        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1, var_2 );
    }
}

_id_8D53( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
    self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1, var_3 + var_2 );
}

_id_8D6B( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return 0;

    return self._id_1837[var_0][var_1];
}

_id_8D7B( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self._id_1837[var_0][var_1] = var_2;
}

_id_8D54( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = _id_8D6B( var_0, var_1 );
    _id_8D7B( var_0, var_1, var_3 + var_2 );
}

_id_8D52( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = _id_8D69( var_0 ) + var_1;

    if ( var_3 > var_2 )
        var_3 = var_2;

    if ( var_3 < _id_8D69( var_0 ) )
        var_3 = var_2;

    _id_8D79( var_0, var_3 );
}

_id_8D55( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_4 = _id_8D6B( var_0, var_1 ) + var_2;

    if ( var_4 > var_3 )
        var_4 = var_3;

    if ( var_4 < _id_8D6B( var_0, var_1 ) )
        var_4 = var_3;

    _id_8D7B( var_0, var_1, var_4 );
}

_id_8D69( var_0 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return 0;

    return self._id_1838[var_0];
}

_id_8D79( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self._id_1838[var_0] = var_1;
}

_id_8D51( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_2 = _id_8D69( var_0 );
    _id_8D79( var_0, var_2 + var_1 );
}

_id_9AFA()
{
    wait 0.15;
    var_0 = 0;

    while ( !level.gameended )
    {
        maps\mp\gametypes\_hostmigration::_id_A0DD();
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
        {
            level.players[var_0] _id_A360();
            level.players[var_0] _id_9BA4();
        }

        wait 2.0;
    }

    foreach ( var_2 in level.players )
    {
        var_2 _id_A360();
        var_2 _id_9BA4();
    }
}

_id_A360()
{
    var_0 = maps\mp\_utility::_id_7139();

    if ( var_0 )
    {
        foreach ( var_3, var_2 in self._id_1838 )
            self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_3, var_2 );
    }

    foreach ( var_3, var_2 in self._id_1837 )
    {
        foreach ( var_7, var_6 in var_2 )
        {
            if ( var_3 == "round" )
            {
                self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), var_3, var_7, var_6 );
                continue;
            }

            if ( var_0 )
                self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), var_3, var_7, var_6 );
        }
    }
}

_id_4C40( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) )
        return;

    if ( isdefined( level._id_2B2E ) && level._id_2B2E )
        return;

    if ( maps\mp\_utility::_id_7139() )
    {
        var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_0, var_1 );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_4C3D( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "attachmentsStats", var_0, var_1 );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "attachmentsStats", var_0, var_1, var_3 + var_2 );
    }
}

incrementmeleestat( var_0 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 1;

        var_1 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "meleeKills" );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "meleeKills", var_1 + var_0 );
    }
}

incrementdestructiblestat( var_0 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 1;

        var_1 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "destructibleKills" );
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "destructibleKills", var_1 + var_0 );
    }
}

doesattachkitincludebaseattachment( var_0, var_1 )
{
    var_2 = "mp/attachkits.csv";
    var_3 = 1;
    var_4 = 2;
    var_5 = 5;
    var_6 = tablelookuprownum( var_2, var_3, var_0 );

    if ( var_6 < 0 )
        return 0;

    for ( var_7 = var_4; var_7 <= var_5; var_7++ )
    {
        var_8 = tablelookupbyrow( var_2, var_6, var_7 );

        if ( var_8 == var_1 )
            return 1;

        if ( var_8 == "" )
            return 0;
    }

    return 0;
}

_id_9BA4()
{
    if ( !isdefined( self.trackingweaponname ) )
        return;

    if ( self.trackingweaponname == "" || self.trackingweaponname == "none" )
        return;

    var_0 = self.trackingweaponname;

    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) || maps\mp\_utility::_id_50FE( var_0 ) )
        return;

    var_1 = maps\mp\_utility::_id_416C( var_0 );

    if ( var_1[0] == "iw5" || var_1[0] == "h1" )
        var_1[0] = var_1[0] + "_" + var_1[1];

    if ( var_1[0] == "alt" )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == "glmwr" )
            {
                var_1[0] = "glmwr";
                break;
            }
            else if ( var_3 == "masterkeymwr" )
            {
                var_1[0] = "masterkeymwr";
                break;
            }
            else if ( getsubstr( var_3, 0, 2 ) == "a#" )
            {
                var_4 = getsubstr( var_3, 2 );

                if ( doesattachkitincludebaseattachment( var_4, "glmwr" ) )
                {
                    var_1[0] = "glmwr";
                    break;
                }
                else if ( doesattachkitincludebaseattachment( var_4, "masterkeymwr" ) )
                {
                    var_1[0] = "masterkeymwr";
                    break;
                }
            }
        }

        if ( var_1[0] == "alt" )
            var_1[0] = var_1[1] + "_" + var_1[2];
    }

    if ( var_1[0] == "glmwr" || var_1[0] == "masterkeymwr" )
    {
        if ( self._id_94FC > 0 )
            _id_4C3D( var_1[0], "shots", self._id_94FC );

        if ( self._id_94FA > 0 )
            _id_4C3D( var_1[0], "kills", self._id_94FA );

        if ( self._id_94F9 > 0 )
            _id_4C3D( var_1[0], "hits", self._id_94F9 );

        if ( self._id_94F7 > 0 )
            _id_4C3D( var_1[0], "headShots", self._id_94F7 );

        if ( self._id_94F6 > 0 )
            _id_4C3D( var_1[0], "deaths", self._id_94F6 );

        if ( self._id_94F8 > 0 )
            _id_4C3D( var_1[0], "hipfirekills", self._id_94F8 );

        if ( self._id_94FD > 0 )
            _id_4C3D( var_1[0], "timeInUse", self._id_94FD );

        self.trackingweaponname = "none";
        self._id_94FC = 0;
        self._id_94FA = 0;
        self._id_94F9 = 0;
        self._id_94F7 = 0;
        self._id_94F6 = 0;
        self._id_94F8 = 0;
        self._id_94FD = 0;
        return;
    }

    if ( !maps\mp\_utility::_id_50D1( var_1[0] ) && !maps\mp\_utility::_id_50D2( var_1[0] ) && !maps\mp\_utility::iscacmeleeweapon( var_1[0] ) )
        return;

    if ( self._id_94FC > 0 )
    {
        _id_4C40( var_1[0], "shots", self._id_94FC );
        maps\mp\_matchdata::_id_584C( var_1[0], "shots", self._id_94FC );
    }

    if ( self._id_94FA > 0 )
    {
        _id_4C40( var_1[0], "kills", self._id_94FA );
        maps\mp\_matchdata::_id_584C( var_1[0], "kills", self._id_94FA );
    }

    if ( self._id_94F9 > 0 )
    {
        _id_4C40( var_1[0], "hits", self._id_94F9 );
        maps\mp\_matchdata::_id_584C( var_1[0], "hits", self._id_94F9 );
    }

    if ( self._id_94F7 > 0 )
    {
        _id_4C40( var_1[0], "headShots", self._id_94F7 );
        maps\mp\_matchdata::_id_584C( var_1[0], "headShots", self._id_94F7 );
    }

    if ( self._id_94F6 > 0 )
    {
        _id_4C40( var_1[0], "deaths", self._id_94F6 );
        maps\mp\_matchdata::_id_584C( var_1[0], "deaths", self._id_94F6 );
    }

    if ( self._id_94F8 > 0 )
    {
        _id_4C40( var_1[0], "hipfirekills", self._id_94F8 );
        maps\mp\_matchdata::_id_584C( var_1[0], "hipfirekills", self._id_94F8 );
    }

    if ( self._id_94FD > 0 )
    {
        _id_4C40( var_1[0], "timeInUse", self._id_94FD );
        maps\mp\_matchdata::_id_584C( var_1[0], "timeInUse", self._id_94FD );
    }

    var_6 = getweaponattachments( var_0 );

    foreach ( var_8 in var_6 )
    {
        var_9 = maps\mp\_utility::_id_0E02( var_8 );

        if ( var_9 == "bloodmwr" )
            continue;

        if ( var_9 == "glmwr" || var_9 == "masterkeymwr" )
            continue;

        if ( var_9 == "glpremwr" || var_9 == "masterkeypremwr" )
            continue;

        if ( self._id_94FC > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "shots", self._id_94FC );
        }

        if ( self._id_94FA > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "kills", self._id_94FA );
        }

        if ( self._id_94F9 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "hits", self._id_94F9 );
        }

        if ( self._id_94F7 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "headShots", self._id_94F7 );
        }

        if ( self._id_94F8 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "hipfirekills", self._id_94F8 );
        }

        if ( self._id_94FD > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "timeInUse", self._id_94FD );
        }

        if ( self._id_94F6 > 0 )
            _id_4C3D( var_9, "deaths", self._id_94F6 );
    }

    self.trackingweaponname = "none";
    self._id_94FC = 0;
    self._id_94FA = 0;
    self._id_94F9 = 0;
    self._id_94F7 = 0;
    self._id_94F6 = 0;
    self._id_94F8 = 0;
    self._id_94FD = 0;
}

_id_9BCA()
{
    level waittill( "game_ended" );

    if ( !maps\mp\_utility::_id_59E3() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    foreach ( var_7 in level.players )
        var_5 += var_7.timeplayed["total"];

    incrementcounter( "global_minutes", int( var_5 / 60 ) );

    if ( !maps\mp\_utility::_id_A1CA() )
        return;

    wait 0.05;

    foreach ( var_7 in level.players )
    {
        var_0 += var_7.kills;
        var_1 += var_7.deaths;
        var_2 += var_7.assists;
        var_3 += var_7.headshots;
        var_4 += var_7.suicides;
    }

    incrementcounter( "global_kills", var_0 );
    incrementcounter( "global_deaths", var_1 );
    incrementcounter( "global_assists", var_2 );
    incrementcounter( "global_headshots", var_3 );
    incrementcounter( "global_suicides", var_4 );
    incrementcounter( "global_games", 1 );
}
