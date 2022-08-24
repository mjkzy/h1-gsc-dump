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
    level.scavenger_altmode = 1;
    level.scavenger_secondary = 1;
    level.maxperplayerexplosives = max( maps\mp\_utility::_id_3FDB( "scr_maxPerPlayerExplosives", 2 ), 1 );
    level._id_7557 = maps\mp\_utility::_id_3FDB( "scr_riotShieldXPBullets", 15 );
    createthreatbiasgroup( "DogsDontAttack" );
    createthreatbiasgroup( "Dogs" );
    setignoremegroup( "DogsDontAttack", "Dogs" );

    switch ( maps\mp\_utility::_id_3FDB( "perk_scavengerMode", 0 ) )
    {
        case 1:
            level.scavenger_altmode = 0;
            break;
        case 2:
            level.scavenger_secondary = 0;
            break;
        case 3:
            level.scavenger_altmode = 0;
            level.scavenger_secondary = 0;
            break;
    }

    var_0 = getdvar( "g_gametype" );
    var_1 = maps\mp\_utility::_id_3F09();
    var_1 = common_scripts\utility::_id_0AF9( var_1 );
    var_2 = tablegetrowcount( "mp/statstable.csv" );
    var_3 = tablegetcolumncount( "mp/statstable.csv" );
    level.weaponlist = [];
    level.weaponattachments = [];

    for ( var_4 = 0; var_4 <= var_2; var_4++ )
    {
        if ( !issubstr( tablelookupbyrow( "mp/statstable.csv", var_4, 2 ), "weapon_" ) )
            continue;

        if ( tablelookupbyrow( "mp/statstable.csv", var_4, 51 ) != "" )
            continue;

        if ( tablelookupbyrow( "mp/statstable.csv", var_4, var_3 - 1 ) == "Never" )
            continue;

        var_5 = tablelookupbyrow( "mp/statstable.csv", var_4, 4 );

        if ( var_5 == "" || var_5 == "none" )
            continue;

        if ( issubstr( var_5, "iw5" ) || issubstr( var_5, "iw6" ) )
        {
            var_6 = maps\mp\_utility::_id_416C( var_5 );
            var_5 = var_6[0] + "_" + var_6[1] + "_mp";
            level.weaponlist[level.weaponlist.size] = var_5;
            continue;
        }
        else
            level.weaponlist[level.weaponlist.size] = var_5 + "_mp";

        var_7 = maps\mp\_utility::_id_4160( var_5 );
        var_8 = [];

        foreach ( var_10 in var_1 )
        {
            if ( !isdefined( var_7[var_10] ) )
                continue;

            level.weaponlist[level.weaponlist.size] = var_5 + "_" + var_10 + "_mp";
            var_8[var_8.size] = var_10;
        }

        var_12 = [];

        for ( var_13 = 0; var_13 < var_8.size - 1; var_13++ )
        {
            var_14 = tablelookuprownum( "mp/attachmentCombos.csv", 0, var_8[var_13] );

            for ( var_15 = var_13 + 1; var_15 < var_8.size; var_15++ )
            {
                if ( tablelookup( "mp/attachmentCombos.csv", 0, var_8[var_15], var_14 ) == "no" )
                    continue;

                var_12[var_12.size] = var_8[var_13] + "_" + var_8[var_15];
            }
        }

        foreach ( var_17 in var_12 )
            level.weaponlist[level.weaponlist.size] = var_5 + "_" + var_17 + "_mp";
    }

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        foreach ( var_20 in level.weaponlist )
            precacheitem( var_20 );
    }

    thread maps\mp\_flashgrenades::main();
    thread maps\mp\_entityheadicons::init();

    if ( !isdefined( level._id_A2D8 ) )
        level._id_A2D8 = ::_id_2F99;

    var_23 = 70;
    level.claymoredetectiondot = cos( var_23 );
    level.claymoredetectionmindist = 20;
    level.claymoredetectiongraceperiod = 0.75;
    level.claymoredetonateradius = 192;

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        level.minedetectiongraceperiod = 0.3;
        level.minedetectionradius = 100;
        level.minedetectionheight = 20;
        level.minedamageradius = 256;
        level.minedamagemin = 70;
        level.minedamagemax = 210;
        level.minedamagehalfheight = 46;
        level.mineselfdestructtime = 120;
    }

    level.delayminetime = 3.0;
    level._id_8E46 = loadfx( "fx/explosions/aerial_explosion_large" );
    level.meleeweaponbloodflick = loadfx( "vfx/blood/blood_flick_melee_weapon" );
    level._id_6F81 = [];
    level._id_855B = [];
    level._id_43E1 = [];
    level._id_5C8C = [];
    level._id_4F99 = [];
    level._id_5C5D = [];
    level._id_9828 = [];
    precachemodel( "weapon_claymore_bombsquad_mw1" );
    precachemodel( "weapon_c4_bombsquad_mw1" );
    precachelaser( "mp_attachment_lasersight" );
    precachelaser( "mp_attachment_lasersight_short" );
    level.c4fxid = loadfx( "vfx/lights/light_c4_blink" );
    level.claymorefxid = loadfx( "vfx/props/claymore_laser" );
    level thread _id_64C8();
    level.c4explodethisframe = 0;
    common_scripts\utility::_id_0D13( getentarray( "misc_turret", "classname" ), ::_id_9974 );
}

_id_1550()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = maps\mp\_utility::strip_suffix( var_1, "_lefthand" );

        if ( var_2 == "h1_c4_mp" )
        {
            if ( !isdefined( level.bombsquadmodelc4 ) )
                level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1";

            var_0 thread _id_23E6( level.bombsquadmodelc4, "tag_origin", self );
            continue;
        }

        if ( var_2 == "h1_claymore_mp" )
        {
            if ( !isdefined( level.bombsquadmodelclaymore ) )
                level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1";

            var_0 thread _id_23E6( level.bombsquadmodelclaymore, "tag_origin", self );
        }
    }
}

_id_23E6( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3 hide();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_3 thread _id_154F( var_2 );
    var_3 setmodel( var_0 );
    var_3 linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 setcontents( 0 );
    self waittill( "death" );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_3 delete();
}

_id_154F( var_0 )
{
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0.team;
    checkbombsquadvisibility( var_0, var_1 );

    for (;;)
    {
        level common_scripts\utility::_id_A069( "joined_team", "player_spawned", "changed_kit", "update_bombsquad" );
        self hide();
        checkbombsquadvisibility( var_0, var_1 );
    }
}

checkbombsquadvisibility( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( level.teambased )
        {
            if ( !isdefined( var_3.team ) || var_3.team == "spectator" )
                continue;

            if ( var_3.team != var_1 && var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
                self showtoplayer( var_3 );

            continue;
        }

        if ( isdefined( var_0 ) && var_3 == var_0 )
            continue;

        if ( !var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
            continue;

        self showtoplayer( var_3 );
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.hits = 0;
        var_0._id_51A8 = 0;
        maps\mp\gametypes\_gamelogic::_id_7F85( var_0, 0 );
        var_0 thread _id_64D6();
        var_0 thread _id_1550();
        var_0 thread _id_A240();
        var_0 thread watchmeleeweapon();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "spawned_player", "faux_spawn" );
        self.currentweaponatspawn = self getcurrentweapon();
        self.empendtime = 0;
        self.concussionendtime = 0;
        self.hits = 0;
        self.meleeweaponbloodytime = undefined;
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 0 );

        if ( !isdefined( self.trackingweaponname ) )
        {
            self.trackingweaponname = "";
            self.trackingweaponname = "none";
            self._id_94FC = 0;
            self._id_94FA = 0;
            self._id_94F9 = 0;
            self._id_94F7 = 0;
            self._id_94F8 = 0;
            self._id_94F6 = 0;
            self._id_94FD = 0;
        }

        thread _id_A25A();
        thread _id_A265();
        thread _id_A232();
        thread _id_A25D();
        thread _id_A264();
        thread _id_A23D();
        thread watchweaponinspection();

        if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
        {

        }

        thread _id_8AFC();
        thread maps\mp\_opticsthermal::_id_6542();
        thread maps\mp\_lasersight::_id_54FF();
        thread _id_A22E();

        if ( !maps\mp\_utility::_id_4FA6() )
            thread _id_A257();

        thread _id_A263();

        if ( isdefined( level.onplayerspawnedweaponsfunc ) )
            self thread [[ level.onplayerspawnedweaponsfunc ]]();

        self.lasthittime = [];
        self.droppeddeathweapon = undefined;
        self._id_93E8 = [];
        self.tookweaponfrom = [];
        thread _id_9B5E();
        self.currentweaponatspawn = undefined;
        self._id_9845 = undefined;
        thread _id_94A2();

        if ( !isdefined( self._id_89E4 ) )
            self._id_89E4 = spawnstruct();

        self._id_89E4.spawntime = gettime();
        self._id_89E4._id_2596 = 0;
        self._id_89E4._id_25AC = 0;
        self._id_89E4._id_126D = 0;
        var_0 = self._id_89E4.spawntime;

        if ( !isdefined( self._id_6282 ) )
            self._id_6282 = 0;

        self._id_6282++;

        if ( isagent( self ) )
            return;

        var_1 = 0.1;
        var_2 = var_1;
        var_3 = "_matchdata.gsc";
        var_4 = -1;
        var_5 = -1;
        var_6 = -1;

        if ( isdefined( self._id_89E4 ) )
        {
            if ( isdefined( self._id_89E4._id_89FD ) )
            {
                if ( isdefined( self._id_89E4._id_89FD._id_5188 ) )
                    var_4 = self._id_89E4._id_89FD._id_5188;

                if ( isdefined( self._id_89E4._id_89FD._id_6293 ) )
                    var_5 = self._id_89E4._id_89FD._id_6293;

                if ( isdefined( self._id_89E4._id_89FD.lastupdatetime ) )
                    var_6 = self._id_89E4._id_89FD.lastupdatetime;
            }
        }

        reconspatialevent( self.spawnpos, "script_mp_playerspawn: player_name %s, life_id %d, life_index %d, was_tactical_insertion %b, team %s, gameTime %d, version %f, script_file %s, randomSpawn %b, number_of_choices %d, last_update_time %d", self.name, self._id_56F7, self._id_6282, self.wasti, self.team, var_0, var_2, var_3, var_4, var_5, var_6 );
    }
}

_id_728B()
{
    self.pers["toggleScopeStates"] = [];
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == self.primaryweapon || var_2 == self.secondaryweapon )
        {
            var_3 = getweaponattachments( var_2 );

            foreach ( var_5 in var_3 )
            {
                if ( var_5 == "variablereddot" )
                {
                    self.pers["toggleScopeStates"][var_2] = self gethybridscopestate( var_2 );
                    break;
                }
            }
        }
    }
}

_id_A25D()
{
    maps\mp\_stinger::_id_8E5B();
}

_id_A263()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread _id_A25C();
    self.lastdroppableweapon = self.currentweaponatspawn;
    self.hitsthismag = [];
    var_0 = self getcurrentweapon();

    if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self.hitsthismag[var_0] ) )
        self.hitsthismag[var_0] = weaponclipsize( var_0 );

    self._id_173A = undefined;

    if ( issubstr( var_0, "ranger" ) )
        thread _id_A24F( var_0 );

    var_1 = 1;

    for (;;)
    {
        if ( !var_1 )
            self waittill( "weapon_change" );

        var_1 = 0;
        var_0 = self getcurrentweapon();

        if ( var_0 == "none" )
            continue;

        var_2 = getweaponattachments( var_0 );
        self.has_opticsthermal = 0;
        self.has_target_enhancer = 0;
        self.has_stock = 0;
        self.has_laser = 0;

        if ( isdefined( var_2 ) )
        {
            foreach ( var_4 in var_2 )
            {
                if ( var_4 == "opticstargetenhancer" )
                {
                    self.has_target_enhancer = 1;
                    continue;
                }

                if ( var_4 == "stock" )
                {
                    self.has_stock = 1;
                    continue;
                }

                if ( var_4 == "lasersight" )
                {
                    self.has_laser = 1;
                    continue;
                }

                if ( issubstr( var_4, "opticsthermal" ) )
                    self.has_opticsthermal = 1;
            }
        }

        if ( maps\mp\_utility::_id_50C9( var_0 ) )
            continue;

        var_6 = maps\mp\_utility::_id_416C( var_0 );
        self._id_173A = undefined;

        if ( issubstr( var_0, "ranger" ) )
            thread _id_A24F( var_0 );

        if ( var_6[0] == "alt" )
        {
            var_7 = getsubstr( var_0, 4 );
            var_0 = var_7;
            var_6 = maps\mp\_utility::_id_416C( var_0 );
        }

        if ( var_0 != "none" && var_6[0] != "iw5" && var_6[0] != "iw6" && var_6[0] != "h1" )
        {
            if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self.hitsthismag[var_0 + "_mp"] ) )
                self.hitsthismag[var_0 + "_mp"] = weaponclipsize( var_0 + "_mp" );
        }
        else if ( var_0 != "none" && ( var_6[0] == "iw5" || var_6[0] == "iw6" || var_6[0] == "h1" ) )
        {
            if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self.hitsthismag[var_0] ) )
                self.hitsthismag[var_0] = weaponclipsize( var_0 );
        }

        if ( _id_5A5E( var_0 ) )
            self.lastdroppableweapon = var_0;

        self.changingweapon = undefined;
    }
}

_id_A25C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self.changingweapon = undefined;

    for (;;)
    {
        self waittill( "weapon_switch_started", var_0 );
        self.changingweapon = var_0;

        if ( var_0 == "none" && isdefined( self._id_50D7 ) && self._id_50D7 )
        {
            while ( self._id_50D7 )
                wait 0.05;

            self.changingweapon = undefined;
        }
    }
}

_id_A264()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self getcurrentweapon();
        self._id_173A = undefined;

        if ( !issubstr( var_0, "ranger" ) )
            continue;

        thread _id_A24F( var_0 );
    }
}

_id_A24F( var_0 )
{
    var_1 = self getweaponammoclip( var_0, "right" );
    var_2 = self getweaponammoclip( var_0, "left" );
    self endon( "reload" );
    self endon( "weapon_change" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "weapon_fired", var_3 );

        if ( var_3 != var_0 )
            continue;

        self._id_173A = undefined;

        if ( issubstr( var_0, "akimbo" ) )
        {
            var_4 = self getweaponammoclip( var_0, "left" );
            var_5 = self getweaponammoclip( var_0, "right" );

            if ( var_2 != var_4 && var_1 != var_5 )
                self._id_173A = 1;

            if ( !var_4 || !var_5 )
                return;

            var_2 = var_4;
            var_1 = var_5;
            continue;
        }

        if ( var_1 == 2 && !self getweaponammoclip( var_0, "right" ) )
        {
            self._id_173A = 1;
            return;
        }
    }
}

_id_5A5E( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( issubstr( var_0, "uav" ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 0;

    if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_projectile" )
        return 0;

    var_1 = weaponinventorytype( var_0 );

    if ( var_1 != "primary" )
        return 0;

    if ( issubstr( var_0, "combatknife" ) || issubstr( var_0, "underwater" ) )
        return 0;

    return 1;
}

_id_2F99( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_51E3() )
        waitframe;

    if ( isdefined( level.blockweapondrops ) )
        return;

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.droppeddeathweapon ) )
        return;

    if ( level.ingraceperiod )
        return;

    var_2 = self.lastdroppableweapon;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "none" )
        return;

    if ( !self hasweapon( var_2 ) )
        return;

    if ( maps\mp\_utility::_id_5131() )
        return;

    if ( isdefined( level._id_3BF5 ) && !self [[ level._id_3BF5 ]]( var_2 ) )
        return;

    var_3 = maps\mp\_utility::_id_416C( var_2 );

    if ( var_3[0] == "alt" )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_4 > 0 && var_4 < 2 )
            {
                var_2 += var_3[var_4];
                continue;
            }

            if ( var_4 > 0 )
            {
                var_2 += ( "_" + var_3[var_4] );
                continue;
            }

            var_2 = "";
        }
    }

    if ( var_2 != "riotshield_mp" )
    {
        if ( !self anyammoforweaponmodes( var_2 ) )
            return;

        var_5 = self getweaponammoclip( var_2, "right" );
        var_6 = self getweaponammoclip( var_2, "left" );

        if ( !var_5 && !var_6 )
            return;

        var_7 = self getweaponammostock( var_2 );
        var_8 = weaponmaxammo( var_2 );

        if ( var_7 > var_8 )
            var_7 = var_8;

        var_9 = self dropitem( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        if ( maps\mp\_utility::_id_5150( var_1 ) )
            var_9.origin = ( var_9.origin[0], var_9.origin[1], var_9.origin[2] - 5 );

        var_9 itemweaponsetammo( var_5, var_7, var_6 );
    }
    else
    {
        var_9 = self dropitem( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        var_9 itemweaponsetammo( 1, 1, 0 );
    }

    var_9 itemweaponsetammo( 0, 0, 0, 1 );
    self.droppeddeathweapon = 1;
    var_9.owner = self;
    var_9._id_6638 = var_0;
    var_9.targetname = "dropped_weapon";
    var_9 thread _id_A249();
    var_9 thread _id_285D();
}

_id_2982( var_0, var_1 )
{
    var_2 = self getattachsize();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self getattachmodelname( var_3 );

        if ( var_4 != var_0 )
            continue;

        var_5 = self getattachtagname( var_3 );
        self detach( var_0, var_5 );

        if ( var_5 != var_1 )
        {
            var_2 = self getattachsize();

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                var_5 = self getattachtagname( var_3 );

                if ( var_5 != var_1 )
                    continue;

                var_0 = self getattachmodelname( var_3 );
                self detach( var_0, var_5 );
                break;
            }
        }

        return 1;
    }

    return 0;
}

_id_285D()
{
    self endon( "death" );
    wait 60;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_3FDC()
{
    var_0 = self.classname;
    var_1 = getsubstr( var_0, 7 );
    return var_1;
}

_id_A249()
{
    self endon( "death" );
    var_0 = _id_3FDC();
    var_1 = self.owner;

    for (;;)
    {
        self waittill( "trigger", var_2, var_3 );

        if ( isdefined( var_0 ) && var_0 == var_2.primaryweapon )
            return;

        if ( isdefined( var_0 ) && var_0 == var_2.secondaryweapon )
            return;

        var_2.tookweaponfrom[var_0] = undefined;
        var_2._id_93E8[var_0] = undefined;

        if ( isdefined( var_2.pers["weaponPickupsCount"] ) )
            var_2.pers["weaponPickupsCount"]++;

        if ( isdefined( var_1 ) && var_1 != var_2 )
        {
            var_2.tookweaponfrom[var_0] = var_1;

            if ( isdefined( self._id_6638 ) && self._id_6638 == var_2 )
                var_2._id_93E8[var_0] = var_1;
        }

        if ( isdefined( var_3 ) )
            break;
    }

    var_3.owner = var_2;
    var_3.targetname = "dropped_weapon";
    var_4 = var_3 _id_3FDC();

    if ( isdefined( var_2.primaryweapon ) && var_2.primaryweapon == var_4 )
        var_2.primaryweapon = var_0;

    if ( isdefined( var_2.secondaryweapon ) && var_2.secondaryweapon == var_4 )
        var_2.secondaryweapon = var_0;

    if ( isdefined( var_2.tookweaponfrom[var_4] ) )
    {
        var_3.owner = var_2.tookweaponfrom[var_4];
        var_2.tookweaponfrom[var_4] = undefined;
    }

    if ( isdefined( var_2._id_93E8[var_4] ) )
    {
        var_3._id_6638 = var_2;
        var_2._id_93E8[var_4] = undefined;
    }

    var_3 thread _id_A249();
}

_id_520C()
{
    var_0 = _id_3FDC();
    var_1 = weaponaltweaponname( var_0 );

    for ( var_2 = 1; var_1 != "none" && var_1 != var_0; var_2++ )
    {
        self itemweaponsetammo( 0, 0, 0, var_2 );
        var_1 = weaponaltweaponname( var_1 );
    }
}

_id_467D( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_1 );
    var_1 notify( "scavenger_pickup" );
    var_2 = var_1 getweaponslistoffhands();

    foreach ( var_4 in var_2 )
    {
        if ( maps\mp\gametypes\_class::_id_51F2( var_4 ) && var_1 maps\mp\_utility::_hasperk( "specialty_tacticalresupply" ) )
        {
            var_1 _meth_84a0( var_4 );
            continue;
        }

        if ( maps\mp\gametypes\_class::_id_51EA( var_4 ) && var_1 maps\mp\_utility::_hasperk( "specialty_lethalresupply" ) )
        {
            var_5 = var_1 getweaponammoclip( var_4 );
            var_1 setweaponammoclip( var_4, var_5 + 1 );
        }
    }

    if ( var_1 maps\mp\_utility::_hasperk( "specialty_scavenger" ) )
    {
        var_7 = var_1 getweaponslistprimaries();

        foreach ( var_9 in var_7 )
        {
            if ( maps\mp\_utility::_id_50D1( var_9 ) || level.scavenger_secondary && maps\mp\_utility::_id_50D2( var_9 ) )
            {
                var_10 = var_1 getweaponammostock( var_9 );
                var_11 = 0;
                var_12 = maps\mp\_utility::getweaponclass( var_9 );

                if ( isbeamweapon( var_9 ) || var_12 == "weapon_riot" || issubstr( var_9, "riotshield" ) )
                {

                }
                else if ( var_12 == "weapon_projectile" )
                {
                    if ( var_1 maps\mp\_utility::_hasperk( "specialty_explosiveammoresupply" ) )
                        var_11 = weaponclipsize( var_9 );
                }
                else if ( issubstr( var_9, "alt" ) && issubstr( var_9, "gl" ) )
                {
                    if ( var_1 maps\mp\_utility::_hasperk( "specialty_explosiveammoresupply" ) )
                        var_11 = weaponclipsize( var_9 );
                }
                else if ( _id_50CE( var_9 ) )
                {
                    if ( var_1 maps\mp\_utility::_hasperk( "specialty_bulletresupply" ) )
                    {
                        var_13 = weaponmaxammo( var_9 );
                        var_11 = int( var_13 * var_1._id_0B7B );
                    }
                }

                if ( var_11 > 0 )
                    var_1 setweaponammostock( var_9, var_10 + var_11 );
            }
        }
    }

    var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "scavenger" );
}

_id_2F90( var_0 )
{
    waitframe;

    if ( level.ingraceperiod )
        return;

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == self )
        return;

    if ( level.iszombiegame )
        return;

    if ( !isdefined( self._id_08A2 ) )
        var_1 = self dropscavengerbag( "scavenger_bag_mp" );
    else
        var_1 = self._id_08A2 dropscavengerbag( "scavenger_bag_mp" );

    var_1 thread _id_467D( self );

    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_add_scavenger_bag"] ) )
        [[ level.bot_funcs["bots_add_scavenger_bag"] ]]( var_1 );
}

_id_4164( var_0 )
{
    return 2;
}

_id_4165( var_0 )
{
    return 1;
}

_id_3FA1()
{
    var_0 = "h1_fraggrenade_mp";
    var_1 = self getammocount( var_0 );
    return var_1;
}

_id_40CC()
{
    var_0 = "h1_smokegrenade_mp";
    var_1 = self getammocount( var_0 );
    return var_1;
}

_id_8356( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_gamelogic::_id_8356( var_0, var_1, var_2 );
}

_id_A265( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        self.lastshotfiredtime = gettime();

        if ( isai( self ) )
            continue;

        if ( !maps\mp\_utility::_id_50D1( var_1 ) && !maps\mp\_utility::_id_50D2( var_1 ) && !maps\mp\_utility::iscacmeleeweapon( var_1 ) )
            continue;

        if ( isdefined( self.hitsthismag[var_1] ) )
            thread _id_9B32( var_1 );

        var_2 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" ) + 1;
        var_3 = maps\mp\gametypes\_persistence::_id_8D69( "hits" );
        var_4 = clamp( float( var_3 ) / float( var_2 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "totalShots", var_2 );
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", int( var_4 ) );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", int( var_2 - var_3 ) );

        if ( isdefined( self._id_55EC ) && self._id_55EC._id_55F1 == gettime() )
        {
            self.hits = 0;
            return;
        }

        var_5 = 1;
        _id_8356( var_1, var_5, "shots" );
        _id_8356( var_1, self.hits, "hits" );
        self.hits = 0;
    }
}

_id_9B32( var_0 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "updateMagShots_" + var_0 );
    self.hitsthismag[var_0]--;
    wait 0.05;
    self.hitsthismag[var_0] = weaponclipsize( var_0 );
}

_id_1D0F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "updateMagShots_" + var_0 );
    waitframe;

    if ( isdefined( self.hitsthismag[var_0] ) && self.hitsthismag[var_0] == 0 )
    {
        var_1 = maps\mp\_utility::getweaponclass( var_0 );
        maps\mp\gametypes\_misions::_id_3CAA( var_1 );
        self.hitsthismag[var_0] = weaponclipsize( var_0 );
    }
}

_id_1D0E( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( maps\mp\_utility::_id_51BA( var_0, "alt_" ) )
    {
        var_2 = maps\mp\_utility::_id_416C( var_0 );

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == "shotgun" )
            {
                var_5 = getsubstr( var_0, 0, 4 );

                if ( !_id_5185( var_5 ) && !_id_51A7( var_5 ) )
                    self.hits = 1;

                continue;
            }

            if ( var_4 == "hybrid" )
            {
                var_6 = getsubstr( var_0, 4 );
                var_0 = var_6;
            }
        }
    }

    var_8 = ismeleeinventoryweapon( var_0 );

    if ( !_id_5185( var_0 ) && !_id_51A7( var_0 ) && !var_8 )
        return;

    if ( self meleebuttonpressed() && !var_8 )
        return;

    switch ( weaponclass( var_0 ) )
    {
        case "rifle":
        case "smg":
        case "mg":
        case "pistol":
        case "sniper":
            self.hits++;
            break;
        case "spread":
            self.hits = 1;
            break;
        default:
            break;
    }

    if ( issubstr( var_0, "riotshield" ) )
    {
        thread maps\mp\gametypes\_gamelogic::_id_9315( "riotshield", self.hits, "hits" );
        self.hits = 0;
    }

    waitframe;

    if ( isdefined( self.hitsthismag[var_0] ) )
        thread _id_1D0F( var_0 );

    if ( !isdefined( self.lasthittime[var_0] ) )
        self.lasthittime[var_0] = 0;

    if ( self.lasthittime[var_0] == gettime() )
        return;

    self.lasthittime[var_0] = gettime();
    var_9 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" );
    var_10 = maps\mp\gametypes\_persistence::_id_8D69( "hits" ) + 1;

    if ( var_10 <= var_9 )
    {
        maps\mp\gametypes\_persistence::_id_8D79( "hits", var_10 );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", int( var_9 - var_10 ) );
        var_11 = clamp( float( var_10 ) / float( var_9 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", int( var_11 ) );
    }
}

_id_0E2B( var_0, var_1 )
{
    return _id_3AA6( var_1, var_0 );
}

_id_3AA6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( !level.teambased )
        return 1;

    var_3 = var_1.team;
    var_4 = level.friendlyfire;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 != 0 )
        return 1;

    if ( var_1 == var_0 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 != var_0.team )
        return 1;

    return 0;
}

_id_A232()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.throwinggrenade = undefined;
    self.gotpullbacknotify = 0;

    if ( maps\mp\_utility::_id_3FDB( "scr_deleteexplosivesonspawn", 1 ) == 1 )
    {
        if ( isdefined( self.dont_delete_grenades_on_next_spawn ) )
            self.dont_delete_grenades_on_next_spawn = undefined;
        else
            _id_27F9();
    }
    else
    {
        if ( !isdefined( self.plantedlethalequip ) )
            self.plantedlethalequip = [];

        if ( !isdefined( self._id_1E43 ) )
            self._id_1E43 = [];

        if ( !isdefined( self._id_1756 ) )
            self._id_1756 = [];
    }

    thread _id_A23B();
    thread _id_A239();
    thread _id_A238();
    thread _id_A208();
    thread _id_A20A();
    thread _id_2847();
    thread _id_A22C();

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );
        _id_8356( var_0, 1, "shots" );
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        thread _id_A242();

        if ( var_0 == "h1_claymore_mp" )
            continue;

        self.throwinggrenade = var_0;
        self.gotpullbacknotify = 1;

        if ( var_0 == "h1_c4_mp" )
            _id_1397();
        else
            _id_139C();

        self.throwinggrenade = undefined;
    }
}

_id_139C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "offhand_end" );
    self endon( "weapon_change" );
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = maps\mp\_utility::strip_suffix( var_2, "_lefthand" );

        if ( gettime() - var_0 > 1000 && var_3 == "h1_fraggrenade_mp" )
            var_1.iscooked = 1;

        self.changingweapon = undefined;
        var_1.owner = self;
        var_1._id_A2DF = var_2;

        switch ( var_3 )
        {
            case "h1_fraggrenade_mp":
                var_1 thread maps\mp\gametypes\_shellshock::_id_43E9();
                var_1._id_65A3 = self;
                break;
        }
    }
}

_id_A242()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "grenade_fire" );
    self waittill( "offhand_end" );

    if ( isdefined( self.changingweapon ) && self.changingweapon != self getcurrentweapon() )
        self.changingweapon = undefined;
}

_id_A25B()
{
    level endon( "smokeTimesUp" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self waittill( "explode", var_1 );
    var_2 = 128;
    var_3 = 8;
    level thread _id_A05C( var_3, var_2, var_1 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        foreach ( var_5 in level.players )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( level.teambased && var_5.team == var_0.team )
                continue;

            if ( distancesquared( var_5.origin, var_1 ) < var_2 * var_2 )
            {
                var_5.inplayersmokescreen = var_0;
                continue;
            }

            var_5.inplayersmokescreen = undefined;
        }

        wait 0.05;
    }
}

_id_A05C( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    level notify( "smokeTimesUp" );
    waitframe;

    foreach ( var_4 in level.players )
    {
        if ( isdefined( var_4 ) )
            var_4.inplayersmokescreen = undefined;
    }
}

_id_A240()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );
        var_2 = [ var_0 ];

        if ( issubstr( var_1, "_gl" ) )
        {
            var_0.owner = self;
            var_0.primaryweapon = self getcurrentprimaryweapon();
            var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
        }

        if ( isdefined( var_0 ) )
        {
            var_0._id_A2DF = var_1;

            if ( isprimaryorsecondaryprojectileweapon( var_1 ) )
                var_0.firedads = self playerads();
        }

        switch ( var_1 )
        {
            case "stinger_mp":
            case "iw5_lsr_mp":
                var_0._id_580F = self.stingertarget;
                level notify( "stinger_fired", self, var_2 );
                thread maps\mp\_utility::_id_7F1F( var_0, "tag_origin", 65 );
                break;
            default:
                break;
        }

        switch ( var_1 )
        {
            case "rpg_mp":
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
                var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
            default:
                continue;
        }
    }
}

_id_A234()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "hit_by_missile", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
            continue;

        if ( level.teambased && self.team == var_0.team )
        {
            self _meth_83f6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( var_2 != "rpg_mp" )
        {
            self _meth_83f6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( randomintrange( 0, 100 ) < 99 )
        {
            self _meth_83f6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        var_8 = getdvarfloat( "rocket_corpse_max_air_time", 0.5 );
        var_9 = getdvarfloat( "rocket_corpse_view_offset_up", 100 );
        var_10 = getdvarfloat( "rocket_corpse_view_offset_forward", 35 );
        self.isrocketcorpse = 1;
        self setcontents( 0 );
        var_11 = self setrocketcorpse( 1 );
        var_12 = var_11 / 1000.0;
        self._id_534D = spawn( "script_model", var_1.origin );
        self._id_534D.angles = var_1.angles;
        self._id_534D linkto( var_1 );
        self._id_534D setscriptmoverkillcam( "rocket_corpse" );
        self._id_534D setcontents( 0 );
        self dodamage( 1000, self.origin, var_0, var_1 );
        self.body = self cloneplayer( var_11 );
        self.body.origin = var_1.origin;
        self.body.angles = var_1.angles;
        self.body setcorpsefalling( 0 );
        self.body enablelinkto();
        self.body linkto( var_1 );
        self.body setcontents( 0 );

        if ( !isdefined( self.switching_teams ) )
            thread maps\mp\gametypes\_deathicons::_id_07DE( self.body, self, self.team, 5.0, 0 );

        self playerhide();
        var_13 = vectornormalize( anglestoup( var_1.angles ) );
        var_14 = vectornormalize( anglestoforward( var_1.angles ) );
        var_15 = var_14 * var_9 + var_13 * var_10;
        var_16 = var_1.origin + var_15;
        var_17 = spawn( "script_model", var_16 );
        var_17 setmodel( "tag_origin" );
        var_17.angles = vectortoangles( var_1.origin - var_17.origin );
        var_17 linkto( var_1 );
        var_17 setcontents( 0 );
        self cameralinkto( var_17, "tag_origin" );

        if ( var_8 > var_12 )
            var_8 = var_12;

        var_18 = var_1 common_scripts\utility::_id_A0A2( "death", var_8 );

        if ( isdefined( var_18 ) && var_18 == "timeout" && isdefined( var_1 ) )
            var_1 detonate();

        self notify( "final_rocket_corpse_death" );
        self.body unlink();
        self.body setcorpsefalling( 1 );
        self.body startragdoll();
        var_17 linkto( self.body );
        self.isrocketcorpse = undefined;
        self waittill( "death_delay_finished" );
        self cameraunlink();
        self._id_534D delete();
        var_17 delete();
    }
}

_id_A257()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sentry_placement_finished", var_0 );
        thread maps\mp\_utility::_id_7F1F( var_0, "tag_flash", 65 );
    }
}

_id_3085()
{
    thread maps\mp\gametypes\_shellshock::_id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    var_1 = _id_3F7A( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.owner ) && !_id_3AA6( self.owner, var_3.owner ) )
            continue;

        var_3 notify( "emp_damage", self.owner, 8.0 );
    }
}

_id_60EC()
{
    thread maps\mp\gametypes\_shellshock::_id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    level thread _id_2D03( var_0, self.owner );
    var_1 = _id_3F7A( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.owner ) && !_id_3AA6( self.owner, var_3.owner ) )
            continue;

        var_3 notify( "emp_damage", self.owner, 8.0 );
    }
}

_id_38AA( var_0, var_1, var_2 )
{
    var_3 = 640000;
    var_4 = 40000;
    var_5 = 60;
    var_6 = 40;
    var_7 = 11;

    if ( !maps\mp\_utility::_id_5189( var_0 ) || var_0.sessionstate != "playing" )
        return;

    var_8 = distancesquared( var_1, var_0.origin );

    if ( var_8 > var_3 )
        return;

    if ( var_8 <= var_4 )
        var_9 = 1.0;
    else
        var_9 = 1.0 - ( var_8 - var_4 ) / ( var_3 - var_4 );

    var_10 = var_0 _meth_81db( var_1 );

    if ( var_10 < 0.5 )
        return;

    var_11 = anglestoforward( var_0 getplayerangles() );
    var_12 = var_0.origin;

    switch ( var_0 getstance() )
    {
        case "stand":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_5 );
            break;
        case "crouch":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_6 );
            break;
        case "prone":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_7 );
            break;
    }

    var_13 = var_1 - var_12;
    var_13 = vectornormalize( var_13 );
    var_14 = 0.5 * ( 1.0 + vectordot( var_11, var_13 ) );
    var_0 notify( "flashbang", var_1, var_9, var_14, var_2 );
}

_id_2D03( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( var_3 > 0 )
        {
            playsoundatpos( var_0, "null" );

            foreach ( var_5 in level.players )
                _id_38AA( var_5, var_0, var_1 );
        }

        var_7 = _id_3F7A( var_0, 512, 0 );

        foreach ( var_9 in var_7 )
        {
            if ( isdefined( var_9.owner ) && !_id_3AA6( self.owner, var_9.owner ) )
                continue;

            var_9 notify( "emp_damage", self.owner, 8.0 );
        }

        wait(randomfloatrange( 0.25, 0.5 ));
    }
}

_id_1397()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::_id_A069( "grenade_fire", "weapon_change", "offhand_end" );
    self.changingweapon = undefined;
}

_id_A22C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( self.gotpullbacknotify )
        {
            self.gotpullbacknotify = 0;
            continue;
        }

        if ( !issubstr( var_1, "h1_frag" ) )
            continue;

        var_0._id_9337 = 1;
        var_0._id_65A3 = self;
        var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
    }
}

_id_5978( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3[0] ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_A23B()
{
    self endon( "spawned_player" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = isweaponmanuallydetonatedbyemptythrow( var_1 );
        var_3 = isweaponmanuallydetonatedbydoubletap( var_1 );

        if ( var_2 || var_3 )
        {
            if ( !self.plantedlethalequip.size )
                thread _id_A23A();

            if ( self.plantedlethalequip.size )
            {
                self.plantedlethalequip = _id_5978( self.plantedlethalequip );

                if ( self.plantedlethalequip.size >= level.maxperplayerexplosives )
                    self.plantedlethalequip[0][0] detonate();
            }

            var_4 = self.plantedlethalequip.size;
            self.plantedlethalequip[var_4] = [];
            self.plantedlethalequip[var_4][0] = var_0;
            self.plantedlethalequip[var_4][1] = var_2;
            self.plantedlethalequip[var_4][2] = var_3;

            if ( isdefined( var_0 ) )
            {
                var_0.owner = self;
                var_0 setotherent( self );
                var_0.team = self.team;
                var_0._id_A2DF = var_1;
                var_0._id_8F74 = 0;
            }
        }
    }
}

_id_A208()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" || var_1 == "h1_c4_mp" )
        {
            level._id_5C5D[level._id_5C5D.size] = var_0;
            var_0 thread maps\mp\gametypes\_shellshock::_id_196B();
            var_0 thread _id_196E( var_1 );
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_A207();
        }
    }
}

_id_A207()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    self.trigger = spawn( "script_origin", self.origin );
    self.trigger.owner = self;
    _id_5941();
    thread _id_6A35();
}

_id_6A35()
{
    var_0 = self gettagorigin( "tag_fx" );
    var_1 = self gettagangles( "tag_fx" );
    var_2 = spawnlinkedfx( level.c4fxid, self, "tag_fx" );
    triggerfx( var_2 );
    self waittill( "death" );
    var_2 delete();
}

_id_1972()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( common_scripts\utility::_id_3FA8( "sentry_explode_mp" ), self, "tag_origin" );
        self.disabled = 1;
        self notify( "disabled" );
        wait(var_1);
        self.disabled = undefined;
        self notify( "enabled" );
    }
}

_id_1973()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "emp_update" );
        self.disabled = undefined;
        self notify( "enabled" );
    }
}

_id_7FAB( var_0 )
{
    if ( !maps\mp\_utility::_id_4FA6() )
    {
        self endon( "death" );
        wait 0.05;

        if ( level.teambased )
            maps\mp\_entityheadicons::_id_8028( var_0, ( 0.0, 0.0, 20.0 ) );
        else if ( isdefined( self.owner ) )
            maps\mp\_entityheadicons::_id_7FE5( self.owner, ( 0.0, 0.0, 20.0 ) );
    }
}

_id_A20A()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self._id_1E43 = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "h1_claymore_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            self._id_1E43 = common_scripts\utility::_id_0D01( self._id_1E43 );

            if ( self._id_1E43.size >= level.maxperplayerexplosives )
            {
                if ( !maps\mp\_utility::_id_4FA6() )
                    _id_284F( self._id_1E43[0] );
                else
                    self._id_1E43[0] detonate();
            }

            self._id_1E43[self._id_1E43.size] = var_0;
            var_0.owner = self;
            var_0 setotherent( self );
            var_0.team = self.team;
            var_0._id_A2DF = var_1;
            var_0.trigger = spawn( "script_origin", var_0.origin );
            var_0.trigger.owner = var_0;
            var_0._id_8F74 = 0;
            var_0 _id_5941();
            level._id_5C5D[level._id_5C5D.size] = var_0;
            var_0 thread _id_196E( var_1 );
            var_0 thread handleclaymoreeffects();
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_1E48();
            var_0 thread _id_7FAB( self.pers["team"] );
            self.changingweapon = undefined;
        }
    }
}

handleclaymoreeffects()
{
    self endon( "death" );
    wait 0.15;
    thread _id_6A36();
}

_id_6A36()
{
    var_0 = self gettagorigin( "tag_fx" );
    var_1 = self gettagangles( "tag_fx" );
    var_2 = spawnfx( level.claymorefxid, var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    triggerfx( var_2 );
    self waittill( "death" );
    var_2 delete();
}

_id_3349( var_0 )
{
    self notify( "equipmentWatchUse" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "equipmentWatchUse" );
    self endon( "change_owner" );
    self.trigger setcursorhint( "HINT_NOICON" );

    if ( self._id_A2DF == "h1_c4_mp" )
        self.trigger sethintstring( &"MP_PICKUP_C4" );
    else if ( self._id_A2DF == "h1_claymore_mp" )
        self.trigger sethintstring( &"MP_PICKUP_CLAYMORE" );
    else if ( self._id_A2DF == "bouncingbetty_mp" )
        self.trigger sethintstring( &"MP_PICKUP_BOUNCING_BETTY" );

    self.trigger maps\mp\_utility::_id_8005( var_0 );
}

_id_3347( var_0 )
{
    self.trigger sethintstring( "" );
    self.trigger maps\mp\_utility::_id_8004();
}

_id_334C( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = 1;

    for (;;)
    {
        if ( var_0 getweaponammostock( self._id_A2DF ) < weaponmaxammo( self._id_A2DF ) )
        {
            if ( !var_1 )
            {
                _id_3349( var_0 );
                var_1 = 1;
            }
        }
        else if ( var_1 )
        {
            _id_3347( var_0 );
            var_1 = 0;
        }

        wait 0.05;
    }
}

_id_334D( var_0, var_1 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    self.trigger setcursorhint( "HINT_NOICON" );
    _id_3349( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        thread _id_9B90();

    for (;;)
    {
        thread _id_334C( var_0 );
        self.trigger waittill( "trigger", var_0 );
        var_2 = var_0 getweaponammostock( self._id_A2DF );

        if ( var_2 < weaponmaxammo( self._id_A2DF ) )
        {
            var_0 playlocalsound( "scavenger_pack_pickup" );
            var_0 setweaponammostock( self._id_A2DF, var_2 + 1 );
            self.trigger delete();
            self delete();
            self notify( "death" );
        }
    }
}

_id_9B90()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) && isdefined( self.trigger ) )
        {
            self.trigger.origin = self.origin;

            if ( isdefined( self._id_154E ) )
                self._id_154E.origin = self.origin;
        }
        else
            return;

        wait 0.05;
    }
}

_id_1E48()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = spawn( "trigger_radius", self.origin + ( 0, 0, 0 - level.claymoredetonateradius ), 0, level.claymoredetonateradius, level.claymoredetonateradius * 2 );
    thread _id_285A( var_0 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F74 )
        {
            wait 0.05;
            continue;
        }

        if ( getdvarint( "scr_claymoredebug" ) != 1 )
        {
            if ( isdefined( self.owner ) )
            {
                if ( var_1 == self.owner )
                    continue;

                if ( isdefined( var_1.owner ) && var_1.owner == self.owner )
                    continue;
            }

            if ( !_id_3AA6( self.owner, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 getentityvelocity() ) < 10 )
            continue;

        var_2 = abs( var_1.origin[2] - self.origin[2] );

        if ( var_2 > 128 )
            continue;

        if ( !var_1 _id_8482( self ) )
            continue;

        if ( var_1 damageconetrace( self.origin, self ) > 0 )
            break;
    }

    self playsound( "claymore_activated" );

    if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_claymore" );
        wait(level.delayminetime);
    }
    else
        wait(level.claymoredetectiongraceperiod);

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    if ( isdefined( self.owner ) && isdefined( level._id_5656 ) )
        self.owner thread [[ level._id_5656 ]]( "claymore_destroyed", undefined, undefined, self.origin );

    self detonate();
}

_id_8482( var_0 )
{
    if ( isdefined( var_0.disabled ) )
        return 0;

    var_1 = self.origin + ( 0.0, 0.0, 32.0 );
    var_2 = var_1 - var_0.origin;
    var_3 = anglestoforward( var_0.angles );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 < level.claymoredetectionmindist )
        return 0;

    var_2 = vectornormalize( var_2 );
    var_5 = vectordot( var_2, var_3 );
    return var_5 > level.claymoredetectiondot;
}

_id_285A( var_0 )
{
    self waittill( "death" );
    wait 0.05;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.trigger ) )
            var_0.trigger delete();

        var_0 delete();
    }
}

_id_284F( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.trigger ) )
            var_0.trigger delete();

        var_0 delete();
    }
}

_id_A23A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "all_detonated" );
    level endon( "game_ended" );
    self endon( "change_owner" );
    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = 0;

            while ( self usebuttonpressed() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self usebuttonpressed() && var_0 < 0.35 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.35 )
                continue;

            if ( !self.plantedlethalequip.size )
                return;

            self notify( "detonate_double_tap" );
        }

        wait 0.05;
    }
}

_id_A239()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate" );
        _id_5977( 1 );
    }
}

_id_A238()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate_double_tap" );
        var_0 = self getcurrentweapon();

        if ( !isweaponmanuallydetonatedbydoubletap( var_0 ) )
            _id_5977( 2 );
    }
}

_id_5977( var_0 )
{
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < self.plantedlethalequip.size; var_3++ )
    {
        if ( !self.plantedlethalequip[var_3][var_0] )
        {
            var_1 = 1;
            continue;
        }

        var_4 = self.plantedlethalequip[var_3][0];

        if ( isdefined( var_4 ) )
        {
            if ( var_4._id_8F74 )
            {
                var_1 = 1;
                return;
            }

            if ( isdefined( var_4._id_A2DF ) && !self _meth_84c0( var_4._id_A2DF ) )
            {
                var_1 = 1;
                continue;
            }

            if ( isdefined( var_4._id_597A ) )
            {
                self thread [[ var_4._id_597A ]]( var_4 );
                continue;
            }

            var_4 thread _id_A006( 0, var_0 );
        }
    }

    if ( var_1 )
        self.plantedlethalequip = _id_5978( self.plantedlethalequip );
    else
    {
        self.plantedlethalequip = var_2;
        self notify( "all_detonated" );
    }
}

_id_A006( var_0, var_1 )
{
    self endon( "death" );
    wait(var_0);
    _id_A0D8();

    if ( var_1 == 2 )
        self _meth_8519();
    else
        self detonate();

    level._id_5C5D = common_scripts\utility::_id_0D01( level._id_5C5D );
}

_id_2847()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self waittill( "disconnect" );
    var_0 = self.plantedlethalequip;
    var_1 = self._id_1E43;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2][0] ) )
            var_0[var_2][0] delete();
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

_id_196E( var_0 )
{
    self endon( "death" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_1 = undefined;

    for (;;)
    {
        self waittill( "damage", var_2, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !isplayer( var_1 ) && !isagent( var_1 ) )
            continue;

        if ( !_id_3AA6( self.owner, var_1 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            var_11 = maps\mp\_utility::strip_suffix( var_10, "_lefthand" );

            switch ( var_11 )
            {
                case "h1_smokegrenade_mp":
                case "h1_concussiongrenade_mp":
                case "h1_flashgrenade_mp":
                    continue;
            }
        }

        break;
    }

    if ( level.c4explodethisframe )
        wait(0.1 + randomfloat( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level.c4explodethisframe = 1;
    thread _id_7447();

    if ( isdefined( var_5 ) && ( issubstr( var_5, "MOD_GRENADE" ) || issubstr( var_5, "MOD_EXPLOSIVE" ) ) )
        self.waschained = 1;

    if ( isdefined( var_9 ) && var_9 & level._id_4B5C )
        self.wasdamagedfrombulletpenetration = 1;

    self.wasdamaged = 1;

    if ( isplayer( var_1 ) )
        var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "c4" );

    var_12 = 0;

    if ( level.teambased )
    {
        if ( isdefined( var_1 ) && isdefined( self.owner ) )
        {
            var_13 = var_1.pers["team"];
            var_14 = self.owner.pers["team"];

            if ( isdefined( var_13 ) && isdefined( var_14 ) && var_13 != var_14 )
                var_12 = 1;
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_1 ) && var_1 != self.owner )
        var_12 = 1;

    if ( var_12 )
    {
        var_1 notify( "destroyed_explosive" );

        switch ( var_0 )
        {
            case "claymore":
            case "h1_claymore_mp":
                level thread maps\mp\gametypes\_rank::_id_1208( "destroyed_claymore", var_1, var_10, undefined, var_5 );
                break;
            case "c4":
            case "h1_c4_mp":
                level thread maps\mp\gametypes\_rank::_id_1208( "destroyed_c4", var_1, var_10, undefined, var_5 );
                break;
        }
    }

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self detonate( var_1 );
}

_id_7447()
{
    wait 0.05;
    level.c4explodethisframe = 0;
}

_id_7823( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_A0D8()
{
    if ( !isdefined( self.disabled ) )
        return;

    self waittill( "enabled" );
}

_id_5941( var_0 )
{
    common_scripts\utility::_id_5923( self.owner.team );

    if ( !isdefined( var_0 ) || !var_0 )
        self _meth_8386();

    if ( issentient( self ) )
        self setthreatbiasgroup( "DogsDontAttack" );
}

_id_82FF()
{
    self.bombsquadids = [];

    if ( self.detectexplosives && !self.bombsquadicons.size )
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            self.bombsquadicons[var_0] = newclienthudelem( self );
            self.bombsquadicons[var_0].x = 0;
            self.bombsquadicons[var_0].y = 0;
            self.bombsquadicons[var_0].z = 0;
            self.bombsquadicons[var_0].alpha = 0;
            self.bombsquadicons[var_0].archived = 1;
            self.bombsquadicons[var_0] setshader( "waypoint_bombsquad", 14, 14 );
            self.bombsquadicons[var_0] setwaypoint( 0, 0 );
            self.bombsquadicons[var_0].detectid = "";
        }
    }
    else if ( !self.detectexplosives )
    {
        for ( var_0 = 0; var_0 < self.bombsquadicons.size; var_0++ )
            self.bombsquadicons[var_0] destroy();

        self.bombsquadicons = [];
    }
}

_id_8512( var_0 )
{
    var_1 = var_0.detectid;
    var_2 = -1;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = self.bombsquadicons[var_3].detectid;

        if ( var_4 == var_1 )
            return;

        if ( var_4 == "" )
            var_2 = var_3;
    }

    if ( var_2 < 0 )
        return;

    self.bombsquadids[var_1] = 1;
    self.bombsquadicons[var_2].x = var_0.origin[0];
    self.bombsquadicons[var_2].y = var_0.origin[1];
    self.bombsquadicons[var_2].z = var_0.origin[2] + 24 + 128;
    self.bombsquadicons[var_2] fadeovertime( 0.25 );
    self.bombsquadicons[var_2].alpha = 1;
    self.bombsquadicons[var_2].detectid = var_0.detectid;

    while ( isalive( self ) && isdefined( var_0 ) && self istouching( var_0 ) )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    self.bombsquadicons[var_2].detectid = "";
    self.bombsquadicons[var_2] fadeovertime( 0.25 );
    self.bombsquadicons[var_2].alpha = 0;
    self.bombsquadids[var_1] = undefined;
}

_id_3F48( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    var_6 = level.players;

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( !isalive( var_6[var_7] ) || var_6[var_7].sessionstate != "playing" )
            continue;

        var_8 = maps\mp\_utility::_id_3D28( var_6[var_7] );
        var_9 = distancesquared( var_0, var_8 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_6[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D27( var_6[var_7], var_8 );
    }

    var_10 = getentarray( "grenade", "classname" );

    for ( var_7 = 0; var_7 < var_10.size; var_7++ )
    {
        var_11 = maps\mp\_utility::_id_3D25( var_10[var_7] );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_10[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D24( var_10[var_7], var_11 );
    }

    var_12 = getentarray( "destructible", "targetname" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        var_11 = var_12[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_12[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5175 = 0;
            var_13._id_50A8 = 0;
            var_13.entity = var_12[var_7];
            var_13._id_258F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_14 = getentarray( "destructable", "targetname" );

    for ( var_7 = 0; var_7 < var_14.size; var_7++ )
    {
        var_11 = var_14[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_14[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5175 = 0;
            var_13._id_50A8 = 1;
            var_13.entity = var_14[var_7];
            var_13._id_258F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_15 = getentarray( "misc_turret", "classname" );

    foreach ( var_17 in var_15 )
    {
        var_11 = var_17.origin + ( 0.0, 0.0, 32.0 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_17 ) ) )
        {
            switch ( var_17.model )
            {
                case "mp_remote_turret":
                    var_4[var_4.size] = maps\mp\_utility::_id_3D29( var_17, var_11 );
                    continue;
            }
        }
    }

    var_19 = getentarray( "script_model", "classname" );

    foreach ( var_21 in var_19 )
    {
        if ( var_21.model != "projectile_bouncing_betty_grenade" && var_21.model != "ims_scorpion_body" )
            continue;

        var_11 = var_21.origin + ( 0.0, 0.0, 32.0 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_21 ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D26( var_21, var_11 );
    }

    return var_4;
}

_id_3F7A( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = getentarray( "grenade", "classname" );

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7.origin;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_7 ) ) )
            var_4[var_4.size] = var_7;
    }

    var_11 = getentarray( "misc_turret", "classname" );

    foreach ( var_13 in var_11 )
    {
        var_8 = var_13.origin;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_13 ) ) )
            var_4[var_4.size] = var_13;
    }

    return var_4;
}

_id_A2D6( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( lengthsquared( var_5 ) < var_2 * var_2 )
        return 1;

    var_6 = vectornormalize( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = bullettrace( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 || getdvarint( "scr_debugMines" ) != 0 )
    {
        thread _id_2731( var_0, ".dmg" );

        if ( isdefined( var_3 ) )
            thread _id_2731( var_1, "." + var_3.classname );
        else
            thread _id_2731( var_1, ".undefined" );

        if ( var_7["fraction"] == 1 )
            thread _id_2729( var_4, var_1, ( 1.0, 1.0, 1.0 ) );
        else
        {
            thread _id_2729( var_4, var_7["position"], ( 1.0, 0.9, 0.8 ) );
            thread _id_2729( var_7["position"], var_1, ( 1.0, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_259B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_5175 )
    {
        self._id_25A8 = var_5;
        self.entity thread [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_50A8 && ( var_4 == "artillery_mp" || var_4 == "h1_claymore_mp" ) )
            return;

        self.entity notify( "damage", var_2, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "MOD_EXPLOSIVE", "", "", "", undefined, var_4 );
    }
}

_id_2729( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_271F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 16;

    var_4 = 360 / var_3;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_7 = var_4 * var_6;
        var_8 = cos( var_7 ) * var_1;
        var_9 = sin( var_7 ) * var_1;
        var_10 = var_0[0] + var_8;
        var_11 = var_0[1] + var_9;
        var_12 = var_0[2];
        var_5[var_5.size] = ( var_10, var_11, var_12 );
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_13 = var_5[var_6];

        if ( var_6 + 1 >= var_5.size )
            var_14 = var_5[0];
        else
            var_14 = var_5[var_6 + 1];

        thread _id_2729( var_13, var_14, var_2 );
    }
}

_id_2731( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 600; var_2++ )
        wait 0.05;
}

_id_64FD( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_5 = 700;
    var_6 = 25;
    var_7 = var_5 * var_5;
    var_8 = var_6 * var_6;
    var_9 = 60;
    var_10 = 40;
    var_11 = 11;

    if ( issubstr( var_1, "_uts19_" ) )
        thread _id_9C40( var_0 );
    else
    {
        var_12 = maps\mp\_utility::strip_suffix( var_1, "_lefthand" );

        switch ( var_12 )
        {
            case "h1_concussiongrenade_mp":
                if ( !isdefined( var_0 ) )
                    return;

                if ( maps\mp\_utility::_id_5092( self.concussionimmune ) )
                    return;

                var_13 = 1;

                if ( isdefined( var_0.owner ) && var_0.owner == var_4 )
                    var_13 = 0;

                var_14 = 512;
                var_15 = 1 - distance( self.origin, var_0.origin ) / var_14;

                if ( var_15 < 0 )
                    var_15 = 0;

                var_16 = 2 + 4 * var_15;

                if ( isdefined( self.stunscaler ) )
                    var_16 *= self.stunscaler;

                wait 0.05;
                self notify( "concussed", var_4 );
                self shellshock( "concussion_grenade_mp", var_16 );
                self.concussionendtime = gettime() + var_16 * 1000;

                if ( isdefined( var_4 ) && var_4 != self )
                    self.concussionattacker = var_4;
                else
                    self.concussionattacker = undefined;

                if ( var_13 && var_4 != self )
                    var_4 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( "stun" );

                break;
            case "weapon_cobra_mk19_mp":
                break;
            default:
                maps\mp\gametypes\_shellshock::_id_83BE( var_2, var_3 );
                break;
        }
    }
}

isconcussed()
{
    return isdefined( self.concussionendtime ) && gettime() < self.concussionendtime;
}

getlastconcussionattacker()
{
    return self.concussionattacker;
}

_id_9C40( var_0 )
{
    if ( getdvarint( "scr_game_uts19_shock", 0 ) == 0 )
        return;

    if ( !isdefined( var_0 ) )
        return;

    var_1 = 0.45;
    var_2 = 1.2;
    var_3 = 250;
    var_4 = 700;
    var_5 = ( distance( self.origin, var_0.origin ) - var_3 ) / ( var_4 - var_3 );
    var_6 = 1 - var_5;
    var_6 = clamp( var_6, 0, 1 );
    var_7 = var_1 + ( var_2 - var_1 ) * var_6;

    if ( isdefined( self._id_9C41 ) )
    {
        if ( self._id_9C41 >= var_7 )
            return;
    }

    self._id_9C41 = var_7;
    self shellshock( "uts19_mp", var_7 );
    waitframe;

    if ( isdefined( self ) )
        self._id_9C41 = undefined;
}

_id_5185( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    switch ( weaponclass( var_0 ) )
    {
        case "spread":
        case "rifle":
        case "smg":
        case "mg":
        case "pistol":
        case "rocketlauncher":
        case "sniper":
        case "beam":
            return 1;
        default:
            return 0;
    }
}

_id_50CE( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    switch ( maps\mp\_utility::getweaponclass( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_pistol":
        case "weapon_machine_pistol":
            return 1;
        case "weapon_heavy":
            return issubstr( var_0, "exoxmg" ) || issubstr( var_0, "lsat" ) || issubstr( var_0, "asaw" );
        default:
            return 0;
    }
}

isbeamweapon( var_0 )
{
    return issubstr( var_0, "em1" ) || issubstr( var_0, "epm3" );
}

_id_50B6( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "altmode";
}

_id_5130( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "item";
}

_id_5192( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weapontype( var_0 ) == "riotshield";
}

_id_5162( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "offhand";
}

_id_51A7( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    return weaponclass( var_0 ) == "pistol";
}

ismeleeinventoryweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "melee";
}

_id_5114( var_0 )
{
    var_1 = weaponclass( var_0 );
    var_2 = weaponinventorytype( var_0 );

    if ( var_1 != "grenade" )
        return 0;

    if ( var_2 != "offhand" )
        return 0;

    return 1;
}

_id_51EF( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    var_1 = weaponinventorytype( var_0 );
    return var_1 == "primary" || var_1 == "altmode";
}

_id_9B5E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self.currentweaponatspawn;
    self._id_7814 = var_0;
    _id_8357( var_0 );
    thread recordweaponusageondeathorgameend();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );
        _id_9BA5( var_1 );

        if ( _id_51F0( var_1 ) )
            _id_9B3D();

        self._id_7814 = var_0;

        if ( _id_51EF( var_1 ) )
            var_0 = var_1;
    }
}

_id_9BA5( var_0 )
{
    var_1 = int( ( gettime() - self._id_A2F5 ) / 1000 );
    thread _id_8356( self._id_A2F4, var_1, "timeInUse" );
    _id_8357( var_0 );
}

recordweaponusageondeathorgameend()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    common_scripts\utility::_id_A06A( self, "death", level, "game_ended" );
    var_0 = int( ( gettime() - self._id_A2F5 ) / 1000 );
    thread _id_8356( self._id_A2F4, var_0, "timeInUse" );
    _id_8357( self._id_A2F4 );
}

_id_8357( var_0 )
{
    self._id_A2F4 = var_0;
    self._id_A2F5 = gettime();
}

_id_308C( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    thread _id_1EEA();
}

_id_1EEA()
{
    self endon( "disconnect" );
    self waittill( "death" );
}

_id_416B()
{
    var_0 = 1000;
    self.weaponlist = self getweaponslistprimaries();

    if ( self.weaponlist.size )
    {
        foreach ( var_2 in self.weaponlist )
        {
            var_3 = _id_416D( var_2 );

            if ( var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }

        if ( var_0 > 10 )
            var_0 = 10;
    }
    else
        var_0 = 8;

    var_0 = _id_1E2A( var_0 );
    return var_0;
}

_id_416D( var_0 )
{
    var_1 = undefined;
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    if ( isdefined( level.weaponweightfunc ) )
        return [[ level.weaponweightfunc ]]( var_2 );

    var_1 = int( tablelookup( "mp/statstable.csv", 4, var_2, 8 ) );
    return var_1;
}

_id_1E2A( var_0 )
{
    return clamp( var_0, 0.0, 10.0 );
}

_id_51F0( var_0 )
{
    if ( _id_51EF( var_0 ) )
        return 1;

    var_1 = weaponclass( var_0 );

    if ( var_1 == "ball" )
        return 1;

    return 0;
}

_id_9B3D()
{

}

_id_8AFC()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notifyonplayercommand( "adjustedStance", "+stance" );
    self notifyonplayercommand( "adjustedStance", "+goStand" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;
        self._id_8AF2 = self getstance();

        if ( self._id_8AF2 == "prone" )
        {
            var_0 = self getcurrentprimaryweapon();
            var_1 = maps\mp\_utility::getweaponclass( var_0 );

            if ( var_1 == "weapon_lmg" )
                maps\mp\_utility::_id_7FFB( 0, 40 );
            else if ( var_1 == "weapon_sniper" )
                maps\mp\_utility::_id_7FFB( 0, 60 );
            else
                maps\mp\_utility::_id_7FFB();

            continue;
        }

        if ( self._id_8AF2 == "crouch" )
        {
            var_0 = self getcurrentprimaryweapon();
            var_1 = maps\mp\_utility::getweaponclass( var_0 );

            if ( var_1 == "weapon_lmg" )
                maps\mp\_utility::_id_7FFB( 0, 10 );
            else if ( var_1 == "weapon_sniper" )
                maps\mp\_utility::_id_7FFB( 0, 30 );
            else
                maps\mp\_utility::_id_7FFB();

            continue;
        }

        maps\mp\_utility::_id_7FFB();
    }
}

_id_188B( var_0 )
{

}

_id_51BC( var_0 )
{
    return level.teambased && isdefined( var_0.team ) && var_0.team == self.team;
}

_id_9974()
{
    if ( getdvarint( "scr_game_deleteturrets", 0 ) || level.gametype == "gun" || maps\mp\_utility::ishodgepodgeph() || maps\mp\_utility::ishodgepodgemm() )
    {
        self delete();
        return;
    }

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread _id_9980( var_0 );
    }
}

_id_9980( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 notify( "weapon_change", "none" );
    self waittill( "turret_deactivate" );
    var_0 notify( "weapon_change", var_0 getcurrentweapon() );
}

_id_89F5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, randomfloat( 360 ), 0 );

    var_5 = "projectile_bouncing_betty_grenade";
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_3;
    var_6 setmodel( var_5 );
    var_6.owner = var_1;
    var_6._id_8F74 = 0;
    var_6 setotherent( var_1 );
    var_6._id_A2DF = "bouncingbetty_mp";
    level._id_5C5D[level._id_5C5D.size] = var_6;
    var_6._id_5350 = ( 0.0, 0.0, 4.0 );
    var_6._id_534D = spawn( "script_model", var_6.origin + var_6._id_5350 );
    var_6._id_534D setscriptmoverkillcam( "explosive" );
    var_1._id_334B = common_scripts\utility::_id_0D01( var_1._id_334B );

    if ( var_1._id_334B.size >= level.maxperplayerexplosives )
        var_1._id_334B[0] delete();

    var_1._id_334B[var_1._id_334B.size] = var_6;
    var_6 thread _id_23E6( "projectile_bouncing_betty_grenade_bombsquad", "tag_origin", var_1 );
    var_6 thread _id_5C4B();
    var_6 thread _id_7FAB( var_1.pers["team"] );
    var_6 thread _id_5C55();
    var_6 thread _id_5C5C();
    var_7 = self getlinkedparent();

    if ( isdefined( var_7 ) )
        var_6 linkto( var_7 );

    var_6 _id_5941( !var_4 );
    return var_6;
}

_id_5C55()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) && !isagent( var_0 ) )
            continue;

        if ( isdefined( var_9 ) && var_9 == "bouncingbetty_mp" )
            continue;

        if ( !_id_3AA6( self.owner, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            var_10 = maps\mp\_utility::strip_suffix( var_9, "_lefthand" );

            switch ( var_10 )
            {
                case "h1_smokegrenade_mp":
                    continue;
            }
        }

        break;
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self.waschained = 1;

    if ( isdefined( var_8 ) && var_8 & level._id_4B5C )
        self.wasdamagedfrombulletpenetration = 1;

    self.wasdamaged = 1;

    if ( isplayer( var_0 ) )
        var_0 maps\mp\gametypes\_damagefeedback::_id_9B0C( "bouncing_betty" );

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && isdefined( self.owner ) )
        {
            var_11 = var_0.pers["team"];
            var_12 = self.owner.pers["team"];

            if ( isdefined( var_11 ) && isdefined( var_12 ) && var_11 != var_12 )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 != self.owner )
        var_0 notify( "destroyed_explosive" );

    thread _id_5C5B( var_0 );
}

_id_5C5C()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 2;
    var_0 = spawn( "trigger_radius", self.origin, 0, level.minedetectionradius, level.minedetectionheight );
    var_0.owner = self;
    thread _id_5C57( var_0 );
    var_1 = undefined;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F74 )
            continue;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self.owner ) )
            {
                if ( var_1 == self.owner )
                    continue;

                if ( isdefined( var_1.owner ) && var_1.owner == self.owner )
                    continue;
            }

            if ( !_id_3AA6( self.owner, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 getentityvelocity() ) < 10 )
            continue;

        if ( var_1 damageconetrace( self.origin, self ) > 0 )
            break;
    }

    self notify( "mine_triggered" );
    self playsound( "mine_betty_click" );

    if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_mine" );
        wait(level.delayminetime);
    }
    else
        wait(level.minedetectiongraceperiod);

    thread _id_5C4D();
}

_id_5C57( var_0 )
{
    common_scripts\utility::_id_A069( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );
    var_0 delete();
}

_id_5C5E()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait(level.mineselfdestructtime);
    wait(randomfloat( 0.4 ));
    self notify( "mine_selfdestruct" );
    thread _id_5C5B();
}

_id_5C4D()
{
    self playsound( "mine_betty_spin" );
    playfx( level._id_5C49, self.origin );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_0 = self.origin + ( 0.0, 0.0, 64.0 );
    self moveto( var_0, 0.7, 0, 0.65 );
    self._id_534D moveto( var_0 + self._id_5350, 0.7, 0, 0.65 );
    self rotatevelocity( ( 0.0, 750.0, 32.0 ), 0.7, 0, 0.65 );
    thread _id_6DE1();
    wait 0.65;
    thread _id_5C5B();
}

_id_5C5B( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    self playsound( "null" );
    var_1 = self gettagorigin( "tag_fx" );
    playfx( level._id_5C48, var_1 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    self hide();
    self entityradiusdamage( self.origin, level.minedamageradius, level.minedamagemax, level.minedamagemin, var_0, "MOD_EXPLOSIVE" );

    if ( isdefined( self.owner ) && isdefined( level._id_5656 ) )
        self.owner thread [[ level._id_5656 ]]( "mine_destroyed", undefined, undefined, self.origin );

    wait 0.2;

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self._id_534D delete();
    self delete();
}

_id_5C60()
{
    if ( self._id_8F74 )
        return;

    self._id_8F74 = 1;
    playfxontag( common_scripts\utility::_id_3FA8( "mine_stunned" ), self, "tag_origin" );
}

_id_5C61()
{
    self._id_8F74 = 0;
    stopfxontag( common_scripts\utility::_id_3FA8( "mine_stunned" ), self, "tag_origin" );
}

_id_5C4E( var_0 )
{
    if ( isdefined( self._id_A2DF ) )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 destroy();

        if ( self._id_A2DF == "bouncingbetty_mp" )
        {
            if ( isdefined( self.trigger ) )
                self.trigger delete();

            if ( isdefined( self._id_3018["friendly"] ) )
                self._id_3018["friendly"] delete();

            if ( isdefined( self._id_3018["enemy"] ) )
                self._id_3018["enemy"] delete();

            for ( var_1 = 0; var_1 < self.owner._id_334B.size; var_1++ )
            {
                if ( self.owner._id_334B[var_1] == self )
                    self.owner._id_334B[var_1] = undefined;
            }

            self.owner._id_334B = common_scripts\utility::_id_0D01( self.owner._id_334B );
            self notify( "change_owner" );
            self.owner = var_0;
            self.owner._id_334B[self.owner._id_334B.size] = self;
            self.team = var_0.team;
            self setotherent( var_0 );
            self.trigger = spawn( "script_origin", self.origin + ( 0.0, 0.0, 25.0 ) );
            self.trigger.owner = self;
            _id_3347( var_0 );
            thread _id_5C4B();
            thread _id_7FAB( var_0.team );
            var_0 thread _id_5C64( self );
            var_0 thread _id_5C63( self );
        }
        else if ( self._id_A2DF == "h1_claymore_mp" )
        {
            if ( isdefined( self.trigger ) )
                self.trigger delete();

            for ( var_1 = 0; var_1 < self.owner._id_1E43.size; var_1++ )
            {
                if ( self.owner._id_1E43[var_1] == self )
                    self.owner._id_1E43[var_1] = undefined;
            }

            self.owner._id_1E43 = common_scripts\utility::_id_0D01( self.owner._id_1E43 );
            self notify( "change_owner" );
            self.owner = var_0;
            self.owner._id_1E43[self.owner._id_1E43.size] = self;
            self.team = var_0.team;
            self setotherent( var_0 );
            self.trigger = spawn( "script_origin", self.origin );
            self.trigger.owner = self;
            _id_3347( var_0 );
            thread _id_7FAB( var_0.team );
            var_0 thread _id_5C64( self );
            var_0 thread _id_5C63( self );
            thread _id_1E48();
        }
        else if ( self._id_A2DF == "h1_c4_mp" )
        {
            var_2 = 0;
            var_3 = 0;

            for ( var_1 = 0; var_1 < self.owner.plantedlethalequip.size; var_1++ )
            {
                if ( self.owner.plantedlethalequip[var_1][0] == self )
                {
                    self.owner.plantedlethalequip[var_1][0] = undefined;
                    var_2 = self.owner.plantedlethalequip[var_1][1];
                    var_3 = self.owner.plantedlethalequip[var_1][2];
                }
            }

            self.owner.plantedlethalequip = _id_5978( self.owner.plantedlethalequip );
            self notify( "change_owner" );
            self.owner = var_0;
            var_4 = self.owner.plantedlethalequip.size;
            self.owner.plantedlethalequip[var_4] = [];
            self.owner.plantedlethalequip[var_4][0] = self;
            self.owner.plantedlethalequip[var_4][1] = var_2;
            self.owner.plantedlethalequip[var_4][2] = var_3;
            self.team = var_0.team;
            self setotherent( var_0 );
            _id_3347( var_0 );
            thread _id_7FAB( var_0.team );
        }
    }
}

_id_6DE1()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level._id_5C4A, self, "tag_fx_spin1" );
        playfxontag( level._id_5C4A, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level._id_5C4A, self, "tag_fx_spin2" );
        playfxontag( level._id_5C4A, self, "tag_fx_spin4" );
    }
}

_id_5C50( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6[0] = ( 1.0, 0.0, 0.0 );
    var_6[1] = ( 0.0, 1.0, 0.0 );

    if ( var_1[2] < var_5 )
        var_7 = 0;
    else
        var_7 = 1;

    var_8 = ( var_0[0], var_0[1], var_5 );
    var_9 = ( var_1[0], var_1[1], var_5 );
    thread _id_271F( var_8, level.minedamageradius, var_6[var_7], 32 );
    var_10 = distancesquared( var_0, var_1 );

    if ( var_10 > var_2 )
        var_7 = 0;
    else
        var_7 = 1;

    thread _id_2729( var_8, var_9, var_6[var_7] );
}

_id_5C52( var_0, var_1 )
{
    if ( isplayer( var_1 ) && isalive( var_1 ) && var_1.sessionstate == "playing" )
        var_2 = var_1 maps\mp\_utility::_id_40E7();
    else if ( var_1.classname == "misc_turret" )
        var_2 = var_1.origin + ( 0.0, 0.0, 32.0 );
    else
        var_2 = var_1.origin;

    var_3 = 0;
    var_4 = var_0.origin[2] + var_3 + level.minedamagehalfheight;
    var_5 = var_0.origin[2] + var_3 - level.minedamagehalfheight;

    if ( var_2[2] > var_4 || var_2[2] < var_5 )
        return 0;

    return 1;
}

_id_A25A()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self._id_51A8 = 0;
        self waittill( "sprint_slide_begin" );
        self._id_51A8 = 1;
        self.lastslidetime = gettime();
        self waittill( "sprint_slide_end" );
    }
}

_id_A23D()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    if ( isdefined( self._id_334B ) )
    {
        if ( maps\mp\_utility::_id_3FDB( "scr_deleteexplosivesonspawn", 1 ) == 1 )
        {
            if ( isdefined( self._id_2D1F ) )
                self._id_2D1F = undefined;
            else
                _id_27FA();
        }
    }
    else
        self._id_334B = [];

    if ( !isdefined( self._id_539F ) )
        self._id_539F = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "bouncingbetty" || var_1 == "bouncingbetty_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
            var_0 thread _id_5C62( self, 1 );
        }
    }
}

_id_5C62( var_0, var_1 )
{
    self.owner = var_0;
    self waittill( "missile_stuck" );

    if ( !isdefined( var_0 ) )
        return;

    var_2 = bullettrace( self.origin + ( 0.0, 0.0, 4.0 ), self.origin - ( 0.0, 0.0, 4.0 ), 0, self );
    var_3 = var_2["position"];

    if ( var_2["fraction"] == 1 )
    {
        var_3 = getgroundposition( self.origin, 12, 0, 32 );
        var_2["normal"] *= -1;
    }

    var_4 = vectornormalize( var_2["normal"] );
    var_5 = vectortoangles( var_4 );
    var_5 += ( 90.0, 0.0, 0.0 );
    var_6 = _id_89F5( var_3, var_0, undefined, var_5, var_1 );
    var_6.trigger = spawn( "script_origin", var_6.origin + ( 0.0, 0.0, 25.0 ) );
    var_6.trigger.owner = var_6;
    var_6 thread _id_334D( var_0 );
    var_0 thread _id_5C64( var_6 );
    var_0 thread _id_5C63( var_6 );
    self delete();
}

_id_5C64( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    self waittill( "disconnect" );

    if ( isdefined( var_0.trigger ) )
        var_0.trigger delete();

    var_0 delete();
}

_id_5C63( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    common_scripts\utility::_id_A087( "joined_team", "joined_spectators" );

    if ( isdefined( var_0.trigger ) )
        var_0.trigger delete();

    var_0 delete();
}

_id_5C4B()
{
    self endon( "change_owner" );
    self._id_3018["friendly"] = spawnfx( level._id_5C47["friendly"], self gettagorigin( "tag_fx" ) );
    self._id_3018["enemy"] = spawnfx( level._id_5C47["enemy"], self gettagorigin( "tag_fx" ) );
    thread _id_5C4C();
    self waittill( "death" );
    self._id_3018["friendly"] delete();
    self._id_3018["enemy"] delete();
}

_id_5C4C()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = self.owner.team;
    wait 0.05;
    triggerfx( self._id_3018["friendly"] );
    triggerfx( self._id_3018["enemy"] );

    for (;;)
    {
        self._id_3018["friendly"] hide();
        self._id_3018["enemy"] hide();

        foreach ( var_2 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_2.team == var_0 )
                    self._id_3018["friendly"] showtoplayer( var_2 );
                else
                    self._id_3018["enemy"] showtoplayer( var_2 );

                continue;
            }

            if ( var_2 == self.owner )
            {
                self._id_3018["friendly"] showtoplayer( var_2 );
                continue;
            }

            self._id_3018["enemy"] showtoplayer( var_2 );
        }

        level common_scripts\utility::_id_A087( "joined_team", "player_spawned" );
    }
}

_id_27F9()
{
    if ( isdefined( self.plantedlethalequip ) )
    {
        for ( var_0 = 0; var_0 < self.plantedlethalequip.size; var_0++ )
        {
            if ( isdefined( self.plantedlethalequip[var_0][0] ) )
            {
                if ( isdefined( self.plantedlethalequip[var_0][0].trigger ) )
                    self.plantedlethalequip[var_0][0].trigger delete();

                self.plantedlethalequip[var_0][0] delete();
            }
        }
    }

    self.plantedlethalequip = [];

    if ( isdefined( self._id_1E43 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1E43.size; var_0++ )
        {
            if ( isdefined( self._id_1E43[var_0] ) )
            {
                if ( isdefined( self._id_1E43[var_0].trigger ) )
                    self._id_1E43[var_0].trigger delete();

                self._id_1E43[var_0] delete();
            }
        }
    }

    self._id_1E43 = [];

    if ( isdefined( self._id_1756 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1756.size; var_0++ )
        {
            if ( isdefined( self._id_1756[var_0] ) )
            {
                if ( isdefined( self._id_1756[var_0].trigger ) )
                    self._id_1756[var_0].trigger delete();

                self._id_1756[var_0] delete();
            }
        }
    }

    self._id_1756 = [];
}

_id_27FA()
{
    if ( isdefined( self._id_334B ) )
    {
        self._id_334B = common_scripts\utility::_id_0D01( self._id_334B );

        foreach ( var_1 in self._id_334B )
        {
            if ( isdefined( var_1.trigger ) )
                var_1.trigger delete();

            var_1 delete();
        }
    }
}

_id_96ED( var_0 )
{
    var_0 _id_27F9();
    var_0 _id_27FA();

    if ( isdefined( self.plantedlethalequip ) )
        var_0.plantedlethalequip = _id_5978( self.plantedlethalequip );
    else
        var_0.plantedlethalequip = undefined;

    if ( isdefined( self._id_1E43 ) )
        var_0._id_1E43 = common_scripts\utility::_id_0D01( self._id_1E43 );
    else
        var_0._id_1E43 = undefined;

    if ( isdefined( self._id_1756 ) )
        var_0._id_1756 = common_scripts\utility::_id_0D01( self._id_1756 );
    else
        var_0._id_1756 = undefined;

    if ( isdefined( self._id_334B ) )
        var_0._id_334B = common_scripts\utility::_id_0D01( self._id_334B );
    else
        var_0._id_334B = undefined;

    if ( isdefined( self._id_539F ) )
        var_0._id_539F = common_scripts\utility::_id_0D01( self._id_539F );
    else
        var_0._id_539F = undefined;

    if ( isdefined( var_0.plantedlethalequip ) )
    {
        foreach ( var_2 in var_0.plantedlethalequip )
            var_2[0].owner = var_0;
    }

    if ( isdefined( var_0._id_1E43 ) )
    {
        foreach ( var_5 in var_0._id_1E43 )
            var_5.owner = var_0;
    }

    if ( isdefined( var_0._id_1756 ) )
    {
        foreach ( var_8 in var_0._id_1756 )
        {
            var_8.owner = var_0;
            var_8 thread _id_334D( var_0 );
        }
    }

    if ( isdefined( var_0._id_334B ) )
    {
        foreach ( var_11 in var_0._id_334B )
        {
            var_11.owner = var_0;
            var_11 thread _id_334D( var_0 );
        }
    }

    if ( isdefined( var_0._id_539F ) )
    {
        foreach ( var_14 in var_0._id_539F )
        {
            var_14.owner = var_0;
            var_14 thread _id_334D( var_0 );
        }
    }

    self.plantedlethalequip = [];
    self._id_1E43 = [];
    self._id_1756 = [];
    self._id_334B = [];
    self._id_539F = [];
    self.dont_delete_grenades_on_next_spawn = 1;
    self._id_2D1F = 1;
}

_id_3345()
{
    playfx( common_scripts\utility::_id_3FA8( "equipment_sparks" ), self.origin );
    self playsound( "sentry_explode" );
}

_id_3346()
{
    playfx( common_scripts\utility::_id_3FA8( "equipment_explode_big" ), self.origin );
    playfx( common_scripts\utility::_id_3FA8( "equipment_smoke" ), self.origin );
}

_id_3348()
{
    playfxontag( common_scripts\utility::_id_3FA8( "emp_stun" ), self, "tag_origin" );
}

_id_94A2()
{
    self._id_2583 = [];
    thread _id_7428();
}

_id_7428()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        if ( self.health >= 100 && isdefined( self._id_2583 ) && self._id_2583.size > 0 )
            self._id_2583 = [];

        wait 0.05;
    }
}

_id_8E34( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( isdefined( var_0 ) )
        var_2._id_6237 = var_0;

    if ( isdefined( var_1 ) )
        var_2._id_31BB = var_1;

    var_2._id_2663 = ::_id_8E35;
    thread maps\mp\_movers::_id_45BF( var_2 );
}

_id_8E35( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self ) )
    {
        if ( isdefined( var_0._id_6237 ) )
        {
            if ( var_0._id_6237 == "detonate" )
                self detonate();
            else
                self notify( var_0._id_6237 );
        }
        else
            self delete();
    }
}

_id_3FAE()
{
    var_0 = 0;

    if ( isdefined( level._id_4400 ) )
        var_0 = level._id_4400;

    var_1 = 0;

    if ( isdefined( level._id_6F07 ) )
        var_1 = ( gettime() - level._id_6F07 ) / 1000;

    return var_0 - var_1;
}

_id_4C6E()
{
    return _id_3FAE() > 0;
}

_id_5204( var_0 )
{
    if ( issubstr( var_0, "glmwr" ) )
        return 0;

    if ( isendstr( var_0, "_gl" ) )
        return 0;

    switch ( var_0 )
    {
        case "h1_fraggrenade_mp":
            return 0;
        default:
            break;
    }

    var_1 = getweaponbasename( var_0 );

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "h1_rpg_mp":
                return 0;
            default:
                break;
        }
    }

    return 1;
}

_id_A22E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        [ var_1, var_2, var_3 ] = common_scripts\utility::_id_A072( "grenade_fire", "missile_fire" );

        if ( !isdefined( var_3 ) || var_3 == "" )
            continue;

        if ( _id_4C6E() )
        {
            if ( !_id_5204( var_3 ) )
            {
                var_4 = int( _id_3FAE() + 0.5 );

                if ( !var_4 )
                    var_4 = 1;

                if ( isplayer( self ) )
                    self clientiprintlnbold( &"MP_EXPLOSIVES_UNAVAILABLE_FOR_N", var_4 );
            }

            continue;
        }

        break;
    }
}

isprimaryorsecondaryprojectileweapon( var_0 )
{
    var_1 = maps\mp\_utility::getweaponclass( var_0 );
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    if ( var_1 == "weapon_projectile" )
        return 1;

    return 0;
}

saveweapon( var_0, var_1, var_2 )
{
    var_3 = self.saveweapons.size;

    if ( var_3 == 0 )
        self.firstsaveweapon = var_1;

    self.saveweapons[var_3]["type"] = var_0;
    self.saveweapons[var_3]["use"] = var_2;
}

getsavedweapon( var_0 )
{
    var_1 = self.saveweapons.size;
    var_2 = -1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( self.saveweapons[var_3]["type"] == var_0 )
        {
            var_2 = var_3;
            break;
        }
    }

    if ( var_2 >= 0 )
        return self.saveweapons[var_2]["use"];
    else
        return "none";
}

_id_74B3( var_0 )
{
    var_1 = [];
    var_2 = self.saveweapons.size;
    var_3 = -1;
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        if ( var_3 < 0 && self.saveweapons[var_5]["type"] == var_0 )
        {
            var_3 = var_5;
            continue;
        }

        var_1[var_4] = self.saveweapons[var_5];
        var_4++;
    }

    if ( var_3 >= 0 )
    {
        var_6 = "none";

        if ( var_1.size == 0 )
        {
            var_6 = self.firstsaveweapon;
            self.saveweapons = var_1;
            self.firstsaveweapon = "none";
        }
        else
        {
            self.saveweapons = var_1;
            var_6 = getsavedweapon( "underwater" );

            if ( var_6 == "none" )
                var_6 = self.saveweapons[0]["use"];
        }

        var_7 = self getcurrentweapon();

        if ( var_7 != var_6 )
            self switchtoweaponimmediate( var_6 );
    }
}

watchweaponinspection()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( isai( self ) || isbot( self ) )
        return;

    self notifyonplayercommand( "weapon_inspection", "+actionslot 2" );

    for (;;)
    {
        self waittill( "weapon_inspection" );

        if ( maps\mp\_utility::_id_4FA6() && !maps\mp\_utility::_id_5092( level._id_4C03 ) )
            continue;

        var_0 = self getcurrentprimaryweapon();
        var_1 = maps\mp\_utility::getweaponclass( var_0 );
        var_2 = var_1 == "weapon_pistol";
        var_3 = maps\mp\gametypes\_class::isperkequipment( var_0 );
        var_4 = getweaponbasename( var_0 );

        if ( isdefined( var_4 ) )
            var_5 = var_4 == "h1_augsmg_mp";
        else
            var_5 = 0;

        if ( var_2 || var_3 || var_5 )
        {
            var_6 = self getammocount( var_0 );

            if ( var_6 == 0 )
                continue;
        }

        self _meth_855f();
        waittillframeend;

        while ( self _meth_8560() )
            waittillframeend;
    }
}

watchmeleeweapon()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "melee_fired", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( isdefined( self.meleeweaponbloodytime ) && maps\mp\_utility::ismeleeweapon( var_0 ) )
        {
            var_1 = gettime() - self.meleeweaponbloodytime <= 100;
            var_2 = gettime() - self.meleeweaponbloodytime > 4000;

            if ( !var_1 && !var_2 )
                thread playcleanmeleefx();
        }

        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        self.lastshotfiredtime = gettime();

        if ( isai( self ) )
            continue;

        if ( !maps\mp\_utility::iscacmeleeweapon( var_0 ) )
            continue;

        var_3 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" ) + 1;
        var_4 = maps\mp\gametypes\_persistence::_id_8D69( "hits" );
        var_5 = clamp( float( var_4 ) / float( var_3 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "totalShots", var_3 );
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", int( var_5 ) );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", int( var_3 - var_4 ) );

        if ( isdefined( self._id_55EC ) && self._id_55EC._id_55F1 == gettime() )
        {
            self.hits = 0;
            continue;
        }

        var_6 = 1;
        _id_8356( var_0, var_6, "shots" );
        _id_8356( var_0, self.hits, "hits" );
        self.hits = 0;
    }
}

playcleanmeleefx()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.05;
    var_0 = self getvieworigin();
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = bullettrace( var_0, var_0 + var_2 * 200, 0 );

    if ( var_3["fraction"] < 1 )
        playfx( level.meleeweaponbloodflick, var_3["position"] - var_2 * 5, -1 * var_2 );
}
