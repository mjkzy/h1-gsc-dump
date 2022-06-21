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

ph_init()
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    setupdvars();
    level._id_62F8 = 1;
    level.teamBased = 1;
    level._id_64E9 = ::_id_64E9;
    level._id_64C0 = ::_id_64C0;
    level._id_64F0 = ::_id_64F0;
    level._id_64D3 = ::_id_64D3;
    level._id_6466 = ::_id_6466;
    level.checkforovertime = ::ph_checkforovertime;
    level.customplaydamagesound = ::playdamagesoundph;
    level.customplaydeathsound = ::playdeathsoundph;
    level.modifyPlayerDamage = ::gamemodeModifyPlayerDamage;

    if ( level.madpropsmode )
    {
        if ( !isdefined( game["roundsPlayed"] ) )
            game["roundsPlayed"] = 0;

        level.getSpawnPoint = ::getpkspawnpoint;
    }
    else
    {
        level.getSpawnPoint = ::getSpawnPoint;
        level._id_1969 = ::phclass;
    }

    level.proplist = [];
    level.spawnproplist = [];
    level._id_06B5 = [ "FLASH" ];
    level._id_0AAB = 0;
    level.startcheck = 0;
    populateproplist();
    ph_precache();
    initializegametypesettings();
    level.ph_linker = spawn( "script_model", ( 0, 0, 0 ) );
    level.ph_linker setModel( "tag_player" );
    onStartGameType();

    if ( !level.madpropsmode )
    {
        level thread stillalivexp();
        level checkmapofflimits();
    }

    level thread _id_A235();
    level thread disablejipaftermatchstart();
}

disablejipaftermatchstart()
{
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    setnojiptime( 1 );
}

setupdvars()
{
    if ( level.madpropsmode )
    {
        setdynamicdvar( "scr_game_hardpoints", 0 );
        setdynamicdvar( "scr_war_timelimit", 4 );
        setdynamicdvar( "scr_war_scorelimit", 0 );
        setdynamicdvar( "scr_war_roundlimit", 4 );
        setdynamicdvar( "scr_war_winlimit", 3 );
        setdynamicdvar( "scr_war_numlives", 4 );
        maps\mp\_utility::registerWinLimitDvar( "war", 3 );
        setdynamicdvar( "scr_war_roundswitch", 1 );
        maps\mp\_utility::registerRoundSwitchDvar( "war", 1, 0, 9 );
        setdynamicdvar( "scr_war_halftime", 0 );
    }
    else
    {
        setdynamicdvar( "scr_game_hardpoints", 0 );
        setdynamicdvar( "scr_war_timelimit", 4 );
        setdynamicdvar( "scr_war_scorelimit", 0 );
        setdynamicdvar( "scr_war_roundlimit", 4 );
        setdynamicdvar( "scr_war_winlimit", 3 );
        setdynamicdvar( "scr_war_numlives", 1 );
        maps\mp\_utility::registerWinLimitDvar( "war", 3 );
        setdynamicdvar( "scr_war_roundswitch", 1 );
        maps\mp\_utility::registerRoundSwitchDvar( "war", 1, 0, 9 );
        setdynamicdvar( "scr_war_halftime", 0 );
        setdynamicdvar( "scr_player_healthregen", 0 );
        level._id_765A = getdvarint( "scr_war_roundswitch" );

        if ( maps\mp\_utility::_id_4015() == "mp_shipment" )
        {
            setdynamicdvar( "g_oldschool", 1 );
            setdynamicdvar( "scr_war_timelimit", 2.2 );
        }
    }
}

_id_A235()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        setupdvars();
        level waittill( "host_migration_end" );
        setupdvars();
    }
}

ph_precache()
{
    foreach ( var_1 in level.proplist )
        precachemodel( var_1.modelname );
}

_id_64DA()
{
    ph_precache();
}

initializegametypesettings()
{
    var_0 = 29;
    var_1 = 20;
    var_2 = 2;
    var_3 = 29;
    var_4 = 6;

    if ( maps\mp\_utility::_id_4015() == "mp_shipment" )
    {
        var_0 = 11;
        var_2 = 1;
    }

    level.phsettings = spawnstruct();
    level.phsettings.prophidetime = getdvarfloat( "scr_ph_propHideTime", var_0 );

    if ( level.madpropsmode )
    {
        level.madpropssettings = spawnstruct();
        level.madpropssettings.madpropshidetime = getdvarfloat( "scr_ph_madpropsHideTime", var_3 );
        level.madpropssettings.propinvulntime = getdvarfloat( "scr_ph_madpropsInvulnTime", var_4 );
    }
    else
    {
        level.phsettings.propwhistletime = getdvarfloat( "scr_ph_propWhistleTime", var_1 );
        level.phsettings.propchangecount = getdvarint( "scr_ph_propChangeCount", var_2 );
    }
}

onStartGameType()
{
    if ( [[ level.checkforovertime ]]() )
    {
        game["status"] = "overtime";
        setdvar( "ui_overtime", 1 );
        setdvar( "overtimeTimeLimit", 3.5 );
    }

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }
    else
        level._id_6F09 = 30;

    _id_8018();
    setclientnamemode( "manual_change" );

    if ( level.madpropsmode )
    {
        maps\mp\_utility::setObjectiveText( game["attackers"], &"OBJECTIVES_PK_ATTACKER" );
        maps\mp\_utility::setObjectiveText( game["defenders"], &"OBJECTIVES_PK_DEFENDER" );
        maps\mp\_utility::setObjectiveScoreText( game["attackers"], &"OBJECTIVES_PK_ATTACKER_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( game["defenders"], &"OBJECTIVES_PK_DEFENDER_SCORE" );
        maps\mp\_utility::setObjectiveHintText( game["attackers"], &"OBJECTIVES_PK_ATTACKER_HINT" );
        maps\mp\_utility::setObjectiveHintText( game["defenders"], &"OBJECTIVES_PK_DEFENDER_HINT" );
    }
    else
    {
        maps\mp\_utility::setObjectiveText( game["attackers"], &"OBJECTIVES_PH_ATTACKER" );
        maps\mp\_utility::setObjectiveText( game["defenders"], &"OBJECTIVES_PH_DEFENDER" );
        maps\mp\_utility::setObjectiveScoreText( game["attackers"], &"OBJECTIVES_PH_ATTACKER_SCORE" );
        maps\mp\_utility::setObjectiveScoreText( game["defenders"], &"OBJECTIVES_PH_DEFENDER_SCORE" );
        maps\mp\_utility::setObjectiveHintText( game["attackers"], &"OBJECTIVES_PH_ATTACKER_HINT" );
        maps\mp\_utility::setObjectiveHintText( game["defenders"], &"OBJECTIVES_PH_DEFENDER_HINT" );
    }

    if ( level.madpropsmode )
    {
        level.spawnMins = ( 0, 0, 0 );
        level.spawnMaxs = ( 0, 0, 0 );
        maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_tdm_spawn_allies_start" );
        maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_tdm_spawn_axis_start" );
        maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_tdm_spawn" );
        maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_tdm_spawn" );
    }
    else
    {
        level.spawnMins = ( 0, 0, 0 );
        level.spawnMaxs = ( 0, 0, 0 );
        maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_sd_spawn_attacker" );
        maps\mp\gametypes\_spawnlogic::addStartSpawnPoints( "mp_sd_spawn_defender" );
    }

    level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
    setmapcenter( level.mapCenter );
    var_2[0] = level.gametype;
    maps\mp\gametypes\_gameobjects::main( var_2 );
    level._id_058F["propFlash"] = loadfx( "vfx/explosion/flashbang_h1" );
    level._id_058F["propDeathFX"] = loadfx( "vfx/explosion/prop_explosion" );

    if ( !level.madpropsmode )
    {
        level thread setuproundstarthud();
        level thread propwhistle();
        level thread propspectateing();
        level thread hidehudintermission();
    }
    else
    {
        level.propsinvuln = 1;
        level thread setupmadpropsstarthud();
    }

    level thread monitortimers();
    level thread deleteallglass();
    level thread setphteamscores();
}

_id_8018()
{
    if ( level.madpropsmode )
    {
        var_0 = game["defenders"];
        level.ph_loadouts[var_0] = _id_A78B::_id_3F7B();
        level.ph_loadouts[var_0]["loadoutPrimary"] = "h1_ak47";
        level.ph_loadouts[var_0]["loadoutPerks"] = [ "specialty_null", "specialty_null", "specialty_quieter" ];
        level.ph_loadouts[var_0]["loadoutEquipment"] = "h1_fraggrenade_mp";
        level.ph_loadouts[var_0]["loadoutOffhand"] = "h1_flashgrenade_mp";
    }
    else
    {
        var_0 = game["defenders"];
        level.ph_loadouts[var_0] = _id_A78B::_id_3F7B();
        level.ph_loadouts[var_0]["loadoutPrimary"] = "h1_ak47";
        level.ph_loadouts[var_0]["loadoutPerks"] = [ "specialty_null", "specialty_null", "specialty_quieter" ];
        level.ph_loadouts[var_0]["loadoutEquipment"] = "h1_fraggrenade_mp";
        level.ph_loadouts[var_0]["loadoutOffhand"] = "h1_flashgrenade_mp";

        if ( maps\mp\_utility::_id_4015() == "mp_shipment" )
        {
            var_1 = game["attackers"];
            level.ph_loadouts[var_1] = _id_A78B::_id_3F7B();
            level.ph_loadouts[var_1]["loadoutSecondary"] = "h1_deserteagle";
            level.ph_loadouts[var_1]["loadoutPrimary"] = "h1_p90";
            level.ph_loadouts[var_1]["loadoutPerks"] = [ "rpg_mp", "specialty_null", "specialty_null" ];
            level.ph_loadouts[var_1]["loadoutEquipment"] = "h1_fraggrenade_mp";
            level.ph_loadouts[var_1]["loadoutOffhand"] = "h1_concussiongrenade_mp";
        }
        else
        {
            var_1 = game["attackers"];
            level.ph_loadouts[var_1] = _id_A78B::_id_3F7B();
            level.ph_loadouts[var_1]["loadoutSecondary"] = "h1_deserteagle";
            level.ph_loadouts[var_1]["loadoutPrimary"] = "h1_p90";
            level.ph_loadouts[var_1]["loadoutEquipment"] = "h1_fraggrenade_mp";
            level.ph_loadouts[var_1]["loadoutOffhand"] = "h1_concussiongrenade_mp";
        }
    }
}

phclass()
{
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.pers["gamemodeLoadout"] = level.ph_loadouts[self.pers["team"]];
    self._id_1E2E = self.pers["class"];
    self._id_5589 = self.pers["lastClass"];
}

getSpawnPoint()
{
    if ( self.pers["team"] == game["attackers"] )
        var_0 = "mp_sd_spawn_attacker";
    else
        var_0 = "mp_sd_spawn_defender";

    var_1 = maps\mp\gametypes\_spawnlogic::_id_40DD( var_0 );
    var_2 = maps\mp\gametypes\_spawnlogic::_id_40D8( var_1 );
    return var_2;
}

getpkspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["roundsPlayed"] >= 2 )
        var_0 = maps\mp\_utility::getOtherTeam( var_0 );

    if ( level._id_9C14 && level.inGracePeriod )
        var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( "mp_tdm_spawn_" + var_0 + "_start" );
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::_id_411F( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2, var_0 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

propspectateing()
{
    level endon( "game_ended" );
    level._id_8A4A[game["defenders"]]._id_0AA7 = 1;
    _id_A7BB::_id_9B72();
}

setupkeybindings()
{
    if ( level.madpropsmode )
    {
        self _meth_82DA( "explode", "+attack" );
        self _meth_82DA( "explode", "+attack_akimbo_accessible" );
        self _meth_82DA( "zoomin", "+actionslot 3" );
        self _meth_82DA( "zoomout", "+actionslot 4" );
        return;
    }

    self _meth_82DA( "lock", "+attack" );
    self _meth_82DA( "lock", "+attack_akimbo_accessible" );
    self _meth_82DA( "spin", "+toggleads_throw" );
    self _meth_82DA( "spin", "+speed_throw" );
    self _meth_82DA( "spin", "+speed" );
    self _meth_82DA( "spin", "+ads_akimbo_accessible" );
    self _meth_82DA( "changeProp", "weapnext" );
    self _meth_82DA( "setToSlope", "+usereload" );
    self _meth_82DA( "setToSlope", "+activate" );
    self _meth_82DA( "propAbility", "+smoke" );
    self _meth_82DA( "zoomin", "+actionslot 3" );
    self _meth_82DA( "zoomout", "+actionslot 4" );
    self _meth_82DA( "spectate", "+actionslot 2" );
}

propcontrolshud()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = 26;
    self.propchangecounter = _id_A7A7::_id_2401( "objective", 0.9 );
    self.propchangecounter.land = &"MP_PH_CHANGESLEFT";
    self.propchangecounter _meth_80D9( 0 );
    self.propchangecounter.xpmaxmultipliertimeplayed = -5;
    self.propchangecounter._id_0538 = var_0;
    self.propchangecounter.alignx = "right";
    self.propchangecounter.aligny = "top";
    self.propchangecounter.hostquits = "right_adjustable";
    self.propchangecounter.visionsetnight = "top_adjustable";
    self.propchangecounter.archived = 1;
    self.propchangecounter.fontscale = 1;
    self.propchangecounter.alpha = 1;
    self.propchangecounter.glowalpha = 0;
    self.propchangecounter.hindlegstraceoffset = 0;
    var_0 += 12;
    self.changepropkey = _id_A7A7::_id_2401( "objective", 0.9 );
    self.changepropkey.land = &"MP_PH_CHANGE";
    self.changepropkey.xpmaxmultipliertimeplayed = -5;
    self.changepropkey._id_0538 = var_0;
    self.changepropkey.alignx = "right";
    self.changepropkey.aligny = "top";
    self.changepropkey.hostquits = "right_adjustable";
    self.changepropkey.visionsetnight = "top_adjustable";
    self.changepropkey.archived = 1;
    self.changepropkey.fontscale = 1;
    self.changepropkey.alpha = 1;
    self.changepropkey.glowalpha = 0;
    self.changepropkey.hindlegstraceoffset = 0;
    var_0 += 12;
    self.lockpropkey = _id_A7A7::_id_2401( "objective", 0.9 );
    self.lockpropkey.land = &"MP_PH_LOCK";
    self.lockpropkey.xpmaxmultipliertimeplayed = -5;
    self.lockpropkey._id_0538 = var_0;
    self.lockpropkey.alignx = "right";
    self.lockpropkey.aligny = "top";
    self.lockpropkey.hostquits = "right_adjustable";
    self.lockpropkey.visionsetnight = "top_adjustable";
    self.lockpropkey.archived = 1;
    self.lockpropkey.fontscale = 1;
    self.lockpropkey.alpha = 1;
    self.lockpropkey.glowalpha = 0;
    self.lockpropkey.hindlegstraceoffset = 0;
    var_0 += 12;
    self.matchslopekey = _id_A7A7::_id_2401( "objective", 0.9 );

    if ( common_scripts\utility::_id_5064() )
        self.matchslopekey.land = &"MP_PH_SLOPE";
    else
        self.matchslopekey.land = &"MP_PH_SLOPE_PC";

    self.matchslopekey.xpmaxmultipliertimeplayed = -5;
    self.matchslopekey._id_0538 = var_0;
    self.matchslopekey.alignx = "right";
    self.matchslopekey.aligny = "top";
    self.matchslopekey.hostquits = "right_adjustable";
    self.matchslopekey.visionsetnight = "top_adjustable";
    self.matchslopekey.archived = 1;
    self.matchslopekey.fontscale = 1;
    self.matchslopekey.alpha = 1;
    self.matchslopekey.glowalpha = 0;
    self.matchslopekey.hindlegstraceoffset = 0;
    var_0 += 12;
    self.abilitykey = _id_A7A7::_id_2401( "objective", 0.9 );
    setnewabilityhud();
    self.abilitykey.xpmaxmultipliertimeplayed = -5;
    self.abilitykey._id_0538 = var_0;
    self.abilitykey.alignx = "right";
    self.abilitykey.aligny = "top";
    self.abilitykey.hostquits = "right_adjustable";
    self.abilitykey.visionsetnight = "top_adjustable";
    self.abilitykey.archived = 1;
    self.abilitykey.fontscale = 1;
    self.abilitykey.alpha = 1;
    self.abilitykey.glowalpha = 0;
    self.abilitykey.hindlegstraceoffset = 0;
    thread updatetextongamepadchange();
}

pkcontrolshud()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = 38;
    self.pkexplodekey = _id_A7A7::_id_2401( "objective", 0.9 );
    self.pkexplodekey.land = &"MP_PK_EXPLODELKEY";
    self.pkexplodekey.xpmaxmultipliertimeplayed = -5;
    self.pkexplodekey._id_0538 = var_0;
    self.pkexplodekey.alignx = "right";
    self.pkexplodekey.aligny = "top";
    self.pkexplodekey.hostquits = "right_adjustable";
    self.pkexplodekey.visionsetnight = "top_adjustable";
    self.pkexplodekey.archived = 1;
    self.pkexplodekey.fontscale = 1;
    self.pkexplodekey.alpha = 0;
    self.pkexplodekey.glowalpha = 0;
    self.pkexplodekey.hindlegstraceoffset = 0;
    var_0 += 12;
    self.pklivesleft = _id_A7A7::_id_2401( "objective", 0.9 );
    self.pklivesleft.land = &"MP_PK_LIVESLEFT";
    self.pklivesleft _meth_80D9( 3 );
    self.pklivesleft.xpmaxmultipliertimeplayed = -5;
    self.pklivesleft._id_0538 = var_0;
    self.pklivesleft.alignx = "right";
    self.pklivesleft.aligny = "top";
    self.pklivesleft.hostquits = "right_adjustable";
    self.pklivesleft.visionsetnight = "top_adjustable";
    self.pklivesleft.archived = 1;
    self.pklivesleft.fontscale = 1;
    self.pklivesleft.alpha = 1;
    self.pklivesleft.glowalpha = 0;
    self.pklivesleft.hindlegstraceoffset = 0;
}

updatetextongamepadchange()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( level._id_2153 )
        return;

    var_0 = common_scripts\utility::_id_5064();

    for (;;)
    {
        var_1 = common_scripts\utility::_id_5064();

        if ( var_1 != var_0 )
        {
            var_0 = var_1;

            if ( var_1 )
            {
                if ( !maps\mp\_utility::_id_5092( self.slopelocked ) )
                    self.matchslopekey.land = &"MP_PH_SLOPE";
                else
                    self.matchslopekey.land = &"MP_PH_SLOPED";
            }
            else if ( !maps\mp\_utility::_id_5092( self.slopelocked ) )
                self.matchslopekey.land = &"MP_PH_SLOPE_PC";
            else
                self.matchslopekey.land = &"MP_PH_SLOPED_PC";
        }

        waittillframeend;
    }
}

setuproundstarthud()
{
    level.phcountdowntimer = _id_A7A7::_id_243F( "objective", 1.4 );
    level.phcountdowntimer _id_A7A7::_id_7FEE( "CENTER", undefined, 0, 50 );
    level.phcountdowntimer.land = &"MP_PH_STARTS_IN";
    level.phcountdowntimer.alpha = 0;
    level.phcountdowntimer.archived = 0;
    level.phcountdowntimer.hindlegstraceoffset = 1;
    level.phcountdowntimer.space = 1;
    level.phwhistletimer = _id_A7A7::_id_243F( "objective", 0.9 );
    level.phwhistletimer.xpmaxmultipliertimeplayed = -6;
    level.phwhistletimer._id_0538 = 2;
    level.phwhistletimer.alignx = "right";
    level.phwhistletimer.aligny = "top";
    level.phwhistletimer.hostquits = "right_adjustable";
    level.phwhistletimer.visionsetnight = "top_adjustable";
    level.phwhistletimer.land = &"MP_PH_WHISTILE_IN";
    level.phwhistletimer.alpha = 0;
    level.phwhistletimer.archived = 0;
    level.phwhistletimer.hindlegstraceoffset = 1;
    level.phwhistletimer _meth_80D1( 120 );
    level.whistling = _id_A7A7::_id_243D( "objective", 1 );
    level.whistling.land = &"MP_PH_WHISTLING";
    level.whistling.xpmaxmultipliertimeplayed = -5;
    level.whistling._id_0538 = 2;
    level.whistling.alignx = "right";
    level.whistling.aligny = "top";
    level.whistling.hostquits = "right_adjustable";
    level.whistling.visionsetnight = "top_adjustable";
    level.whistling.archived = 1;
    level.whistling.alpha = 0;
    level.whistling.glowalpha = 0.2;
    level.whistling.hindlegstraceoffset = 0;

    if ( !isdefined( level.elim_hud ) )
        level.elim_hud = [];

    level.elim_hud = _id_A7A7::_id_243D( "objective", 0.9 );
    level.elim_hud.land = &"MP_PH_ALIVE";
    level.elim_hud _meth_80D9( 0 );
    level.elim_hud.xpmaxmultipliertimeplayed = -5;
    level.elim_hud._id_0538 = 14;
    level.elim_hud.alignx = "right";
    level.elim_hud.aligny = "top";
    level.elim_hud.hostquits = "right_adjustable";
    level.elim_hud.visionsetnight = "top_adjustable";
    level.elim_hud.archived = 1;
    level.elim_hud.fontscale = 1.0;
    level.elim_hud.alpha = 1;
    level.elim_hud.glowalpha = 0;
    level.elim_hud.hindlegstraceoffset = 0;
    level thread eliminatedhudmonitor();
}

setupmadpropsstarthud()
{
    if ( !isdefined( level.elim_hud ) )
        level.elim_hud = [];

    level.elim_hud = _id_A7A7::_id_243D( "objective", 0.9 );
    level.elim_hud.land = &"MP_PK_ALIVE";
    level.elim_hud _meth_80D9( 0 );
    level.elim_hud.xpmaxmultipliertimeplayed = -5;
    level.elim_hud._id_0538 = 14;
    level.elim_hud.alignx = "right";
    level.elim_hud.aligny = "top";
    level.elim_hud.hostquits = "right_adjustable";
    level.elim_hud.visionsetnight = "top_adjustable";
    level.elim_hud.archived = 1;
    level.elim_hud.fontscale = 1.0;
    level.elim_hud.alpha = 1;
    level.elim_hud.glowalpha = 0;
    level.elim_hud.hindlegstraceoffset = 0;

    if ( !isdefined( level.elim_hud_humans ) )
        level.elim_hud_humans = [];

    level.elim_hud_humans = _id_A7A7::_id_243D( "objective", 0.9 );
    level.elim_hud_humans.land = &"MP_PK_HUMANSALIVE";
    level.elim_hud_humans _meth_80D9( 0 );
    level.elim_hud_humans.xpmaxmultipliertimeplayed = -5;
    level.elim_hud_humans._id_0538 = 26;
    level.elim_hud_humans.alignx = "right";
    level.elim_hud_humans.aligny = "top";
    level.elim_hud_humans.hostquits = "right_adjustable";
    level.elim_hud_humans.visionsetnight = "top_adjustable";
    level.elim_hud_humans.archived = 1;
    level.elim_hud_humans.fontscale = 1.0;
    level.elim_hud_humans.alpha = 1;
    level.elim_hud_humans.glowalpha = 0;
    level.elim_hud_humans.hindlegstraceoffset = 0;
    level thread eliminatedhudmonitor();
    level.phcountdowntimer = _id_A7A7::_id_243F( "objective", 1.4 );
    level.phcountdowntimer _id_A7A7::_id_7FEE( "CENTER", undefined, 0, 50 );
    level.phcountdowntimer.land = &"MP_PK_STARTS_IN";
    level.phcountdowntimer.alpha = 0;
    level.phcountdowntimer.archived = 0;
    level.phcountdowntimer.hindlegstraceoffset = 1;
    level.phcountdowntimer.space = 1;
    level.pkinvuln = _id_A7A7::_id_243F( "objective", 1.4 );
    level.pkinvuln _id_A7A7::_id_7FEE( "CENTER", undefined, 0, 50 );
    level.pkinvuln.land = &"MP_PK_PROPSINVULN";
    level.pkinvuln.alpha = 0;
    level.pkinvuln.archived = 0;
    level.pkinvuln.hindlegstraceoffset = 1;
    level.pkinvuln.space = 1;
}

eliminatedhudmonitor()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( level.madpropsmode )
        {
            var_0 = get_alive_nonspecating_players( game["attackers"] );
            level.elim_hud_humans _meth_80D9( var_0.size );
        }

        var_1 = get_alive_nonspecating_players( game["defenders"] );
        level.elim_hud _meth_80D9( var_1.size );
        level common_scripts\utility::_id_A069( "player_spawned", "player_killed", "player_eliminated", "playerCountChanged", "propCountChanged" );
    }
}

get_alive_nonspecating_players( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) && ( !isdefined( var_3.sharpturnlookaheaddist ) || var_3.sharpturnlookaheaddist == "playing" ) )
        {
            if ( !isdefined( var_0 ) || var_3.team == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

weaponusagecheck()
{
    var_0 = common_scripts\utility::_id_A070( "weapon_fired", "end_weapon_check_usage" );

    if ( var_0 == "end_weapon_check_usage" )
    {
        kick( self _meth_81B5(), "EXE_PLAYERKICKED_INACTIVE" );
        return 0;
    }

    return 1;
}

positioncheck()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = self.owner_not;
    var_1 = squared( 300 );
    var_2 = 0;

    for ( var_3 = 0; var_3 < 30; var_3++ )
    {
        if ( !var_2 )
        {
            var_4 = distancesquared( var_0, self.owner_not );

            if ( var_4 >= var_1 )
                var_2 = 1;
        }

        _id_A7A4::_id_A052( 1 );
    }

    if ( var_2 )
        return 1;

    return 0;
}

startcheck()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self.doingcheck = 1;
    maps\mp\_utility::_id_3BE1( "prematch_done" );

    while ( !level.startcheck )
        wait 1;

    if ( !level.madpropsmode )
        childthread weaponusagecheck();

    if ( !positioncheck() )
    {
        kick( self _meth_81B5(), "EXE_PLAYERKICKED_INACTIVE" );
        return;
    }

    if ( !positioncheck() )
    {
        kick( self _meth_81B5(), "EXE_PLAYERKICKED_INACTIVE" );
        return;
    }

    _id_A7A4::_id_A052( 30 );
    self notify( "end_weapon_check_usage" );
}

onconnect()
{
    if ( level.madpropsmode )
        thread watchthrownflash();

    thread attackerswaittime();
}

_id_64E9()
{
    self._id_17E6 = 0;

    if ( self.team == game["defenders"] )
    {
        if ( level.madpropsmode )
        {
            self.concussionimmune = 1;
            self.flashimmune = 1;
            thread handleprop();
            thread updateprop();

            if ( !isdefined( self.pkexplodekey ) )
                thread pkcontrolshud();

            if ( !isdefined( self.doingcheck ) )
                thread startcheck();

            self _meth_831C();
        }
        else
        {
            self.concussionimmune = 1;
            setownedtaunt();
            self.isangleoffset = 0;
            self.changesleft = int( level.phsettings.propchangecount );

            if ( !isdefined( self.pers["ability"] ) )
                self.pers["ability"] = 0;

            self.currentability = level._id_06B5[self.pers["ability"]];
            self.abilitylocked = 0;
            setnewabilitycount();
            thread playerlastvalidpositionwatch();
            thread propcontrolshud();
            thread handleprop();
            thread updateprop();
        }
    }
    else if ( level.madpropsmode )
    {
        self.pers["lives"] = 0;
        level._id_57B9[self.team] = 0;
    }
    else
    {
        if ( !isdefined( self.hasthrownspecial ) )
            self.hasthrownspecial = 0;

        thread givecustomloadout();

        if ( !isdefined( self.doingcheck ) )
            thread startcheck();
    }
}

playerlastvalidpositionwatch()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "stop_watch_last_valid_pos" );
    self.lastvalidpos = undefined;
    self.lastnodeinsight = undefined;

    for (;;)
    {
        var_0 = playerphysicstraceinfo( self.owner_not, self.owner_not + ( 0, 0, 1 ), self );

        if ( var_0["fraction"] == 1 )
            self.lastvalidpos = self.owner_not;

        var_1 = getclosestnodeinsight( self.owner_not );

        if ( isdefined( var_1 ) )
            self.lastnodeinsight = var_1;

        waittillframeend;
    }
}

monitortimers()
{
    level endon( "game_ended" );
    maps\mp\_utility::_id_3BE1( "prematch_done" );

    if ( level.madpropsmode )
    {
        level thread pausepktimerformigration();
        level.phcountdowntimer _meth_80D1( level.madpropssettings.madpropshidetime );
        level.phcountdowntimer.alpha = 1;
        _id_A7A4::_id_A052( level.madpropssettings.madpropshidetime );
    }
    else
    {
        level thread pausephtimerformigration();
        level.phcountdowntimer _meth_80D1( level.phsettings.prophidetime );
        level.phcountdowntimer.alpha = 1;
        level.phwhistletimer _meth_80D1( level.phsettings.propwhistletime + level.phsettings.prophidetime );
        level.phwhistletimer.alpha = 1;
        _id_A7A4::_id_A052( level.phsettings.prophidetime );
    }

    level notify( "props_hide_over" );

    if ( !level.madpropsmode )
    {
        level.phwhistletimer.alpha = 1;
        level.phcountdowntimer.alpha = 0;

        foreach ( var_1 in level.players )
        {
            if ( isdefined( var_1.abilitylocked ) )
                var_1.abilitylocked = 1;
        }
    }
    else
    {
        level.phcountdowntimer.alpha = 0;
        level.pkinvuln _meth_80D1( level.madpropssettings.propinvulntime );
        level.pkinvuln.alpha = 1;
        _id_A7A4::_id_A052( level.madpropssettings.propinvulntime );
        level.pkinvuln.alpha = 0;
        level.propsinvuln = 0;

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == game["defenders"] && isdefined( var_1.pkexplodekey ) && maps\mp\_utility::_id_5189( var_1 ) )
            {
                var_1.concussionimmune = 0;
                var_1.flashimmune = 0;
                var_1.pkexplodekey.alpha = 1;
            }
        }
    }
}

pausephtimerformigration()
{
    level endon( "game_ended" );
    level endon( "props_hide_over" );
    var_0 = int( level.phsettings.prophidetime + gettime() / 1000 );
    var_1 = 0;

    for (;;)
    {
        level waittill( "host_migration_begin" );
        level.phcountdowntimer.alpha = 0;
        level.phwhistletimer.alpha = 0;
        var_2 = int( _id_A7A4::_id_A0DD() / 1000 );
        var_1 += var_2;
        var_2 = var_1;
        var_3 = var_0 + var_2 - int( gettime() / 1000 );
        level.phcountdowntimer _meth_80D1( var_3 );
        level.phwhistletimer _meth_80D1( level.phsettings.propwhistletime + var_3 );
        level.phcountdowntimer.alpha = 1;
        level.phwhistletimer.alpha = 1;
    }
}

pausepktimerformigration()
{
    level endon( "game_ended" );
    level endon( "props_hide_over" );
    var_0 = int( level.madpropssettings.madpropshidetime + gettime() / 1000 );
    var_1 = 0;

    for (;;)
    {
        level waittill( "host_migration_begin" );
        level.pkcountdowntimer.alpha = 0;
        var_2 = int( _id_A7A4::_id_A0DD() / 1000 );
        var_1 += var_2;
        var_2 = var_1;
        var_3 = var_0 + var_2 - int( gettime() / 1000 );
        level.pkcountdowntimer _meth_80D1( var_3 );
        level.pkcountdowntimer.alpha = 1;
    }
}

setownedtaunt()
{
    var_0 = "prop_whistle_01";
    self.playtaunt = var_0;
}

handleprop()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "applyLoadout" );

        if ( level.madpropsmode )
        {
            self _meth_830D();

            if ( !isdefined( self.prop ) )
                thread setupmadprops();

            continue;
        }

        self _meth_830D();
        self _meth_8301( 0 );
        self _meth_826F( game["attackers"], 1 );
        self _meth_81E4( 1.5 );

        if ( !isdefined( self.prop ) )
            thread setupprop();
    }
}

setupprop()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = common_scripts\utility::_id_710E( level.proplist );
    self _meth_8005( 1 );
    self.propanchor = spawn( "script_model", self.owner_not );
    self.propanchor _meth_8442( self );
    self.propanchor _meth_8581();
    self.propanchor _meth_80C0( 0 );
    self.propent = spawn( "script_model", self.owner_not );
    self.propent _meth_8442( self.propanchor );
    self.propent _meth_8581();
    self.propent _meth_80C0( 0 );
    self.prop = spawn( "script_model", self.propent.owner_not );
    self.prop setModel( var_0.modelname );
    self.prop _meth_82BC( 1 );
    self.prop.xyzoffset = var_0.xyzoffset;
    self.prop.anglesoffset = var_0.anglesoffset;
    self.prop.angles = self.angles;
    applyxyzoffset();
    applyanglesoffset();
    self.prop _meth_8442( self.propent );
    self.prop _meth_8581();
    self.prop.owner = self;
    self.prop.helmet = 10000;
    self.prop _meth_8491( 1 );
    self.prop._id_4C5C = var_0;
    self.helmet = var_0.propsize;
    self.maxturnspeed = self.helmet;
    thread setupkeybindings();
    thread setupdamage();
    childthread proplockwatch();
    thread propwatchdeath();
    thread propwatchdeletedisconnect();
    thread propwatchdeleteroundend();
    self notify( "propSetup" );
}

setupmadprops()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = common_scripts\utility::_id_710E( level.proplist );
    self _meth_8005( 1 );
    self.propanchor = spawn( "script_model", self.owner_not );
    self.propanchor _meth_8442( self );
    self.propanchor _meth_8581();
    self.propanchor _meth_80C0( 0 );
    self.propent = spawn( "script_model", self.owner_not );
    self.propent _meth_8442( self.propanchor );
    self.propent _meth_8581();
    self.propent _meth_80C0( 0 );
    self.prop = spawn( "script_model", self.propent.owner_not );
    self.prop setModel( var_0.modelname );
    self.prop _meth_82BC( 1 );
    self.prop.xyzoffset = var_0.xyzoffset;
    self.prop.anglesoffset = var_0.anglesoffset;
    self.prop.angles = self.angles;
    applyxyzoffset();
    applyanglesoffset();
    self.prop _meth_8442( self.propent );
    self.prop _meth_8581();
    self.prop.owner = self;
    self.prop.helmet = 10000;
    self.prop _meth_8491( 1 );
    self.prop._id_4C5C = var_0;
    self.helmet = var_0.propsize;
    self.maxturnspeed = self.helmet;
    thread setupkeybindings();
    thread setupdamage();
    childthread madpropswatch();
    thread propwatchdeath();
    thread propwatchdeletedisconnect();
    thread propwatchdeleteroundend();
    self notify( "propSetup" );
}

applyxyzoffset()
{
    if ( !isdefined( self.prop.xyzoffset ) )
        return;

    self.prop.angles = self.angles;
    var_0 = anglestoforward( self.prop.angles ) * self.prop.xyzoffset[0];
    var_1 = anglestoright( self.prop.angles ) * self.prop.xyzoffset[1];
    var_2 = anglestoup( self.prop.angles ) * self.prop.xyzoffset[2];
    self.prop.owner_not += var_0;
    self.prop.owner_not += var_1;
    self.prop.owner_not += var_2;
}

applyanglesoffset()
{
    if ( !isdefined( self.prop.anglesoffset ) )
        return;

    self.prop.angles = self.angles;
    self.prop.angles += self.prop.anglesoffset;
    self.isangleoffset = 1;
}

propwhistle()
{
    level endon( "game_ended" );
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    var_0 = gettime();
    var_1 = level.phsettings.propwhistletime * 1000;
    var_2 = var_1;
    var_3 = 5000;
    _id_A7A4::_id_A052( level.phsettings.prophidetime + level.phsettings.propwhistletime );

    for (;;)
    {
        if ( var_0 + var_1 < gettime() )
        {
            foreach ( var_5 in level.players )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                level.phwhistletimer.alpha = 0;
                level.whistling.alpha = 0.6;

                if ( var_5.team == game["defenders"] && isalive( var_5 ) )
                {
                    level.whistling.alpha = 1;
                    level.whistling _meth_8086( 0.75 );
                    level.whistling.alpha = 0.6;
                    playsoundatpos( var_5.owner_not, var_5.playtaunt );
                    _id_A7A4::_id_A052( 1.5 );
                }
            }

            var_0 = gettime();

            if ( var_2 >= _id_A793::_id_4131() - var_3 )
            {
                level.whistling.alpha = 0;
                return;
            }
            else
            {
                if ( var_2 * 2 + getteamplayersalive( game["defenders"] ) * 2500 >= _id_A793::_id_4131() - var_3 )
                {
                    level.phwhistletimer.land = &"MP_PH_FINAL_WHISTLE";
                    var_2 += getteamplayersalive( game["defenders"] ) * 2500;
                }

                level.phwhistletimer _meth_80D1( int( var_1 / 1000 ) );
                level.whistling.alpha = 0;
                level.phwhistletimer.alpha = 1;
            }
        }

        _id_A7A4::_id_A052( 0.5 );
    }
}

getlivingplayersonteam( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.participants )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( maps\mp\_utility::_id_5189( var_3 ) && maps\mp\_utility::_id_51CE( var_3 ) && var_3.team == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

createpropspeclist()
{
    self.spectatableprops = getlivingplayersonteam( game["defenders"] );
}

proplockwatch()
{
    if ( isbot( self ) )
        return;

    self._id_57FE = 0;
    self.slopelocked = 0;
    var_0 = level.proplist;
    self.propchangecounter _meth_80D9( self.changesleft );
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    childthread propmoveunlock();
    childthread propcamerazoom();
    childthread propspectate();
    var_1 = 1;

    for (;;)
    {
        var_2 = common_scripts\utility::_id_A070( "lock", "spin", "changeProp", "setToSlope", "propAbility" );

        if ( !isdefined( var_2 ) )
            continue;

        if ( self.propspectating )
            continue;

        if ( self.endingpropspecate )
            continue;

        if ( var_2 == "lock" )
        {
            if ( self _meth_82DD() )
                continue;

            if ( self._id_57FE )
                unlockprop();
            else
                lockprop();

            continue;
        }

        if ( var_2 == "spin" )
        {
            self.propent _meth_8051();
            self.propent.angles += ( 0, 45, 0 );
            self.propent.owner_not = self.propanchor.owner_not;

            if ( self.slopelocked && maps\mp\_utility::_id_5092( self._id_57FE ) )
                self.propent set_pitch_roll_for_ground_normal( self.prop );

            self.propent _meth_8442( self.propanchor );
            continue;
        }

        if ( var_2 == "changeProp" )
        {
            if ( var_0.size == 1 )
                var_0 = level.proplist;

            if ( self.changesleft > 0 )
            {
                self notify( "changed_prop" );
                var_0 = common_scripts\utility::_id_0CF6( var_0, self.prop._id_4C5C );
                self.prop._id_4C5C = common_scripts\utility::_id_710E( var_0 );
                self.prop setModel( self.prop._id_4C5C.modelname );
                self.prop.xyzoffset = self.prop._id_4C5C.xyzoffset;
                self.prop.anglesoffset = self.prop._id_4C5C.anglesoffset;
                self.prop _meth_8051();
                self.propent _meth_8051();
                self.propent.owner_not = self.propanchor.owner_not;
                self.prop.owner_not = self.propent.owner_not;
                self.propent.angles = ( self.angles[0], self.propent.angles[1], self.angles[2] );
                self.prop.angles = self.propent.angles;

                if ( maps\mp\_utility::_id_5092( self.isangleoffset ) )
                {
                    self.prop.angles = self.angles;
                    self.isangleoffset = 0;
                }

                applyxyzoffset();
                applyanglesoffset();
                self.prop _meth_8442( self.propent );

                if ( self.slopelocked && maps\mp\_utility::_id_5092( self._id_57FE ) )
                    self.propent set_pitch_roll_for_ground_normal( self.prop );

                self.propent _meth_8442( self.propanchor );
                var_3 = self.helmet / self.maxturnspeed;
                self.maxturnspeed = int( self.prop._id_4C5C.propsize );
                self.helmet = int( self.prop._id_4C5C.propsize * var_3 );
                setnewabilitycount();
                self.abilitykey.alpha = 1;
                self.changesleft--;
                self.propchangecounter _meth_80D9( self.changesleft );

                if ( self.changesleft <= 0 )
                    self.changepropkey.alpha = 0;
            }

            continue;
        }

        if ( var_2 == "setToSlope" )
        {
            if ( !maps\mp\_utility::_id_5092( self.slopelocked ) )
            {
                self.slopelocked = 1;

                if ( maps\mp\_utility::_id_5092( self._id_57FE ) )
                {
                    self.propent _meth_8051();
                    self.propent set_pitch_roll_for_ground_normal( self.prop );
                    self.propent _meth_804F( self.propanchor );
                }

                if ( common_scripts\utility::_id_5064() )
                    self.matchslopekey.land = &"MP_PH_SLOPED";
                else
                    self.matchslopekey.land = &"MP_PH_SLOPED_PC";
            }
            else
            {
                self.slopelocked = 0;

                if ( maps\mp\_utility::_id_5092( self._id_57FE ) )
                {
                    self.propent _meth_8051();
                    self.propent.angles = ( self.angles[0], self.prop.angles[1], self.angles[2] );
                    self.propent.owner_not = self.propanchor.owner_not;
                    self.propent _meth_8442( self.propanchor );
                }

                if ( common_scripts\utility::_id_5064() )
                    self.matchslopekey.land = &"MP_PH_SLOPE";
                else
                    self.matchslopekey.land = &"MP_PH_SLOPE_PC";
            }

            continue;
        }

        if ( var_2 == "propAbility" )
        {
            if ( !self.abilitylocked )
                self.abilitylocked = 1;

            if ( self.abilityleft > 0 )
            {
                thread useability();

                if ( self.abilityleft <= 0 )
                    self.abilitykey.alpha = 0;
            }
        }
    }
}

madpropswatch()
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( isbot( self ) )
        return;

    maps\mp\_utility::_id_3BE1( "prematch_done" );
    childthread propcamerazoom();

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A070( "explode" );

        if ( !isdefined( var_0 ) )
            continue;

        if ( level.propsinvuln )
            continue;

        self _meth_809C( "prop_whistle_01" );
        _id_A7A4::_id_A052( 1 );

        if ( var_0 == "explode" )
        {
            magicgrenademanual( "h1_fraggrenade_mp", self.owner_not + ( 0, 0, 5 ), ( 0, 0, 0 ), 0, self, 1 );
            self _meth_8267();
        }
    }
}

set_pitch_roll_for_ground_normal( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_1 = self;
    else
        var_1 = var_0;

    var_2 = bullettrace( self.owner_not + ( 0, 0, 4 ), self.owner_not + ( 0, 0, -16 ), 0, var_1, 1, 0, 0, 0, 0, 0, 0 );

    if ( var_2["fraction"] >= 1 )
        return;

    var_3 = var_2["normal"];
    var_4 = anglestoforward( self.angles );
    var_5 = anglestoright( self.angles );
    var_6 = vectortoangles( var_3 );
    var_7 = angleclamp180( var_6[0] + 90 );
    var_6 = ( 0, var_6[1], 0 );
    var_8 = anglestoforward( var_6 );
    var_9 = vectordot( var_8, var_5 );

    if ( var_9 < 0 )
        var_9 = -1;
    else
        var_9 = 1;

    var_10 = vectordot( var_8, var_4 );
    var_11 = var_10 * var_7;
    var_12 = ( 1 - abs( var_10 ) ) * var_7 * var_9;
    self.angles = ( var_11, self.angles[1], var_12 );
}

propmoveunlock()
{
    for (;;)
    {
        waittillframeend;
        var_0 = self _meth_82F0();

        if ( !isdefined( var_0 ) )
            continue;

        if ( self.propspectating )
            continue;

        if ( self._id_57FE && ( var_0[0] != 0 || var_0[1] != 0 ) )
            unlockprop();
    }
}

allowmove( var_0 )
{
    if ( var_0 )
        self _meth_807E( level.ph_linker, "tag_player" );
    else
        self _meth_8051();
}

unlockprop()
{
    self _meth_8051();

    if ( self.slopelocked )
    {
        self.propent _meth_8051();
        self.propent.angles = ( self.angles[0], self.propent.angles[1], self.angles[2] );
        self.propent.owner_not = self.propanchor.owner_not;
        self.propent _meth_8442( self.propanchor );
    }

    self.propanchor _meth_8442( self );
    self._id_57FE = 0;
    self.lockpropkey.land = &"MP_PH_LOCK";
}

lockprop()
{
    self.propanchor _meth_8051();
    self.propanchor.owner_not = self.owner_not;
    self _meth_807E( self.propanchor );

    if ( self.slopelocked )
    {
        self.propent _meth_8051();
        self.propent set_pitch_roll_for_ground_normal( self.prop );
        self.propent _meth_8442( self.propanchor );
    }

    self._id_57FE = 1;
    self.lockpropkey.land = &"MP_PH_LOCKED";
    self notify( "locked" );
}

propspectate()
{
    level endon( "noPropsToSpectate" );
    self.propspectating = 0;
    self.endingpropspecate = 0;

    if ( !isdefined( self.spectatenumber ) )
        self.spectatenumber = 0;

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A070( "spectate" );

        if ( self.endingpropspecate )
            continue;

        if ( var_0 == "spectate" )
        {
            if ( self.propspectating )
            {
                self notify( "endPropSpectate" );
                continue;
            }

            createpropspeclist();

            if ( self.spectatableprops.size <= 1 )
                continue;

            self.propspectating = 1;
            propabilitykeysvisible( 0 );
            thread propspectateendwatch();
            childthread propspectatekeys();
        }
    }
}

propspectatekeys()
{
    self endon( "endPropSpectate" );

    if ( checkifvalidpropspectate() )
        spectateprop();
    else
    {
        findvalidspectateprop( 1 );
        spectateprop();
    }

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A070( "zoomin", "zoomout" );

        if ( self.endingpropspecate )
            continue;

        if ( var_0 == "zoomin" )
        {
            findvalidspectateprop( 1 );
            checkifvalidpropspectate();
            movetonewprop();
        }

        if ( var_0 == "zoomout" )
        {
            findvalidspectateprop( 0 );
            checkifvalidpropspectate();
            movetonewprop();
        }
    }
}

checkifvalidpropspectate()
{
    var_0 = self.spectatableprops[self.spectatenumber];

    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == self )
        return 0;

    if ( maps\mp\_utility::_id_5189( var_0 ) )
        return 1;

    return 0;
}

findvalidspectateprop( var_0 )
{
    var_1 = self.spectatenumber;

    for (;;)
    {
        if ( maps\mp\_utility::_id_5092( var_0 ) )
            self.spectatenumber++;
        else
            self.spectatenumber--;

        if ( var_0 && self.spectatableprops.size <= self.spectatenumber )
            self.spectatenumber = 0;
        else if ( self.spectatenumber < 0 )
            self.spectatenumber = self.spectatableprops.size - 1;

        if ( self.spectatenumber == var_1 )
            break;

        if ( checkifvalidpropspectate() )
            break;
    }
}

propspectateendwatch()
{
    self endon( "disconnect" );
    self endon( "death" );
    createpropspecatehud();
    common_scripts\utility::_id_A06A( self, "endPropSpectate", level, "noPropsToSpectate" );

    if ( maps\mp\_utility::_id_5092( self.endingpropspecate ) )
        return;

    self.endingpropspecate = 1;
    destroypropspecatehud();
    returntoprop();
    waitframe;
    propabilitykeysvisible( 1 );
    self.propspectating = 0;
    self.endingpropspecate = 0;
}

createpropspecatehud()
{
    self.spectatecommands = _id_A7A7::_id_2401( "objective", 1 );
    self.spectatecommands.land = &"MP_PH_SPECCOMMANDS";
    self.spectatecommands.xpmaxmultipliertimeplayed = 20;
    self.spectatecommands._id_0538 = -80;
    self.spectatecommands.alignx = "center";
    self.spectatecommands.aligny = "middle";
    self.spectatecommands.hostquits = "center_adjustable";
    self.spectatecommands.visionsetnight = "bottom_adjustable";
    self.spectatecommands.archived = 1;
    self.spectatecommands.fontscale = 1;
    self.spectatecommands.alpha = 1;
    self.spectatecommands.glowalpha = 0.5;
    self.spectatecommands.hindlegstraceoffset = 0;
}

destroypropspecatehud()
{
    if ( isdefined( self.spectatecommands ) )
        self.spectatecommands _meth_808A();
}

spectateprop()
{
    var_0 = self.spectatableprops[self.spectatenumber];
    self.spectatingthisplayer = var_0;
    self.propanchor _meth_8051();
    self.propanchor.owner_not = self.owner_not;
    self _meth_8335( var_0.owner_not );
    self.angles = var_0.angles;
    self _meth_807E( var_0.propanchor );
}

movetonewprop()
{
    var_0 = self.spectatableprops[self.spectatenumber];
    self _meth_8051();
    self.owner_not = var_0.owner_not;
    self.angles = var_0.angles;
    self _meth_807E( var_0.propanchor );
}

returntoprop()
{
    self _meth_8051();
    self _meth_8335( self.propanchor.owner_not );

    if ( self._id_57FE )
        self _meth_807E( self.propanchor );
    else
    {
        self.propanchor _meth_8442( self );
        self.propanchor.owner_not = self.owner_not;
    }
}

nospectatablepropswatch()
{
    level endon( "game_ended" );
    level waittill( "noPropsToSpectate" );

    if ( isdefined( self.spectatekey ) )
        self.spectatekey _meth_808A();
}

propcamerazoom()
{
    self.thirdpersonrange = 120;
    self.actualthirdpersonrange = 120;

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A070( "zoomin", "zoomout" );

        if ( maps\mp\_utility::_id_5092( self.endingpropspecate ) )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( maps\mp\_utility::_id_5092( self.propspectating ) )
            continue;

        if ( var_0 == "zoomin" )
        {
            if ( self.thirdpersonrange <= 60 )
                continue;

            self.thirdpersonrange -= 15;
            self _meth_8582( 1, self.thirdpersonrange );
            continue;
        }

        if ( var_0 == "zoomout" )
        {
            if ( self.thirdpersonrange >= 240 )
                continue;

            self.thirdpersonrange += 15;
            self _meth_8582( 1, self.thirdpersonrange );
        }
    }
}

setnewabilityhud()
{
    switch ( self.currentability )
    {
        case "FLASH":
            self.abilitykey.land = &"MP_PH_FLASH";
            break;
        default:
            break;
    }
}

setnewabilitycount()
{
    self.abilityleft = 1;
}

useability()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( self.abilityleft > 0 )
    {
        switch ( self.currentability )
        {
            case "FLASH":
                flashenemies();
                self.abilityleft--;
                break;
            default:
                break;
        }
    }
}

flashtheprops( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    thread _id_A7B7::_id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_1 );

    if ( !isdefined( var_0 ) )
        return;

    flashenemies( var_0, var_1 );
}

watchthrownflash()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( isdefined( var_0 ) && isdefined( var_1 ) && var_1 == "h1_flashgrenade_mp" )
            var_0 thread flashtheprops( self );
    }
}

flashenemies( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    if ( !isdefined( var_1 ) )
        var_1 = self.owner_not;

    if ( !level.madpropsmode )
    {
        playfx( common_scripts\utility::_id_3FA8( "propFlash" ), var_1 + ( 0, 0, 4 ) );
        playsoundatpos( var_1, "prop_flashbang" );
    }

    foreach ( var_3 in level.players )
    {
        if ( var_3 == var_0 )
            continue;

        if ( maps\mp\_utility::_id_5092( var_3.flashimmune ) )
            continue;

        if ( level.madpropsmode )
        {
            if ( !isdefined( var_3 ) || !isalive( var_3 ) || !isdefined( var_3.team ) || var_3.team != game["defenders"] )
                continue;
        }
        else if ( !isdefined( var_3 ) || !isalive( var_3 ) || !isdefined( var_3.team ) || var_3.team != game["attackers"] )
            continue;

        var_4 = var_1 + ( 0, 0, 4 ) - var_3 _meth_80AA();
        var_5 = length( var_4 );
        var_6 = 500.0;
        var_7 = 150.0;

        if ( var_5 <= var_6 )
        {
            if ( var_5 <= var_7 )
                var_8 = 1;
            else
                var_8 = 1 - ( var_5 - var_7 ) / ( var_6 - var_7 );

            var_9 = vectornormalize( var_4 );
            var_10 = anglestoforward( var_3 _meth_8338() );
            var_11 = vectordot( var_10, var_9 );
            var_3 notify( "flashbang", var_1 + ( 0, 0, 4 ), var_8, var_11, var_0 );
            var_0 thread _id_A78E::_id_9B0C( "standard", var_0 );
        }
    }
}

setupdamage()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    _id_A7A4::_id_A052( 0.5 );
    self.prop._id_258E = ::damagewatch;
}

damagewatch( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( self.owner ) )
        return;

    if ( isplayer( var_1 ) )
    {
        if ( var_1.pers["team"] == self.owner.pers["team"] )
            return;

        var_1 thread _id_A78E::_id_9B0C( "standard", self );
    }

    self.owner _meth_8053( var_2, var_6, var_1, var_0, var_4, var_5, var_8 );
}

propcleanup()
{
    if ( isdefined( self.prop ) )
        self.prop _meth_80B2();

    if ( isdefined( self.propanchor ) )
        self.propanchor _meth_80B2();

    if ( isdefined( self.propent ) )
        self.propent _meth_80B2();
}

propwatchdeath()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self.deathnoise = "prop_death";
    self.propdeathfx = "propDeathFX";
    self waittill( "death" );
    var_0 = self.body;
    playsoundatpos( self.prop.owner_not + ( 0, 0, 4 ), self.deathnoise );
    playfx( common_scripts\utility::_id_3FA8( self.propdeathfx ), self.prop.owner_not + ( 0, 0, 4 ) );

    if ( isdefined( var_0 ) )
        var_0 _meth_80B2();

    propcleanup();
    self _meth_8582( 0, 0 );
}

propwatchdeletedisconnect()
{
    self endon( "death" );
    level endon( "round_end_finished" );
    self waittill( "disconnect" );

    foreach ( var_1 in level.players )
    {
        if ( maps\mp\_utility::_id_5092( var_1.propspectating ) && isdefined( var_1.spectatingthisplayer ) && self == var_1.spectatingthisplayer )
            var_1 notify( "endPropSpectate" );
    }

    propcleanup();
}

propwatchdeleteroundend()
{
    self endon( "death" );
    self endon( "disconnect" );
    level waittill( "round_end_finished" );
    propcleanup();
}

deleteallglass()
{
    level endon( "game_ended" );
    level waittill( "prematch_over" );
    var_0 = _func_30a();

    for ( var_1 = 0; var_1 < var_0; var_1++ )
        deleteglass( var_1 );
}

checkmapofflimits()
{
    if ( maps\mp\_utility::_id_4015() == "mp_citystreets" )
        level thread districtrestrictedarea();
}

districtrestrictedarea()
{
    level endon( "game_ended" );
    var_0 = spawn( "trigger_radius", ( 5648, 68, -1176 ), 0, 150, 900 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( !isalive( var_1 ) )
            continue;

        if ( maps\mp\_utility::_id_5092( var_1.propspectating ) )
        {
            var_1 notify( "endPropSpectate" );
            continue;
        }

        var_1 _meth_8267();
    }
}

populateproplist()
{
    if ( level.madpropsmode )
    {
        addproptolist( "com_cardboardbox06", 100, 0, undefined, undefined );
        addproptolist( "me_banana_box1", 100, 0, undefined, undefined );
        addproptolist( "fs_h1_mwr_com_tv1_cinematic", 100, 0, undefined, undefined );
        addproptolist( "com_computer_case", 100, 0, undefined, undefined );
        addproptolist( "com_trashbag2_white", 100, 0, undefined, undefined );
        addproptolist( "com_trashbag", 100, 0, undefined, undefined );
        addproptolist( "com_propane_tank", 100, 0, undefined, undefined );
        return;
    }

    var_0 = maps\mp\_utility::_id_4015();
    var_1 = "mp/ph_props_" + var_0 + ".csv";
    var_2 = tablegetrowcount( var_1 );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = tablelookupbyrow( var_1, var_3, 0 );
        var_5 = tablelookupbyrow( var_1, var_3, 1 );
        var_6 = tablelookupbyrow( var_1, var_3, 2 );
        var_7 = int( tablelookupbyrow( var_1, var_3, 3 ) );
        var_8 = int( tablelookupbyrow( var_1, var_3, 4 ) );
        var_9 = int( tablelookupbyrow( var_1, var_3, 5 ) );
        var_10 = int( tablelookupbyrow( var_1, var_3, 6 ) );
        var_11 = int( tablelookupbyrow( var_1, var_3, 7 ) );
        var_12 = int( tablelookupbyrow( var_1, var_3, 8 ) );
        var_13 = undefined;

        if ( isdefined( var_7 ) && isdefined( var_8 ) && isdefined( var_9 ) )
            var_13 = ( var_7, var_8, var_9 );

        var_14 = undefined;

        if ( isdefined( var_10 ) && isdefined( var_11 ) && isdefined( var_12 ) )
            var_14 = ( var_10, var_11, var_12 );

        var_15 = 0;

        switch ( var_5 )
        {
            case "xsmall":
                var_15 = 50;
                break;
            case "small":
                var_15 = 100;
                break;
            case "medium":
                var_15 = 200;
                break;
            case "large":
                var_15 = 350;
                break;
            default:
                var_15 = 100;
                break;
        }

        addproptolist( var_4, var_15, var_6, var_13, var_14 );
    }
}

addproptolist( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5.modelname = var_0;
    var_5.propsize = int( var_1 );
    var_5.packid = var_2;

    if ( isdefined( var_3 ) )
        var_5.xyzoffset = var_3;

    if ( isdefined( var_4 ) )
        var_5.anglesoffset = var_4;

    if ( !isdefined( level.proplist ) )
        level.proplist = [];

    level.proplist[level.proplist.size] = var_5;
}

ph_endgame( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_5092( level.endingph ) )
        return;

    level.endingph = 1;
    level._id_374D = var_0;
    thread _id_A793::_id_315F( var_0, var_1 );
    level thread givephteamscore( var_0 );
}

givephteamscore( var_0 )
{
    level endon( "game_ended" );
    var_1 = game["roundsWon"][var_0] + 1;
    setteamscore( var_0, var_1 );
}

setphteamscores()
{
    level endon( "game_ended" );
    var_0 = game["roundsWon"][game["defenders"]];
    var_1 = game["roundsWon"][game["attackers"]];
    setteamscore( game["defenders"], var_0 );
    setteamscore( game["attackers"], var_1 );
}

_id_64C0( var_0 )
{
    if ( maps\mp\_utility::_id_5092( level._id_3BDA ) )
        return;

    if ( var_0 == game["attackers"] )
        return;

    var_1 = undefined;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_0 ) && var_3.team != var_0 )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_3 ) && !var_3 _id_A7B1::_id_5A62() )
            continue;

        if ( isdefined( var_1 ) )
            return;

        var_1 = var_3;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_1 thread _id_41F0();
}

_id_41F0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_A0ED( 3 );
    var_0 = maps\mp\_utility::getOtherTeam( self.pers["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastteammemberalive", self, self.pers["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastenemyalive", self, var_0 );

    if ( self.team == game["defenders"] )
    {
        level notify( "noPropsToSpectate" );
        level.nopropsspectate = 1;
    }

    level notify( "last_alive", self );
}

_id_64F0()
{
    if ( level.madpropsmode )
    {
        ph_endgame( game["attackers"], game["end_reason"]["time_limit_reached"] );
        return;
    }

    var_0 = [];
    var_1 = undefined;
    var_2 = undefined;

    if ( !maps\mp\_utility::_id_5092( level.gameending ) )
    {
        foreach ( var_4 in level.players )
        {
            if ( !isalive( var_4 ) )
                continue;

            if ( var_4.team == game["defenders"] )
            {
                var_0[var_0.size] = var_4;
                continue;
            }

            if ( !isdefined( var_1 ) )
                var_1 = var_4;
        }

        if ( var_0.size > 0 )
            var_2 = common_scripts\utility::_id_710E( var_0 );

        if ( isdefined( var_1 ) && isdefined( var_2 ) )
        {
            if ( maps\mp\_utility::_id_5112( var_2 ) )
                var_6 = var_2 _meth_81B5();
            else
                var_6 = -1;

            var_1._id_2671 = gettime() - 1000;
            maps\mp\gametypes\_damage::_id_7289( 5.0, var_1, var_2, var_6, -1, 0, "none", 0, 0, 0, 0, 0, "none", "normal", 0 );
        }

        ph_endgame( game["defenders"], game["end_reason"]["time_limit_reached"] );
    }
}

ph_checkforovertime()
{
    if ( game["roundsWon"]["allies"] == maps\mp\_utility::_id_415E( "winlimit" ) - 1 && game["roundsWon"]["axis"] == maps\mp\_utility::_id_415E( "winlimit" ) - 1 )
        return 1;

    return 0;
}

givecustomloadout()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "applyLoadout" );
        self _meth_8582( 0, 0 );
        self _meth_811C( 1 );
        self _meth_811B( 1 );

        if ( !maps\mp\_utility::_id_5092( self.hasthrownspecial ) )
            thread watchspecialgrenadethrow();

        thread attackerregenammo();
        thread playertakegrenades();
    }
}

playertakegrenades()
{
    var_0 = self _meth_82CB();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == "h1_concussiongrenade_mp" )
        {
            if ( !maps\mp\_utility::_id_5092( self.hasthrownspecial ) )
                continue;
        }

        self _meth_82F3( var_2, 0 );
    }
}

stillalivexp()
{
    level endon( "game_ended" );
    level._id_A3A5["kill"]["value"] = 300;
    level waittill( "props_hide_over" );

    for (;;)
    {
        _id_A7A4::_id_A052( 10 );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == game["attackers"] )
                continue;

            if ( !maps\mp\_utility::_id_5189( var_1 ) )
                continue;

            level thread _id_A7B4::_id_1208( "still_alive", var_1 );
        }
    }
}

updateprop()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( !isdefined( self.thirdpersonrange ) )
            self.thirdpersonrange = 120;

        self _meth_8582( 1, self.thirdpersonrange );
        self _meth_811C( 0 );
        self _meth_811B( 1 );
        self _meth_8583();
        self _meth_82C7();

        if ( !level.madpropsmode )
            self _meth_8301( 0 );
    }
}

gamemodeModifyPlayerDamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( maps\mp\_utility::_id_5092( self.propspectating ) )
    {
        self notify( "endPropSpectate" );

        if ( var_3 == "MOD_TRIGGER_HURT" )
            return 0;
    }

    if ( maps\mp\_utility::_id_5092( level.propsinvuln ) && isdefined( var_0.team ) && var_0.team == game["defenders"] )
        return 0;

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isalive( var_1 ) )
    {
        if ( level.matchRules_damageMultiplier )
            var_2 *= level.matchRules_damageMultiplier;

        if ( level.matchRules_vampirism )
            var_1.helmet = int( min( float( var_1.maxturnspeed ), float( var_1.helmet + 20 ) ) );
    }

    if ( self.team == game["defenders"] && isdefined( var_3 ) && var_3 == "MOD_FALLING" )
        var_2 = 0;

    return var_2;
}

attackerswaittime()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( self.team == game["defenders"] && !level.madpropsmode )
        return;

    if ( self.team == game["attackers"] && level.madpropsmode )
        return;

    maps\mp\_utility::_id_3BE1( "prematch_done" );

    while ( !isdefined( level._id_8D41 ) )
        wait 0.05;

    while ( isdefined( self._id_219B ) && self._id_219B )
        wait 0.05;

    if ( level.madpropsmode )
        var_0 = level.madpropssettings.madpropshidetime - ( gettime() - level._id_8D41 ) / 1000.0;
    else
        var_0 = level.phsettings.prophidetime - ( gettime() - level._id_8D41 ) / 1000.0;

    if ( var_0 > 0 )
    {
        maps\mp\_utility::_id_3A32( 1 );
        self.phfrozen = 1;
        thread fadetoblackforxsec( var_0 );
        _id_A7A4::_id_A052( var_0 );
    }

    self.phfrozen = undefined;
    level.startcheck = 1;
    maps\mp\_utility::_id_3A32( 0 );
}

fadetoblackforxsec( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( var_0 ) )
        var_0 = 5;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = newclienthudelem( self );
    var_3.foreground = 0;
    var_3.xpmaxmultipliertimeplayed = 0;
    var_3._id_0538 = 0;
    var_3 _meth_80CE( "black", 640, 480 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.hostquits = "fullscreen";
    var_3.visionsetnight = "fullscreen";
    var_3.alpha = 0;
    waittillframeend;
    var_3 _meth_8086( var_1 );
    var_3.alpha = 1;
    _id_A7A4::_id_A052( var_0 - var_2 );
    var_3 _meth_8086( var_2 );
    var_3.alpha = 0;
    _id_A7A4::_id_A052( var_2 );
    waittillframeend;

    if ( isdefined( var_3 ) )
        var_3 _meth_808A();
}

watchspecialgrenadethrow()
{
    self endon( "death" );
    self endon( "disconnect" );
    self _meth_82DA( "specialGrenade", "+smoke" );
    self waittill( "specialGrenade" );
    self.hasthrownspecial = 1;
}

attackerregenammo()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "attackerRegenAmmo" );
    self endon( "attackerRegenAmmo" );
    level endon( "game_ended" );
    var_0 = 0.15;
    self.ammoregen = 1;

    for (;;)
    {
        if ( isalive( self ) )
        {
            var_1 = self _meth_830F();

            if ( var_1 != "none" )
            {
                var_2 = self _meth_82F6( var_1 );
                self _meth_82F4( var_1, var_2 + 1 );
            }

            if ( self.helmet < 100 && self.helmet > 0 )
                self.helmet = 100;
        }

        _id_A7A4::_id_A052( var_0 );
    }
}

hidehudintermission()
{
    level waittill( "game_ended" );
    level.elim_hud.alpha = 0;
    level.phwhistletimer.alpha = 0;
    level.whistling.alpha = 0;

    foreach ( var_1 in level.players )
        var_1 propabilitykeysvisible( 0 );
}

propabilitykeysvisible( var_0 )
{
    if ( maps\mp\_utility::_id_5092( var_0 ) )
        var_1 = 1;
    else
        var_1 = 0;

    if ( isdefined( self.propchangecounter ) )
        self.propchangecounter.alpha = var_1;

    if ( isdefined( self.changepropkey ) )
        self.changepropkey.alpha = var_1;

    if ( isdefined( self.lockpropkey ) )
        self.lockpropkey.alpha = var_1;

    if ( isdefined( self.matchslopekey ) )
        self.matchslopekey.alpha = var_1;

    if ( isdefined( self.abilitykey ) )
        self.abilitykey.alpha = var_1;
}

checkkillrespawn()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A7A4::_id_A052( 0.1 );

    if ( self.pers["lives"] == 1 )
    {
        self.pers["lives"]--;
        level._id_57B9[self.team]--;

        if ( isdefined( self.pklivesleft ) )
            self.pklivesleft _meth_80D9( 0 );

        _id_A793::_id_9B1F();
        level notify( "propCountChanged" );
        return;
    }

    if ( isdefined( self.pklivesleft ) )
        self.pklivesleft _meth_80D9( self.pers["lives"] - 1 );
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self;
    var_11 = 0;
    level notify( "playerCountChanged" );

    if ( level.madpropsmode )
    {
        if ( var_10.team == game["attackers"] && var_1.team == game["defenders"] )
        {
            if ( var_1.pers["lives"] == 1 )
            {
                var_1.pers["lives"]++;
                level._id_57B9[var_1.team]++;
            }
        }
        else if ( var_10.team == game["defenders"] )
            var_10 thread checkkillrespawn();

        return;
    }

    if ( var_10.team == game["attackers"] )
        thread respawnattacker();
    else
        thread _id_A78F::_id_07DE( var_10.body, var_10, var_10.team, 5.0, var_1, 0 );

    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 != var_10 && var_10.team != var_1.team )
        var_11 = 1;

    if ( var_11 )
        var_1 thread _id_A7A6::_id_8A68( "prop_finalblow" );

    foreach ( var_13 in level.players )
    {
        if ( maps\mp\_utility::_id_5092( var_13.propspectating ) && isdefined( var_13.spectatingthisplayer ) && var_10 == var_13.spectatingthisplayer )
            var_13 notify( "endPropSpectate" );

        if ( var_13 != var_1 && var_13.team == game["defenders"] && isalive( var_13 ) && var_10.team == game["defenders"] )
        {
            var_13 thread _id_A7A6::_id_8A68( "prop_survived" );
            continue;
        }

        if ( var_13 != var_1 && var_13.team == game["attackers"] && var_10.team == game["defenders"] )
            var_13 thread _id_A7A6::_id_8A68( "prop_killed" );
    }
}

respawnattacker()
{
    _id_A7B1::_id_4C3C( self.team );
    self._id_0B00 = 1;
    thread _id_A042();
}

_id_A042()
{
    self endon( "started_spawnPlayer" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self ) && ( self.sharpturnlookaheaddist == "spectator" || !maps\mp\_utility::_id_5189( self ) ) )
        {
            self.pers["lives"] = 1;
            _id_A7B1::_id_8998();
            continue;
        }

        return;
    }
}

_id_6466( var_0 )
{
    if ( var_0 == game["attackers"] )
    {
        if ( level.madpropsmode )
            thread ph_endgame( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else
        level thread propkilledend();
}

propkilledend()
{
    if ( maps\mp\_utility::_id_5092( level.hunterswonending ) )
        return;

    if ( maps\mp\_utility::_id_5092( level.gameending ) )
        return;

    level.hunterswonending = 1;
    level.gameending = 1;
    _id_A7A4::_id_A052( 3 );
    thread ph_endgame( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

playdamagesoundph( var_0 )
{
    if ( self.team == game["defenders"] )
        return;

    if ( isdefined( self._id_258B ) && self._id_258B + 5000 > var_0 )
        return;

    self._id_258B = var_0;
    var_1 = randomintrange( 1, 8 );

    if ( self.team == "axis" )
    {
        if ( self _meth_8435() )
            self _meth_809C( "generic_pain_enemy_fm_" + var_1 );
        else
            self _meth_809C( "generic_pain_enemy_" + var_1 );
    }
    else if ( self _meth_8435() )
        self _meth_809C( "generic_pain_friendly_fm_" + var_1 );
    else
        self _meth_809C( "generic_pain_friendly_" + var_1 );
}

playdeathsoundph()
{
    var_0 = randomintrange( 1, 8 );

    if ( self.team == game["attackers"] )
    {
        if ( self _meth_8435() )
            self _meth_809C( "generic_death_enemy_fm_" + var_0 );
        else
            self _meth_809C( "generic_death_enemy_" + var_0 );
    }
}
