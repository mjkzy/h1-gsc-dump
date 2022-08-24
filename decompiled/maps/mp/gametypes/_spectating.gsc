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
    level.spectateoverride["allies"] = spawnstruct();
    level.spectateoverride["axis"] = spawnstruct();
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64B4();
        var_0 thread _id_64B3();
        var_0 thread _id_64EB();
    }
}

_id_64B4()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_8019();
    }
}

_id_64B3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        _id_8019();

        if ( !maps\mp\_utility::_id_4FA6() && ( self _meth_842d() || isdefined( self.pers["mlgSpectator"] ) && self.pers["mlgSpectator"] ) )
        {
            self _meth_84fd( 1 );

            if ( game["roundsPlayed"] > 0 )
                self setclientomnvar( "ui_use_mlg_hud", 1 );
        }
    }
}

updatemlgicons()
{
    self endon( "disconnect" );

    if ( self _meth_842d() )
    {
        for (;;)
        {
            level waittill( "player_spawned", var_0 );
            var_1 = var_0._id_8A4C;

            if ( isdefined( var_1 ) )
            {
                if ( isdefined( var_1.primary ) )
                    self _meth_852c( var_1.primary );

                if ( isdefined( var_1.secondary ) )
                    self _meth_852c( var_1.secondary );
            }
        }
    }
}

_id_64EB()
{
    self endon( "disconnect" );
    thread updatemlgicons();

    for (;;)
    {
        self waittill( "spectating_cycle" );
        var_0 = self getspectatingplayer();

        if ( isdefined( var_0 ) )
        {
            self setcarddisplayslot( var_0, 6 );

            if ( self _meth_842d() )
                _id_9B70( var_0 );
        }
    }
}

allowallyteamspectating()
{
    while ( !isdefined( level.spectateoverride ) )
        wait 0.05;

    level.spectateoverride["allies"].allowallyspectate = 1;
    level.spectateoverride["axis"].allowallyspectate = 1;
    _id_9B72();
}

_id_9B72()
{
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        level.players[var_0] _id_8019();
}

_id_8019()
{
    if ( level.gameended && gettime() - level.gameendtime >= 2000 )
    {
        if ( level.multiteambased )
        {
            for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                self allowspectateteam( level.teamnamelist[var_0], 0 );
        }
        else
        {
            self allowspectateteam( "allies", 0 );
            self allowspectateteam( "axis", 0 );
        }

        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 1 );
        return;
    }

    var_1 = maps\mp\gametypes\_tweakables::_id_4142( "game", "spectatetype" );
    var_2 = maps\mp\gametypes\_tweakables::_id_4142( "game", "lockspectatepov" );
    var_3 = self.sessionteam;

    if ( var_1 == 1 )
    {
        var_4 = self.lastgameteamchosen;

        if ( isdefined( var_4 ) )
            var_3 = var_4;
    }

    if ( self _meth_842d() && !maps\mp\_utility::_id_4FA6() )
        var_1 = 2;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_1 = 1;

    switch ( var_1 )
    {
        case 0:
            if ( level.multiteambased )
            {
                for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                    self allowspectateteam( level.teamnamelist[var_0], 0 );
            }
            else
            {
                self allowspectateteam( "allies", 0 );
                self allowspectateteam( "axis", 0 );
            }

            self allowspectateteam( "freelook", 0 );
            self allowspectateteam( "none", 0 );
            break;
        case 1:
            if ( !level.teambased )
            {
                self allowspectateteam( "allies", 1 );
                self allowspectateteam( "axis", 1 );
                self allowspectateteam( "none", 1 );
                self allowspectateteam( "freelook", 0 );
            }
            else if ( isdefined( var_3 ) && ( var_3 == "allies" || var_3 == "axis" ) && !level.multiteambased )
            {
                self allowspectateteam( var_3, 1 );
                self allowspectateteam( maps\mp\_utility::getotherteam( var_3 ), 0 );
                self allowspectateteam( "freelook", 0 );
                self allowspectateteam( "none", 0 );
            }
            else if ( isdefined( var_3 ) && issubstr( var_3, "team_" ) && level.multiteambased )
            {
                for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                {
                    if ( var_3 == level.teamnamelist[var_0] )
                    {
                        self allowspectateteam( level.teamnamelist[var_0], 1 );
                        continue;
                    }

                    self allowspectateteam( level.teamnamelist[var_0], 0 );
                }

                self allowspectateteam( "freelook", 0 );
                self allowspectateteam( "none", 0 );
            }
            else
            {
                if ( level.multiteambased )
                {
                    for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                        self allowspectateteam( level.teamnamelist[var_0], 0 );
                }
                else
                {
                    self allowspectateteam( "allies", 0 );
                    self allowspectateteam( "axis", 0 );
                }

                self allowspectateteam( "freelook", 0 );
                self allowspectateteam( "none", 0 );
            }

            break;
        case 2:
            if ( level.multiteambased )
            {
                for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                    self allowspectateteam( level.teamnamelist[var_0], 1 );
            }
            else
            {
                self allowspectateteam( "allies", 1 );
                self allowspectateteam( "axis", 1 );
            }

            self allowspectateteam( "freelook", 1 );
            self allowspectateteam( "none", 1 );
            break;
    }

    var_5 = self getxuid();

    if ( !self _meth_842d() )
    {
        switch ( var_2 )
        {
            case 0:
                self _meth_8270( var_5, "freelook" );
                break;
            case 1:
                if ( level.teambased )
                    self allowspectateteam( "none", 0 );

                self allowspectateteam( "freelook", 0 );
                self _meth_8270( var_5, "first_person" );
                break;
            case 2:
                if ( level.teambased )
                    self allowspectateteam( "none", 0 );

                self allowspectateteam( "freelook", 0 );
                self _meth_8270( var_5, "third_person" );
                break;
        }
    }

    if ( isdefined( var_3 ) && ( var_3 == "axis" || var_3 == "allies" ) )
    {
        if ( maps\mp\_utility::_id_5092( level.spectateoverride[var_3]._id_0AA9 ) )
            self allowspectateteam( "freelook", 1 );

        if ( maps\mp\_utility::_id_5092( level.spectateoverride[var_3].allowallyspectate ) )
            self allowspectateteam( var_3, 1 );

        if ( maps\mp\_utility::_id_5092( level.spectateoverride[var_3]._id_0AA7 ) )
            self allowspectateteam( maps\mp\_utility::getotherteam( var_3 ), 1 );
    }
}

_id_9B71( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_1 ) )
    {
        var_1 = maps\mp\_utility::strip_suffix( var_1, "_mp" );
        var_1 = tablelookuprownum( "mp/statsTable.csv", 4, var_1 );
    }

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self setclientomnvar( var_0 + "weapon", var_1 );

    if ( var_3 != "none" )
    {
        var_5 = maps\mp\gametypes\_class::attachkitnametoid( var_3 );
        self setclientomnvar( var_0 + "attachkit", var_5 );
    }
    else
    {
        self setclientomnvar( var_0 + "attachkit", 0 );

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            var_7 = undefined;

            if ( isdefined( var_2[var_6] ) )
            {
                var_7 = maps\mp\_utility::_id_0E02( var_2[var_6] );
                var_7 = tablelookuprownum( "mp/attachmentTable.csv", 3, var_7 );
            }

            if ( !isdefined( var_7 ) )
                var_7 = 0;

            self setclientomnvar( var_0 + "attachment_" + var_6, var_7 );
        }
    }

    if ( var_4 != "none" && var_4 != "base" )
    {
        var_8 = maps\mp\gametypes\_class::furniturekitnametoid( var_4 );
        self setclientomnvar( var_0 + "furniturekit", var_8 );
    }
    else
        self setclientomnvar( var_0 + "furniturekit", 0 );
}

_id_9B70( var_0 )
{
    var_1 = var_0._id_8A4C;
    _id_9B71( "ui_mlg_loadout_primary_", var_1.primary, [ var_1._id_6F82, var_1.primaryattachment2, var_1.primaryattachment3 ], var_1.primaryattachkit, var_1.primaryfurniturekit );
    _id_9B71( "ui_mlg_loadout_secondary_", var_1.secondary, [ var_1._id_7BF7, var_1.secondaryattachment2 ], var_1.secondaryattachkit, var_1.secondaryfurniturekit );
    var_2 = var_1.offhand;

    if ( isdefined( var_2 ) )
        var_2 = tablelookuprownum( "mp/perkTable.csv", 1, var_2 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self setclientomnvar( "ui_mlg_loadout_equipment_0", var_2 );
    var_3 = var_1.equipment;

    if ( isdefined( var_3 ) )
        var_3 = tablelookuprownum( "mp/perkTable.csv", 1, var_3 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self setclientomnvar( "ui_mlg_loadout_equipment_1", var_3 );
    self setclientomnvar( "ui_mlg_loadout_equipment_2", -1 );

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_5 = var_1.perks[var_4];

        if ( isdefined( var_5 ) )
            var_5 = tablelookuprownum( "mp/perkTable.csv", 1, var_5 );

        if ( !isdefined( var_5 ) )
            var_5 = 0;

        self setclientomnvar( "ui_mlg_loadout_perk_" + var_4, var_5 );
    }
}
