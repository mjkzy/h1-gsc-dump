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

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\airlift_anim::main();
    maps\createart\airlift_art::main();
    level thread maps\airlift_fx::main();
    maps\airlift_precache::main();
    maps\_load::main();
    level thread maps\airlift_amb::main();
    maps\airlift_lighting::main();
    position_player();
}

position_player()
{
    var_0 = getent( "player_start_cobraflight", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    level.playercardbackground setplayerangles( var_0.angles );
}

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    setsaveddvar( "sm_sunSampleSizeNear", 1 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    setsaveddvar( "r_specularcolorscale", "1.0" );
    setsaveddvar( "compassMaxRange", 2000 );
    setsaveddvar( "vehicle_pathSmooth", "0" );

    if ( getdvar( "bog_camerashake" ) == "" )
        setdvar( "bog_camerashake", "1" );

    if ( getdvar( "ragdoll_deaths" ) == "" )
        setdvar( "ragdoll_deaths", "1" );

    if ( getdvar( "debug_airlift" ) == "" )
        setdvar( "debug_airlift", "0" );

    initprecache();
    level.allcarsdamagedbyplayer = 1;
    level._id_254D = ::player_attacks_from_seaknight;
    level.mortarwithinfov = undefined;
    level.playermortarfovoffset = ( 0.0, 40.0, 0.0 );
    level.traceheight = 50;
    level.usingstartpoint = 0;
    level.playerhasseenmi17crash = 0;
    level._id_33E7 = [];
    level._id_33E7[0] = level.vasquez;
    level._id_33E7[1] = level.crewchief;
    level._id_33E7[2] = level.smokeleader;
    level.donttankcrush = 0;
    level.crush_car = getent( "crunch_sedan", "targetname" );
    level.grenadetoggle = 0;
    level.turretoverheat = 0;
    level.turret_heat_status = 1;
    level.turret_heat_max = 114;
    level.turret_heat_maxshots = 10;
    level.turret_cooldownrate = 35;
    level.overheat_hud_height_max = 110;
    level.sk_godrays_reverse = 0;
    level.cobras = [];
    level.t72s = [];
    level.playerinseaknight = 0;
    level.zpublastradius = 384;
    level.section = undefined;
    level.onmark19 = 0;
    level._id_6804 = 300;
    level._id_6803 = 1.0;
    level.cannonrange = 5000;
    level.cannonrangesquared = level.cannonrange * level.cannonrange;
    level.crewchiefrange = 256;
    level.crewchiefrangesquared = level.crewchiefrange * level.crewchiefrange;
    level.aideletedistance = 1024;
    level.hitstodestroyt72 = 4;
    level.hitstodestroybmp = 2;
    level.cobratargetexcluders = [];
    level._id_2235 = [];
    level._id_2235["15"] = cos( 15 );
    level._id_2235["20"] = cos( 20 );
    level._id_2235["25"] = cos( 25 );
    level._id_2235["30"] = cos( 30 );
    level._id_2235["35"] = cos( 35 );
    level._id_2235["40"] = cos( 40 );
    level._id_2235["45"] = cos( 45 );
    level._id_2235["55"] = cos( 55 );
    level.vehicles_axis = [];
    level.vehicles_allies = [];
    level.aideletedistance = 512;
    level._id_89CB = ::ai_think;
    level._id_2EFA = ::ai_drone_think;
    level.acolornodetriggers = [];
    level.mig29_near_distance_override = 11880;
    level.friendliesnames_smoketown_ambient = [];
    var_0 = getentarray( "trigger_multiple", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].script_parentname ) && getsubstr( var_0[var_1].script_parentname, 0, 10 ) == "colornodes" )
            level.acolornodetriggers = common_scripts\utility::_id_0CDA( level.acolornodetriggers, var_0[var_1] );
    }

    maps\_utility::_id_079C( "debug", ::start_debug, &"STARTS_DEBUG" );
    maps\_utility::_id_079C( "smoketown", ::start_smoketown, &"STARTS_SMOKETOWN" );
    maps\_utility::_id_079C( "cobraflight", ::start_cobraflight, &"STARTS_COBRAFLIGHT" );
    maps\_utility::_id_079C( "cobrastreets", ::start_cobrastreets, &"STARTS_COBRASTREETS" );
    maps\_utility::_id_079C( "nuke", ::start_nuke, &"STARTS_STARTSCOBRASTREETS" );
    maps\_utility::_id_278B( ::start_default );
    vehicle_scripts\_mig29::setmig29fxoverride( "contrail", "fx/smoke/jet_contrail_airlift" );
    vehicle_scripts\_mig29::setmig29fxoverride( "contrail_02", "fx/smoke/jet_contrail_airlift" );
    common_scripts\utility::_id_0D13( getentarray( "destructible", "targetname" ), ::destructibles_think );
    level.nomaxmortardist = 1;
    maps\_drone_ai::init();
    maps\airlift_precache::main();
    maps\airlift_anim::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_saw_clip";
    level.weaponclipmodels[4] = "weapon_dragunov_clip";
    level.weaponclipmodels[5] = "weapon_g3_clip";
    maps\createart\airlift_art::main();
    level thread maps\airlift_fx::main();
    maps\_load::main();
    maps\_compass::setupminimap( "compass_map_airlift" );
    level thread maps\airlift_amb::main();
    maps\airlift_lighting::main();
    maps\airlift_aud::main();
    thread maps\_mortar::bog_style_mortar();
    maps\_helicopter_globals::_id_4CFA();
    maps\_treadfx::_id_7F1E( "script_vehicle_cobra_helicopter_low", undefined );
    maps\_treadfx::_id_7F1E( "script_vehicle_ch46e", undefined );
    maps\_treadfx::_id_7F1E( "script_vehicle_bmp_woodland_low", undefined );
    maps\_treadfx::_id_7F1E( "script_vehicle_t72_tank_low", undefined );
    common_scripts\utility::_id_383D( "aa_bridge_to_gas_station_section" );
    common_scripts\utility::_id_383D( "aa_gas_station_to_plaza_section" );
    common_scripts\utility::_id_383D( "aa_smoketown_to_construction_section" );
    common_scripts\utility::_id_383D( "aa_construction_to_lz_section" );
    common_scripts\utility::_id_383D( "aa_cobra_rescue_section" );
    common_scripts\utility::_id_383D( "aa_cobra_escape_section" );
    common_scripts\utility::_id_383D( "difficulty_initialized" );
    common_scripts\utility::_id_383D( "seaknight_set_up" );
    common_scripts\utility::_id_383D( "cobra_shoots_at_bridge" );
    common_scripts\utility::_id_383D( "plaza_deploy" );
    common_scripts\utility::_id_383D( "start_tank_crush" );
    common_scripts\utility::_id_383D( "car_getting_crushed" );
    common_scripts\utility::_id_383D( "right_side_seaknight_lift_off" );
    common_scripts\utility::_id_383D( "seaknight_landed_smoketown" );
    common_scripts\utility::_id_383D( "player_exited_seaknight_smoketown" );
    common_scripts\utility::_id_383D( "player_constrction_dialogue_spoken" );
    common_scripts\utility::_id_383D( "at4_sequence_over" );
    common_scripts\utility::_id_383D( "smoketown_mi17_unloaded" );
    common_scripts\utility::_id_383D( "smoketown_mi17_owned" );
    common_scripts\utility::_id_383D( "smoketown_cobra_returns" );
    common_scripts\utility::_id_383D( "seaknight_back_at_smoketown_lz" );
    common_scripts\utility::_id_383D( "smoketown_hardpoint_overrun" );
    common_scripts\utility::_id_383D( "player_at_smoketown_lz" );
    common_scripts\utility::_id_383D( "deactivate_heli_dust" );
    common_scripts\utility::_id_383D( "cobra_rpg_launch" );
    common_scripts\utility::_id_383D( "cobra_hit" );
    common_scripts\utility::_id_383D( "cobra_on_deck" );
    common_scripts\utility::_id_383D( "cobra_crash_dialogue_over" );
    common_scripts\utility::_id_383D( "seaknight_landed_cobrastreets" );
    common_scripts\utility::_id_383D( "player_exited_seaknight_cobrastreets" );
    common_scripts\utility::_id_383D( "pilot_taken_from_cockpit" );
    common_scripts\utility::_id_383D( "player_putting_down_pilot" );
    common_scripts\utility::_id_383D( "pilot_put_down_in_seaknight" );
    common_scripts\utility::_id_383D( "seaknight_leaving_cobrastreets" );
    common_scripts\utility::_id_383D( "cobrastreet_seaknight_loading" );
    common_scripts\utility::_id_383D( "nuke_section_start" );
    common_scripts\utility::_id_383D( "nuke_explodes" );
    common_scripts\utility::_id_383D( "nuke_shockwave_hits" );
    common_scripts\utility::_id_383D( "shockwave_about_to_hit_player" );
    common_scripts\utility::_id_383D( "shockwave_hit_player" );
    common_scripts\utility::_id_383D( "nuke_flattens_trees" );
    common_scripts\utility::_id_383D( "obj_plaza_clear_given" );
    common_scripts\utility::_id_383D( "obj_plaza_clear_complete" );
    common_scripts\utility::_id_383D( "obj_extract_team_given" );
    common_scripts\utility::_id_383D( "obj_extract_team_complete" );
    common_scripts\utility::_id_383D( "obj_extract_to_lz_given" );
    common_scripts\utility::_id_383D( "obj_extract_to_lz_complete" );
    common_scripts\utility::_id_383D( "obj_get_on_mark_19_given" );
    common_scripts\utility::_id_383D( "obj_get_on_mark_19_complete" );
    common_scripts\utility::_id_383D( "obj_rescue_pilot_given" );
    common_scripts\utility::_id_383D( "obj_rescue_pilot_complete" );
    common_scripts\utility::_id_383D( "obj_return_pilot_given" );
    common_scripts\utility::_id_383D( "obj_return_pilot_complete" );
    common_scripts\utility::_id_383D( "mk19_turret_firing_enabled" );
    common_scripts\utility::_id_383F( "mk19_turret_firing_enabled" );
    common_scripts\utility::_id_383D( "reload_turret_start" );
    common_scripts\utility::_id_383D( "pilot_name_reappear" );
    animscripts\init::_id_381E();
    common_scripts\utility::_id_0D13( getentarray( "constructionSpawners", "script_noteworthy" ), maps\_utility::_id_0798, ::ai_construction_spawner_think );
    common_scripts\utility::_id_0D13( getentarray( "fastrope_and_die", "script_noteworthy" ), maps\_utility::_id_0798, ::ai_fastrope_and_die );
    common_scripts\utility::_id_0D13( getentarray( "hostiles_bmp_bridge", "script_noteworthy" ), maps\_utility::_id_0798, ::ai_hostiles_bmp_bridge );
    common_scripts\utility::_id_0D13( getentarray( "low_engage_dist", "script_noteworthy" ), maps\_utility::_id_0798, ::ai_low_engage_dist_think );
    common_scripts\utility::_id_0D13( getentarray( "smoketown_ambient_hostiles", "script_noteworthy" ), maps\_utility::_id_0798, ::smoketown_ambient_hostiles_think );
    common_scripts\utility::_id_0D13( getentarray( "smoketown_ambient_friendlies", "script_noteworthy" ), maps\_utility::_id_0798, ::smoketown_ambient_friendlies_think );
    common_scripts\utility::_id_0D13( getentarray( "allies_plaza_assaulters", "script_noteworthy" ), maps\_utility::_id_0798, ::allies_plaza_assaulters_think );
    common_scripts\utility::_id_0D13( getentarray( "rooftop_tank_01", "targetname" ), ::rooftop_tank_destructible );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "ignored" );
    createthreatbiasgroup( "ambient_axis" );
    createthreatbiasgroup( "ambient_allies" );
    createthreatbiasgroup( "oblivious" );
    level.playercardbackground setthreatbiasgroup( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    setthreatbias( "ambient_allies", "axis", -15000 );
    setthreatbias( "axis", "ambient_allies", -15000 );
    setthreatbias( "ambient_axis", "allies", -15000 );
    setthreatbias( "allies", "ambient_axis", -15000 );
    setthreatbias( "ambient_axis", "ambient_allies", 9999999 );
    setthreatbias( "ambient_allies", "ambient_axis", 9999999 );
    initdifficulty();
    fx_management();
    disable_color_trigs();
    maps\jake_tools::_id_486B();
    thread nuke_trees();
    thread _id_6AC6();
    thread exploder_statue();
    thread falling_crane();
    common_scripts\utility::_id_0D13( getentarray( "badplace_volume", "targetname" ), ::badplace_volume_think );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "plane_sound", "script_noteworthy" ), vehicle_scripts\_mig29::_id_6877 );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "plane_bomb", "script_noteworthy" ), vehicle_scripts\_mig29::_id_686E );
    var_2 = getentarray( "flightFlag", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, ::flight_flags_think );
    var_3 = getentarray( "exploder_trigs_mark19", "targetname" );
    common_scripts\utility::_id_0D13( var_3, ::exploder_trigs_mark19_think );
    var_4 = maps\_vehicle_code::_id_05BE();
    common_scripts\utility::_id_0D13( var_4, ::vehicle_think );
    level thread smoketown_construction_door();
    level thread cobrastreets_ch46entrance_collision();
    level thread smoketown_ch46entrance_collision();
    thread maps\_wibble::setup_wibble_triggers( 1, "player_exit_seaknight_smoketown", "exterior", 1, 0 );
    common_scripts\utility::_id_0D13( getentarray( "Double_rooftop_tank", "script_noteworthy" ), ::double_rooftop_tank_destructible );
    common_scripts\utility::_id_0D13( getentarray( "roofsign1", "targetname" ), ::rooftop_signs_destructible );
    common_scripts\utility::_id_0D13( getentarray( "roofsign2", "targetname" ), ::rooftop_signs_destructible2 );
    common_scripts\utility::_id_0D13( getentarray( "roofsign3", "targetname" ), ::rooftop_signs_destructible3 );
    turn_off_lights( "gamescom_perf", "script_noteworthy" );
    level.hack_at4_muzzle_flash = loadfx( "fx/muzzleflashes/at4_flash_airlift" );
}

_id_2674()
{
    wait 5;
    var_0 = getent( "seaknight_plaza_alt_landing", "targetname" );
    var_1 = maps\_utility::_id_0D08( getentarray( "allies_seaknight_wingman", "targetname" ), 1 );
    common_scripts\utility::_id_0D13( var_1, ::friendlies_plaza_seaknights );
    maps\_utility::_id_27EF( 0, ::vehicle_animated_seaknight_land, var_0, undefined, var_1 );
}

start_default()
{
    soundscripts\_snd::_id_870C( "start_default_checkpoint" );
    aa_intro_init();
}

start_debug()
{
    soundscripts\_snd::_id_870C( "start_default_checkpoint" );
    aa_intro_init();
}

start_plazafly()
{
    thread seaknight_player_think( "plazafly" );
    level thread aa_plaza_init();
}

start_plaza()
{
    thread seaknight_player_think( "plaza" );
    common_scripts\utility::_id_383F( "seaknightInPlazaFly" );
    level thread aa_plaza_init();
}

start_smoketown()
{
    soundscripts\_snd::_id_870C( "start_smoketown_checkpoint" );
    level.usingstartpoint = 1;
    thread seaknight_player_think( "smoketown" );
    common_scripts\utility::_id_383F( "seaknightLeavePlaza" );
    waitframe;
    level thread aa_smoketown_init();
}

start_cobrastreets()
{
    soundscripts\_snd::_id_870C( "start_cobrastreets_checkpoint" );
    thread seaknight_player_think( "cobrastreets" );
    level thread aa_cobrastreets_init();
    thread show_cobra_crash();
}

start_cobraflight()
{
    soundscripts\_snd::_id_870C( "start_cobraflight_checkpoint" );
    thread seaknight_player_think( "cobraflight" );
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    level.seaknight thread maps\airlift_anim::seaknight_open_doors();
    var_0 = getent( "seaknight_land_smoketown2", "script_noteworthy" );
    level.seaknight maps\_utility::_id_9CB3();
    level.seaknight setgoalyaw( var_0.angles[1] );
    level.seaknight maps\_utility::_id_9CF5();
    thread seaknight_player_triggers();
    thread seaknight_player_monitor( 1 );
    waittill_trigger_seaknight_gun();
    seaknight_player_mount_gun( 1 );
    level.seaknight thread maps\airlift_anim::seaknight_close_doors();
    level thread aa_cobraflight_init();
}

start_nuke()
{
    soundscripts\_snd::_id_870C( "start_nuke_checkpoint" );
    level.usingstartpoint = 1;
    thread seaknight_player_think( "nuke" );
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    level.seaknight thread maps\airlift_anim::seaknight_open_doors();
    level.crewchief = maps\jake_tools::spawndude( getent( "seaknight_crewchief_cobrastreets", "targetname" ), 1 );
    level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
    level.crewchief maps\_utility::_id_4462();
    level.crewchief linkto( level.seaknight );
    thread cobrastreets_crewchief_think();
    common_scripts\utility::_id_383F( "pilot_taken_from_cockpit" );
    common_scripts\utility::_id_383F( "obj_rescue_pilot_complete" );
    common_scripts\utility::_id_383F( "obj_return_pilot_complete" );
    common_scripts\utility::_id_383F( "player_cobra_retreat_03" );
    level.playercardbackground.deathinvulnerabletime = 10000;
    level.eplayerview = maps\_utility::_id_88D1( "player_carry" );
    level.eplayerview hide();
    level.playercardbackground disableweapons();
    var_0 = getent( "seaknight_land_cobrastreets", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    level.seaknight maps\_utility::_id_9CB3();
    level.seaknight setgoalyaw( var_0.angles[1] );
    level.seaknight maps\_utility::_id_9CF5();
    thread seaknight_player_triggers();
    level thread aa_nuke_init();
}

aa_intro_init()
{
    level.section = "intro_to_plaza";
    thread h1_airlift_introdepthoffield();
    thread h1_airlift_rumblesystem_intro();
    thread fx_intro();
    thread _id_2A1A();
    thread music_intro();
    thread obj_plaza_clear();
    thread seaknight_player_think( "default" );
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    thread cobra_wingman_think();
    thread intro_flyover();
    common_scripts\utility::_id_384A( "seaknightInPlazaFly" );
    level thread aa_plaza_init();
}

h1_airlift_rumblesystem_intro()
{
    wait 123;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    common_scripts\utility::_id_384A( "plaza_deploy" );
    thread h1_airlift_rumblelogic( "landing", 1 );
    wait 7;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    common_scripts\utility::_id_384A( "right_side_seaknight_lift_off" );
    thread h1_airlift_rumblelogic( "takeoff", 1 );
    wait 1.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    wait 3.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    wait 3.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
}

h1_airlift_rumblesystem_smoketown()
{
    wait 32;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    common_scripts\utility::_id_384A( "seaknight_landed_smoketown" );
    thread h1_airlift_rumblelogic( "landing_smoketown", 1 );
}

h1_airlift_rumblesystem_cobracrash()
{
    thread h1_airlift_rumblelogic( "spinning", 0 );
    wait 4.0;
    thread h1_airlift_rumblelogic( "takeoff", 1 );
    wait 1.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    wait 64.5;
    thread h1_airlift_rumblelogic( "spinning_cobrastreets", 0 );
    wait 2.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    common_scripts\utility::_id_384A( "seaknight_landed_cobrastreets" );
    thread h1_airlift_rumblelogic( "landing_cobrastreets", 1 );
    wait 1.0;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    wait 4.3;
    thread h1_airlift_rumblelogic( "oomph_pilot", 1 );
    common_scripts\utility::_id_384A( "player_putting_down_pilot" );
    wait 3.0;
    thread h1_airlift_rumblelogic( "oomph_pilot", 1 );
    wait 2.2;
    thread h1_airlift_rumblelogic( "oomph_pilot", 1 );
    wait 5.5;
    thread h1_airlift_rumblelogic( "spinning", 0 );
    wait 4.0;
    thread h1_airlift_rumblelogic( "takeoff", 1 );
    wait 1.0;
    thread h1_airlift_rumblelogic( "spinning_cobrastreets", 0 );
    common_scripts\utility::_id_384A( "seaknight_leaving_cobrastreets" );
    thread h1_airlift_rumblelogic( "spinning_cobrastreets", 0 );
}

h1_airlift_introdepthoffield()
{
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 3.0, 1500, 9.0, 9.0 );
    thread h1_airlift_reloadm19();
    wait 110.0;
    level.playercardbackground _meth_84a7( 2.4, 800, 0.1, 0.1 );
    wait 15.0;
    common_scripts\utility::_id_384A( "start_tank_crush" );
    wait 0.7;
    level.playercardbackground _meth_84a7( 1.4, 300, 1.0, 1.0 );
    thread vfx_tank_water_splashes();
    wait 10.5;
    level.playercardbackground _meth_84a7( 2.4, 2000, 0.25, 0.25 );
    wait 8.5;
    wait 12.0;
    level.playercardbackground _meth_84a7( 3.0, 3000, 0.1, 0.1 );
    wait 10.0;
    level.playercardbackground _meth_84a7( 3.0, 1500, 0.1, 0.1 );
}

h1_airlift_reloadm19()
{
    var_0 = 0.05;

    while ( common_scripts\utility::_id_382E( "reload_turret_start" ) != 1 )
    {
        var_1 = level.playercardbackground getplayerangles();
        var_2 = var_1[0];

        if ( var_2 <= -180 )
            var_2 += 360;

        if ( var_2 >= 180 )
            var_2 -= 360;

        if ( var_2 >= 18 )
            level.playercardbackground _meth_84a7( 6.0, 26, 5.0, 4.0 );
        else if ( var_2 <= 12 )
            level.playercardbackground _meth_84a7( 3.0, 1500, 6.0, 5.0 );

        wait(var_0);
    }

    level.playercardbackground thread maps\_utility::_id_69C4( "weap_mark19_reload" );
    wait 0.5;
    setsaveddvar( "r_mbEnable", 2 );
    level.playercardbackground _meth_84a7( 4.0, 21, 8.0, 8.0 );
    wait 0.4;
    level.playercardbackground _meth_84a7( 3.4, 30, 2.3, 2.3 );
    wait 0.65;
    level.playercardbackground _meth_84a7( 3.4, 28, 1.5, 1.5 );
    wait 1.65;
    level.playercardbackground _meth_84a7( 4.0, 19, 2.3, 2.3 );
    wait 0.85;
    level.playercardbackground _meth_84a7( 3.4, 25, 2.5, 2.5 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 4.5, 13, 2.5, 2.5 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 6.0, 37, 2.7, 2.7 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 12.0, 18, 2.5, 2.5 );
    wait 0.85;
    setsaveddvar( "r_mbEnable", 0 );
    level.playercardbackground _meth_84a7( 3.0, 1500, 6.0, 3.0 );
    wait 1.0;
}

h1_airlift_smoketowndepthoffield()
{
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 3.0, 1500, 9.0, 9.0 );
    common_scripts\utility::_id_384A( "seaknightLandingInSmoketown" );
    level.playercardbackground _meth_84a7( 3.0, 250, 0.1, 0.1 );
    common_scripts\utility::_id_384A( "seaknight_landed_smoketown" );
    level.playercardbackground _meth_84a7( 6.0, 500, 0.5, 0.5 );
    wait 2.0;
    level.playercardbackground _meth_84a6();
}

h1_airlift_rumblelogic( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0.0;
    var_4 = "";

    switch ( var_0 )
    {
        case "spinning":
            var_2 = 0.07;
            var_3 = 10;
            break;
        case "spinning_cobrastreets":
            var_2 = 0.09;
            var_3 = 10;
            break;
        case "landing":
            var_2 = 0.15;
            var_3 = 0.8;
            var_4 = "grenade_rumble";
            break;
        case "landing_smoketown":
            var_2 = 0.17;
            var_3 = 2.0;
            var_4 = "grenade_rumble";
            break;
        case "landing_cobrastreets":
            var_2 = 0.2;
            var_3 = 2.0;
            var_4 = "grenade_rumble";
            break;
        case "takeoff":
            var_2 = 0.25;
            var_3 = 1.0;
            var_4 = "damage_light";
            break;
        case "oomph_pilot":
            var_2 = 0.02;
            var_3 = 0.5;
            var_4 = "damage_light";
            break;
    }

    if ( var_2 > 0 )
    {
        earthquake( var_2, var_3, level.playercardbackground.origin, 10000 );

        if ( var_1 )
            level.playercardbackground playrumbleonentity( var_4 );
    }
}

fx_intro()
{
    wait 2;
}

music_intro()
{
    maps\_utility::_id_6008( "airlift_start_music" );
    thread common_scripts\utility::_id_69C2( "airlift_intro_stinger", ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::_id_384A( "plaza_deploy" );
    musicstop( 1 );
    wait 1.1;
    maps\_utility::_id_6008( "airlift_deploy_music" );
}

_id_2A1A()
{
    wait 7;
    maps\_utility::_id_70C4( "airlift_mhp_information" );
    wait 2;
    maps\_utility::_id_70C4( "airlift_fhp_bigtargets" );
    common_scripts\utility::_id_383F( "obj_plaza_clear_given" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.07, 1.0, 7, "intro_chopper_mix", "heli_approaching_city_mix" );
    wait 8.5;
    maps\_utility::_id_70C4( "airlift_hqr_allcallsigns" );
    wait 8;
    maps\_utility::_id_70C4( "airlift_mhp_takingfire" );
    wait 6.5;
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.0, 1.0, 3.7, "heli_approaching_city_mix", "heli_slowing_down_city_mix" );
}

intro_flyover()
{
    level.seaknight_engine_sound_node playloopsound( "veh_airlift_plr_heli_engine_int" );
    maps\_utility::_id_27EF( 10, maps\_vehicle::_id_23DE, 1 );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 4 );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 7 );
    maps\_utility::_id_27EF( 3, maps\_mortar::bog_style_mortar_on, 0 );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 3 );
    maps\_utility::_id_27EF( 13, maps\_vehicle::_id_23DE, 5 );

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\_utility::_id_27EF( 25, maps\_vehicle::_id_23DE, 6 );

    maps\_utility::_id_27EF( 18, maps\_vehicle::_id_23DE, 2 );
    maps\_utility::_id_27EF( 4, maps\_vehicle::_id_23DE, 19 );
    maps\_utility::_id_27EF( 4.5, maps\_vehicle::_id_23DE, 20 );
    maps\_utility::_id_27EF( 4.3, maps\_vehicle::_id_23DE, 21 );
    maps\_utility::_id_27EF( 6, maps\_vehicle::_id_23DE, 22 );
    maps\_utility::_id_27EF( 6.2, maps\_vehicle::_id_23DE, 23 );
    wait 6;
    wait 8.5;

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\jake_tools::_id_9810( "trig_spawn_drones_bridge_side" );

    wait 6;

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\jake_tools::_id_9810( "trig_spawn_drones_bridge" );

    wait 6;

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 16 );

    common_scripts\utility::_id_383F( "aa_bridge_to_gas_station_section" );
    maps\jake_tools::_id_9810( "trig_spawn_zpu_start" );
    wait 3;
    common_scripts\utility::_id_383F( "cobra_shoots_at_bridge" );
    thread maps\_utility::_id_1143( "plaza_bridge" );
    thread maps\_mortar::bog_style_mortar_off( 0 );
    common_scripts\utility::_id_384A( "seaknightBridgeEnd" );
    common_scripts\utility::_id_384A( "seaknightInPlazaFly" );
    thread maps\_utility::_id_1143( "plaza_start" );
    var_0 = getentarray( "hostiles_bmp_bridge", "script_noteworthy" );
    thread maps\_utility::_id_08D6( var_0, level.aideletedistance );
}

ai_hostiles_bmp_bridge()
{
    self endon( "death" );
    maps\jake_tools::_id_7E51( "volume_bridge_01" );
    common_scripts\utility::_id_384A( "seaknightInPlazaFly" );
    maps\jake_tools::_id_7E51( "volume_retreat_bridge" );
    common_scripts\utility::_id_384A( "seaknightInPlaza" );
    self delete();
}

seaknight_wingman_think()
{
    level.ch46wingman = maps\_vehicle::waittill_vehiclespawn( "seaknight_wingman" );
}

cobra_wingman_think()
{
    level.cobrawingman = maps\_vehicle::waittill_vehiclespawn( "wingman" );
    wait 2;
    level.cobrawingman notify( "stop_default_behavior" );
    common_scripts\utility::_id_384A( "cobra_shoots_at_bridge" );
    wait 1;
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "cobra_bridge_tank1" );
    level.cobrawingman maps\_helicopter_globals::_id_37BA( "ffar_airlift_map_overwrite", 2, var_0 );
    wait 1.5;
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "cobra_bridge_tank2" );
    level.cobrawingman maps\_helicopter_globals::_id_37BA( "ffar_airlift_map_overwrite", 2, var_0 );
    wait 2;
    level.cobrawingman thread vehicle_cobra_default_weapons_think();
}

cobra_wingman2_think()
{
    level.cobrawingman2 = maps\_vehicle::waittill_vehiclespawn( "wingman2" );
    common_scripts\utility::_id_384A( "cobra_shoots_at_bridge" );
}

aa_plaza_init()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    thread dialogue_plaza();
    thread plaza_flyover();
    thread cobra_plaza_chase();
    thread tank_crush_plaza();
    thread tank_crush_destructible();
}

allies_plaza_assaulters_think()
{
    self endon( "death" );
}

dialogue_plaza()
{
    wait 1;
    maps\_utility::_id_70C4( "airlift_mhp_rpgrooftops" );
    wait 7.5;
    maps\_utility::_id_70C4( "airlift_mhp_lightarmor" );
    maps\_utility::_id_70C4( "airlift_mhp_groundinfantry" );
    wait 5.5;
    maps\_utility::_id_70C4( "airlift_mhp_wevegotrpgs" );
    wait 4.5;
    maps\_utility::_id_70C4( "airlift_mhp_antiairrooftop" );
    common_scripts\utility::_id_384A( "seaknightInPlazaStreetEnd" );
    wait 4;
    maps\_utility::_id_70C4( "airlift_mhp_hostilesrpgs" );
    common_scripts\utility::_id_384A( "seaknightInPlaza" );
    wait 4;
    maps\_utility::_id_70C4( "airlift_mhp_makingarun" );
    wait 1.5;
    maps\_utility::_id_70C4( "airlift_hqr_getabramsfront" );
    common_scripts\utility::_id_383F( "obj_plaza_clear_complete" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 0.89, 0.9, 9.6, "heli_slowing_down_city_mix", "heli_landing_city_mix" );
    setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
    setsaveddvar( "sm_sunShadowScale", 1 );
    maps\_utility::_id_70C4( "airlift_hqr_2clickswest" );
    common_scripts\utility::_id_384A( "plaza_deploy" );
    thread maps\airlift_aud::aud_cobra_passby_manager( "auto413", "scn_airlift_plaza_cobra_passby", 0 );
    thread maps\airlift_aud::aud_cobra_passby_manager( "auto415", "scn_airlift_smktown_cobra_passby", 0 );
    level.seaknight maps\_utility::_id_69C5( level._id_78BA["airlift_hcc_downramp"], "tag_door_rear" );
    maps\_utility::_id_70C4( "airlift_hqr_enroute" );
    wait 7.5;
    maps\_utility::_id_70C4( "airlift_vsq_forwardrecon" );
    setsaveddvar( "sm_sunSampleSizeNear", 1 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    common_scripts\utility::_id_384A( "seaknightLeavePlaza" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.07, 1.0, 5.0, "heli_taking_off_city_mix", "heli_speed_away_city_mix" );
    wait 2;
    maps\_utility::_id_70C4( "airlift_fhp_refitandrefuel" );
}

car_crush_arcademode()
{
    var_0 = self.origin;
    level waittill( "exploder_1000_detonated" );
    maps\_utility::arcademode_kill( var_0, "explosive", 200 );
}

tank_crush_destructible()
{
    level endon( "start_tank_crush" );
    var_0 = getent( "crunch_sedan", "targetname" );
    var_0 thread car_crush_arcademode();
    level waittill( "exploder_1000_detonated" );

    if ( !common_scripts\utility::_id_382E( "start_tank_crush" ) )
    {
        level.donttankcrush = 1;
        var_1 = spawn( "script_model", var_0.origin );
        var_1.angles = var_0.angles;
        var_1 setmodel( "vehicle_80s_sedan1_tankcrush_destroyed" );
        level.crush_car = var_1;
        var_0 delete();
        level.donttankcrush = 0;
    }
}

plaza_flyover()
{
    common_scripts\utility::_id_384A( "seaknightInPlazaFly" );
    wait 1;
    maps\jake_tools::_id_9810( "trig_spawn_plaza_roof_01" );

    if ( getdvar( "airlift_min_spec" ) != "1" )
    {
        maps\_utility::_id_27EF( 3.6, maps\_vehicle::_id_23DE, 25 );
        maps\_utility::_id_27EF( 3.2, maps\_vehicle::_id_23DE, 26 );
        maps\_utility::_id_27EF( 3.6, maps\_vehicle::_id_23DE, 27 );
        maps\_utility::_id_27EF( 4, maps\_vehicle::_id_23DE, 28 );
        maps\_utility::_id_27EF( 4.2, maps\_vehicle::_id_23DE, 29 );
    }

    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 14 );
    maps\jake_tools::_id_9810( "trig_spawn_zpu_plaza" );
    wait 2;
    maps\jake_tools::_id_9810( "trig_spawn_plaza_main" );
    maps\jake_tools::_id_9810( "trig_spawn_drones_palace_01" );
    maps\_utility::_id_27EF( 14, maps\_vehicle::_id_23DE, 15 );
    common_scripts\utility::_id_384A( "seaknightInPlazaConstruction" );
    maps\jake_tools::_id_9810( "trig_spawn_zpu_plaza_alley" );
    maps\_utility::_id_27EF( 2, maps\_vehicle::_id_23DE, 17 );
    var_0 = getentarray( "hostiles_plaza_fodder_roof", "script_noteworthy" );
    thread maps\_utility::_id_08D6( var_0, level.aideletedistance );
    thread maps\airlift_aud::aud_cobra_passby_manager( "auto415", "scn_airlift_cobra_right_passby", 5.5 );
    thread maps\airlift_aud::aud_cobra_passby_manager( "auto772", "scn_airlift_cobra_overhead_passby", 0 );
    thread bmp_play_stopping_anim();
    common_scripts\utility::_id_384A( "seaknightInPlazaStreetEnd" );
    common_scripts\utility::_id_3831( "aa_bridge_to_gas_station_section" );
    common_scripts\utility::_id_383F( "aa_gas_station_to_plaza_section" );
    thread maps\_utility::_id_1143( "plaza_street_end" );
    var_0 = getentarray( "hostiles_plaza_fodder_palace", "script_noteworthy" );
    thread maps\_utility::_id_08D6( var_0, 512 );
    maps\_utility::_id_27EF( 2.5, maps\_vehicle::_id_23DE, 18 );
    wait 4;
    maps\jake_tools::_id_9810( "trig_spawn_plaza_alley_01" );
    var_0 = getentarray( "hostiles_bmp_alley", "script_noteworthy" );
    thread maps\_utility::_id_08D6( var_0, level.aideletedistance );
    wait 11;
    maps\jake_tools::_id_9810( "trig_spawn_drones_plaza_street_retreat" );
    level.seaknight thread maps\airlift_aud::play_player_heli_land_sfx( getent( "auto807", "targetname" ), "scn_seaknight_land_plaza" );
    level.seaknight thread vehicle_heli_land( getent( "seaknight_land_plaza", "script_noteworthy" ) );
    common_scripts\utility::_id_384A( "seaknightInPlaza" );
    var_0 = getentarray( "hostiles_plaza_fodder", "script_noteworthy" );
    thread maps\_utility::_id_08D6( var_0, 1024 );
    maps\_vehicle::_id_7B3C( 49 );
    wait 0.05;
    var_1 = getentarray( "targets_plaza_end", "script_noteworthy" );

    if ( var_1.size > 0 )
        maps\_utility::_id_27EF( 12, ::vehicle_cobra_spawn_and_kill, "cobra_plaza_end", var_1, 1 );

    var_2 = getent( "seaknight_plaza_alt_landing", "targetname" );
    var_3 = maps\_utility::_id_0D08( getentarray( "allies_seaknight_wingman", "targetname" ), 1 );
    common_scripts\utility::_id_0D13( var_3, ::friendlies_plaza_seaknights );
    maps\_utility::_id_27EF( 0, ::vehicle_animated_seaknight_land, var_2, undefined, var_3 );
    var_2 = getent( "seaknight_plaza_alt_landing2", "targetname" );
    var_4 = maps\_utility::_id_0D08( getentarray( "allies_seaknight_plaza_ch46_2", "targetname" ), 1 );
    common_scripts\utility::_id_0D13( var_4, ::friendlies_plaza_seaknights );
    maps\_utility::_id_27EF( 1, ::vehicle_animated_seaknight_land, var_2, "right_side_seaknight_lift_off", var_4 );
    maps\_utility::_id_27EF( 22, ::disablech46turretfire );
    level.seaknight waittill( "landed" );
    common_scripts\utility::_id_3831( "aa_gas_station_to_plaza_section" );
    thread maps\_utility::_id_1143( "plaza_assault" );
    common_scripts\utility::_id_383F( "plaza_deploy" );
    thread seaknight_door_open_sound();

    if ( level.donttankcrush == 1 )
    {
        while ( level.donttankcrush == 1 )
            wait 0.05;
    }

    common_scripts\utility::_id_383F( "start_tank_crush" );
    wait 10;
    var_5 = getent( "colornodes_plaza", "script_noteworthy" );
    var_5 notify( "trigger", level.playercardbackground );
    maps\jake_tools::_id_9810( "trig_spawn_hostiles_palace_assault" );
    level.seaknight thread maps\_utility::_id_69C4( "scn_seaknight_liftoff_plaza" );
    wait 2;
    common_scripts\utility::_id_383F( "right_side_seaknight_lift_off" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.0, 1.0, 2, "heli_landing_city_mix", "heli_taking_off_city_mix" );
    maps\_utility::_id_27EF( 2, ::enablech46turretfire );
    level.seaknight cleargoalyaw();
    thread seaknight_liftoff_anim();
    level.seaknight maps\_utility::_id_9CFC();
    level.seaknight maps\_utility::_id_9D1F();
    level thread aa_smoketown_init();
}

cobra_plaza_chase()
{
    common_scripts\utility::_id_384A( "seaknightInPlaza" );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 30 );
    common_scripts\utility::_id_384A( "seaknightPlazaLanding" );
    var_0 = getaiarray( "axis" );
    thread maps\_utility::_id_08D6( var_0, 256 );
}

vehicle_cobra_spawn_and_kill( var_0, var_1, var_2 )
{
    var_3 = maps\_vehicle::_id_8978( var_0 );
    thread maps\_vehicle::_id_427A( var_3 );

    if ( isdefined( var_2 ) )
        wait(var_2);

    if ( var_1.size > 0 )
    {
        var_3 notify( "stop_default_behavior" );
        var_3 thread vehicle_mg_on();

        if ( var_1.size > 1 )
            var_1 = common_scripts\utility::_id_3CCB( var_3.origin, var_1, undefined, var_1.size );

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        {
            if ( !isdefined( var_1[var_4] ) || !isalive( var_1[var_4] ) )
                continue;

            var_3 maps\_helicopter_globals::_id_37BA( "ffar_airlift_map_overwrite", 1, var_1[var_4] );
            wait 0.3;
        }
    }
    else
    {

    }
}

vehicle_intro_to_plaza_think()
{
    common_scripts\utility::_id_384A( "seaknightInPlaza" );
}

friendlies_plaza_seaknights()
{
    self endon( "death" );
    self waittill( "unloaded" );
    wait(randomfloatrange( 2, 3 ));
    self notify( "stop_ch46_idle" );
}

tank_crush_plaza()
{
    common_scripts\utility::_id_384A( "start_tank_crush" );
    level.tankcrusher = maps\_vehicle::_id_8978( "tank_crusher" );
    thread maps\_vehicle::_id_427A( level.tankcrusher );
    level.tankcrusher thread maps\_vehicle::_id_5BD3();
    maps\_utility::_id_27EF( 4.5, maps\_vehicle::_id_23DE, 11 );
    maps\_utility::_id_27EF( 8.1, maps\_vehicle::_id_23DE, 12 );
    maps\_utility::_id_27EF( 10.9, maps\_vehicle::_id_23DE, 13 );
    maps\_utility::_id_27EF( 21, maps\_vehicle::_id_23DE, 45 );

    if ( getdvar( "airlift_min_spec" ) != "1" )
    {
        maps\_utility::_id_27EF( 23, maps\_vehicle::_id_23DE, 46 );
        maps\_utility::_id_27EF( 36, maps\_vehicle::_id_23DE, 47 );
        maps\_utility::_id_27EF( 38.8, maps\_vehicle::_id_23DE, 48 );
    }

    var_0 = getvehiclenode( "auto369", "targetname" );
    var_1 = getvehiclenode( "auto373", "targetname" );
    var_0 thread maps\airlift_aud::aud_abrams_passby_manager( "lead" );
    var_1 thread maps\airlift_aud::aud_abrams_passby_manager( "follow" );
    maps\_utility::_id_27EF( 0, ::plaza_building_assault );
    var_2 = getvehiclenode( "sedan_crush_node", "script_noteworthy" );
    var_2 waittill( "trigger" );
    common_scripts\utility::_id_383F( "car_getting_crushed" );
    level.tankcrusher thread maps\_vehicle::_id_5BD2();
    level.tankcrusher vehicle_setspeed( 0, 999999999, 999999999 );
    var_3 = getvehiclenode( "tank_path_2", "targetname" );
    level.tankcrusher maps\_vehicle::tank_crush( level.crush_car, var_3, level._id_78AC["tank"]["tank_crush"], level._id_78AC["sedan"]["tank_crush"], level._id_78B1["tank_crush"], level._id_78BA["tank_crush"] );
    level.tankcrusher resumespeed( 999999999 );
    level.tankcrusher waittill( "reached_end_node" );
    level.tankcrusher delete();
}

plaza_building_assault()
{
    maps\jake_tools::_id_9810( "trig_spawn_allies_plaza_chalk" );
    thread plaza_at4_sequence();
    wait 4;

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\jake_tools::_id_9810( "trig_spawn_drones_plaza_allies" );
}

plaza_at4_sequence()
{
    var_0 = getent( "org_rpg_plaza_01", "targetname" );
    var_1 = maps\jake_tools::spawndude( getent( "plaza_at4_dude", "script_noteworthy" ), 1 );
    var_1 attach( "weapon_AT4", "TAG_STOWED_BACK" );
    var_2 = getnode( "node_at4_guy", "targetname" );
    var_1 maps\jake_tools::_id_7ED8( "ignored" );
    var_1.ignoretriggers = 1;
    var_1.grenadeawareness = 0;
    setignoremegroup( "ignored", "axis" );
    setignoremegroup( "axis", "ignored" );
    wait 8;
    var_2 thread maps\_anim::_id_0C24( var_1, "AT4_fire_short" );
    wait 0.1;
    var_1 detach( "weapon_AT4", "TAG_STOWED_BACK" );
    var_1 attach( "weapon_AT4", "TAG_INHAND" );
    var_1 waittillmatch( "single anim", "fire" );
    var_3 = var_1 gettagorigin( "TAG_INHAND" );
    magicbullet( "rpg_player", var_3, var_0.origin );
    playfxontag( level.hack_at4_muzzle_flash, var_1, "tag_flash" );
    thread plaza_at4_impact();
    var_1 waittillmatch( "single anim", "end" );
    var_4 = var_1 gettagorigin( "TAG_INHAND" );
    var_5 = var_1 gettagangles( "TAG_INHAND" );
    var_1 detach( "weapon_AT4", "TAG_INHAND" );
    var_6 = spawn( "script_model", var_4 );
    var_6 setmodel( "weapon_at4" );
    var_6.angles = var_5;
    var_2 thread maps\_anim::_id_0BE1( var_1, "AT4_idle", undefined, "stop_idle" );
    wait 1;
    var_2 notify( "stop_idle" );
    var_7 = getnode( "node_at4_guy_next", "targetname" );
    var_1 _meth_81a9( var_7 );

    if ( isdefined( var_1._id_58D7 ) )
        var_1 maps\_utility::_id_8EA4();

    common_scripts\utility::_id_384A( "seaknightLeavePlaza" );

    if ( isdefined( var_1 ) )
    {
        var_1 delete();
        var_6 delete();
    }
}

plaza_at4_impact()
{
    wait 2;
    var_0 = getent( "org_rpg_plaza_01", "targetname" );
    thread common_scripts\utility::_id_69C2( "building_explosion3", var_0.origin );
    common_scripts\_exploder::_id_3528( 1 );
}

double_rooftop_tank_destructible()
{
    self endon( "tankdestroyed" );
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1 );
    self setmodel( "h1_me_rooftop_tank_destroyed" );
    var_2 = getent( self._not_team, "targetname" );
    var_2 setmodel( "h1_me_rooftop_tank_destroyed" );
    var_3 = ( self.origin + var_2.origin ) / 2;
    playfx( level._effect["dual_propane_tank_explosion_airlift"], var_3 );
    thread maps\_utility::_id_69C4( "airlift_oil_tank_explo" );
    wait 0.2;
    var_2 thread maps\_utility::_id_69C4( "airlift_oil_tank_explo" );
    var_2 notify( "tankdestroyed" );
}

setasdestructible( var_0, var_1, var_2 )
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_3, var_4, var_5, var_6, var_7 );

        if ( var_7 == "MOD_PROJECTILE" )
        {
            self setmodel( var_0 );
            var_8 = self.origin;
            playfx( level._effect[var_1], var_8 );

            if ( isdefined( var_2 ) )
                thread maps\_utility::_id_69C4( var_2 );

            return;
        }
    }
}

rooftop_tank_destructible()
{
    setasdestructible( "h1_me_rooftop_tank_destroyed", "propane_tank_explosion_airlift", "airlift_oil_tank_explo" );
}

rooftop_signs_destructible()
{
    setasdestructible( "h1_me_roof_sign_02_destroyed", "airlift_sign_explosion" );
    wait 2.0;
    setasdestructible( "h1_me_roof_sign_02_destroyed2", "airlift_sign_explosion" );
}

rooftop_signs_destructible2()
{
    setasdestructible( "h1_me_roof_sign_02_destroyed_var2", "airlift_sign_explosion" );
    wait 2.0;
    setasdestructible( "h1_me_roof_sign_02_destroyed2", "airlift_sign_explosion" );
}

rooftop_signs_destructible3()
{
    setasdestructible( "h1_me_roof_sign_02_destroyed_nosign", "airlift_sign_explosion" );
    wait 2.0;
    setasdestructible( "h1_me_roof_sign_02_destroyed2", "airlift_sign_explosion" );
}

water_tower_destructible()
{
    setasdestructible( "com_water_tower_tank_destroyed", "FXhere" );
}

water_tower_base_destructible()
{
    setasdestructible( "com_water_tower_base_destroyed", "FXhere" );
}

aa_smoketown_init()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    thread dialogue_smoketown();
    thread music_smoketown();
    thread obj_extract_team();
    thread obj_extract_to_lz();
    thread obj_get_on_mark_19();
    thread smoketown_flyover();
    thread smoketown_land();
    thread smoketown_mortars();
    thread smoketown_enemy_heli();
    thread junkyard_assault();
    thread smoketown_upstairs();
    thread smoketown_lz_advance();
    thread lz_spawners();
    thread seaknight_smoketown_think();
    thread green_smoke();
    thread smoketown_lz_door();
    thread smoketown_cobra_think();
    thread h1_airlift_smoketowndepthoffield();
    thread h1_airlift_rumblesystem_smoketown();
    thread smoketown_deactivate_heli_dust();
}

dialogue_smoketown()
{
    common_scripts\utility::_id_384A( "seaknightLeavePlaza" );

    if ( !level.usingstartpoint )
    {
        wait 12.5;
        maps\_utility::_id_70C4( "airlift_hqr_bluesmoke" );
        wait 1.7;
        maps\_utility::_id_70C4( "airlift_mhp_havevisual" );
    }

    common_scripts\utility::_id_384A( "seaknight_landed_smoketown" );
    maps\_utility::_id_1332( "allies" );
    setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
    setsaveddvar( "sm_sunShadowScale", 1 );
    wait 1.5;
    maps\_utility::_id_70C4( "airlift_vsq_watchcoloredsmoke" );
    wait 3;
    var_0 = maps\jake_tools::_id_3CF2();
    var_0 maps\jake_tools::_id_2A05( "airlift_gm1_firebalcony" );
    common_scripts\utility::_id_384A( "player_exited_seaknight_smoketown" );
    maps\_utility::_id_70C4( "airlift_mhp_lztoohot" );
    maps\_utility::_id_1333( "allies" );
    common_scripts\utility::_id_384A( "player_constrction_approach" );
    maps\_utility::_id_1332( "allies" );
    maps\_utility::_id_70C4( "airlift_vsq_greensmoke" );
    common_scripts\utility::_id_383F( "player_constrction_dialogue_spoken" );
    maps\_utility::_id_1333( "allies" );
    common_scripts\utility::_id_384A( "player_middle_construction" );
    maps\_utility::_id_1332( "allies" );
    thread maps\_utility::_id_70C4( "airlift_gm1_holdyourfire" );
    common_scripts\utility::_id_384A( "player_in_upper_construction_stairs" );
    level.smokeleader maps\jake_tools::_id_2A05( "airlift_gm2_firebalcony" );
    common_scripts\utility::_id_384A( "obj_extract_team_complete" );
    level.smokeleader maps\jake_tools::_id_2A05( "airlift_gm4_reinforcements" );
    level.vasquez thread maps\jake_tools::_id_2A05( "airlift_vsq_wereit" );
    common_scripts\utility::_id_383F( "smoketown_mi17_owned" );
    wait 2;
    common_scripts\utility::_id_383F( "obj_extract_to_lz_given" );
    common_scripts\utility::_id_384A( "smoketown_cobra_returns" );
    wait 1.5;
    maps\_utility::_id_70C4( "airlift_fhp_missme" );
    maps\_utility::_id_1333( "allies" );

    if ( level.playerhasseenmi17crash )
    {
        var_0 = maps\jake_tools::_id_3CF2();
        var_0 maps\jake_tools::_id_2A05( "airlift_gm3_hellyeah" );
    }

    wait 3;
    level.vasquez maps\jake_tools::_id_2A05( "airlift_vsq_letsgo" );
    common_scripts\utility::_id_384A( "smoketown_hardpoint_overrun" );
    wait 1;
    maps\_utility::_id_70C4( "airlift_vsq_gettolz2" );
    maps\jake_tools::_id_9823( "smoketown_lz_return" );
    level.crewchief notify( "player_returning_to_seaknight" );
    maps\_utility::_id_70C4( "airlift_vsq_gogo" );
    common_scripts\utility::_id_384A( "player_at_smoketown_lz" );
    level.crewchief maps\jake_tools::_id_2A05( "airlift_hcc_backonmark19" );
}

music_smoketown()
{
    common_scripts\utility::_id_384A( "smoketown_hardpoint_overrun" );
    wait 5;
    maps\_utility::_id_6008( "airlift_deploy_music" );
}

smoketown_ambient_friendlies_think()
{
    self endon( "death" );
    maps\jake_tools::_id_7ED8( "ambient_allies" );
    level.friendliesnames_smoketown_ambient = common_scripts\utility::_id_0CDA( level.friendliesnames_smoketown_ambient, self.nearz );
    thread smoketown_ambient_think();
}

smoketown_ambient_hostiles_think()
{
    self endon( "death" );
    maps\jake_tools::_id_7ED8( "ambient_axis" );
    thread smoketown_ambient_think();
}

smoketown_ambient_think()
{
    self endon( "death" );
    maps\jake_tools::_id_4FA8( 1 );
    common_scripts\utility::_id_384A( "player_stairs_construction" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

smoketown_lz_door()
{
    var_0 = getent( "door_smoketown_lz", "targetname" );
    common_scripts\utility::_id_384A( "player_smoketown_junkyard" );
    var_0 hide();
    var_0 notsolid();
    var_0 connectpaths();
}

smoketown_construction_door()
{
    var_0 = getent( "door_construction", "targetname" );
    var_0 hide();
    var_0 notsolid();
    var_0 connectpaths();
    common_scripts\utility::_id_384A( "player_in_upper_construction_stairs" );
    var_0 show();
    var_0 solid();
    var_0 disconnectpaths();
}

green_smoke()
{
    common_scripts\utility::_id_384A( "seaknightLeavePlaza" );
    wait 3;
    common_scripts\_exploder::_id_3528( 173 );
    common_scripts\utility::_id_384A( "cobra_hit" );
    maps\_utility::_id_8E7E( 173 );
}

smoketown_flyover()
{
    common_scripts\utility::_id_384A( "seaknightLeavePlaza" );
    common_scripts\utility::_id_0D13( level.fxsmoketown, maps\_utility::_id_748D );

    if ( level.usingstartpoint )
        return;

    maps\_utility::_id_27EF( 10, maps\_vehicle::_id_23DE, 24 );
    common_scripts\utility::_id_384A( "seaknightSmokeTownApproach" );
    var_0 = getaiarray();
    thread maps\_utility::_id_08D6( var_0, level.aideletedistance );
    maps\jake_tools::_id_9810( "trig_spawn_smoketown_roof_01" );
    wait 3;
    maps\jake_tools::_id_9810( "trig_spawn_smoketown_street_01" );
    maps\jake_tools::_id_9810( "trig_spawn_smoketown_street_02" );
}

smoketown_land()
{
    level.seaknight thread maps\airlift_aud::play_player_heli_land_sfx( getent( "flightPathstart_smoketown", "targetname" ), "scn_seaknight_land_smoketown" );
    common_scripts\utility::_id_384A( "seaknightLandingInSmoketown" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 0.89, 0.9, 3.2, "heli_speed_away_city_mix", "heli_landing_field_mix" );
    thread animate_smoketown_crane();
    level._id_78BA["mortar"]["incomming"] = "mortar_incoming";
    level.seaknight thread vehicle_heli_land( getent( "seaknight_land_smoketown", "script_noteworthy" ) );
    maps\_utility::_id_27EF( 8, ::disablech46turretfire );
    var_0 = getentarray( "pilots_smoketown", "targetname" );
    spawn_pilots( var_0 );
    var_1 = maps\_utility::_id_0D08( getentarray( "seaknight_unloaders_smoketown", "targetname" ), 1 );
    level.vasquez = maps\jake_tools::_id_3F71( var_1, "vasquez" );
    level.crewchief = maps\jake_tools::spawndude( getent( "seaknight_crewchief_smoketown", "targetname" ), 1 );
    level.seaknight thread vehicle_seaknight_unload( var_1, level.crewchief, "smoketown" );
    level.seaknight waittill( "landed" );
    setexpfog( 0, 7339.38, 0.564865, 0.460619, 0.322549, 1, 0, 3 );
    common_scripts\utility::_id_383F( "seaknight_landed_smoketown" );
    common_scripts\utility::_id_383F( "aa_smoketown_to_construction_section" );
    level.friendliesnames_ch46 = [];

    foreach ( var_3 in var_1 )
    {
        var_3 _meth_8565( 1 );

        if ( var_3.nearz != "Lt. Vasquez" )
            level.friendliesnames_ch46 = common_scripts\utility::_id_0CDA( level.friendliesnames_ch46, var_3.nearz );
    }

    thread maps\_utility::_id_1143( "smoketown_start" );
    common_scripts\utility::_id_383F( "obj_extract_team_given" );
    wait 1;
    level.seaknight notify( "unload_ai" );
    common_scripts\_exploder::_id_3528( 888 );
    thread seaknight_player_dismount_gun();
    soundscripts\_snd::_id_870C( "set_context_int_for_seaknight" );
    var_5 = getaiarray( "axis" );
    thread maps\_utility::_id_08D6( var_5, 256 );
    level.seaknight waittill( "all_ai_unloaded" );

    while ( level.playerinseaknight == 1 )
        wait 0.05;

    common_scripts\utility::_id_383F( "player_exited_seaknight_smoketown" );

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
        var_1[var_6] _meth_81ce( "crouch", "stand", "prone" );

    maps\jake_tools::_id_981B( "colornodes_smoketown_start", "script_noteworthy", 1 );
    common_scripts\utility::_id_384A( "player_constrction_approach" );

    foreach ( var_3 in var_1 )
        var_3 _meth_8565( 0 );

    soundscripts\_snd::_id_870C( "aud_add_smoketown_operation_mix" );
    common_scripts\utility::_id_384A( "player_constrction_dialogue_spoken" );

    if ( getdvar( "airlift_min_spec" ) != "1" )
        maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 41 );

    common_scripts\utility::_id_384A( "player_middle_construction" );
    level.vasquez maps\_utility::_id_2A74();
    var_9 = getnode( "vasquez_construction", "targetname" );
    level.vasquez _meth_81a9( var_9 );
    common_scripts\utility::_id_384A( "player_stairs_construction" );
    var_5 = getaiarray( "axis" );
    thread maps\_utility::_id_08D6( var_5, 256 );
    level.smokefriendlies = maps\_utility::_id_0D08( getentarray( "smoke_friendlies", "targetname" ), 1 );
    level.smokeleader = maps\jake_tools::_id_3F71( level.smokefriendlies, "smokeleader" );
    var_10 = "Cpt. ";
    var_11 = strtok( level.smokeleader.nearz, " " );
    level.smokeleader.nearz = var_10 + var_11[1];
    level.smokeat4dude = maps\jake_tools::_id_3F71( level.smokefriendlies, "smoketown_at4_dude" );
    var_12 = maps\jake_tools::_id_3F71( level.smokefriendlies, "stair_friendly" );
    var_12 thread stair_friendly_think();

    if ( isdefined( level.friendliesnames_smoketown_ambient ) )
    {
        var_6 = 0;

        foreach ( var_14 in level.friendliesnames_smoketown_ambient )
        {
            if ( level.smokefriendlies[var_6].script_parentname == "smokeleader" )
                var_6++;

            level.smokefriendlies[var_6].nearz = var_14;
            var_6++;
        }
    }

    level.friendliesnames_smoketown = [];
    level.smokefriendlies = common_scripts\utility::_id_0CF6( level.smokefriendlies, level.smokeat4dude );

    foreach ( var_3 in level.smokefriendlies )
        level.friendliesnames_smoketown = common_scripts\utility::_id_0CDA( level.friendliesnames_smoketown, var_3.nearz );

    var_18 = getent( "smoketown_at4_hostile", "script_noteworthy" );
    var_19 = maps\jake_tools::spawndude( var_18, "stalingrad" );
    var_19 maps\jake_tools::_id_4FA8( 1 );
    var_20 = getent( "smoketown_rpg_target", "targetname" );
    level.smokeat4dude maps\jake_tools::_id_7ED8( "ignored" );
    setignoremegroup( "ignored", "axis" );
    setignoremegroup( "axis", "ignored" );
    var_9 = getnode( "node_construction_rpg", "targetname" );
    level.smokeat4dude.ignoretriggers = 1;
    level.smokeat4dude.grenadeawareness = 0;
    var_9 maps\_anim::_id_0BFF( level.smokeat4dude, "AT4_fire_short_start" );
    level.smokeat4dude attach( "weapon_AT4", "TAG_INHAND" );
    var_9 thread maps\_anim::_id_0BC7( level.smokeat4dude, "AT4_fire_short" );
    common_scripts\utility::_id_384A( "player_in_upper_construction_stairs" );
    thread maps\_utility::_id_1143( "smoketown_construction" );
    var_9 thread maps\_anim::_id_0C24( level.smokeat4dude, "AT4_fire_short" );
    level.smokeat4dude thread at4_detach();
    level.smokeat4dude waittillmatch( "single anim", "fire" );
    var_21 = level.smokeat4dude gettagorigin( "TAG_INHAND" );
    var_22 = missile_createattractorent( var_20, 100000, 60000 );
    magicbullet( "rpg_player", var_21, var_20.origin );
    playfxontag( level.hack_at4_muzzle_flash, level.smokeat4dude, "tag_flash" );
    thread smoketown_at4_impact( var_19, var_22 );
    level.smokeat4dude waittillmatch( "single anim", "end" );
    level.smokeat4dude thread maps\_anim::_id_0BE1( level.smokeat4dude, "AT4_idle_short", undefined, "stop_idle" );
    common_scripts\utility::_id_383F( "at4_sequence_over" );
    common_scripts\utility::_id_384A( "player_smoketown_junkyard" );
    level.vasquez maps\_utility::_id_309A();
}

stair_friendly_think()
{
    self endon( "death" );
    self setthreatbiasgroup( "oblivious" );
    maps\_utility::_id_2A74();
    common_scripts\utility::_id_384A( "at4_sequence_over" );
    self setthreatbiasgroup( "allies" );
    maps\_utility::_id_309A();
}

at4_detach()
{
    self endon( "death" );
    self waittillmatch( "single anim", "end" );
    var_0 = self gettagorigin( "TAG_INHAND" );
    var_1 = self gettagangles( "TAG_INHAND" );
    self detach( "weapon_AT4", "TAG_INHAND" );
    var_2 = spawn( "script_model", var_0 );
    var_2 setmodel( "weapon_at4" );
    var_2.angles = var_1;
    var_2 _meth_8477( ( -743.0, -3615.0, 148.0 ) );
    common_scripts\utility::_id_384A( "at4_sequence_over" );
    common_scripts\utility::_id_384A( "player_smoketown_junkyard" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

lz_spawners()
{
    var_0 = getent( "spawn_trig_lz", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_384A( "player_smoketown_junkyard_hardpoint" );
    var_0 common_scripts\utility::_id_97CE();
}

junkyard_assault()
{
    common_scripts\utility::_id_384A( "at4_sequence_over" );
    common_scripts\utility::_id_383F( "obj_extract_team_complete" );
    common_scripts\utility::_id_3831( "aa_smoketown_to_construction_section" );
    common_scripts\utility::_id_383F( "aa_construction_to_lz_section" );
    maps\jake_tools::_id_981B( "colornodes_smoketown_end_initial", "script_noteworthy", 1 );
    maps\jake_tools::_id_981B( "colornodes_smoketown_end", "script_noteworthy", 1 );
    var_0 = getent( "colornodes_smoketown_end_initial", "script_noteworthy" );
    var_0 notify( "trigger", level.playercardbackground );
    common_scripts\utility::_id_384A( "player_smoketown_junkyard_hardpoint" );
    var_1 = getent( "killspawner_smoketown_house", "targetname" );
    var_1 notify( "trigger", level.playercardbackground );
    var_2 = getaiarray( "axis" );
    var_3 = getent( "volume_construction_yard_rear", "targetname" );
    var_4 = getent( "volume_construction_house_top_floor", "targetname" );
    var_5 = getent( "volume_construction_house_bottom_floor", "targetname" );

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        if ( var_2[var_6] istouching( var_4 ) )
        {
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_2[var_6] );
            continue;
        }

        if ( var_2[var_6] istouching( var_4 ) )
        {
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_2[var_6] );
            continue;
        }

        if ( var_2[var_6] istouching( var_5 ) )
        {
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_2[var_6] );
            continue;
        }
    }

    thread maps\_utility::_id_08D6( var_2, 512 );
    common_scripts\utility::_id_3856( "player_going_to_lz", 3 );
    var_7 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_7, ::ai_player_seek );
    common_scripts\utility::_id_383F( "smoketown_hardpoint_overrun" );
    common_scripts\utility::_id_3831( "aa_construction_to_lz_section" );
    thread maps\_utility::_id_1143( "smoketown_hardpoint_overrun" );
}

smoketown_upstairs()
{
    common_scripts\utility::_id_384A( "player_upstairs_smoketown" );
    setthreatbias( "player", "axis", 15000 );
}

smoketown_lz_advance()
{
    common_scripts\utility::_id_384A( "smoketown_hardpoint_overrun" );
    maps\_utility::playerwatch_register_crusher( level.seaknight );
    disable_color_trigs();
    maps\jake_tools::_id_981B( "colornodes_smoketown_lz_initial", "script_noteworthy", 1 );
    var_0 = getent( "colornodes_smoketown_lz_initial", "script_noteworthy" );
    var_0 notify( "trigger", level.playercardbackground );
    maps\jake_tools::_id_981B( "colornodes_smoketown_lz", "script_noteworthy", 1 );
    common_scripts\utility::_id_384A( "player_smoketown_lz_alley" );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 42 );
    thread seaknight_player_triggers();
    thread seaknight_player_monitor( 1 );
    common_scripts\utility::_id_383F( "obj_extract_to_lz_complete" );
    thread maps\_utility::_id_1143( "obj_extract_to_lz_complete" );
    common_scripts\utility::_id_383F( "player_at_smoketown_lz" );
    common_scripts\utility::_id_384A( "seaknight_back_at_smoketown_lz" );
    level.trigger_seaknight_gun common_scripts\utility::_id_97CE();
    maps\_utility::playerwatch_unregister_crusher( level.seaknight );
    common_scripts\utility::_id_383F( "obj_get_on_mark_19_given" );
    waittill_trigger_seaknight_gun();
    common_scripts\utility::_id_383F( "obj_get_on_mark_19_complete" );
    maps\_utility::_id_27EF( 0.5, ::disablech46turretfire );
    maps\_utility::_id_6720( 888 );
    seaknight_player_mount_gun( 1 );
    turn_off_lights( "gamescom_perf", "script_noteworthy" );
    maps\_utility::_id_27EF( 5, ::enablech46turretfire );
    setexpfog( 400, 6500, 0.678431, 0.529574, 0.372549, 1, 0, 3 );
    maps\airlift_lighting::apply_lighting_pass_airlift( "airlift_cobra" );
    soundscripts\_snd::_id_870C( "set_context_ext_for_seaknight" );
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2] ) )
            continue;

        if ( !isalive( var_1[var_2] ) )
            continue;

        if ( isdefined( var_1[var_2]._id_58D7 ) )
            var_1[var_2] maps\_utility::_id_8EA4();

        var_1[var_2] delete();
    }

    level thread aa_cobraflight_init();
}

smoketown_mortars()
{
    common_scripts\utility::_id_384A( "seaknightLandingInSmoketown" );
    thread maps\_mortar::bog_style_mortar_on( 1 );
    common_scripts\utility::_id_384A( "player_constrction_approach" );
    thread maps\_mortar::bog_style_mortar_off( 1 );
    thread vehicles_delete_all( "cobras" );
}

smoketown_enemy_heli()
{
    common_scripts\utility::_id_384A( "player_in_upper_construction_stairs" );
    var_0 = maps\_vehicle::_id_8978( "smoketown_heli_2" );
    var_1 = getent( "heli_crash_smoketown_2", "script_noteworthy" );
    var_0._id_67CA = var_1;
    thread maps\_vehicle::_id_427A( var_0 );
    level.smoketownmi17 = maps\_vehicle::_id_8978( "smoketown_heli_1" );
    var_2 = getent( "heli_crash_smoketown_1", "script_noteworthy" );
    level.smoketownmi17._id_67CA = var_2;
    thread maps\_vehicle::_id_427A( level.smoketownmi17 );
    level.smoketownmi17 waittill( "deathspin" );
    wait 7;
    level.smoketownmi17 notify( "goal" );
    level.smoketownmi17 notify( "near_goal" );
    level.smoketownmi17 notify( "stop_crash_loop_sound" );
    level.smoketownmi17 notify( "crash_done" );
    common_scripts\_exploder::_id_3528( "enemy_heli_crash_explosion" );
}

smoketown_cobra_think()
{
    common_scripts\utility::_id_384A( "player_in_upper_construction_stairs" );
    var_0 = maps\_vehicle::_id_8978( "cobra_wingman_smoketown" );
    var_0 notify( "stop_default_behavior" );
    common_scripts\utility::_id_384A( "smoketown_mi17_owned" );
    thread maps\_vehicle::_id_427A( var_0 );
    var_0 thread vehicle_cobra_default_weapons_think();
    wait 0.25;

    if ( isdefined( level.smoketownmi17 ) )
        self._id_6EF5 = level.smoketownmi17;

    level.smoketownmi17 thread smoketown_heli_destroy_failsafe();
    wait 2.6;
    common_scripts\utility::_id_383F( "smoketown_cobra_returns" );
    common_scripts\utility::_id_384A( "player_smoketown_junkyard_hardpoint" );
    var_1 = getent( "cobra_smoketown_delete_path", "targetname" );
    var_0 vehicle_heli_deletepath( var_1 );
}

smoketown_heli_destroy_failsafe()
{
    var_0 = level.smoketownmi17.origin;
    wait 4;

    if ( !isdefined( level.smoketownmi17._id_235D ) )
        self notify( "death" );

    var_1 = level.playercardbackground geteye();
    var_2 = common_scripts\utility::_id_A347( var_1, level.playercardbackground getplayerangles(), var_0, level._id_2235["25"] );

    if ( var_2 )
        level.playerhasseenmi17crash = 1;
}

smoketown_deactivate_heli_dust()
{
    level endon( "obj_get_on_mark_19_complete" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "deactivate_heli_dust" );
        maps\_treadfx::_id_7F1E( "script_vehicle_mi17_woodland_fly_cheap", undefined );
        maps\_treadfx::_id_7F1E( "script_vehicle_cobra_helicopter_low", undefined );
        common_scripts\utility::_id_3857( "deactivate_heli_dust" );
        maps\_treadfx::_id_7F1E( "script_vehicle_mi17_woodland_fly_cheap", "fx/treadfx/heli_dust_default" );
        maps\_treadfx::_id_7F1E( "script_vehicle_cobra_helicopter_low", "fx/treadfx/heli_dust_default" );
    }
}

seaknight_smoketown_think()
{
    common_scripts\utility::_id_384A( "smoketown_seaknight_leaves" );
    level.seaknight thread maps\_utility::_id_69C4( "scn_seaknight_liftoff_smoketown" );
    level.seaknight thread maps\airlift_anim::seaknight_close_doors();
    level notify( "stop_seaknight_player_monitor" );
    wait 1.0;
    soundscripts\_snd::_id_870C( "aud_seaknight_leaves_smoketown" );
    level.seaknight maps\_utility::_id_9CFC();
    level.seaknight maps\_utility::_id_9D1F();
    common_scripts\utility::_id_384A( "player_smoketown_junkyard_hardpoint" );
    var_0 = getent( "smoketown_seaknight_return", "script_noteworthy" );
    level.seaknight maps\_utility::_id_9CB3();
    level.seaknight thread maps\_utility::_id_9CBF( var_0, 0 );
    level.seaknight thread maps\airlift_anim::seaknight_open_doors();
    level.seaknight thread maps\airlift_aud::play_player_heli_land_sfx( getent( "auto978", "targetname" ), "scn_seaknight_land_smoketown2" );
    level.seaknight thread vehicle_heli_land( getent( "seaknight_land_smoketown2", "script_noteworthy" ) );
    var_1 = getent( "volume_smoketown_lz_badplace", "targetname" );
    badplace_brush( "volume_smoketown_lz_badplace", 0, var_1, "allies", "axis" );
    level.seaknight waittill( "landed" );
    thread seaknight_player_triggers();
    thread seaknight_player_monitor( 1 );
    common_scripts\utility::_id_383F( "seaknight_back_at_smoketown_lz" );
    badplace_delete( "volume_smoketown_lz_badplace" );
}

smoketown_at4_impact( var_0, var_1 )
{
    wait 1.1;
    var_0 maps\jake_tools::_id_4FA8( 0 );
    var_0._id_85BA = 1;
    var_0 dodamage( var_0.helmet + 1000, var_0.origin );
    missile_deleteattractor( var_1 );
    var_2 = getent( "smoketown_physics_explosion", "targetname" );
    thread common_scripts\utility::_id_69C2( "building_explosion3", var_2.origin );
    common_scripts\_exploder::_id_3528( 2 );
    wait 0.1;
    physicsexplosionsphere( var_2.origin, level._id_6804, level._id_6804 / 2, level._id_6803 );
}

aa_cobraflight_init()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    thread cobra_flyover();
    thread cobra_missile();
    thread cobra_rpgs();
    thread dialogue_cobraflight();
    thread cobra_crash();
    thread music_cobraflight();
    thread h1_depthoffield_cobraflight();
    thread h1_airlift_rumblesystem_cobracrash();
}

h1_depthoffield_cobraflight()
{
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 3.0, 1500, 1.0, 1.0 );
    common_scripts\utility::_id_384A( "cobra_hit" );
    wait 0.15;
    var_0 = 0.5;
    var_1 = 0.0;

    for ( var_2 = ( 0.0, 0.0, 0.0 ); var_1 <= 48.5; var_1 += var_0 )
    {
        if ( var_1 > 17.0 && var_1 < 20.0 || var_1 > 27.0 && var_1 < 33.0 )
            level.playercardbackground _meth_84a7( 3.0, 1000, 0.5, 0.5 );
        else
        {
            if ( isdefined( level._id_A33F.origin ) )
                var_2 = level._id_A33F.origin;

            var_3 = maps\_utility::_id_7612( distance( level.playercardbackground.origin, var_2 ), 0 );
            level.playercardbackground _meth_84a7( 3.0, var_3, 1.0, 1.0 );
        }

        wait(var_0);
    }

    level.playercardbackground _meth_84a7( 3.0, 1000, 0.25, 0.25 );
    wait 4.0;
    level.playercardbackground _meth_84a7( 3.0, 250, 0.1, 0.1 );
    level.seaknight waittill( "landed" );
    wait 2.0;
    level.playercardbackground _meth_84a7( 6.0, 500, 1.0, 1.0 );
    wait 1.75;
    level.playercardbackground _meth_84a6();
}

music_cobraflight()
{
    level endon( "nuke_section_start" );
    common_scripts\utility::_id_384A( "cobra_hit" );
    musicstop();
    wait 0.1;

    for (;;)
    {
        maps\_utility::_id_6008( "airlift_cobradown_music" );
        wait 96;
        musicstop( 4 );
        wait 4.25;
    }
}

dialogue_cobraflight()
{
    maps\_utility::_id_70C4( "airlift_hqr_situation" );
    maps\_utility::_id_70C4( "airlift_mhp_goahead" );
    level thread maps\_utility::_id_70C4( "airlift_hqr_nestteams" );
    wait 5.4;
    wait 1.0;
    common_scripts\utility::_id_383F( "cobra_rpg_launch" );
    common_scripts\utility::_id_384A( "cobra_hit" );
    wait 1;
    maps\_utility::_id_70C4( "airlift_fhp_werehit" );
    wait 3.5;
    maps\_utility::_id_70C4( "airlift_fhp_mayday" );
    wait 0.2;
    maps\_utility::_id_70C4( "airlift_fhp_goingdown" );
    common_scripts\utility::_id_384A( "cobraCrash02" );
    common_scripts\utility::_id_384A( "cobra_on_deck" );
    wait 1.75;
    maps\_utility::_id_70C4( "airlift_mhp_cobradown" );
    wait 2;
    maps\_utility::_id_70C4( "airlift_mhp_comein" );
    wait 1.5;
    maps\_utility::_id_70C4( "airlift_mhp_smallarmsfire" );
    wait 1;
    maps\_utility::_id_70C4( "airlift_hqr_notsafe" );
    thread maps\_utility::_id_1143( "cobraflight_end" );
    maps\_utility::_id_70C4( "airlift_mhp_weknow" );
    wait 1.5;
    maps\_utility::_id_70C4( "airlift_hqr_youcall" );
    maps\_utility::_id_70C4( "airlift_mhp_youstatus" );
    maps\_utility::_id_70C4( "airlift_fhp_usesomehelp" );
    maps\_utility::_id_70C4( "airlift_mhp_werecoming" );
    common_scripts\utility::_id_383F( "cobra_crash_dialogue_over" );
}

cobra_flyover()
{
    level notify( "delete_pilots" );
    level.seaknight thread maps\airlift_anim::seaknight_close_doors();
    level notify( "stop_seaknight_player_monitor" );
    wait 2.0;
    level.seaknight thread maps\_utility::_id_69C4( "scn_seaknight_liftoff_smoketown2" );
    wait 2.0;
    setsaveddvar( "sm_sunSampleSizeNear", 1 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    common_scripts\utility::_id_0D13( level.fxcobrastreets, maps\_utility::_id_748D );
    maps\_utility::_id_27EF( 3, maps\_mortar::bog_style_mortar_on, 2 );
    level._id_A33F = maps\_vehicle::_id_8978( "wingmanCobraflight" );
    thread maps\_vehicle::_id_427A( level._id_A33F );
    var_0 = getent( "seaknight_land_smoketown2", "script_noteworthy" );
    var_1 = var_0.sprint_begin;
    var_2 = var_0._id_798B;
    var_3 = var_0._id_7929;
    level.seaknight vehicle_setspeed( var_1, var_3, var_2 );
    level.seaknight cleargoalyaw();
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.0, 1.0, 3.7, "smoketown_operation_mix", "leaving_smoketown_mix" );
    thread seaknight_liftoff_anim();
    level.seaknight maps\_utility::_id_9CFC();
    level.seaknight maps\_utility::_id_9D1F();
    level notify( "stop_seaknight_player_monitor" );
    var_4 = getaiarray( "allies" );
    thread maps\_utility::_id_08D6( var_4, 10 );
    var_4 = getaiarray();
    thread maps\_utility::_id_08D6( var_4, 2048 );
    common_scripts\utility::_id_384A( "cobra_on_deck" );
    maps\_utility::_id_27EF( 0, maps\jake_tools::_id_9810, "trig_spawn_drones_cobra_hills_01" );
    maps\_utility::_id_27EF( 0, maps\jake_tools::_id_9810, "trig_spawn_drones_cobra_oasis_01" );
    wait 8;
    maps\jake_tools::_id_9810( "trig_spawn_cobra_flyover_01" );
    wait 3;
    maps\jake_tools::_id_9810( "trig_spawn_cobra_roof_03" );
    wait 9.5;
    maps\jake_tools::_id_9810( "trig_spawn_cobra_roof_01" );
    maps\_utility::_id_27EF( 2, maps\_vehicle::_id_23DE, 52 );
    level thread aa_cobrastreets_init();
    common_scripts\utility::_id_384A( "seaknightLandingCobratown" );
    setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
    setsaveddvar( "sm_sunShadowScale", 1 );
}

cobra_missile()
{
    common_scripts\utility::_id_384A( "cobra_rpg_launch" );
    var_0 = maps\_vehicle::_id_8978( "missile_source" );
    var_0 hide();
    var_0 setvehweapon( "crash_missile_airlift" );
    var_0 setturrettargetent( level._id_A33F );
    wait 1;
    var_1 = getent( "dummy_target", "targetname" );
    var_2 = var_0 fireweapon( "tag_missile_right", var_1, ( 0.0, 0.0, 0.0 ) );
    var_3 = spawn( "script_origin", level._id_A33F gettagorigin( "tail_rotor_jnt" ) );
    var_3 linkto( level._id_A33F, "tag_origin", ( 20.0, 0.0, -40.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 _meth_81dc( var_3 );
    var_4 = distancesquared( var_2.origin, level._id_A33F gettagorigin( "tail_rotor_jnt" ) );
    wait 0.05;
    var_2 thread maps\_utility::_id_69C4( "scn_airlift_cobracrash_incoming_rocket" );

    while ( distancesquared( var_2.origin, level._id_A33F gettagorigin( "tail_rotor_jnt" ) ) < var_4 )
    {
        var_4 = distancesquared( var_2.origin, level._id_A33F gettagorigin( "tail_rotor_jnt" ) );
        wait 0.05;
    }

    common_scripts\utility::_id_383F( "cobra_hit" );
    var_2 delete();
}

cobra_rpgs()
{
    maps\_utility::_id_27EF( 13, ::rpg_fake, "rpg_source_missing_cobra_2" );
}
#using_animtree("vehicles");

cobra_crash()
{
    common_scripts\utility::_id_384A( "cobra_hit" );
    soundscripts\_snd::_id_870C( "start_cobra_crash_mix" );
    level._id_A33F.yawspeed = 400;
    level._id_A33F.yawaccel = 100;
    level._id_A33F setmaxpitchroll( 100, 200 );
    level._id_A33F._id_0C72 = "wingman";
    level._id_A33F _meth_814d( %h1_cobra_crash );
    level._id_A33F thread cobra_crash_rotate();
    level._id_A33F thread cobra_crash_fx();
    level._id_A33F thread cobra_crash_attached_fx();
    wait 4.7;
    var_0 = getent( "cobra_crash_tree_01", "targetname" );
    var_0 playsound( "tree_collapse" );
    var_1 = 2;
    var_2 = var_0.angles;
    var_2 += ( -80.0, 10.0, 0.0 );
    var_0 rotateto( var_2, var_1, var_1 / 2, var_1 / 2 );
    common_scripts\utility::_id_384A( "cobraCrash01" );
    var_3 = getent( "cobra_crash_roof_01", "targetname" );
    physicsexplosionsphere( var_3.origin, level._id_6804, level._id_6804 / 2, level._id_6803 );
    var_4 = getent( "cobra_crash_antenna_01", "targetname" );
    var_1 = 1;
    var_2 = var_4.angles;
    var_2 += ( 0.0, 0.0, 80.0 );
    var_4 rotateto( var_2, var_1, var_1 / 2, var_1 / 2 );
    wait 0.25;
    var_5 = getent( "cobra_crash_antenna_02", "targetname" );
    var_1 = 1;
    var_2 = var_5.angles;
    var_2 += ( 0.0, 0.0, -80.0 );
    var_5 rotateto( var_2, var_1, var_1 / 2, var_1 / 2 );
}

cobra_crash_rotate()
{
    common_scripts\utility::_id_384A( "cobraCrash01" );
    self setturningability( 1 );
    self endon( "stop_rotate" );

    while ( isdefined( self ) )
    {
        self setyawspeed( level._id_A33F.yawspeed, level._id_A33F.yawaccel );
        self settargetyaw( self.angles[1] - 170 );
        wait 0.1;
    }
}

cobra_crash_fx()
{
    var_0 = getent( "cobraCrash01", "targetname" );
    var_1 = getent( "cobraCrash02", "targetname" );
    var_2 = getent( "cobraCrash03", "targetname" );
    var_3 = getent( "cobra_smoke", "targetname" );
    var_4 = getent( "cobra_crash_end", "targetname" );
    common_scripts\utility::_id_384A( "cobra_hit" );
    playfxontag( common_scripts\utility::_id_3FA8( "cobra_crash_rocket_impact" ), self, "tail_rotor_jnt" );
    earthquake( 0.5, 1.2, level.playercardbackground.origin, 8000 );
    setblur( 3.5, 0.1 );
    wait 0.1;
    setblur( 0.0, 1.0 );
    thread maps\_utility::_id_69C4( "scn_airlift_cobra_down" );
    thread maps\_utility::_id_69C5( "scn_airlift_cobra_exp1", "tail_rotor_jnt" );
    wait 0.9;
    thread maps\_mortar::bog_style_mortar_off( 2 );
    common_scripts\utility::_id_384A( "cobraCrash01" );
    thread maps\_utility::_id_69C4( "scn_airlift_cobra_exp2" );
    earthquake( 0.4, 1, level.playercardbackground.origin, 8000 );
    exploder_trigger( 600, var_0.origin );
    playfxontag( common_scripts\utility::_id_3FA8( "cobra_hitting_first_roof" ), self, "tag_deathfx" );
    playfxontag( common_scripts\utility::_id_3FA8( "helicopter_rotor_damaged_fire_airlift" ), self, "tag_deathfx" );
    wait 6.8;
    thread maps\_utility::_id_69C4( "scn_airlift_cobra_exp3" );
    earthquake( 0.3, 2, level.playercardbackground.origin, 8000 );
    exploder_trigger( 700, var_2.origin );
    wait 1.6;
    self notify( "stop soundmi17_helicopter_dying_loop" );
    self notify( "stop soundairlift_heli_alarm_loop" );
    earthquake( 0.3, 3.5, level.playercardbackground.origin, 1000 );
    exploder_trigger( 800, var_4.origin );
    common_scripts\utility::_id_383F( "cobra_on_deck" );
    self notify( "crash_end" );
    self notify( "stop_rotate" );
    self delete();
    thread show_cobra_crash();
    thread cobrapilot_spawn();
    wait 0.3;
    thread maps\_mortar::bog_style_mortar_on( 2 );
}

show_cobra_crash()
{
    var_0 = getent( "cobra_crash", "targetname" );
    var_0 show();
}

exploder_trigger( var_0, var_1 )
{
    var_0 = maps\_utility::_id_8F53( var_0 );
    common_scripts\_exploder::_id_3528( var_0 );

    if ( isdefined( level._id_78BA["exploder"][var_0] ) )
        thread common_scripts\utility::_id_69C2( level._id_78BA["exploder"][var_0], var_1 );
}

cobra_crash_attached_fx()
{
    self endon( "crash_end" );
    self endon( "death" );
    common_scripts\utility::_id_384A( "cobra_hit" );
    thread cobra_crash_attached_subfx( "tail_rotor_jnt", undefined, "fire_trail_l_airlift", 1.5 );
    maps\_utility::_id_27EF( 1.5, ::cobra_crash_attached_subfx, "tail_rotor_jnt", "cobra_fire_burst_exhaust", "smoke_trail_l_airlift", 8.3 );
    maps\_utility::_id_27EF( 3, ::cobra_crash_attached_subfx, "tag_engine_right", "cobra_fire_burst_exhaust", "cobra_fire_exhaust", 6.9 );
    maps\_utility::_id_27EF( 3.4, ::cobra_crash_attached_subfx, "tag_engine_left", "cobra_fire_burst_exhaust", "cobra_fire_exhaust", 6.6 );
}

cobra_crash_attached_subfx( var_0, var_1, var_2, var_3 )
{
    self endon( "crash_end" );
    self endon( "death" );

    if ( isdefined( var_1 ) )
    {
        playfxontag( common_scripts\utility::_id_3FA8( var_1 ), self, var_0 );
        thread maps\_utility::_id_69C5( "airlift_cobra_burst_exhaust", var_0 );
    }

    if ( isdefined( var_2 ) )
    {
        var_4 = undefined;

        if ( isdefined( var_3 ) )
            var_4 = gettime() + var_3 * 1000;

        while ( !isdefined( var_4 ) || gettime() < var_4 )
        {
            var_5 = self gettagorigin( var_0 );
            playfx( common_scripts\utility::_id_3FA8( var_2 ), var_5 );
            waittillframeend;
        }
    }
}

aa_cobrastreets_init()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    thread cobrastreets_kill();
    thread dialogue_cobrastreets();
    thread cobrastreets_crewchief_think();
    thread obj_rescue_pilot();
    thread obj_return_pilot();
    thread carrying_hint();
    thread cobra_streetfight();
    thread cobra_crashsite_think();
}

cobrastreets_kill()
{
    level endon( "obj_rescue_pilot_complete" );
    level.playercardbackground endon( "death" );
    var_0 = getent( "trig_cobrastreets_kill", "targetname" );
    var_0 thread cobrastreets_instakill();
    var_1 = getent( "cobrastreets_kill", "targetname" );
    var_2 = 50;

    for (;;)
    {
        wait 0.05;

        if ( level.playercardbackground istouching( var_1 ) )
        {
            var_3 = randomintrange( 90, 127 );
            level.playercardbackground viewkick( var_3, level.playercardbackground.origin );
            level.playercardbackground dodamage( var_2, level.playercardbackground.origin );
            wait(randomfloatrange( 0.5, 1.7 ));
            var_2 += 30;
        }
    }
}

cobrastreets_instakill()
{
    level endon( "obj_rescue_pilot_complete" );
    level.playercardbackground endon( "death" );
    self waittill( "trigger" );
    level.playercardbackground dodamage( level.playercardbackground.helmet + 1000, level.playercardbackground.origin );
}

cobrastreets_crewchief_think()
{
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    level.crewchief notify( "stop_default_behavior" );
    level.crewchief notify( "stop_idle_crewchief" );
    level.crewchief animscripts\shared::_id_6869( level.crewchief.secondaryweapon, "right" );
    level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
    common_scripts\utility::_id_384A( "player_cobra_retreat_03" );

    while ( distancesquared( level.playercardbackground.origin, level.crewchief.origin ) > level.crewchiefrangesquared )
    {
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_shoot", "tag_detach", "stop_idle_crewchief", level.seaknight );
        level.crewchief waittillmatch( "looping anim", "end" );
    }

    level.crewchief notify( "stop_default_behavior" );
    level.crewchief notify( "stop_idle_crewchief" );
    level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );

    if ( !level.usingstartpoint )
    {
        common_scripts\utility::_id_384A( "cobrastreet_seaknight_loading" );
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_getin", "tag_detach", "stop_idle_crewchief", level.seaknight );
        wait 5;
        level.crewchief waittillmatch( "looping anim", "end" );
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
        wait 1.3;
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_getin", "tag_detach", "stop_idle_crewchief", level.seaknight );
        wait 1;
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_shoot", "tag_detach", "stop_idle_crewchief", level.seaknight );
        level.crewchief waittillmatch( "looping anim", "end" );
        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "crewchief_gun_shoot", "tag_detach", "stop_idle_crewchief", level.seaknight );
        wait 3;
        level.crewchief notify( "stop_idle_crewchief" );
        level.seaknight maps\_anim::_id_0C24( level.crewchief, "airlift_crewchief_stepout", "tag_detach" );
        level.crewchief notify( "stop_idle_crewchief" );
        level.seaknight maps\_anim::_id_0C24( level.crewchief, "airlift_crewchief_stepout_fire", "tag_detach" );
        level.seaknight maps\_anim::_id_0C24( level.crewchief, "airlift_crewchief_stepout_fire_2_idle", "tag_detach" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, "airlift_crewchief_stepout_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
    }

    common_scripts\utility::_id_384A( "nuke_explodes" );
    level.crewchief notify( "stop_idle_crewchief" );
    level.seaknight maps\_anim::_id_0C24( level.crewchief, "crewchief_sucked_out", "tag_detach" );

    if ( isdefined( level.crewchief._id_58D7 ) )
        level.crewchief maps\_utility::_id_8EA4();

    level.crewchief delete();
}

dialogue_crash_site_nag()
{
    thread dialogue_crash_site_nag_cleanup();
    level endon( "pilot_taken_from_cockpit" );
    var_0 = 1;

    while ( !common_scripts\utility::_id_382E( "pilot_taken_from_cockpit" ) )
    {
        wait 10;

        if ( !common_scripts\utility::_id_382E( "pilot_taken_from_cockpit" ) )
        {
            if ( var_0 == 1 )
            {
                level.vasquez maps\jake_tools::_id_2A05( "airlift_vsq_getherout" );
                var_0++;
                continue;
            }

            if ( var_0 == 2 )
            {
                level.vasquez maps\jake_tools::_id_2A05( "airlift_gm2_getpilot" );
                var_0++;
                continue;
            }

            if ( var_0 == 3 )
            {
                level.vasquez maps\jake_tools::_id_2A05( "airlift_gm2_outofhelo" );
                var_0++;
                continue;
            }

            if ( var_0 == 4 )
            {
                level.vasquez maps\jake_tools::_id_2A05( "airlift_gm2_holdemoff" );
                var_0++;
                continue;
            }

            if ( var_0 == 5 )
            {
                level.vasquez maps\jake_tools::_id_2A05( "airlift_gm2_coveryou" );
                var_0 = 1;
            }
        }
    }
}

dialogue_crash_site_nag_cleanup()
{
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    thread maps\_utility::_id_48CB();
}

dialogue_cobrastreets()
{
    common_scripts\utility::_id_384A( "cobra_crash_dialogue_over" );
    maps\_utility::_id_1332( "allies" );
    common_scripts\utility::_id_384A( "player_exited_seaknight_cobrastreets" );
    maps\_utility::_id_70C4( "airlift_hqr_hostilesadvancing" );
    maps\_utility::_id_70C4( "airlift_vsq_90sec" );
    maps\_utility::_id_1333( "allies" );
    common_scripts\utility::_id_384A( "player_near_crash_site" );
    level.vasquez maps\jake_tools::_id_2A05( "airlift_vsq_pullherout" );
    thread dialogue_crash_site_nag();
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    common_scripts\utility::_id_383F( "obj_rescue_pilot_complete" );
    wait 3;
    level.vasquez maps\jake_tools::_id_2A05( "airlift_vsq_holddown" );
    common_scripts\utility::_id_383F( "obj_return_pilot_given" );
    maps\_utility::_id_70C4( "airlift_mhp_goodtime" );
    maps\_utility::_id_70C4( "airlift_vsq_onourway" );
}

cobrapilot_spawn()
{
    level.crashnode = getent( "node_pilot_crash", "targetname" );
    var_0 = getent( "friendly_cobrapilot", "script_noteworthy" );
    level.cobrapilot = maps\jake_tools::spawndude( var_0, "stalingrad" );
    level.cobrapilot._id_0C72 = "frnd";
    level.cobrapilot thread cobrapilot_think();
}

cobra_streetfight()
{
    level.seaknight thread maps\airlift_aud::play_player_heli_land_sfx( getent( "flightPathstart_cobrastreets", "targetname" ), "scn_seaknight_land_cobrastreets" );
    common_scripts\utility::_id_384A( "seaknightLandingCobratown" );
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.0, 1.0, 3.7, "cobra_crash_mix", "landing_crash_mix" );
    maps\_friendlyfire::_id_9932();
    var_0 = getentarray( "trigger_cobra_retreat", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CC );
    level.seaknight thread vehicle_heli_land( getent( "seaknight_land_cobrastreets", "script_noteworthy" ) );
    maps\_utility::_id_27EF( 5, ::disablech46turretfire );
    level.afriendliesseaknight = maps\_utility::_id_0D08( getentarray( "seaknight_unloaders_cobrastreets", "targetname" ), 1 );

    if ( isdefined( level.friendliesnames_smoketown ) )
    {
        var_1 = 0;

        foreach ( var_3 in level.afriendliesseaknight )
        {
            if ( var_3.nearz != "Lt. Vasquez" )
            {
                var_4 = level.friendliesnames_ch46[var_1];

                if ( isdefined( var_4 ) )
                    var_3.nearz = var_4;

                var_1++;
            }
        }
    }

    level.vasquez = maps\jake_tools::_id_3F71( level.afriendliesseaknight, "vasquez" );
    level.crewchief = maps\jake_tools::spawndude( getent( "seaknight_crewchief_cobrastreets", "targetname" ), 1 );
    level.seaknight thread vehicle_seaknight_unload( level.afriendliesseaknight, level.crewchief, "cobrastreets" );
    level.seaknight waittill( "landed" );
    soundscripts\_snd::_id_870C( "start_pilot_rescue_mix" );
    var_6 = getaiarray( "axis" );
    thread maps\_utility::_id_08D6( var_6, 100 );
    common_scripts\utility::_id_383F( "seaknight_landed_cobrastreets" );
    common_scripts\utility::_id_383F( "aa_cobra_rescue_section" );
    thread maps\_mortar::bog_style_mortar_off( 2 );

    if ( !isdefined( level.cobrapilot ) )
        cobrapilot_spawn();

    var_7 = getent( "friendly_deadpilot", "script_noteworthy" );
    level.deadpilot = maps\jake_tools::spawndude( var_7, "stalingrad" );
    level.deadpilot._id_0C72 = "frnd";
    level.deadpilot maps\_utility::_id_4462();
    level.deadpilot setcontents( 0 );
    level.deadpilot.allowdeath = 0;
    level.deadpilot.ignoretriggers = 1;
    level.deadpilot.grenadeawareness = 0;
    var_8 = getent( "node_gunner_crash", "targetname" );
    var_8 thread maps\_anim::_id_0BE1( level.deadpilot, "deadpilot_idle", undefined, "stop_idle_deadpilot" );
    level.afriendlieslz = maps\_utility::_id_0D08( getentarray( "friendlies_cobrastreets_lz", "targetname" ), 1 );

    if ( isdefined( level.friendliesnames_smoketown ) )
    {
        var_1 = 0;

        foreach ( var_3 in level.afriendlieslz )
        {
            var_4 = level.friendliesnames_smoketown[var_1];

            if ( isdefined( var_4 ) )
                var_3.nearz = var_4;

            var_1++;
        }
    }

    var_11 = getentarray( "pilots_cobrastreets", "targetname" );
    spawn_pilots( var_11 );
    wait 2;
    common_scripts\utility::_id_383F( "obj_rescue_pilot_given" );
    thread remove_enemiesgrenades_cobrastreets();
    maps\_utility::_id_27EF( 1, ::rescue_timer, 90 );
    thread vehicles_delete_all( "t72s" );
    level.sk_godrays_reverse = 1;
    level.seaknight notify( "unload_ai" );
    thread seaknight_player_dismount_gun();
    maps\_friendlyfire::_id_992E();
    level.seaknight waittill( "all_ai_unloaded" );

    while ( level.playerinseaknight == 1 )
        wait 0.05;

    common_scripts\utility::_id_383F( "player_exited_seaknight_cobrastreets" );
    maps\_utility::_id_27EF( 0, maps\_vehicle::_id_23DE, 51 );
    thread maps\_utility::_id_1143( "seaknight_landed_cobrastreets" );
    common_scripts\utility::_id_0D13( level.afriendliesseaknight, maps\jake_tools::_id_0907, "stop_ch46_idle", 10 );
    maps\jake_tools::_id_981B( "colornodes_cobrastreets_start", "script_noteworthy", 1 );
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    thread h1_grabbingpilot_dofsystem();
    thread h1_nukevisualeffects_blink();
    thread h1_nukevisualeffects_blurs();
    common_scripts\utility::_id_3831( "aa_cobra_rescue_section" );
    common_scripts\utility::_id_383F( "aa_cobra_escape_section" );
    maps\_utility::_id_27EF( 4, maps\_hud_util::_id_8AF5, 1 );
    level.playercardbackground.deathinvulnerabletime = 10000;
    var_0 = getentarray( "trigger_cobra_retreat", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CE );
    maps\jake_tools::_id_981B( "colornodes_cobrastreets_start", "script_noteworthy", 0 );
    maps\jake_tools::_id_981B( "colornodes_cobrastreets_end", "script_noteworthy", 1 );
    level.afriendlieslzdummies = maps\_utility::_id_0D08( getentarray( "friendlies_cobrastreets_lz_dummies", "targetname" ), 1 );
    vehicle_seaknight_idle_and_load( level.afriendlieslzdummies );
    common_scripts\utility::_id_384A( "player_cobra_retreat_01" );
    maps\jake_tools::_id_9810( "killspawner_cobra_retreat_01" );
    spawn_trigger_dummy( "dummy_spawner_cobra_retreat_01" );
    wait 0.1;
    var_12 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_12, ::ai_player_seek );
    level.afriendliesseaknight = common_scripts\utility::_id_0CF6( level.afriendliesseaknight, level.vasquez );

    for ( var_1 = 0; var_1 < level.afriendliesseaknight.size; var_1++ )
    {
        if ( isdefined( level.afriendliesseaknight[var_1]._id_58D7 ) )
            level.afriendliesseaknight[var_1] maps\_utility::_id_8EA4();
    }

    common_scripts\utility::_id_384A( "player_putting_down_pilot" );
    turn_off_lights( "cobra_light", "script_noteworthy" );
    common_scripts\utility::_id_3831( "aa_cobra_escape_section" );
    thread maps\_hud_util::_id_8AF5( 0 );
    common_scripts\utility::_id_383F( "obj_return_pilot_complete" );
    thread kill_timer();
    thread maps\_utility::_id_1143( "obj_return_pilot_complete" );
    var_13 = spawn( "script_origin", level.seaknight.origin );
    var_13.origin = level.seaknight gettagorigin( "tag_door_rear" );
    var_14 = missile_createrepulsorent( var_13, 7000, 500 );
    var_13 linkto( level.seaknight, "tag_door_rear", ( 0.0, 0.0, 100.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\jake_tools::_id_9810( "killspawner_cobra_retreat_01" );
    spawn_trigger_dummy( "dummy_spawner_cobra_end" );
    wait 0.1;
    var_12 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_12, ::ai_player_seek );
    level.seaknight notify( "show_loaders" );

    for ( var_1 = 0; var_1 < level.afriendlieslz.size; var_1++ )
    {
        if ( isdefined( level.afriendlieslz[var_1]._id_58D7 ) )
            level.afriendlieslz[var_1] maps\_utility::_id_8EA4();

        level.afriendlieslz[var_1] delete();
    }

    for ( var_1 = 0; var_1 < level.afriendliesseaknight.size; var_1++ )
    {
        if ( !isdefined( level.afriendliesseaknight[var_1] ) )
            continue;

        if ( !isalive( level.afriendliesseaknight[var_1] ) )
            continue;

        if ( isdefined( level.afriendliesseaknight[var_1]._id_58D7 ) )
            level.afriendliesseaknight[var_1] maps\_utility::_id_8EA4();

        level.afriendliesseaknight[var_1] delete();
    }

    if ( isdefined( level.vasquez ) )
    {
        if ( isdefined( level.vasquez._id_58D7 ) )
            level.vasquez maps\_utility::_id_8EA4();

        level.vasquez delete();
    }

    wait 1;
    wait 0.45;
    level.seaknight notify( "load" );
    common_scripts\utility::_id_383F( "cobrastreet_seaknight_loading" );
    common_scripts\utility::_id_384A( "seaknight_leaving_cobrastreets" );
    missile_deleteattractor( var_14 );
    maps\airlift_lighting::apply_lighting_pass_airlift( "airlift_cobra" );
    wait 4.4;
    level.playercardbackground disableweapons();
}

h1_grabbingpilot_dofsystem()
{
    level.playercardbackground thread maps\_utility::_id_69C4( "airlift_pickup_pilot_backpack" );
    level.playercardbackground _meth_84a7( 2.0, 42, 9.0, 9.0 );
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 2.0, 42, 4.0, 4.0 );
    wait 0.85;
    level.playercardbackground _meth_84a7( 2.5, 21.0, 1.6, 1.6 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 3.0, 9.75, 1.7, 1.7 );
    setsaveddvar( "r_mbEnable", 2 );
    wait 0.5;
    wait 0.15;
    level.playercardbackground _meth_84a7( 2.0, 2325, 1.2, 1.2 );
    wait 3.0;
    var_0 = 0.1;
    var_1 = 0.0;

    while ( var_1 >= 0 )
    {
        var_2 = maps\_utility::_id_7612( distance( level.playercardbackground.origin, level.seaknight.origin ), 0 );
        level.playercardbackground _meth_84a7( 2.0, var_2, 1.0, 1.0 );
        wait(var_0);
        var_1 += var_0;

        if ( common_scripts\utility::_id_382E( "player_putting_down_pilot" ) )
            break;
    }

    wait 1.0;
    level.playercardbackground _meth_84a7( 2.5, 19, 1.7, 1.7 );
    wait 1.15;
    level.playercardbackground _meth_84a7( 3.5, 13.5, 2.5, 2.5 );
    wait 0.65;
    setsaveddvar( "r_mbEnable", 0 );
    level.playercardbackground _meth_84a7( 3.5, 11, 3.0, 3.0 );
    wait 0.5;
    common_scripts\utility::_id_383F( "pilot_name_reappear" );
    level.playercardbackground _meth_84a7( 3.5, 65, 1.0, 1.0 );
    wait 1.5;
    setsaveddvar( "r_mbEnable", 2 );
    level.playercardbackground _meth_84a7( 3.5, 120, 2.5, 2.5 );
    wait 0.7;
    wait 1.0;
    setsaveddvar( "r_mbEnable", 0 );
    var_1 = 0.0;
    var_0 = 0.05;
    var_3 = ( 0.0, 0.0, 0.0 );

    for ( var_4 = ( 0.0, 0.0, 0.0 ); var_1 <= 23.0; var_1 += var_0 )
    {
        var_3 = anglestoforward( level.seaknight.angles );
        var_4 = level.playercardbackground getplayerangles();
        var_4 = anglestoforward( var_4 );
        var_5 = atan2( var_4[1], var_4[0] ) - atan2( var_3[1], var_3[0] );
        var_5 = angleclamp180( var_5 );

        if ( var_5 > -140 && var_5 < -120 )
            level.playercardbackground _meth_84a7( 2.5, 53, 2.5, 2.5 );
        else if ( var_5 < -145 || var_5 > 0 )
            level.playercardbackground _meth_84a7( 2.5, 1500, 2.0, 2.0 );

        wait(var_0);
    }

    level.playercardbackground _meth_84a7( 2.5, 1500, 1.0, 1.0 );
    wait 1.0;
    level.playercardbackground lerpviewangleclamp( 0.5, 0, 0, 0, 0, 0, 0 );
    common_scripts\utility::_id_384A( "nuke_explodes" );
    setsaveddvar( "r_mbEnable", 2 );
    level.playercardbackground _meth_84a7( 2.5, 1500, 1.0, 1.0 );
    wait 6.5;

    if ( isdefined( level.crewchief ) )
        level.crewchief common_scripts\utility::_id_4853( "none" );

    level.playercardbackground _meth_84a7( 3.0, 200, 2.0, 2.0 );
    wait 1.65;
    level.playercardbackground _meth_84a7( 3.5, 150, 2.0, 2.0 );
    wait 1.35;
    level.playercardbackground _meth_84a7( 4.0, 30, 4.0, 4.0 );
    wait 0.85;
    level.playercardbackground _meth_84a7( 4.0, 35, 0.8, 0.8 );
    wait 2.5;
    level.playercardbackground _meth_84a7( 3.5, 250, 4.0, 4.0 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 3.5, 15, 4.0, 4.0 );
    wait 0.65;
    level.playercardbackground _meth_84a7( 3.0, 1000, 2.0, 2.0 );
    wait 1.0;
    wait 7.5;
    level.playercardbackground _meth_84a6();
    setsaveddvar( "r_mbEnable", 0 );
}

h1_nukevisualeffects_blink()
{
    var_0 = maps\jake_tools::_id_23D0( "black", 0 );
    common_scripts\utility::_id_384A( "nuke_explodes" );
    wait 11.65;
    var_0 thread h1_nukefadeoverlay( 0.3, 0.2, 0.0, 0.3, 0.2 );
    wait 3.5;
    var_0 thread h1_nukefadeoverlay( 0.5, 0.2, 0.1, 0.4, 0.2 );
    wait 2.35;
    var_0 thread h1_nukefadeoverlay( 0.65, 0.3, 0.2, 0.5, 0.1 );
    wait 1.35;
    var_0 thread h1_nukefadeoverlay( 0.75, 0.4, 0.15, 0.5, 0.2 );
    wait 1.0;
    var_0 thread h1_nukefadeoverlay( 0.92, 0.5, 0.1, 0.4, 0.2 );
    wait 1.0;
}

h1_nukevisualeffects_blurs()
{
    common_scripts\utility::_id_384A( "nuke_explodes" );
    wait 11.35;
    thread h1_blur_overlay( 4, 0.5, 0, 0.5, 0.2 );
    wait 3.5;
    thread h1_blur_overlay( 9, 0.5, 0, 0.5, 0.2 );
    wait 2.25;
    thread h1_blur_overlay( 7, 0.5, 0, 0.5, 0.2 );
    wait 1.75;
    thread h1_blur_overlay( 6, 0.5, 0, 0.5, 0.0 );
    wait 1.05;
    thread h1_blur_overlay( 6, 0.5, 0, 0.5, 2.5 );
}

h1_nukefadeoverlay( var_0, var_1, var_2, var_3, var_4 )
{
    h1_fade_overlay( var_0, var_1 );
    wait(var_4);
    h1_fade_overlay( var_2, var_3 );
}

h1_fade_overlay( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 8;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

h1_blur_overlay( var_0, var_1, var_2, var_3, var_4 )
{
    setblur( var_0, var_1 );
    wait(var_1 + var_4);
    setblur( var_2, var_3 );
}

cobra_crashsite_think()
{
    var_0 = getent( "obj_rescue_pilot", "targetname" );
    var_1 = missile_createrepulsorent( var_0, 8500, 275 );
    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    wait 3;
    missile_deleteattractor( var_1 );
}
#using_animtree("generic_human");

cobrapilot_change_facial_anim( var_0, var_1 )
{
    level.crashnode endon( "stop_idle_pilot" );
    self endon( "death" );
    var_2 = level._id_78AC[self._id_0C72][var_0];

    for (;;)
    {
        self _meth_814b( var_2, %velinda_face, 1 );
        self _meth_814e( %velinda_face, 1 );

        if ( !var_1 )
            break;

        var_3 = getanimlength( var_2 );
        wait(var_3);
    }
}

cobrapilot_wave()
{
    level endon( "pilot_taken_from_cockpit" );
    level.crashnode notify( "stop_idle_pilot" );
    cobrapilot_change_facial_anim( "wounded_cockpit_wave_over_facial", 0 );
    level.crashnode maps\_anim::_id_0C24( self, "wounded_cockpit_wave_over" );
    level.crashnode thread maps\_anim::_id_0BE1( self, "wounded_cockpit_idle", undefined, "stop_idle_pilot" );
    thread cobrapilot_change_facial_anim( "wounded_cockpit_idle_facial", 1 );
    wait(randomfloatrange( 2, 4 ));

    while ( !common_scripts\utility::_id_382E( "pilot_taken_from_cockpit" ) )
    {
        wait 0.05;

        if ( !common_scripts\utility::_id_382E( "player_near_cobra" ) )
        {
            level.crashnode notify( "stop_idle_pilot" );
            cobrapilot_change_facial_anim( "wounded_cockpit_wave_over_facial", 0 );
            level.crashnode maps\_anim::_id_0C24( self, "wounded_cockpit_wave_over" );
            level.crashnode thread maps\_anim::_id_0BE1( self, "wounded_cockpit_idle", undefined, "stop_idle_pilot" );
            thread cobrapilot_change_facial_anim( "wounded_cockpit_idle_facial", 1 );
            wait(randomfloatrange( 2, 4 ));
        }
    }
}

trigger_monitor_player_lean()
{
    self endon( "stop_monitor_lean" );

    for (;;)
    {
        self.usepathsmoothingvalues = !level.playercardbackground isleaning();
        waittillframeend;
    }
}

cobrapilot_think()
{
    self.usepathsmoothingvalues = 1;
    thread cobrapilot_shoots_enemies();
    thread cobrapilot_change_facial_anim( "wounded_cockpit_shoot_facial", 1 );
    level.crashnode thread maps\_anim::_id_0BE1( self, "wounded_cockpit_shoot", undefined, "stop_idle_pilot" );
    common_scripts\utility::_id_384A( "player_near_crash_site" );
    self.ignoretriggers = 1;
    self.grenadeawareness = 0;
    self setthreatbiasgroup( "oblivious" );
    thread cobrapilot_wave();

    if ( !getdvarint( "limited_mode" ) )
    {
        self setcursorhint( "HINT_NOICON" );
        self sethintstring( &"SCRIPT_PLATFORM_AIRLIFT_HINT_PICKUP_PILOT" );
    }

    thread trigger_monitor_player_lean();

    for (;;)
    {
        self waittill( "trigger" );
        waittillframeend;

        if ( !level.playercardbackground isleaning() )
        {
            self notify( "stop_monitor_lean" );
            break;
        }
    }

    level.cobrapilot thread maps\_utility::_id_69C4( "scn_airlift_pilot_pullout" );
    level.playercardbackground enableinvulnerability();
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowcrouch( 0 );
    level.cobrapilot.usepathsmoothingvalues = 0;
    level.playercardbackground disableweapons();
    level.playercardbackground setmovespeedscale( 0.85 );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowsprint( 0 );
    level.playercardbackground allowjump( 0 );
    level.playercardbackground allowlean( 0 );
    level.eplayerview = maps\_utility::_id_88D1( "player_carry" );
    level.eplayerview hide();
    level.crashnode maps\_anim::_id_0BC7( level.eplayerview, "wounded_pullout" );
    level.eplayerview maps\_utility::_id_5696( "tag_player", 0.5, 1, 0, 0, 0, 0 );
    level.playercardbackground playerlinktodelta( level.eplayerview, "tag_player", 1, 0, 0, 0, 0 );
    common_scripts\utility::_id_383F( "pilot_taken_from_cockpit" );
    level.eplayerview show();
    level.oldnearclip = getdvar( "r_znear" );
    setsaveddvar( "r_znear", 1.0 );
    level.crashnode notify( "stop_idle_pilot" );
    cobrapilot_change_facial_anim( "wounded_pullout_facial", 0 );
    level.crashnode thread maps\_anim::_id_0C24( level.cobrapilot, "wounded_pullout" );
    level.crashnode maps\_anim::_id_0C24( level.eplayerview, "wounded_pullout" );
    level.playercardbackground disableinvulnerability();
    level.seaknight thread maps\_vehicle_code::_id_5748( "back3" );
    level.seaknight thread maps\_vehicle_code::_id_5746( "back back2" );
    level aa_nuke_init();
}

cobrapilot_shoots_enemies()
{
    level endon( "pilot_taken_from_cockpit" );
    var_0 = getent( "hostile_velindakill", "targetname" );
    var_1 = undefined;
    level thread cobrapilot_shoots_enemies_cleanup( var_1 );

    while ( !common_scripts\utility::_id_382E( "velinda_kills_dude" ) )
    {
        wait 0.05;

        if ( isdefined( var_1 ) )
            continue;

        self waittillmatch( "looping anim", "end" );
        wait 0.8;
        var_1 = maps\jake_tools::spawndude( var_0, 1 );
        var_1.ignoretriggers = 1;
        var_1 setthreatbiasgroup( "oblivious" );
        var_1 waittill( "goal" );
        self waittillmatch( "looping anim", "fire" );

        if ( !isdefined( var_1 ) )
            continue;

        magicbullet( level.cobrapilot.weapon_switch_invalid, level.cobrapilot gettagorigin( "tag_flash" ), var_1 gettagorigin( "TAG_EYE" ) );
        magicbullet( level.cobrapilot._id_855D, level.cobrapilot.origin, var_1 gettagorigin( "TAG_EYE" ) );
        playfxontag( common_scripts\utility::_id_3FA8( "headshot" ), var_1, "tag_eye" );
        var_1 kill();
    }
}

cobrapilot_shoots_enemies_cleanup( var_0 )
{
    common_scripts\utility::_id_384A( "velinda_kills_dude" );

    if ( isdefined( var_0 ) )
    {
        var_0.ignoretriggers = 0;
        var_0 setthreatbiasgroup( "axis" );
    }
}

aa_nuke_init()
{
    thread nuke_flight();
    thread dialogue_nuke();
    thread music_nuke();
    thread seaknight_speed_up();
    thread _id_6265();
}

music_nuke()
{
    common_scripts\utility::_id_384A( "nuke_section_start" );
    common_scripts\utility::_id_384A( "nuke_explodes" );
    musicstop( 4 );
    wait 4.1;
    common_scripts\utility::_id_384A( "shockwave_about_to_hit_player" );
    wait 1;
    maps\_utility::_id_6008( "airlift_crash_music" );
}

dialogue_nuke()
{
    common_scripts\utility::_id_384A( "nuke_section_start" );
    maps\_utility::_id_70C4( "airlift_hqr_nuclearthreat" );
    wait 1;
    maps\_utility::_id_70C4( "airlift_vsq_gogo" );
    wait 5.5;
    setsaveddvar( "sm_sunSampleSizeNear", 1 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    maps\_utility::_id_70C4( "airlift_mhp_inforchop" );
    wait 0.5;
    maps\_utility::_id_70C4( "airlift_hqr_confirmed" );
    level.playercardbackground playsound( "airlift_nuke_radio_comm_shutoff" );
    common_scripts\utility::_id_384A( "shockwave_about_to_hit_player" );
    level thread maps\_utility::_id_70BD( "airlift_vsq_hangon" );
}

nuke_flight()
{
    level.cobrapilot common_scripts\utility::_id_4853( "nuke_section_start" );
    soundscripts\_snd::_id_870C( "aud_add_drag_pilot_mix" );

    if ( isdefined( level.cobrapilot ) )
    {
        if ( isdefined( level.cobrapilot._id_58D7 ) )
            level.cobrapilot maps\_utility::_id_8EA4();

        level.cobrapilot unlink();
        level.cobrapilot delete();
    }

    level.cobrapilot = maps\_utility::_id_88D1( "frnd" );
    level.playercardbackground unlink();
    level.carryignoreentityfunction = ::carryignoreentity;
    maps\_move_with_animation::carrystart( level.cobrapilot, ::carryloopcondition );
    var_0 = getent( "trig_pilot_putdown", "targetname" );
    var_0 waittill( "trigger" );
    soundscripts\_snd::_id_870C( "aud_add_escape_crash_mix" );
    level.is_carry_done = 1;
    var_1 = maps\_utility::_id_88D1( "player_carry" );
    level.seaknight maps\_anim::_id_0C43( var_1, "wounded_putdown", "tag_detach" );
    level.seaknight maps\_anim::_id_0BC7( var_1, "wounded_putdown", "tag_detach" );
    var_2 = var_1 gettagorigin( "tag_player" );
    var_3 = var_1 gettagangles( "tag_player" );
    var_1 hide();
    var_4 = getent( "friendly_cobrapilot_2", "script_noteworthy" );
    var_4._id_0C72 = "frnd";
    var_5 = [];
    var_5[0] = var_4;
    level.seaknight maps\_anim::_id_0C36( var_5, "wounded_putdown", "tag_detach" );
    var_6 = maps\jake_tools::spawndude( var_4, "stalingrad" );
    var_6 setcontents( 0 );
    var_6.ignoretriggers = 1;
    var_6.grenadeawareness = 0;
    var_6 setthreatbiasgroup( "oblivious" );
    level.seaknight maps\_anim::_id_0BC7( var_6, "wounded_putdown", "tag_detach" );
    var_6 hide();
    common_scripts\utility::_id_383F( "nuke_section_start" );
    thread hud_hide( 1 );
    soundscripts\_snd::_id_870C( "set_ambient_helicopter" );
    common_scripts\utility::_id_383F( "player_putting_down_pilot" );
    thread cobrapilot_grunt();
    level.playercardbackground enableinvulnerability();
    level notify( "delete_pilots" );
    var_1 maps\_utility::_id_5696( "tag_player", 0.5, 1, 0, 0, 0, 0 );
    maps\_move_with_animation::carrystop();
    level.eplayerview delete();
    level.eplayerview = var_1;
    level.eplayerview show();
    level.playercardbackground playerlinktodelta( level.eplayerview, "tag_player", 1, 0, 0, 0, 0 );
    level.cobrapilot delete();
    level.cobrapilot = var_6;
    level.cobrapilot show();
    var_5 = [];
    var_5[var_5.size] = level.eplayerview;
    var_5[var_5.size] = level.cobrapilot;
    level.cobrapilot cobrapilot_change_facial_anim( "wounded_putdown_facial", 0 );
    level.seaknight maps\_anim::_id_0C18( var_5, "wounded_putdown", "tag_detach" );

    if ( isdefined( level.oldnearclip ) )
    {
        setsaveddvar( "r_znear", level.oldnearclip );
        level.oldnearclip = undefined;
    }

    maps\_art::_id_8FCD( "nuke", 0 );
    level.eplayerview hide();
    level.playercardbackground enableweapons();
    level.eplayerview linkto( level.seaknight );
    level.playercardbackground playerlinktodelta( level.eplayerview, "tag_player", 1, 20, 45, 5, 25 );
    thread pelayo_in_seaknight_shooting();
    wait 1;

    if ( isdefined( level.cobrapilot._id_58D7 ) )
        level.cobrapilot maps\_utility::_id_8EA4();

    level.cobrapilot delete();
    common_scripts\utility::_id_383F( "pilot_put_down_in_seaknight" );
    maps\_utility::_id_27EF( 14, maps\_vehicle::_id_23DE, 36 );
    wait 6;
    level.seaknight thread maps\_utility::_id_69C4( "scn_seaknight_liftoff_cobrastreets" );
    level notify( "stop_seaknight_player_monitor" );
    wait 2;
    level.seaknight vehicle_setspeed( 60 );
    level.seaknight cleargoalyaw();
    level.seaknight_engine_sound_node thread maps\airlift_aud::aud_seaknight_event_handler( 1.0, 1.0, 3.7, "drag_pilot_mix", "escape_crash_mix" );
    level.seaknight maps\_utility::_id_9CFC();
    level.seaknight maps\_utility::_id_9D1F();
    level.seaknight setmaxpitchroll( 25, 50 );
    level.seaknight setairresitance( 1 );
    level.seaknight setacceleration( 5 );
    level.seaknight setjitterparams( ( 0.0, 0.0, 20.0 ), 0.5, 1.5 );
    common_scripts\utility::_id_383F( "seaknight_leaving_cobrastreets" );
    level notify( "stop_seaknight_player_monitor" );
    maps\_utility::_id_27EF( 1.5, ::rpg_fake, "rpg_source_cobra_end" );
    maps\jake_tools::_id_9810( "killspawner_cobra_end" );
    thread maps\_utility::_id_1143( "cobra_leave" );
    var_7 = getaiarray( "axis" );
    thread maps\_utility::_id_08D6( var_7, 2048 );
}

carryloopcondition()
{
    if ( !isdefined( level.is_carry_done ) )
        return 1;

    return !level.is_carry_done;
}

carryignoreentity( var_0 )
{
    var_1 = distance2dsquared( var_0, ( 5141.0, 8084.0, 333.0 ) );
    return common_scripts\utility::_id_9294( var_1 <= 1000, level.seaknight, undefined );
}

cobrapilot_grunt()
{
    level.cobrapilot thread maps\_utility::_id_69C4( "airlift_drop_pilot_backpack" );
}

_id_6265()
{
    common_scripts\utility::_id_384A( "seaknightStartingNukePath" );
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "nuke_seaknight_02" );
    var_0 playsound( "scn_airlift_nuke_incoming_seaknight" );
    thread player_viewbody_animations_nukecrash();
    thread despawn_smoketown_crane();
    wait 4.0;
    wait 1.5;
    thread nuke_sunlight();
    common_scripts\utility::_id_383F( "nuke_explodes" );
    soundscripts\_snd::_id_870C( "start_nuke_mix" );
    wait 0.5;
    level.playercardbackground disableweapons();
    level.playercardbackground playlocalsound( "airlift_nuke" );
    common_scripts\_exploder::_id_3528( 666 );
    maps\airlift_lighting::apply_lighting_pass_airlift( "airlift_nuke_flash" );
    maps\_utility::_id_27EF( 0.25, maps\airlift_lighting::apply_lighting_pass_airlift, "airlift_nuke" );
    setexpfog( 0, 17000, 0.678352, 0.498765, 0.372533, 1, 0, 0.5 );
    thread nuke_shockwave_blur();
    wait 1;
    thread nuke_earthquake();
    maps\_utility::_id_27EF( 2.3, ::nuke_chopper_crash, "nuke_cobra_04" );
    maps\_utility::_id_27EF( 2.5, ::nuke_chopper_crash, "nuke_cobra_02" );
    maps\_utility::_id_27EF( 2.8, ::nuke_chopper_crash, "nuke_seaknight_01" );
    maps\_utility::_id_27EF( 3.3, ::nuke_chopper_crash, "nuke_cobra_03" );
    maps\_utility::_id_27EF( 2.9, ::nuke_chopper_crash, "nuke_cobra_01" );
    maps\_utility::_id_27EF( 4.5, ::nuke_chopper_crash, "nuke_cobra_05" );
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "nuke_seaknight_02" );
    var_0 delete();
    wait 1;
    common_scripts\utility::_id_383F( "nuke_flattens_trees" );
    wait 2;
    common_scripts\utility::_id_383F( "shockwave_about_to_hit_player" );
    wait 2;
    common_scripts\utility::_id_383F( "nuke_shockwave_hits" );
    soundscripts\_snd::_id_870C( "aud_add_nuke_heli_spin_mix" );
    level.playercardbackground playrumblelooponentity( "tank_rumble" );
    thread nuke_shockwave_blur();
    maps\airlift_lighting::apply_lighting_pass_airlift( "airlift_nuke_wavehit" );
    level.seaknight.yawspeed = 400;
    level.seaknight.yawaccel = 100;
    level.seaknight thread nuke_seaknight_spin();
    level.seaknight thread maps\_utility::_id_69C4( "ch46_helicopter_dying_loop" );
    level.playercardbackground thread common_scripts\utility::_id_6975( "airlift_heli_alarm_loop" );
    level.playercardbackground thread maps\_utility::_id_69C4( "airlift_ch46_nuke_exp" );
    common_scripts\utility::_id_383F( "shockwave_hit_player" );
    playfxontag( common_scripts\utility::_id_3FA8( "airlift_nuke_dirt_helico" ), level.seaknight, "tag_origin" );
    wait 7;
    var_1 = getent( "nuke_crash", "targetname" );
    level.seaknight maps\_utility::_id_9CB3();
    level.seaknight setgoalpos( var_1.origin, 0 );
    wait 6.5;
    wait 1.5;
    level.playercardbackground thread common_scripts\utility::_id_69C2( "airlift_ch46_nuke_crash" );
    wait 0.5;
    level notify( "wibble_heli_check_stop" );
    soundscripts\_snd::_id_870C( "aud_add_nuke_blackscreen_mix" );
    var_2 = maps\jake_tools::_id_23D0( "black", 1 );
    level.playercardbackground freezecontrols( 1 );
    musicstop();
    ambientstop();
    level.playercardbackground notify( "stop soundairlift_heli_alarm_loop" );
    level.seaknight stopsounds();
    level.playercardbackground stopsounds();
    level.playercardbackground stoprumble( "tank_rumble" );
    wait 0.1;
    level.seaknight delete();
    wait 4;
    maps\_utility::_id_60D6();
}

nuke_earthquake()
{
    wait 1;

    while ( !common_scripts\utility::_id_382E( "shockwave_hit_player" ) )
    {
        earthquake( 0.08, 0.05, level.playercardbackground.origin, 80000 );
        wait 0.05;
    }

    earthquake( 0.5, 1, level.playercardbackground.origin, 80000 );

    for (;;)
    {
        earthquake( 0.25, 0.05, level.playercardbackground.origin, 80000 );
        wait 0.05;
    }
}

nuke_sunlight()
{
    level.defaultsun = getmapsunlight();
    level.nukesun = ( 3.11, 2.05, 1.67 );
    maps\_utility::_id_8FB6( level.defaultsun, level.nukesun, 2 );
    wait 1;
    thread maps\_utility::_id_8FB6( level.nukesun, level.defaultsun, 2 );
}

nuke_shockwave_blur()
{
    earthquake( 0.3, 0.5, level.playercardbackground.origin, 80000 );
    setblur( 3, 0.1 );
    wait 1;
    setblur( 0, 0.5 );
}

nuke_seaknight_spin()
{
    self setturningability( 1 );
    self endon( "stop_rotate" );

    while ( isdefined( self ) )
    {
        self setyawspeed( level.seaknight.yawspeed, level.seaknight.yawaccel );
        self settargetyaw( self.angles[1] + 150 );
        wait 0.1;
    }
}

nuke_chopper_crash( var_0 )
{
    var_1 = maps\_vehicle::get_vehicle_from_targetname( var_0 );
    var_1 notify( "crash" );
}

nuke_choppers_think()
{
    self endon( "death" );
    self notify( "stop_default_behavior" );

    if ( getdvar( "debug_airlift" ) == "1" )
        thread maps\jake_tools::_id_6FA6( self._id_9D45.teambalanced, undefined, 3.5, 100 );

    self waittill( "crash" );
    var_0 = 0;

    if ( maps\_vehicle::vehicle_spawner_has_targetname( self, "nuke_cobra_05" ) )
        var_0 = 1;

    thread nuke_chopper_spin_and_fx( var_0 );
    wait 6;
    self notify( "stop spin" );
    self delete();
}

nuke_chopper_spin_and_fx( var_0 )
{
    self endon( "death" );
    self endon( "stop spin" );
    self setmaxpitchroll( 100, 200 );
    self setturningability( 1 );
    var_1 = 1400;
    var_2 = 200;
    var_3 = undefined;
    var_4 = undefined;

    if ( randomint( 100 ) > 50 )
        var_4 = 1;

    if ( isdefined( var_0 ) && var_0 == 1 )
        playfxontag( common_scripts\utility::_id_3FA8( "heli_aerial_explosion_large" ), self, "tag_engine_left" );
    else
        playfxontag( common_scripts\utility::_id_3FA8( "nuked_chopper_explosion" ), self, "tag_engine_left" );

    while ( isdefined( self ) )
    {
        if ( isdefined( var_4 ) )
            var_3 = self.angles[1] + 100;
        else
            var_3 = self.angles[1] - 100;

        self setyawspeed( var_1, var_2 );
        self settargetyaw( var_3 );

        if ( isdefined( var_0 ) && var_0 == 1 )
            playfxontag( common_scripts\utility::_id_3FA8( "nuked_chopper_smoke_trail" ), self, "tag_engine_left" );
        else
            playfxontag( common_scripts\utility::_id_3FA8( "nuked_chopper_smoke_trail" ), self, "tag_engine_left" );

        wait 0.1;
    }
}

seaknight_speed_up()
{
    common_scripts\utility::_id_384A( "seaknightStartingNukePath" );
    var_0 = 80;

    while ( !common_scripts\utility::_id_382E( "nuke_shockwave_hits" ) )
    {
        var_0 += 5;
        level.seaknight vehicle_setspeed( var_0 );

        if ( !common_scripts\utility::_id_382E( "nuke_shockwave_hits" ) )
            wait 0.5;
    }
}

obj_plaza_clear()
{
    common_scripts\utility::_id_384A( "obj_plaza_clear_given" );
    var_0 = 2;
    var_1 = getent( "obj_rescue_pilot", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_PLAZA_CLEAR", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_plaza_clear_complete" );
    objective_state( var_0, "done" );
}

obj_extract_team()
{
    common_scripts\utility::_id_384A( "obj_extract_team_given" );
    var_0 = 4;
    var_1 = getent( "obj_extract_team", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_EXTRACT_TEAM", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_extract_team_complete" );
    objective_state( var_0, "done" );
}

obj_extract_to_lz()
{
    common_scripts\utility::_id_384A( "obj_extract_to_lz_given" );
    var_0 = 6;
    var_1 = getent( "obj_lz_handhold", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_EXTRACT_TO_LZ", var_1.origin );
    objective_current( var_0 );
    var_1 = getent( "obj_extract_to_lz", "targetname" );
    common_scripts\utility::_id_3852( "obj_extract_to_lz_complete", "seaknight_back_at_smoketown_lz" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::_id_384A( "obj_extract_to_lz_complete" );
    common_scripts\utility::_id_384A( "seaknight_back_at_smoketown_lz" );
    objective_state( var_0, "done" );
}

obj_get_on_mark_19()
{
    common_scripts\utility::_id_384A( "obj_get_on_mark_19_given" );
    var_0 = 7;
    wait 0.05;
    var_1 = getent( "trigger_seaknight_gun", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_GET_ON_MARK_19", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_get_on_mark_19_complete" );
    objective_state( var_0, "done" );
}

obj_rescue_pilot()
{
    common_scripts\utility::_id_384A( "obj_rescue_pilot_given" );
    var_0 = 8;
    var_1 = getent( "obj_rescue_pilot", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_RESCUE_PILOT", var_1.origin );
    objective_current( var_0 );
    common_scripts\_exploder::_id_3528( 989 );
    common_scripts\utility::_id_384A( "obj_rescue_pilot_complete" );
    objective_state( var_0, "done" );
}

obj_return_pilot()
{
    common_scripts\utility::_id_384A( "obj_return_pilot_given" );
    var_0 = 9;
    var_1 = getent( "obj_rescue_pilot_putdown", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_RETURN_PILOT", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_return_pilot_complete" );
    objective_state( var_0, "done" );
}

obj_safe_distance()
{
    common_scripts\utility::_id_384A( "obj_safe_distance_given" );
    var_0 = 10;
    var_1 = getent( "obj_rescue_pilot", "targetname" );
    objective_add( var_0, "active", &"AIRLIFT_OBJ_SAFE_DISTANCE", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_safe_distance_complete" );
    objective_state( var_0, "done" );
}

aa_vehicles()
{

}

vehicles_delete_all( var_0 )
{
    var_1 = [];

    switch ( var_0 )
    {
        case "cobras":
            var_1 = level.cobras;
            break;
        case "t72s":
            var_1 = level.t72s;
            break;
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

vehicle_delete_thread()
{
    self endon( "death" );

    if ( isdefined( self.script_parentname ) && getsubstr( self.script_parentname, 0, 10 ) == "deleteFlag" )
    {
        var_0 = getsubstr( self.script_parentname, 11 );
        common_scripts\utility::_id_384A( var_0 );

        for (;;)
        {
            wait 0.05;
            var_1 = level.playercardbackground geteye();
            var_2 = common_scripts\utility::_id_A347( var_1, level.playercardbackground getplayerangles(), self.origin, level._id_2235["25"] );

            if ( !var_2 )
            {
                self notify( "death" );
                break;
            }
            else
                wait(randomfloatrange( 1, 2.2 ));
        }
    }
}

vehicle_think()
{
    self waittill( "spawned", var_0 );

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "playerTarget" )
        level.cobratargetexcluders[level.cobratargetexcluders.size] = var_0;

    if ( maps\_vehicle::vehicle_spawner_has_targetname( var_0, "seaknightPlayer" ) )
        return;

    if ( isdefined( var_0.visionsetnaked ) && var_0.visionsetnaked == "flare" )
        return;

    if ( isdefined( var_0.visionsetnaked ) && var_0.visionsetnaked == "nuke" )
        return;

    if ( self._id_7AEF == "axis" )
    {
        var_0 thread vehicle_death_think();
        level.vehicles_axis = common_scripts\utility::_id_0CDA( level.vehicles_axis, var_0 );
    }
    else if ( self._id_7AEF == "allies" )
        level.vehicles_allies = common_scripts\utility::_id_0CDA( level.vehicles_allies, var_0 );
    else
    {

    }

    var_0 thread vehicle_damage_think();
    var_0 thread vehicle_delete_thread();

    if ( isdefined( var_0.script_parentname ) && var_0.script_parentname == "nuke_choppers" )
        var_0 thread nuke_choppers_think();
    else
    {
        switch ( var_0.visionsetnaked )
        {
            case "zpu_antiair":
                var_0 thread vehicle_zpu_think();
                break;
            case "m1a1":
                var_0 thread vehicle_m1a1_think();
                break;
            case "bmp":
                var_0 thread vehicle_bmp_think();
                break;
            case "t72":
                var_0 thread vehicle_t72_think();
                level.t72s = common_scripts\utility::_id_0CDA( level.t72s, var_0 );
                break;
            case "cobra":
                var_0 thread vehicle_cobra_think();
                level.cobras = common_scripts\utility::_id_0CDA( level.cobras, var_0 );
                break;
            case "mig29":
                break;
            case "seaknight_airlift":
                break;
        }
    }
}

vehicle_heli_deletepath( var_0 )
{
    maps\_utility::_id_9CB3();
    thread maps\_utility::_id_9CBF( var_0, 0 );
    var_1 = var_0 maps\_utility::_id_3DB1( "ent" );
    var_1 waittill( "trigger", var_2 );
    maps\_utility::_id_9CB3();
    self delete();
}

vehicle_death_think()
{
    self waittill( "death", var_0, var_1 );

    if ( maps\_vehicle::vehicle_spawner_has_targetname( var_0, "seaknightPlayer" ) )
        maps\_utility::arcademode_kill( self.origin, "explosive", 150 );

    if ( isdefined( self ) )
        earthquake( 0.2, 2, self.origin, 8000 );
}

vehicle_zpu_think()
{
    self endon( "death" );
    self.defaulttargets = getentarray( self._id_7A26, "script_linkname" );
    thread vehicle_turret_think();
    thread vehicle_zpu_death();
}

vehicle_zpu_death()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
}

vehicle_heli_land( var_0 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_1 );
    self notify( "landing" );
    maps\_utility::_id_9CB3();
    self setgoalyaw( var_0.angles[1] );
    maps\_utility::_id_9CF5();
    self notify( "landed" );
}

vehicle_cobra_think()
{
    self endon( "death" );
    thread vehicle_cobra_default_weapons_think();
    var_0 = maps\_utility::_id_3DB1( "ent" );
    var_1 = 0;
    var_2 = 0;

    while ( isdefined( var_0 ) )
    {
        common_scripts\utility::_id_A069( "near_goal", "goal" );
        self._id_6EF5 = undefined;
        var_3 = undefined;

        if ( isdefined( self._id_251D ) && isdefined( self._id_251D._not_team ) )
            var_3 = getent( self._id_251D._not_team, "targetname" );

        if ( isdefined( var_3 ) && isdefined( var_3._id_7A26 ) )
            self._id_6EF5 = getent( var_3._id_7A26, "script_linkname" );

        if ( var_1 == 0 && isdefined( var_3 ) )
        {
            if ( var_3 == var_0 )
            {
                self notify( "near_default_path_end" );
                var_1 = 1;
            }
        }

        if ( var_1 == 1 && isdefined( self._id_251D ) && self._id_251D == var_0 )
        {
            self notify( "reached_default_path_end" );
            var_2 = 1;
        }

        if ( var_2 == 1 && var_1 == 1 )
        {
            var_1 = 0;
            var_2 = 0;
            self waittill( "start_dynamicpath" );
            var_0 = maps\_utility::_id_3DB1( "ent" );
        }
    }
}

vehicle_cobra_default_weapons_think()
{
    self endon( "death" );
    self endon( "stop_default_behavior" );
    self.turretfiring = 0;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self._id_6EF5 ) )
            var_0 = self._id_6EF5;
        else
            var_0 = maps\_helicopter_globals::_id_3F7F( 3000, level._id_2235["20"], 1, 1, 1, 1, level.cobratargetexcluders );

        if ( isdefined( var_0 ) && isdefined( var_0.code_classname ) )
        {
            switch ( var_0.code_classname )
            {
                case "script_origin":
                    var_1 = level._id_2235["15"];
                    var_2 = anglestoforward( self.angles );
                    var_3 = vectornormalize( var_0.origin - self.origin );
                    var_4 = vectordot( var_2, var_3 );

                    if ( var_4 <= var_1 )
                        continue;
                    else
                    {
                        var_5 = 1;
                        maps\_helicopter_globals::_id_37BA( "ffar_airlift_map_overwrite", var_5, var_0 );
                        wait(randomfloatrange( 2, 4.0 ));
                    }

                    continue;
                case "script_vehicle":
                    var_5 = 1;

                    if ( isdefined( level.smoketownmi17 ) && var_0 == level.smoketownmi17 )
                        maps\_helicopter_globals::_id_37BA( "ffar_airlift_nofx", var_5, var_0 );
                    else
                        maps\_helicopter_globals::_id_37BA( "ffar_airlift_map_overwrite", var_5, var_0 );

                    wait(randomfloatrange( 1, 4.0 ));
                    continue;
                default:
                    self setturrettargetent( var_0, ( 0.0, 0.0, 48.0 ) );

                    if ( !self.turretfiring )
                        thread firemg();

                    continue;
            }
        }
    }
}

firemg()
{
    self endon( "death" );
    var_0 = 0.1;
    var_1 = randomintrange( 8, 20 );
    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self fireweapon();
    }

    self.turretfiring = 0;
}

vehicle_m1a1_think()
{
    self endon( "death" );
    self endon( "stop_default_behavior" );

    if ( maps\_vehicle::vehicle_spawner_has_targetname( self, "tank_crusher" ) )
        return;

    thread vehicle_turret_scan();
}

vehicle_turret_scan()
{
    self endon( "death" );
    var_0 = randomint( 2 );

    while ( isdefined( self ) )
    {
        if ( randomint( 100 ) > 50 )
        {
            _id_9C84( 0 );
            wait(randomfloatrange( 2, 10 ));
        }

        if ( var_0 == 0 )
        {
            var_1 = randomintrange( 10, 30 );
            var_0 = 1;
        }
        else
        {
            var_1 = randomintrange( -30, -10 );
            var_0 = 0;
        }

        _id_9C84( var_1 );
        wait(randomfloatrange( 2, 10 ));
    }
}

_id_9C84( var_0 )
{
    self endon( "death" );
    var_1 = anglestoforward( self.angles + ( 0, var_0, 0 ) );
    var_1 = common_scripts\utility::vectorscale( var_1, 10000 );
    var_2 = spawn( "script_origin", self.origin + var_1 + ( 0.0, 0.0, 70.0 ) );
    var_2 linkto( self );
    self setturrettargetent( var_2 );
    common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 10 );
    var_2 delete();
}

vehicle_bmp_think()
{
    self setdeceleration( 50 );
    thread vehicle_turret_think();
}

vehicle_mg_off()
{
    thread maps\_vehicle::_id_5BD2();
}

vehicle_mg_on()
{
    thread maps\_vehicle::_id_5BD3();
}

vehicle_turret_think()
{
    self endon( "death" );
    vehicle_mg_off();
    self.turretfiring = 0;
    var_0 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( distancesquared( level.playercardbackground.origin, self.origin ) > level.cannonrangesquared )
            var_0 = undefined;
        else
            var_0 = level.playercardbackground;

        if ( isdefined( var_0 ) && var_0 == level.playercardbackground )
        {
            var_1 = 0;
            var_1 = sighttracepassed( self.origin, level.playercardbackground.origin + ( 0.0, 0.0, 150.0 ), 0, self );

            if ( !var_1 )
                var_0 = undefined;
        }

        if ( !isdefined( var_0 ) )
            var_0 = vehicle_get_target();

        var_2 = level._id_3BFE > 2;

        if ( isdefined( var_0 ) && isalive( var_0 ) )
        {
            if ( !var_2 )
            {
                var_3 = var_0.origin + ( 0.0, 0.0, 32.0 );
                self _meth_825d( var_3 );
            }
            else
                self setturrettargetent( var_0, ( 0.0, 0.0, 32.0 ) );

            var_4 = randomfloatrange( 2, 3 );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_4 );

            if ( isdefined( var_0 ) && var_0 == level.playercardbackground )
            {
                var_5 = level.playercardbackground geteye();
                var_6 = 0;

                if ( isdefined( level.seaknight ) )
                    var_6 = common_scripts\utility::_id_A347( var_5, level.seaknight.angles + ( 0.0, -90.0, 0.0 ), self.origin, level._id_2235["45"] );

                if ( var_6 )
                {
                    if ( getdvar( "debug_airlift" ) == "1" )
                        thread maps\jake_tools::_id_6FA6( "firing at player", undefined, 3.5, 100 );

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
                else if ( getdvar( "debug_airlift" ) == "1" )
                    self notify( "stop_3dprint" );
            }

            if ( isdefined( var_0 ) && var_0 != level.playercardbackground )
            {
                if ( !self.turretfiring )
                    thread vehicle_fire_main_cannon();
            }

            continue;
        }

        if ( var_2 )
            self clearturrettargetent();
    }
}

vehicle_get_target()
{
    var_0 = undefined;

    switch ( self.visionsetnaked )
    {
        case "zpu_antiair":
            self.defaulttargets = common_scripts\utility::_id_0CF5( self.defaulttargets );
            var_0 = self.defaulttargets[0];
            break;
        case "bmp":
            var_0 = maps\_helicopter_globals::_id_3F7F( level.cannonrange, level._id_2235["180"], 1, 1, 0, 1 );
            break;
    }

    if ( isdefined( var_0 ) )
        return var_0;
}

vehicle_fire_main_cannon()
{
    self endon( "death" );
    var_0 = undefined;
    var_1 = undefined;

    switch ( self.visionsetnaked )
    {
        case "zpu_antiair":
            var_0 = weaponfiretime( "bmp_turret" );
            var_1 = randomintrange( 8, 15 );
            break;
        case "bmp":
            var_0 = weaponfiretime( "bmp_turret" );
            var_1 = randomintrange( 3, 8 );
            break;
        default:
    }

    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self fireweapon( undefined, undefined, undefined, undefined, 1 );
    }

    self.turretfiring = 0;
}

vehicle_t72_think()
{
    self setdeceleration( 1 );
    thread maps\_vehicle::_id_5BD2();
    thread vehicle_turret_scan();
}

vehicle_damage_think()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
        wait 0.05;
        var_9 = vehicle_get_damage_type_and_attacker( var_6, var_2, var_3, self.visionsetnaked );

        if ( self._id_7AEF == "allies" )
        {
            if ( maps\_vehicle::vehicle_spawner_has_targetname( var_3, "seaknightPlayer" ) && isdefined( var_2 ) && var_2 > 150 )
                thread maps\_friendlyfire::_id_5CDD();
        }

        switch ( self.visionsetnaked )
        {
            case "mi17":
                if ( var_9 == "cobra_missile" )
                    var_1 = 1;

                break;
        }

        if ( var_1 == 1 )
            break;
    }

    thread _id_9CA1();
}

_id_9CA1()
{
    self notify( "death" );
}

vehicle_get_damage_type_and_attacker( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    if ( !isdefined( var_2 ) )
        return "unknown";

    var_4 = undefined;
    var_5 = undefined;

    if ( var_2 == level.playercardbackground )
        var_4 = "player";
    else if ( isdefined( var_2.code_classname ) && var_2.code_classname == "script_vehicle" )
    {
        switch ( var_2.visionsetnaked )
        {
            case "cobra":
                var_4 = "cobra";
        }
    }

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "mod_projectile":
        case "mod_projectile_splash":
            var_5 = "missile";
            break;
        case "mod_grenade":
        case "mod_grenade_splash":
            var_5 = "grenade";
            break;
        default:
            var_5 = undefined;
            break;
    }

    if ( !isdefined( var_4 ) )
        return undefined;
    else if ( !isdefined( var_5 ) )
        return undefined;
    else
        return var_4 + "_" + var_5;
}

vehicle_cobra_attack_pattern_think( var_0 )
{
    self endon( "death" );
    self notify( "starting_new_attack_pattern" );
    self endon( "starting_new_attack_pattern" );
    var_1 = getent( var_0, "script_noteworthy" );
    maps\_utility::_id_9CB3();
    thread maps\_utility::_id_9CBF( var_1, 0 );
    var_1 waittill( "trigger", var_2 );
}

vehicle_animated_seaknight_land( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0.origin + ( 0.0, 0.0, 100.0 ) );
    var_3 setmodel( "vehicle_ch46e" );
    var_3._id_0C72 = "seaknight";
    var_3 maps\_utility::_id_0D61();
    var_3 thread vehicle_seaknight_rotors();
    var_0 maps\_anim::_id_0BC7( var_3, "landing" );

    if ( isdefined( var_2 ) )
        var_3 thread vehicle_seaknight_unload( var_2 );

    wait 0.5;
    var_4 = spawn( "script_origin", var_0.origin );
    var_3 maps\_utility::_id_27EF( 15, ::seaknight_plaza_event, var_0 );
    var_3 maps\_utility::_id_27EF( 19, ::vehicle_canned_seaknight_fx, var_4, var_0 );
    var_0 maps\_anim::_id_0C24( var_3, "landing" );
    var_0 thread maps\_anim::_id_0BE1( var_3, "idle", undefined, "stop_idle" );
    var_3 notify( "unload_ai" );
    var_3 waittill( "all_ai_unloaded" );

    if ( isdefined( var_1 ) )
        common_scripts\utility::_id_384A( var_1 );

    wait 1;
    var_0 notify( "stop_idle" );
    var_0 thread maps\_anim::_id_0C24( var_3, "take_off" );
    wait 1.5;
    var_3 notify( "taking_off" );
    var_4 delete();
    var_3 waittillmatch( "single anim", "end" );
    var_3 delete();
}

seaknight_plaza_event( var_0 )
{
    if ( var_0.teambalanced == "seaknight_plaza_alt_landing" )
        thread maps\airlift_aud::aud_seaknight_audio_event( "scn_airlift_left_plaza_seaknight", 1.0, 0, 0, 1.0, 0 );
    else
        thread maps\airlift_aud::aud_seaknight_audio_event( "scn_airlift_right_plaza_seaknight", 1.0, 0, 0, 1.0, 0 );
}

vehicle_seaknight_rotors()
{
    self endon( "death" );
    var_0 = maps\_utility::_id_3EF5( "rotors" );
    var_1 = getanimlength( var_0 );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        self _meth_814d( var_0 );
        wait(var_1);
    }
}

vehicle_seaknight_fake_load( var_0, var_1 )
{
    common_scripts\utility::_id_0D13( var_0, ::vehicle_seaknight_fake_load_think, var_1 );

    while ( var_0.size > 0 )
    {
        wait 0.05;
        var_0 = maps\_utility::_id_0CFD( var_0 );
    }
}

vehicle_seaknight_fake_load_think( var_0 )
{
    maps\_utility::_id_2A74();
    self _meth_81a7( 1 );
    self _meth_81a9( var_0 );
    maps\jake_tools::_id_7F7F( var_0.rank );
    self waittill( "goal" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

vehicle_seaknight_idle_and_load( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1++;
        var_0[var_2] thread vehicle_seaknight_idle_and_load_think( var_1 );
    }
}

vehicle_seaknight_idle_and_load_think( var_0 )
{
    self endon( "death" );
    var_1 = "ch46_unload_" + var_0 + "_generic";
    var_2 = "ch46_load_" + var_0;
    self hide();
    maps\_utility::_id_08EB();
    self.ignoretriggers = 1;
    self.grenadeawareness = 0;
    self setthreatbiasgroup( "oblivious" );
    level.seaknight waittill( "show_loaders" );

    if ( isdefined( level.friendliesnames_ch46 ) )
    {
        var_3 = level.friendliesnames_ch46[var_0];

        if ( isdefined( var_3 ) )
            self.nearz = var_3;
    }

    level.seaknight waittill( "load" );
    level.seaknight maps\_anim::_id_0BCC( self, var_2, "tag_detach" );
    wait 1.4;
    self show();
    self notify( "stop_ch46_idle" );
    level.seaknight maps\_anim::_id_0BC9( self, var_2, "tag_detach" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

seaknight_crewchief_think( var_0 )
{
    self endon( "death" );
    self endon( "stop_default_behavior" );
    maps\_utility::_id_4462();
    self linkto( level.seaknight );
    thread maps\_anim::_id_0BE1( self, "crewchief_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
    level.seaknight waittill( "unload_ai" );
    self notify( "stop_idle_crewchief" );
    thread maps\_anim::_id_0BE1( self, "crewchief_getout_" + var_0, "tag_detach", "stop_idle_crewchief", level.seaknight );
    level.seaknight waittill( "all_ai_unloaded" );

    if ( var_0 == "smoketown" )
        common_scripts\utility::_id_384A( "player_exit_seaknight_smoketown" );
    else if ( var_0 == "cobrastreets" )
        common_scripts\utility::_id_384A( "player_exit_seaknight_cobrastreets" );

    self notify( "stop_idle_crewchief" );
    thread maps\_anim::_id_0BE1( self, "crewchief_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
    level.crewchief waittill( "player_returning_to_seaknight" );
    var_1 = 1;

    while ( distancesquared( level.playercardbackground.origin, level.crewchief.origin ) > level.crewchiefrangesquared )
    {
        var_2 = undefined;

        switch ( var_1 )
        {
            case 1:
                var_2 = "crewchief_getin_lookback";
                var_1++;
                break;
            case 2:
                var_2 = "crewchief_getin_quick";
                var_1++;
                break;
            case 3:
                var_2 = "crewchief_getin";
                var_1 = 1;
                break;
        }

        level.crewchief notify( "stop_idle_crewchief" );
        level.crewchief thread maps\_anim::_id_0BE1( level.crewchief, var_2, "tag_detach", "stop_idle_crewchief", level.seaknight );
        level.crewchief waittillmatch( "looping anim", "end" );
        self notify( "stop_idle_crewchief" );
        thread maps\_anim::_id_0BE1( self, "crewchief_idle", "tag_detach", "stop_idle_crewchief", level.seaknight );
        wait(randomfloatrange( 2, 5.5 ));
    }
}

vehicle_seaknight_unload( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = "generic";

    if ( isdefined( var_1 ) )
        var_1 thread seaknight_crewchief_think( var_2 );

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = "ch46_unload_" + var_3 + "_" + var_2;
        var_3++;
        var_0[var_4] thread vehicle_seaknight_unload_ai_think( var_5, self );
    }

    self waittill( "unload_ai" );

    if ( self == level.seaknight )
        thread maps\airlift_anim::seaknight_open_doors();

    var_6 = var_0;

    while ( var_6.size > 0 )
    {
        wait 0.05;

        for ( var_4 = 0; var_4 < var_6.size; var_4++ )
        {
            if ( isdefined( var_6[var_4].unloaded ) )
            {
                var_6[var_4].unloaded = undefined;
                var_6 = common_scripts\utility::_id_0CF6( var_6, var_6[var_4] );
            }
        }
    }

    self notify( "all_ai_unloaded" );
}

vehicle_seaknight_unload_ai_think( var_0, var_1 )
{
    self endon( "death" );
    self _meth_81ce( "crouch" );
    var_2 = undefined;

    if ( var_1 == level.seaknight )
        var_2 = "tag_door_rear";
    else
        var_2 = "tag_detach";

    self _meth_81ca( var_1 gettagorigin( var_2 ), var_1 gettagangles( var_2 ) );
    var_1 maps\_anim::_id_0BCC( self, var_0, "tag_detach" );
    self linkto( var_1, var_2 );
    var_1 waittill( "unload_ai" );
    thread maps\_utility::_id_69C4( "scn_airlift_foley_soliders_getout" );
    self show();
    var_1 maps\_anim::_id_0BC9( self, var_0, "tag_detach" );
    self unlink();
    self _meth_81aa( self.origin );
    self notify( "unloaded" );
    self.unloaded = 1;

    if ( common_scripts\utility::_id_8F55( var_0, "cobrastreets" ) != 1 )
        self _meth_8168( 1 );

    self _meth_81ce( "crouch", "stand", "prone" );
    self waittill( "stop_ch46_idle" );

    if ( common_scripts\utility::_id_8F55( var_0, "cobrastreets" ) != 1 )
    {
        wait 10;
        self _meth_8168( 0 );
    }
}

vehicle_canned_seaknight_fx( var_0, var_1 )
{
    self endon( "death" );
    self endon( "taking_off" );
    var_2 = undefined;

    if ( var_1.teambalanced == "seaknight_plaza_alt_landing2" )
        var_2 = ( -240.0, 0.0, 0.0 );
    else
        var_2 = ( 0.0, 0.0, 0.0 );

    while ( isdefined( var_0 ) )
    {
        playfx( common_scripts\utility::_id_3FA8( "heli_dust_default" ), var_0.origin + var_2 );
        wait 0.1;
    }
}

aa_utility()
{

}

_id_6AC6()
{
    level.playercardbackground waittill( "death" );

    if ( !level.onmark19 )
        return;

    level.seaknight maps\_utility::_id_5699( level.playercardbackground, "tag_player", 0.05, 0.5, 90, 90, 90, 90 );
}

rescue_timer( var_0 )
{
    kill_timer();
    level endon( "pilot_put_down_in_seaknight" );
    level endon( "kill_timer" );
    level._id_4AFE = 20;
    level._id_9373 = maps\_hud_util::_id_3D17( undefined, undefined, undefined, undefined, var_0 );
    level._id_9373 setpulsefx( 30, 900000, 700 );
    level._id_9373._id_92B2.land = &"AIRLIFT_TIME_REMAINING";
    level._id_9373 settenthstimer( var_0 );
    thread timer_tick();
    wait(var_0);
    maps\_hud_util::destroy_countdown_hud( level._id_9373 );
    level thread mission_failed_out_of_time();
}

timer_tick()
{
    level endon( "kill_timer" );

    for (;;)
    {
        wait 1;
        level.playercardbackground thread maps\_utility::_id_69C4( "countdown_beep" );
    }
}

mission_failed_out_of_time()
{
    level.playercardbackground endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    soundscripts\_snd::_id_870C( "aud_add_failure_mix" );
    musicstop( 1 );
    setdvar( "ui_deadquote", &"AIRLIFT_RAN_OUT_OF_TIME" );
    maps\_utility::_id_5CDF();
    level notify( "kill_timer" );
}

kill_timer()
{
    level notify( "kill_timer" );

    if ( isdefined( level._id_9373 ) )
        maps\_hud_util::destroy_countdown_hud( level._id_9373 );
}

nuke_trees()
{
    var_0 = 2.5;
    var_1 = getentarray( "nuke_trees", "targetname" );
    var_2 = getent( "nuke_origin", "targetname" );
    var_3 = [];
    var_3 = var_1;
    var_4 = common_scripts\utility::_id_3F91( var_2.origin, var_3 );
    var_5 = distancesquared( var_4.origin, var_2.origin );
    var_6 = var_0 / var_5;

    for ( var_7 = 0; var_7 < var_1.size; var_7++ )
    {
        var_8 = var_1[var_7];
        var_9 = distancesquared( var_8.origin, var_2.origin );
        var_8.fdelay = var_9 * var_6;
        var_10 = vectornormalize( var_8.origin - var_2.origin );
        var_11 = vectortoangles( var_10 );
        var_8.dummy = spawn( "script_origin", var_8.origin );
        var_8.dummy.angles = var_11;
        var_8 linkto( var_8.dummy );
    }

    common_scripts\utility::_id_384A( "nuke_flattens_trees" );
    common_scripts\utility::_id_0D13( var_1, ::nuke_tree_fall );
}

nuke_tree_fall()
{
    wait(self.fdelay);
    var_0 = 2;
    var_1 = self.dummy.angles;
    var_1 += ( 80.0, 0.0, 0.0 );
    self.dummy rotateto( var_1, var_0, var_0 / 2, var_0 / 2 );
}

nuke_exploders_think()
{
    var_0 = self.fxexplodernum;
    wait(self.fdelay);
    wait 1;
    self notify( "trigger" );
    common_scripts\_exploder::_id_3528( var_0 );
}

carrying_hint()
{
    if ( getdvarint( "limited_mode" ) )
        return;

    common_scripts\utility::_id_384A( "pilot_taken_from_cockpit" );
    level endon( "obj_return_pilot_complete" );
    level thread player_mashing_buttons();
    level thread carrying_hint_cleanup();
    wait 3;
    var_0 = 0;

    while ( !common_scripts\utility::_id_382E( "obj_return_pilot_complete" ) )
    {
        level waittill( "player_mashing_buttons" );

        if ( !var_0 )
        {
            var_0 = 1;
            thread maps\_utility::_id_48B0( &"AIRLIFT_HINT_CARRYING_PILOT", 3 );
            wait 5;
            var_0 = 0;
        }
    }
}

carrying_hint_cleanup()
{
    common_scripts\utility::_id_384A( "obj_return_pilot_complete" );
    thread maps\_utility::_id_48CB();
}

player_mashing_buttons()
{
    level endon( "obj_return_pilot_complete" );

    while ( !common_scripts\utility::_id_382E( "obj_return_pilot_complete" ) )
    {
        if ( level.playercardbackground attackbuttonpressed() || level.playercardbackground usebuttonpressed() || level.playercardbackground buttonpressed( "BUTTON_A" ) || level.playercardbackground buttonpressed( "BUTTON_B" ) || level.playercardbackground buttonpressed( "BUTTON_Y" ) )
            level notify( "player_mashing_buttons" );

        wait 0.05;
    }
}

fx_management()
{
    level.fxintro = [];
    level.fxplazatown = [];
    level.fxsmoketown = [];
    level.fxcobrastreets = [];
    level.fxtowerexploders = maps\_utility::_id_3FA9( "building_collapse_nuke" );
    var_0 = getent( "fx_volume_intro", "targetname" );
    var_1 = getent( "fx_volume_plazatown", "targetname" );
    var_2 = getent( "fx_volume_smoketown", "targetname" );
    var_3 = getent( "fx_volume_cobrastreets", "targetname" );
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
    {
        var_6 = level._id_2417[var_5];
        var_4.origin = var_6.v["origin"];

        if ( var_4 istouching( var_0 ) )
        {
            level.fxintro[level.fxintro.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_1 ) )
        {
            level.fxplazatown[level.fxplazatown.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_2 ) )
        {
            level.fxsmoketown[level.fxsmoketown.size] = var_6;
            continue;
        }

        if ( var_4 istouching( var_3 ) )
        {
            level.fxcobrastreets[level.fxcobrastreets.size] = var_6;
            continue;
        }
    }

    var_4 delete();
}

destructibles_think()
{
    switch ( self.destructible_type )
    {
        case "vehicle_tanker_truck":
            thread tanker_gas_station_think();
            self waittill( "destroyed" );
            thread maps\_utility::_id_69C4( "scn_airlift_gas_station_explosion" );
            earthquake( 0.4, 2, self.origin, 8000 );
            var_0 = spawn( "script_origin", self.origin + ( 0.0, 0.0, 0.0 ) );
            var_0.angles = self.angles;
            var_1 = spawnfx( common_scripts\utility::_id_3FA8( "tanker_fire" ), var_0.origin );
            triggerfx( var_1 );
            common_scripts\utility::_id_384A( "cobra_hit" );
            var_1 delete();

            if ( isdefined( level.gasstationtrigger ) && isdefined( level.seaknight ) )
                level.gasstationtrigger notify( "damage", 1000, level.seaknight, undefined, undefined, "mod_projectile" );

            break;
    }
}

badplace_volume_think()
{
    if ( self.script_parentname == "axis" || self.script_parentname == "allies" )
        badplace_brush( self getentitynumber(), 0, self, self.script_parentname );
    else
    {

    }
}

rpg_fake( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = getent( var_1[var_2]._not_team, "targetname" );
        magicbullet( "rpg", var_1[var_2].origin, var_3.origin );
        wait(randomfloatrange( 1, 2.5 ));
    }
}

disable_color_trigs()
{
    common_scripts\utility::_id_0D13( level.acolornodetriggers, common_scripts\utility::_id_97CC );
}

waittill_trigger_seaknight()
{
    level endon( "stop_seaknight_player_monitor" );
    var_0 = getent( "trigger_seaknight", "targetname" );
    var_0 waittill( "trigger" );
}

waittill_trigger_inside_seaknight()
{
    level endon( "stop_seaknight_player_monitor" );
    var_0 = getent( "trigger_inside_seaknight", "targetname" );
    var_0 waittill( "trigger" );
}

waittill_trigger_seaknight_gun()
{
    thread seaknight_disable_lean_when_mounting();
    var_0 = getent( "trigger_seaknight_gun", "targetname" );
    var_0 waittill( "trigger" );
    level.playercardbackground playsound( "scn_airlift_mounting_gun_plr_foley" );
}

initdifficulty()
{
    level.invulnerabletimeseaknight = undefined;
    level.invulnerabletimedefault = level.playercardbackground.deathinvulnerabletime;

    switch ( level._id_3BFE )
    {
        case 0:
            level.invulnerabletimeseaknight = level.invulnerabletimedefault;
            break;
        case 1:
            level.invulnerabletimeseaknight = level.invulnerabletimedefault;
            break;
        case 2:
            level.invulnerabletimeseaknight = level.invulnerabletimedefault;
            break;
        case 3:
            level.invulnerabletimeseaknight = 600;
            break;
    }

    common_scripts\utility::_id_383F( "difficulty_initialized" );
}

player_invulnerable_time_tweak()
{
    level.playercardbackground.deathinvulnerabletime = level.invulnerabletimeseaknight;
    level waittill( "player_off_turret" );
    level.playercardbackground.deathinvulnerabletime = level.invulnerabletimedefault;
}

spawn_trigger_dummy( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1._id_7A26, "script_linkname" );
    var_2 notify( "trigger", level.playercardbackground );
}

deleteweapons()
{
    if ( isdefined( self ) )
        self delete();
}

ai_player_seek()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = distance( self.origin, level.playercardbackground.origin );

    for (;;)
    {
        wait 2;
        self.goalradius = var_0;
        self _meth_81ab( level.playercardbackground );
        var_0 -= 175;

        if ( var_0 < 512 )
        {
            var_0 = 512;
            return;
        }
    }
}

ai_fastrope_and_die()
{
    self endon( "death" );
    self.ignoretriggers = 1;

    while ( !isdefined( self._id_750E ) )
        wait 0.05;

    while ( isdefined( self._id_750E ) )
        wait 0.05;

    self delete();
}

ai_low_engage_dist_think()
{
    self endon( "death" );
    var_0 = self.pathlookaheaddist;
    var_1 = self.pathrandompercent;
    self.goalradius = 8;
    self.pathlookaheaddist = 0;
    self.pathrandompercent = 0;
    self.index = 1;
    self waittill( "goal" );
    self.pathlookaheaddist = var_0;
    self.pathrandompercent = var_1;
    self.index = 0;
}

_id_3F4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "mod_explosive":
        case "mod_explosive_splash":
            return "c4";
        case "mod_projectile":
        case "mod_projectile_splash":
            return "rocket";
        case "mod_grenade":
        case "mod_grenade_splash":
            return "grenade";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

initprecache()
{
    precachemodel( "projectile_cbu97_clusterbomb" );
    precacheshader( "black" );
    precacheitem( "cobra_ffar_airlift_map_overwrite" );
    precacheitem( "cobra_FFAR_airlift_nofx" );
    precacheitem( "crash_missile_airlift" );
    precacheitem( "rpg_player" );
    precachemodel( "weapon_AT4" );
    precachemodel( "viewhands_player_usmc" );
    precachemodel( "worldbody_h1_usmc_desert" );
    precachemodel( "weapon_saw_MG_Setup" );
    precachemodel( "weapon_rpd_MG_Setup" );
    precachemodel( "vehicle_80s_sedan1_tankcrush_destroyed" );
    precachemodel( "h1_me_rooftop_tank_destroyed" );
    precachemodel( "h1_me_roof_sign_02_destroyed" );
    precachemodel( "h1_me_roof_sign_02_destroyed_var2" );
    precachemodel( "h1_me_roof_sign_02_destroyed_nosign" );
    precachemodel( "h1_me_roof_sign_02_destroyed2" );
    precachemodel( "com_water_tower_tank_destroyed" );
    precachemodel( "com_water_tower_base_destroyed" );
    precachestring( &"AIRLIFT_OBJ_PLAZA_CLEAR" );
    precachestring( &"AIRLIFT_OBJ_EXTRACT_TEAM" );
    precachestring( &"AIRLIFT_OBJ_EXTRACT_TO_LZ" );
    precachestring( &"AIRLIFT_OBJ_RESCUE_PILOT" );
    precachestring( &"AIRLIFT_OBJ_RETURN_PILOT" );
    precachestring( &"SCRIPT_PLATFORM_AIRLIFT_HINT_GETPILOT" );
    precachestring( &"AIRLIFT_TIME_REMAINING" );
    precachestring( &"AIRLIFT_RAN_OUT_OF_TIME" );
    precachestring( &"AIRLIFT_HINT_CARRYING_PILOT" );
    precachestring( &"SCRIPT_PLATFORM_AIRLIFT_HINT_PICKUP_PILOT" );
    precachestring( &"SCRIPT_PLATFORM_HINT_PILOT_PUTDOWN" );
    precacheshader( "white" );
    precacheshader( "black" );
    precacheshader( "h1_hud_temperature_border" );
    precacheshader( "h1_hud_temperature_blur" );
    precacheshader( "h1_hud_temperature_icon" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
}

seaknight_player_think( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    switch ( var_0 )
    {
        case "default":
            break;
        case "plazafly":
            var_1 = getent( "flightPathstart_plazafly", "targetname" );
            break;
        case "plaza":
            var_1 = getent( "flightPathstart_plaza", "targetname" );
            break;
        case "smoketown":
            var_1 = getent( "flightPathstart_smoketown", "targetname" );
            break;
        case "cobraflight":
            var_2 = getent( "player_start_cobraflight", "targetname" );
            var_1 = getent( "flightPathstart_cobraflight", "targetname" );
            break;
        case "cobrastreets":
            var_1 = getent( "flightPathstart_cobrastreets", "targetname" );
            break;
        case "nuke":
            var_2 = getnode( "player_start_nuke", "targetname" );
            var_1 = getent( "flightPathstart_cobrastreets", "targetname" );
            break;
    }

    if ( var_0 != "default" )
    {
        var_3 = maps\_utility::_id_4155( "seaknightPlayer" );
        var_3.origin = var_1.origin;
        var_3.angles = var_1.angles;
    }

    level.seaknight = maps\_vehicle::_id_8978( "seaknightPlayer" );
    thread maps\_vehicle::_id_427A( level.seaknight );
    level.seaknight seaknight_turret_think( var_0 );

    if ( var_0 != "default" )
    {
        level.seaknight maps\_utility::_id_9CB3();
        level.seaknight thread maps\_utility::_id_9CBF( var_1, 0 );
    }

    level.seaknight maps\airlift_anim::seaknight_turret_anim_init();
    level.seaknight setmaxpitchroll( 5, 10 );
    level.seaknight sethoverparams( 32, 10, 3 );
    level.seaknight maps\_vehicle::_id_4259();
    level.seaknight._id_0C72 = "seaknight";
    level.seaknight maps\_utility::_id_0D61();
    thread perf_prepare_seaknight_optimization();

    if ( isdefined( var_2 ) )
    {
        thread seaknight_player_dismount_gun();
        level waittill( "player_dismounted_from_gun" );
        level.playercardbackground enableinvulnerability();
        level.playercardbackground setorigin( var_2.origin );
        level.playercardbackground setplayerangles( var_2.angles );
        level.playercardbackground disableinvulnerability();
        level notify( "stop_seaknight_player_monitor" );
    }

    soundscripts\_snd::_id_870C( "aud_seaknight_sound_node_spawner" );
    level._id_4816 = [];
    level._id_4816[0] = level.seaknight;
    common_scripts\utility::_id_383F( "seaknight_set_up" );
}

exploder_trigs_mark19_think()
{
    self endon( "exploder_detonated" );
    var_0 = self.script_parentname;
    var_1 = 0;
    var_2 = undefined;

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "gas_station" )
        thread gas_station_trigger_think();

    while ( var_1 == 0 )
    {
        self waittill( "damage", var_3, var_4, var_5, var_6, var_7 );

        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_3 ) )
            continue;

        if ( !isdefined( var_7 ) )
            continue;

        var_7 = tolower( var_7 );

        if ( var_7 == "mod_projectile" || var_7 == "mod_projectile_splash" )
        {
            if ( maps\_vehicle::vehicle_spawner_has_targetname( var_4, "seaknightPlayer" ) && var_3 > 150 )
            {
                var_0 = maps\_utility::_id_8F53( var_0 );
                var_1 = 1;
                var_2 = "exploder_" + var_0 + "_detonated";
                level notify( var_2 );
                common_scripts\_exploder::_id_3528( var_0 );
                thread common_scripts\utility::_id_69C2( level._id_78BA["exploder"][var_0], self.origin );
                self notify( "exploder_detonated" );
            }
        }
    }
}

gas_station_trigger_think()
{
    level.gasstationtrigger = self;
    self waittill( "exploder_detonated" );
    level notify( "destroy_gas_station_tanker" );
}

tanker_gas_station_think()
{
    var_0 = getent( "exploder_gas_startion", "targetname" );

    if ( distance( self.origin, var_0.origin ) < 1000 )
    {
        level waittill( "destroy_gas_station_tanker" );
        self notify( "damage", 99999, level.seaknight, ( 4336.64, 676.0, -2670.0 ), ( -21.0, -1600.0, 245.0 ), "MOD_PROJECTILE", "", undefined );
        wait 0.05;
        self notify( "damage", 99999, level.seaknight, ( 4336.64, 676.0, -2670.0 ), ( -21.0, -1600.0, 245.0 ), "MOD_PROJECTILE", "", undefined );
    }
}

exploder_statue()
{
    var_0 = getent( "statue", "targetname" );
    level waittill( "exploder_100_detonated" );
    var_0 maps\_utility::_id_484D();
    thread common_scripts\utility::_id_69C2( "airlift_statue_collapse", var_0.origin );
}

exploder_statue_old()
{
    var_0 = getent( "statue", "targetname" );
    var_1 = getent( "statue_fallen", "targetname" );
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_4 = getent( "statue_fall_fx", "targetname" );
    var_1 delete();
    level waittill( "exploder_100_detonated" );
    playfx( common_scripts\utility::_id_3FA8( "statue_smoke" ), var_0.origin );
    thread common_scripts\utility::_id_69C2( "airlift_statue_collapse", var_2 );
    var_5 = 2;
    var_6 = 2;
    var_0 moveto( var_2, var_6, var_6 );
    var_0 rotateto( var_3, var_5, var_5 );
}
#using_animtree("vehicles");

seaknight_liftoff_anim()
{
    level.seaknight._id_0C72 = "seaknight";
    level.seaknight _meth_814d( %h1_ch46r_liftoff );
}

seaknight_turret_test()
{
    while ( !isdefined( level.cobrawingman ) )
        wait 0.05;

    var_0 = level.cobrawingman;
    var_1 = weaponfiretime( "seaknight_mark19" );

    for (;;)
    {
        var_2 = var_0.origin;
        self _meth_825d( var_2 );
        var_3 = randomfloatrange( 2, 3 );
        common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_3 );
        self fireweapon();
        wait 2;
    }
}

seaknight_turret_think( var_0 )
{
    level.playerinseaknight = 1;
    var_1 = "tag_player";
    var_2 = ( 15.0, 0.0, -10.0 );
    var_3 = ( 0.0, 0.0, 0.0 );
    level.tempturretorg = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.tempturretorg.angles = self.angles;
    level.tempturretorg linkto( self, var_1, var_2, var_3 );
    thread seaknight_player_mount_gun( undefined, var_0 == "default" );
}

seaknight_fire_turret()
{
    level endon( "player_off_turret" );

    if ( isdefined( level.playerview ) )
        level.playerview delete();

    level.playerview = maps\_utility::_id_88D1( "player_viewhands", self.origin );
    level.playerview linkto( self, "tag_barrel" );
    thread maps\_anim::_id_0BE1( level.playerview, "turret_idle_anim", "tag_barrel" );
    var_0 = weaponfiretime( "seaknight_mark19" );

    for (;;)
    {
        self waittill( "turret_fire" );

        if ( common_scripts\utility::_id_382E( "mk19_turret_firing_enabled" ) )
        {
            self fireweapon();
            thread maps\airlift_anim::seaknight_turret_anim();
            thread maps\_anim::_id_0C24( level.playerview, "turret_fire_anim", "tag_barrel" );
            earthquake( 0.25, 0.13, level.playercardbackground.origin, 200 );

            if ( level.turretoverheat == 1 )
            {
                level.turret_heat_status += int( level.turret_heat_max / level.turret_heat_maxshots );
                level overheat_overheated( self );
                level thread overheat_hud_update();
            }
        }
    }
}

overheat_enable()
{
    level.turret_heat_status = 1;
    level.turretoverheat = 1;
    level thread overheat_hud();
}

overheat_disable()
{
    level.turretoverheat = 0;
    level notify( "disable_overheat" );
    level._id_781D = undefined;
    waitframe;

    if ( isdefined( level.overheat_bg ) )
        level.overheat_bg destroy();

    if ( isdefined( level.overheat_bg_distort ) )
        level.overheat_bg_distort destroy();

    if ( isdefined( level.overheat_icon ) )
        level.overheat_icon destroy();

    if ( isdefined( level.overheat_status ) )
        level.overheat_status destroy();

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2 destroy();

    if ( isdefined( level.overheat_flashing ) )
        level.overheat_flashing destroy();
}

overheat_overheated( var_0 )
{
    level endon( "disable_overheat" );

    if ( level.turret_heat_status <= level.turret_heat_max )
        return;

    soundscripts\_snd::_id_870C( "aud_add_gun_overheat_mix" );
    level._id_781D = 0;
    level.playercardbackground thread maps\_utility::_id_69C4( "weap_mark19_overheat" );
    var_0 thread overheat_fx();
    level.overheat_flashing.alpha = 1;
    level.overheat_status.alpha = 0;
    level.overheat_status2.alpha = 0;
    level notify( "stop_overheat_drain" );
    level.turret_heat_status = level.turret_heat_max;
    thread overheat_hud_update();

    for ( var_1 = 0; var_1 < 4; var_1++ )
    {
        level.overheat_flashing fadeovertime( 0.5 );
        level.overheat_flashing.alpha = 0.5;
        wait 0.5;
        level.overheat_flashing fadeovertime( 0.5 );
        level.overheat_flashing.alpha = 1.0;
    }

    level.overheat_flashing fadeovertime( 0.5 );
    level.overheat_flashing.alpha = 0.0;
    level.overheat_status.alpha = 1;
    wait 0.5;
    thread overheat_hud_drain();
    wait 2;
    level._id_781D = undefined;
    var_0 notify( "stop_overheatfx" );
}

overheat_fx()
{
    level endon( "disable_overheat" );
    self endon( "stop_overheatfx" );

    for (;;)
    {
        playfxontag( common_scripts\utility::_id_3FA8( "turret_overheat_smoke" ), self, "tag_flash" );
        playfxontag( level._effect["mk19_seaknight_overheat_airlift"], self, "tag_flash", level.seaknight );
        wait 0.15;
    }
}

overheat_hud_update()
{
    level endon( "disable_overheat" );
    level notify( "stop_overheat_drain" );

    if ( level.turret_heat_status > 1 && isdefined( level.overheat_status.alpha ) )
        level.overheat_status.alpha = 1;

    if ( isdefined( level.overheat_status2 ) )
    {
        var_0 = int( level.turret_heat_status * level.overheat_hud_height_max / level.turret_heat_max );
        level.overheat_status2.alpha = 1;
        level.overheat_status2 setshader( "white", 10, var_0 );
        level.overheat_status scaleovertime( 0.05, 10, var_0 );
    }

    overheat_setcolor( level.turret_heat_status );
    wait 0.05;

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2.alpha = 0;

    if ( level.turret_heat_status < level.turret_heat_max )
        thread overheat_hud_drain();
}

overheat_setcolor( var_0, var_1 )
{
    level endon( "disable_overheat" );
    var_2 = [];
    var_2[0] = 1.0;
    var_2[1] = 0.9;
    var_2[2] = 0.0;
    var_3 = [];
    var_3[0] = 1.0;
    var_3[1] = 0.5;
    var_3[2] = 0.0;
    var_4 = [];
    var_4[0] = 0.9;
    var_4[1] = 0.16;
    var_4[2] = 0.0;
    var_5 = [];
    var_5[0] = var_2[0];
    var_5[1] = var_2[1];
    var_5[2] = var_2[2];
    var_6 = 0;
    var_7 = level.turret_heat_max / 2;
    var_8 = level.turret_heat_max;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;

    if ( var_0 > var_6 && var_0 <= var_7 )
    {
        var_9 = int( var_0 * 100 / var_7 );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_3[var_12] - var_2[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_2[var_12] + var_11 * var_9;
        }
    }
    else if ( var_0 > var_7 && var_0 <= var_8 )
    {
        var_9 = int( ( var_0 - var_7 ) * 100 / ( var_8 - var_7 ) );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_4[var_12] - var_3[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_3[var_12] + var_11 * var_9;
        }
    }

    if ( isdefined( var_1 ) )
        level.overheat_status fadeovertime( var_1 );

    level.overheat_status.color = ( var_5[0], var_5[1], var_5[2] );
    level.overheat_status2.color = ( var_5[0], var_5[1], var_5[2] );
}

overheat_hud_drain()
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_0 = 1.0;
    soundscripts\_snd::_id_870C( "aud_remove_gun_overheat_mix" );

    for (;;)
    {
        if ( level.turret_heat_status > 1 && isdefined( level.overheat_status.alpha ) )
            level.overheat_status.alpha = 1;

        var_1 = ( level.turret_heat_status - level.turret_cooldownrate ) * level.overheat_hud_height_max / level.turret_heat_max;
        thread overheat_status_rampdown( var_1, var_0 );

        if ( var_1 < 1 )
            var_1 = 1;

        level.overheat_status scaleovertime( var_0, 10, int( var_1 ) );
        overheat_setcolor( level.turret_heat_status, var_0 );
        wait(var_0);

        if ( level.turret_heat_status <= 1 )
            level.overheat_status.alpha = 0;
    }
}

overheat_status_rampdown( var_0, var_1 )
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_2 = 20 * var_1;
    var_3 = level.turret_heat_status - var_0;
    var_4 = var_3 / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        level.turret_heat_status -= var_4;

        if ( level.turret_heat_status < 1 )
        {
            level.turret_heat_status = 1;
            return;
        }

        wait 0.05;
    }
}

overheat_hud()
{
    level endon( "disable_overheat" );

    if ( !isdefined( level.overheat_bg ) )
    {
        level.overheat_bg = newhudelem();
        level.overheat_bg.alignx = "right";
        level.overheat_bg.aligny = "bottom";
        level.overheat_bg.hostquits = "right";
        level.overheat_bg.visionsetnight = "bottom";
        level.overheat_bg.xpmaxmultipliertimeplayed = -29;
        level.overheat_bg._id_0538 = -146;
        level.overheat_bg.alpha = 0.3;
        level.overheat_bg setshader( "h1_hud_temperature_border", 14, 114 );
        level.overheat_bg.space = 5;
        level.overheat_bg.hindlegstraceoffset = 1;
    }

    if ( !isdefined( level.overheat_bg_distort ) )
    {
        level.overheat_bg_distort = newhudelem();
        level.overheat_bg_distort.alignx = "right";
        level.overheat_bg_distort.aligny = "bottom";
        level.overheat_bg_distort.hostquits = "right";
        level.overheat_bg_distort.visionsetnight = "bottom";
        level.overheat_bg_distort.xpmaxmultipliertimeplayed = -29;
        level.overheat_bg_distort._id_0538 = -146;
        level.overheat_bg_distort.alpha = 0.9;
        level.overheat_bg_distort setshader( "h1_hud_temperature_blur", 14, 114 );
        level.overheat_bg_distort.space = 4;
        level.overheat_bg_distort.hindlegstraceoffset = 1;
    }

    if ( !isdefined( level.overheat_icon ) )
    {
        level.overheat_icon = newhudelem();
        level.overheat_icon.alignx = "right";
        level.overheat_icon.aligny = "bottom";
        level.overheat_icon.hostquits = "right";
        level.overheat_icon.visionsetnight = "bottom";
        level.overheat_icon.xpmaxmultipliertimeplayed = -26;
        level.overheat_icon._id_0538 = -126;
        level.overheat_icon setshader( "h1_hud_temperature_icon", 28, 28 );
        level.overheat_icon.space = 6;
        level.overheat_icon.hindlegstraceoffset = 1;
    }

    var_0 = -31;
    var_1 = -149.5;

    if ( !isdefined( level.overheat_status ) )
    {
        level.overheat_status = newhudelem();
        level.overheat_status.alignx = "right";
        level.overheat_status.aligny = "bottom";
        level.overheat_status.hostquits = "right";
        level.overheat_status.visionsetnight = "bottom";
        level.overheat_status.xpmaxmultipliertimeplayed = var_0;
        level.overheat_status._id_0538 = var_1;
        level.overheat_status setshader( "white", 10, 0 );
        level.overheat_status.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status.alpha = 0;
        level.overheat_status.space = 1;
        level.overheat_status.hindlegstraceoffset = 1;
    }

    if ( !isdefined( level.overheat_status2 ) )
    {
        level.overheat_status2 = newhudelem();
        level.overheat_status2.alignx = "right";
        level.overheat_status2.aligny = "bottom";
        level.overheat_status2.hostquits = "right";
        level.overheat_status2.visionsetnight = "bottom";
        level.overheat_status2.xpmaxmultipliertimeplayed = var_0;
        level.overheat_status2._id_0538 = var_1;
        level.overheat_status2 setshader( "white", 10, 1 );
        level.overheat_status2.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status2.alpha = 0;
        level.overheat_status2.space = 2;
        level.overheat_status2.hindlegstraceoffset = 1;
    }

    if ( !isdefined( level.overheat_flashing ) )
    {
        level.overheat_flashing = newhudelem();
        level.overheat_flashing.alignx = "right";
        level.overheat_flashing.aligny = "bottom";
        level.overheat_flashing.hostquits = "right";
        level.overheat_flashing.visionsetnight = "bottom";
        level.overheat_flashing.xpmaxmultipliertimeplayed = var_0;
        level.overheat_flashing._id_0538 = var_1;
        level.overheat_flashing setshader( "white", 10, level.overheat_hud_height_max );
        level.overheat_flashing.color = ( 0.8, 0.16, 0.0 );
        level.overheat_flashing.alpha = 0;
        level.overheat_flashing.space = 3;
        level.overheat_flashing.hindlegstraceoffset = 1;
    }
}

seaknight_player_lerp_to_gun( var_0 )
{
    var_1 = level.seaknight gettagorigin( "tag_player" );
    var_2 = level.seaknight gettagangles( "tag_player" );
    var_2 *= ( 1.0, 1.0, -1.0 );
    var_3 = level.playercardbackground.origin;
    var_4 = level.playercardbackground getvelocity();
    var_5 = length( var_4 );
    var_6 = ( 0.0, 0.0, 0.0 );

    if ( isdefined( var_0 ) && !var_0 )
    {
        level.playercardbackground dontinterpolate();
        var_7 = var_5 / 16.9;
        var_6 = vectornormalize( var_4 ) * var_7;
    }

    var_8 = spawn( "script_origin", var_3 );
    var_8.angles = level.playercardbackground getplayerangles();
    var_8.origin += var_6;
    level.playercardbackground playerlinkto( var_8, "", 1, 0, 0, 0, 0 );
    var_9 = gettime();
    var_10 = 80;
    var_11 = 250;
    var_12 = gettime() + var_11;

    for (;;)
    {
        var_13 = var_12 - gettime();

        if ( var_13 <= 0 )
            break;

        var_14 = maps\_shg_utility::_id_576C( var_13, var_11, 0, var_5, var_10 );

        if ( var_14 != 0 )
        {
            var_15 = distance( var_8.origin, var_1 );
            var_16 = var_15 / var_14;
            var_8 moveto( var_1, var_16, 0, 0 );
        }

        waittillframeend;
    }

    var_15 = distance( var_8.origin, var_1 );
    var_16 = var_15 / var_10;
    var_8 moveto( var_1, var_16, 0, 0 );
    var_8 rotateto( var_2, var_16, var_16 * 0.25, var_16 * 0.75 );
    wait(var_16 + 0.1);

    if ( isdefined( var_0 ) && !var_0 )
        level.playercardbackground dontinterpolate();
}

seaknight_player_mount_gun( var_0, var_1 )
{
    common_scripts\utility::_id_384A( "difficulty_initialized" );
    thread player_invulnerable_time_tweak();
    thread hud_hide( 1 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowcrouch( 0 );

    if ( isdefined( var_1 ) && var_1 )
        seaknight_player_intro_mount_gun();

    level.mortarmaxinterval = 1;
    level.mortar_max_dist = 4000;
    level.mortarwithinfov = level._id_2235["35"];
    level thread overheat_enable();
    level.onmark19 = 1;
    thread _id_843F();
    thread view_kick_change();

    if ( isdefined( var_0 ) )
    {
        level.playercardbackground disableweapons();
        seaknight_player_lerp_to_gun( isdefined( var_1 ) && var_1 );
    }

    level.seaknight useby( level.playercardbackground );
    level.seaknight thread seaknight_fire_turret();

    if ( !isdefined( var_1 ) || !var_1 )
    {
        var_2 = level.seaknight gettagangles( "tag_player" );
        level.playercardbackground setplayerangles( var_2 + ( 0.0, 0.0, 0.0 ) );
    }

    thread perf_optimize_seaknight_inflight();
}

seaknight_player_intro_mount_gun()
{
    level.playercardbackground disableweapons();
    wait 3;
    level.playerview = maps\_utility::_id_88D1( "player_viewhands", level.seaknight.origin );
    level.playerview hide();
    level.playerview linkto( level.seaknight, "tag_detach" );
    level.seaknight maps\_anim::_id_0BC7( level.playerview, "turret_intro_anim", "tag_detach" );
    level.playercardbackground playerlinktodelta( level.playerview, "tag_player", 1, 20, 20, 30, 50, 1 );
    level.playercardbackground dontinterpolate();
    level.playerview show();
    level.seaknight thread maps\airlift_anim::seaknight_turret_anim_intro();
    level.seaknight thread maps\_anim::_id_0C24( level.playerview, "turret_intro_anim", "tag_detach" );
    var_0 = 11;
    wait(var_0);
    common_scripts\utility::_id_383F( "reload_turret_start" );
    level.playercardbackground lerpviewangleclamp( 0.5, 0, 0, 0, 0, 0, 0 );
    wait(getanimlength( level.playerview maps\_utility::_id_3EF5( "turret_intro_anim" ) ) - var_0);
    level.seaknight thread maps\airlift_anim::seaknight_turret_anim_idle();
    level.playercardbackground dontinterpolate();
}

seaknight_disable_lean_when_mounting()
{
    level endon( "stop_seaknight_player_monitor" );
    var_0 = 0;

    for (;;)
    {
        if ( level.playerinseaknight != var_0 )
        {
            level.playercardbackground allowlean( !level.playerinseaknight );
            var_0 = level.playerinseaknight;
        }

        waittillframeend;
    }
}

seaknight_death_think()
{
    level endon( "player_off_turret" );
    level.playercardbackground waittill( "death" );
    level.seaknight thread common_scripts\utility::_id_6975( "airlift_heli_alarm_loop" );
    level.seaknight notify( "death" );
}

view_kick_change()
{
    var_0 = getdvar( "bg_viewKickScale" );
    var_1 = getdvar( "bg_viewKickMax" );
    var_2 = getdvar( "bg_viewKickMin" );
    var_3 = getdvar( "bg_viewKickRandom" );
    setsaveddvar( "bg_viewKickScale", 0.3 );
    setsaveddvar( "bg_viewKickMax", "20" );
    level waittill( "player_off_turret" );
    setsaveddvar( "bg_viewKickScale", var_0 );
    setsaveddvar( "bg_viewKickMax", var_1 );
    setsaveddvar( "bg_viewKickMin", var_2 );
    setsaveddvar( "bg_viewKickRandom", var_3 );
}

_id_843F()
{
    level endon( "player_off_turret" );

    for (;;)
    {
        level.seaknight waittill( "projectile_impact", var_0, var_1, var_2 );

        if ( getdvar( "ragdoll_deaths" ) == "1" )
            thread _id_8440( var_1 );

        wait 0.05;
    }
}

_id_8440( var_0 )
{
    wait 0.1;
    physicsexplosionsphere( var_0, level._id_6804, level._id_6804 / 2, level._id_6803 );
}

seaknight_player_dismount_gun()
{
    level.mortarmaxinterval = undefined;
    level.mortar_max_dist = undefined;
    level.mortarwithinfov = undefined;
    thread seaknight_player_monitor( 0 );
    thread perf_reset_seaknight_optimizations();

    if ( level.sk_godrays_reverse )
    {
        level.seaknight thread maps\_vehicle_code::_id_5748( "interior2 back2" );
        level.seaknight thread maps\_vehicle_code::_id_5746( "interior back" );
    }
    else
    {
        level.seaknight thread maps\_vehicle_code::_id_5748( "interior back" );
        level.seaknight thread maps\_vehicle_code::_id_5746( "interior2 back2" );
    }

    level.onmark19 = 0;
    var_0 = common_scripts\utility::_id_9294( common_scripts\utility::_id_382E( "seaknightLandingCobratown" ), "airlift_streets_rescue", "airlift_streets" );
    maps\airlift_lighting::apply_lighting_pass_airlift( var_0 );
    thread hud_hide( 0 );
    level notify( "player_off_turret" );
    level thread overheat_disable();
    level.seaknight useby( level.playercardbackground );
    level.playercardbackground unlink();
    level.playercardbackground playerlinktodelta( level.seaknight, "tag_player", 1, 50, 50, 30, 45 );
    wait 0.05;
    level.seaknight turret_reset();
    level.seaknight maps\_utility::_id_5696( "tag_turret_exit", 1, 0.9, 25, 25, 45, 0 );
    level notify( "delete_rpgGuy" );
    turn_on_lights( "gamescom_perf", "script_noteworthy" );
    level.playercardbackground unlink();

    if ( isdefined( level.playerview ) )
        level.playerview delete();

    level.playercardbackground enableweapons();
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowlean( 1 );
    thread seaknight_player_triggers();
    level notify( "player_dismounted_from_gun" );
}

turret_reset()
{
    var_0 = self gettagangles( "tag_player" );
    var_1 = ( var_0[0] - 40, var_0[1] + 59, var_0[2] );
    var_2 = anglestoforward( var_1 );
    var_3 = common_scripts\utility::vectorscale( var_2, 5000 );
    self _meth_825d( var_3 );
}

seaknight_player_triggers()
{
    var_0 = getent( "trigger_seaknight", "targetname" );
    var_0.origin = level.seaknight gettagorigin( "tag_door_rear" );
    var_1 = getent( "trigger_inside_seaknight", "targetname" );
    var_2 = anglestoforward( level.seaknight.angles );
    var_3 = var_1.rank + var_0.rank + 35;
    var_1.origin = level.seaknight gettagorigin( "tag_door_rear" ) + var_2 * var_3;
    level.trigger_seaknight_gun = getent( "trigger_seaknight_gun", "targetname" );
    level.trigger_seaknight_gun.origin = level.seaknight gettagorigin( "tag_turret_exit" );
    level.trigger_seaknight_gun common_scripts\utility::_id_97CC();
}

seaknight_player_monitor( var_0 )
{
    level endon( "stop_seaknight_player_monitor" );

    if ( var_0 )
        waittill_trigger_inside_seaknight();

    for (;;)
    {
        soundscripts\_snd::_id_870C( "set_ambient_helicopter" );
        level.playerinseaknight = 1;
        waittill_trigger_seaknight();
        soundscripts\_snd::_id_870C( "player_outside_seaknight" );
        level.playerinseaknight = 0;
        waittill_trigger_inside_seaknight();
    }
}

seaknight_door_open_sound()
{
    level.seaknight playsound( "seaknight_door_open" );
}

playerweapontempremove()
{
    var_0 = level.playercardbackground getweaponslist();
    var_1 = level.playercardbackground getweaponslistprimaries();

    if ( var_0.size > 0 )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            level.playercardbackground takeweapon( var_0[var_2] );
    }

    level.playercardbackground waittill( "restore_player_weapons" );

    if ( var_0.size > 0 )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            level.playercardbackground giveweapon( var_0[var_2] );
    }

    if ( isdefined( var_1[0] ) )
        level.playercardbackground switchtoweapon( var_1[0] );
}

hud_hide( var_0 )
{
    wait 0.05;

    if ( var_0 )
    {
        setsaveddvar( "ui_hidemap", 1 );
        setsaveddvar( "hud_showStance", "0" );
        setsaveddvar( "compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
        setsaveddvar( "actionSlotsHide", "1" );
    }
    else
    {
        setsaveddvar( "ui_hidemap", 0 );
        setsaveddvar( "hud_drawhud", "1" );
        setsaveddvar( "hud_showStance", "1" );
        setsaveddvar( "compass", "1" );
        setsaveddvar( "ammoCounterHide", "0" );
        setsaveddvar( "actionSlotsHide", "0" );
    }
}

flight_flags_think()
{
    var_0 = strtok( self._id_7A99, "_" );
    var_1 = var_0[0];
    var_2 = var_0[1];
    common_scripts\utility::_id_383D( var_2 );
    level endon( var_2 );

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( maps\_vehicle::vehicle_spawner_has_targetname( var_3, var_1 ) )
        {
            if ( getdvar( "debug_airlift" ) == "1" )
                thread maps\jake_tools::_id_6FA6( var_2, undefined, 5 );

            common_scripts\utility::_id_383F( var_2 );
        }
    }
}

ai_think( var_0 )
{
    if ( var_0.team == "axis" )
        var_0 thread ai_axis_think();

    if ( var_0.team == "allies" )
        var_0 thread ai_allies_think();
}

ai_allies_think()
{
    self._id_0C72 = "frnd";

    if ( !isdefined( self._id_58D7 ) )
        thread maps\_utility::_id_58D7();

    self.a._id_2B20 = 1;
}

ai_axis_think()
{
    self._id_0C72 = "hostile";
    thread ai_ragdoll();
}

ai_ragdoll( var_0 )
{
    self waittill( "death", var_1, var_2 );

    if ( !isdefined( var_1 ) )
        return;

    if ( maps\_vehicle::vehicle_spawner_has_targetname( var_1, "seaknightPlayer" ) && level.onmark19 == 1 )
    {
        self._id_85BA = 1;

        if ( isdefined( var_0 ) && var_0 == 1 && ( isdefined( self.team ) && self.team != "allies" ) )
            maps\_utility::arcademode_kill( self.origin, "explosive", 50 );
    }
}

ai_drone_think()
{
    self endon( "death" );
    thread ai_ragdoll( 1 );
    self endon( "stop_default_drone_behavior" );
    self waittill( "goal" );
    self delete();
}

ai_construction_spawner_think()
{
    switch ( level._id_3BFE )
    {
        case 0:
            self._id_7A07 = 0;
            break;
        case 1:
            if ( level.grenadetoggle == 0 )
            {
                self._id_7A07 = 0;
                level.grenadetoggle = 1;
            }
            else
                level.grenadetoggle = 0;

            break;
        case 2:
            break;
        case 3:
            break;
    }
}

spawn_pilots( var_0 )
{
    var_1 = "pilot_idle";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = maps\_utility::_id_2F29( var_0[var_2] );
        var_3 thread ai_pilots_think( var_1 );
        var_1 = "copilot_idle";
    }
}

ai_pilots_think( var_0 )
{
    self endon( "death" );
    maps\_vehicle_aianim::_id_297A( self, "weapon_" );
    self.ignoretriggers = 1;
    self.grenadeawareness = 0;
    self._id_0C72 = "drone";
    var_1 = undefined;

    if ( var_0 == "pilot_idle" )
        var_1 = "tag_driver";
    else
        var_1 = "tag_passenger";

    level.seaknight thread maps\_anim::_id_0BE1( self, var_0, var_1 );
    self linkto( level.seaknight );
    level waittill( "delete_pilots" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

player_attacks_from_seaknight( var_0 )
{
    return maps\_vehicle::vehicle_spawner_has_targetname( var_0, "seaknightPlayer" );
}

remove_enemiesgrenades_cobrastreets()
{
    level.playercardbackground endon( "death" );
    level endon( "pilot_taken_from_cockpit" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
            var_2.grenadeammo = 0;

        wait 2;
    }
}

animate_smoketown_crane()
{
    var_0 = getent( "crane_smoketown", "targetname" );
    var_0._id_0C72 = "crane";
    var_0 maps\_utility::_id_0D61();
    var_0 thread maps\_anim::_id_0BE1( var_0, "crane_idle" );
}

despawn_smoketown_crane()
{
    var_0 = getent( "crane_smoketown", "targetname" );
    var_0 delete();
    var_1 = getentarray( "crane_part_smoketown", "targetname" );
    maps\_utility::_id_0CE5( var_1 );
}

player_viewbody_animations_nukecrash()
{
    level.playerbodyview = maps\_utility::_id_88D1( "player_viewbody", level.seaknight.origin );
    level.playerbodyview linkto( level.seaknight, "tag_detach" );
    level.seaknight thread maps\_anim::_id_0BC7( level.playerbodyview, "player_nuke_crash", "tag_detach" );
    level.playerbodyview hide();
    common_scripts\utility::_id_384A( "nuke_explodes" );
    level.playercardbackground freezecontrols( 1 );
    level.seaknight thread maps\_anim::_id_0C24( level.playerbodyview, "player_nuke_crash", "tag_detach" );
    wait 0.25;
    level.playercardbackground lerpviewangleclamp( 0.5, 0.1, 0.2, 0, 0, 0, 0 );
    wait 0.25;
    level.playercardbackground playerlinktodelta( level.playerbodyview, "tag_player", 1, 0, 0, 0, 0, 1 );
    wait 0.15;
    level.playerbodyview show();
    wait 0.6;
    level.playercardbackground freezecontrols( 0 );
}

disablech46turretfire()
{
    common_scripts\utility::_id_3831( "mk19_turret_firing_enabled" );
}

enablech46turretfire()
{
    common_scripts\utility::_id_383F( "mk19_turret_firing_enabled" );
}

cobrastreets_ch46entrance_collision()
{
    var_0 = getent( "ch46_entrance_monsterclip", "targetname" );
    var_0 notsolid();
    var_0 connectpaths();
    common_scripts\utility::_id_384A( "player_putting_down_pilot" );
    var_0 solid();
    var_0 disconnectpaths();
}

smoketown_ch46entrance_collision()
{
    var_0 = getent( "ch46_entrance_playerclip", "targetname" );
    var_0 notsolid();
    common_scripts\utility::_id_384A( "smoketown_seaknight_leaves" );
    var_0 solid();
    wait 2.2;
    var_0 notsolid();
}

falling_crane()
{
    self endon( "cranedestroyed" );
    var_0 = getent( "falling_crane", "targetname" );
    var_0 setcandamage( 1 );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2 );

        if ( 1 )
        {
            thread falling_crane_fx();
            var_0._id_0C72 = "crane";
            var_0 maps\_utility::_id_0D61();
            var_0 maps\_anim::_id_0C24( var_0, "crane_fall" );
            self notify( "cranedestroyed" );
        }
    }
}

falling_crane_fx()
{
    wait 8.9;
    common_scripts\_exploder::_id_3528( 129 );
}

rpgguy_think()
{
    self endon( "death" );
    level waittill( "delete_rpgGuy" );

    if ( isdefined( self ) )
        self delete();
}

bmp_play_stopping_anim()
{
    var_0 = getvehiclenode( "bmp_play_stopping_anim", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 0.25;
    var_1 = maps\_vehicle::get_vehicle_from_targetname( "bmp_near_gaz_station" );
    var_1._id_0C72 = "bmp";
    var_2 = var_1 maps\_utility::_id_3EF5( "stopping" );
    var_1 _meth_814d( var_2 );
}

turn_off_lights( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    foreach ( var_4 in var_2 )
        var_4 dynamic_light_on_off( 0 );
}

turn_on_lights( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    foreach ( var_4 in var_2 )
        var_4 dynamic_light_on_off( 1 );
}

dynamic_light_on_off( var_0 )
{
    var_1 = 3.14159;

    if ( !isdefined( self._id_4E9E ) )
        self._id_4E9E = self getlightintensity();

    if ( !isdefined( self._radius ) )
        self._radius = self getlightradius();

    if ( !isdefined( self._id_39FD ) )
    {
        var_2 = self getlightfovouter();
        self._id_39FD = 180 * var_2 / var_1;
    }

    if ( !isdefined( self._id_39FA ) )
    {
        var_2 = self getlightfovinner();
        self._id_39FA = 180 * var_2 / var_1;
    }

    if ( var_0 )
    {
        self setlightintensity( self._id_4E9E );
        self setlightradius( self._radius );
        self setlightfovrange( self._id_39FD, self._id_39FA );
    }
    else
    {
        self setlightintensity( 1 );
        self setlightradius( 12 );
        self setlightfovrange( 6, 0 );
    }
}

perf_prepare_seaknight_optimization()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );
    level.ch46_hidden_parts = [];
    level.ch46_hidden_parts[0] = "door_bottom";
    level.ch46_hidden_parts[1] = "door_top";
    level.ch46_hidden_parts[2] = "front_suspension";
    level.ch46_hidden_parts[3] = "rear_left_suspension";
    level.ch46_hidden_parts[4] = "rear_right_suspension";
    level.ch46_hidden_parts[5] = "ammo_box_jnt";
    level.ch46_hidden_parts[6] = "door_rear";
    level.ch46_hidden_parts[7] = "door_rear_top";
    level.ch46_hidden_parts[8] = "wheel_front";
    level.ch46_hidden_parts[9] = "wheel_rear_left";
    level.ch46_hidden_parts[10] = "wheel_rear_right";
    level.ch46_hidden_parts[11] = "door_rear_top_left";
    level.ch46_hidden_parts[12] = "door_rear_top_right";
}

perf_optimize_seaknight_inflight()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );

    foreach ( var_1 in level.ch46_hidden_parts )
        level.seaknight hidepart( var_1, "vehicle_ch46e_opened_door_interior_mk19" );

    var_3 = level.seaknight getlinkedchildren();

    foreach ( var_5 in var_3 )
    {
        if ( var_5 _meth_83b6() == "vehicle_ch46e_wires" )
            var_5 hide();
    }
}

perf_reset_seaknight_optimizations()
{
    common_scripts\utility::_id_384A( "seaknight_set_up" );

    foreach ( var_1 in level.ch46_hidden_parts )
        level.seaknight showpart( var_1, "vehicle_ch46e_opened_door_interior_mk19" );

    var_3 = level.seaknight getlinkedchildren();

    foreach ( var_5 in var_3 )
    {
        if ( var_5 _meth_83b6() == "vehicle_ch46e_wires" )
            var_5 show();
    }
}

pelayo_in_seaknight_shooting()
{
    var_0 = ( 5240.0, 8060.0, 380.0 );
    var_1 = ( 3830.0, 8300.0, 330.0 );
    wait 7.4;

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        pelayo_bullet( var_0, var_1 );
        wait 0.1;
        pelayo_bullet( var_0, var_1 );
        wait 0.1;
        pelayo_bullet( var_0, var_1 );
        var_3 = randomfloatrange( 0.5, 0.8 );
        wait(var_3);
    }
}

pelayo_bullet( var_0, var_1 )
{
    var_1 = bulletspread( var_0, var_1, 4 );
    magicbullet( "mp5", var_0, var_1 );
    bullettracer( var_0, var_1, 1 );
}

vfx_tank_water_splashes()
{
    wait 0.7;
    common_scripts\_exploder::_id_3528( "6000" );
    wait 6.1;
    common_scripts\_exploder::_id_3528( "6001" );
    wait 3.6;
    common_scripts\_exploder::_id_3528( "6002" );
    wait 2.8;
    common_scripts\_exploder::_id_3528( "6003" );
}
