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
    level._id_1E36["class0"] = 0;
    level._id_1E36["class1"] = 1;
    level._id_1E36["class2"] = 2;
    level._id_1E36["class3"] = 3;
    level._id_1E36["class4"] = 4;
    level._id_1E36["class5"] = 5;
    level._id_1E36["class6"] = 6;
    level._id_1E36["class7"] = 7;
    level._id_1E36["class8"] = 8;
    level._id_1E36["class9"] = 9;
    level._id_1E36["class10"] = 10;
    level._id_1E36["class11"] = 11;
    level._id_1E36["class12"] = 12;
    level._id_1E36["class13"] = 13;
    level._id_1E36["class14"] = 14;
    level._id_1E36["custom1"] = 0;
    level._id_1E36["custom2"] = 1;
    level._id_1E36["custom3"] = 2;
    level._id_1E36["custom4"] = 3;
    level._id_1E36["custom5"] = 4;
    level._id_1E36["custom6"] = 5;
    level._id_1E36["custom7"] = 6;
    level._id_1E36["custom8"] = 7;
    level._id_1E36["custom9"] = 8;
    level._id_1E36["custom10"] = 9;
    level._id_1E36["custom11"] = 10;
    level._id_1E36["custom12"] = 11;
    level._id_1E36["custom13"] = 12;
    level._id_1E36["custom14"] = 13;
    level._id_1E36["custom15"] = 14;
    level._id_1E36["custom16"] = 15;
    level._id_1E36["custom17"] = 16;
    level._id_1E36["custom18"] = 17;
    level._id_1E36["custom19"] = 18;
    level._id_1E36["custom20"] = 19;
    level._id_1E36["custom21"] = 20;
    level._id_1E36["custom22"] = 21;
    level._id_1E36["custom23"] = 22;
    level._id_1E36["custom24"] = 23;
    level._id_1E36["custom25"] = 24;
    level._id_1E36["custom26"] = 25;
    level._id_1E36["custom27"] = 26;
    level._id_1E36["custom28"] = 27;
    level._id_1E36["custom29"] = 28;
    level._id_1E36["custom30"] = 29;
    level._id_1E36["custom31"] = 30;
    level._id_1E36["custom32"] = 31;
    level._id_1E36["custom33"] = 32;
    level._id_1E36["custom34"] = 33;
    level._id_1E36["custom35"] = 34;
    level._id_1E36["custom36"] = 35;
    level._id_1E36["custom37"] = 36;
    level._id_1E36["custom38"] = 37;
    level._id_1E36["custom39"] = 38;
    level._id_1E36["custom40"] = 39;
    level._id_1E36["custom41"] = 40;
    level._id_1E36["custom42"] = 41;
    level._id_1E36["custom43"] = 42;
    level._id_1E36["custom44"] = 43;
    level._id_1E36["custom45"] = 44;
    level._id_1E36["custom46"] = 45;
    level._id_1E36["custom47"] = 46;
    level._id_1E36["custom48"] = 47;
    level._id_1E36["custom49"] = 48;
    level._id_1E36["custom50"] = 49;
    level._id_1E36["custom51"] = 50;
    level._id_1E36["custom52"] = 51;
    level._id_1E36["custom53"] = 52;
    level._id_1E36["custom54"] = 53;
    level._id_1E36["custom55"] = 54;
    level._id_1E36["custom56"] = 55;
    level._id_1E36["custom57"] = 56;
    level._id_1E36["custom58"] = 57;
    level._id_1E36["custom59"] = 58;
    level._id_1E36["custom60"] = 59;
    level._id_1E36["lobby1"] = 0;
    level._id_1E36["lobby2"] = 1;
    level._id_1E36["lobby3"] = 2;
    level._id_1E36["lobby4"] = 3;
    level._id_1E36["lobby5"] = 4;
    level._id_1E36["lobby6"] = 5;
    level._id_1E36["lobby7"] = 6;
    level._id_1E36["lobby8"] = 7;
    level._id_1E36["lobby9"] = 8;
    level._id_1E36["lobby10"] = 9;
    level._id_1E36["lobby11"] = 10;
    level._id_1E36["lobby12"] = 11;
    level._id_1E36["lobby13"] = 12;
    level._id_1E36["lobby14"] = 13;
    level._id_1E36["lobby15"] = 14;
    level._id_1E36["lobby16"] = 15;
    level._id_1E36["lobby17"] = 16;
    level._id_1E36["lobby18"] = 17;
    level._id_1E36["lobby19"] = 18;
    level._id_1E36["lobby20"] = 19;
    level._id_1E36["lobby21"] = 20;
    level._id_1E36["lobby22"] = 21;
    level._id_1E36["lobby23"] = 22;
    level._id_1E36["lobby24"] = 23;
    level._id_1E36["lobby25"] = 24;
    level._id_1E36["lobby26"] = 25;
    level._id_1E36["lobby27"] = 26;
    level._id_1E36["lobby28"] = 27;
    level._id_1E36["lobby29"] = 28;
    level._id_1E36["lobby30"] = 29;
    level._id_1E36["lobby31"] = 30;
    level._id_1E36["lobby32"] = 31;
    level._id_1E36["lobby33"] = 32;
    level._id_1E36["lobby34"] = 33;
    level._id_1E36["lobby35"] = 34;
    level._id_1E36["lobby36"] = 35;
    level._id_1E36["lobby37"] = 36;
    level._id_1E36["lobby38"] = 37;
    level._id_1E36["lobby39"] = 38;
    level._id_1E36["lobby40"] = 39;
    level._id_1E36["lobby41"] = 40;
    level._id_1E36["lobby42"] = 41;
    level._id_1E36["lobby43"] = 42;
    level._id_1E36["lobby44"] = 43;
    level._id_1E36["lobby45"] = 44;
    level._id_1E36["lobby46"] = 45;
    level._id_1E36["lobby47"] = 46;
    level._id_1E36["lobby48"] = 47;
    level._id_1E36["lobby49"] = 48;
    level._id_1E36["lobby50"] = 49;
    level._id_1E36["lobby51"] = 50;
    level._id_1E36["lobby52"] = 51;
    level._id_1E36["lobby53"] = 52;
    level._id_1E36["lobby54"] = 53;
    level._id_1E36["lobby55"] = 54;
    level._id_1E36["lobby56"] = 55;
    level._id_1E36["lobby57"] = 56;
    level._id_1E36["lobby58"] = 57;
    level._id_1E36["lobby59"] = 58;
    level._id_1E36["lobby60"] = 59;
    level._id_1E36["axis_recipe1"] = 0;
    level._id_1E36["axis_recipe2"] = 1;
    level._id_1E36["axis_recipe3"] = 2;
    level._id_1E36["axis_recipe4"] = 3;
    level._id_1E36["axis_recipe5"] = 4;
    level._id_1E36["axis_recipe6"] = 5;
    level._id_1E36["allies_recipe1"] = 0;
    level._id_1E36["allies_recipe2"] = 1;
    level._id_1E36["allies_recipe3"] = 2;
    level._id_1E36["allies_recipe4"] = 3;
    level._id_1E36["allies_recipe5"] = 4;
    level._id_1E36["allies_recipe6"] = 5;
    level._id_1E36["copycat"] = -1;
    level._id_1E36["gamemode"] = 0;
    level._id_1E36["callback"] = 0;
    level._id_2793 = "CLASS_ASSAULT";
    level._id_1E3D = "mp/classTable.csv";
    level._id_08A3 = "mp/agentCostumeTable.csv";
    level._id_46C9 = "mp/hardcoreCostumeTable.csv";
    level._id_1E39 = 13;

    if ( !isdefined( level._id_2559 ) )
        level._id_2559 = 13;

    level thread _id_64D1();
}

_id_3F7B()
{
    var_0 = [];
    var_0["loadoutPrimary"] = "h1_ak47";
    var_0["loadoutPrimaryAttachKit"] = "none";
    var_0["loadoutPrimaryFurnitureKit"] = "none";
    var_0["loadoutPrimaryCamo"] = "none";
    var_0["loadoutPrimaryReticle"] = "none";
    var_0["loadoutSecondary"] = "none";
    var_0["loadoutSecondaryAttachKit"] = "none";
    var_0["loadoutSecondaryFurnitureKit"] = "none";
    var_0["loadoutSecondaryCamo"] = "none";
    var_0["loadoutSecondaryReticle"] = "none";
    var_0["loadoutEquipment"] = "specialty_null";
    var_0["loadoutOffhand"] = "none";
    var_0["loadoutPerks"] = maps\mp\perks\_perks::_id_3F7C();
    var_0["loadoutMelee"] = "none";
    return var_0;
}

_id_3F31( var_0 )
{
    return var_0;
}

_id_4166( var_0 )
{
    var_1 = strtok( var_0, "," );

    if ( var_1.size > 1 )
        return int( var_1[1] );
    else
        return 0;
}

_id_5821( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == self.lastclass )
        return;

    self logstring( "choseclass: " + var_0 + " weapon: " + var_1 + " special: " + var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        self logstring( "perk" + var_4 + ": " + var_3[var_4] );

    self.lastclass = var_0;
}

usevirtuallobbyfunction()
{
    return maps\mp\_utility::_id_4FA6();
}

_id_1985( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "weaponSetups", var_1, "weapon" );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "weaponSetups", var_1, "weapon" );
    else
        return self _meth_8244( var_0, "weaponSetups", var_1, "weapon" );
}

_id_1989( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "weaponSetups", var_1, "camo" );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "weaponSetups", var_1, "camo" );
    else
        return self _meth_8244( var_0, "weaponSetups", var_1, "camo" );
}

_id_198A( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "weaponSetups", var_1, "reticle" );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "weaponSetups", var_1, "reticle" );
    else
        return self _meth_8244( var_0, "weaponSetups", var_1, "reticle" );
}

cac_getweaponattachkitid( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "weaponSetups", var_1, "kit", "attachKit" );
    else if ( isdefined( level._id_39B1 ) )
        var_3 = self getcacplayerdata( level._id_39B1, var_0, "weaponSetups", var_1, "kit", "attachKit" );
    else
        var_3 = self _meth_8244( var_0, "weaponSetups", var_1, "kit", "attachKit" );

    return var_3;
}

cac_getweaponattachkit( var_0, var_1, var_2 )
{
    var_3 = cac_getweaponattachkitid( var_0, var_1, var_2 );
    var_4 = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    return var_4;
}

cac_getweaponfurniturekitid( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "weaponSetups", var_1, "kit", "furnitureKit" );
    else if ( isdefined( level._id_39B1 ) )
        var_3 = self getcacplayerdata( level._id_39B1, var_0, "weaponSetups", var_1, "kit", "furnitureKit" );
    else
        var_3 = self _meth_8244( var_0, "weaponSetups", var_1, "kit", "furnitureKit" );

    return var_3;
}

cac_getweaponfurniturekit( var_0, var_1, var_2 )
{
    var_3 = cac_getweaponfurniturekitid( var_0, var_1, var_2 );
    var_4 = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    return var_4;
}

cac_getmeleeweapon( var_0, var_1 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_1, maps\mp\_utility::_id_197E(), var_0, "meleeWeapon" );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "meleeWeapon" );
    else
        return self _meth_8244( var_0, "meleeWeapon" );
}

_id_1984( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "perkSlots", var_1 );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "perkSlots", var_1 );
    else
        return self _meth_8244( var_0, "perkSlots", var_1 );
}

_id_197F( var_0, var_1, var_2 )
{
    if ( usevirtuallobbyfunction() )
        return _func_2f9( var_2, maps\mp\_utility::_id_197E(), var_0, "equipment", var_1 );
    else if ( isdefined( level._id_39B1 ) )
        return self getcacplayerdata( level._id_39B1, var_0, "equipment", var_1 );
    else
        return self _meth_8244( var_0, "equipment", var_1 );
}

_id_1983( var_0, var_1 )
{
    return _id_197F( var_0, 1, var_1 );
}

_id_1B11( var_0 )
{
    return var_0 == "gender" || var_0 == "head";
}

_id_1B0F( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_4FA6() && isdefined( var_1 ) )
        return _func_2fa( var_1, common_scripts\utility::getstatsgroup_common(), "globalCostume", var_0 );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "globalCostume", var_0 );
}

_id_1B10( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_4FA6() && isdefined( var_2 ) )
        return _func_2fa( var_2, common_scripts\utility::getstatsgroup_common(), "costumes", var_1, var_0 );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "costumes", var_1, var_0 );
}

_id_1B17( var_0, var_1 )
{
    return self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "globalCostume", var_0, var_1 );
}

_id_1B18( var_0, var_1, var_2 )
{
    return self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "costumes", var_2, var_0, var_1 );
}

_id_1B0D( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() && isdefined( var_0 ) )
        return _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "activeCostume" );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "activeCostume" );
}

cao_getcharactercamoindex( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() && isdefined( var_0 ) )
        return _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "characterCamoIndex" );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "characterCamoIndex" );
}

_id_1B0E( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_2239.size; var_3++ )
    {
        var_4 = level._id_2239[var_3];

        if ( _id_1B11( var_4 ) )
        {
            var_2[var_3] = _id_1B0F( var_4, var_1 );
            continue;
        }

        var_2[var_3] = _id_1B10( var_4, var_0, var_1 );
    }

    return var_2;
}

_id_1B0C( var_0 )
{
    var_1 = _id_1B0D( var_0 );
    return _id_1B0E( var_1, var_0 );
}

_id_1B16( var_0, var_1 )
{
    var_0 = validatecostume( var_0 );

    for ( var_2 = 0; var_2 < level._id_2239.size; var_2++ )
    {
        var_3 = level._id_2239[var_2];

        if ( _id_1B11( var_3 ) )
        {
            _id_1B17( var_3, var_0[var_2] );
            continue;
        }

        _id_1B18( var_3, var_0[var_2], var_1 );
    }
}

_id_1B15( var_0 )
{
    var_1 = _id_1B0D();
    _id_1B16( var_0, var_1 );
}

cac_setlastteam( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    var_1 = 0;

    if ( var_0 == "axis" )
        var_1 = 1;

    self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "lastGame", "team", var_1 );
}

cac_setlastgrouplocation( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "lastGame", "classLocation", var_0 );
}

cac_setlastclassindex( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "lastGame", "classIndex", var_0 );
}

cac_setlastenvironment( var_0 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    var_1 = 0;

    if ( var_0 == "desert" )
        var_1 = 2;
    else if ( var_0 == "woodland" )
        var_1 = 1;

    self setcommonplayerdata( common_scripts\utility::getstatsgroup_common(), "lastGame", "environment", var_1 );
}

cac_getlastteam( var_0 )
{
    var_1 = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "lastGame", "team" );

    if ( var_1 )
        return "axis";
    else
        return "allies";
}

cac_getlastgroupstring( var_0 )
{
    var_1 = "";
    var_2 = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "lastGame", "classLocation" );

    if ( var_2 == 0 )
        var_1 = "customClasses";
    else
        var_1 = "privateMatchCustomClasses";

    return var_1;
}

cac_getlastclassindex( var_0 )
{
    var_1 = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "lastGame", "classIndex" );
    return var_1;
}

cac_getlastenvironment( var_0 )
{
    var_1 = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "lastGame", "environment" );

    if ( var_1 == 0 )
        return "urban";
    else if ( var_1 == 1 )
        return "woodland";
    else
        return "desert";
}

_id_90A4( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimary", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondary", var_1 + 1 );
}

_id_90A6( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryBuff", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryBuff", var_1 + 1 );
}

_id_90A7( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryCamo", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryCamo", var_1 + 1 );
}

_id_90A8( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryReticle", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryReticle", var_1 + 1 );
}

table_getweaponattachkit( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryAttachKit", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryAttachKit", var_1 + 1 );
}

table_getweaponfurniturekit( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryFurnitureKit", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryFurnitureKit", var_1 + 1 );
}

_id_90A2( var_0, var_1, var_2 )
{
    var_2++;
    var_3 = "loadoutPerk" + var_2;
    return tablelookup( var_0, 0, var_3, var_1 + 1 );
}

_id_909C( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutEquipment", var_1 + 1 );
}

_id_90A3( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutTeamPerk", var_1 + 1 );
}

_id_90A0( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutOffhand", var_1 + 1 );
}

attachkitnametoid( var_0 )
{
    var_1 = tablelookup( "mp/attachkits.csv", 1, var_0, 0 );
    var_1 = int( var_1 );
    return var_1;
}

furniturekitnametoid( var_0 )
{
    var_1 = _func_303( "mp/furniturekits.csv", 1, var_0, 0 );
    var_1 = int( var_1 );
    return var_1;
}

_id_1FCA()
{
    var_0 = "none";
    var_1 = self._id_24C3;
    var_2 = self._id_1E33;

    if ( var_1 == "copycat" )
    {
        var_1 = self.pers["copyCatLoadout"]["className"];

        if ( var_1 == "callback" )
            var_2 = self.pers["copyCatLoadout"]["classCallbackFunc"];
    }

    if ( issubstr( var_1, "axis" ) )
        var_0 = "axis";
    else if ( issubstr( var_1, "allies" ) )
        var_0 = "allies";

    var_3 = [];

    if ( var_0 != "none" )
    {
        var_4 = maps\mp\_utility::_id_3F32( var_1 );
        var_5 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 0, "weapon" );
        var_6 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 0, "kit", "attachKit" );
        var_7 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 0, "kit", "furnitureKit" );
        var_8 = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_6 ), 1 );
        var_9 = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_7 ), 1 );
        var_10 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 0, "camo" );
        var_11 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 0, "reticle" );
        var_12 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 1, "weapon" );
        var_6 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 1, "kit", "attachKit" );
        var_7 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 1, "kit", "furnitureKit" );
        var_13 = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_6 ), 1 );
        var_14 = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_7 ), 1 );
        var_15 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 1, "camo" );
        var_16 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "weaponSetups", 1, "reticle" );
        var_17 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "equipment", 0 );
        var_18 = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "equipment", 1 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_3[var_19] = getmatchrulesdata( "defaultClasses", var_0, "defaultClass", var_4, "class", "perkSlots", var_19 );

        var_20 = "none";
    }
    else if ( issubstr( var_1, "custom" ) )
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_5 = _id_1985( var_21, 0 );
        var_8 = cac_getweaponattachkit( var_21, 0 );
        var_9 = cac_getweaponfurniturekit( var_21, 0 );
        var_10 = _id_1989( var_21, 0 );
        var_11 = _id_198A( var_21, 0 );
        var_12 = _id_1985( var_21, 1 );
        var_13 = cac_getweaponattachkit( var_21, 1 );
        var_14 = cac_getweaponfurniturekit( var_21, 1 );
        var_15 = _id_1989( var_21, 1 );
        var_16 = _id_198A( var_21, 1 );
        var_17 = _id_197F( var_21, 0 );
        var_18 = _id_197F( var_21, 1 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_3[var_19] = _id_1984( var_21, var_19 );

        var_20 = cac_getmeleeweapon( var_21 );
    }
    else if ( var_1 == "callback" )
    {
        if ( !isdefined( var_2 ) )
            common_scripts\utility::_id_334F( "self.classCallback function reference required for class 'callback'" );

        var_22 = [[ var_2 ]]( 1 );

        if ( !isdefined( var_22 ) )
            common_scripts\utility::_id_334F( "array required from self.classCallback for class 'callback'" );

        var_5 = var_22["loadoutPrimary"];
        var_8 = var_22["loadoutPrimaryAttachKit"];
        var_9 = var_22["loadoutPrimaryFurnitureKit"];
        var_10 = var_22["loadoutPrimaryCamo"];
        var_11 = var_22["loadoutPrimaryReticle"];
        var_12 = var_22["loadoutSecondary"];
        var_13 = var_22["loadoutSecondaryAttachKit"];
        var_14 = var_22["loadoutSecondaryFurnitureKit"];
        var_15 = var_22["loadoutSecondaryCamo"];
        var_16 = var_22["loadoutSecondaryReticle"];
        var_17 = var_22["loadoutEquipment"];
        var_18 = var_22["loadoutOffhand"];
        var_3[0] = var_22["loadoutPerk1"];
        var_3[1] = var_22["loadoutPerk2"];
        var_3[2] = var_22["loadoutPerk3"];
        var_20 = var_22["loadoutMelee"];
    }
    else
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_5 = _id_90A4( level._id_1E3D, var_21, 0 );
        var_8 = table_getweaponattachkit( level._id_1E3D, var_21, 0 );
        var_9 = table_getweaponfurniturekit( level._id_1E3D, var_21, 0 );
        var_10 = _id_90A7( level._id_1E3D, var_21, 0 );
        var_11 = _id_90A8( level._id_1E3D, var_21, 0 );
        var_12 = _id_90A4( level._id_1E3D, var_21, 1 );
        var_13 = table_getweaponattachkit( level._id_1E3D, var_21, 1 );
        var_14 = table_getweaponfurniturekit( level._id_1E3D, var_21, 1 );
        var_15 = _id_90A7( level._id_1E3D, var_21, 1 );
        var_16 = _id_90A8( level._id_1E3D, var_21, 1 );
        var_17 = _id_909C( level._id_1E3D, var_21 );
        var_18 = _id_90A0( level._id_1E3D, var_21 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_3[var_19] = _id_90A2( level._id_1E3D, var_21, var_19 );

        var_20 = "none";
    }

    var_23 = [];
    var_23["inUse"] = 0;
    var_23["className"] = var_1;

    if ( var_1 == "callback" && isdefined( var_2 ) )
        var_23["classCallbackFunc"] = var_2;

    var_23["loadoutPrimary"] = var_5;
    var_23["loadoutPrimaryAttachKit"] = var_8;
    var_23["loadoutPrimaryFurnitureKit"] = var_9;
    var_23["loadoutPrimaryCamo"] = var_10;
    var_23["loadoutPrimaryReticle"] = var_11;
    var_23["loadoutSecondary"] = var_12;
    var_23["loadoutSecondaryAttachKit"] = var_13;
    var_23["loadoutSecondaryFurnitureKit"] = var_14;
    var_23["loadoutSecondaryCamo"] = var_15;
    var_23["loadoutSecondaryReticle"] = var_16;
    var_23["loadoutEquipment"] = var_17;
    var_23["loadoutOffhand"] = var_18;

    for ( var_19 = 0; var_19 < 3; var_19++ )
        var_23["loadoutPerks"][var_19] = var_3[var_19];

    var_23["loadoutMelee"] = var_20;
    return var_23;
}

_id_4009( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_5 = 0;
    var_6 = undefined;
    var_7 = 0;
    var_8 = undefined;
    var_9 = issubstr( var_1, "custom" );
    var_10 = 0;
    var_11 = [];
    var_12 = var_1 == "gamemode";

    if ( issubstr( var_1, "axis" ) )
        var_13 = "axis";
    else if ( issubstr( var_1, "allies" ) )
        var_13 = "allies";
    else
        var_13 = "none";

    var_14 = [];

    if ( isdefined( self.pers["copyCatLoadout"] ) && self.pers["copyCatLoadout"]["inUse"] && var_2 )
    {
        var_10 = 1;
        var_9 = 0;
        var_6 = maps\mp\_utility::_id_3F32( "copycat" );
        var_14 = self.pers["copyCatLoadout"];
        var_15 = var_14["loadoutPrimary"];
        var_16 = var_14["loadoutPrimaryAttachKit"];
        var_17 = var_14["loadoutPrimaryFurnitureKit"];
        var_18 = var_14["loadoutPrimaryCamo"];
        var_19 = var_14["loadoutPrimaryReticle"];
        var_20 = var_14["loadoutSecondary"];
        var_21 = var_14["loadoutSecondaryAttachKit"];
        var_22 = var_14["loadoutSecondaryFurnitureKit"];
        var_23 = var_14["loadoutSecondaryCamo"];
        var_24 = var_14["loadoutSecondaryReticle"];
        var_25 = var_14["loadoutEquipment"];
        var_26 = var_14["loadoutOffhand"];

        for ( var_27 = 0; var_27 < 3; var_27++ )
            var_11[var_27] = var_14["loadoutPerks"][var_27];

        var_28 = var_14["loadoutMelee"];
    }
    else if ( var_13 != "none" )
    {
        var_29 = maps\mp\_utility::_id_3F32( var_1 );
        var_6 = var_29;
        self._id_1E2F = var_29;
        self._id_91F6 = var_13;
        var_15 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 0, "weapon" );

        if ( var_15 == "none" )
        {
            var_15 = "h1_ak47";
            var_16 = "none";
            var_17 = "none";
        }
        else
        {
            var_30 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 0, "kit", "attachKit" );
            var_31 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 0, "kit", "furnitureKit" );
            var_16 = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_30 ), 1 );
            var_17 = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_31 ), 1 );
        }

        var_18 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 0, "camo" );
        var_19 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 0, "reticle" );
        var_20 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 1, "weapon" );
        var_30 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 1, "kit", "attachKit" );
        var_31 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 1, "kit", "furnitureKit" );
        var_21 = tablelookup( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_30 ), 1 );
        var_22 = tablelookup( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_31 ), 1 );
        var_23 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 1, "camo" );
        var_24 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "weaponSetups", 1, "reticle" );
        var_25 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "equipment", 0 );
        var_26 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "equipment", 1 );

        for ( var_27 = 0; var_27 < 3; var_27++ )
            var_11[var_27] = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "perkSlots", var_27 );

        var_28 = getmatchrulesdata( "defaultClasses", var_13, "defaultClass", var_29, "class", "meleeWeapon" );

        if ( var_15 == "none" && var_20 != "none" )
        {
            var_15 = var_20;
            var_16 = var_21;
            var_17 = var_22;
            var_18 = var_23;
            var_19 = var_24;
            var_20 = "none";
            var_21 = "none";
            var_22 = "none";
            var_23 = "none";
            var_24 = "none";
        }
        else if ( var_15 == "none" && var_20 == "none" )
        {
            var_5 = 1;
            var_15 = "h1_beretta";
            var_16 = "none";
            var_17 = "none";
        }
    }
    else if ( issubstr( var_1, "custom" ) )
    {
        var_6 = maps\mp\_utility::_id_3F32( var_1 );
        var_15 = _id_1985( var_6, 0 );
        var_16 = cac_getweaponattachkit( var_6, 0 );
        var_17 = cac_getweaponfurniturekit( var_6, 0 );
        var_18 = _id_1989( var_6, 0 );
        var_19 = _id_198A( var_6, 0 );
        var_20 = _id_1985( var_6, 1 );
        var_21 = cac_getweaponattachkit( var_6, 1 );
        var_22 = cac_getweaponfurniturekit( var_6, 1 );
        var_23 = _id_1989( var_6, 1 );
        var_24 = _id_198A( var_6, 1 );
        var_25 = _id_197F( var_6, 0 );
        var_26 = _id_197F( var_6, 1 );

        for ( var_27 = 0; var_27 < 3; var_27++ )
            var_11[var_27] = _id_1984( var_6, var_27 );

        var_28 = cac_getmeleeweapon( var_6 );
    }
    else if ( issubstr( var_1, "lobby" ) )
    {
        var_6 = maps\mp\_utility::_id_3F32( var_1 );
        var_32 = maps\mp\_utility::_id_197E();
        var_33 = [[ level.vl_loadoutfunc ]]( var_32, var_6 );
        var_15 = var_33["primary"];
        var_16 = var_33["primaryAttachKit"];
        var_17 = var_33["primaryFurnitureKit"];
        var_18 = var_33["primaryCamo"];
        var_19 = var_33["primaryReticle"];
        var_20 = var_33["secondary"];
        var_21 = var_33["secondaryAttachKit"];
        var_22 = var_33["secondaryFurnitureKit"];
        var_23 = var_33["secondaryCamo"];
        var_24 = var_33["secondaryReticle"];
        var_25 = var_33["equipment"];
        var_26 = var_33["offhand"];

        for ( var_27 = 0; var_27 < 3; var_27++ )
            var_11[var_27] = var_33["perk" + var_27];

        var_28 = var_33["meleeWeapon"];
    }
    else if ( var_12 )
    {
        var_34 = self.pers["gamemodeLoadout"];
        var_15 = var_34["loadoutPrimary"];
        var_16 = var_34["loadoutPrimaryAttachKit"];
        var_17 = var_34["loadoutPrimaryFurnitureKit"];
        var_18 = var_34["loadoutPrimaryCamo"];
        var_19 = var_34["loadoutPrimaryReticle"];
        var_20 = var_34["loadoutSecondary"];
        var_21 = var_34["loadoutSecondaryAttachKit"];
        var_22 = var_34["loadoutSecondaryFurnitureKit"];
        var_23 = var_34["loadoutSecondaryCamo"];
        var_24 = var_34["loadoutSecondaryReticle"];
        var_25 = var_34["loadoutEquipment"];
        var_26 = var_34["loadoutOffhand"];

        if ( var_26 == "specialty_null" )
            var_26 = "none";

        for ( var_27 = 0; var_27 < 3; var_27++ )
            var_11[var_27] = var_34["loadoutPerks"][var_27];

        var_28 = var_34["loadoutMelee"];
    }
    else if ( var_1 == "callback" )
    {
        if ( !isdefined( self._id_1E33 ) )
            common_scripts\utility::_id_334F( "self.classCallback function reference required for class 'callback'" );

        var_35 = [[ self._id_1E33 ]]( var_4 );

        if ( !isdefined( var_35 ) )
            common_scripts\utility::_id_334F( "array required from self.classCallback for class 'callback'" );

        var_15 = var_35["loadoutPrimary"];
        var_16 = var_35["loadoutPrimaryAttachKit"];
        var_17 = var_35["loadoutPrimaryFurnitureKit"];
        var_18 = var_35["loadoutPrimaryCamo"];
        var_19 = var_35["loadoutPrimaryReticle"];
        var_20 = var_35["loadoutSecondary"];
        var_21 = var_35["loadoutSecondaryAttachKit"];
        var_22 = var_35["loadoutSecondaryFurnitureKit"];
        var_23 = var_35["loadoutSecondaryCamo"];
        var_24 = var_35["loadoutSecondaryReticle"];
        var_25 = var_35["loadoutEquipment"];
        var_26 = var_35["loadoutOffhand"];
        var_11[0] = var_35["loadoutPerk1"];
        var_11[1] = var_35["loadoutPerk2"];
        var_11[2] = var_35["loadoutPerk3"];
        var_28 = var_35["loadoutMelee"];
    }
    else
    {
        var_6 = maps\mp\_utility::_id_3F32( var_1 );
        var_15 = _id_90A4( level._id_1E3D, var_6, 0 );
        var_16 = table_getweaponattachkit( level._id_1E3D, var_6, 0 );
        var_17 = table_getweaponfurniturekit( level._id_1E3D, var_6, 0 );
        var_18 = _id_90A7( level._id_1E3D, var_6, 0 );
        var_19 = _id_90A8( level._id_1E3D, var_6, 0 );
        var_20 = _id_90A4( level._id_1E3D, var_6, 1 );
        var_21 = table_getweaponattachkit( level._id_1E3D, var_6, 1 );
        var_22 = table_getweaponfurniturekit( level._id_1E3D, var_6, 1 );
        var_23 = _id_90A7( level._id_1E3D, var_6, 1 );
        var_24 = _id_90A8( level._id_1E3D, var_6, 1 );
        var_25 = _id_909C( level._id_1E3D, var_6 );
        var_26 = _id_90A0( level._id_1E3D, var_6 );
        var_11[0] = _id_90A2( level._id_1E3D, var_6, 0 );
        var_11[1] = _id_90A2( level._id_1E3D, var_6, 1 );
        var_11[2] = _id_90A2( level._id_1E3D, var_6, 2 );
        var_28 = "none";
    }

    var_36 = issubstr( var_1, "custom" ) || issubstr( var_1, "lobby" );
    var_37 = issubstr( var_1, "recipe" );
    var_38 = 0;

    if ( !var_12 && !var_37 && !level.oldschool && !( isdefined( self.pers["copyCatLoadout"] ) && self.pers["copyCatLoadout"]["inUse"] && var_2 ) )
    {
        if ( !_id_51F3( var_15, 1 ) || level.rankedmatch && var_36 && !var_38 && !self isitemunlocked( var_15 ) )
        {
            var_15 = _id_90A4( level._id_1E3D, 10, 0 );
            var_18 = "none";
            var_19 = "none";
            var_16 = "none";
            var_17 = "none";
        }

        if ( !_id_51E7( var_18, 1 ) || level.rankedmatch && var_36 && !var_38 && !_id_50D6( var_15, var_18 ) )
            var_18 = _id_90A7( level._id_1E3D, 10, 0 );

        if ( !_id_51F4( var_19, 1 ) )
            var_19 = _id_90A8( level._id_1E3D, 10, 0 );

        if ( !isvalidattachkit( var_16, var_15, 1 ) || level.rankedmatch && var_36 && !var_38 && !isattachkitunlocked( var_15, var_16 ) )
            var_16 = table_getweaponattachkit( level._id_1E3D, 10, 0 );

        if ( !isvalidfurniturekit( var_17, var_15, 1 ) || level.rankedmatch && var_36 && !var_38 && !isfurniturekitunlocked( var_15, var_17 ) )
            var_17 = table_getweaponfurniturekit( level._id_1E3D, 10, 0 );

        var_40 = common_scripts\utility::_id_0CE4( var_11, "specialty_twoprimaries" );

        if ( !_id_51F5( var_20, var_40, 1 ) || level.rankedmatch && var_36 && !var_38 && !self isitemunlocked( var_20 ) )
        {
            var_20 = _id_90A4( level._id_1E3D, 10, 1 );
            var_23 = "none";
            var_24 = "none";
            var_21 = "none";
            var_22 = "none";
        }

        if ( !_id_51E7( var_23, 1 ) || level.rankedmatch && var_36 && !var_38 && !_id_50D6( var_20, var_23 ) )
            var_23 = _id_90A7( level._id_1E3D, 10, 1 );

        if ( !_id_51F4( var_24, 1 ) )
            var_24 = _id_90A8( level._id_1E3D, 10, 1 );

        if ( !isvalidattachkit( var_21, var_20, 1 ) || level.rankedmatch && var_36 && !var_38 && !isattachkitunlocked( var_20, var_21 ) )
            var_21 = table_getweaponattachkit( level._id_1E3D, 10, 1 );

        if ( !isvalidfurniturekit( var_22, var_20, 1 ) || level.rankedmatch && var_36 && !var_38 && !isfurniturekitunlocked( var_20, var_22 ) )
            var_22 = table_getweaponfurniturekit( level._id_1E3D, 10, 1 );

        if ( !_id_51EA( var_25, 1 ) || level.rankedmatch && var_36 && !var_38 && !self isitemunlocked( var_25 ) )
            var_25 = _id_909C( level._id_1E3D, 10 );

        if ( var_25 == var_26 )
            var_25 = "specialty_null";

        if ( !_id_51F2( var_26, 1 ) )
            var_26 = _id_90A0( level._id_1E3D, 10 );

        if ( !isvalidmeleeweapon( var_28, 1 ) )
            var_28 = "none";
    }

    for ( var_27 = 0; var_27 < 3; var_27++ )
    {
        if ( var_11[var_27] == "specialty_null" )
            continue;

        var_41 = var_11[var_27];
        var_11[var_27] = maps\mp\perks\_perks::_id_9C4E( var_27, var_11[var_27] );

        if ( var_41 != var_11[var_27] )
            foundinfraction( "^1Warning: Perk " + var_41 + " in wrong slot." );

        if ( var_27 == 0 && var_11[var_27] != "specialty_null" && ( isgrenadelauncher( var_16 ) || isgrenadelauncher( var_21 ) ) )
        {
            foundinfraction( "^1Warning: Player has a perk " + var_41 + " in slot 1 and a grenade launcher too." );
            var_11[0] = "specialty_null";
        }

        if ( var_27 == 0 && var_11[var_27] != "specialty_null" && ( isgrip( var_16 ) || isgrip( var_21 ) ) )
        {
            foundinfraction( "^1Warning: Player has a perk " + var_41 + " in slot 1 and a foregrip too." );
            var_11[0] = "specialty_null";
        }

        if ( var_27 == 0 && var_11[var_27] == "specialty_specialgrenade" && var_26 == "h1_smokegrenade_mp" )
        {
            foundinfraction( "^1Warning: Player has perk specialty_specialgrenade in slot 1 and smoke grenades too." );
            var_11[0] = "specialty_null";
        }
    }

    var_42 = 0;
    var_43 = 0;
    var_44 = 0;

    if ( maps\mp\_utility::_id_4FA6() )
    {
        var_42 = self.emblemloadout.emblemindex;
        var_43 = self.emblemloadout.shouldapplyemblemtoweapon;
        var_44 = self.emblemloadout.shouldapplyemblemtocharacter;
    }
    else
    {
        var_42 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );

        if ( isai( self ) )
        {
            var_43 = self.pers["shouldApplyEmblemToWeapon"];
            var_44 = self.pers["shouldApplyEmblemToCharacter"];
        }
        else
        {
            var_43 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "applyEmblemToWeapon" );
            var_44 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );
        }
    }

    var_45 = var_42;

    if ( !var_43 )
        var_45 = -1;

    var_46 = 0;

    if ( maps\mp\_utility::_id_4FA6() )
        var_46 = self.charactercamoloadout.camoindex;
    else
        var_46 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_common(), "characterCamoIndex" );

    var_33 = spawnstruct();
    var_33.class = var_1;
    var_33._id_1E2F = var_6;
    var_33._id_91F6 = var_13;
    var_33._id_1EE3 = var_5;
    var_33._id_21D9 = var_10;
    var_33._id_199A = var_9;
    var_33._id_5111 = var_12;
    var_33.primary = var_15;
    var_33.primaryattachkit = var_16;
    var_33.primaryfurniturekit = var_17;
    var_33.primarycamo = var_18;
    var_33.primaryreticle = var_19;
    var_18 = int( tablelookup( "mp/camoTable.csv", 1, var_33.primarycamo, 0 ) );
    var_19 = int( tablelookup( "mp/reticleTable.csv", 1, var_33.primaryreticle, 0 ) );
    var_33._id_6F84 = _id_188C( var_33.primary, var_33.primaryattachkit, var_33.primaryfurniturekit, var_18, var_19, var_45 );
    var_33.secondary = var_20;
    var_33.secondaryattachkit = var_21;
    var_33.secondaryfurniturekit = var_22;
    var_33.secondarycamo = var_23;
    var_33.secondaryreticle = var_24;
    var_23 = int( tablelookup( "mp/camoTable.csv", 1, var_33.secondarycamo, 0 ) );
    var_24 = int( tablelookup( "mp/reticleTable.csv", 1, var_33.secondaryreticle, 0 ) );
    var_33._id_7BFA = _id_188C( var_33.secondary, var_33.secondaryattachkit, var_33.secondaryfurniturekit, var_23, var_24, var_45 );
    var_33.equipment = var_25;
    var_33.offhand = var_26;
    var_33.perks = var_11;
    var_33.meleeweapon = var_28;

    if ( var_28 != "none" )
        var_33.meleeweaponname = var_28 + "_mp_a#none_f#base";
    else
        var_33.meleeweaponname = var_28;

    var_33._id_7FF5 = var_3;
    var_33.emblemindex = var_42;
    var_33.weaponemblemindex = var_45;
    var_33._id_A7EC = var_44;
    var_33._id_A7ED = var_46;

    if ( maps\mp\_utility::_id_5092( level.movecompareactive ) && isdefined( level.movecompareloadoutfunc ) )
        var_33 = self [[ level.movecompareloadoutfunc ]]();

    return var_33;
}

_id_41F1( var_0, var_1, var_2, var_3 )
{
    self._id_57D6 = _id_4009( var_0, var_1, var_2, var_3 );
}

applyloadout()
{
    var_0 = self._id_57D6;

    if ( !isdefined( self._id_57D6 ) )
        return;

    self._id_57D6 = undefined;
    self._id_8A4C = var_0;
    self takeallweapons();
    maps\mp\_utility::_id_056B();
    _id_0581();
    self.changingweapon = undefined;

    if ( var_0._id_21D9 )
        setclass( "copycat" );

    self._id_1E2F = var_0._id_1E2F;
    self._id_57DF = var_0.primary;
    self._id_57E0 = int( tablelookup( "mp/camoTable.csv", 1, var_0.primarycamo, 0 ) );
    self._id_57E2 = var_0.secondary;
    self._id_57E3 = int( tablelookup( "mp/camoTable.csv", 1, var_0.secondarycamo, 0 ) );

    if ( !issubstr( var_0.primary, "iw5" ) && !issubstr( var_0.primary, "h1_" ) )
        self._id_57E0 = 0;

    if ( !issubstr( var_0.secondary, "iw5" ) && !issubstr( var_0.secondary, "h1_" ) )
        self._id_57E3 = 0;

    self._id_57E1 = int( tablelookup( "mp/reticleTable.csv", 1, var_0.primaryreticle, 0 ) );
    self._id_57E4 = int( tablelookup( "mp/reticleTable.csv", 1, var_0.secondaryreticle, 0 ) );

    if ( !issubstr( var_0.primary, "iw5" ) && !issubstr( var_0.primary, "h1_" ) )
        self._id_57E1 = 0;

    if ( !issubstr( var_0.secondary, "iw5" ) && !issubstr( var_0.secondary, "h1_" ) )
        self._id_57E4 = 0;

    self.loadoutmelee = var_0.meleeweapon;

    if ( isdefined( var_0._id_529C ) && var_0._id_529C )
    {
        self.health = self.maxhealth;
        thread maps\mp\_utility::_id_7265( maps\mp\_utility::_id_5131() );
        self._id_5131 = 1;
        self._id_52AA = 0.7;
    }
    else if ( maps\mp\_utility::_id_5131() )
    {
        self notify( "lost_juggernaut" );
        self._id_5131 = 0;
        self.movespeedscaler = level._id_1317;
    }

    var_1 = var_0.meleeweaponname;

    if ( var_1 != "none" )
        maps\mp\_utility::_id_05C0( var_1 );

    var_2 = var_0._id_7BFA;

    if ( var_2 != "none" )
    {
        maps\mp\_utility::_id_05C0( var_2 );

        if ( level.oldschool )
            maps\mp\gametypes\_oldschool::givestartammooldschool( var_2 );
    }

    if ( level._id_2A55 )
        maps\mp\_utility::_id_41F8( "specialty_pistoldeath", 0 );

    _id_57D9( var_0 );
    maps\mp\perks\_perks::_id_0CAF();
    self setoffhandprimaryclass( var_0.equipment );

    if ( var_0.equipment != "specialty_null" && self hasweapon( var_0.equipment ) )
    {
        var_3 = self getweaponammoclip( var_0.equipment );
        self setweaponammoclip( var_0.equipment, var_3 + 1 );
    }
    else
        _id_41F5( var_0.equipment );

    if ( var_0.equipment != "specialty_null" && isdefined( self.perkscustom["grenades_count"] ) )
    {
        var_4 = self.perkscustom["grenades_count"];
        self setweaponammoclip( var_0.equipment, var_4 );
    }

    var_5 = var_0._id_6F84;
    maps\mp\_utility::_id_05C0( var_5 );

    if ( level.oldschool )
        maps\mp\gametypes\_oldschool::givestartammooldschool( var_5 );

    if ( !isai( self ) && !maps\mp\_utility::ishodgepodgemm() )
        self switchtoweapon( var_5 );

    if ( var_0._id_7FF5 )
        self setspawnweapon( maps\mp\_utility::_id_3E67( var_0 ) );

    self.pers["primaryWeapon"] = maps\mp\_utility::_id_3F11( var_5 );
    self._id_57DD = var_0.offhand;
    self setoffhandsecondaryclass( var_0.offhand );

    if ( !level.oldschool )
        _id_41F5( var_0.offhand );

    if ( level.oldschool )
        self setweaponammoclip( var_0.offhand, 0 );

    if ( var_0.offhand != "specialty_null" && isdefined( self.perkscustom["specialgrenades_count"] ) )
    {
        var_4 = self.perkscustom["specialgrenades_count"];
        self setweaponammoclip( var_0.offhand, var_4 );
    }

    var_6 = var_5;
    self.primaryweapon = var_6;
    self.secondaryweapon = var_2;
    self.meleeweapon = var_1;

    if ( var_0._id_1EE3 )
    {
        self setweaponammoclip( self.primaryweapon, 0 );
        self setweaponammostock( self.primaryweapon, 0 );
    }

    self.issniper = weaponclass( self.primaryweapon ) == "sniper";
    maps\mp\_utility::_id_0634( 1, "nightvision" );
    maps\mp\perks\_perks::giveperkinventory();
    maps\mp\_utility::_id_0634( 4, "" );

    if ( !level.console )
    {
        maps\mp\_utility::_id_0634( 5, "" );
        maps\mp\_utility::_id_0634( 6, "" );
        maps\mp\_utility::_id_0634( 7, "" );
        maps\mp\_utility::_id_0634( 8, "" );
    }

    if ( maps\mp\_utility::_hasperk( "specialty_extraammo" ) )
    {
        self givemaxammo( var_5 );

        if ( var_2 != "none" )
            self givemaxammo( var_2 );
    }

    if ( !issubstr( var_0.class, "juggernaut" ) )
    {
        if ( isdefined( self.lastclass ) && self.lastclass != "" && self.lastclass != self.class )
            self notify( "changed_class" );

        self.pers["lastClass"] = self.class;
        self.lastclass = self.class;
    }

    if ( isdefined( self._id_3BF3 ) )
    {
        self.pers["class"] = self._id_3BF3;
        self.pers["lastClass"] = self._id_3BF3;
        self.class = self._id_3BF3;

        if ( !isdefined( self.gamemode_carrierclass ) )
            self.lastclass = self._id_3BF3;

        self._id_3BF3 = undefined;
    }

    self.gamemode_carrierclass = undefined;

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        if ( !isdefined( self._id_2236 ) )
        {
            if ( isplayer( self ) )
                self._id_2236 = _id_1B0C();
            else if ( isagent( self ) && self.agent_type == "player" )
                self._id_2236 = maps\mp\gametypes\_teams::_id_3F4F();
        }

        if ( maps\mp\_utility::_id_4FA6() && isdefined( level.vl_cac_getfactionteam ) && isdefined( level.vl_cac_getfactionenvironment ) )
        {
            var_7 = [[ level.vl_cac_getfactionteam ]]();
            var_8 = [[ level.vl_cac_getfactionenvironment ]]();
            maps\mp\gametypes\_teams::applycostume( var_6, var_7, var_8 );
        }
        else if ( level.teambased )
            maps\mp\gametypes\_teams::applycostume();
        else
            maps\mp\gametypes\_teams::applycostume( var_6, self.team );

        _id_5843();
        self _meth_857c( var_0._id_A7ED );
    }

    switch ( weaponclass( var_6 ) )
    {
        case "rifle":
            self setmovespeedscale( 0.95 );
            break;
        case "pistol":
            self setmovespeedscale( 1.0 );
            break;
        case "mg":
            self setmovespeedscale( 0.875 );
            break;
        case "smg":
            self setmovespeedscale( 1.0 );
            break;
        case "spread":
            self setmovespeedscale( 1.0 );
            break;
        default:
            self setmovespeedscale( 1.0 );
            break;
    }

    maps\mp\perks\_perks::_id_198F();
    self notify( "changed_kit" );
    self notify( "applyLoadout" );
}

_id_5843()
{
    if ( isagent( self ) )
        return;

    if ( !isdefined( self._id_223A ) )
    {
        var_0 = _id_1B0F( "gender" );
        var_1 = _id_1B0F( "head" );
        var_2 = _id_1B0D();
        var_3 = _id_1B10( "shirt", var_2 );
        var_4 = _id_1B10( "gloves", var_2 );
        setmatchdata( "players", self.clientid, "costume", "gender", var_0 );
        setmatchdata( "players", self.clientid, "costume", "head", var_1 );
        setmatchdata( "players", self.clientid, "costume", "shirt", var_3 );
        setmatchdata( "players", self.clientid, "costume", "gloves", var_4 );
        self._id_223A = 1;
    }
}

giveloadout( var_0, var_1, var_2, var_3 )
{
    _id_41F1( var_0, var_1, var_2, var_3 );
    applyloadout();
}

_id_41E5()
{
    self._id_89F9 = 0;

    if ( !maps\mp\_utility::_hasperk( "specialty_blindeye" ) && self.avoidkillstreakonspawntimer > 0 )
        thread maps\mp\perks\_perks::_id_41E3();
}

_id_728C()
{
    if ( isdefined( self ) && isdefined( self.pers ) && isdefined( self.pers["validationInfractions"] ) )
        self.pers["validationInfractions"] += 1;
}

_id_0581()
{
    self._id_3AD9 = undefined;
    self._id_1259 = undefined;
    self.headmodel = undefined;
    self detachall();
}

_id_41F5( var_0 )
{
    var_1 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_1 )
    {
        case "none":
        case "specialty_null":
            break;
        case "h1_fraggrenade_mp":
        case "h1_smokegrenade_mp":
        case "h1_concussiongrenade_mp":
        case "h1_flashgrenade_mp":
            self giveweapon( var_0 );
            break;
        default:
    }
}

_id_912F( var_0 )
{
    var_1 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_1 )
    {
        case "none":
        case "specialty_null":
            break;
        case "h1_fraggrenade_mp":
        case "h1_smokegrenade_mp":
        case "h1_concussiongrenade_mp":
        case "h1_flashgrenade_mp":
            self takeweapon( var_0 );
            break;
        default:
    }
}

_id_57D9( var_0 )
{
    var_1 = var_0.perks;

    for ( var_2 = 0; var_2 < 3; var_2++ )
        var_1[var_2] = maps\mp\perks\_perks::_id_9C4E( var_2, var_1[var_2] );

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_3 == "specialty_null" )
            continue;

        maps\mp\_utility::_id_41F8( var_3, 1, var_2 );
        var_4 = var_2 + 1;
        var_5 = "specialty" + var_4;
        maps\mp\perks\_perks::get_specialtydata( var_3, var_5, var_0 );
    }

    self._id_57DE = var_1;
    self._id_57DB = var_0.equipment;
}

_id_5101( var_0 )
{
    if ( issubstr( var_0, "_exoxmg" ) )
        return 1;

    return 0;
}

_id_5198( var_0 )
{
    if ( issubstr( var_0, "sac3" ) )
        return 1;

    return 0;
}

_id_514F( var_0 )
{
    if ( issubstr( var_0, "mahem" ) )
        return 1;

    return 0;
}

_id_6083( var_0, var_1 )
{
    var_2 = maps\mp\_utility::getweaponclass( var_0 ) == "weapon_sniper";

    if ( var_2 && !_id_0C97( var_1 ) && !issubstr( var_0, "h1_" ) )
        return 1;

    return 0;
}

_id_0C97( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( maps\mp\_utility::_id_3F0B( var_2 ) == "rail" || var_2 == "zoomscope" || var_2 == "ironsights" )
            return 1;
    }

    return 0;
}

_id_07CD( var_0, var_1 )
{
    var_2 = [];
    var_3 = maps\mp\_utility::_id_3F11( var_0 );

    if ( _id_6083( var_3, var_1 ) )
    {
        var_4 = var_3;

        if ( issubstr( var_3, "iw5_" ) || issubstr( var_3, "iw6_" ) || issubstr( var_3, "h1_" ) )
        {
            var_5 = var_3.size;
            var_4 = getsubstr( var_3, 4, var_5 );
        }

        var_6 = _id_3F10( var_4 ) + "scope";
        var_2[var_2.size] = var_6;
    }

    return var_2;
}

_id_6FF5( var_0, var_1 )
{
    var_2 = var_0.size;

    if ( var_2 > 1 )
        var_0 = common_scripts\utility::_id_0AF9( var_0 );

    var_3 = _id_07CD( var_1, var_0 );
    var_0 = common_scripts\utility::_id_0CDD( var_0, var_3 );
    return var_0;
}

_id_0CDC( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 != "none" )
        var_0[var_0.size] = var_1;

    return var_0;
}

_id_3F10( var_0 )
{
    var_1 = 0;
    var_2 = [];
    var_2[0] = "loot";
    var_2[1] = "gold";
    var_2[2] = "atlas";
    var_2[3] = "blops2";
    var_2[4] = "ghosts";

    foreach ( var_4 in var_2 )
    {
        for ( var_5 = 0; var_5 < var_0.size; var_5++ )
        {
            if ( tolower( var_0[var_5] ) != tolower( var_4[var_1] ) )
            {
                var_5 -= var_1;
                var_1 = 0;
                continue;
            }

            var_1++;

            if ( var_1 == var_4.size )
                break;
        }

        if ( var_1 == var_4.size )
        {
            var_0 = getsubstr( var_0, 0, var_5 - var_1 + 1 );
            break;
        }
        else
            var_1 = 0;
    }

    return var_0;
}

_id_188C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) || var_0 == "none" || var_0 == "" )
        return var_0;

    if ( !isdefined( level._id_56B6 ) )
        level._id_56B6 = _id_5946();

    var_6 = "";

    if ( issubstr( var_0, "iw5_" ) || issubstr( var_0, "h1_" ) )
    {
        var_7 = var_0 + "_mp";
        var_8 = var_0.size;

        if ( issubstr( var_0, "h1_" ) )
            var_6 = getsubstr( var_0, 3, var_8 );
        else
            var_6 = getsubstr( var_0, 4, var_8 );
    }
    else
    {
        var_7 = var_0;
        var_6 = var_0;
    }

    if ( var_7 == "h1_junsho_mp" )
        var_1 = "akimbohidden";

    var_9 = isdefined( var_1 ) && var_1 != "none";
    var_10 = isdefined( var_2 ) && var_2 != "none";

    if ( !var_10 )
    {
        var_11 = tablelookuprownum( "mp/furniturekits/base.csv", 0, var_7 );

        if ( var_11 >= 0 )
        {
            var_2 = "base";
            var_10 = 1;
        }
    }

    if ( var_9 || var_10 )
    {
        if ( !var_9 )
            var_1 = "none";

        if ( !var_10 )
            var_2 = "base";

        var_7 += ( "_a#" + var_1 );
        var_7 += ( "_f#" + var_2 );
    }

    if ( issubstr( var_7, "iw5_" ) || issubstr( var_7, "h1_" ) )
    {
        var_7 = _id_188E( var_7, var_4 );
        var_7 = buildweaponnameemblem( var_7, var_5 );
        var_7 = _id_188D( var_7, var_3 );
        return var_7;
    }
    else if ( !_id_51FC( var_7 + "_mp" ) )
        return var_0 + "_mp";
    else
    {
        var_7 = _id_188E( var_7, var_4 );
        var_7 = buildweaponnameemblem( var_7, var_5 );
        var_7 = _id_188D( var_7, var_3 );
        return var_7 + "_mp";
    }
}

_id_188D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( var_1 <= 0 )
        return var_0;

    if ( var_1 < 10 )
        var_0 += "_camo00";
    else if ( var_1 < 100 )
        var_0 += "_camo0";
    else
        var_0 += "_camo";

    var_0 += var_1;
    return var_0;
}

_id_188E( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( var_1 <= 0 )
        return var_0;

    var_0 += "_scope";
    var_0 += var_1;
    return var_0;
}

buildweaponnameemblem( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( var_1 < 0 )
        return var_0;

    var_0 += "_emblem";
    var_0 += ( var_1 + 1 );
    return var_0;
}

_id_5946()
{
    var_0 = [];
    var_0["a"] = 0;
    var_0["b"] = 1;
    var_0["c"] = 2;
    var_0["d"] = 3;
    var_0["e"] = 4;
    var_0["f"] = 5;
    var_0["g"] = 6;
    var_0["h"] = 7;
    var_0["i"] = 8;
    var_0["j"] = 9;
    var_0["k"] = 10;
    var_0["l"] = 11;
    var_0["m"] = 12;
    var_0["n"] = 13;
    var_0["o"] = 14;
    var_0["p"] = 15;
    var_0["q"] = 16;
    var_0["r"] = 17;
    var_0["s"] = 18;
    var_0["t"] = 19;
    var_0["u"] = 20;
    var_0["v"] = 21;
    var_0["w"] = 22;
    var_0["x"] = 23;
    var_0["y"] = 24;
    var_0["z"] = 25;
    return var_0;
}

_id_7403()
{
    var_0 = self.pers["team"];
    var_1 = self.pers["class"];
    var_2 = self getweaponslistall();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        self givemaxammo( var_4 );
        self setweaponammoclip( var_4, 9999 );

        if ( var_4 == "h1_claymore_mp" || var_4 == "claymore_detonator_mp" )
            self setweaponammostock( var_4, 2 );
    }

    if ( self getammocount( level._id_1E35[var_1]["primary"]["type"] ) < level._id_1E35[var_1]["primary"]["count"] )
        self setweaponammoclip( level._id_1E35[var_1]["primary"]["type"], level._id_1E35[var_1]["primary"]["count"] );

    if ( self getammocount( level._id_1E35[var_1]["secondary"]["type"] ) < level._id_1E35[var_1]["secondary"]["count"] )
        self setweaponammoclip( level._id_1E35[var_1]["secondary"]["type"], level._id_1E35[var_1]["secondary"]["count"] );
}

_id_64D1()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["class"] ) )
            var_0.pers["class"] = "";

        if ( !isdefined( var_0.pers["lastClass"] ) )
            var_0.pers["lastClass"] = "";

        var_0.class = var_0.pers["class"];
        var_0.lastclass = var_0.pers["lastClass"];
        var_0.detectexplosives = 0;
        var_0.bombsquadicons = [];
        var_0.bombsquadids = [];
    }
}

_id_35EC( var_0, var_1 )
{
    wait(var_0);
    self fadeovertime( var_1 );
    self.alpha = 0;
}

setclass( var_0 )
{
    self._id_24C3 = var_0;
}

_id_1EE7()
{
    self.pers["copyCatLoadout"]["inUse"] = 0;
}

foundinfraction( var_0 )
{
    _id_728C();
}

isdefaultunlocked()
{
    if ( maps\mp\_utility::_id_5153() )
        return 1;

    return 0;
}

_id_51F3( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_514D( var_0 ) )
        var_0 = _id_3F10( var_0 );

    switch ( var_0 )
    {
        case "h1_ak47":
        case "h1_g3":
        case "h1_g36c":
        case "h1_m14":
        case "h1_m16":
        case "h1_m4":
        case "h1_mp44":
        case "h1_xmlar":
        case "h1_aprast":
        case "h1_augast":
        case "h1_ak74u":
        case "h1_mp5":
        case "h1_p90":
        case "h1_skorpion":
        case "h1_uzi":
        case "h1_febsmg":
        case "h1_aprsmg":
        case "h1_augsmg":
        case "h1_m1014":
        case "h1_winchester1200":
        case "h1_kam12":
        case "h1_junsho":
        case "h1_m60e4":
        case "h1_rpd":
        case "h1_saw":
        case "h1_feblmg":
        case "h1_junlmg":
        case "h1_barrett":
        case "h1_dragunov":
        case "h1_m21":
        case "h1_m40a3":
        case "h1_remington700":
        case "h1_febsnp":
        case "h1_junsnp":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid primary: " + var_0 );

            return 0;
    }
}

_id_51F5( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_5092( var_1 ) )
        return _id_51F3( var_0 );

    if ( maps\mp\_utility::_id_514D( var_0 ) )
        var_0 = _id_3F10( var_0 );

    switch ( var_0 )
    {
        case "none":
        case "h1_beretta":
        case "h1_colt45":
        case "h1_deserteagle":
        case "h1_deserteagle55":
        case "h1_usp":
        case "h1_janpst":
        case "h1_aprpst":
        case "h1_augpst":
        case "h1_rpg":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_2 ) )
                foundinfraction( "Replacing invalid secondary: " + var_0 );

            return 0;
    }
}

_id_51E5( var_0, var_1, var_2 )
{
    var_3 = 0;

    switch ( var_0 )
    {
        case "none":
        case "thermal":
        case "stock":
        case "shotgun":
        case "gl":
        case "glmwr":
        case "masterkeymwr":
        case "glpremwr":
        case "masterkeypremwr":
        case "tacknifemwr":
        case "akimbo":
        case "zoomscope":
        case "ironsights":
        case "acog":
        case "acogsmg":
        case "reflex":
        case "reflexsmg":
        case "reflexlmg":
        case "silencer":
        case "silencer02":
        case "silencer03":
        case "grip":
        case "gp25":
        case "m320":
        case "thermalsmg":
        case "heartbeat":
        case "fmj":
        case "rof":
        case "xmags":
        case "dualmag":
        case "eotech":
        case "eotechsmg":
        case "eotechlmg":
        case "tactical":
        case "scopevz":
        case "hamrhybrid":
        case "hybrid":
        case "parabolicmicrophone":
        case "opticsreddot":
        case "opticsacog2":
        case "opticseotech":
        case "opticsthermal":
        case "silencer01":
        case "sensorheartbeat":
        case "foregrip":
        case "variablereddot":
        case "opticstargetenhancer":
        case "firerate":
        case "longrange":
        case "quickdraw":
        case "lasersight":
        case "thorscopevz":
        case "trackrounds":
        case "stabilizer":
        case "heatsink":
        case "rw1scopebase":
        case "crossbowscopebase":
        case "silencerpistol":
        case "silencersniper":
        case "acogmwr":
        case "gripmwr":
        case "reflexmwr":
        case "silencermwr":
        case "akimbomwr":
        case "heartbeatmwr":
        case "holosightmwr":
        case "longbarrelmwr":
        case "reflexvarmwr":
        case "thermalmwr":
        case "varzoommwr":
        case "xmagmwr":
            var_3 = 1;
            break;
        default:
            var_3 = 0;
            break;
    }

    if ( var_3 && var_0 != "none" )
    {
        var_4 = maps\mp\_utility::_id_4160( var_1 );
        var_3 = common_scripts\utility::_id_0CE4( var_4, var_0 );
    }

    if ( !var_3 && maps\mp\_utility::_id_5092( var_2 ) )
        foundinfraction( "Replacing invalid attachment: " + var_0 );

    return var_3;
}

_id_50C0( var_0, var_1 )
{
    if ( isdefaultunlocked() )
        return 1;

    var_2 = _id_3F10( var_0 );
    var_3 = var_2 + " " + var_1;

    if ( !self isitemunlocked( var_3 ) )
        return 0;

    return 1;
}

_id_51E7( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "none":
        case "white":
        case "desert":
        case "woodland":
        case "gold":
        case "digital":
        case "bluetiger":
        case "redtiger":
        case "redhex":
        case "odgreen":
        case "fde":
        case "nickel":
        case "neontiger":
        case "diamond":
        case "darkmatter":
        case "camo016":
        case "camo017":
        case "camo018":
        case "camo019":
        case "camo020":
        case "camo021":
        case "camo022":
        case "camo023":
        case "camo024":
        case "camo025":
        case "camo026":
        case "camo027":
        case "camo028":
        case "camo029":
        case "camo030":
        case "camo031":
        case "camo032":
        case "camo033":
        case "camo034":
        case "camo035":
        case "camo036":
        case "camo037":
        case "camo038":
        case "camo039":
        case "camo040":
        case "camo041":
        case "camo042":
        case "camo043":
        case "camo044":
        case "camo045":
        case "camo046":
        case "camo047":
        case "camo048":
        case "camo049":
        case "camo050":
        case "camo051":
        case "camo052":
        case "camo053":
        case "camo054":
        case "camo055":
        case "camo056":
        case "camo057":
        case "camo058":
        case "camo059":
        case "camo060":
        case "camo061":
        case "camo062":
        case "camo063":
        case "camo064":
        case "camo065":
        case "camo066":
        case "camo067":
        case "camo068":
        case "camo069":
        case "camo070":
        case "camo071":
        case "camo072":
        case "camo073":
        case "camo074":
        case "camo075":
        case "camo076":
        case "camo077":
        case "camo078":
        case "camo079":
        case "camo080":
        case "camo081":
        case "camo082":
        case "camo083":
        case "camo084":
        case "camo085":
        case "camo086":
        case "camo087":
        case "camo088":
        case "camo089":
        case "wcamo_code":
        case "wc_aftermath_01":
        case "wc_aftermath_02":
        case "wc_aftermath_03":
        case "wc_aftermath_04":
        case "wc_aftermath_05":
        case "wc_aftermath_06":
        case "wc_aftermath_07":
        case "wc_aftermath_reward":
        case "wc_battlescarred_01":
        case "wc_czar_01":
        case "wc_diablo_01":
        case "wc_diablo_02":
        case "wc_diablo_03":
        case "wc_diablo_04":
        case "wc_diablo_05":
        case "wc_diablo_06":
        case "wc_diablo_07":
        case "wc_diablo_reward":
        case "wc_funhouse_01":
        case "wc_funhouse_02":
        case "wc_funhouse_03":
        case "wc_funhouse_04":
        case "wc_funhouse_05":
        case "wc_funhouse_06":
        case "wc_funhouse_07":
        case "wc_funhouse_reward":
        case "wc_gladiator_01":
        case "wc_hatchetman_01":
        case "wc_hunter_01":
        case "wc_hunter_02":
        case "wc_hunter_03":
        case "wc_hunter_04":
        case "wc_hunter_05":
        case "wc_hunter_06":
        case "wc_hunter_07":
        case "wc_hunter_reward":
        case "wc_huntsman_01":
        case "wc_kamchatka12_01":
        case "wc_lawman_01":
        case "wc_magnum_01":
        case "wc_xmlar_01":
        case "wc_arcticwolf_01":
        case "wc_amoeba_01":
        case "wc_amoeba_02":
        case "wc_amoeba_03":
        case "wc_amoeba_04":
        case "wc_amoeba_05":
        case "wc_amoeba_06":
        case "wc_amoeba_07":
        case "wc_amoeba_reward":
        case "wc_avalanche_01":
        case "wc_boss_01":
        case "wc_chalk_01":
        case "wc_challenger_01":
        case "wc_decay_01":
        case "wc_decay_02":
        case "wc_decay_03":
        case "wc_decay_04":
        case "wc_decay_05":
        case "wc_decay_06":
        case "wc_decay_07":
        case "wc_decay_reward":
        case "wc_dmr25s_01":
        case "wc_etch_01":
        case "wc_etch_02":
        case "wc_etch_03":
        case "wc_etch_04":
        case "wc_etch_05":
        case "wc_etch_06":
        case "wc_etch_07":
        case "wc_etch_reward":
        case "wc_exlibris_01":
        case "wc_exlibris_02":
        case "wc_exlibris_03":
        case "wc_exlibris_04":
        case "wc_exlibris_05":
        case "wc_exlibris_06":
        case "wc_exlibris_07":
        case "wc_exlibris_reward":
        case "wc_frag_01":
        case "wc_graves_01":
        case "wc_killshot_01":
        case "wc_kingpin_01":
        case "wc_mac10_01":
        case "wc_mastercraft_01":
        case "wc_mechanic_01":
        case "wc_minerva_01":
        case "wc_minerva_02":
        case "wc_minerva_03":
        case "wc_minerva_04":
        case "wc_minerva_05":
        case "wc_minerva_06":
        case "wc_minerva_07":
        case "wc_minerva_reward":
        case "wc_noobtuber_01":
        case "wc_pigpen_01":
        case "wc_pkm_01":
        case "wc_reflex_01":
        case "wc_reptile_01":
        case "wc_reptile_02":
        case "wc_reptile_03":
        case "wc_reptile_04":
        case "wc_reptile_05":
        case "wc_reptile_06":
        case "wc_reptile_07":
        case "wc_reptile_reward":
        case "wc_samurai_01":
        case "wc_titanium_01":
        case "wc_ultraviolet_01":
        case "wc_venom_01":
        case "wc_wartorn_01":
        case "wc_leprechaun_01":
        case "wc_stpatty_01":
        case "wc_stpatty_02":
        case "wc_highnoon_01":
        case "wc_phalanx_01":
        case "wc_urbanwarfare_01":
        case "wc_fieldtested_01":
        case "wc_kingfish_01":
        case "wc_tacticalfighter_01":
        case "wc_battletested_01":
        case "wc_diabolical_01":
        case "wc_caveman_01":
        case "wc_sawtooth_01":
        case "wc_bos14_01":
        case "wc_fang45_01":
        case "wc_prokolot_01":
        case "wc_hightech_01":
        case "wc_hightech_02":
        case "wc_hightech_03":
        case "wc_hightech_04":
        case "wc_hightech_05":
        case "wc_hightech_06":
        case "wc_hightech_07":
        case "wc_hightech_reward":
        case "wc_rebel_01":
        case "wc_rebel_02":
        case "wc_rebel_03":
        case "wc_rebel_04":
        case "wc_rebel_05":
        case "wc_rebel_06":
        case "wc_rebel_07":
        case "wc_rebel_reward":
        case "wc_geist_01":
        case "wc_geist_02":
        case "wc_geist_03":
        case "wc_geist_04":
        case "wc_geist_05":
        case "wc_geist_06":
        case "wc_geist_07":
        case "wc_geist_reward":
        case "wc_operator_01":
        case "wc_operator_02":
        case "wc_operator_03":
        case "wc_operator_04":
        case "wc_operator_05":
        case "wc_operator_06":
        case "wc_operator_07":
        case "wc_operator_reward":
        case "wc_summertime_01":
        case "wc_nauticus_01":
        case "wc_celebration_01":
        case "wc_pyrotechnic_01":
        case "wc_stac330_01":
        case "wc_beredmk8_01":
        case "wc_wolfen_01":
        case "wc_warscarred_01":
        case "wc_slate_01":
        case "wc_grisly_01":
        case "wc_blackout_01":
        case "wc_glacier_01":
        case "wc_masterpiece_01":
        case "wc_don_01":
        case "wc_mudder_01":
        case "wc_liquidator_01":
        case "wc_neanderthal_01":
        case "wc_reaper_01":
        case "wc_relic_01":
        case "wc_tribal_01":
        case "wc_bludgeon_01":
        case "wc_foliage_01":
        case "wc_foliage_02":
        case "wc_foliage_03":
        case "wc_foliage_04":
        case "wc_foliage_05":
        case "wc_foliage_06":
        case "wc_foliage_07":
        case "wc_foliage_reward":
        case "wc_flow_01":
        case "wc_flow_02":
        case "wc_flow_03":
        case "wc_flow_04":
        case "wc_flow_05":
        case "wc_flow_06":
        case "wc_flow_07":
        case "wc_flow_reward":
        case "wc_pixel_01":
        case "wc_pixel_02":
        case "wc_pixel_03":
        case "wc_pixel_04":
        case "wc_pixel_05":
        case "wc_pixel_06":
        case "wc_pixel_07":
        case "wc_pixel_reward":
        case "wc_texture_01":
        case "wc_texture_02":
        case "wc_texture_03":
        case "wc_texture_04":
        case "wc_texture_05":
        case "wc_texture_06":
        case "wc_texture_07":
        case "wc_texture_reward":
        case "wc_iris_01":
        case "wc_iris_02":
        case "wc_iris_03":
        case "wc_iris_04":
        case "wc_iris_05":
        case "wc_iris_06":
        case "wc_iris_07":
        case "wc_iris_reward":
        case "wc_burnt_01":
        case "wc_burnt_02":
        case "wc_burnt_03":
        case "wc_burnt_04":
        case "wc_burnt_05":
        case "wc_burnt_06":
        case "wc_burnt_07":
        case "wc_burnt_reward":
        case "wc_summer_01":
        case "wc_summer_02":
        case "wc_summer_03":
        case "wc_summer_04":
        case "wc_ranger_01":
        case "wc_ranger_02":
        case "wc_lynxcq300_01":
        case "wc_pkpsd9_01":
        case "wc_br9_01":
        case "wc_centermass_01":
        case "wc_elder_01":
        case "wc_obsidian_01":
        case "wc_ghillie_01":
        case "wc_urbanoperator_01":
        case "wc_firedrake_01":
        case "wc_specops_01":
        case "wc_enforce_01":
        case "wc_barber_01":
        case "wc_dangerclose_01":
        case "wc_cosmos_01":
        case "wc_cosmos_02":
        case "wc_cosmos_03":
        case "wc_cosmos_04":
        case "wc_cosmos_05":
        case "wc_cosmos_06":
        case "wc_cosmos_07":
        case "wc_cosmos_reward":
        case "wc_sweettooth_01":
        case "wc_sweettooth_02":
        case "wc_sweettooth_03":
        case "wc_sweettooth_04":
        case "wc_sweettooth_05":
        case "wc_sweettooth_06":
        case "wc_sweettooth_07":
        case "wc_sweettooth_reward":
        case "wc_tomahawk_01":
        case "wc_tomahawk_02":
        case "wc_tomahawk_03":
        case "wc_tomahawk_04":
        case "wc_tomahawk_05":
        case "wc_tomahawk_06":
        case "wc_tomahawk_07":
        case "wc_tomahawk_reward":
        case "wc_super_01":
        case "wc_super_02":
        case "wc_super_03":
        case "wc_super_04":
        case "wc_super_05":
        case "wc_super_06":
        case "wc_super_07":
        case "wc_super_reward":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid camo: " + var_0 );

            return 0;
    }
}

_id_51F4( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "none":
        case "ret007":
        case "ret008":
        case "ret009":
        case "ret010":
        case "ret011":
        case "ret012":
        case "ret013":
        case "ret014":
        case "ret016":
        case "ret017":
        case "ret018":
        case "ret019":
        case "ret021":
        case "ret024":
        case "ret025":
        case "ret026":
        case "ret027":
        case "ret028":
        case "ret030":
        case "ret031":
        case "ret032":
        case "ret033":
        case "ret034":
        case "ret035":
        case "ret036":
        case "ret037":
        case "ret038":
        case "ret041":
        case "ret042":
        case "ret043":
        case "ret044":
        case "ret045":
        case "ret046":
        case "ret047":
        case "ret048":
        case "ret049":
        case "ret050":
        case "ret051":
        case "ret052":
        case "ret053":
        case "ret054":
        case "ret055":
        case "ret056":
        case "ret057":
        case "ret058":
        case "ret059":
        case "ret060":
        case "ret061":
        case "ret062":
        case "ret063":
        case "ret064":
        case "ret065":
        case "ret066":
        case "ret067":
        case "ret068":
        case "ret069":
        case "ret070":
        case "ret071":
        case "ret072":
        case "ret073":
        case "ret074":
        case "ret075":
        case "ret076":
        case "ret077":
        case "ret078":
        case "ret080":
        case "ret081":
        case "ret085":
        case "ret086":
        case "ret089":
        case "ret091":
        case "ret094":
        case "ret095":
        case "ret096":
        case "ret097":
        case "ret100":
        case "ret101":
        case "ret102":
        case "ret103":
        case "ret104":
        case "ret105":
        case "ret106":
        case "ret107":
        case "ret108":
        case "ret114":
        case "ret115":
        case "ret116":
        case "ret117":
        case "ret118":
        case "ret120":
        case "ret121":
        case "ret_angle_01":
        case "ret_angle_02":
        case "ret_angle_03":
        case "ret_angle_04":
        case "ret_angle_05":
        case "ret_angle_06":
        case "ret_angle_07":
        case "ret_angle_reward":
        case "ret_avalanche_01":
        case "ret_bent_01":
        case "ret_bent_02":
        case "ret_bent_03":
        case "ret_bent_04":
        case "ret_bent_05":
        case "ret_bent_06":
        case "ret_bent_07":
        case "ret_bent_reward":
        case "ret_chalk_01":
        case "ret_challenger_01":
        case "ret_dmr25s_01":
        case "ret_frag_01":
        case "ret_graves_01":
        case "ret_ironsmith_01":
        case "ret_ironsmith_02":
        case "ret_ironsmith_03":
        case "ret_ironsmith_04":
        case "ret_ironsmith_05":
        case "ret_ironsmith_06":
        case "ret_ironsmith_07":
        case "ret_ironsmith_reward":
        case "ret_killshot_01":
        case "ret_kingpin_01":
        case "ret_mac10_01":
        case "ret_mastercraft_01":
        case "ret_mechanic_01":
        case "ret_noobtuber_01":
        case "ret_pigpen_01":
        case "ret_pkm_01":
        case "ret_reflex_01":
        case "ret_samurai_01":
        case "ret_titanium_01":
        case "ret_ultraviolet_01":
        case "ret_venom_01":
        case "ret_vortex_01":
        case "ret_vortex_02":
        case "ret_vortex_03":
        case "ret_vortex_04":
        case "ret_vortex_05":
        case "ret_vortex_06":
        case "ret_vortex_07":
        case "ret_vortex_reward":
        case "ret_wartorn_01":
        case "ret_leprechaun_01":
        case "ret_highnoon_01":
        case "ret_urbanwarfare_01":
        case "ret_fieldtested_01":
        case "ret_kingfish_01":
        case "ret_tacticalfighter_01":
        case "ret_battletested_01":
        case "ret_diabolical_01":
        case "ret_caveman_01":
        case "ret_sawtooth_01":
        case "ret_bos14_01":
        case "ret_fang45_01":
        case "ret_phalanx_01":
        case "ret_focal_01":
        case "ret_focal_02":
        case "ret_focal_03":
        case "ret_focal_04":
        case "ret_focal_05":
        case "ret_focal_06":
        case "ret_focal_07":
        case "ret_focal_reward":
        case "ret_facet_01":
        case "ret_facet_02":
        case "ret_facet_03":
        case "ret_facet_04":
        case "ret_facet_05":
        case "ret_facet_06":
        case "ret_facet_07":
        case "ret_facet_reward":
        case "ret_summertime_01":
        case "ret_nauticus_01":
        case "ret_celebration_01":
        case "ret_pyrotechnic_01":
        case "ret_stac330_01":
        case "ret_beredmk8_01":
        case "ret_wolfen_01":
        case "ret_warscarred_01":
        case "ret_slate_01":
        case "ret_grisly_01":
        case "ret_blackout_01":
        case "ret_glacier_01":
        case "ret_masterpiece_01":
        case "ret_don_01":
        case "ret_mudder_01":
        case "ret_liquidator_01":
        case "ret_neanderthal_01":
        case "ret_reaper_01":
        case "ret_tribal_01":
        case "ret_bludgeon_01":
        case "ret_subdivision_01":
        case "ret_subdivision_02":
        case "ret_subdivision_03":
        case "ret_subdivision_04":
        case "ret_subdivision_05":
        case "ret_subdivision_06":
        case "ret_subdivision_07":
        case "ret_subdivision_reward":
        case "ret_monarch_01":
        case "ret_monarch_02":
        case "ret_monarch_03":
        case "ret_monarch_04":
        case "ret_monarch_05":
        case "ret_monarch_06":
        case "ret_monarch_07":
        case "ret_monarch_reward":
        case "ret_interrupt_01":
        case "ret_interrupt_02":
        case "ret_interrupt_03":
        case "ret_interrupt_04":
        case "ret_interrupt_05":
        case "ret_interrupt_06":
        case "ret_interrupt_07":
        case "ret_interrupt_reward":
        case "ret_phantasm_01":
        case "ret_phantasm_02":
        case "ret_phantasm_03":
        case "ret_phantasm_04":
        case "ret_phantasm_05":
        case "ret_phantasm_06":
        case "ret_phantasm_07":
        case "ret_phantasm_reward":
        case "ret_lynxcq300_01":
        case "ret_pkpsd9_01":
        case "ret_centermass_01":
        case "ret_elder_01":
        case "ret_obsidian_01":
        case "ret_ghillie_01":
        case "ret_urbanoperator_01":
        case "ret_firedrake_01":
        case "ret_specops_01":
        case "ret_enforce_01":
        case "ret_barber_01":
        case "ret_dangerclose_01":
        case "ret_monarch2_01":
        case "ret_monarch2_02":
        case "ret_monarch2_03":
        case "ret_monarch2_04":
        case "ret_monarch2_05":
        case "ret_monarch2_06":
        case "ret_monarch2_07":
        case "ret_monarch2_reward":
        case "ret_wildcard_01":
        case "ret_wildcard_02":
        case "ret_wildcard_03":
        case "ret_wildcard_04":
        case "ret_wildcard_05":
        case "ret_wildcard_06":
        case "ret_wildcard_07":
        case "ret_wildcard_reward":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid reticle " + var_0 );

            return 0;
    }
}

isattachkitunlocked( var_0, var_1 )
{
    if ( isdefaultunlocked() )
        return 1;

    var_2 = tablelookup( "mp/attachkits.csv", 1, var_1, 7 );

    if ( !self isitemunlocked( var_2 ) )
        return 0;

    var_3 = _id_3F10( var_0 );
    var_4 = var_3 + " " + var_1;

    if ( !self isitemunlocked( var_4 ) )
        return 0;

    return 1;
}

isvalidattachkit( var_0, var_1, var_2 )
{
    if ( var_0 == "none" )
        return 1;

    var_3 = _func_304( "mp/attachkits.csv", 1, var_0 );

    if ( var_3 <= 0 )
    {
        if ( maps\mp\_utility::_id_5092( var_2 ) )
            foundinfraction( "Replacing invalid attachKit " + var_0 );

        return 0;
    }

    if ( var_1 == "h1_mp44" || var_1 == "h1_deserteagle" || var_1 == "h1_deserteagle55" )
    {
        var_4 = tablelookupbyrow( "mp/attachkits.csv", var_3, 7 );
        var_5 = getinventoryitemtype( var_4 );

        if ( var_5 == "default" )
        {
            if ( maps\mp\_utility::_id_5092( var_2 ) )
                foundinfraction( "Replacing invalid attachKit " + var_0 );

            return 0;
        }
    }

    var_6 = tablelookupbyrow( "mp/attachkits.csv", var_3, 6 );

    if ( var_6 == "" )
        return 1;

    var_7 = maps\mp\_utility::getweaponclass( var_1 );
    var_8 = "";

    switch ( var_7 )
    {
        case "weapon_assault":
            var_8 = "ast";
            break;
        case "weapon_smg":
            var_8 = "smg";
            break;
        case "weapon_lmg":
        case "weapon_heavy":
            var_8 = "lmg";
            break;
        case "weapon_sniper":
            var_8 = "snp";
            break;
        case "weapon_shotgun":
            var_8 = "sht";
            break;
        case "weapon_pistol":
            var_8 = "pst";
            break;
        default:
            break;
    }

    var_9 = 0;

    if ( var_8 != "" )
    {
        var_10 = strtok( var_6, " " );

        foreach ( var_12 in var_10 )
        {
            if ( var_12 == var_8 )
            {
                var_9 = 1;
                break;
            }
        }
    }

    if ( !var_9 && maps\mp\_utility::_id_5092( var_2 ) )
    {
        foundinfraction( "Replacing invalid attachKit " + var_0 );
        return 0;
    }

    return 1;
}

isfurniturekitunlocked( var_0, var_1 )
{
    if ( isdefaultunlocked() )
        return 1;

    var_2 = _func_303( "mp/furniturekits.csv", 1, var_1, 2 );

    if ( !self isitemunlocked( var_2 ) )
        return 0;

    return 1;
}

isvalidfurniturekit( var_0, var_1, var_2 )
{
    var_3 = _func_304( "mp/furniturekits.csv", 1, var_0, 0 );

    if ( var_3 < 0 )
    {
        if ( maps\mp\_utility::_id_5092( var_2 ) )
            foundinfraction( "Replacing invalid furnitureKit " + var_0 );

        return 0;
    }

    var_4 = tablelookupbyrow( "mp/furniturekits.csv", var_3, 6 );

    if ( var_4 == "" )
        return 0;

    var_5 = maps\mp\_utility::getweaponclass( var_1 );
    var_6 = "";

    switch ( var_5 )
    {
        case "weapon_assault":
            var_6 = "ast";
            break;
        case "weapon_smg":
            var_6 = "smg";
            break;
        case "weapon_lmg":
        case "weapon_heavy":
            var_6 = "lmg";
            break;
        case "weapon_sniper":
            var_6 = "snp";
            break;
        case "weapon_shotgun":
            var_6 = "sht";
            break;
        case "weapon_pistol":
            var_6 = "pst";
            break;
        default:
            break;
    }

    var_7 = 0;

    if ( var_6 != "" )
    {
        var_8 = strtok( var_4, " " );

        foreach ( var_10 in var_8 )
        {
            if ( var_10 == var_6 )
            {
                var_7 = 1;
                break;
            }
        }
    }

    if ( !var_7 && maps\mp\_utility::_id_5092( var_2 ) )
    {
        foundinfraction( "Replacing invalid furnitureKit " + var_0 );
        return 0;
    }

    return 1;
}

_id_50D6( var_0, var_1, var_2, var_3 )
{
    if ( isdefaultunlocked() )
        return 1;

    var_4 = _id_3F10( var_0 );
    var_5 = var_4 + " " + var_1;

    if ( !maps\mp\_utility::_id_4FA6() )
    {
        if ( !self isitemunlocked( var_5, var_2 ) )
            return 0;
    }
    else if ( !self isitemunlocked( var_5, var_2, var_3 ) )
        return 0;

    return 1;
}

isperkequipment( var_0 )
{
    var_1 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_1 )
    {
        case "h1_claymore_mp":
        case "h1_c4_mp":
            return 1;
        default:
            return 0;
    }
}

isperkprimary( var_0 )
{
    var_1 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_1 )
    {
        case "h1_rpg_mp":
            return 1;
        default:
            return 0;
    }
}

_id_51EA( var_0, var_1 )
{
    var_0 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_0 )
    {
        case "specialty_null":
        case "h1_fraggrenade_mp":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid equipment: " + var_0 );

            return 0;
    }
}

_id_51F2( var_0, var_1 )
{
    var_0 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    switch ( var_0 )
    {
        case "none":
        case "specialty_null":
        case "h1_smokegrenade_mp":
        case "h1_concussiongrenade_mp":
        case "h1_flashgrenade_mp":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid offhand: " + var_0 );

            return 0;
    }
}

_id_51FC( var_0, var_1 )
{
    if ( !isdefined( level._id_A2E5 ) )
    {
        level._id_A2E5 = [];

        foreach ( var_3 in level.weaponlist )
            level._id_A2E5[var_3] = 1;
    }

    if ( isdefined( level._id_A2E5[var_0] ) )
        return 1;

    if ( maps\mp\_utility::_id_5092( var_1 ) )
        foundinfraction( "Replacing invalid weapon/attachment combo: " + var_0 );

    return 0;
}

_id_51EE( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "none":
        case "uav":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid killstreak: " + var_0 );

            return 0;
    }
}

isgrenadelauncher( var_0 )
{
    var_1 = maps\mp\_utility::getbasearrayforattachkit( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == "glmwr" )
            return 1;
    }

    return 0;
}

isgrip( var_0 )
{
    var_1 = maps\mp\_utility::getbasearrayforattachkit( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == "gripmwr" )
            return 1;
    }

    return 0;
}

isvalidmeleeweapon( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "none":
        case "h1_meleeshovel":
        case "h1_meleepaddle":
        case "h1_meleebottle":
        case "h1_meleeblade":
        case "h1_meleeicepick":
        case "h1_meleebayonet":
        case "h1_meleegladius":
        case "h1_meleesickle":
        case "h1_meleehatchet":
        case "h1_meleefeb1":
        case "h1_meleefeb2":
        case "h1_meleefeb3":
        case "h1_meleefeb4":
        case "h1_meleefeb5":
        case "h1_meleeapr1":
        case "h1_meleeapr2":
        case "h1_meleeapr3":
        case "h1_meleeapr4":
        case "h1_meleejun1":
        case "h1_meleejun2":
        case "h1_meleejun3":
        case "h1_meleejun4":
        case "h1_meleejun5":
        case "h1_meleejun6":
        case "h1_meleeaug1":
        case "h1_meleeaug2":
        case "h1_meleeaug3":
        case "h1_meleeaug4":
            return 1;
        default:
            if ( maps\mp\_utility::_id_5092( var_1 ) )
                foundinfraction( "Replacing invalid melee weapon: " + var_0 );

            return 0;
    }
}
