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
    if ( !isdefined( game["gamestarted"] ) )
    {
        setmatchdatadef( "mp/matchdata.ddl" );
        setmatchdata( "map", level.script_context );

        if ( level.hardcoremode )
        {
            var_0 = level.gametype + " hc";
            setmatchdata( "gametype", var_0 );
        }
        else if ( level.oldschool )
        {
            var_0 = level.gametype + " os";
            setmatchdata( "gametype", var_0 );
        }
        else
            setmatchdata( "gametype", level.gametype );

        setmatchdata( "buildVersion", getbuildversion() );
        setmatchdata( "buildNumber", getbuildnumber() );
        setmatchdataid();
    }

    level.maxlives = 285;
    level.maxevents = 150;
    level.maxkillstreaks = 64;
    level.maxlogclients = 30;
    level._id_5A46 = 5;
    level.maxnumchallengesperplayer = 10;
    level.maxnumawardsperplayer = 10;
    level thread _id_3BDB();

    if ( getdvar( "virtualLobbyActive" ) != "1" )
        level thread _id_727B();
}

_id_59EC()
{
    if ( getdvar( "virtualLobbyActive" ) == "1" )
        return;

    if ( getdvar( "mapname" ) == getdvar( "virtualLobbyMap" ) )
        return;

    sysprint( "MatchStarted: Completed" );
    var_0 = getplaylistname();
    setmatchdata( "playlistName", var_0 );
    var_1 = getlocaltimestring();
    setmatchdata( "localTimeStringAtMatchStart", var_1 );

    if ( _id_4018() == 0 )
        setmatchdata( "startTimeUTC", getsystemtime() );

    setmatchdata( "iseSports", maps\mp\_utility::_id_5153() );

    if ( maps\mp\_utility::_id_6FD0() )
        setmatchdata( "privateMatch", 1 );

    if ( maps\mp\_utility::isdivisionmode() )
        setmatchdata( "divisionMode", 1 );

    thread _id_581F();
    thread _id_06D9();
}

_id_581F()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = maps\mp\_utility::getgametimepassedseconds();

        foreach ( var_2 in level.players )
        {
            if ( isbot( var_2 ) || istestclient( var_2 ) )
                continue;

            if ( maps\mp\_utility::_id_5189( var_2 ) && isdefined( var_2._id_56F7 ) && _id_1AD1( var_2._id_56F7 ) )
            {
                var_3 = 31;

                if ( isdefined( var_2._id_55D8 ) )
                    var_3 = var_2._id_55D8;

                recordbreadcrumbdataforplayer( var_2, var_2._id_56F7, var_0, var_3 );
                var_2._id_55D8 = undefined;
            }
        }

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        {
            wait 5;
            continue;
        }

        wait 2;
    }
}

_id_06D9()
{
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( isbot( var_1 ) || istestclient( var_1 ) )
                continue;

            if ( !isdefined( var_1.pers["pingAccumulation"] ) || !isdefined( var_1.pers["minPing"] ) || !isdefined( var_1.pers["maxPing"] ) || !isdefined( var_1.pers["pingSampleCount"] ) )
                continue;

            var_2 = var_1 _meth_8517();
            var_1.pers["pingAccumulation"] += var_2;
            var_1.pers["pingSampleCount"]++;

            if ( var_1.pers["pingSampleCount"] > 5 && var_2 > 0 )
            {
                if ( var_2 > var_1.pers["maxPing"] )
                    var_1.pers["maxPing"] = var_2;

                if ( var_2 < var_1.pers["minPing"] )
                    var_1.pers["minPing"] = var_2;
            }
        }

        wait 2;
    }
}

_id_4018()
{
    return getmatchdata( "startTimeUTC" );
}

_id_583B( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1AD0() )
        return;

    var_2 = getmatchdata( "killstreakCount" );
    setmatchdata( "killstreakCount", var_2 + 1 );
    setmatchdata( "killstreaks", var_2, "eventType", var_0 );
    setmatchdata( "killstreaks", var_2, "player", self.clientid );
    setmatchdata( "killstreaks", var_2, "eventStartTimeDeciSecondsFromMatchStart", maps\mp\_utility::_id_412D() );
    setmatchdata( "killstreaks", var_2, "eventPos", 0, int( var_1[0] ) );
    setmatchdata( "killstreaks", var_2, "eventPos", 1, int( var_1[1] ) );
    setmatchdata( "killstreaks", var_2, "eventPos", 2, int( var_1[2] ) );
    setmatchdata( "killstreaks", var_2, "index", var_2 );
    self._id_2517 = var_2;
    reconspatialevent( var_1, "script_mp_killstreak: eventType %s, player_name %s, player %d, gameTime %d", var_0, self.nearz, self.clientid, gettime() );
}

_id_5827( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1ACF() )
        return;

    var_2 = getmatchdata( "eventCount" );
    setmatchdata( "eventCount", var_2 + 1 );
    setmatchdata( "events", var_2, "eventType", var_0 );
    setmatchdata( "events", var_2, "player", self.clientid );
    setmatchdata( "events", var_2, "eventTimeDeciSecondsFromMatchStart", maps\mp\_utility::_id_412D() );
    setmatchdata( "events", var_2, "eventPos", 0, int( var_1[0] ) );
    setmatchdata( "events", var_2, "eventPos", 1, int( var_1[1] ) );
    setmatchdata( "events", var_2, "eventPos", 2, int( var_1[2] ) );
    reconspatialevent( var_1, "script_mp_event: event_type %s, player_name %s, player %d, gameTime %d", var_0, self.nearz, self.clientid, gettime() );
}

_id_5838( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "modifiers", var_1, 1 );
}

_id_583D( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "multikill", var_1 );
}

_id_5846( var_0 )
{
    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F7 ) )
        return;

    var_1 = gettime() - self.spectating_cycle;
    self._id_93FB += var_1;
    var_2 = maps\mp\_utility::_id_21A6( var_1 );
    setmatchdata( "lives", self._id_56F7, "player", self.clientid );
    setmatchdata( "lives", self._id_56F7, "spawnPos", 0, int( self.spectatekillcam[0] ) );
    setmatchdata( "lives", self._id_56F7, "spawnPos", 1, int( self.spectatekillcam[1] ) );
    setmatchdata( "lives", self._id_56F7, "spawnPos", 2, int( self.spectatekillcam[2] ) );
    setmatchdata( "lives", self._id_56F7, "team", self.team );

    if ( isdefined( self._id_8A12 ) )
        setmatchdata( "lives", self._id_56F7, "spawnTimeDeciSecondsFromMatchStart", self._id_8A12 );
    else
        setmatchdata( "lives", self._id_56F7, "spawnTimeDeciSecondsFromMatchStart", -1 );

    setmatchdata( "lives", self._id_56F7, "durationDeciSeconds", var_2 );
    var_3 = _id_583C();
    setmatchdata( "lives", self._id_56F7, "loadoutIndex", var_3 );
    var_4 = maps\mp\_utility::_id_1E29( self.pers["score"] - self._id_7898 );
    setmatchdata( "lives", self._id_56F7, "scoreEarnedDuringThisLife", var_4 );

    if ( isdefined( self.pers["summary"] ) && isdefined( self.pers["summary"]["xp"] ) )
    {
        if ( isdefined( self._id_A3A4 ) )
        {
            var_5 = maps\mp\_utility::_id_1E29( self.pers["summary"]["xp"] - self._id_A3A4 );
            setmatchdata( "lives", self._id_56F7, "xpEarnedDuringThisLife", var_5 );
        }
    }
}

_id_5849( var_0, var_1 )
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self.clientid, var_1, var_0 );
}

_id_5822( var_0 )
{
    if ( !isplayer( self ) || !_id_1ACE( self ) || isbot( self ) )
        return;

    var_1 = getmatchdata( "players", self.clientid, "challengeCount" );

    if ( var_1 < level._id_5A46 )
    {
        setmatchdata( "players", self.clientid, "challenges", var_1, var_0 );
        setmatchdata( "players", self.clientid, "challengeCount", var_1 + 1 );
    }
}

_id_583C()
{
    var_0 = 255;

    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F7 ) || self._id_24C3 == "gamemode" )
        return var_0;

    var_1 = self._id_24C3;
    var_2 = 0;

    for ( var_2 = 0; var_2 < level.maxnumawardsperplayer; var_2++ )
    {
        var_3 = getmatchdata( "players", self.clientid, "loadouts", var_2, "slotUsed" );

        if ( !var_3 )
            break;
        else
        {
            var_4 = getmatchdata( "players", self.clientid, "loadouts", var_2, "className" );

            if ( var_1 == var_4 )
                return var_2;
        }
    }

    if ( var_2 == level.maxnumawardsperplayer )
        return var_0;

    setmatchdata( "players", self.clientid, "loadouts", var_2, "slotUsed", 1 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "className", var_1 );
    var_5 = [];
    var_6 = "";
    var_7 = "";

    if ( var_1 == "copycat" )
    {
        var_8 = self.pers["copyCatLoadout"];
        var_9 = var_8["loadoutPrimary"];
        var_10 = var_8["loadoutPrimaryAttachKit"];
        var_11 = var_8["loadoutPrimaryFurnitureKit"];
        var_12 = var_8["loadoutPrimaryCamo"];
        var_13 = var_8["loadoutPrimaryReticle"];
        var_14 = var_8["loadoutSecondary"];
        var_15 = var_8["loadoutSecondaryAttachKit"];
        var_16 = var_8["loadoutSecondaryFurnitureKit"];
        var_17 = var_8["loadoutSecondaryCamo"];
        var_18 = var_8["loadoutSecondaryReticle"];
        var_6 = var_8["loadoutEquipment"];
        var_7 = var_8["loadoutOffhand"];

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = var_8["loadoutPerks"][var_19];

        var_20 = var_8["loadoutMelee"];
    }
    else if ( issubstr( var_1, "custom" ) )
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_9 = maps\mp\gametypes\_class::_id_1985( var_21, 0 );
        var_10 = maps\mp\gametypes\_class::cac_getweaponattachkit( var_21, 0 );
        var_11 = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_21, 0 );
        var_12 = maps\mp\gametypes\_class::_id_1989( var_21, 0 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = maps\mp\gametypes\_class::_id_1984( var_21, var_19 );

        var_14 = maps\mp\gametypes\_class::_id_1985( var_21, 1 );
        var_15 = maps\mp\gametypes\_class::cac_getweaponattachkit( var_21, 1 );
        var_16 = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_21, 1 );
        var_17 = maps\mp\gametypes\_class::_id_1989( var_21, 1 );
        var_6 = maps\mp\gametypes\_class::_id_197F( var_21, 0 );
        var_7 = maps\mp\gametypes\_class::_id_1983( var_21 );
        var_20 = maps\mp\gametypes\_class::cac_getmeleeweapon( var_21 );
    }
    else
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_9 = maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_21, 0 );
        var_10 = maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_21, 0 );
        var_11 = maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_21, 0 );
        var_12 = maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_21, 0 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = maps\mp\gametypes\_class::_id_90A2( level._id_1E3D, var_21, var_19 );

        var_14 = maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_21, 1 );
        var_15 = maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_21, 1 );
        var_16 = maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_21, 1 );
        var_17 = maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_21, 1 );
        var_6 = maps\mp\gametypes\_class::_id_909C( level._id_1E3D, var_21 );
        var_7 = maps\mp\gametypes\_class::_id_90A0( level._id_1E3D, var_21 );
        var_20 = "none";
    }

    setmatchdata( "players", self.clientid, "loadouts", var_2, "primaryWeapon", var_9 );

    for ( var_19 = 0; var_19 < 3; var_19++ )
        setmatchdata( "players", self.clientid, "loadouts", var_2, "perkSlots", var_19, var_5[var_19] );

    setmatchdata( "players", self.clientid, "loadouts", var_2, "secondaryWeapon", var_14 );
    var_22 = maps\mp\gametypes\_class::attachkitnametoid( var_10 );
    var_23 = maps\mp\gametypes\_class::attachkitnametoid( var_15 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "primaryAttachKit", var_22 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "secondaryAttachKit", var_23 );
    var_24 = maps\mp\gametypes\_class::furniturekitnametoid( var_11 );
    var_25 = maps\mp\gametypes\_class::furniturekitnametoid( var_16 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "primaryFurnitureKit", var_24 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "secondaryFurnitureKit", var_25 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "offhandWeapon", var_7 );
    setmatchdata( "players", self.clientid, "loadouts", var_2, "equipment", var_6 );
    thread _id_726D( self, var_9, var_10, var_11, var_12, var_14, var_15, var_16, var_17, var_6, var_7, var_5[0], var_5[1], var_5[2] );
    return var_2;
}

_id_726D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = isbot( var_0 ) || istestclient( var_0 );
    var_15 = "_matchdata.gsc";
    var_16 = var_0.spectating_cycle;
    var_17 = var_0._id_24C3;
    var_18 = var_0.nearz;
    reconevent( "script_mp_loadout_gear: script_file %s, gameTime %d, player_name %s, is_bot %b, class %s, primary_weapon %s, primary_attach_kit %s, primary_furniture_kit %s, primary_camo %s, secondary_weapon %s, secondary_attach_kit %s,  secondary_furniture_kit %s, secondary_camo %s, equipment %s, offhand %s", var_15, var_16, var_18, var_14, var_17, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    reconevent( "script_mp_loadout_perks: script_file %s, gameTime %d, player_name %s, perk_1 %s, perk_2 %s, perk_3 %s", var_15, var_16, var_18, var_11, var_12, var_13 );
}

_id_583E( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level.maxlives )
        return;

    if ( isplayer( var_1 ) )
    {
        if ( var_1 playerads() > 0.5 )
            setmatchdata( "lives", var_0, "killerWasADS", 1 );

        var_2 = var_1 geteye();

        if ( common_scripts\utility::_id_A347( var_2, var_1.angles, self.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
            setmatchdata( "lives", var_0, "victimWasInKillersFOV", 1 );

        var_3 = self geteye();

        if ( common_scripts\utility::_id_A347( var_3, self.angles, var_1.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
            setmatchdata( "lives", var_0, "killerWasInVictimsFOV", 1 );
    }

    if ( self playerads() > 0.5 )
        setmatchdata( "lives", var_0, "victimWasADS", 1 );
}

_id_29AD( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 == "none" )
    {
        var_2 = "none";
        var_3 = "none";
    }
    else
    {
        var_2 = weaponinventorytype( var_0 );
        var_3 = weaponclass( var_0 );
    }

    if ( issubstr( var_0, "destructible" ) )
        var_0 = "destructible";

    var_4 = [];
    var_4[0] = "None";
    var_4[1] = "None";
    var_4[2] = "None";
    var_5 = "none";
    var_6 = "none";
    var_7 = "";

    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) )
        var_7 = maps\mp\_utility::_id_8F5C( var_0, "_mp" );
    else if ( var_0 == "destructible" )
        var_7 = var_0;
    else if ( isdefined( var_2 ) && ( var_2 == "primary" || var_2 == "altmode" || var_2 == "melee" ) && ( var_3 == "pistol" || var_3 == "smg" || var_3 == "rifle" || var_3 == "spread" || var_3 == "mg" || var_3 == "grenade" || var_3 == "rocketlauncher" || var_3 == "sniper" || var_3 == "cone" || var_3 == "beam" || var_3 == "shield" ) )
    {
        if ( var_2 == "altmode" )
        {
            if ( isdefined( var_1 ) )
                var_0 = var_1;
        }

        var_8 = maps\mp\_utility::_id_416C( var_0 );
        var_7 = maps\mp\_utility::_id_3F11( var_0 );

        if ( var_8[0] == "iw5" || var_8[0] == "iw6" || var_8[0] == "h1" )
        {
            foreach ( var_10 in var_8 )
            {
                var_11 = strtok( var_10, "#" );

                if ( var_11.size > 1 )
                {
                    if ( var_11[0] == "a" )
                    {
                        var_5 = var_11[1];
                        continue;
                    }

                    if ( var_11[0] == "f" )
                        var_6 = var_11[1];
                }
            }

            if ( var_5 == "none" && var_6 == "none" )
            {
                var_13 = getweaponattachments( var_0 );
                var_14 = 0;

                foreach ( var_16 in var_13 )
                {
                    if ( !maps\mp\_utility::_id_50BD( var_16 ) )
                        continue;

                    var_17 = maps\mp\_utility::_id_0E02( var_16 );

                    if ( var_14 <= 2 )
                    {
                        var_4[var_14] = var_17;
                        var_14++;
                        continue;
                    }

                    break;
                }
            }
        }
        else if ( var_8[0] == "alt" )
        {
            var_19 = var_8[1] + "_" + var_8[2];
            var_7 = var_19;

            if ( isdefined( var_8[4] ) && maps\mp\_utility::_id_50BD( var_8[4] ) )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[4] );
                var_4[0] = var_17;
            }

            if ( isdefined( var_8[5] ) && maps\mp\_utility::_id_50BD( var_8[5] ) )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[5] );
                var_4[1] = var_17;
            }
        }
        else
        {
            var_8[var_8.size - 1] = undefined;

            if ( isdefined( var_8[1] ) && var_2 != "altmode" )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[1] );
                var_4[0] = var_17;
            }

            if ( isdefined( var_8[2] ) && var_2 != "altmode" )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[2] );
                var_4[1] = var_17;
            }
        }
    }
    else if ( var_2 == "item" || var_2 == "offhand" )
    {
        var_7 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );
        var_7 = maps\mp\_utility::_id_8F5C( var_7, "_mp" );
    }
    else
        var_7 = var_0;

    var_20 = spawnstruct();
    var_20._id_A2DF = var_7;
    var_20.attachments = var_4;
    var_20.attachkit = var_5;
    var_20.furniturekit = var_6;
    var_20._id_A2F3 = var_2;
    var_20._id_A2D5 = var_3;
    var_20._id_A2E0 = var_0;
    return var_20;
}

_id_5826( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( !isplayer( var_1 ) )
        return;

    if ( var_0 >= level.maxlives )
        return;

    if ( self._id_2515 > 0 )
        setmatchdata( "lives", var_0, "shots", maps\mp\_utility::_id_1E28( self._id_2515 ) );

    if ( isdefined( var_1._id_32AE ) && isdefined( var_1._id_32AE[self.guid] ) && var_1._id_32AE[self.guid] > 0 )
        setmatchdata( "lives", var_0, "hits", maps\mp\_utility::_id_1E28( var_1._id_32AE[self.guid] ) );

    if ( var_1._id_2515 > 0 )
        setmatchdata( "lives", var_0, "killerShots", maps\mp\_utility::_id_1E28( var_1._id_2515 ) );

    if ( isdefined( self._id_32AE ) && isdefined( self._id_32AE[var_1.guid] ) && self._id_32AE[var_1.guid] > 0 )
        setmatchdata( "lives", var_0, "killerHits", maps\mp\_utility::_id_1E28( self._id_32AE[var_1.guid] ) );
}

_id_5841( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( isplayer( self ) && _id_1ACE( self ) )
    {
        var_2 = getstanceandmotionstateforplayer( self );
        setmatchdata( "lives", var_0, "victimStanceAndMotionState", var_2 );
    }

    if ( isplayer( var_1 ) && _id_1ACE( var_1 ) )
    {
        var_2 = getstanceandmotionstateforplayer( var_1 );
        setmatchdata( "lives", var_0, "killerStanceAndMotionState", var_2 );
    }
}

_id_581E( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( isplayer( self ) && _id_1ACE( self ) )
    {
        if ( isdefined( self._id_0E2C ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_0E2C )
            {
                if ( isplayer( var_4._id_0E2D ) )
                {
                    if ( var_4._id_0E2D != var_1 )
                    {
                        setmatchdata( "lives", var_0, "assists", var_2, "assistingPlayerIndex", var_4._id_0E2D.clientid );
                        setmatchdata( "lives", var_0, "assists", var_2, "damage", maps\mp\_utility::_id_1E28( var_4.damage ) );
                        var_2++;

                        if ( var_2 == 5 )
                            break;
                    }
                }
            }

            if ( var_2 < 5 )
            {
                for ( var_6 = var_2; var_6 < 5; var_6++ )
                    setmatchdata( "lives", var_0, "assists", var_6, "assistingPlayerIndex", 255 );
            }
        }
    }
}

_id_584B( var_0, var_1 )
{
    if ( !isplayer( self ) || !_id_1ACE( self ) )
        return;

    if ( !isplayer( var_0 ) || !_id_1ACE( var_0 ) )
        return;

    var_2 = self._id_56F7;

    if ( !_id_1AD1( var_2 ) )
        return;

    if ( var_1 == "assist_uav" || var_1 == "assist_concussion" || var_1 == "assist_flash" )
    {
        for ( var_3 = 0; var_3 < 5; var_3++ )
        {
            var_4 = getmatchdata( "lives", var_2, "assists", var_3, "assistingPlayerIndex" );

            if ( var_4 == var_0.clientid || var_4 == 255 )
            {
                if ( var_4 == 255 )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistingPlayerIndex", var_0.clientid );

                if ( var_1 == "assist_uav" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistUAV", 1 );
                else if ( var_1 == "assist_concussion" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistConcussion", 1 );
                else if ( var_1 == "assist_flash" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistFlash", 1 );
                else
                {

                }

                break;
            }
        }
    }
}

_id_5845( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level.maxlives )
        return;

    if ( level.iszombiegame )
        return;

    if ( isdefined( level.ishorde ) && level.ishorde )
        return;

    _id_583E( var_0, var_1 );
    _id_5826( var_0, var_1 );
    _id_5841( var_0, var_1 );
    _id_581E( var_0, var_1 );
    var_8 = _id_29AD( var_4, var_5 );
    var_9 = maps\mp\gametypes\_class::attachkitnametoid( var_8.attachkit );
    setmatchdata( "lives", var_0, "killersWeaponAttachKit", var_9 );
    var_10 = maps\mp\gametypes\_class::furniturekitnametoid( var_8.furniturekit );
    setmatchdata( "lives", var_0, "killersWeaponFurnitureKit", var_10 );

    if ( var_8._id_A2F3 != "exclusive" )
        setmatchdata( "lives", var_0, "killersWeapon", var_8._id_A2DF );

    if ( var_8._id_A2E0 == "altmode" )
        setmatchdata( "lives", var_0, "killersWeaponAltMode", 1 );

    if ( maps\mp\_utility::iskillstreakweapon( var_8._id_A2E0 ) )
    {
        setmatchdata( "lives", var_0, "modifiers", "killstreak", 1 );

        if ( isdefined( var_1._id_2517 ) )
        {
            var_11 = getmatchdata( "killstreaks", var_1._id_2517, "killsTotal" );
            var_11++;
            setmatchdata( "killstreaks", var_1._id_2517, "killsTotal", maps\mp\_utility::_id_1E29( var_11 ) );
            setmatchdata( "lives", var_0, "killerKillstreakIndex", var_1._id_2517 );
        }
    }
    else
        setmatchdata( "lives", var_0, "killerKillstreakIndex", 255 );

    var_12 = _id_29AD( var_7, undefined );
    var_9 = maps\mp\gametypes\_class::attachkitnametoid( var_12.attachkit );
    setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeathAttachKit", var_9 );
    var_10 = maps\mp\gametypes\_class::furniturekitnametoid( var_12.furniturekit );
    setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeathFurnitureKit", var_10 );

    if ( var_12._id_A2F3 != "exclusive" )
    {
        if ( maps\mp\_utility::iskillstreakweapon( var_12._id_A2DF ) )
        {
            if ( isdefined( self.primaryweapon ) )
            {
                var_13 = maps\mp\_utility::_id_3F11( self.primaryweapon );
                setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeath", var_13 );
            }
        }
        else
            setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeath", var_12._id_A2DF );
    }

    if ( isdefined( self.tookweaponfrom ) && isdefined( self.tookweaponfrom[var_12._id_A2E0] ) )
        setmatchdata( "lives", var_0, "victimCurrentWeaponPickedUp", 1 );

    setmatchdata( "lives", var_0, "meansOfDeath", var_3 );
    var_14 = 2;

    if ( isplayer( var_1 ) )
    {
        setmatchdata( "lives", var_0, "killer", var_1.clientid );
        setmatchdata( "lives", var_0, "killerLifeIndex", var_1._id_56F7 );
        setmatchdata( "lives", var_0, "killerPos", 0, int( var_1.origin[0] ) );
        setmatchdata( "lives", var_0, "killerPos", 1, int( var_1.origin[1] ) );
        setmatchdata( "lives", var_0, "killerPos", 2, int( var_1.origin[2] ) );
        setmatchdata( "lives", var_0, "killerAngles", 0, int( var_1.angles[0] ) );
        setmatchdata( "lives", var_0, "killerAngles", 1, int( var_1.angles[1] ) );
        setmatchdata( "lives", var_0, "killerAngles", 2, int( var_1.angles[2] ) );
        var_15 = anglestoforward( ( 0, self.angles[1], 0 ) );
        var_16 = self.origin - var_1.origin;
        var_16 = vectornormalize( ( var_16[0], var_16[1], 0 ) );
        var_14 = vectordot( var_15, var_16 );
        setmatchdata( "lives", var_0, "dotOfDeath", var_14 );

        if ( isdefined( var_1.tookweaponfrom ) && isdefined( var_1.tookweaponfrom[var_8._id_A2E0] ) )
            setmatchdata( "lives", var_0, "killerCurrentWeaponPickedUp", 1 );
    }
    else
    {
        setmatchdata( "lives", var_0, "killer", 255 );
        setmatchdata( "lives", var_0, "killerLifeIndex", 65535 );
        setmatchdata( "lives", var_0, "killerPos", 0, int( self.origin[0] ) );
        setmatchdata( "lives", var_0, "killerPos", 1, int( self.origin[1] ) );
        setmatchdata( "lives", var_0, "killerPos", 2, int( self.origin[2] ) );
        setmatchdata( "lives", var_0, "killerAngles", 0, int( self.angles[0] ) );
        setmatchdata( "lives", var_0, "killerAngles", 1, int( self.angles[1] ) );
        setmatchdata( "lives", var_0, "killerAngles", 2, int( self.angles[2] ) );
    }

    setmatchdata( "lives", var_0, "kill_timestamp", getsystemtime() );
    setmatchdata( "lives", var_0, "player", self.clientid );
    setmatchdata( "lives", var_0, "victimPos", 0, int( self.origin[0] ) );
    setmatchdata( "lives", var_0, "victimPos", 1, int( self.origin[1] ) );
    setmatchdata( "lives", var_0, "victimPos", 2, int( self.origin[2] ) );
    setmatchdata( "lives", var_0, "victimAngles", 0, int( self.angles[0] ) );
    setmatchdata( "lives", var_0, "victimAngles", 1, int( self.angles[1] ) );
    setmatchdata( "lives", var_0, "victimAngles", 2, int( self.angles[2] ) );
    var_17 = "world";

    if ( isplayer( var_1 ) )
        var_17 = var_1.nearz;

    var_18 = 1;
    var_19 = 0;
    var_20 = maps\mp\_utility::_id_50B1( self );
    var_21 = 0;

    if ( isplayer( var_1 ) )
        var_21 = maps\mp\_utility::_id_50B1( var_1 );

    var_22 = length( self.origin - var_1.origin );
    var_23 = 0;
    var_24 = 0.0;
    var_25 = -1;
    var_26 = -1;
    var_27 = gettime();

    if ( isplayer( var_1 ) )
        var_24 = var_1 playerads();

    var_28 = var_1.clientid;

    if ( !isdefined( var_28 ) )
        var_28 = -1;

    var_29 = var_1._id_56F7;

    if ( !isdefined( var_29 ) )
        var_29 = -1;

    var_30 = 0.1;

    if ( self._id_2583.size > 1 )
        var_18 = 0;

    if ( isdefined( self._id_2583[var_1 getentitynumber()] ) )
        var_19 = self._id_2583[var_1 getentitynumber()]._id_628B;

    var_31 = self.pers["primaryWeapon"] + "_mp";
    var_32 = weaponclass( var_31 );

    if ( issubstr( var_8._id_A2DF, "loot" ) )
        var_23 = 1;

    if ( isdefined( self._id_89E4 ) && isdefined( self._id_89E4.spectating_cycle ) )
        var_25 = ( var_27 - self._id_89E4.spectating_cycle ) / 1000.0;

    if ( isdefined( var_1._id_89E4 ) && isdefined( var_1._id_89E4.spectating_cycle ) && isplayer( var_1 ) )
        var_26 = ( var_27 - var_1._id_89E4.spectating_cycle ) / 1000.0;

    reconspatialevent( self.origin, "script_mp_playerdeath: player_name %s, life_id %d, angles %v, death_dot %f, is_jugg %b, is_killstreak %b, mod %s, gameTime %d, spawnToDeathTime %f, attackerAliveTime %f, attacker_life_id %d", self.nearz, self._id_56F7, self.angles, var_14, var_1 maps\mp\_utility::_id_5131(), maps\mp\_utility::iskillstreakweapon( var_8._id_A2E0 ), var_3, var_27, var_25, var_26, var_29 );
    reconspatialevent( self.origin, "script_mp_weaponinfo: player_name %s, life_id %d, isbot %b, attacker_name %s, attacker %d, attacker_pos %v, distance %f, ads_fraction %f, is_jugg %b, is_killstreak %b, weapon_type %s, weapon_class %s, weapon_name %s, isLoot %b, attachKit %s, furnitureKit %s, numShots %d, soleAttacker %b, gameTime %d", self.nearz, self._id_56F7, var_20, var_17, var_28, var_1.origin, var_22, var_24, var_1 maps\mp\_utility::_id_5131(), maps\mp\_utility::iskillstreakweapon( var_8._id_A2E0 ), var_8._id_A2F3, var_8._id_A2D5, var_8._id_A2DF, var_23, var_8.attachkit, var_8.furniturekit, var_19, var_18, var_27 );
    reconspatialevent( self.origin, "script_mp_weaponinfo_ext: player_name %s, life_id %d, gametime %d, version %f, victimWeapon %s, victimWeaponClass %s, killerIsBot %b", self.nearz, self._id_56F7, var_27, var_30, var_31, var_32, var_21 );

    if ( !isdefined( level._id_59E0 ) )
        level._id_59E0 = [];

    if ( !isdefined( level._id_59E0["deathCount"] ) )
        level._id_59E0["deathCount"] = 1;
    else
        level._id_59E0["deathCount"]++;

    if ( var_25 <= 3.0 )
    {
        if ( !isdefined( level._id_59E0["badSpawnDiedTooFastCount"] ) )
            level._id_59E0["badSpawnDiedTooFastCount"] = 1;
        else
            level._id_59E0["badSpawnDiedTooFastCount"]++;

        if ( self._id_89E4._id_126D == 0 )
        {
            if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                level._id_59E0["badSpawnByAnyMeansCount"] = 1;
            else
                level._id_59E0["badSpawnByAnyMeansCount"]++;

            self._id_89E4._id_126D = 1;
        }
    }

    if ( isplayer( var_1 ) && var_26 <= 3.0 )
    {
        if ( !isdefined( level._id_59E0["badSpawnKilledTooFastCount"] ) )
            level._id_59E0["badSpawnKilledTooFastCount"] = 1;
        else
            level._id_59E0["badSpawnKilledTooFastCount"]++;

        if ( var_1._id_89E4._id_126D == 0 )
        {
            if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                level._id_59E0["badSpawnByAnyMeansCount"] = 1;
            else
                level._id_59E0["badSpawnByAnyMeansCount"]++;

            var_1._id_89E4._id_126D = 1;
        }
    }
}

_id_5844()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self.clientid, "score", maps\mp\_utility::_id_4081( "score" ) );

    if ( maps\mp\_utility::_id_4081( "assists" ) > 255 )
        setmatchdata( "players", self.clientid, "assists", 255 );
    else
        setmatchdata( "players", self.clientid, "assists", maps\mp\_utility::_id_4081( "assists" ) );

    if ( maps\mp\_utility::_id_4081( "longestStreak" ) > 255 )
        setmatchdata( "players", self.clientid, "longestStreak", 255 );
    else
        setmatchdata( "players", self.clientid, "longestStreak", maps\mp\_utility::_id_4081( "longestStreak" ) );

    if ( isdefined( self ) && isdefined( self.pers ) && isdefined( self.pers["validationInfractions"] ) )
    {
        if ( maps\mp\_utility::_id_4081( "validationInfractions" ) > 255 )
            setmatchdata( "players", self.clientid, "validationInfractions", 255 );
        else
            setmatchdata( "players", self.clientid, "validationInfractions", maps\mp\_utility::_id_4081( "validationInfractions" ) );
    }
}

combinelbstat( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    var_4 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "round", var_3 );
    var_5 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_2, var_1 );
    var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_2, var_1, var_5 + var_4 );
}

_id_31B7()
{
    foreach ( var_1 in level.players )
    {
        wait 0.05;

        if ( !isdefined( var_1 ) )
            continue;

        _id_5847( var_1 );

        if ( isdefined( var_1.detectedexploit ) && var_1.detectedexploit && var_1 maps\mp\_utility::_id_7139() )
            var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "restXPGoal", var_1.detectedexploit );

        var_2 = undefined;
        var_3 = 0;

        if ( isdefined( game["challengeStruct"] ) && isdefined( game["challengeStruct"]["challengesCompleted"] ) && isdefined( game["challengeStruct"]["challengesCompleted"][var_1.guid] ) )
            var_3 = 1;

        if ( var_3 )
        {
            var_2 = game["challengeStruct"]["challengesCompleted"][var_1.guid];

            if ( var_2.size > 0 )
            {
                var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", var_2.size );
                var_4 = maps\mp\_utility::_id_1E28( var_2.size );
                setmatchdata( "players", var_1.clientid, "challengesCompleted", var_4 );
            }
            else
                var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", 0 );
        }
        else
            var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", 0 );

        for ( var_5 = 0; var_5 < 20; var_5++ )
        {
            if ( isdefined( var_2 ) && isdefined( var_2[var_5] ) && var_2[var_5] != 8000 )
            {
                var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "challengesCompleted", var_5, var_2[var_5] );
                continue;
            }

            var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "challengesCompleted", var_5, 0 );
        }

        var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "gameMode", level.gametype );
        var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "round", "map", tolower( getdvar( "mapname" ) ) );

        if ( maps\mp\_utility::_id_59E3() )
        {
            var_6 = level.gametype;

            if ( getdvarint( "g_hardcore" ) )
                var_6 = level.gametype + "_HC";
            else if ( getdvarint( "g_oldschool" ) )
                var_6 = level.gametype + "_OS";

            combinelbstat( var_1, "score", var_6 );
            combinelbstat( var_1, "timePlayed", var_6 );
            combinelbstat( var_1, "kills", var_6 );
            combinelbstat( var_1, "deaths", var_6 );
            var_7 = var_1 getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_6, "gamesPlayed" );
            var_1 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_6, "gamesPlayed", var_7 + 1 );

            if ( level.gametype == "war" )
                combinelbstat( var_1, "assists", var_6 );
            else if ( level.gametype == "dm" )
                combinelbstat( var_1, "headshots", var_6 );
            else if ( level.gametype == "conf" )
            {
                combinelbstat( var_1, "confirms", var_6, "confirmed" );
                combinelbstat( var_1, "denies", var_6, "denied" );
            }
            else if ( level.gametype == "sd" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level.gametype == "dom" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level.gametype == "koth" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
                combinelbstat( var_1, "destructions", var_6 );
            }
            else if ( level.gametype == "sab" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level.gametype == "ctf" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "returns", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level.gametype == "gun" )
            {
                combinelbstat( var_1, "humiliations", var_6 );
                combinelbstat( var_1, "setbacks", var_6 );
            }
            else if ( level.gametype == "hp" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
                combinelbstat( var_1, "captureTime", var_6 );
            }
            else if ( level.gametype == "dd" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level.gametype == "mugger" )
            {
                combinelbstat( var_1, "muggings", var_6 );
                combinelbstat( var_1, "banked", var_6 );
            }
        }
    }
}

_id_5847( var_0 )
{
    if ( !isdefined( var_0.pers["maxPing"] ) || !isdefined( var_0.pers["minPing"] ) || !isdefined( var_0.pers["pingAccumulation"] ) || !isdefined( var_0.pers["pingSampleCount"] ) )
        return;

    if ( var_0.pers["pingSampleCount"] > 0 && var_0.pers["maxPing"] > 0 )
    {
        var_1 = maps\mp\_utility::_id_1E29( var_0.pers["pingAccumulation"] / var_0.pers["pingSampleCount"] );
        setmatchdata( "players", var_0.clientid, "averagePing", var_1 );
        setmatchdata( "players", var_0.clientid, "maxPing", maps\mp\_utility::_id_1E29( var_0.pers["maxPing"] ) );
        setmatchdata( "players", var_0.clientid, "minPing", maps\mp\_utility::_id_1E29( var_0.pers["minPing"] ) );
    }
}

_id_3BDB()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level.players )
    {
        var_1 _id_5844();

        if ( !isalive( var_1 ) )
            continue;

        var_1 _id_5846( 0 );
    }

    foreach ( var_1 in level.players )
    {
        if ( var_1._id_93FB > 0 )
        {
            var_4 = var_1 maps\mp\_utility::_id_4081( "score" ) / ( var_1._id_93FB / 60000 );
            tournamentreportplayerspm( var_1.zonly_physics, var_4, var_1.team );
        }

        var_1._id_93FB = 0;
    }
}

_id_1ACE( var_0 )
{
    if ( isagent( var_0 ) )
        return 0;

    var_1 = var_0.code_classname;

    if ( !isdefined( var_1 ) )
        var_1 = "undefined";

    return var_0.clientid < level.maxlogclients;
}

_id_1ACF()
{
    return getmatchdata( "eventCount" ) < level.maxevents;
}

_id_1AD0()
{
    return getmatchdata( "killstreakCount" ) < level.maxkillstreaks;
}

_id_1AD1( var_0 )
{
    return getmatchdata( "lifeCount" ) < level.maxlives;
}

_id_584C( var_0, var_1, var_2 )
{
    if ( !_id_1ACE( self ) )
        return;

    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) )
        return;

    if ( !isdefined( self.pers["mpWeaponStats"][var_0] ) )
        self.pers["mpWeaponStats"][var_0] = [];

    if ( !isdefined( self.pers["mpWeaponStats"][var_0][var_1] ) )
        self.pers["mpWeaponStats"][var_0][var_1] = 0;

    var_3 = self.pers["mpWeaponStats"][var_0][var_1];
    var_3 += var_2;
    self.pers["mpWeaponStats"][var_0][var_1] = var_3;
}

_id_1877()
{
    var_0 = [];
    var_1 = 149;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = tablelookup( "mp/statstable.csv", 0, var_2, 4 );

        if ( var_3 == "" )
            continue;

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ), "weapon_" ) )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ) == "weapon_other" )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_2, 51 ) != "" )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_5839()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self.clientid, "killsConfirmed", self.pers["confirmed"] );
}

_id_583A()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self.clientid, "killsDenied", self.pers["denied"] );
}

_id_5837()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "experience" );
        setmatchdata( "players", self.clientid, "startXp", var_0 );
        setmatchdata( "players", self.clientid, "startKills", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "kills" ) );
        setmatchdata( "players", self.clientid, "startDeaths", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "deaths" ) );
        setmatchdata( "players", self.clientid, "startWins", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "wins" ) );
        setmatchdata( "players", self.clientid, "startLosses", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "losses" ) );
        setmatchdata( "players", self.clientid, "startHits", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "hits" ) );
        setmatchdata( "players", self.clientid, "startMisses", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "misses" ) );
        setmatchdata( "players", self.clientid, "startGamesPlayed", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "gamesPlayed" ) );
        setmatchdata( "players", self.clientid, "startScore", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "score" ) );
        setmatchdata( "players", self.clientid, "startPrestige", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "prestige" ) );
        setmatchdata( "players", self.clientid, "startDP", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "division" ) );
        var_1 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "mmr" );
        setmatchdata( "players", self.clientid, "startMMR", var_1 );
    }
}

_id_5825()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "experience" );
        setmatchdata( "players", self.clientid, "endXp", var_0 );
        setmatchdata( "players", self.clientid, "endKills", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "kills" ) );
        setmatchdata( "players", self.clientid, "endDeaths", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "deaths" ) );
        setmatchdata( "players", self.clientid, "endWins", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "wins" ) );
        setmatchdata( "players", self.clientid, "endLosses", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "losses" ) );
        setmatchdata( "players", self.clientid, "endHits", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "hits" ) );
        setmatchdata( "players", self.clientid, "endMisses", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "misses" ) );
        setmatchdata( "players", self.clientid, "endGamesPlayed", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "gamesPlayed" ) );
        setmatchdata( "players", self.clientid, "endScore", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "score" ) );
        setmatchdata( "players", self.clientid, "endPrestige", self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "prestige" ) );
        var_1 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "mmr" );
        setmatchdata( "players", self.clientid, "endMMR", var_1 );

        if ( isdefined( self.pers["rank"] ) )
        {
            var_3 = maps\mp\_utility::_id_1E28( maps\mp\gametypes\_rank::_id_40A9() );
            setmatchdata( "players", self.clientid, "rankAtEnd", var_3 );
        }
    }
}

_id_727B()
{
    for (;;)
    {
        if ( getdvarint( "cl_freemove" ) == 0 )
        {
            foreach ( var_1 in level.players )
            {
                var_2 = 0;

                if ( maps\mp\_utility::_id_5189( var_1 ) )
                    var_2 = 1;

                if ( istestclient( var_1 ) )
                    continue;

                if ( !isdefined( var_1.origin ) )
                    continue;

                var_3 = "disconnected?";

                if ( isdefined( var_1.nearz ) )
                    var_3 = var_1.nearz;

                var_4 = -1;

                if ( isdefined( var_1.clientid ) )
                    var_4 = var_1.clientid;

                var_5 = ( -999, -999, -999 );

                if ( isdefined( var_1.angles ) )
                    var_5 = var_1.angles;

                var_6 = "undefined";

                if ( isdefined( var_1.team ) )
                    var_6 = var_1.team;

                var_7 = gettime();
                reconspatialevent( var_1.origin, "script_mp_playerpos: player_name %s, angles %v, gameTime %d, playerTeam %s, is_alive %b", var_3, var_5, var_7, var_6, var_2 );
            }
        }

        wait 0.2;
    }
}
