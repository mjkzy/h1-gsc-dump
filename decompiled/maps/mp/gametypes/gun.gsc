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

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        level thread _id_7308();
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 0 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
        setdynamicdvar( "scr_game_hardpoints", 0 );
    }

    level.gun_cyclecount = maps\mp\_utility::_id_3FDB( "scr_gun_cycleCount", 1 );
    level.gun_weaponlist = maps\mp\_utility::_id_3FDB( "scr_gun_weaponList", 0 );
    level.gun_weaponorder = maps\mp\_utility::_id_3FDB( "scr_gun_weaponOrder", 0 );
    level.gun_weaponattachments = maps\mp\_utility::_id_3FDB( "scr_gun_weaponAttachments", 0 );
    level.gun_weaponlistend = maps\mp\_utility::_id_3FDB( "scr_gun_weaponListEnd", 0 );
    _id_7F83();
    setscorelimit();
    level.teambased = 0;
    level._id_2D73 = 1;
    level.onstartgametype = ::onstartgametype;
    level._id_64E9 = ::_id_64E9;
    level.getspawnpoint = ::getspawnpoint;
    level._id_64D3 = ::_id_64D3;
    level._id_64F0 = ::_id_64F0;
    level.onplayerscore = ::onplayerscore;
    level._id_1969 = ::_id_446E;
    level.streamprimariesfunc = ::streamprimariesfunc;
    level._id_0D7B = 1;
    level._id_7F2E = maps\mp\_utility::_id_3FDB( "scr_gun_setBackLevels", 1 );
    level._id_55A9 = 0;

    if ( level.matchrules_damagemultiplier )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    setteammode( "ffa" );
    game["dialog"]["gametype"] = "gg_intro";
    game["dialog"]["defense_obj"] = "gbl_start";
    game["dialog"]["offense_obj"] = "gbl_start";
    game["dialog"]["humiliation"] = "gg_humiliation";
    game["dialog"]["lastgun"] = "gg_lastgun";
}

gundebug()
{
    var_0 = "scr_gun_force_next";
    var_1 = "scr_gun_force_prev";
    setdvar( var_0, 0 );
    setdvar( var_1, 0 );

    while ( !isdefined( level.player ) )
        waittillframeend;

    for (;;)
    {
        wait 0.1;

        if ( getdvarint( var_0, 0 ) )
        {
            level.player._id_4470 = level.player._id_446F;
            level.player._id_446F++;
            level.player _id_41F3();
            setdvar( var_0, 0 );
            continue;
        }

        if ( getdvarint( var_1, 0 ) )
        {
            level.player._id_4470 = level.player._id_446F;

            for ( level.player._id_446F--; level.player._id_446F < 0; level.player._id_446F += level._id_4459.size )
            {

            }

            level.player _id_41F3();
            setdvar( var_1, 0 );
        }
    }
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata( 1 );
    setdynamicdvar( "scr_gun_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "gun", 1 );
    setdynamicdvar( "scr_gun_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "gun", 1 );
    setdynamicdvar( "scr_gun_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "gun", 0 );
    setdynamicdvar( "scr_gun_playerrespawndelay", 0 );
    setdynamicdvar( "scr_gun_waverespawndelay", 0 );
    setdynamicdvar( "scr_player_forcerespawn", 1 );
    setdynamicdvar( "scr_gun_setBackLevels", getmatchrulesdata( "gunData", "setbackLevels" ) );
    setdynamicdvar( "scr_gun_cycleCount", getmatchrulesdata( "gunData", "cycleCount" ) );
    setdynamicdvar( "scr_gun_weaponList", getmatchrulesdata( "gunData", "weaponList" ) );
    setdynamicdvar( "scr_gun_weaponOrder", getmatchrulesdata( "gunData", "weaponOrder" ) );
    setdynamicdvar( "scr_gun_weaponAttachments", getmatchrulesdata( "gunData", "weaponAttachments" ) );
    setdynamicdvar( "scr_gun_weaponListEnd", getmatchrulesdata( "gunData", "weaponListEnd" ) );
    setdynamicdvar( "scr_game_hardpoints", 0 );
}

setscorelimit()
{
    setdynamicdvar( "scr_gun_scorelimit", level._id_4459.size * level.gun_cyclecount );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, level._id_4459.size * level.gun_cyclecount );
}

_id_7308()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        setscorelimit();
        setdynamicdvar( "scr_game_hardpoints", 0 );
    }
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_GUN" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_GUN" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_GUN" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_GUN" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_GUN_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_GUN_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_GUN_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_GUN_HINT" );
    initspawns();
    var_0 = [];
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level thread _id_64C8();
}

initspawns()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_446F = 0;
        var_0._id_4470 = 0;
        var_0._id_8AE3 = 0;
        var_0._id_6037 = 0;
        var_0._id_55BA = 0;
        var_0._id_852B = 0;
        var_0 thread _id_72AE();
        var_0 thread _id_72B2();
    }
}

getspawnpoint()
{
    if ( level.ingraceperiod )
        var_0 = maps\mp\gametypes\_spawnlogic::getstartspawnffa( self.pers["team"] );
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
        var_0 = maps\mp\gametypes\_spawnscoring::getspawnpoint_freeforall( var_1 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_0 );
    return var_0;
}

_id_446E()
{
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    gungameclassupdate( level._id_4459[0] );
}

gungameclassupdate( var_0 )
{
    self.pers["gamemodeLoadout"] = maps\mp\gametypes\_class::_id_3F7B();

    if ( !maps\mp\gametypes\_class::_id_51F3( var_0.basename ) )
        self.pers["loadoutSecondary"] = var_0.fullname;
    else
        self.pers["loadoutPrimary"] = var_0.fullname;
}

streamprimariesfunc()
{
    var_0 = [];

    foreach ( var_2 in level._id_4459 )
        var_0[var_0.size] = var_2.fullname;

    var_4 = [];

    foreach ( var_2 in var_0 )
    {
        var_6 = [ "axis", "allies" ];

        foreach ( var_8 in var_6 )
        {
            var_9 = spawnstruct();
            var_9.team = var_8;
            var_9.weapon = var_2;
            var_4[var_4.size] = var_9;
        }
    }

    self _meth_8420( var_4, var_0 );
}

_id_64E9()
{
    thread _id_A050();
}

_id_A050()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level waittill( "player_spawned" );
    _id_41F3( 1 );

    if ( self._id_852B )
    {
        self._id_852B = 0;
        thread maps\mp\_events::_id_2758();
    }
}

onplayerscore( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::_id_40C1( var_0 );
    var_1 maps\mp\_utility::_id_7F6B( var_1.extrascore0 + var_3 );
    var_1 maps\mp\gametypes\_gamescores::_id_9B65( var_1, var_3 );

    if ( var_0 == "gained_gun_score" )
        return 1;

    if ( var_0 == "dropped_gun_score" )
    {
        var_4 = min( level._id_7F2E, self.score );
        return int( var_4 * -1 );
    }

    return 0;
}

isdedicatedmeleeweapon( var_0 )
{
    if ( weaponinventorytype( var_0 ) == "melee" )
        return 1;

    return 0;
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( var_3 == "MOD_TRIGGER_HURT" && !isplayer( var_1 ) )
        var_1 = self;

    if ( isdefined( var_4 ) && maps\mp\_utility::_id_50F3( var_4 ) && var_1 != self )
        return;

    if ( isdefined( var_4 ) && maps\mp\_utility::_id_50FE( var_4 ) )
        return;

    if ( var_3 == "MOD_FALLING" || isplayer( var_1 ) )
    {
        if ( var_3 == "MOD_FALLING" || var_1 == self || maps\mp\_utility::_id_5150( var_3 ) && !isdedicatedmeleeweapon( var_4 ) )
        {
            self playlocalsound( "mp_war_objective_lost" );
            self._id_4470 = self._id_446F;
            self._id_446F = int( max( 0, self._id_446F - level._id_7F2E ) );

            if ( self._id_4470 > self._id_446F )
            {
                self._id_6037++;
                maps\mp\_utility::_id_7F6C( self._id_6037 );
                self._id_852B = 1;

                if ( maps\mp\_utility::_id_5150( var_3 ) )
                {
                    var_1._id_8AE3++;
                    var_1.assists = var_1._id_8AE3;
                    var_1 thread maps\mp\_events::_id_7F2C();

                    if ( self._id_4470 == level._id_4459.size * level.gun_cyclecount - 1 )
                    {
                        var_1 thread maps\mp\_events::_id_7F2D();
                        var_1 maps\mp\_utility::_id_5655( "humiliation", "status" );
                    }
                }
                else
                    var_1.gungamesuicidetime = gettime();
            }
            else if ( maps\mp\_utility::_id_5150( var_3 ) )
            {
                var_1._id_8AE3++;
                var_1.assists = var_1._id_8AE3;
                var_1 thread maps\mp\_events::_id_7F2C();
            }
        }
        else if ( var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_HEAD_SHOT" || var_3 == "MOD_PROJECTILE" || var_3 == "MOD_PROJECTILE_SPLASH" || var_3 == "MOD_EXPLOSIVE" || var_3 == "MOD_IMPACT" || var_3 == "MOD_GRENADE" || var_3 == "MOD_GRENADE_SPLASH" || maps\mp\_utility::_id_5150( var_3 ) && isdedicatedmeleeweapon( var_4 ) )
        {
            waitframe;

            if ( isdefined( var_1.gungamesuicidetime ) && gettime() - var_1.gungamesuicidetime <= 50 )
                return;

            if ( isdefined( var_1._id_55BA ) && var_1._id_55BA == gettime() )
                return;

            if ( maps\mp\_utility::_id_5150( var_3 ) )
            {
                var_1._id_8AE3++;
                var_1.assists = var_1._id_8AE3;
                var_1 thread maps\mp\_events::_id_7F2C();
            }

            var_4 = maps\mp\_utility::_id_3F11( var_4 );

            if ( var_1._id_55BA + 3000 > gettime() )
                var_1 thread maps\mp\_events::_id_70A1();

            var_1._id_55BA = gettime();
            var_1._id_4470 = var_1._id_446F;
            var_1._id_446F++;
            var_1 thread maps\mp\_events::_id_4C34();

            if ( var_1._id_446F == level._id_4459.size * level.gun_cyclecount - 1 )
            {
                maps\mp\_utility::_id_6DDD( "mp_enemy_obj_captured" );
                level thread maps\mp\_utility::_id_91FA( "callout_top_gun_rank", var_1 );
                var_10 = gettime();

                if ( level._id_55A9 + 4500 < var_10 )
                {
                    level thread maps\mp\_utility::_id_5658( "lastgun", level.players, "status" );
                    level._id_55A9 = var_10;
                }
            }

            if ( var_1._id_446F < level._id_4459.size * level.gun_cyclecount || !level.gun_cyclecount )
                var_1 _id_41F3();
        }
    }
}

_id_41F3( var_0 )
{
    self endon( "disconnect" );
    self notify( "giveNextGun" );
    self endon( "giveNextGun" );
    waitframe;
    var_1 = _id_403C();
    gungameclassupdate( var_1 );
    var_2 = var_1.fullname;
    var_3 = common_scripts\utility::_id_9294( var_1.altfireonly, weaponaltweaponname( var_2 ), var_2 );

    while ( !self _meth_8508( var_2 ) )
        waittillframeend;

    self takeallweapons();
    maps\mp\_utility::_id_05C0( var_3 );

    if ( isdefined( var_0 ) )
        self setspawnweapon( var_3 );

    var_4 = maps\mp\_utility::_id_3F11( var_2 );
    self.pers["primaryWeapon"] = var_4;
    self.primaryweapon = var_2;
    self.primaryweaponalt = var_3;
    self givestartammo( self.primaryweapon );
    self.primaryweaponstartammo = self getweaponammostock( self.primaryweapon );

    if ( self.primaryweaponalt != "none" )
        self.primaryweaponaltstartammo = self getweaponammostock( self.primaryweaponalt );

    var_5 = !maps\mp\_utility::_id_5092( var_0 );

    if ( var_1.altfireonly )
    {
        self setweaponammoclip( self.primaryweapon, 0 );
        self setweaponammostock( self.primaryweapon, 0 );
        self.primaryweaponstartammo = 0;
        self switchtoweapon( var_3, var_5 );
    }
    else
        self switchtoweapon( var_2, var_5 );

    self._id_4470 = self._id_446F;
}

_id_403C()
{
    var_0 = level._id_4459;
    var_1 = [];
    var_2 = undefined;
    var_2 = var_0[self._id_446F % var_0.size];
    var_1[var_1.size] = var_2.fullname;

    if ( self._id_446F + 1 < var_0.size * level.gun_cyclecount )
        var_1[var_1.size] = var_0[( self._id_446F + 1 ) % var_0.size].fullname;

    if ( self._id_446F > 0 )
        var_1[var_1.size] = var_0[( self._id_446F - 1 ) % var_0.size].fullname;

    self _meth_8508( var_1 );
    return var_2;
}

_id_07CB( var_0 )
{
    if ( var_0 == "h1_rpg" )
        var_1 = "h1_rpg_mp";
    else
        var_1 = maps\mp\gametypes\_class::_id_188C( var_0, "none", "none" );

    return var_1;
}

_id_64F0()
{
    level._id_374D = "none";
    var_0 = _id_3FC8();

    if ( !isdefined( var_0 ) || !var_0.size )
        thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["time_limit_reached"] );
    else if ( var_0.size == 1 )
        thread maps\mp\gametypes\_gamelogic::_id_315F( var_0[0], game["end_reason"]["time_limit_reached"] );
    else if ( var_0[var_0.size - 1]._id_446F > var_0[var_0.size - 2]._id_446F )
        thread maps\mp\gametypes\_gamelogic::_id_315F( var_0[var_0.size - 1], game["end_reason"]["time_limit_reached"] );
    else
        thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["time_limit_reached"] );
}

_id_3FC8()
{
    var_0 = -1;
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3._id_446F ) && var_3._id_446F >= var_0 )
        {
            var_0 = var_3._id_446F;
            var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_72AE()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "reload" );
        self setweaponammostock( self.primaryweapon, self.primaryweaponstartammo );

        if ( self.primaryweaponalt != "none" )
            self setweaponammostock( self.primaryweaponalt, self.primaryweaponaltstartammo );
    }
}

_id_72B2()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( maps\mp\_utility::_id_5189( self ) && self.team != "spectator" && isdefined( self.primaryweapon ) && self getammocount( self.primaryweapon ) == 0 )
        {
            wait 2;
            self notify( "reload" );
            wait 1;
            continue;
        }

        wait 0.05;
    }
}

guninfo( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = spawnstruct();
    var_4.basename = var_0;
    var_4.altfireonly = var_3;
    var_5 = var_1;

    if ( level.gun_weaponattachments )
        var_5 = common_scripts\utility::_id_710E( var_2 );

    if ( var_0 == "h1_rpg" )
        var_4.fullname = "h1_rpg_mp";
    else
        var_4.fullname = maps\mp\gametypes\_class::_id_188C( var_0, var_5, "none" );

    level._id_4459[level._id_4459.size] = var_4;
}

_id_7F83()
{
    var_0 = "h1_meleeshovel";
    var_1 = [ "none" ];
    level._id_4459 = [];

    switch ( level.gun_weaponlist )
    {
        case 0:
        default:
            var_2 = [ "none", "reflex", "gl", "silencer", "acog" ];
            var_3 = [ "none", "silencer", "reflex", "acog" ];
            var_4 = [ "none", "reflex", "grip", "acog" ];
            var_5 = [ "none", "reflex", "grip" ];
            var_6 = [ "none", "acog" ];
            var_7 = [ "none", "silencer" ];
            var_8 = [ "none" ];
            guninfo( "h1_colt45", "none", var_7 );
            guninfo( "h1_ak74u", "none", var_3 );
            guninfo( "h1_m16", "reflex", var_2 );
            guninfo( "h1_saw", "grip", var_4 );
            guninfo( "h1_m40a3", "none", var_6 );
            guninfo( "h1_beretta", "none", var_7 );
            guninfo( "h1_p90", "none", var_3 );
            guninfo( "h1_mp44", "none", var_1 );
            guninfo( "h1_m1014", "grip", var_5 );
            guninfo( "h1_m21", "none", var_6 );
            guninfo( "h1_usp", "silencer", var_7 );
            guninfo( "h1_skorpion", "none", var_3 );
            guninfo( "h1_m4", "none", var_2 );
            guninfo( "h1_m60e4", "none", var_4 );
            guninfo( "h1_dragunov", "none", var_6 );
            guninfo( "h1_g3", "reflex", var_2 );
            guninfo( "h1_mp5", "none", var_3 );
            guninfo( "h1_m14", "none", var_2 );
            guninfo( "h1_winchester1200", "none", var_5 );
            guninfo( "h1_remington700", "none", var_6 );
            guninfo( "h1_g36c", "acog", var_2 );
            guninfo( "h1_deserteagle", "none", var_1 );
            guninfo( "h1_uzi", "silencer", var_3 );
            guninfo( "h1_ak47", "none", var_2 );
            guninfo( "h1_rpd", "reflex", var_4 );
            guninfo( "h1_barrett", "none", var_6 );
            break;
        case 1:
            var_9 = [ "none", "reflex", "silencer" ];
            var_10 = [ "none", "silencer", "reflex" ];
            var_11 = [ "none", "reflex", "grip" ];
            var_12 = [ "none", "silencer" ];
            guninfo( "h1_colt45", "none", var_12 );
            guninfo( "h1_ak74u", "silencer", var_10 );
            guninfo( "h1_m16", "none", var_9 );
            guninfo( "h1_beretta", "none", var_12 );
            guninfo( "h1_p90", "none", var_10 );
            guninfo( "h1_g36c", "silencer", var_9 );
            guninfo( "h1_m1014", "grip", var_11 );
            guninfo( "h1_usp", "none", var_12 );
            guninfo( "h1_skorpion", "none", var_10 );
            guninfo( "h1_m4", "none", var_9 );
            guninfo( "h1_g3", "none", var_9 );
            guninfo( "h1_mp5", "silencer", var_10 );
            guninfo( "h1_m14", "none", var_9 );
            guninfo( "h1_winchester1200", "grip", var_11 );
            guninfo( "h1_mp44", "none", var_1 );
            guninfo( "h1_deserteagle", "none", var_1 );
            guninfo( "h1_uzi", "none", var_10 );
            guninfo( "h1_ak47", "none", var_9 );
            break;
        case 2:
            var_13 = [ "none", "reflex", "acog" ];
            var_14 = [ "none", "reflex", "grip", "acog" ];
            var_15 = [ "none", "acog" ];
            guninfo( "h1_m16", "reflex", var_13 );
            guninfo( "h1_saw", "grip", var_14 );
            guninfo( "h1_m40a3", "acog", var_15 );
            guninfo( "h1_mp44", "none", var_1 );
            guninfo( "h1_m21", "none", var_15 );
            guninfo( "h1_m4", "acog", var_13 );
            guninfo( "h1_m60e4", "reflex", var_14 );
            guninfo( "h1_dragunov", "none", var_15 );
            guninfo( "h1_g3", "none", var_13 );
            guninfo( "h1_m14", "reflex", var_13 );
            guninfo( "h1_remington700", "none", var_15 );
            guninfo( "h1_g36c", "none", var_13 );
            guninfo( "h1_ak47", "none", var_13 );
            guninfo( "h1_rpd", "grip", var_14 );
            guninfo( "h1_barrett", "none", var_15 );
            break;
        case 3:
            var_16 = [ "none", "reflex", "gl", "silencer", "acog" ];
            guninfo( "h1_m16", "none", var_16 );
            guninfo( "h1_mp44", "none", var_1 );
            guninfo( "h1_m4", "none", var_16 );
            guninfo( "h1_g3", "none", var_16 );
            guninfo( "h1_g36c", "none", var_16 );
            guninfo( "h1_ak47", "none", var_16 );
            break;
        case 4:
            var_17 = [ "none", "silencer", "reflex", "acog" ];
            guninfo( "h1_ak74u", "none", var_17 );
            guninfo( "h1_p90", "none", var_17 );
            guninfo( "h1_skorpion", "none", var_17 );
            guninfo( "h1_mp5", "none", var_17 );
            guninfo( "h1_uzi", "none", var_17 );
            break;
        case 5:
            var_18 = [ "none", "acog" ];
            guninfo( "h1_m40a3", "none", var_18 );
            guninfo( "h1_m21", "none", var_18 );
            guninfo( "h1_dragunov", "none", var_18 );
            guninfo( "h1_remington700", "none", var_18 );
            guninfo( "h1_barrett", "none", var_18 );
            break;
        case 6:
            var_19 = [ "none", "reflex", "grip" ];
            guninfo( "h1_m1014", "none", var_19 );
            guninfo( "h1_winchester1200", "none", var_19 );
            break;
        case 7:
            var_20 = [ "none", "reflex", "grip", "acog" ];
            guninfo( "h1_saw", "none", var_20 );
            guninfo( "h1_m60e4", "none", var_20 );
            guninfo( "h1_rpd", "none", var_20 );
            break;
        case 8:
            var_21 = [ "none", "silencer" ];
            guninfo( "h1_colt45", "none", var_21 );
            guninfo( "h1_beretta", "none", var_21 );
            guninfo( "h1_usp", "none", var_21 );
            guninfo( "h1_deserteagle", "none", var_1 );
            break;
        case 9:
            var_22 = [ "gl" ];
            guninfo( "h1_m16", "gl", var_22, 1 );
            guninfo( "h1_m4", "gl", var_22, 1 );
            guninfo( "h1_g3", "gl", var_22, 1 );
            guninfo( "h1_m14", "gl", var_22, 1 );
            guninfo( "h1_g36c", "gl", var_22, 1 );
            guninfo( "h1_ak47", "gl", var_22, 1 );
            break;
    }

    switch ( level.gun_weaponorder )
    {
        case 0:
        default:
            break;
        case 1:
            level._id_4459 = common_scripts\utility::_id_0CF5( level._id_4459 );
            break;
        case 2:
            level._id_4459 = common_scripts\utility::_id_0D02( level._id_4459 );
            break;
    }

    switch ( level.gun_weaponlistend )
    {
        case 0:
        default:
            guninfo( "h1_rpg", "none", var_1 );
            guninfo( var_0, "none", var_1 );
            break;
        case 1:
            guninfo( var_0, "none", var_1 );
            guninfo( "h1_rpg", "none", var_1 );
            break;
        case 2:
            guninfo( "h1_rpg", "none", var_1 );
            break;
        case 3:
            guninfo( var_0, "none", var_1 );
            break;
        case 4:
            break;
    }
}
