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

init_cao()
{
    level.cao_loc = spawnstruct();
    level.cao_loc.owner_not = ( 4065, -950, -69 );
    level.cao_loc.angles = ( 0, 267, 0 );
    level.cao_head = spawnstruct();
    level.cao_head.owner_not = ( 4065, -970, -75 );
    level.cao_head.angles = ( 0, 267, 0 );
    level.cao_loc_collection = spawnstruct();
    level.cao_loc_collection.owner_not = ( 4050, -950, -68 );
    level.cao_loc_collection.angles = ( 0, 267, 0 );
    level.cao_head_collection = spawnstruct();
    level.cao_head_collection.owner_not = ( 4050, -970, -75 );
    level.cao_head_collection.angles = ( 0, 267, 0 );
    level.collections = 0;
    level.armory = 0;
    level.equip = 0;
}

playercaoprocesslui( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( maps\mp\_utility::_id_5092( level.in_depot ) )
        return;

    if ( var_0 == "cao" )
        handlecaomodechange( var_1 );
    else if ( var_0 == "lootscreen_weapon_highlighted" )
        handlecaomodechange( -1 );
    else if ( var_0 == "costume_preview" )
    {
        if ( iscollectionsmenuactive() )
            handlecollectionsmodechange( 0, -1 );

        handlecostumepreview( var_1 );
    }
    else if ( var_0 == "costume_apply" )
        handlecostumeapply( var_1 );
    else if ( var_0 == "camo_preview" )
    {
        if ( iscollectionsmenuactive() )
            handlecollectionsmodechange( 0, -1 );

        handlecamopreview( var_1 );
    }
    else if ( var_0 == "camo_apply" )
        handlecamoapply( var_1 );
    else if ( var_0 == "collections_back" )
    {
        if ( iscollectionsmenuactive() )
            handlebackfromcollections( var_1 );
    }
}

handlecaomodechange( var_0 )
{
    if ( maps\mp\_utility::_id_5092( level.cao ) && var_0 < 0 )
    {
        level.cao = undefined;
        _id_A765::resetplayeravatar();
        self notify( "handleRotateAvatar" );
        var_1 = level._id_9EAB[level._id_9EA2];

        if ( isdefined( var_1 ) )
        {
            var_2 = maps\mp\_vl_cac::getfactionteam();
            var_3 = maps\mp\_vl_cac::getfactionenvironment();
            maps\mp\_vl_avatar::_id_9E9D( self, var_1, var_1.savedcostume, var_1.privatematchsquadmembers, var_2, var_3 );
            self _meth_857C( var_1.savedcharactercamoindex );
            var_1 _meth_857C( var_1.savedcharactercamoindex );
            var_1.savedcostume = undefined;
            var_1.savedcharactercamoindex = undefined;
        }

        _id_A765::playerpopcameramode();
    }
    else if ( !maps\mp\_utility::_id_5092( level.cao ) && var_0 >= 0 )
    {
        level.cao = 1;
        level._id_9EA2 = _id_A765::_id_3F9E( var_0 );
        var_1 = level._id_9EAB[level._id_9EA2];
        _id_A765::resetplayeravatar();
        thread _id_A765::handlerotateplayeravatar();
        _func_300( var_0 );
        var_1.savedcostume = _id_A78B::_id_1B0C( var_0 );
        var_1._id_2236 = var_1.savedcostume;
        var_2 = maps\mp\_vl_cac::getfactionteam();
        var_3 = maps\mp\_vl_cac::getfactionenvironment();
        maps\mp\_vl_avatar::_id_9E9D( self, var_1, var_1._id_2236, var_1.privatematchsquadmembers, var_2, var_3 );
        var_1.savedcharactercamoindex = _id_A78B::cao_getcharactercamoindex( var_0 );
        var_1._id_A7ED = var_1.savedcharactercamoindex;
        var_1 _meth_857C( var_1._id_A7ED );
        playerteleportavatartocao( var_1 );
        _id_A765::playerchangecameramode( "cao" );
        _id_A765::playersetlobbyfovscale();
        _id_A765::weaponroomscenelightsupdate( "characters_personalization" );
    }
    else if ( maps\mp\_utility::_id_5092( level.cao ) )
    {
        var_1 = level._id_9EAB[level._id_9EA2];

        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_1.savedcostume ) )
            {
                var_2 = maps\mp\_vl_cac::getfactionteam();
                var_3 = maps\mp\_vl_cac::getfactionenvironment();
                maps\mp\_vl_avatar::_id_9E9D( self, var_1, var_1.savedcostume, var_1.privatematchsquadmembers, var_2, var_3 );
            }

            if ( isdefined( var_1.savedcharactercamoindex ) )
            {
                var_1 _meth_857C( var_1.savedcharactercamoindex );
                var_1._id_A7ED = var_1.savedcharactercamoindex;
            }
        }

        playerteleportavatartocao( var_1 );
        _id_A765::weaponroomscenelightsupdate( "characters_personalization" );
    }
}

handlebackfromcollections( var_0 )
{
    handlecollectionsmodechange( 0, -1 );
    level._id_9EA2 = _id_A765::_id_3F9E( var_0 );
    var_1 = level._id_9EAB[level._id_9EA2];
    _id_A765::resetplayeravatar();
    thread _id_A765::handlerotateplayeravatar();
    _func_300( var_0 );
    var_1._id_2236 = var_1.savedcostume;
    var_2 = maps\mp\_vl_cac::getfactionteam();
    var_3 = maps\mp\_vl_cac::getfactionenvironment();
    maps\mp\_vl_avatar::_id_9E9D( self, var_1, var_1._id_2236, var_1.privatematchsquadmembers, var_2, var_3 );
    var_1 _meth_857C( var_1.savedcharactercamoindex );
    playerteleportavatartocao( var_1 );
    _id_A765::playersetlobbyfovscale();
    _id_A765::weaponroomscenelightsupdate( "characters_personalization" );
}

playerteleportavatartocao( var_0 )
{
    if ( level.collections == 1 )
        maps\mp\_vl_avatar::playerteleportavatarcao( var_0, level.cao_loc_collection );
    else
        maps\mp\_vl_avatar::playerteleportavatarcao( var_0, level.cao_loc );
}

playerteleportavatartocaohead( var_0 )
{
    if ( level.collections == 1 )
        maps\mp\_vl_avatar::playerteleportavatarcao( var_0, level.cao_head_collection );
    else
        maps\mp\_vl_avatar::playerteleportavatarcao( var_0, level.cao_head );
}

buildpreviewcostume( var_0 )
{
    self._id_2236[level._id_2238["head"]] = var_0;
}

handlecostumepreview( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    var_3 = int( var_1[1] );
    var_4 = _id_A765::_id_3F9E( var_2 );
    level._id_9EA2 = var_4;
    var_5 = level._id_9EAB[var_4];
    maps\mp\_vl_avatar::showavataronly( var_5, 0 );

    if ( isdefined( var_5 ) )
    {
        var_5 buildpreviewcostume( var_3 );
        var_6 = maps\mp\_vl_cac::getfactionteam();
        var_7 = maps\mp\_vl_cac::getfactionenvironment();
        maps\mp\_vl_avatar::_id_9E9D( self, var_5, var_5._id_2236, var_5.privatematchsquadmembers, var_6, var_7 );
    }

    var_8 = "heads_personalization";

    if ( level.collections == 1 )
        var_8 = "heads_collection";

    _id_A765::weaponroomscenelightsupdate( var_8 );
    playerteleportavatartocaohead( var_5 );
    return var_5;
}

handlecostumeapply( var_0 )
{
    var_1 = handlecostumepreview( var_0 );
    var_1.savedcostume = var_1._id_2236;
    playerteleportavatartocao( var_1 );
}

handlecamopreview( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    var_3 = int( var_1[1] );
    var_4 = _id_A765::_id_3F9E( var_2 );
    level._id_9EA2 = var_4;
    var_5 = level._id_9EAB[var_4];
    maps\mp\_vl_avatar::showavataronly( var_5, 0 );

    if ( isdefined( var_5 ) )
    {
        var_5._id_A7ED = var_3;
        var_5 _meth_857C( var_5._id_A7ED );
    }

    var_6 = "characters_personalization";

    if ( maps\mp\_utility::_id_5092( level.collections == 1 ) )
        var_6 = "characters_collection";

    _id_A765::weaponroomscenelightsupdate( var_6 );
    playerteleportavatartocao( var_5 );
    return var_5;
}

handlecamoapply( var_0 )
{
    var_1 = handlecamopreview( var_0 );
    var_1.savedcharactercamoindex = var_1._id_A7ED;
    playerteleportavatartocao( var_1 );
}

handlecollectionsmodechange( var_0, var_1 )
{
    if ( level.collections == 0 && var_0 == 0 )
        return;

    if ( var_0 != 2 )
        maps\mp\_vl_cac::playerhidecacavatars();

    if ( var_0 != 1 )
        maps\mp\_vl_avatar::_id_4847();

    if ( var_0 == 2 )
    {
        _id_A765::resetweaponavatar();
        thread _id_A765::handlerotateweaponavatar( "Primary" );
    }
    else if ( var_0 == 1 )
    {
        _id_A765::resetplayeravatar();
        thread _id_A765::handlerotateplayeravatar();
        var_2 = level._id_9EAB[level._id_9EA2];
        var_2.savedcollectionscostume = _id_A78B::_id_1B0C( var_1 );
        var_2.savedcollectionscharactercamoindex = _id_A78B::cao_getcharactercamoindex( var_1 );
    }

    if ( level.collections == 0 )
    {
        _func_300( var_1 );
        _id_A765::playersetlobbyfovscale();
        _id_A765::playerchangecameramode( "collections" );
        var_2 = level._id_9EAB[level._id_9EA2];
        var_3 = maps\mp\_vl_avatar::get_ownerid_for_avatar( var_2 );
        _id_A765::playerrefreshavatar( var_3 );
    }
    else if ( level.collections != 0 && var_0 == 0 )
    {
        if ( maps\mp\_utility::_id_5092( level.cao ) )
            thread _id_A765::handlerotateplayeravatar();
        else if ( !maps\mp\_utility::_id_5092( level.cac_weap ) )
            self notify( "handleRotateAvatar" );

        _id_A765::playerpopcameramode();
        playerresetavatarcollectionscostume();
        playerresetavatarcollectionscamo();
        var_2 = level._id_9EAB[level._id_9EA2];

        if ( isdefined( var_2 ) )
        {
            var_2.savedcollectionscostume = undefined;
            var_2.savedcollectionscharactercamoindex = undefined;

            if ( maps\mp\_utility::_id_5092( level._id_1975 ) )
            {
                maps\mp\_vl_avatar::showavataronly( var_2, 0 );
                maps\mp\_vl_avatar::playerteleportavatartocac( var_2 );
            }
        }
    }

    level.collections = var_0;
}

playerresetavatarcollectionscostume()
{
    var_0 = level._id_9EAB[level._id_9EA2];

    if ( isdefined( var_0 ) && isdefined( var_0.savedcollectionscostume ) )
    {
        var_1 = maps\mp\_vl_cac::getfactionteam();
        var_2 = maps\mp\_vl_cac::getfactionenvironment();
        maps\mp\_vl_avatar::_id_9E9D( self, var_0, var_0.savedcollectionscostume, var_0.privatematchsquadmembers, var_1, var_2 );
    }
}

playerresetavatarcollectionscamo()
{
    var_0 = level._id_9EAB[level._id_9EA2];

    if ( isdefined( var_0 ) && isdefined( var_0.savedcollectionscharactercamoindex ) )
    {
        self _meth_857C( var_0.savedcollectionscharactercamoindex );
        var_0 _meth_857C( var_0.savedcollectionscharactercamoindex );
        var_0._id_A7ED = var_0.savedcollectionscharactercamoindex;
    }
}

turncollectionsmodeoff()
{
    handlecollectionsmodechange( 0, -1 );
}

playercollectionsprocesslui( var_0, var_1 )
{
    if ( var_0 == "costume_preview_c" )
    {
        var_2 = strtok( var_1, "_" );
        var_3 = int( var_2[0] );
        handlecollectionsmodechange( 1, var_3 );
        handlecostumepreview( var_1 );
        playerresetavatarcollectionscamo();
    }
    else if ( var_0 == "camo_preview_c" )
    {
        var_2 = strtok( var_1, "_" );
        var_3 = int( var_2[0] );
        handlecollectionsmodechange( 1, var_3 );
        handlecamopreview( var_1 );
        playerresetavatarcollectionscostume();
    }
    else if ( var_0 == "weapon_highlighted_c" )
    {
        var_2 = strtok( var_1, "_" );
        var_3 = int( var_2[0] );
        handlecollectionsmodechange( 2, var_3 );
        maps\mp\_vl_cac::handleweaponhighlighted( var_1 );
    }
    else if ( var_0 == "depot_return" || var_0 == "leave_depot" || var_0 == "lootscreen_weapon_highlighted" )
        handlecollectionsmodechange( 0, -1 );
    else if ( var_0 == "costume_apply" )
    {
        if ( iscollectionsmenuactive() )
        {
            handledepotcostumeapply( var_1 );
            handlecollectionscostumeapply();
        }
    }
    else if ( var_0 == "camo_apply" )
    {
        if ( iscollectionsmenuactive() )
        {
            handledepotcamoapply( var_1 );
            handlecollectionscostumeapply();
        }
    }
}

handlecollectionscostumeapply()
{
    var_0 = level._id_9EAB[level._id_9EA2];
    var_0.savedcollectionscostume = var_0._id_2236;
    var_0.savedcollectionscharactercamoindex = var_0._id_A7ED;
}

iscollectionsmenuactive()
{
    return level.collections != 0;
}

handlearmorymodechange( var_0 )
{
    if ( level.armory == 0 && var_0 == 0 )
        return;

    if ( iscollectionsmenuactive() )
        handlecollectionsmodechange( 0, -1 );

    if ( level.armory == 0 && !iscollectionsmenuactive() )
    {
        _func_300( level.depotcontroller );
        _id_A765::playersetlobbyfovscale();
        _id_A765::playerchangecameramode( "armory" );
        var_1 = level._id_9EAB[level._id_9EA2];
        var_2 = maps\mp\_vl_avatar::get_ownerid_for_avatar( var_1 );
        _id_A765::playerrefreshavatar( var_2 );
    }
    else if ( level.armory != 0 && var_0 == 0 )
    {
        self notify( "handleRotateAvatar" );
        _id_A765::playerpopcameramode();
        var_1 = level._id_9EAB[level._id_9EA2];

        if ( isdefined( var_1 ) )
        {
            maps\mp\_vl_avatar::playerteleportavatartocac( var_1 );

            if ( isdefined( var_1.savedarmorycharactercamoindex ) )
            {
                var_3 = maps\mp\_vl_cac::getfactionteam();
                var_4 = maps\mp\_vl_cac::getfactionenvironment();
                maps\mp\_vl_avatar::_id_9E9D( self, var_1, var_1.savedarmorycostume, var_1.privatematchsquadmembers, var_3, var_4 );
                self _meth_857C( var_1.savedarmorycharactercamoindex );
                var_1 _meth_857C( var_1.savedarmorycharactercamoindex );
                var_1.savedarmorycostume = undefined;
                var_1.savedarmorycharactercamoindex = undefined;
            }
        }
    }

    if ( var_0 != 2 )
        maps\mp\_vl_cac::playerhidecacavatars();
    else if ( var_0 != 1 )
        maps\mp\_vl_avatar::_id_4847();

    if ( var_0 == 2 )
    {
        _id_A765::resetweaponavatar();
        thread _id_A765::handlerotateweaponavatar( "Primary" );
    }
    else if ( var_0 == 1 )
    {
        _id_A765::resetplayeravatar();
        thread _id_A765::handlerotateplayeravatar();
        var_1 = level._id_9EAB[level._id_9EA2];
        var_1.savedarmorycostume = _id_A78B::_id_1B0C( level.depotcontroller );
        var_1.savedarmorycharactercamoindex = _id_A78B::cao_getcharactercamoindex( level.depotcontroller );
    }

    level.armory = var_0;
}

playerarmoryprocesslui( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_5092( level.in_depot ) || isequipmenuactive() )
        return;

    if ( var_0 == "costume_preview" )
    {
        handlearmorymodechange( 1 );
        handlecostumepreview( var_1 );
    }
    else if ( var_0 == "camo_preview" )
    {
        handlearmorymodechange( 1 );
        handlecamopreview( var_1 );
    }
    else if ( var_0 == "weapon_highlighted" )
    {
        if ( var_1 != "none" )
            handlearmorymodechange( 2 );

        maps\mp\_vl_cac::handleweaponhighlighted( var_1 );
    }
    else if ( var_0 == "depot_return" || var_0 == "leave_depot" )
        handlearmorymodechange( 0 );
    else if ( var_0 == "depot_state" && var_1 == "pause" )
    {
        if ( isarmorymenuactive() && iscollectionsmenuactive() )
            handlecollectionsmodechange( 0, -1 );
    }
    else if ( var_0 == "costume_apply" )
    {
        if ( isarmorymenuactive() )
        {
            handledepotcostumeapply( var_1 );
            handlearmorycostumeapply();
        }
    }
    else if ( var_0 == "camo_apply" )
    {
        if ( isarmorymenuactive() )
        {
            handledepotcamoapply( var_1 );
            handlearmorycostumeapply();
        }
    }
}

handlearmorycostumeapply()
{
    var_0 = level._id_9EAB[level._id_9EA2];
    var_0.savedarmorycostume = var_0._id_2236;
    var_0.savedarmorycharactercamoindex = var_0._id_A7ED;
}

isarmorymenuactive()
{
    return level.armory != 0;
}

handleequipmodechange( var_0 )
{
    if ( level.equip == 0 && var_0 == 0 )
        return;

    if ( level.equip == 0 )
    {
        maps\mp\_vl_cac::playerhidecacavatars();
        _id_A765::resetplayeravatar();
        thread _id_A765::handlerotateplayeravatar();
        _id_A766::_id_382D();
        var_1 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::playerteleportavatartocac( var_1 );
        _id_A765::playersetlobbyfovscale();
        _id_A765::playerchangecameramode( "equip" );
    }
    else if ( level.equip != 0 && var_0 == 0 )
    {
        _id_A765::resetweaponavatar();
        _id_A765::resetplayeravatar();
        self notify( "handleRotateAvatar" );
        _id_A765::playerpopcameramode();
        var_2 = level.depotcontroller;

        if ( !maps\mp\_utility::_id_5092( level.in_depot ) )
            var_2 = level.caccontroller;

        thread _id_A765::_id_9E55( level._id_9EA2, var_2, self._id_1E2E, 1 );
    }

    level.equip = var_0;
}

playerequipprocesslui( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_5092( level.in_depot ) && !iscollectionsmenuactive() )
        return;

    if ( var_0 == "classpreview" )
    {
        handleequipmodechange( 1 );
        maps\mp\_vl_cac::handleclassselect( var_0, var_1 );
    }
    else if ( var_0 == "faction_changed" )
        maps\mp\_vl_cac::handlefactionchanged( var_1 );
    else
    {
        if ( var_0 == "weapon_highlighted" && var_1 == "none" || var_0 == "reset_loadout" )
            return;

        handleequipmodechange( 0 );
        return;
    }
}

isequipmenuactive()
{
    return level.equip != 0;
}

playersupplycrateprocesslui( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_5092( level.in_depot ) || iscollectionsmenuactive() || isequipmenuactive() || isarmorymenuactive() )
        return;

    if ( var_0 == "costume_apply" )
        handledepotcostumeapply( var_1 );
    else if ( var_0 == "camo_apply" )
        handledepotcamoapply( var_1 );
}

handledepotcostumeapply( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    var_3 = int( var_1[1] );
    var_4 = _id_A765::_id_3F9E( var_2 );
    var_5 = level._id_9EAB[var_4];

    if ( isdefined( var_5 ) )
    {
        var_5 buildpreviewcostume( var_3 );
        var_6 = maps\mp\_vl_cac::getfactionteam();
        var_7 = maps\mp\_vl_cac::getfactionenvironment();
        maps\mp\_vl_avatar::_id_9E9D( self, var_5, var_5._id_2236, var_5.privatematchsquadmembers, var_6, var_7 );
    }
}

handledepotcamoapply( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    var_3 = int( var_1[1] );
    var_4 = _id_A765::_id_3F9E( var_2 );
    var_5 = level._id_9EAB[var_4];

    if ( isdefined( var_5 ) )
    {
        var_5._id_A7ED = var_3;
        var_5 _meth_857C( var_5._id_A7ED );
        self _meth_857C( var_5._id_A7ED );
    }
}
