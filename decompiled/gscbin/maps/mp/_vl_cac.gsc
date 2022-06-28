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

init_cac()
{
    initweaponavatar();
    level.cac_weapon_base = "";
    level.weaponmodelboundscache = [];
    level.vl_selectedfaction = 0;
    buildfactions();
    level.vl_cac_getfactionteam = ::getfactionteam;
    level.vl_cac_getfactionenvironment = ::getfactionenvironment;
}

playercacprocesslui( var_0, var_1 )
{
    if ( var_0 == "reset_loadout" )
        resetloadout( var_1 );
    else
    {
        if ( maps\mp\_utility::_id_5092( level.in_depot ) )
            return;

        if ( var_0 == "cac" )
            handlecacmodechange( var_1 );
        else if ( var_0 == "classpreview" || issubstr( var_0, "preset_classpreview" ) )
            handleclassselect( var_0, var_1 );
        else if ( var_0 == "weapon_highlighted" && var_1 != "none" )
        {
            if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
                maps\mp\_vl_cao::turncollectionsmodeoff();

            handleweaponhighlighted( var_1 );
        }
        else
        {
            if ( var_0 == "lootscreen_weapon_highlighted" )
            {
                handlecacweapmodechange( 0 );
                handlecacmodechange( 0 );
                return;
            }

            if ( var_0 == "faction_changed" )
                handlefactionchanged( var_1 );
        }
    }
}

resetloadout( var_0 )
{
    var_1 = var_0 & 15;
    var_2 = _id_A765::_id_3F9E( var_1 );
    var_3 = level._id_9EAB[var_2];

    if ( isdefined( var_3 ) )
    {
        level._id_9EA2 = var_2;
        thread _id_A765::_id_9E55( var_2, var_1, "lobby" + self._id_2522, 1 );
        var_4 = level._id_9EAB[level._id_9EA2];
        level._id_1999 = var_3.privatematchsquadmembers;
    }
}

handlecacweapmodechange( var_0, var_1 )
{
    if ( var_0 == 0 )
    {
        if ( maps\mp\_utility::_id_5092( level.cac_weap ) )
        {
            _id_A765::resetweaponavatar();
            _id_A765::resetplayeravatar();
            playerhidecacavatars();
            thread _id_A765::handlerotateplayeravatar();
            _id_A765::playerpopcameramode();
            level.cac_weap = undefined;
            return 1;
        }
    }
    else if ( !maps\mp\_utility::_id_5092( level.cac_weap ) )
    {
        _id_A765::resetweaponavatar();
        thread _id_A765::handlerotateweaponavatar( var_1 );
        level.cac_weap = 1;
        _id_A765::playerchangecameramode( "cac_weap" );
        _id_A765::playersetlobbyfovscale();
        return 1;
    }

    return 0;
}

handlecacmodechange( var_0 )
{
    if ( var_0 == 0 )
    {
        if ( maps\mp\_utility::_id_5092( level._id_1975 ) )
        {
            if ( maps\mp\_utility::_id_5092( level.cac_weap ) )
                handlecacweapmodechange( 0 );

            _id_A765::resetweaponavatar();
            _id_A765::resetplayeravatar();
            self notify( "handleRotateAvatar" );
            _id_A765::playerpopcameramode();
            level._id_1975 = undefined;
        }
        else
            self notify( "handleRotateAvatar" );
    }
    else if ( maps\mp\_utility::_id_5092( level.cac_weap ) )
        handlecacweapmodechange( 0 );
    else if ( !maps\mp\_utility::_id_5092( level._id_1975 ) )
    {
        _id_A765::resetplayeravatar();
        thread _id_A765::handlerotateplayeravatar();
        level._id_1975 = 1;
        _id_A766::_id_382D();
        var_1 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::playerteleportavatartocac( var_1 );
        _id_A765::playerchangecameramode( "cac" );
    }
}

handleclassselect( var_0, var_1 )
{
    if ( var_1 >= 0 )
    {
        var_2 = var_1 & 15;
        level.caccontroller = var_2;
        var_3 = int( var_1 / 16 );
        _id_A765::vlprintln( "handleClassSelect " + var_0 + " controller=" + var_2 + "  class=" + var_3 );

        if ( var_3 > 0 )
            self._id_2522 = var_3;

        var_4 = maps\mp\_utility::_id_197E();
        self.currentclassloc = var_4;
        var_5 = _id_A765::_id_3F9E( var_2 );
        var_6 = level._id_9EAB[var_5];

        if ( isdefined( var_6 ) )
        {
            var_7 = getvlclass( var_0, self._id_2522 );
            _func_300( var_2 );
            level._id_9EA2 = var_5;

            if ( !maps\mp\_vl_cao::isequipmenuactive() )
                handlecacmodechange( 1 );

            maps\mp\_vl_avatar::_id_4846( var_6 );
            _id_A766::_id_7DDB( 1 );
            thread _id_A765::_id_9E55( var_5, var_2, var_7, 1 );
            level._id_1999 = var_6.privatematchsquadmembers;
            _id_A766::playerupdatecamera();
            return;
        }
    }
    else
        handlecacmodechange( 0 );
}

handleweaponhighlighted( var_0 )
{
    var_1 = 0;
    var_2 = strtok( var_0, "_" );
    var_3 = "none";
    var_4 = 0;

    if ( var_2.size > 1 )
    {
        var_4 = int( var_2[0] );
        var_2 = maps\mp\_utility::_id_0CFA( var_2, 0 );
        var_3 = parseweaponhighlightedcategory( var_2[0] );
    }

    if ( var_0 != "none" && var_0 != "" && !maps\mp\_vl_cao::iscollectionsmenuactive() && !maps\mp\_vl_cao::isarmorymenuactive() )
    {
        maps\mp\_vl_avatar::_id_4847();
        var_5 = handlecacweapmodechange( 1, var_3 );

        if ( var_5 )
            var_1 = 1;
    }

    var_6 = "weapons_lobby";

    if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
        var_6 = "weapons_collection";

    _id_A765::weaponroomscenelightsupdate( var_6 );

    if ( var_2.size > 1 )
    {
        var_7 = parseweaponhighlightedvalue( var_2[0], var_2[1] );
        var_8 = "none";
        var_9 = "none";
        var_10 = 0;
        var_11 = 0;

        if ( var_2.size > 3 && var_2.size % 2 == 0 )
        {
            var_12 = ( var_2.size - 2 ) / 2;

            for ( var_13 = 0; var_13 < var_12; var_13++ )
            {
                var_14 = var_2[2 + var_13 * 2];
                var_15 = parseweaponhighlightedcategory( var_2[2 + var_13 * 2] );
                var_16 = var_2[3 + var_13 * 2];

                if ( var_15 == "FurnitureKit" )
                {
                    var_9 = parseweaponhighlightedvalue( var_14, var_16 );
                    continue;
                }

                if ( var_15 == "AttachKit" )
                {
                    var_8 = parseweaponhighlightedvalue( var_14, var_16 );
                    continue;
                }

                if ( var_15 == "Camo" )
                {
                    var_10 = int( var_16 );
                    continue;
                }

                if ( var_15 == "Reticle" )
                    var_11 = int( var_16 );
            }
        }

        var_17 = -1;

        if ( isdefined( self.emblemloadout.emblemindex ) )
        {
            if ( self.emblemloadout.shouldapplyemblemtoweapon )
                var_17 = self.emblemloadout.emblemindex;
        }
        else
        {
            var_18 = _func_2fa( var_4, common_scripts\utility::getstatsgroup_common(), "applyEmblemToWeapon" );

            if ( var_18 )
                var_17 = _func_2fa( var_4, common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
        }

        var_19 = shouldhidecamoonweapon( var_4, var_7, var_10 );

        if ( var_19 )
            var_10 = 0;

        thread setcacweapon( var_7, var_3, var_8, var_9, var_10, var_11, var_17, var_1 );
    }
    else
        thread setcacweapon( "none" );
}

doescamoignoreprivatematchunlock( var_0 )
{
    return tablelookuprownum( "mp/privateMatchLockTable.csv", 0, var_0 ) >= 0;
}

shouldhidecamoonweapon( var_0, var_1, var_2 )
{
    var_3 = tablelookup( "mp/camotable.csv", 0, var_2, 1 );
    var_4 = doescamoignoreprivatematchunlock( var_3 );
    return !maps\mp\gametypes\_class::_id_50D6( var_1, var_3, var_4, var_0 );
}

parseweaponhighlightedcategory( var_0 )
{
    switch ( var_0 )
    {
        case "1":
            return "Primary";
        case "2":
            return "Secondary";
        case "3":
            return "Equipment";
        case "4":
            return "Perk";
        case "5":
            return "FurnitureKit";
        case "6":
            return "AttachKit";
        case "7":
            return "Camo";
        case "8":
            return "Reticle";
        case "9":
            return "Melee";
        default:
            break;
    }

    return "none";
}

parseweaponhighlightedvalue( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "2":
        case "1":
        case "9":
            return tablelookup( "mp/statstable.csv", 0, var_1, 4 );
        case "3":
        case "4":
            return tablelookup( "mp/perktable.csv", 0, var_1, 1 );
        case "5":
            return tablelookup( "mp/furniturekits.csv", 0, var_1, 1 );
        case "6":
            return tablelookup( "mp/attachkits.csv", 0, var_1, 1 );
        case "7":
            return tablelookup( "mp/camotable.csv", 0, var_1, 1 );
        case "8":
            return tablelookup( "mp/reticletable.csv", 0, var_1, 1 );
        default:
            break;
    }

    return "none";
}

handlefactionchanged( var_0 )
{
    var_1 = strtok( var_0, ":" );

    if ( var_1.size > 1 )
    {
        var_2 = int( var_1[0] );
        var_3 = int( var_1[1] );
        level.vl_selectedfaction = var_2;
        var_4 = _id_A765::_id_3F9E( var_3 );

        if ( var_4 >= 0 )
        {
            var_5 = level._id_9EAB[var_4];

            if ( !isdefined( var_5._id_57D6 ) )
                var_5._id_57D6 = spawnstruct();

            var_5._id_57D6._id_A7E7 = var_2;
            thread _id_A765::playerrefreshavatar( var_4 );
        }
    }
}

updatefactionselection( var_0 )
{
    level.vl_selectedfaction = var_0;
}

streamcacweaponwait( var_0 )
{
    _id_A765::vlprintln( "weapon_stream: " + var_0 );
    var_1 = [ var_0 ];
    var_2 = gettime();
    var_3 = getdvarfloat( "scr_vl_minweaponstreamtime", 0.0 );
    waitframe;

    if ( self _meth_8508( var_1 ) )
        return;

    level.weaponavatarparent _meth_8094();
    waittillframeend;

    for (;;)
    {
        waitframe;

        if ( self _meth_8508( var_1 ) )
            break;

        waittillframeend;
    }

    while ( ( gettime() - var_2 ) / 1000 < var_3 )
        waittillframeend;
}

setcacweapon( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self notify( "setCacWeapon" );
    self endon( "setCacWeapon" );

    if ( maps\mp\_utility::_id_5092( var_7 ) )
        maps\mp\_utility::waittillplayersnextsnapshot( self );

    var_8 = "none";

    if ( var_0 != "none" )
    {
        if ( level.cac_weapon_base != var_0 )
        {
            _id_A765::resetweaponavatar();
            thread _id_A765::handlerotateweaponavatar( var_1 );
        }

        if ( var_1 == "Equipment" )
        {
            var_8 = var_0;
            showloadingweaponavatar( var_8, var_1 );
            streamcacweaponwait( var_8 );
        }
        else if ( var_1 == "Perk" )
            var_8 = var_0;
        else
        {
            var_8 = buildweaponnamecac( var_0, var_2, var_3, var_4, var_5, var_6 );
            showloadingweaponavatar( var_8, var_1 );
            streamcacweaponwait( var_8 );
        }
    }

    level.cac_weapon_base = var_0;
    level._id_1999 = var_8;
    updateweaponavatar( var_1 );
}

buildweaponnamecac( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( issubstr( var_0, "meleebottle" ) || issubstr( var_0, "meleejun6" ) || issubstr( var_0, "meleejun5" ) )
        var_2 = "lby";

    return maps\mp\gametypes\_class::_id_188C( var_0, var_1, var_2, var_3, var_4, var_5 );
}

has_suffix( var_0, var_1 )
{
    if ( var_0.size >= var_1.size )
    {
        if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
            return 1;
    }

    return 0;
}

initweaponavatar()
{
    level.weaponavatarparent = common_scripts\utility::_id_8959();
    level.weaponavatarparent.cameralocation = common_scripts\utility::_id_40FB( "weaponCamera", "targetname" );
    spawnloadingweaponavatar( "h1_ak47loading_mp" );
    _id_A765::resetweaponavatar();
}

spawngenericprop3avatar()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 setModel( "genericprop_x3" );
    var_0 ScriptModelPlayAnim( "h1_lobby_turnaround_ranger_akimbo_align" );
    return var_0;
}

getoriginforoffset( var_0, var_1, var_2 )
{
    var_3 = var_0;
    var_4 = anglestoforward( var_1 );
    var_3 += var_4 * var_2[0];
    var_5 = anglestoright( var_1 );
    var_3 += var_5 * var_2[1];
    var_6 = anglestoup( var_1 );
    var_3 += var_6 * var_2[2];
    return var_3;
}

getweaponavatarforwarddistance( var_0, var_1 )
{
    var_2 = var_1["halfsize"];
    var_3 = var_2[0];
    var_4 = var_2[2];
    var_5 = 0;

    if ( isavatarameleeweapon( var_0 ) )
        var_5 = 3.54 * var_4 + 11.492;
    else
        var_5 = 1.8325 * var_3 + 28.587;

    if ( isavataraperk( var_0 ) )
        var_5 += 20;

    if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
        var_5 += 15;

    return var_5;
}

getweaponavatarrightdistance( var_0 )
{
    var_1 = 125;

    if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
        var_1 = 20;

    return var_1;
}

getweaponavatarupdistance( var_0, var_1 )
{
    var_2 = 0;

    if ( !isavatarameleeweapon( var_0 ) )
        var_2 = 20;

    if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
        var_2 -= 55;

    return var_2;
}

getweaponavatarlocation( var_0, var_1 )
{
    var_2 = getweaponavatarforwarddistance( var_0, var_1 );
    var_3 = getweaponavatarrightdistance( var_1 );
    var_4 = getweaponavatarupdistance( var_0, var_1 );
    var_5 = ( var_2, var_3, var_4 );
    var_6 = getdvarfloat( "cg_fov" );

    if ( isdefined( self.fovscale ) )
        var_6 *= self.fovscale;

    var_7 = self _meth_84EE( ( var_3, var_4, 0 ), var_6, var_2, 1 );
    return var_7;
}

getweaponbounds( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( level.weaponmodelboundscache[var_0._id_A2C6] ) )
        return level.weaponmodelboundscache[var_0._id_A2C6];
    else if ( !var_1 )
    {
        var_2 = getweaponmodelbounds( var_0 );

        if ( !isdefined( var_2 ) )
            var_2 = [];

        if ( !maps\mp\_utility::_id_5092( var_0.isloadingweapon ) )
            level.weaponmodelboundscache[var_0._id_A2C6] = var_2;

        return var_2;
    }
}

getavatarbounds( var_0, var_1 )
{
    if ( isweaponavataraweapon( var_0 ) )
        var_2 = getweaponbounds( var_0, var_1 );
    else
        var_2 = getperkbounds( var_0 );

    return var_2;
}

getweaponcenteroffset( var_0 )
{
    return var_0["midpoint"];
}

positionweaponavatar( var_0, var_1 )
{
    var_2 = getavatarbounds( var_0 );

    if ( var_2.size == 0 )
        return;

    var_3 = var_0;

    if ( isdefined( var_0.linker ) )
        var_3 = var_0.linker;

    var_3 _meth_8051();
    var_4 = getweaponavatarforwarddistance( var_0, var_2 );
    _id_A766::vl_dof_based_on_focus_weap_cac( var_4 );
    var_5 = getweaponavatarlocation( var_0, var_2 );
    var_6 = isavatarbottle( var_0 );
    var_7 = var_2["midpoint"];
    var_8 = var_2["halfsize"];

    if ( var_6 )
        var_7 = ( 0, 0, -1 * var_8[2] );
    else if ( var_1 == "Equipment" )
        var_7 = ( 0, 0, var_7[2] );

    var_3.owner_not = var_5 - var_7;

    if ( var_6 )
        var_3.angles = ( 185, 126, 0 );
    else if ( isweaponavataraweapon( var_0 ) )
        var_3.angles = ( 5, 0, 0 );
    else
        var_3.angles = ( 0, 300, 15 );

    level.weaponavatarparent.owner_not = var_5;
    var_9 = level.weaponavatarparent.angles;
    level.weaponavatarparent.angles = ( 0, 180, 0 );
    var_3 _meth_8442( level.weaponavatarparent );
    level.weaponavatarparent.angles = var_9;
}

getperkbounds( var_0 )
{
    if ( !isdefined( level.perkboundscache ) )
    {
        level.perkboundscache = [];

        if ( var_0 _meth_806A() )
        {
            var_0 _meth_8051();
            var_0.owner_not = ( 0, 0, 0 );
        }

        var_1 = var_0 _meth_8540( 0, 0, 0 );
        var_2 = var_0 _meth_8540( 1, 0, 0 );
        var_3 = distance( var_2, var_1 );
        var_4 = var_0 _meth_8540( 0, 1, 0 );
        var_5 = distance( var_4, var_1 );
        var_6 = var_0 _meth_8540( 0, 0, 1 );
        var_7 = distance( var_6, var_1 );
        level.perkboundscache["midpoint"] = var_1;
        level.perkboundscache["halfsize"] = ( var_3, var_5, var_7 );
    }

    return level.perkboundscache;
}

spawnloadingweaponavatar( var_0 )
{
    var_1 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" ).owner_not;
    var_2 = spawn( "weapon_" + var_0, var_1, 1 );
    var_2.isloadingweapon = 1;
    var_2 _meth_8447();
    var_2._id_A2C6 = var_0;
    var_2.linker = spawngenericprop3avatar();
    level.weaponavatarparent.loadingweaponavatar = var_2;
    return var_2;
}

showloadingweaponavatar( var_0, var_1 )
{
    setomnvar( "ui_cac_weapon_loading", 1 );
    hideweaponavatar();
    hideperkavatar();
    var_2 = level.weaponavatarparent.loadingweaponavatar;

    if ( !isdefined( var_2 ) )
        var_2 = spawnloadingweaponavatar( var_0 );
    else
    {
        var_2 _meth_8055();

        if ( var_2._id_A2C6 == var_0 )
            return;
    }

    var_3 = strtok( var_0, "_" );
    var_4 = var_3[0] + "_" + var_3[1] + "loading_mp";
    var_2 _meth_847F( var_4, 1 );
    var_2._id_A2C6 = var_0;
    var_2.category = var_1;
    var_5 = shouldplayidleanim( var_1 );
    weaponitemplayidleanim( var_2, var_5 );
    var_6 = isavatarakimbo( var_2 );

    if ( var_6 )
    {
        if ( !isdefined( var_2.akimboavatar ) )
        {
            var_7 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" ).owner_not;
            var_2.akimboavatar = spawn( "weapon_" + var_0, var_7, 1 );
            var_2.akimboavatar _meth_8447();
            var_2.akimboavatar _meth_8442( var_2.linker, "j_prop_2", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        }
        else
            var_2.akimboavatar _meth_8055();

        var_2.akimboavatar _meth_847F( var_4, 1 );
        weaponitemplayidleanim( var_2.akimboavatar, var_5 );
        var_2 _meth_8442( var_2.linker, "j_prop_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
    else
    {
        if ( isdefined( var_2.akimboavatar ) )
            var_2.akimboavatar _meth_8056();

        var_2 _meth_8442( var_2.linker, "j_prop_3", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }

    positionweaponavatar( var_2, var_1 );
}

hideloadingweaponavatar()
{
    setomnvar( "ui_cac_weapon_loading", 0 );

    if ( isdefined( level.weaponavatarparent.loadingweaponavatar ) )
    {
        var_0 = level.weaponavatarparent.loadingweaponavatar;
        var_0 _meth_8056();

        if ( isdefined( var_0.akimboavatar ) )
            var_0.akimboavatar _meth_8056();
    }
}

showweaponavatar( var_0 )
{
    var_1 = level.weaponavatarparent.savedweaponavatar;

    if ( !isdefined( var_1 ) )
    {
        var_1 = spawn( "weapon_" + level._id_1999, ( 0, 0, 0 ), 1 );
        var_1.isweapon = 1;
        level.weaponavatarparent.savedweaponavatar = var_1;
        var_1.linker = spawngenericprop3avatar();
    }
    else
        var_1 _meth_8055();

    var_1 _meth_847F( level._id_1999, 1 );
    var_1._id_A2C6 = level._id_1999;
    var_1.category = var_0;
    var_2 = shouldplayidleanim( var_0 );
    weaponitemplayidleanim( var_1, var_2 );
    var_3 = isavatarakimbo( var_1 );

    if ( var_3 )
    {
        if ( !isdefined( var_1.akimboavatar ) )
        {
            var_1.akimboavatar = spawn( "weapon_" + level._id_1999, ( 0, 0, 0 ), 1 );
            var_1.akimboavatar _meth_8442( var_1.linker, "j_prop_2", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        }
        else
            var_1.akimboavatar _meth_8055();

        var_1.akimboavatar _meth_847F( level._id_1999, 1 );
        weaponitemplayidleanim( var_1.akimboavatar, var_2 );
        var_1 _meth_8442( var_1.linker, "j_prop_1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
    else
    {
        if ( isdefined( var_1.akimboavatar ) )
            var_1.akimboavatar _meth_8056();

        var_1 _meth_8442( var_1.linker, "j_prop_3", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }

    positionweaponavatar( var_1, var_0 );
    level.weaponavatarparent.weaponavatar = var_1;
    _id_A765::_id_6F0F( level.weaponavatarparent );
}

shouldplayidleanim( var_0 )
{
    return var_0 != "Equipment" && var_0 != "Melee";
}

hideweaponavatar()
{
    if ( isdefined( level.weaponavatarparent.savedweaponavatar ) )
    {
        var_0 = level.weaponavatarparent.savedweaponavatar;
        var_0 _meth_8056();

        if ( isdefined( var_0.akimboavatar ) )
            var_0.akimboavatar _meth_8056();
    }
}

showperkavatar( var_0 )
{
    var_1 = level.weaponavatarparent.savedperkavatar;

    if ( !isdefined( var_1 ) )
    {
        var_1 = spawn( "script_model", ( 0, 0, 0 ) );
        var_1.isperk = 1;
        level.weaponavatarparent.savedperkavatar = var_1;
    }
    else
        var_1 _meth_8055();

    var_2 = getperkmodel( level._id_1999 );
    var_1 setModel( var_2 );
    var_1._id_A2C6 = level._id_1999;
    var_1.category = var_0;
    positionweaponavatar( var_1, var_0 );
    level.weaponavatarparent.weaponavatar = var_1;
    _id_A765::_id_6F0F( level.weaponavatarparent );
}

hideperkavatar()
{
    if ( isdefined( level.weaponavatarparent.savedperkavatar ) )
        level.weaponavatarparent.savedperkavatar _meth_8056();
}

playerhidecacavatars()
{
    hideloadingweaponavatar();
    hideweaponavatar();
    hideperkavatar();
    self notify( "setCacWeapon" );
}

updateweaponavatar( var_0 )
{
    if ( !isdefined( level.cac_weap ) && !maps\mp\_vl_cao::iscollectionsmenuactive() && !maps\mp\_vl_cao::isarmorymenuactive() )
        return;

    hideloadingweaponavatar();

    if ( level._id_1999 == "" || level._id_1999 == "none" || level._id_1999 == "specialty_null" )
    {
        hideperkavatar();
        hideweaponavatar();
    }
    else if ( var_0 == "Perk" )
    {
        hideweaponavatar();
        showperkavatar( var_0 );
    }
    else
    {
        hideperkavatar();
        showweaponavatar( var_0 );
    }

    level.weaponavatarparent _meth_8094();
}

isweaponavataraweapon( var_0 )
{
    return issubstr( var_0.classname, "weapon_" );
}

isavataraperk( var_0 )
{
    return maps\mp\_utility::_id_5092( var_0.isperk );
}

isavatarameleeweapon( var_0 )
{
    return var_0.category == "Melee";
}

isavatarbottle( var_0 )
{
    return isavatarameleeweapon( var_0 ) && ( issubstr( var_0._id_A2C6, "meleebottle" ) || issubstr( var_0._id_A2C6, "meleejun6" ) );
}

isavatarakimbo( var_0 )
{
    return issubstr( var_0._id_A2C6, "akimbo" );
}

getperkmodel( var_0 )
{
    var_1 = 1;
    var_2 = 14;
    return tablelookup( "mp/perktable.csv", var_1, var_0, var_2 );
}

buildfactions()
{
    var_0 = 1;
    var_1 = 2;
    level.vl_factions = [];
    var_2 = tablegetrowcount( "mp/uiFactionsTable.csv" );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = tablelookupbyrow( "mp/uiFactionsTable.csv", var_3, var_0 );
        var_5 = tablelookupbyrow( "mp/uiFactionsTable.csv", var_3, var_1 );
        var_6 = level.vl_factions.size;
        level.vl_factions[var_6] = spawnstruct();
        level.vl_factions[var_6]._id_3338 = var_5;
        level.vl_factions[var_6].team = var_4;
    }
}

getfactionenvironment()
{
    return level.vl_factions[level.vl_selectedfaction]._id_3338;
}

getfactionteam()
{
    return level.vl_factions[level.vl_selectedfaction].team;
}

setselectedfaction( var_0 )
{
    var_1 = maps\mp\gametypes\_class::cac_getlastteam( var_0 );
    var_2 = maps\mp\gametypes\_class::cac_getlastenvironment( var_0 );

    if ( var_1 == "axis" && var_2 == "urban" )
        var_2 = "woodland";

    level.vl_selectedfaction = getfactionindex( var_1, var_2 );
}

getfactionindex( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level.vl_factions.size; var_2++ )
    {
        var_3 = level.vl_factions[var_2];

        if ( var_3.team == var_0 && var_3._id_3338 == var_1 )
            return var_2;
    }

    return 0;
}

getvlclass( var_0, var_1 )
{
    var_2 = "none";

    if ( var_0 == "preset_classpreview_allies" )
        var_2 = "allies_recipe" + var_1;
    else if ( var_0 == "preset_classpreview_axis" )
        var_2 = "axis_recipe" + var_1;
    else if ( var_0 == "classpreview" )
        var_2 = "lobby" + var_1;

    if ( !isclassvalid( var_2, var_1 ) )
    {
        if ( var_1 > 0 )
            var_1--;

        var_2 = "class" + var_1;
    }

    return var_2;
}

isclassvalid( var_0, var_1 )
{
    if ( issubstr( var_0, "lobby" ) )
        return 1;
    else if ( issubstr( var_0, "axis" ) )
        var_2 = "axis";
    else if ( issubstr( var_0, "allies" ) )
        var_2 = "allies";
    else
        return 0;

    var_3 = maps\mp\_utility::_id_3F32( var_0 );
    var_4 = getmatchrulesdata( "defaultClasses", var_2, "defaultClass", var_3, "class", "weaponSetups", 0, "weapon" );
    return var_4 != "none";
}
