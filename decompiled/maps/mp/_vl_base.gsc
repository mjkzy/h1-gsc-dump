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

_id_9EA6()
{
    setdvar( "r_dof_physical_enable", 1 );
    setdvar( "r_dof_physical_bokehEnable", 1 );
    setdvar( "r_adaptiveSubdiv", 0 );
    setdvar( "r_eyePupil", 0.15 );
    setdvar( "r_uiblurdstmode", 3 );
    setdvar( "r_blurdstgaussianblurradius", 1.5 );
    level._id_9EAA = ::_id_64E9;
    level._id_66A9 = ::_id_66A8;
    level._id_9EAB = [];
    level._id_9EA2 = 0;
    level._id_4C03 = 0;
    level.in_depot = 0;
    level.vl_active = 0;
    level.vl_loadoutfunc = ::getloadoutvl;
    level.vl_setup = 0;
    level.agent_funcs["player"]["on_killed"] = ::_id_643B;
    setdvar( "virtuallobbymembers", 0 );
    maps\mp\_vl_avatar::init_avatar();
    maps\mp\_vl_firingrange::_id_4CEF();
    maps\mp\_vl_camera::init_camera();
    maps\mp\_vl_cac::init_cac();
    maps\mp\_vl_depot::init_depot();
    maps\mp\_vl_cao::init_cao();
}

_id_64E9()
{
    thread _id_9EB1();
    self _meth_84af( 1 );
    self _meth_84fd( 0 );
    thread _id_5DBD();
}

getconstlocalplayer()
{
    return 0;
}

playermonitorluinotifies( var_0 )
{
    self endon( "disconnect" );
    playerluistart();

    for (;;)
    {
        self waittill( "luinotifyserver", var_1, var_2 );
        thread playerprocessluiservernotify( var_1, var_2 );
    }
}

playerprocessluiservernotify( var_0, var_1 )
{
    thread playermemberfocusprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cao::playerequipprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cao::playercollectionsprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cao::playerarmoryprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cao::playersupplycrateprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cac::playercacprocesslui( var_0, var_1 );
    thread maps\mp\_vl_depot::playerdepotprocesslui( var_0, var_1 );
    thread maps\mp\_vl_cao::playercaoprocesslui( var_0, var_1 );
}

playerluistart()
{
    var_0 = getdvarint( "virtualLobbyMode", 0 );
    var_1 = getdvar( "virtualLobbyModeData", "" );

    if ( var_0 == 2 )
    {
        var_2 = 0;

        if ( var_1 != "" )
            var_2 = int( var_1 );

        thread playerprocessluiservernotify( "classpreview", var_2 );
    }
    else if ( var_0 == 3 )
    {
        var_2 = 0;

        if ( var_1 != "" )
            var_2 = int( var_1 );

        thread playerprocessluiservernotify( "cao", var_2 );
    }
    else if ( var_0 == 7 )
        thread playerluistartupcaocostume( var_1 );
    else if ( var_0 == 8 )
        thread playerluistartupcaocamo( var_1 );
    else if ( var_0 == 6 )
        thread playerluistartupcacweapon( var_1 );
    else if ( var_0 == 9 )
        thread playerluistartupcaocollections( var_1 );
}

playerluistartupcaocollections( var_0 )
{
    var_1 = getdvar( "virtualLobbyModeChannel" );
    var_2 = getdvar( "virtualLobbyModeChannel2" );
    var_3 = getdvar( "virtualLobbyModeData2" );
    var_4 = strtok( var_3, "_" );
    var_5 = int( var_4[0] );
    thread playerprocessluiservernotify( "cao", var_5 );
    thread playerprocessluiservernotify( var_2, var_3 );
    thread playerprocessluiservernotify( var_1, var_0 );
}

playerluistartupcaocostume( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    thread playerprocessluiservernotify( "cao", var_2 );
    thread playerprocessluiservernotify( "costume_preview", var_0 );
}

playerluistartupcaocamo( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = int( var_1[0] );
    thread playerprocessluiservernotify( "cao", var_2 );
    thread playerprocessluiservernotify( "camo_preview", var_0 );
}

playerluistartupcacweapon( var_0 )
{
    maps\mp\_vl_cac::playercacprocesslui( "cac", 1 );
    maps\mp\_vl_cac::playercacprocesslui( "weapon_highlighted", var_0 );
}

_id_9EB1()
{
    self endon( "disconnect" );
    level.vl_active = 1;
    level.vlplayer = self;
    var_0 = self;
    var_0 maps\mp\_vl_camera::_id_8073();
    var_0 setclientomnvar( "ui_vlobby_round_state", 0 );
    var_0 setclientomnvar( "ui_vlobby_round_timer", 0 );
    var_0 allowfire( 0 );
    var_1 = var_0 _meth_8568();
    var_2 = getclassforloadout( var_1 );
    var_0._id_2522 = getlastcustomclass( var_1 );
    var_3 = maps\mp\gametypes\_class::cac_getlastgroupstring( var_1 );
    var_4 = maps\mp\_utility::_id_197E();

    if ( var_3 != var_4 )
    {
        var_2 = "lobby1";
        var_0._id_2522 = 1;
    }

    var_5 = maps\mp\gametypes\_class::_id_1B0C( var_1 );
    var_6 = maps\mp\gametypes\_class::cao_getcharactercamoindex( var_1 );
    maps\mp\_vl_cac::setselectedfaction( var_1 );
    var_0 maps\mp\_vl_camera::_id_9EA7();
    var_7 = var_0 getxuid();
    level._id_9EA2 = 0;
    var_0.team = "spectator";
    waitframe;
    var_8 = maps\mp\_vl_camera::spawncamera( var_0 );
    level._id_1A3E._id_1A13 = var_8;
    level._id_39B1 = var_4;
    var_0 _id_9E55( 0, var_1, var_2, 0 );
    var_0 maps\mp\_vl_avatar::playerspawnlocalplayeravatar( var_7, var_2, var_5, var_6, var_1 );
    level._id_39B1 = undefined;
    var_9 = level._id_9EAB[level._id_9EA2];
    var_9.playercardbackground = var_0;
    var_9._id_7DAC = var_9._id_2236;
    var_0 playersetlobbyfovscale();
    var_0 thread playermonitordisconnect();
    var_0 thread playerhandletasksafternextsnapshot( var_8 );
    maps\mp\_utility::_id_9B69( "spectator" );
    var_0 _meth_84cf( "mp_no_foley", 1 );
    var_0 playerchangecameramode( "game_lobby" );
    var_0 thread playermonitorluinotifies();
    var_0 thread playermonitorswitchtofiringrange();
    thread _id_8351();

    if ( getdvarint( "virtualLobbyReady", 0 ) == 0 )
        setdvar( "virtualLobbyReady", "1" );

    level.vl_setup = 1;
}

getlastclass( var_0 )
{
    var_1 = maps\mp\gametypes\_class::cac_getlastclassindex( var_0 );

    if ( !isdefined( var_1 ) || var_1 == 0 )
        var_1 = 1;

    return var_1;
}

getlastcustomclass( var_0 )
{
    var_1 = getlastclass( var_0 );

    if ( var_1 > 100 )
        var_1 = 1;

    return var_1;
}

getclassforloadout( var_0 )
{
    var_1 = getlastclass( var_0 );

    if ( var_1 <= 100 )
        var_1 = "lobby" + var_1;
    else if ( var_1 <= 200 )
    {
        var_1 -= 101;
        var_1 = "class" + var_1;
    }
    else
        var_1 = "lobby1";

    return var_1;
}

playerpopcameramode()
{
    var_0 = level._id_1A3E;
    var_1 = self;

    if ( isdefined( var_0._id_705F ) && var_0._id_705F.size > 0 )
    {
        var_2 = var_0._id_705F.size - 1;
        var_3 = var_0._id_705F[var_2];
        var_0._id_705F[var_2] = undefined;
        playerchangecameramode( var_3, 0 );
    }
}

playerchangecameramode( var_0, var_1 )
{
    var_2 = level._id_1A3E;
    var_3 = self;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
    {
        if ( isdefined( var_2._id_5D35 ) )
            var_2._id_705F[var_2._id_705F.size] = var_2._id_5D35;
        else
            var_2._id_5D35 = "";
    }

    var_2._id_60B3 = var_0;
    maps\mp\_vl_camera::playerupdatecamera();
}

playerhandletasksafternextsnapshot( var_0 )
{
    maps\mp\_utility::waittillplayersnextsnapshot( self );
    maps\mp\_vl_camera::cameralink( var_0, self );
}

setuploadoutcommonvl()
{
    var_0 = self.vlcontroller;

    if ( !isdefined( self.emblemloadout ) )
        self.emblemloadout = spawnstruct();

    self.emblemloadout.emblemindex = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
    self.emblemloadout.shouldapplyemblemtoweapon = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "applyEmblemToWeapon" );
    self.emblemloadout.shouldapplyemblemtocharacter = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );

    if ( !isdefined( self.charactercamoloadout ) )
        self.charactercamoloadout = spawnstruct();

    self.charactercamoloadout.camoindex = _func_2fa( var_0, common_scripts\utility::getstatsgroup_common(), "characterCamoIndex" );
}

getloadoutvl( var_0, var_1 )
{
    var_2 = self.vlcontroller;
    var_3 = [];
    var_3["primary"] = maps\mp\gametypes\_class::_id_1985( var_1, 0, var_2 );
    var_3["primaryAttachKit"] = maps\mp\gametypes\_class::cac_getweaponattachkit( var_1, 0, var_2 );
    var_3["primaryFurnitureKit"] = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_1, 0, var_2 );
    var_3["primaryCamo"] = maps\mp\gametypes\_class::_id_1989( var_1, 0, var_2 );
    var_3["primaryReticle"] = maps\mp\gametypes\_class::_id_198A( var_1, 0, var_2 );
    var_3["primaryCamoNum"] = int( tablelookup( "mp/camoTable.csv", 1, var_3["primaryCamo"], 0 ) );
    var_3["primaryReticleNum"] = int( tablelookup( "mp/reticleTable.csv", 1, var_3["primaryReticle"], 0 ) );
    var_3["secondary"] = maps\mp\gametypes\_class::_id_1985( var_1, 1, var_2 );
    var_3["secondaryAttachKit"] = maps\mp\gametypes\_class::cac_getweaponattachkit( var_1, 1, var_2 );
    var_3["secondaryFurnitureKit"] = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_1, 1, var_2 );
    var_3["secondaryCamo"] = maps\mp\gametypes\_class::_id_1989( var_1, 1, var_2 );
    var_3["secondaryReticle"] = maps\mp\gametypes\_class::_id_198A( var_1, 1, var_2 );
    var_3["secondaryCamoNum"] = int( tablelookup( "mp/camoTable.csv", 1, var_3["secondaryCamo"], 0 ) );
    var_3["secondaryReticleNum"] = int( tablelookup( "mp/reticleTable.csv", 1, var_3["secondaryReticle"], 0 ) );
    var_3["equipment"] = maps\mp\gametypes\_class::_id_197F( var_1, 0, var_2 );
    var_3["offhand"] = maps\mp\gametypes\_class::_id_197F( var_1, 1, var_2 );

    for ( var_4 = 0; var_4 < 3; var_4++ )
        var_3["perk" + var_4] = maps\mp\gametypes\_class::_id_1984( var_1, var_4, var_2 );

    var_3["meleeWeapon"] = maps\mp\gametypes\_class::cac_getmeleeweapon( var_1, var_2 );
    return var_3;
}

_id_643B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{

}

playerwaittillloadoutstreamed()
{
    self.vlcontroller = level.caccontroller;
    var_0 = maps\mp\_utility::_id_3F32( "lobby" + self._id_2522 );
    var_1 = maps\mp\_utility::_id_197E();
    var_2 = getloadoutvl( var_1, var_0 );
    var_3 = var_2["primary"];
    var_4 = var_2["primaryAttachKit"];
    var_5 = var_2["primaryFurnitureKit"];
    var_6 = var_2["primaryCamoNum"];
    var_7 = var_2["primaryReticleNum"];
    var_8 = var_2["secondary"];
    var_9 = var_2["secondaryAttachKit"];
    var_10 = var_2["secondaryFurnitureKit"];
    var_11 = var_2["secondaryCamoNum"];
    var_12 = var_2["secondaryReticleNum"];
    var_13 = self.emblemloadout.emblemindex;

    if ( !self.emblemloadout.shouldapplyemblemtoweapon )
        var_13 = -1;

    if ( isdefined( level._id_9EAB ) && isdefined( level._id_9EA2 ) && isdefined( level._id_9EAB[level._id_9EA2] ) )
        _id_6F0F( level._id_9EAB[level._id_9EA2], level._id_9EAB[level._id_9EA2].angles );

    var_14 = [];

    if ( isdefined( var_3 ) && var_3 != "specialty_null" )
        var_14[var_14.size] = maps\mp\gametypes\_class::_id_188C( var_3, var_4, var_5, var_6, var_7, var_13 );

    if ( isdefined( var_8 ) && var_8 != "specialty_null" )
        var_14[var_14.size] = maps\mp\gametypes\_class::_id_188C( var_8, var_9, var_10, var_11, var_12, var_13 );

    while ( var_14.size > 0 )
    {
        var_15 = self _meth_8508( var_14 );

        if ( var_15 == 1 )
            break;

        waittillframeend;
    }
}

playermonitorswitchtofiringrange()
{
    var_0 = self;

    for (;;)
    {
        if ( isdefined( level._id_4C03 ) )
        {
            var_1 = getdvarint( "virtualLobbyInFiringRange", 0 );

            if ( var_1 == 1 && !level._id_4C03 )
            {
                var_0 playerwaittillloadoutstreamed();
                var_0 _meth_847d();
                maps\mp\_vl_firingrange::_id_32F0( var_0 );
                var_0 _meth_84d0( "mp_no_foley", 1 );
                setdvar( "r_dof_physical_bokehEnable", 0 );
                setdvar( "r_dof_physical_enable", 0 );
                setdvar( "r_uiblurdstmode", 0 );
                setdvar( "r_blurdstgaussianblurradius", 1 );
            }
            else if ( var_1 == 0 && level._id_4C03 )
            {
                var_0 _meth_847e();
                var_0 maps\mp\_vl_firingrange::_id_3807();
                var_0 _id_2AC5();
                resetplayeravatar();

                if ( isdefined( var_0.primaryweapon ) )
                    var_0 switchtoweapon( var_0.primaryweapon );

                var_0 notify( "enter_lobby" );
                _id_3301( var_0 );
                var_0 _meth_84cf( "mp_no_foley", 1 );
                setdvar( "r_dof_physical_enable", 1 );
                setdvar( "r_dof_physical_bokehEnable", 1 );
                setdvar( "r_uiblurdstmode", 3 );
                setdvar( "r_blurdstgaussianblurradius", 1.5 );
            }
        }

        wait 0.05;
    }
}

playermonitordisconnect()
{
    self waittill( "disconnect" );
    self._id_1A13 delete();
    vlprint( "remove all ownerIds due to disconnect\\n" );
    var_0 = level._id_9EAB.size;

    for ( var_1 = var_0 - 1; var_1 >= 0; var_1-- )
        maps\mp\_vl_avatar::removelobbyavatar( level._id_9EAB[var_1] );
}

_id_3301( var_0 )
{
    maps\mp\_vl_firingrange::_id_2630();
    maps\mp\_vl_camera::cameralink( var_0._id_1A13, var_0 );
    var_0 playersetlobbyfovscale();
    var_0 _meth_857a( 0 );
    var_0 stopshellshock();
    var_0 _meth_84a5();

    if ( isdefined( level._id_9EAB ) && isdefined( level._id_9EA2 ) && isdefined( level._id_9EAB[level._id_9EA2] ) )
        var_0 _id_6F0F( level._id_9EAB[level._id_9EA2], level._id_9EAB[level._id_9EA2].angles );

    level._id_4C03 = 0;
    var_0 allowfire( 0 );
    var_0.firingrangeready = undefined;
    maps\mp\_utility::_id_9B69( "spectator" );
}

_id_9E55( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !self _meth_8585( var_1 ) )
    {
        vlprintln( "player does not have stats--skipping 'virtual_lobby_set_class': " + var_1 );
        return;
    }

    self.pers["class"] = var_2;
    self.class = var_2;
    maps\mp\gametypes\_class::setclass( self.pers["class"] );
    self.vlcontroller = var_1;
    setuploadoutcommonvl();
    playerstreamloadout( var_0, var_3 );
}

playerstreamloadout( var_0, var_1 )
{
    self notify( "playerStreamLoadout" );
    self endon( "playerStreamLoadout" );
    maps\mp\gametypes\_class::_id_41F1( self.pers["team"], self.pers["class"] );
    var_2 = undefined;
    var_3 = self._id_57D6._id_6F84;

    if ( var_1 )
    {
        var_2 = level._id_9EAB[var_0];
        var_2.primaryweapon = var_3;
        var_2._id_A7ED = self._id_57D6._id_A7ED;
        thread playerrefreshavatar( var_0 );
    }

    waitstreamweapon( self, var_3, 1 );

    if ( var_1 )
    {
        var_2._id_A7EA = self._id_57D6.emblemindex;
        var_2 _meth_8577( self._id_57D6._id_A7EC );
    }

    maps\mp\gametypes\_class::applyloadout();
}

waitstreamweapon( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    for (;;)
    {
        if ( isweaponloaded( var_0, var_1, var_2 ) )
            break;

        waitframe;

        if ( isweaponloaded( var_0, var_1, var_2 ) )
            break;

        waittillframeend;
    }
}

playerreloadallavatarmodels()
{
    foreach ( var_2, var_1 in level._id_9EAB )
        playerrefreshavatar( var_2 );
}

playerrefreshavatar( var_0 )
{
    var_1 = level._id_9EAB[var_0];
    maps\mp\_vl_avatar::_id_9E9E( self, var_0, var_1.primaryweapon, var_1._id_2236, var_1._id_A7ED, var_1 );
}

getallweaponroomstrings()
{
    return [ "Sniper", "AssaultRifle", "SMG", "Shotgun", "LMG" ];
}

getweaponroomstring( var_0 )
{
    var_1 = weaponclass( var_0 );
    var_2 = "AssaultRifle";

    switch ( var_1 )
    {
        case "sniper":
            var_2 = "Sniper";
            break;
        case "rifle":
            var_2 = "AssaultRifle";
            break;
        case "smg":
            var_2 = "SMG";
            break;
        case "spread":
            var_2 = "Shotgun";
            break;
        case "mg":
            var_2 = "LMG";
            break;
        default:
            break;
    }

    return var_2;
}

getweaponroomanimstring( var_0 )
{
    var_1 = getweaponroomstring( var_0 );
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    switch ( var_2 )
    {
        case "h1_junsho":
            var_1 += "_ranger";
            break;
        default:
            break;
    }

    return var_1;
}

getalignmentanimation( var_0 )
{
    var_1 = "h1_lobby_ar_align";

    switch ( var_0 )
    {
        case "Sniper":
            var_1 = "h1_lobby_sni_align";
            break;
        case "AssaultRifle":
            var_1 = "h1_lobby_ar_align";
            break;
        case "SMG":
            var_1 = "h1_lobby_smg_align";
            break;
        case "Shotgun":
            var_1 = "h1_lobby_sht_align";
            break;
        case "LMG":
            var_1 = "h1_lobby_lmg_align";
            break;
        default:
            break;
    }

    return var_1;
}

player_sticks_in_lefty_config( var_0 )
{
    if ( common_scripts\utility::_id_5064() )
    {
        var_1 = self _meth_8212( "gpadSticksConfig" );

        if ( isdefined( var_1 ) )
        {
            if ( var_1 == "thumbstick_default" )
                return 0;
            else if ( var_1 == "thumbstick_southpaw" )
                return 1;
            else if ( var_1 == "thumbstick_legacy" )
                return var_0 == 1;
            else if ( var_1 == "thumbstick_legacysouthpaw" )
                return var_0 == 0;
            else
            {

            }
        }
    }

    return 0;
}

player_get_right_stick( var_0 )
{
    if ( player_sticks_in_lefty_config( var_0.info_player_start ) )
        return var_0.unnormalizedleftstickangle;
    else
    {
        var_1 = self _meth_8449();
        return var_1[var_0.info_player_start];
    }
}

player_update_right_stick( var_0 )
{
    var_1 = 0;

    if ( player_sticks_in_lefty_config( var_0.info_player_start ) )
    {
        var_2 = self getnormalizedmovement();
        var_3 = 1;

        if ( var_0.info_player_start == 1 )
            var_3 = -12;
        else
            var_3 = -5;

        var_4 = var_2[var_0.info_player_start] * var_3;
        var_0.unnormalizedleftstickangle = angleclamp( var_0.unnormalizedleftstickangle + var_4 );
        var_1 = var_0.unnormalizedleftstickangle;
    }
    else
    {
        var_2 = self _meth_8449();
        var_1 = var_2[var_0.info_player_start];
    }

    return var_1;
}

resetrotationdata( var_0 )
{
    var_0.mouserot = 0;

    if ( !isdefined( var_0.rotateyawdata ) )
    {
        var_0.rotateyawdata = spawnstruct();
        var_0.rotateyawdata.info_player_start = 1;
    }

    if ( !isdefined( var_0.rotaterolldata ) )
    {
        var_0.rotaterolldata = spawnstruct();
        var_0.rotaterolldata.info_player_start = 0;
    }

    var_0.rotateyawdata.storedstick = 0;
    var_0.rotateyawdata.storedangle = var_0.angles[1];
    var_0.rotateyawdata._id_93F3 = 0;
    var_0.rotateyawdata._id_0845 = 0;
    var_0.rotateyawdata.lastangle = 0;
    var_0.rotateyawdata.lastdeltachanged = 0;
    var_0.rotateyawdata.unnormalizedleftstickangle = 0;
    var_0.rotaterolldata.storedstick = 0;
    var_0.rotaterolldata.storedangle = var_0.angles[2];
    var_0.rotaterolldata._id_93F3 = 0;
    var_0.rotaterolldata._id_0845 = 0;
    var_0.rotaterolldata.lastangle = 0;
    var_0.rotaterolldata.lastchanged = 0;
    var_0.rotaterolldata.unnormalizedleftstickangle = 0;
}

_id_6F0F( var_0, var_1 )
{
    resetrotationdata( var_0 );
    var_0.rotateyawdata.storedstick = player_get_right_stick( var_0.rotateyawdata );
    var_0.rotaterolldata.storedstick = player_get_right_stick( var_0.rotaterolldata );

    if ( isdefined( var_1 ) )
    {
        var_1 = ( 0, var_1[1], 0 );

        if ( isagent( var_0 ) )
            var_0 setplayerangles( var_1 );
        else
            var_0.angles = var_1;
    }
}

_id_7528( var_0, var_1, var_2, var_3 )
{
    var_4 = getyawrotationangle( var_0, var_1 );

    if ( isagent( var_0 ) )
    {
        var_5 = ( 0, var_4, 0 );

        if ( isdefined( var_0.teleportlinker ) && var_0 islinked() && var_0 getlinkedparent() == var_0.teleportlinker )
            var_0.teleportlinker.angles = var_5;
        else
            var_0 setplayerangles( var_5 );
    }
    else
    {
        var_6 = 0;

        if ( isdefined( var_3 ) && var_3 != "Perk" )
            var_6 = getrollrotationangle( var_0, var_2 );

        var_5 = ( 0, var_4, var_6 );
        var_0.angles = var_5;
    }
}

handlerotateplayeravatar()
{
    self notify( "handleRotateAvatar" );
    self endon( "handleRotateAvatar" );
    var_0 = level._id_9EAB[level._id_9EA2];
    _id_6F0F( var_0 );

    for (;;)
    {
        if ( maps\mp\_utility::_id_5092( level._id_4C03 ) )
        {
            waittillframeend;
            continue;
        }

        _id_7528( var_0, 1.0, 5.0 );
        waittillframeend;
    }
}

resetplayeravatar()
{
    var_0 = level._id_9EAB[level._id_9EA2];
    var_0 setplayerangles( var_0._id_117A.angles );
}

handlerotateweaponavatar( var_0 )
{
    self notify( "handleRotateAvatar" );
    self endon( "handleRotateAvatar" );
    _id_6F0F( level.weaponavatarparent );

    for (;;)
    {
        _id_7528( level.weaponavatarparent, 1.0, 5.0, var_0 );
        rotaterollbackavatar( level.weaponavatarparent );
        waittillframeend;
    }
}

resetweaponavatar()
{
    level.weaponavatarparent.angles = ( 0.0, 30.0, 0.0 );
}

getyawrotationangle( var_0, var_1 )
{
    var_2 = player_update_right_stick( var_0.rotateyawdata );
    var_3 = angleclamp( var_2 - var_0.rotateyawdata.storedstick );
    var_4 = getdvarfloat( "ui_mouse_char_rot", 0 );

    if ( var_4 != 0 )
    {
        var_0.mouserot = angleclamp( var_0.mouserot + var_4 );
        setdvar( "ui_mouse_char_rot", 0 );
    }

    var_5 = getangleadd( var_0.rotateyawdata, var_3, var_1 );
    var_5 *= -1;
    var_6 = angleclamp( var_0.rotateyawdata.storedangle + var_5 + var_0.mouserot );
    var_0.rotateyawdata.lastdeltachanged = var_0.rotateyawdata.lastangle - var_6;
    var_0.rotateyawdata.lastangle = var_6;
    return var_6;
}

getrollrotationangle( var_0, var_1 )
{
    var_2 = 70;
    var_3 = 290;
    var_4 = player_update_right_stick( var_0.rotaterolldata );
    var_5 = angleclamp( var_4 - var_0.rotaterolldata.storedstick );
    var_6 = getangleadd( var_0.rotaterolldata, var_5, var_1 );
    var_7 = angleclamp( var_0.rotaterolldata.storedangle + var_6 );

    if ( var_7 > var_2 && var_7 < var_3 )
    {
        if ( var_7 < 180 )
        {
            var_0.rotaterolldata.storedangle += var_2 - var_7;
            var_7 = var_2;
        }
        else
        {
            var_0.rotaterolldata.storedangle += var_3 - var_7;
            var_7 = var_3;
        }

        var_0.rotaterolldata.lastchanged = gettime();
    }
    else if ( var_0.rotaterolldata.lastangle != var_7 )
        var_0.rotaterolldata.lastchanged = gettime();

    var_0.rotaterolldata.lastangle = var_7;
    return var_7;
}

getangleadd( var_0, var_1, var_2 )
{
    if ( abs( var_1 - var_0._id_93F3 ) > 100 )
    {
        if ( var_1 >= 270 )
        {
            var_0._id_0845 += -360 * var_2;

            if ( var_0._id_0845 == -360 )
                var_0._id_0845 = 0;
        }
        else if ( var_1 <= 100 )
        {
            var_0._id_0845 += 360 * var_2;

            if ( var_0._id_0845 == 360 )
                var_0._id_0845 = 0;
        }
    }

    var_0._id_93F3 = var_1;
    var_3 = var_1 * var_2 + var_0._id_0845;
    return var_3;
}

rotaterollbackavatar( var_0 )
{
    var_1 = 25;
    var_2 = 0.5;
    var_3 = 10;
    var_4 = var_0.angles[2];
    var_4 = angleclamp180( var_4 );
    var_5 = abs( var_0.rotateyawdata.lastdeltachanged ) > var_2 && abs( var_4 ) < var_3;

    if ( var_4 != 0 && ( var_0.rotaterolldata.lastchanged != gettime() || var_5 ) )
    {
        var_6 = common_scripts\utility::_id_856D( var_4 ) * var_1;

        if ( abs( var_4 ) < var_1 )
            var_6 = var_4;

        var_7 = ( var_0.angles[0], var_0.angles[1], var_0.angles[2] - var_6 );
        var_0.angles = var_7;
        var_0.rotaterolldata.storedangle -= var_6;
        var_0.rotaterolldata.lastangle = var_7[2];
    }
}

player_controls_internal( var_0 )
{
    self allowfire( var_0 );
    self allowcrouch( var_0 );
    self allowprone( var_0 );
    self allowjump( var_0 );
    self allowads( var_0 );
    self allowlean( var_0 );
    self allowmelee( var_0 );
    self allowsprint( var_0 );
}

_id_2AC5()
{
    player_controls_internal( 0 );
}

_id_30E5()
{
    var_0 = getdvarint( "virtualLobbyInFiringRange", 0 );

    if ( var_0 == 1 && level._id_4C03 == 1 )
        player_controls_internal( 1 );
}

_id_3F9E( var_0 )
{
    foreach ( var_3, var_2 in level._id_9EAB )
    {
        if ( isdefined( var_2._id_57D6 ) && isdefined( var_2._id_57D6.playercardpatch ) && var_2._id_57D6.playercardpatch == var_0 && !maps\mp\_utility::_id_5092( var_2.fakemember ) )
            return var_3;
    }

    vlprintln( "unable to find avatar for controller " + var_0 );
    return getconstlocalplayer();
}

playersetlobbyfovscale()
{
    playersetfovscale( 0.6153 );
}

playersetfovscale( var_0 )
{
    self.fovscale = var_0;
    self setclientdvar( "cg_fovscale", var_0 );
}

_id_8351()
{
    level notify( "cancel_vlp" );
    level endon( "cancel_vlp" );

    while ( !level.vl_active || level._id_9EAB.size == 0 || !isdefined( level._id_9EAB[0] ) || !isdefined( level._id_9EAB[0].primaryweapon ) || !isweaponloaded( level.vlplayer, level._id_9EAB[0].primaryweapon, 0 ) || getdvarint( "virtualLobbyInFiringRange", 0 ) != 0 && !maps\mp\_utility::_id_5092( level.vlplayer.firingrangeready ) )
        waittillframeend;

    wait 0.5;
    setdvar( "virtualLobbyPresentable", "1" );
}

_id_7467()
{
    level notify( "cancel_vlp" );
    level endon( "cancel_vlp" );
    wait 0.25;
    setdvar( "virtualLobbyPresentable", "0" );
}

isweaponloaded( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( isdefined( var_0 ) )
    {
        if ( var_2 )
            var_3 = var_0 _meth_8508( var_1 );
        else
        {
            var_3 = var_0 _meth_8528( var_1 );

            if ( !var_3 )
                var_0 _meth_8508( var_1 );
        }
    }

    return var_3;
}

playermemberfocusprocesslui( var_0, var_1 )
{
    if ( var_0 == "member_select" )
    {
        level._id_9EA2 = getfocusforxuid( var_1 );

        if ( !isdefined( level._id_9EA2 ) )
        {
            vlprint( "vl_focus undefined, setting to 0\\n" );
            level._id_9EA2 = 0;
        }

        var_2 = level._id_9EAB[level._id_9EA2];
        thread updateavatarloadout( self, var_2 );
        maps\mp\_vl_camera::playerupdatecamera();
        vlprint( "selected member " + var_1 + " ownerId=" + level._id_9EA2 + "\\n" );
    }
    else if ( var_0 == "vlpresentable" )
    {
        vlprint( "in main menu\\n" );
        thread _id_8351();
    }
    else if ( var_0 == "leave_lobby" )
    {
        vlprint( "leave_lobby xuid=" + var_1 + "\\n" );
        level.vl_active = 0;
        thread _id_7467();
        maps\mp\_vl_camera::playerupdatecamera();
    }
}

getfocusforxuid( var_0 )
{
    foreach ( var_3, var_2 in level._id_9EAB )
    {
        if ( isdefined( var_2._id_57D6 ) && var_2._id_57D6.zonly_physics == var_0 )
            return var_3;
    }

    return undefined;
}

waittilldepotswitchcomplete()
{
    if ( maps\mp\_utility::_id_5092( level.depotinitialized ) || getdvarint( "vlDepotEnabled", 0 ) == 0 )
        return;

    while ( !maps\mp\_utility::_id_5092( level.depotinitialized ) )
        waittillframeend;

    while ( maps\mp\_vl_avatar::allcostumesloaded() )
        waittillframeend;
}

_id_5DBD()
{
    for (;;)
    {
        waittilldepotswitchcomplete();

        foreach ( var_2, var_1 in level._id_9EAB )
        {
            if ( var_2 == 0 )
                continue;

            if ( var_1._id_5BA7 >= 0 )
            {
                if ( var_1._id_5BA7 < gettime() )
                {
                    if ( var_2 == 0 && !isdefined( var_1._id_5BA2 ) )
                    {
                        var_1._id_5BA7 = gettime() + 2000;
                        var_1._id_5BA2 = 1;
                        continue;
                    }

                    vlprint( "Schedule removal of ownerId " + var_2 + " from timeout\\n" );
                    maps\mp\_vl_avatar::removelobbyavatar( var_1 );
                    maps\mp\_vl_camera::playerupdatecamera();
                }
            }
        }

        waittillframeend;
    }
}

updatelocalavatarloadouts( var_0 )
{
    foreach ( var_2 in level._id_9EAB )
    {
        if ( isdefined( var_2.controller ) && isdefined( var_2._id_57D6 ) )
        {
            var_3 = undefined;

            foreach ( var_5 in var_0 )
            {
                if ( var_2.controller == var_5.playercardpatch )
                {
                    var_3 = var_5;
                    break;
                }
            }

            if ( isdefined( var_3 ) && var_2.zonly_physics != var_3.zonly_physics )
            {
                var_2._id_57D6 = var_3;
                var_2.zonly_physics = var_3.zonly_physics;
            }
        }
    }
}

memberclasschanges( var_0 )
{
    if ( !isdefined( level.vlplayer ) || !isdefined( level._id_1A3E ) || level._id_9EAB.size == 0 )
        return;

    var_1 = level.vlplayer;
    updatelocalavatarloadouts( var_0 );

    foreach ( var_3 in var_0 )
    {
        var_4 = maps\mp\_vl_avatar::get_avatar_for_xuid( var_3.zonly_physics );

        if ( isdefined( var_4 ) )
        {
            if ( var_3.playercardpatch >= 0 )
            {
                var_5 = maps\mp\_vl_avatar::get_ownerid_for_avatar( var_4 );
                var_6 = !level.vl_active || !isdefined( var_4._id_57D6 ) && getdvarint( "virtualLobbyMode", 0 ) == 6;

                if ( isdefined( var_4 ) )
                {
                    var_4._id_57D6 = var_3;
                    var_4.zonly_physics = var_3.zonly_physics;
                }

                if ( !var_6 )
                    continue;
            }
        }

        var_7 = tablelookup( "mp/statstable.csv", 0, var_3.primaryattachment3, 4 );
        var_8 = var_3.primaryoffhand;
        var_9 = tablelookup( "mp/attachkits.csv", 0, var_3.primaryoffhand, 1 );
        var_10 = var_3._not_primaryweapon;
        var_11 = tablelookup( "mp/furniturekits.csv", 0, var_3._not_primaryweapon, 1 );
        var_12 = var_3.primaryreticle;
        var_13 = tablelookup( "mp/camoTable.csv", 0, var_3.primaryreticle, 1 );
        var_14 = var_3.privatematchcustomclasses;
        var_15 = tablelookup( "mp/reticleTable.csv", 0, var_3.privatematchcustomclasses, 1 );
        var_16 = var_3.playerid;
        var_17 = var_16;
        var_18 = var_3._id_A7EB;
        var_19 = var_3._id_A7EC;

        if ( !var_18 )
            var_17 = -1;

        var_20 = maps\mp\gametypes\_class::_id_188C( var_7, var_9, var_11, var_12, var_14, var_17 );
        var_21 = maps\mp\_utility::_id_3F11( var_20 );
        var_22 = [];
        var_22[level._id_2238["gender"]] = var_3.gender;
        var_22[level._id_2238["shirt"]] = var_3.sightlatency;
        var_22[level._id_2238["head"]] = var_3.headshots;
        var_22[level._id_2238["gloves"]] = var_3.gloves;
        var_23 = var_3._id_A7ED;

        if ( !isdefined( var_4 ) )
        {
            var_5 = maps\mp\_vl_avatar::getnewlobbyavatarownerid( var_3.zonly_physics );
            var_24 = maps\mp\gametypes\vlobby::getspawnpoint( getconstlocalplayer() );
            var_4 = maps\mp\_vl_avatar::_id_88CE( var_1, var_24, var_20, var_22, var_23, var_3._id_A7E7, var_5, 0 );
            setdvar( "virtuallobbymembers", level._id_9EAB.size );
            thread _id_8351();
            var_4._id_A7EA = var_16;
            var_4 _meth_8577( var_19 );
            var_4._id_57D6 = var_3;
            var_4.zonly_physics = var_3.zonly_physics;
            var_4._id_5BA7 = gettime() + 4000;

            if ( var_3.playercardpatch >= 0 )
                var_4.controller = var_3.playercardpatch;

            continue;
        }

        var_5 = maps\mp\_vl_avatar::get_ownerid_for_avatar( var_4 );

        if ( var_3.playercardpatch >= 0 && isdefined( var_4.savedcostume ) )
            var_22 = var_4.savedcostume;

        if ( var_3.playercardpatch >= 0 || _id_57D7( var_4._id_57D6, var_3 ) || _id_2237( var_4._id_2236, var_22 ) )
        {
            var_25 = var_4.primaryweapon;
            var_4._id_57D6 = var_3;
            var_4.updateloadout = 1;
            var_4.updatecostume = var_22;

            if ( var_3.playercardpatch >= 0 )
            {
                thread updateavatarloadout( var_1, var_4 );
                maps\mp\_vl_cac::updatefactionselection( var_3._id_A7E7 );

                if ( !level.vl_active )
                {
                    level._id_9EA2 = var_5;
                    var_1 thread maps\mp\_vl_camera::playerupdatecamera();
                }

                level.vl_active = 1;
            }
            else if ( !maps\mp\_utility::_id_5092( var_4.weapclasschanged ) )
            {
                var_4.weapclasschanged = weaponclass_changed( var_25, var_20 );

                if ( !var_4.weapclasschanged )
                    thread updateavatarloadout( var_1, var_4, var_25 );
            }
        }
    }
}

updateavatarloadout( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5092( var_1.updateloadout ) || maps\mp\_utility::_id_5092( level._id_4C03 ) )
        return;

    var_3 = var_1._id_57D6;
    var_4 = var_1.updatecostume;
    var_5 = maps\mp\_vl_avatar::get_ownerid_for_avatar( var_1 );
    var_6 = tablelookup( "mp/statstable.csv", 0, var_3.primaryattachment3, 4 );
    var_7 = tablelookup( "mp/attachkits.csv", 0, var_3.primaryoffhand, 1 );
    var_8 = tablelookup( "mp/furniturekits.csv", 0, var_3._not_primaryweapon, 1 );
    var_9 = var_3.primaryreticle;
    var_10 = var_3.privatematchcustomclasses;
    var_11 = var_3.playerid;
    var_1._id_A7EA = var_11;
    var_12 = var_3._id_A7EB;
    var_13 = var_3._id_A7EC;
    var_1 _meth_8577( var_13 );

    if ( !var_12 )
        var_11 = -1;

    var_14 = maps\mp\gametypes\_class::_id_188C( var_6, var_7, var_8, var_9, var_10, var_11 );
    maps\mp\_vl_avatar::_id_9E9E( var_0, var_5, var_14, var_4, var_3._id_A7ED );
    var_1.updateloadout = undefined;
    var_1.updatecostume = undefined;
    var_1.weapclasschanged = undefined;

    if ( var_6 == "h1_junsho" || isdefined( var_2 ) && issubstr( var_2, "h1_junsho" ) )
        var_0 maps\mp\_vl_avatar::playerteleportavatartoweaponroom( var_1, level._id_1A3E._id_1A13, 1 );
}

_id_7F49( var_0 )
{
    if ( var_0[level._id_2238["head"]] == 0 )
        var_0[level._id_2238["head"]] = 1;

    if ( !var_0[level._id_2238["shirt"]] )
        var_0[level._id_2238["shirt"]] = 1;

    if ( !var_0[level._id_2238["gloves"]] )
        var_0[level._id_2238["gloves"]] = 1;

    return var_0;
}

weaponclass_changed( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return 1;

    var_2 = weaponclass( var_0 );
    var_3 = weaponclass( var_1 );

    if ( var_2 != var_3 )
        return 1;

    return 0;
}

_id_57D7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( var_0.primaryattachment3 != var_1.primaryattachment3 )
        return 1;

    if ( var_0.primaryoffhand != var_1.primaryoffhand )
        return 1;

    if ( var_0._not_primaryweapon != var_1._not_primaryweapon )
        return 1;

    if ( var_0.primaryreticle != var_1.primaryreticle )
        return 1;

    if ( var_0._id_A7E7 != var_1._id_A7E7 )
        return 1;

    if ( var_0.playerid != var_1.playerid )
        return 1;

    if ( var_0._id_A7EB != var_1._id_A7EB )
        return 1;

    if ( var_0._id_A7EC != var_1._id_A7EC )
        return 1;

    if ( var_0._id_A7ED != var_1._id_A7ED )
        return 1;

    return 0;
}

_id_2237( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( !isdefined( var_1 ) )
            return 0;

        return 1;
    }

    if ( var_0.size != var_1.size )
        return 1;

    if ( !maps\mp\gametypes\_teams::_id_9C51( var_1 ) )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] < 0 )
            return 0;

        if ( var_0[var_2] != var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_66A8( var_0 )
{
    if ( !isdefined( level._id_9EAB ) || level._id_9EAB.size == 0 )
        return;

    if ( !isdefined( level._id_5A79 ) )
        level._id_5A79 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.zonly_physics;
        var_4 = maps\mp\_vl_avatar::get_avatar_for_xuid( var_3 );

        if ( isdefined( var_4 ) )
        {
            var_4._id_5BA7 = gettime() + 2000;
            var_4._id_5BA2 = undefined;
        }

        if ( var_2.primaryattachment3 >= 0 )
            scorepercentagecutoff( var_2 );
    }

    memberclasschanges( level._id_5A79 );
    level._id_5A79 = [];
}

scorepercentagecutoff( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_5A79.size; var_1++ )
    {
        if ( level._id_5A79[var_1].zonly_physics == var_0.zonly_physics )
        {
            level._id_5A79[var_1] = var_0;
            var_0 = undefined;
            break;
        }
    }

    if ( isdefined( var_0 ) )
        level._id_5A79[level._id_5A79.size] = var_0;
}

weaponroomscenelightsoff()
{
    if ( !isdefined( level.weapon_room_lights ) )
        var_0 = [ "weapons_lobby", "weapons_collection", "characters_collection", "characters_personalization", "heads_personalization", "heads_collection" ];
    else
        var_0 = [ level.weapon_room_lights ];

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2, "targetname" );

        foreach ( var_5 in var_3 )
        {
            if ( !isdefined( var_5.baseintensity ) )
            {
                if ( isdefined( var_5._id_7A77 ) )
                    var_5.baseintensity = var_5._id_7A77;
                else
                    var_5.baseintensity = var_5 getlightintensity();
            }

            var_5 setlightintensity( 0 );
        }
    }
}

weaponroomscenelightsupdate( var_0 )
{
    weaponroomdof( var_0 );

    if ( isdefined( level.weapon_room_lights ) && level.weapon_room_lights == var_0 )
        return;

    weaponroomscenelightsoff();
    var_1 = getentarray( var_0, "targetname" );

    if ( var_1.size == 0 )
    {
        if ( var_0 == "heads_personalization" || var_0 == "heads_collection" || var_0 == "characters_personalization" )
            var_0 = "characters_collection";

        var_1 = getentarray( var_0, "targetname" );
    }

    level.weapon_room_lights = var_0;

    foreach ( var_3 in var_1 )
        var_3 setlightintensity( var_3.baseintensity );
}

weaponroomdof( var_0 )
{
    if ( isdefined( level.weapon_room_dof ) && level.weapon_room_dof == var_0 )
        return;

    level.weapon_room_dof = var_0;
    var_1 = 4.7;
    var_2 = 83.2;

    if ( var_0 == "heads_personalization" )
    {
        var_1 = 7.1;
        var_2 = 65.1;
    }
    else if ( var_0 == "heads_collection" )
    {
        var_1 = 7.1;
        var_2 = 65.1;
    }
    else if ( var_0 == "characters_personalization" )
    {
        var_1 = 4.7;
        var_2 = 83.2;
    }
    else if ( var_0 == "characters_collection" )
    {
        var_1 = 4.7;
        var_2 = 83.2;
    }
    else if ( var_0 == "weapons_collection" || var_0 == "weapons_lobby" )
        return;
    else
    {

    }

    maps\mp\_vl_camera::playervlsetphysicaldepthoffield( var_1, var_2 );
}

vlprint( var_0 )
{

}

vlprintln( var_0 )
{

}
