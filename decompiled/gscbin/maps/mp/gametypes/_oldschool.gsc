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
    if ( maps\mp\_utility::_id_4FA6() )
    {
        level.oldschool = 0;
        return;
    }

    if ( !level.oldschool )
    {
        deletepickups();
        return;
    }

    if ( getdvar( "scr_os_pickupweaponrespawntime" ) == "" )
        setdvar( "scr_os_pickupweaponrespawntime", "15" );

    level.pickupweaponrespawntime = getdvarfloat( "scr_os_pickupweaponrespawntime" );

    if ( getdvar( "scr_os_pickupperkrespawntime" ) == "" )
        setdvar( "scr_os_pickupperkrespawntime", "25" );

    level.pickupperkrespawntime = getdvarfloat( "scr_os_pickupperkrespawntime" );
    oldschoolloadout();
    level._id_1969 = ::_id_1969;
    level.streamprimariesfunc = ::streamprimariesfunc;
    thread _id_4DFA();
    thread _id_64C8();
    level.oldschoolpickupsound = "oldschool_pickup";
    level.oldschoolrespawnsound = "oldschool_return";
    level.perkpickuphints = [];
    level.perkpickuphints["specialty_bulletdamage"] = &"PLATFORM_PICK_UP_STOPPING_POWER";
    level.perkpickuphints["specialty_armorvest"] = &"PLATFORM_PICK_UP_JUGGERNAUT";
    level.perkpickuphints["specialty_rof"] = &"PLATFORM_PICK_UP_DOUBLE_TAP";
    level.perkpickuphints["specialty_pistoldeath"] = &"PLATFORM_PICK_UP_LAST_STAND";
    level.perkpickuphints["specialty_grenadepulldeath"] = &"PLATFORM_PICK_UP_MARTYRDOM";
    level.perkpickuphints["specialty_fastreload"] = &"PLATFORM_PICK_UP_SLEIGHT_OF_HAND";
}

_id_1969()
{
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.pers["gamemodeLoadout"] = level.oldschool_loadout;
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    self _meth_8508( level.oldschool_loadout["loadoutPrimary"] );
}

streamprimariesfunc()
{
    var_0 = [ "axis", "allies" ];
    var_1 = maps\mp\gametypes\_class::_id_188C( level.oldschool_loadout["loadoutPrimary"] );
    var_2 = maps\mp\gametypes\_class::_id_188C( level.oldschool_loadout["loadoutSecondary"] );
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        var_6 = spawnstruct();
        var_6.team = var_5;
        var_6.weapon_switch_invalid = var_1;
        var_3[var_3.size] = var_6;
    }

    self _meth_8420( var_3, var_1, var_2 );
}

oldschoolloadout()
{
    level.oldschool_loadout = maps\mp\gametypes\_class::_id_3F7B();
    level.oldschool_loadout["loadoutPrimary"] = "h1_skorpion";
    level.oldschool_loadout["loadoutSecondary"] = "h1_beretta";
    level.oldschool_loadout["loadoutEquipment"] = "h1_fraggrenade_mp";
    level.oldschool_loadout["loadoutOffhand"] = "h1_flashgrenade_mp";
}

deletepickups()
{
    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._not_team ) )
            getent( var_0[var_1]._not_team, "targetname" ) delete();

        var_0[var_1] delete();
    }
}

converttoh1weaponclassname( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "weapon_frag_grenade_mp":
        case "weapon_h1_fraggrenade_mp":
            return "weapon_h1_fraggrenade_mp";
        case "weapon_smoke_grenade_mp":
        case "weapon_h1_smokegrenade_mp":
            return "weapon_h1_smokegrenade_mp";
        case "weapon_flash_grenade_mp":
        case "weapon_h1_flashgrenade_mp":
            return "weapon_h1_flashgrenade_mp";
        default:
            break;
    }

    var_2 = strtok( var_0, "_" );
    var_3 = undefined;
    var_4 = "none";

    if ( var_2[1] == "h1" )
    {
        var_3 = var_2[2];

        if ( isdefined( var_1 ) )
            var_4 = var_1;
    }
    else
    {
        var_3 = var_2[1];

        if ( var_2.size == 4 )
        {
            var_5 = "h1_" + var_3 + "_mp";
            var_6 = _func_2f8( var_5 );
            var_7 = var_2[2] + "mwr";

            foreach ( var_9 in var_6 )
            {
                if ( var_9 == var_7 )
                {
                    var_4 = var_2[2];
                    break;
                }
            }

            if ( var_4 == "none" )
            {

            }
        }
    }

    var_3 = "h1_" + var_3 + "_mp";

    if ( weaponinventorytype( var_3 ) == "item" )
        return "weapon_" + var_3;
    else
        return "weapon_" + var_3 + "_a#" + var_4 + "_f#base";
}

converttoh1pickup( var_0 )
{
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = 19;
    var_4 = var_0.teambalanced;
    var_5 = converttoh1weaponclassname( var_0.classname, var_0.script_parentname );
    var_6 = spawn( var_5, var_1, var_3 );
    var_6.angles = var_2;
    var_6.teambalanced = var_4;
    var_6._id_7A99 = var_0._id_7A99;
    var_0 delete();
}

isweaponpickup( var_0 )
{
    var_1 = var_0.classname;
    return isdefined( var_1 ) && issubstr( var_1, "weapon_" );
}

usenormalfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable" );
}

usebrightfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available_bright" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable_bright" );
}

useunlitfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available_unlit" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable_unlit" );
}

_id_4DFA()
{
    if ( !isdefined( level.oldschoolfxtype ) )
        level.oldschoolfxtype = "normal";

    switch ( level.oldschoolfxtype )
    {
        case "unlit":
            useunlitfx();
            break;
        case "bright":
            usebrightfx();
            break;
        default:
            usenormalfx();
            break;
    }

    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isweaponpickup( var_0[var_1] ) )
            converttoh1pickup( var_0[var_1] );
    }

    wait 0.5;
    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread trackpickup( var_0[var_1], var_1 );

    level.allpickupstracked = 1;
}

spawnpickupfx( var_0, var_1 )
{
    var_2 = spawnfx( var_1, var_0, ( 0, 0, 1 ), ( 1, 0, 0 ) );
    triggerfx( var_2 );
    return var_2;
}

playeffectshortly( var_0 )
{
    self endon( "death" );
    wait 0.05;
    playfxontag( var_0, self, "tag_origin" );
}

getpickupgroundpoint( var_0 )
{
    var_1 = 44.0;
    var_2 = bullettrace( var_0.origin, var_0.origin + ( 0, 0, -128 ), 0, var_0 );
    var_3 = var_2["position"];
    var_4 = var_3[2];

    for ( var_5 = 1; var_5 <= 3; var_5++ )
    {
        var_6 = var_5 / 3.0 * var_1;

        for ( var_7 = 0; var_7 < 10; var_7++ )
        {
            var_8 = var_7 / 10.0 * 360.0;
            var_9 = var_0.origin + ( cos( var_8 ), sin( var_8 ), 0 ) * var_6;
            var_2 = bullettrace( var_9, var_9 + ( 0, 0, -128 ), 0, var_0 );
            var_10 = var_2["position"];

            if ( var_10[2] > var_4 && var_10[2] < var_3[2] + 15 )
                var_4 = var_10[2];
        }
    }

    return ( var_3[0], var_3[1], var_4 );
}

trackpickup( var_0, var_1 )
{
    var_2 = getpickupgroundpoint( var_0 );
    var_0.groundpoint = var_2;
    var_3 = spawnpickupfx( var_2, level.pickupavailableeffect );
    var_4 = var_0.classname;
    var_5 = var_0.origin;
    var_6 = var_0.angles;
    var_7 = var_0.specialgrenade;
    var_8 = var_0.motiontrackerenabled;
    var_9 = var_0.teambalanced;
    var_10 = var_0.script_parentname;
    var_11 = 0;
    var_12 = 0;
    var_13 = undefined;
    var_14 = undefined;
    var_15 = undefined;
    var_16 = undefined;

    if ( issubstr( var_4, "weapon_" ) )
    {
        var_11 = 1;
        var_13 = var_0 maps\mp\gametypes\_weapons::_id_3FDC();
        var_16 = level.pickupweaponrespawntime;
    }
    else if ( var_4 == "script_model" )
    {
        var_12 = 1;
        var_14 = var_0.script_parentname;

        if ( !isdefined( level.perkpickuphints[var_14] ) )
        {
            common_scripts\utility::_id_334F( "oldschool_pickup with classname script_model does not have script_noteworthy set to a valid perk" );
            return;
        }

        var_15 = getent( var_0._not_team, "targetname" );
        var_16 = level.pickupperkrespawntime;

        if ( !getdvarint( "scr_game_perks" ) )
        {
            var_0 delete();
            var_15 delete();
            var_3 delete();
            return;
        }

        if ( isdefined( level.perkpickuphints[var_14] ) )
            var_15 sethintstring( level.perkpickuphints[var_14] );
    }
    else
    {
        common_scripts\utility::_id_334F( "oldschool_pickup with classname " + var_4 + " is not supported (at location " + var_0.origin + ")" );
        return;
    }

    if ( isdefined( var_0.script_lightset ) )
        var_16 = var_0.script_lightset;

    var_0.respawntime = var_16;

    for (;;)
    {
        var_17 = undefined;

        if ( var_11 )
        {
            var_0 thread changesecondarygrenadetype( var_13 );
            var_0 setpickupstartammo( var_13 );

            for (;;)
            {
                var_0 waittill( "trigger", var_17, var_18 );

                if ( !isdefined( var_0 ) )
                    break;
            }

            if ( isdefined( var_18 ) )
            {
                var_19 = 5;

                if ( var_19 > var_16 )
                    var_19 = var_16;

                var_18 thread delayeddeletion( var_19 );
            }
        }
        else
        {
            var_15 waittill( "trigger", var_17 );
            var_0 delete();
            var_15 common_scripts\utility::_id_97CC();
        }

        if ( var_11 )
        {
            if ( weaponinventorytype( var_13 ) == "item" && ( !isdefined( var_17.inventoryweapon ) || var_13 != var_17.inventoryweapon ) )
            {
                var_17 removeinventoryweapon();
                var_17.inventoryweapon = var_13;
                var_17 setactionslot( 3, "weapon", var_13 );
            }
        }
        else if ( !var_17 maps\mp\_utility::_hasperk( var_14 ) )
        {
            var_17 maps\mp\_utility::_id_41F8( var_14, 1, var_17.numperks );
            var_17.numperks++;
        }

        thread maps\mp\_utility::_id_6DDC( level.oldschoolpickupsound, var_5 );
        var_3 delete();
        var_3 = spawnpickupfx( var_2, level.pickupunavailableeffect );
        wait(var_16);
        var_0 = spawn( var_4, var_5, var_7 );
        var_0.angles = var_6;
        var_0.teambalanced = var_9;
        var_0.script_parentname = var_10;
        var_0.groundpoint = var_2;
        var_0.respawntime = var_16;

        if ( var_12 )
        {
            var_0 setmodel( var_8 );
            var_15 common_scripts\utility::_id_97CE();
        }

        var_0 playsound( level.oldschoolrespawnsound );
        var_3 delete();
        var_3 = spawnpickupfx( var_2, level.pickupavailableeffect );
    }
}

setpickupstartammo( var_0 )
{
    var_1 = var_0;

    for ( var_2 = 0; var_2 == 0 || var_1 != var_0 && var_1 != "none"; var_2++ )
    {
        var_3 = weaponstartammo( var_1 );
        var_4 = weaponclipsize( var_1 );
        var_5 = 0;

        if ( var_4 >= var_3 )
            var_4 = var_3;
        else
            var_5 = var_3 - var_4;

        self itemweaponsetammo( var_4, var_5, var_4, var_2 );
        var_1 = weaponaltweaponname( var_1 );
    }
}

changesecondarygrenadetype( var_0 )
{
    self endon( "trigger" );
    var_1 = "h1_smokegrenade_mp";
    var_2 = "h1_flashgrenade_mp";
    var_3 = "h1_concussiongrenade_mp";

    if ( var_0 != var_1 && var_0 != var_2 && var_0 != var_3 )
        return;

    var_4 = spawn( "trigger_radius", self.origin - ( 0, 0, 20 ), 0, 128, 64 );
    thread deletetriggerwhenpickedup( var_4 );

    for (;;)
    {
        var_4 waittill( "trigger", var_5 );

        if ( var_5 getweaponammototal( var_1 ) == 0 && var_5 getweaponammototal( var_2 ) == 0 && var_5 getweaponammototal( var_3 ) == 0 )
            var_5 setoffhandsecondaryclass( var_0 );
    }
}

deletetriggerwhenpickedup( var_0 )
{
    self waittill( "trigger" );
    var_0 delete();
}

resetactionslottoaltmode( var_0 )
{
    self notify( "resetting_action_slot_to_alt_mode" );
    self endon( "resetting_action_slot_to_alt_mode" );

    for (;;)
    {
        if ( getweaponammototal( var_0 ) == 0 )
        {
            var_1 = self getcurrentweapon();

            if ( var_1 != var_0 && var_1 != "none" )
                break;
        }

        wait 0.2;
    }

    removeinventoryweapon();
    self setactionslot( 3, "altmode" );
}

getweaponammototal( var_0 )
{
    return self getweaponammoclip( var_0 ) + self getweaponammostock( var_0 );
}

removeinventoryweapon()
{
    if ( isdefined( self.inventoryweapon ) )
        self takeweapon( self.inventoryweapon );

    self.inventoryweapon = undefined;
}

delayeddeletion( var_0 )
{
    thread delayeddeletiononswappedweapons( var_0 );
    wait(var_0);

    if ( isdefined( self ) )
    {
        self notify( "death" );
        self delete();
    }
}

delayeddeletiononswappedweapons( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1, var_2 );

        if ( isdefined( var_2 ) )
            break;
    }

    var_2 thread delayeddeletion( var_0 );
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connecting", var_0 );
        var_0 thread _id_64D6();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self.inventoryweapon = undefined;
        self clearperks();
        self.numperks = 0;
        thread clearperksondeath();
        thread watchweaponslist();
    }
}

clearperksondeath()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self clearperks();
    self.numperks = 0;
}

watchweaponslist()
{
    self endon( "death" );
    waitframe;
    self._id_A2E6 = self getweaponslistall();

    for (;;)
    {
        self waittill( "weapon_change", var_0 );
        thread updateweaponslist( 0.05 );
    }
}

updateweaponslist( var_0 )
{
    self endon( "death" );
    self notify( "updating_weapons_list" );
    self endon( "updating_weapons_list" );
    self._id_A2E6 = self getweaponslistall();
}

hadweaponbeforepickingup( var_0 )
{
    for ( var_1 = 0; var_1 < self._id_A2E6.size; var_1++ )
    {
        if ( self._id_A2E6[var_1] == var_0 )
            return 1;
    }

    return 0;
}

givestartammooldschool( var_0 )
{
    self setweaponammostock( var_0, self getweaponammostock( var_0 ) + self getweaponammoclip( var_0 ) );
}
