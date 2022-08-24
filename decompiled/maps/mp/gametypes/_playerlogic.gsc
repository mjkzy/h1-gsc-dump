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

_id_9383( var_0 )
{
    if ( !self._id_4745 )
        return 0;

    var_1 = gettime() + var_0 * 1000;
    var_2 = level.lastwave[self.pers["team"]];
    var_3 = level.wavedelay[self.pers["team"]] * 1000;
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = ceil( var_4 );
    var_6 = var_2 + var_5 * var_3;

    if ( isdefined( self._id_747A ) )
    {
        var_7 = ( gettime() - self._id_747A ) / 1000.0;

        if ( self._id_747A < var_2 )
            return 0;
    }

    if ( isdefined( self._id_A2AF ) )
        var_6 += 50 * self._id_A2AF;

    return ( var_6 - gettime() ) / 1000;
}

_id_91F2()
{
    var_0 = self.pers["teamkills"];

    if ( var_0 <= level._id_5A22 )
        return 0;

    var_1 = var_0 - level._id_5A22;
    return maps\mp\gametypes\_tweakables::_id_4142( "team", "teamkillspawndelay" ) * var_1;
}

getrespawndelay()
{
    var_0 = self [[ level._id_64E2 ]]();

    if ( isdefined( var_0 ) )
        return var_0;
    else
        return getdvarint( "scr_" + level.gametype + "_playerrespawndelay" );
}

_id_9382( var_0 )
{
    if ( level.ingraceperiod && !self._id_4745 || level.gameended )
        return 0;

    var_1 = 0;

    if ( self._id_4745 )
    {
        var_1 = getrespawndelay();

        if ( var_0 )
        {
            if ( isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
                var_1 += _id_91F2();

            if ( isdefined( self.pers["suicideSpawnDelay"] ) )
                var_1 += self.pers["suicideSpawnDelay"];
        }

        if ( isdefined( self._id_747A ) )
        {
            var_2 = ( gettime() - self._id_747A ) / 1000.0;
            var_1 -= var_2;

            if ( var_1 < 0 )
                var_1 = 0;
        }

        if ( isdefined( self._id_8015 ) )
            var_1 += level._id_9386;
    }

    var_3 = getdvarfloat( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( var_3 )
        return _id_9383( var_1 );

    return var_1;
}

_id_5A62( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level.gamemodemayspawn ) )
        return [[ level.gamemodemayspawn ]]( var_0 );

    if ( maps\mp\_utility::_id_3FAA() || isdefined( level.disablespawning ) )
    {
        if ( isdefined( level.disablespawning ) && level.disablespawning )
            return 0;

        if ( var_0 && isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
            return 0;

        if ( !self.pers["lives"] && maps\mp\_utility::_id_3BE2() )
            return 0;
        else if ( maps\mp\_utility::_id_3BE2() )
        {
            if ( !level.ingraceperiod && !self._id_4745 && ( isdefined( level._id_0AAB ) && !level._id_0AAB ) )
                return 0;
        }

        if ( isdefined( level.disablespawningforplayerfunc ) && [[ level.disablespawningforplayerfunc ]]( self ) )
            return 0;
    }

    return 1;
}

_id_8998()
{
    self endon( "becameSpectator" );

    if ( isdefined( self.clientid ) )
    {

    }
    else
    {

    }

    if ( isdefined( self._id_A04C ) && self._id_A04C )
        self waittill( "notWaitingToSelectClass" );

    if ( isdefined( self.addtoteam ) )
    {
        maps\mp\gametypes\_menus::addtoteam( self.addtoteam );
        maps\mp\gametypes\_class::cac_setlastteam( self.addtoteam );
        self.addtoteam = undefined;
    }

    if ( !_id_5A62( 0 ) )
    {
        wait 0.05;
        self notify( "attempted_spawn" );

        if ( maps\mp\_utility::_id_5194() && !maps\mp\_utility::_id_5141() )
        {
            if ( isdefined( self._id_90DF ) && self._id_90DF )
                maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["spawn_tag_wait"] );
            else
                maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["spawn_next_round"] );

            thread _id_73DE( 3.0 );
        }

        thread _id_8A0E();
        return;
    }

    if ( self._id_A04D )
        return;

    self._id_A04D = 1;
    _id_A008();

    if ( isdefined( self ) )
        self._id_A04D = 0;
}

_id_8F31()
{
    if ( isai( self ) || istestclient( self ) )
        return;

    if ( maps\mp\_utility::_id_0AA2() )
    {
        var_0 = [];
        var_1 = [];
        var_2 = [ "custom1", "custom2", "custom3", "custom4", "custom5", "class0", "class1", "class2", "class3", "class4" ];
        var_3 = self.team;

        if ( !isdefined( var_3 ) || var_3 != "allies" && var_3 != "axis" )
            var_3 = "allies";

        foreach ( var_5 in var_2 )
        {
            var_6 = maps\mp\gametypes\_class::_id_4009( self.team, var_5 );
            var_0[var_0.size] = var_6._id_6F84;
            var_7 = weaponclass( var_6._id_6F84 );

            if ( var_7 != "none" && !isdefined( var_1[var_7] ) )
            {
                var_8 = spawnstruct();
                var_8.team = var_3;
                var_8.weapon = var_6._id_6F84;
                var_1[var_7] = var_8;
            }
        }

        self _meth_8420( var_1, var_0 );
    }
    else if ( isdefined( level.streamprimariesfunc ) )
        self [[ level.streamprimariesfunc ]]();
}

_id_3C60( var_0, var_1 )
{
    var_2 = [];

    if ( !isdefined( self.class ) || self.class == "" )
        return var_2;

    if ( !isdefined( var_1 ) )
        var_1 = maps\mp\gametypes\_class::_id_4009( self.team, self.class, undefined, undefined, 1 );

    var_2[var_2.size] = var_1._id_6F84;

    if ( !isdefined( var_0 ) || !var_0 )
    {
        var_2[var_2.size] = var_1._id_7BFA;
        var_2[var_2.size] = var_1.meleeweaponname;
    }

    return var_2;
}

getstreaminfo( var_0 )
{
    var_1 = spawnstruct();
    var_1.team = common_scripts\utility::_id_9294( isdefined( self.addtoteam ), self.addtoteam, self.team );
    var_1.weapon = var_0._id_6F84;
    return var_1;
}

getloadoutforclass( var_0, var_1 )
{
    var_2 = var_0;

    if ( !maps\mp\_utility::_id_51E8( var_2 ) )
        var_2 = self.class;

    var_3 = maps\mp\gametypes\_class::_id_4009( self.team, var_2, undefined, undefined, var_1 );
    return var_3;
}

streamclass( var_0, var_1, var_2 )
{
    self._id_1E41 = 0;
    self notify( "endStreamClass" );
    self endon( "endStreamClass" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isai( self ) || !isdefined( var_0 ) )
        var_0 = 0;

    while ( isdefined( self.loadingplayerweapons ) && self.loadingplayerweapons )
        wait 0.05;

    var_3 = getloadoutforclass( var_2, 1 );
    var_4 = getstreaminfo( var_3 );
    var_5 = _id_3C60( 0, var_3 );
    var_0 = !self _meth_8420( var_4, var_5 ) && var_0;
    self _meth_852b( 1 );

    for ( self._id_1E41 = var_0; var_0; var_0 = !self _meth_8420( var_4, var_5 ) )
        waittillframeend;

    self _meth_852b( 0 );
    self._id_1E41 = 0;
    self notify( "streamClassComplete" );
}

_id_A008()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );
    level endon( "game_ended" );
    self notify( "attempted_spawn" );

    if ( isdefined( self.clientid ) )
    {

    }
    else
    {

    }

    var_0 = 0;
    var_1 = getentarray( "mp_global_intermission", "classname" );
    var_2 = var_1[randomint( var_1.size )];
    var_3 = self.pers["teamKillPunish"];

    if ( isdefined( var_3 ) && var_3 )
    {
        var_4 = _id_91F2();

        if ( var_4 > 0 )
        {
            maps\mp\_utility::_id_7FA5( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT", var_4, 1, 1 );
            thread _id_746D( var_2.origin, var_2.angles );
            var_0 = 1;
            wait(var_4);
            maps\mp\_utility::_id_1EF5( "friendly_fire" );
            self._id_747A = gettime();
        }

        self.pers["teamKillPunish"] = 0;
    }
    else if ( _id_91F2() )
        self.pers["teamkills"] = max( self.pers["teamkills"] - 1, 0 );

    var_5 = self.pers["suicideSpawnDelay"];

    if ( isdefined( var_5 ) && var_5 > 0 )
    {
        maps\mp\_utility::_id_7FA5( "suicidePenalty", &"MP_SUICIDE_PUNISHED", var_5, 1, 1 );

        if ( !var_0 )
            thread _id_746D( var_2.origin, var_2.angles );

        var_0 = 1;
        wait(var_5);
        maps\mp\_utility::_id_1EF5( "suicidePenalty" );
        self._id_747A = gettime();
        self.pers["suicideSpawnDelay"] = 0;
    }

    if ( maps\mp\_utility::_id_51E3() )
    {
        self._id_89E5 = 1;
        self._id_2664 = self.origin;
        self waittill( "stopped_using_remote" );
    }

    if ( !isdefined( self._id_A2AF ) && isdefined( level._id_A2AD[self.team] ) )
    {
        self._id_A2AF = level._id_A2AD[self.team];
        level._id_A2AD[self.team]++;
    }

    var_6 = _id_9382( 0 );

    if ( var_6 > 0 )
    {
        self setclientomnvar( "ui_killcam_time_until_spawn", gettime() + var_6 * 1000 );

        if ( !var_0 )
            thread _id_746D( var_2.origin, var_2.angles );

        var_0 = 1;
        maps\mp\_utility::_id_A03E( var_6, "force_spawn" );
        self notify( "stop_wait_safe_spawn_button" );
    }

    if ( _id_6081() )
    {
        maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

        if ( !var_0 )
            thread _id_746D( var_2.origin, var_2.angles );

        var_0 = 1;
        _id_A055();
    }

    self._id_A04D = 0;
    maps\mp\_utility::_id_1EF5( "spawn_info" );
    self._id_A2AF = undefined;
    thread _id_89FB();
}

_id_6081()
{
    if ( maps\mp\gametypes\_tweakables::_id_4142( "player", "forcerespawn" ) != 0 )
        return 0;

    if ( !self._id_4745 )
        return 0;

    var_0 = getdvarfloat( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( var_0 )
        return 0;

    if ( self._id_A152 )
        return 0;

    return 1;
}

_id_A055()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );

    for (;;)
    {
        if ( self usebuttonpressed() )
            break;

        wait 0.05;
    }
}

_id_73DE( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    waitframe;
    self endon( "end_respawn" );
    wait(var_0);
    maps\mp\_utility::_id_1EF5( "spawn_info" );
}

_id_55ED()
{
    self laststandrevive();

    if ( maps\mp\_utility::_hasperk( "specialty_finalstand" ) && !level._id_2A55 )
        maps\mp\_utility::_unsetperk( "specialty_finalstand" );

    if ( level._id_2A55 )
        self.headicon = "";

    self setstance( "crouch" );
    self._id_74FD = 1;
    self notify( "revive" );

    if ( isdefined( self._id_8B04 ) )
        self.maxhealth = self._id_8B04;

    self.health = self.maxhealth;
    common_scripts\utility::_id_0594();

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::_id_3A35();
}

_id_3F4E()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 hide();
    var_0.angles = self.angles;
    return var_0;
}

_id_852C()
{

}

_id_40D1( var_0 )
{
    if ( !positionwouldtelefrag( var_0.origin ) )
        return var_0.origin;

    if ( !isdefined( var_0._id_0B03 ) )
        return var_0.origin;

    foreach ( var_2 in var_0._id_0B03 )
    {
        if ( !positionwouldtelefrag( var_2 ) )
            return var_2;
    }

    return var_0.origin;
}

_id_89E6()
{
    self notify( "spawningClientThisFrameReset" );
    self endon( "spawningClientThisFrameReset" );
    wait 0.05;
    level._id_62AC--;
}

_id_803C( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );

    while ( self _meth_842d() && !maps\mp\_utility::_id_4FA6() )
        waittillframeend;

    self setclientomnvar( "ui_options_menu", var_0 );
}

gather_spawn_weapons()
{
    var_0 = [];

    if ( isdefined( self._id_57D6 ) )
    {
        var_0[var_0.size] = maps\mp\_utility::_id_3E67( self._id_57D6 );

        if ( isdefined( self._id_57D6._id_7BFA ) && self._id_57D6._id_7BFA != "none" )
            var_0[var_0.size] = self._id_57D6._id_7BFA;
    }
    else
    {
        if ( isdefined( self.primaryweapon ) && self.primaryweapon != "none" )
            var_0[var_0.size] = self.primaryweapon;

        if ( isdefined( self.secondaryweapon ) && self.secondaryweapon != "none" )
            var_0[var_0.size] = self.secondaryweapon;
    }

    return var_0;
}

_id_89FB( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "started_spawnPlayer" );

    if ( isdefined( self.clientid ) )
    {

    }
    else
    {

    }

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
    {
        if ( maps\mp\_utility::_id_4FA6() )
            var_1 = 0;
        else
            var_1 = 1;
    }

    if ( var_1 )
    {
        self.spawnplayergivingloadout = 1;
        thread monitordelayedspawnloadouts();
    }

    self._id_56F7 = maps\mp\_utility::_id_403F();
    self._id_93FB = 0;
    var_2 = undefined;
    self._id_9344 = 0;

    if ( self _meth_8443( "ui_options_menu" ) > 0 )
        thread _id_803C( 0 );

    self setclientomnvar( "ui_hud_shake", 0 );
    self _meth_84af( 0 );
    self _meth_8526();

    if ( !level.ingraceperiod && !self._id_4729 )
    {
        level._id_62AC++;

        if ( level._id_62AC > 1 )
        {
            self._id_A04E = 1;
            wait(0.05 * ( level._id_62AC - 1 ));
        }

        thread _id_89E6();
        self._id_A04E = 0;
    }

    if ( var_1 )
    {
        var_3 = undefined;

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            var_3 = 0;

        maps\mp\gametypes\_class::_id_41F1( self.team, self.class, undefined, var_3 );
        var_4 = gather_spawn_weapons();
        self.loadingplayerweapons = 1;

        if ( !isdefined( self._id_2236 ) )
        {
            if ( isplayer( self ) )
                self._id_2236 = maps\mp\gametypes\_class::_id_1B0C();
            else if ( isagent( self ) && self.agent_type == "player" )
                self._id_2236 = maps\mp\gametypes\_teams::_id_3F4F();
        }

        maps\mp\gametypes\_teams::applycostume( self._id_57D6._id_6F84, self.team );
        var_5 = maps\mp\gametypes\_class::cao_getcharactercamoindex();
        self _meth_857c( var_5 );

        if ( !self _meth_8420( var_4 ) )
        {
            self._id_A04E = 1;
            self _meth_852b( 1 );
            var_6 = gettime() + 3000;

            while ( gettime() < var_6 )
            {
                waittillframeend;
                var_4 = gather_spawn_weapons();

                if ( self _meth_8420( var_4 ) )
                    break;
            }

            self _meth_852b( 0 );

            if ( gettime() >= var_6 )
            {

            }
            else
            {

            }

            self._id_A04E = 0;
        }

        self.loadingplayerweapons = 0;
    }

    if ( isdefined( self._id_39CA ) )
    {
        var_7 = self._id_39CA;
        self._id_39CA = undefined;

        if ( isdefined( self._id_39C9 ) )
        {
            var_8 = self._id_39C9;
            self._id_39C9 = undefined;
        }
        else
            var_8 = ( 0, randomfloatrange( 0, 360 ), 0 );
    }
    else if ( isdefined( self._id_8015 ) && isdefined( self._id_8015._id_623E ) )
    {
        var_2 = self._id_8015;

        if ( !isdefined( self._id_8015._id_623E ) )
        {
            self._id_9344 = 1;
            self playlocalsound( "tactical_spawn" );

            if ( level.multiteambased )
            {
                foreach ( var_10 in level.teamnamelist )
                {
                    if ( var_10 != self.team )
                        self playsoundtoteam( "tactical_spawn", var_10 );
                }
            }
            else if ( level.teambased )
                self playsoundtoteam( "tactical_spawn", level._id_65B3[self.team] );
            else
                self playsound( "tactical_spawn" );
        }

        var_7 = self._id_8015._id_6D5D;
        var_8 = self._id_8015.angles;

        if ( isdefined( self._id_8015._id_32C7 ) )
            self._id_8015._id_32C7 delete();

        self._id_8015 delete();
        var_2 = undefined;
    }
    else if ( isdefined( self._id_4817 ) && ( !isdefined( self._id_3821 ) || isdefined( self._id_3821 ) && self._id_3821 ) && level._id_6F09 > 0 && self.team == "allies" )
    {
        while ( !isdefined( level._id_0A7E ) )
            wait 0.1;

        var_7 = level._id_0A7E.origin;
        var_8 = level._id_0A7E.angles;
        self._id_3821 = 0;
    }
    else if ( isdefined( self._id_4817 ) && ( !isdefined( self._id_3821 ) || isdefined( self._id_3821 ) && self._id_3821 ) && level._id_6F09 > 0 && self.team == "axis" )
    {
        while ( !isdefined( level._id_1217 ) )
            wait 0.1;

        var_7 = level._id_1217.origin;
        var_8 = level._id_1217.angles;
        self._id_3821 = 0;
    }
    else
    {
        var_2 = self [[ level.getspawnpoint ]]();
        var_7 = var_2.origin;
        var_8 = var_2.angles;
    }

    _id_8016();
    var_12 = self._id_4745;
    self._id_3693 = undefined;

    if ( !var_0 )
    {
        self._id_5380 = [];
        maps\mp\_utility::_id_9B69( "playing" );
        maps\mp\_utility::_id_1EF2();
        self._id_1AB3 = undefined;
        self.maxhealth = maps\mp\gametypes\_tweakables::_id_4142( "player", "maxhealth" );
        self.health = self.maxhealth;
        self.friendlydamage = undefined;
        self._id_4745 = 1;
        self.spawntime = gettime();
        self._id_8A12 = maps\mp\_utility::_id_412E();
        self.wasti = !isdefined( var_2 );
        self._id_0891 = 0;
        self.damagedplayers = [];
        self._id_53A5 = 1;
        self.objectivescaler = 1;
        self._id_1E24 = undefined;
        self._id_83C6 = 0;
        self._id_83C5 = 0;
        self._id_32AE = [];
        self._id_2515 = 0;

        if ( !isai( self ) )
            thread maps\mp\gametypes\_damage::_id_1EED();

        self._id_7898 = self.pers["score"];

        if ( isdefined( self.pers["summary"] ) && isdefined( self.pers["summary"]["xp"] ) )
            self._id_A3A4 = self.pers["summary"]["xp"];
    }

    self.movespeedscaler = level._id_1317;
    self.inlaststand = 0;
    self.laststand = undefined;
    self._id_4C5A = undefined;
    self.disabledweapon = 0;
    self.disabledweaponswitch = 0;
    self.disabledoffhandweapons = 0;
    common_scripts\utility::_id_7466();
    self._id_6C8A = [];

    if ( !var_0 )
    {
        self.avoidkillstreakonspawntimer = 5.0;
        var_13 = self.pers["lives"];

        if ( var_13 == maps\mp\_utility::_id_3FAA() )
            _id_084D();

        if ( var_13 )
            self.pers["lives"]--;

        _id_0844();

        if ( !var_12 || maps\mp\_utility::_id_3BE2() || maps\mp\_utility::_id_3BE2() && level.ingraceperiod && self._id_4729 )
            _id_73AB();

        if ( !self.wasaliveatmatchstart )
        {
            var_14 = 20;

            if ( maps\mp\_utility::_id_412B() > 0 && var_14 < maps\mp\_utility::_id_412B() * 60 / 4 )
                var_14 = maps\mp\_utility::_id_412B() * 60 / 4;

            if ( level.ingraceperiod || maps\mp\_utility::_id_412C() < var_14 * 1000 )
                self.wasaliveatmatchstart = 1;
        }
    }

    if ( level.console )
        self setclientdvar( "cg_fov", "65" );

    _id_7464();

    if ( isdefined( var_2 ) )
    {
        maps\mp\gametypes\_spawnlogic::_id_373D( var_2 );
        var_7 = _id_40D1( var_2 );
        var_8 = var_2.angles;
    }
    else
        self._id_55DF = gettime();

    self.spawnpos = var_7;
    self spawnspectator( var_7, var_8 );
    maps\mp\_utility::_id_7F54( level._id_2C7B );

    if ( self.team == "allies" )
    {
        self.lastgameteamchosen = "allies";
        self setclientomnvar( "ui_team_selected", maps\mp\gametypes\_menus::getuiteamindex( "allies" ) );
    }
    else if ( self.team == "axis" )
    {
        self.lastgameteamchosen = "axis";
        self setclientomnvar( "ui_team_selected", maps\mp\gametypes\_menus::getuiteamindex( "axis" ) );
    }

    if ( isdefined( self.pers["cur_kill_count"] ) )
    {
        self setclientomnvar( "ks_count1", self.pers["cur_kill_count"] );
        self.pers["cur_kill_count"] = undefined;
    }

    if ( var_0 && isdefined( self._id_3692 ) )
    {
        self setstance( self._id_3692 );
        self._id_3692 = undefined;
    }

    [[ level._id_64E9 ]]();

    if ( !var_0 )
    {
        maps\mp\gametypes\_misions::_id_6D5C();

        if ( isai( self ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["player_spawned"] ) )
            self [[ level.bot_funcs["player_spawned"] ]]();
    }

    maps\mp\gametypes\_class::setclass( self.class );

    if ( isdefined( level._id_2546 ) )
        self [[ level._id_2546 ]]( var_0 );
    else if ( var_1 )
    {
        maps\mp\gametypes\_class::applyloadout();
        self notify( "spawnplayer_giveloadout" );
    }

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::_id_8031( 1 );

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
    {
        maps\mp\_utility::_id_3A32( 1 );
        self disableammogeneration();
    }
    else
    {
        maps\mp\_utility::_id_3A32( 0 );
        self enableammogeneration();
    }

    self allowsprint( !getdvarint( "scr_game_disablesprint", 0 ) );

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) || !var_12 && game["state"] == "playing" )
    {
        var_15 = self.pers["team"];

        if ( maps\mp\_utility::_id_4E3F() )
            thread maps\mp\gametypes\_hud_message::_id_63DB( game["strings"]["overtime"], game["strings"]["overtime_hint"], undefined, ( 1.0, 0.0, 0.0 ), "mp_last_stand" );

        thread _id_852C();
    }

    if ( maps\mp\_utility::_id_3FDB( "scr_showperksonspawn", 1 ) == 1 && game["state"] != "postgame" )
    {

    }

    waitframe;
    self._id_89E5 = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );
    thread maps\mp\gametypes\_hardpoints::hardpointitemwaiter();

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::_id_3A35();

    if ( isdefined( level._id_59EA ) && level._id_59EA )
        self setclientomnvar( "ui_disable_team_change", 1 );
}

monitordelayedspawnloadouts()
{
    common_scripts\utility::_id_A069( "disconnected", "joined_spectators", "spawnplayer_giveloadout" );
    self.spawnplayergivingloadout = undefined;
}

_id_8A0E( var_0, var_1 )
{
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "joined_spectators" );
    _id_4C0D( var_0, var_1 );
}

_id_746D( var_0, var_1 )
{
    _id_4C0D( var_0, var_1 );
}

_id_4C0D( var_0, var_1 )
{
    _id_8016();
    var_2 = self.pers["team"];

    if ( isdefined( var_2 ) && var_2 == "spectator" && !level.gameended )
        maps\mp\_utility::_id_1EF5( "spawn_info" );

    maps\mp\_utility::_id_9B69( "spectator" );
    maps\mp\_utility::_id_1EF2();
    self.friendlydamage = undefined;
    self.loadingplayerweapons = undefined;
    _id_7465();
    maps\mp\gametypes\_spectating::_id_8019();
    _id_64EA( var_0, var_1 );

    if ( level.teambased && !level.splitscreen && !self issplitscreenplayerprimary() )
        self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

_id_408C( var_0 )
{
    if ( var_0 < 0 )
        return undefined;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] getentitynumber() == var_0 )
            return level.players[var_1];
    }

    return undefined;
}

_id_40A7()
{
    var_0 = "mp_global_intermission";
    var_1 = getentarray( var_0, "classname" );
    var_2 = maps\mp\gametypes\_spawnlogic::_id_40D8( var_1 );
    return var_2;
}

_id_64EA( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        self setspectatedefaults( var_0, var_1 );
        self spawnspectator( var_0, var_1 );
        return;
    }

    var_2 = _id_40A7();
    self setspectatedefaults( var_2.origin, var_2.angles );
    self spawnspectator( var_2.origin, var_2.angles );
}

_id_89E9()
{
    self endon( "disconnect" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8016();
    maps\mp\_utility::_id_1EF6();
    maps\mp\_utility::_id_3A32( 1 );
    self disableammogeneration();
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );
    var_0 = self.pers["postGameChallenges"];

    if ( level.rankedmatch && ( self.bonusupdatetotal || isdefined( var_0 ) && var_0 ) )
    {
        if ( self.bonusupdatetotal )
            self playlocalsound( "mp_level_up" );
        else if ( isdefined( var_0 ) )
            self playlocalsound( "mp_challenge_complete" );

        if ( self.bonusupdatetotal > level._id_6E89 )
            level._id_6E89 = 1;

        if ( isdefined( var_0 ) && var_0 > level._id_6E89 )
            level._id_6E89 = var_0;

        var_1 = 7.0;

        if ( isdefined( var_0 ) )
            var_1 = 4.0 + min( var_0, 3 );

        while ( var_1 )
        {
            wait 0.25;
            var_1 -= 0.25;
        }
    }

    maps\mp\_utility::_id_9B69( "intermission" );
    maps\mp\_utility::_id_1EF2();
    self.friendlydamage = undefined;
    var_2 = getentarray( "mp_global_intermission", "classname" );
    var_3 = var_2[0];
    self spawnspectator( var_3.origin, var_3.angles );
    self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

_id_89B6()
{
    if ( 1 )
    {
        maps\mp\_utility::_id_3A32( 1 );
        self disableammogeneration();
        _id_8A0E();
        maps\mp\_utility::_id_3A32( 1 );
        self disableammogeneration();
        return;
    }

    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8016();
    maps\mp\_utility::_id_1EF6();
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );
    maps\mp\_utility::_id_9B69( "dead" );
    maps\mp\_utility::_id_1EF2();
    self.friendlydamage = undefined;
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_1 = maps\mp\gametypes\_spawnlogic::_id_40D8( var_0 );
    self spawnspectator( var_1.origin, var_1.angles );
    var_1 setmodel( "tag_origin" );
    self playerlinkto( var_1 );
    self playerhide();
    maps\mp\_utility::_id_3A32( 1 );
    self disableammogeneration();
    self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

_id_8016()
{
    self stopshellshock();
    self stoprumble( "damage_heavy" );
    self._id_2664 = undefined;
}

_id_6226()
{
    waitframe;

    if ( isdefined( self ) )
        level notify( "connecting", self );
}

_id_5848()
{
    if ( isdefined( self.pers["totalKillcamsSkipped"] ) )
        setmatchdata( "players", self.clientid, "totalKillcamsSkipped", maps\mp\_utility::_id_1E28( self.pers["totalKillcamsSkipped"] ) );

    if ( isdefined( self.pers["weaponPickupsCount"] ) )
        setmatchdata( "players", self.clientid, "weaponPickupsCount", maps\mp\_utility::_id_1E28( self.pers["weaponPickupsCount"] ) );

    if ( isdefined( self.pers["suicides"] ) )
        setmatchdata( "players", self.clientid, "suicidesTotal", maps\mp\_utility::_id_1E28( self.pers["suicides"] ) );

    if ( isdefined( self.pers["headshots"] ) )
        setmatchdata( "players", self.clientid, "headshotsTotal", maps\mp\_utility::_id_1E29( self.pers["headshots"] ) );

    if ( isdefined( self.pers["pingAccumulation"] ) && isdefined( self.pers["pingSampleCount"] ) )
    {
        if ( self.pers["pingSampleCount"] > 0 )
        {
            var_0 = maps\mp\_utility::_id_1E28( self.pers["pingAccumulation"] / self.pers["pingSampleCount"] );
            setmatchdata( "players", self.clientid, "averagePing", var_0 );
        }
    }

    if ( maps\mp\_utility::_id_7139() )
    {
        var_1 = 3;
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_1; var_3++ )
        {
            var_4 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "xpMultiplier", var_3 );

            if ( isdefined( var_4 ) && var_4 > var_2 )
                var_2 = var_4;
        }

        if ( var_2 > 0 )
            setmatchdata( "players", self.clientid, "xpMultiplier", var_2 );
    }

    if ( isdefined( self.pers["summary"] ) && isdefined( self.pers["summary"]["clanWarsXP"] ) )
        setmatchdata( "players", self.clientid, "clanWarsXp", self.pers["summary"]["clanWarsXP"] );

    if ( isdefined( level.ishorde ) && level.ishorde )
        [[ level.hordeupdatetimestats ]]( self );
}

_id_19F3( var_0 )
{
    if ( !isdefined( self._id_2148 ) )
        return;

    maps\mp\gametypes\_damage::handlelaststanddisconnect();
    setmatchdata( "players", self.clientid, "disconnectTimeUTC", getsystemtime() );
    setmatchdata( "players", self.clientid, "disconnectReason", var_0 );

    if ( maps\mp\_utility::_id_7139() )
        maps\mp\_matchdata::_id_5825();

    if ( isdefined( self.pers["confirmed"] ) )
        maps\mp\_matchdata::_id_5839();

    if ( isdefined( self.pers["denied"] ) )
        maps\mp\_matchdata::_id_583A();

    _id_5848();

    if ( maps\mp\_utility::_id_5194() )
    {
        var_1 = game["roundsPlayed"] + 1;
        setmatchdata( "players", self.clientid, "playerQuitRoundNumber", var_1 );

        if ( isdefined( self.team ) && ( self.team == "allies" || self.team == "axis" ) )
        {
            if ( self.team == "allies" )
            {
                setmatchdata( "players", self.clientid, "playerQuitTeamScore", game["roundsWon"]["allies"] );
                setmatchdata( "players", self.clientid, "playerQuitOpposingTeamScore", game["roundsWon"]["axis"] );
            }
            else
            {
                setmatchdata( "players", self.clientid, "playerQuitTeamScore", game["roundsWon"]["axis"] );
                setmatchdata( "players", self.clientid, "playerQuitOpposingTeamScore", game["roundsWon"]["allies"] );
            }
        }
    }
    else if ( isdefined( self.team ) && ( self.team == "allies" || self.team == "axis" ) && level.teambased )
    {
        if ( self.team == "allies" )
        {
            setmatchdata( "players", self.clientid, "playerQuitTeamScore", game["teamScores"]["allies"] );
            setmatchdata( "players", self.clientid, "playerQuitOpposingTeamScore", game["teamScores"]["axis"] );
        }
        else
        {
            setmatchdata( "players", self.clientid, "playerQuitTeamScore", game["teamScores"]["axis"] );
            setmatchdata( "players", self.clientid, "playerQuitOpposingTeamScore", game["teamScores"]["allies"] );
        }
    }

    maps\mp\_skill::processplayer();
    _id_73D2();
    maps\mp\gametypes\_spawnlogic::_id_73AC();
    maps\mp\gametypes\_spawnlogic::removefromcharactersarray();
    var_2 = self getentitynumber();

    if ( !level.teambased )
        game["roundsWon"][self.guid] = undefined;

    if ( !level.gameended )
        maps\mp\_utility::_id_584D();

    if ( level.splitscreen )
    {
        var_3 = level.players;

        if ( var_3.size <= 1 )
            level thread maps\mp\gametypes\_gamelogic::_id_39BC();
    }

    maps\mp\gametypes\_gamelogic::setplayerrank( self );
    reconevent( "script_mp_playerquit: player_name %s, player %d, gameTime %d", self.name, self.clientid, gettime() );
    var_4 = self getentitynumber();
    var_5 = self.guid;
    logprint( "Q;" + var_5 + ";" + var_4 + ";" + self.name + "\\n" );
    thread maps\mp\_events::_id_2B36();

    if ( level.gameended )
        maps\mp\gametypes\_gamescores::_id_739E();

    if ( isdefined( self.team ) )
        _id_73AF();

    if ( self.sessionstate == "playing" && !( isdefined( self._id_3693 ) && self._id_3693 ) )
        _id_73A4( 1 );
    else if ( self.sessionstate == "spectator" || self.sessionstate == "dead" )
        level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_73D2()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level.players.size - 1; var_1++ )
                level.players[var_1] = level.players[var_1 + 1];

            level.players[var_1] = undefined;
            level notify( "playerCountChanged" );
            break;
        }
    }
}

_id_4D99()
{
    if ( level.splitscreen || self issplitscreenplayerprimary() )
        self setclientdvars( "cg_hudGrenadeIconHeight", "37.5", "cg_hudGrenadeIconWidth", "37.5", "cg_hudGrenadeIconOffset", "75", "cg_hudGrenadePointerHeight", "18", "cg_hudGrenadePointerWidth", "37.5", "cg_hudGrenadePointerPivot", "18 40.5", "cg_fovscale", "0.75" );
    else
        self setclientdvars( "cg_hudGrenadeIconHeight", "25", "cg_hudGrenadeIconWidth", "25", "cg_hudGrenadeIconOffset", "50", "cg_hudGrenadePointerHeight", "12", "cg_hudGrenadePointerWidth", "25", "cg_hudGrenadePointerPivot", "12 27", "cg_fovscale", "1" );
}

_id_4D98()
{
    setdvar( "cg_drawTalk", 1 );
    setdvar( "cg_drawCrosshair", 1 );
    setdvar( "cg_drawCrosshairNames", 1 );
    setdvar( "cg_hudGrenadeIconMaxRangeFrag", 250 );

    if ( level.hardcoremode )
    {
        setdvar( "cg_drawTalk", 3 );
        setdvar( "cg_drawCrosshair", 0 );
        setdvar( "cg_drawCrosshairNames", 1 );
        setdvar( "cg_hudGrenadeIconMaxRangeFrag", 0 );
    }

    if ( isdefined( level._id_0B0A ) && level._id_0B0A )
        setdvar( "cg_drawFriendlyNamesAlways", 1 );
    else
        setdvar( "cg_drawFriendlyNamesAlways", 0 );

    _id_4D99();

    if ( maps\mp\_utility::_id_3FAA() )
        self setclientdvars( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0 );
    else
        self setclientdvars( "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0 );

    if ( level.teambased )
        self setclientdvars( "cg_everyonehearseveryone", 0 );

    if ( getdvarint( "scr_hitloc_debug" ) )
    {
        for ( var_0 = 0; var_0 < 6; var_0++ )
            self setclientdvar( "ui_hitloc_" + var_0, "" );

        self._id_4924 = 1;
    }
}

_id_4012()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.clientid == var_1 )
            {
                var_0 = 1;
                break;
            }

            var_0 = 0;
        }

        if ( !var_0 )
            return var_1;
    }
}

_id_833B()
{
    self._id_7811 = [];

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        self._id_7811[var_0] = spawnstruct();
        self._id_7811[var_0].type = "";
        self._id_7811[var_0].item = undefined;
    }

    if ( !level.console )
    {
        for ( var_0 = 5; var_0 <= 8; var_0++ )
        {
            self._id_7811[var_0] = spawnstruct();
            self._id_7811[var_0].type = "";
            self._id_7811[var_0].item = undefined;
        }
    }
}

_id_5842()
{
    var_0 = getcodanywherecurrentplatform();
    var_1 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "consoleIDChunkLow", var_0 );
    var_2 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "consoleIDChunkHigh", var_0 );

    if ( isdefined( var_1 ) && var_1 != 0 )
        setmatchdata( "players", self.clientid, "consoleIDChunkLow", var_1 );

    if ( isdefined( var_2 ) && var_2 != 0 )
        setmatchdata( "players", self.clientid, "consoleIDChunkHigh", var_2 );

    var_3 = 3;
    var_4 = -1;

    if ( isdefined( var_2 ) && var_2 != 0 && isdefined( var_1 ) && var_1 != 0 )
    {
        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_6 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "device_id_high" );
            var_7 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "device_id_low" );

            if ( var_6 == var_2 && var_7 == var_1 )
            {
                var_4 = var_5;
                break;
            }
        }
    }

    if ( var_4 == -1 )
    {
        var_8 = 0;

        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_9 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "deviceUseFrequency" );

            if ( var_9 > var_8 )
            {
                var_8 = var_9;
                var_4 = var_5;
            }
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_10 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_4, "onWifi" );

    if ( var_10 )
        setmatchdata( "players", self.clientid, "playingOnWifi", 1 );
}

truncateplayername( var_0 )
{
    if ( level.xb3 && var_0.size > 18 )
    {
        var_1 = common_scripts\utility::_id_8F55( var_0, "]" );

        if ( var_1 >= 0 && common_scripts\utility::_id_8F57( var_0, "[" ) )
            var_0 = getsubstr( var_0, var_1 + 1 );
    }

    return var_0;
}

extractplayername( var_0 )
{
    var_1 = common_scripts\utility::_id_8F55( var_0, "]" );

    if ( var_1 >= 0 && common_scripts\utility::_id_8F57( var_0, "[" ) )
        var_0 = getsubstr( var_0, var_1 + 1 );

    return var_0;
}

extractclantag( var_0 )
{
    var_1 = common_scripts\utility::_id_8F55( var_0, "]" );
    var_2 = common_scripts\utility::_id_8F55( var_0, "[" );

    if ( var_1 >= 0 && var_2 >= 0 )
    {
        var_0 = getsubstr( var_0, var_2 + 1, var_1 );
        return var_0;
    }

    return "";
}

_id_19F0()
{
    var_0 = _id_40A7();
    self setspectatedefaults( var_0.origin, var_0.angles );
    thread _id_6226();
    self waittill( "begin" );
    self.connecttime = gettime();
    level notify( "connected", self );
    self._id_2148 = 1;

    if ( self ishost() )
        level.player = self;

    self._id_9C30 = self isusingonlinedataoffline();
    _id_4D98();
    _id_4E01();

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self.guid = self getguid();
    self.xuid = self getxuid();
    self._id_93FB = 0;
    var_1 = 0;

    if ( !isdefined( self.pers["clientid"] ) )
    {
        if ( game["clientid"] >= 30 )
            self.pers["clientid"] = _id_4012();
        else
            self.pers["clientid"] = game["clientid"];

        if ( game["clientid"] < 30 )
            game["clientid"]++;

        var_1 = 1;
    }

    if ( var_1 )
        _id_8F31();

    self.clientid = self.pers["clientid"];
    self.pers["teamKillPunish"] = 0;
    self.pers["suicideSpawnDelay"] = 0;

    if ( var_1 )
        reconevent( "script_mp_playerjoin: player_name %s, player %d, gameTime %d", self.name, self.clientid, gettime() );

    logprint( "J;" + self.guid + ";" + self getentitynumber() + ";" + self.name + "\\n" );

    if ( game["clientid"] <= 30 && game["clientid"] != getmatchdata( "playerCount" ) )
    {
        var_2 = 0;
        var_3 = 0;

        if ( !isai( self ) && maps\mp\_utility::_id_59E3() )
            self registerparty( self.clientid );

        setmatchdata( "playerCount", game["clientid"] );
        setmatchdata( "players", self.clientid, "playerID", "xuid", self getxuid() );
        setmatchdata( "players", self.clientid, "playerID", "ucdIDHigh", self getucdidhigh() );
        setmatchdata( "players", self.clientid, "playerID", "ucdIDLow", self ismlgspectator() );
        setmatchdata( "players", self.clientid, "playerID", "clanIDHigh", self getclanidhigh() );
        setmatchdata( "players", self.clientid, "playerID", "clanIDLow", self getclanidlow() );
        setmatchdata( "players", self.clientid, "gamertag", truncateplayername( self.name ) );
        setmatchdata( "players", self.clientid, "isBot", isai( self ) );
        var_4 = self getentitynumber();
        setmatchdata( "players", self.clientid, "codeClientNum", maps\mp\_utility::_id_1E28( var_4 ) );
        var_5 = getcodanywherecurrentplatform();
        var_3 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "connectionIDChunkLow", var_5 );
        var_2 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "connectionIDChunkHigh", var_5 );
        setmatchdata( "players", self.clientid, "connectionIDChunkLow", var_3 );
        setmatchdata( "players", self.clientid, "connectionIDChunkHigh", var_2 );
        setmatchclientip( self, self.clientid );
        setmatchdata( "players", self.clientid, "joinType", self _meth_84cb() );
        setmatchdata( "players", self.clientid, "connectTimeUTC", getsystemtime() );
        setmatchdata( "players", self.clientid, "isSplitscreen", issplitscreen() );
        _id_5842();

        if ( self ishost() )
            setmatchdata( "players", self.clientid, "wasAHost", 1 );

        if ( maps\mp\_utility::_id_7139() )
            maps\mp\_matchdata::_id_5837();

        if ( istestclient( self ) || isai( self ) )
            var_6 = 1;
        else
            var_6 = 0;

        if ( maps\mp\_utility::_id_59E3() && maps\mp\_utility::_id_0AB0() && !var_6 )
            setmatchdata( "players", self.clientid, "team", self.sessionteam );

        if ( maps\mp\_utility::_id_50B1( self ) )
        {
            if ( !isdefined( level._id_59E0 ) )
                level._id_59E0 = [];

            if ( !isdefined( level._id_59E0["botJoinCount"] ) )
                level._id_59E0["botJoinCount"] = 1;
            else
                level._id_59E0["botJoinCount"]++;
        }
    }

    if ( !level.teambased )
        game["roundsWon"][self.guid] = 0;

    self._id_5659 = [];
    self._id_5654 = [];
    self._id_564F = "";
    self._id_5652 = [];
    self._id_5651 = "";

    if ( !isdefined( self.pers["cur_kill_streak"] ) )
    {
        self.pers["cur_kill_streak"] = 0;
        self.killstreakcount = 0;
        self setclientomnvar( "ks_count1", 0 );
    }

    if ( !isdefined( self.pers["cur_death_streak"] ) )
        self.pers["cur_death_streak"] = 0;

    if ( !isdefined( self.pers["cur_kill_streak_for_nuke"] ) )
        self.pers["cur_kill_streak_for_nuke"] = 0;

    if ( maps\mp\_utility::_id_7139() )
        self.kill_streak = maps\mp\gametypes\_persistence::_id_8D68( "killStreak" );

    self.lastgrenadesuicidetime = -1;
    self.teamkillsthisround = 0;
    self._id_4745 = 0;
    self._id_A04D = 0;
    self._id_A152 = 0;
    self.wasaliveatmatchstart = 0;
    self.movespeedscaler = level._id_1317;
    self._id_53A5 = 1;
    self.objectivescaler = 1;
    self.issniper = 0;
    _id_833B();
    level thread _id_5EA7( self );
    thread maps\mp\_flashgrenades::_id_5E5E();
    _id_7462();
    maps\mp\_snd_common_mp::_id_8714();
    waitframe;
    level.players[level.players.size] = self;
    level notify( "playerCountChanged" );
    maps\mp\gametypes\_spawnlogic::_id_084E();
    maps\mp\gametypes\_spawnlogic::addtocharactersarray();

    if ( level.teambased )
        self updatescores();

    if ( !isdefined( self.pers["absoluteJoinTime"] ) )
        self.pers["absoluteJoinTime"] = getsystemtime();

    if ( game["state"] == "postgame" )
    {
        self._id_214A = 1;
        _id_89E9();
    }
    else
    {
        if ( isai( self ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["think"] ) )
            self thread [[ level.bot_funcs["think"] ]]();

        level endon( "game_ended" );

        if ( isdefined( level._id_4A39 ) )
        {
            if ( !isdefined( self._id_4A36 ) || self._id_4A36 == 0 )
            {
                self._id_4A36 = 0;
                thread maps\mp\gametypes\_hostmigration::_id_4A3A();
            }
        }

        if ( isdefined( level.onplayerconnectaudioinit ) )
            [[ level.onplayerconnectaudioinit ]]();

        if ( !isdefined( self.pers["team"] ) )
        {
            if ( maps\mp\_utility::_id_59E3() && self.sessionteam != "none" )
            {
                thread _id_8A0E();

                if ( isdefined( level._id_A048 ) && level._id_A048 )
                    maps\mp\_utility::_id_3A32( 1 );

                thread maps\mp\gametypes\_menus::_id_8027( self.sessionteam );

                if ( maps\mp\_utility::_id_0AA2() )
                    thread _id_803C( 2 );

                thread _id_52EF();
                return;
            }
            else if ( !maps\mp\_utility::_id_59E3() && !maps\mp\_utility::forceautoassign() && maps\mp\_utility::_id_0AB0() )
            {
                maps\mp\gametypes\_menus::_id_5BB5();
                thread _id_803C( 1 );

                if ( self _meth_842d() )
                    maps\mp\_utility::_id_3A32( 1 );
            }
            else
            {
                thread _id_8A0E();
                self [[ level._id_112A ]]();

                if ( maps\mp\_utility::_id_0AA2() )
                    thread _id_803C( 2 );

                if ( maps\mp\_utility::_id_59E3() )
                    thread _id_52EF();

                return;
            }
        }
        else
        {
            maps\mp\gametypes\_menus::addtoteam( self.pers["team"], 1 );

            if ( maps\mp\_utility::_id_51E8( self.pers["class"] ) && !maps\mp\_utility::ishodgepodgeph() )
            {
                thread _id_8998();
                return;
            }

            thread _id_8A0E();

            if ( self.pers["team"] == "spectator" )
            {
                if ( maps\mp\_utility::_id_0AB0() )
                {
                    maps\mp\gametypes\_menus::_id_13A1();
                    return;
                }

                self [[ level._id_112A ]]();
                return;
                return;
            }

            maps\mp\gametypes\_menus::_id_1398();
        }
    }
}

_id_19F8()
{
    if ( isdefined( self._id_2148 ) && self._id_2148 )
    {
        maps\mp\_utility::_id_9B42();
        maps\mp\_utility::_id_9B33();

        if ( level.teambased )
            self updatescores();
    }

    if ( self ishost() )
    {
        _id_4D99();
        setmatchdata( "players", self.clientid, "wasAHost", 1 );
    }

    var_0 = 0;

    foreach ( var_2 in level.players )
    {
        if ( !isbot( var_2 ) && !istestclient( var_2 ) )
            var_0++;
    }

    if ( !isbot( self ) && !istestclient( self ) )
    {
        level._id_4A38++;

        if ( level._id_4A38 >= var_0 * 2 / 3 )
            level notify( "hostmigration_enoughplayers" );

        self notify( "player_migrated" );
    }
}

_id_39C8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    wait 60.0;

    if ( self._id_4745 )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    if ( !maps\mp\_utility::_id_51E8( self.pers["class"] ) )
    {
        self.pers["class"] = "CLASS_CUSTOM1";
        self.class = self.pers["class"];
        maps\mp\gametypes\_class::_id_1EE7();
    }

    thread _id_8998();
}

_id_52EF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "attempted_spawn" );
    var_0 = getdvarfloat( "scr_kick_time", 90 );
    var_1 = getdvarfloat( "scr_kick_mintime", 45 );
    var_2 = gettime();

    if ( self ishost() )
        _id_52F3( 120 );
    else
        _id_52F3( var_0 );

    var_3 = ( gettime() - var_2 ) / 1000;

    if ( var_3 < var_0 - 0.1 && var_3 < var_1 )
        return;

    if ( self._id_4745 )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    kick( self getentitynumber(), "EXE_PLAYERKICKED_INACTIVE" );
    level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_52F3( var_0 )
{
    level endon( "game_ended" );
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
}

_id_4E01()
{
    maps\mp\gametypes\_persistence::_id_4D95();
    self.pers["lives"] = maps\mp\_utility::_id_3FAA();

    if ( !isdefined( self.pers["deaths"] ) )
    {
        maps\mp\_utility::_id_4DF9( "deaths" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "deaths", 0 );
    }

    self.deaths = maps\mp\_utility::_id_4081( "deaths" );

    if ( !isdefined( self.pers["score"] ) )
    {
        maps\mp\_utility::_id_4DF9( "score" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", 0 );
        maps\mp\gametypes\_persistence::_id_8D7B( "round", "timePlayed", 0 );
    }

    self.score = int( min( maps\mp\_utility::_id_4081( "score" ), 65535 ) );
    self.timeplayed["total"] = maps\mp\gametypes\_persistence::_id_8D6B( "round", "timePlayed" );

    if ( !isdefined( self.pers["suicides"] ) )
        maps\mp\_utility::_id_4DF9( "suicides" );

    self.suicides = maps\mp\_utility::_id_4081( "suicides" );

    if ( !isdefined( self.pers["kills"] ) )
    {
        maps\mp\_utility::_id_4DF9( "kills" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "kills", 0 );
    }

    self.kills = maps\mp\_utility::_id_4081( "kills" );

    if ( !isdefined( self.pers["headshots"] ) )
    {
        maps\mp\_utility::_id_4DF9( "headshots" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "headshots", 0 );
    }

    self.headshots = maps\mp\_utility::_id_4081( "headshots" );

    if ( !isdefined( self.pers["assists"] ) )
    {
        maps\mp\_utility::_id_4DF9( "assists" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "assists", 0 );
    }

    self.assists = maps\mp\_utility::_id_4081( "assists" );

    if ( !isdefined( self.pers["captures"] ) )
    {
        maps\mp\_utility::_id_4DF9( "captures" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", 0 );
    }

    if ( !isdefined( self.pers["returns"] ) )
    {
        maps\mp\_utility::_id_4DF9( "returns" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "returns", 0 );
    }

    self._id_74E0 = maps\mp\_utility::_id_4081( "returns" );

    if ( !isdefined( self.pers["defends"] ) )
    {
        maps\mp\_utility::_id_4DF9( "defends" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "defends", 0 );
    }

    if ( !isdefined( self.pers["plants"] ) )
    {
        maps\mp\_utility::_id_4DF9( "plants" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "plants", 0 );
    }

    if ( !isdefined( self.pers["defuses"] ) )
    {
        maps\mp\_utility::_id_4DF9( "defuses" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "defuses", 0 );
    }

    if ( !isdefined( self.pers["destructions"] ) )
    {
        maps\mp\_utility::_id_4DF9( "destructions" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "destructions", 0 );
    }

    if ( !isdefined( self.pers["confirmed"] ) )
    {
        maps\mp\_utility::_id_4DF9( "confirmed" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "confirmed", 0 );
    }

    if ( !isdefined( self.pers["denied"] ) )
    {
        maps\mp\_utility::_id_4DF9( "denied" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "denied", 0 );
    }

    if ( !isdefined( self.pers["setbacks"] ) )
    {
        maps\mp\_utility::_id_4DF9( "setbacks" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "setbacks", 0 );
    }

    if ( !isdefined( self.pers["humiliations"] ) )
    {
        maps\mp\_utility::_id_4DF9( "humiliations" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "humiliations", 0 );
    }

    if ( !isdefined( self.pers["rescues"] ) )
    {
        maps\mp\_utility::_id_4DF9( "rescues" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "rescues", 0 );
    }

    if ( !isdefined( self.pers["captureTime"] ) )
    {
        maps\mp\_utility::_id_4DF9( "captureTime" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "captureTime", 0 );
    }

    if ( !isdefined( self.pers["banked"] ) )
    {
        maps\mp\_utility::_id_4DF9( "banked" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "banked", 0 );
    }

    if ( !isdefined( self.pers["muggings"] ) )
    {
        maps\mp\_utility::_id_4DF9( "muggings" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "muggings", 0 );
    }

    if ( !isdefined( self.pers["teamkills"] ) )
        maps\mp\_utility::_id_4DF9( "teamkills" );

    if ( !isdefined( self.pers["totalTeamKills"] ) )
        maps\mp\_utility::_id_4DF9( "totalTeamKills" );

    if ( !isdefined( self.pers["extrascore0"] ) )
        maps\mp\_utility::_id_4DF9( "extrascore0" );

    if ( !isdefined( self.pers["extrascore1"] ) )
        maps\mp\_utility::_id_4DF9( "extrascore1" );

    if ( !isdefined( self.pers["teamKillPunish"] ) )
        self.pers["teamKillPunish"] = 0;

    if ( !isdefined( self.pers["suicideSpawnDelay"] ) )
        self.pers["suicideSpawnDelay"] = 0;

    maps\mp\_utility::_id_4DF9( "longestStreak" );
    self.pers["lives"] = maps\mp\_utility::_id_3FAA();
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "killStreak", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "loss", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "win", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "scoreboardType", "none" );

    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( self.pers["previous_shots"] ) )
            self.pers["previous_shots"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "totalShots" );

        if ( !isdefined( self.pers["previous_hits"] ) )
            self.pers["previous_hits"] = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "hits" );
    }

    if ( !isdefined( self.pers["mpWeaponStats"] ) )
        self.pers["mpWeaponStats"] = [];

    if ( !isdefined( self.pers["totalKillcamsSkipped"] ) )
        self.pers["totalKillcamsSkipped"] = 0;

    if ( !isdefined( self.pers["weaponPickupsCount"] ) )
        self.pers["weaponPickupsCount"] = 0;

    if ( !isdefined( self.pers["pingAccumulation"] ) )
        self.pers["pingAccumulation"] = 0;

    if ( !isdefined( self.pers["pingSampleCount"] ) )
        self.pers["pingSampleCount"] = 0;

    if ( !isdefined( self.pers["minPing"] ) )
        self.pers["minPing"] = 32767;

    if ( !isdefined( self.pers["maxPing"] ) )
        self.pers["maxPing"] = 0;

    if ( !isdefined( self.pers["validationInfractions"] ) )
        self.pers["validationInfractions"] = 0;

    if ( !isdefined( self.pers["killed_players"] ) )
        self.pers["killed_players"] = [];

    if ( !isdefined( self.pers["killed_by"] ) )
        self.pers["killed_by"] = [];

    if ( !isdefined( self.pers["nemesis_tracking"] ) )
        self.pers["nemesis_tracking"] = [];

    if ( !isdefined( self.pers["nemesis_guid"] ) )
        self.pers["nemesis_guid"] = "";

    if ( !isdefined( self.pers["prey_guid"] ) )
        self.pers["prey_guid"] = "";
}

_id_0852()
{
    level._id_91ED[self.team]++;

    if ( !isdefined( level._id_91F5 ) )
        level._id_91F5 = [];

    if ( !isdefined( level._id_91F5[self.team] ) )
        level._id_91F5[self.team] = [];

    level._id_91F5[self.team][level._id_91F5[self.team].size] = self;
    maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_73AF()
{
    level._id_91ED[self.team]--;

    if ( isdefined( level._id_91F5 ) && isdefined( level._id_91F5[self.team] ) )
    {
        var_0 = [];

        foreach ( var_2 in level._id_91F5[self.team] )
        {
            if ( !isdefined( var_2 ) || var_2 == self )
                continue;

            var_0[var_0.size] = var_2;
        }

        level._id_91F5[self.team] = var_0;
    }
}

_id_0844()
{
    var_0 = self.team;

    if ( !( isdefined( self._id_0B00 ) && self._id_0B00 ) )
    {
        level._id_4745[var_0]++;
        _id_4C3C( var_0 );
    }

    self._id_0B00 = undefined;

    if ( level._id_09DD["allies"] + level._id_09DD["axis"] > level._id_5A4D )
        level._id_5A4D = level._id_09DD["allies"] + level._id_09DD["axis"];
}

_id_4C3C( var_0 )
{
    level._id_09DD[var_0]++;
}

_id_73A4( var_0 )
{
    var_1 = self.team;

    if ( isdefined( self.switching_teams ) && self.switching_teams && isdefined( self.joining_team ) && self.joining_team == self.team )
        var_1 = self.leaving_team;

    if ( isdefined( var_0 ) )
        _id_7395();

    _id_275E( var_1 );
    return maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_275E( var_0 )
{
    level._id_09DD[var_0]--;
}

_id_084D()
{
    level._id_57B9[self.team] += self.pers["lives"];
}

_id_73AB()
{
    level._id_57B9[self.team]--;
    level._id_57B9[self.team] = int( max( 0, level._id_57B9[self.team] ) );
}

_id_7395()
{
    level._id_57B9[self.team] -= self.pers["lives"];
    level._id_57B9[self.team] = int( max( 0, level._id_57B9[self.team] ) );
}

_id_7464()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_capture_icon", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
    self setclientomnvar( "ui_killcam_time_until_spawn", 0 );
}

_id_7462()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_capture_icon", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
}

_id_7465()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_capture_icon", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
}

_id_7463()
{

}

_id_5EA7( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    _id_2433( var_0 );

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        _id_728A( var_0 );
    }
}

_id_2433( var_0 )
{
    if ( !isdefined( var_0.pers["segments"] ) )
        var_0.pers["segments"] = [];

    var_0._id_7C58 = var_0.pers["segments"];

    if ( !var_0._id_7C58.size )
    {
        var_0._id_7C58["distanceTotal"] = 0;
        var_0._id_7C58["movingTotal"] = 0;
        var_0._id_7C58["movementUpdateCount"] = 0;
        var_0._id_7C58["killDistanceTotal"] = 0;
        var_0._id_7C58["killDistanceCount"] = 0;
    }
}

_id_728A( var_0 )
{
    var_0 endon( "death" );

    while ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        wait 0.5;

    wait 4;
    var_0._id_781B = var_0.origin;
    var_0._id_6E62 = var_0.origin;

    for (;;)
    {
        wait 1;

        if ( var_0 maps\mp\_utility::_id_51E3() )
        {
            var_0 waittill( "stopped_using_remote" );
            var_0._id_781B = var_0.origin;
            var_0._id_6E62 = var_0.origin;
            continue;
        }

        var_0._id_7C58["movementUpdateCount"]++;
        var_0._id_7C58["distanceTotal"] += distance2d( var_0._id_781B, var_0.origin );
        var_0._id_781B = var_0.origin;

        if ( var_0._id_7C58["movementUpdateCount"] % 5 == 0 )
        {
            var_1 = distance2d( var_0._id_6E62, var_0.origin );
            var_0._id_6E62 = var_0.origin;

            if ( var_1 > 16 )
                var_0._id_7C58["movingTotal"]++;
        }
    }
}

_id_A361( var_0 )
{
    if ( level.players.size < 2 )
        return;

    var_0 endon( "disconnect" );

    if ( var_0._id_7C58["movementUpdateCount"] < 30 || var_0._id_7C58["killDistanceCount"] < 1 )
        return;

    var_1 = var_0._id_7C58["movingTotal"] / int( var_0._id_7C58["movementUpdateCount"] / 5 ) * 100;
    var_2 = var_0._id_7C58["distanceTotal"] / var_0._id_7C58["movementUpdateCount"];
    var_3 = var_0._id_7C58["killDistanceTotal"] / var_0._id_7C58["killDistanceCount"];
    var_1 = min( var_1, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 3 ) ) );
    var_2 = min( var_2, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 2 ) ) );
    var_3 = min( var_3, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 4 ) ) );
    var_4 = _id_19E1( var_1, var_2, var_3 );
    setmatchdata( "players", var_0.clientid, "averageSpeedDuringMatch", var_2 );
    setmatchdata( "players", var_0.clientid, "percentageOfTimeMoving", var_1 );
    setmatchdata( "players", var_0.clientid, "averageKillDistance", var_3 );
    setmatchdata( "players", var_0.clientid, "totalDistanceTravelled", var_0._id_7C58["distanceTotal"] );
    setmatchdata( "players", var_0.clientid, "playstyle", maps\mp\_utility::_id_1E28( var_4 ) );

    if ( isai( var_0 ) )
        return;

    reconevent( "script_PlayerSegments: percentTimeMoving %f, averageSpeed %f, averageKillDistance %f, playStyle %d, name %s", var_1, var_2, var_3, var_4, var_0.name );

    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    var_5 = 50;
    var_6 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numPlayStyleTrends" );
    var_6++;

    if ( var_6 > var_5 )
    {
        var_6 = var_5;

        if ( var_5 > 1 )
        {
            for ( var_7 = 0; var_7 < var_5 - 1; var_7++ )
            {
                var_8 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_7 + 1 );
                var_9 = var_0 getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_7 + 1 );
                var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_7, var_8 );
                var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_7, var_9 );
            }
        }
    }

    var_8 = maps\mp\_utility::gettimeutc_for_stat_recording();
    var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_6 - 1, var_8 );
    var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_6 - 1, var_4 );
    var_0 setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numPlayStyleTrends", var_6 );
}

_id_19E1( var_0, var_1, var_2 )
{
    var_0 = _id_6162( var_0, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 3 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 3 ) ) );
    var_1 = _id_6162( var_1, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 2 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 2 ) ) );
    var_2 = _id_6162( var_2, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 4 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 4 ) ) );
    var_3 = ( var_0, var_1, var_2 );
    var_4 = [ "Camper", "Mobile", "Run", "Sniper", "TacCQ" ];
    var_5 = "Camper";
    var_6 = 1000;

    foreach ( var_8 in var_4 )
    {
        var_9 = _id_3F28( var_3, var_8 );

        if ( var_9 < var_6 )
        {
            var_5 = var_8;
            var_6 = var_9;
        }
    }

    return int( tablelookup( "mp/playerSegments.csv", 0, var_5, 1 ) );
}

_id_6162( var_0, var_1, var_2 )
{
    return ( var_0 - var_1 ) / var_2;
}

_id_3F28( var_0, var_1 )
{
    var_2 = ( float( tablelookup( "mp/playerSegments.csv", 0, var_1, 3 ) ), float( tablelookup( "mp/playerSegments.csv", 0, var_1, 2 ) ), float( tablelookup( "mp/playerSegments.csv", 0, var_1, 4 ) ) );
    return distance( var_0, var_2 );
}
