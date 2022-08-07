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
    maps\jeepride_precache::main();
    maps\jeepride_fx::main();
    maps\_load::main();
    maps\jeepride_anim::main_anim();
    level thread maps\jeepride_amb::main();
    maps\createart\jeepride_art::main();
    maps\jeepride_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.startdelay = 0;
    level.sparksclaimed = 0;
    level.whackamolethread = maps\jeepride_code::whackamole;
    level.playerlinkinfluence = 0.5;
    level.exploder_fast = [];
    level._id_2235 = [];
    level._id_2235["180"] = cos( 180 );
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 4096;
    level.bmpmgrange = 4000;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level.potentialweaponitems = maps\jeepride_code::alltheweapons();
    level._id_616B = 1;
    level.vehicles_with_drones = [];
    level.drone_unloader = 0;
    level.ai_in_boundry = 0;
    level.last_layer_of_death = 0;
    level.nocompass = 1;
    common_scripts\utility::_id_0CF0( getentarray( "delete_on_load", "targetname" ), maps\_utility::_id_284E );
    common_scripts\utility::_id_0CF0( getentarray( "delete_on_load", "target" ), maps\_utility::_id_284E );
    level.defaultragdolltime = getdvarint( "ragdoll_max_life" );
    precacherumble( "tank_rumble" );
    precacherumble( "jeepride_bridgesink" );
    precacherumble( "jeepride_cliffblow" );
    precacherumble( "jeepride_pillarblow" );
    precacheitem( "hind_FFAR_jeepride" );
    precacheitem( "crash_missile_jeepride" );
    precacheitem( "rpg" );
    precacheitem( "colt45_zak_killer" );
    precacheshader( "black" );
    precacheshader( "white" );
    precacheshellshock( "jeepride_bridgebang" );
    precacheshellshock( "jeepride_action" );
    precacheshellshock( "jeepride_zak" );
    precacheshellshock( "jeepride_zak_killing" );
    precacheshellshock( "jeepride_rescue" );
    precachemodel( "worldbody_h1_sas_woodland_nopistol" );
    precachemodel( "worldhands_h1_usmc_woodland" );
    precachemodel( "weapon_colt1911_white" );
    precachemodel( "weapon_colt1911_black" );
    precachemodel( "weapon_saw" );
    precachemodel( "weapon_rpg7_no_rocket" );
    setomnvar( "ui_jeepride_init", 1 );
    maps\_utility::_id_278B( ::ride_start );
    maps\_utility::_id_079C( "start", ::ride_start, &"STARTS_START" );
    maps\_utility::_id_079C( "first_hind", ::start_first_hind, &"STARTS_FIRSTHIND" );
    maps\_utility::_id_079C( "against_traffic", ::wip_start, &"STARTS_AGAINSTTRAFFIC" );
    maps\_utility::_id_079C( "final_stretch", ::wip_start, &"STARTS_FINALSTRETCH" );
    maps\_utility::_id_079C( "bridge_explode", ::bridge_explode_start, &"STARTS_BRIDGEEXPLODE" );
    maps\_utility::_id_079C( "bridge_combat", ::bridge_combat, &"STARTS_BRIDGECOMBAT" );
    maps\_utility::_id_079C( "bridge_zak", ::bridge_zak, &"STARTS_BRIDGEZAK" );
    maps\_utility::_id_079C( "bridge_rescue", ::bridge_rescue_start, &"STARTS_BRIDGERESCUE" );
    maps\_utility::_id_079C( "nowhere", ::start_nowhere, &"STARTS_NOWHERE" );

    if ( getdvar( "jeepride_smoke_shadow" ) == "" )
        setdvar( "jeepride_smoke_shadow", "off" );

    if ( getdvar( "jeepride_crashrepro" ) == "" )
        setdvar( "jeepride_crashrepro", "off" );

    if ( getdvar( "jeepride_showhelitargets" ) == "" )
        setdvar( "jeepride_showhelitargets", "off" );

    if ( getdvar( "jeepride_recordeffects" ) == "" )
        setdvar( "jeepride_recordeffects", "off" );

    if ( getdvar( "jeepride_startgen" ) == "" )
        setdvar( "jeepride_startgen", "off" );

    if ( getdvar( "jeepride_rpgbox" ) == "" )
        setdvar( "jeepride_rpgbox", "off" );

    if ( getdvar( "jeepride_nobridgefx" ) == "" )
        setdvar( "jeepride_nobridgefx", "off" );

    if ( getdvar( "jeepride_tirefx" ) == "" )
        setdvar( "jeepride_tirefx", "off" );

    if ( getdvar( "jeepride_player_pickup" ) == "" )
        setdvar( "jeepride_player_pickup", "off" );

    if ( getdvar( "jeepride_multi_shot" ) == "" )
        setdvar( "jeepride_multi_shot", "off" );

    setdvar( "use_old_uaz_anims", 1 );
    setsaveddvar( "g_DisableAntilagOnLinkedVehicles", 1 );
    setsaveddvar( "ragdoll_use_linear_velocity", 1 );

    if ( getdvar( "jeepride_crashrepro" ) == "off" && getdvar( "jeepride_recordeffects" ) == "off" )
        thread maps\jeepride_fx::jeepride_fxline();

    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers2", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "ambient_setter", "targetname" ), maps\jeepride_code::ambient_setter );
    common_scripts\utility::_id_0D13( getentarray( "sound_emitter", "targetname" ), maps\jeepride_code::sound_emitter );
    maps\jeepride_precache::main();
    maps\jeepride_fx::main();
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_g36_clip";
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_truck", 0.7, 1.6, 1500 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_luxurysedan", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_tanker_truck_civ", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_80s_wagon1", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_80s_hatch1", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_small_wagon", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_bus", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_small_hatchback", 0.5, 1.6, 1000 );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_open_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_fabric_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_open_for_ride", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\createart\jeepride_art::main();
    maps\jeepride_anim::main();
    maps\_load::main();
    level.playercardbackground takeweapon( "fraggrenade" );
    level.playercardbackground thread shock_ondeath_loc();
    maps\_drone_ai::init();
    maps\jeepride_lighting::main();
    maps\jeepride_aud::main();
    level._id_9C83["hide_attack_forward"] = maps\jeepride_code::guy_hide_attack_forward;
    level._id_9C81["hide_attack_forward"] = maps\jeepride_code::guy_hide_attack_forward_check;
    level._id_9C83["hidetoback_attack"] = maps\jeepride_code::guy_hidetoback_startingback;
    level._id_9C81["hidetoback_attack"] = maps\jeepride_code::guy_hidetoback_check;
    level._id_9C83["back_attack"] = maps\jeepride_code::guy_back_attack;
    level._id_9C81["back_attack"] = maps\jeepride_code::guy_hidetoback_check;
    level._id_9C83["hide_attack_left"] = maps\jeepride_code::guy_hide_attack_left;
    level._id_9C81["hide_attack_left"] = maps\jeepride_code::guy_hide_attack_left_check;
    level._id_9C83["hide_attack_left_standing"] = maps\jeepride_code::guy_hide_attack_left_standing;
    level._id_9C81["hide_attack_left_standing"] = maps\jeepride_code::guy_hidetoback_check;
    level._id_9C83["hide_attack_back"] = maps\jeepride_code::guy_hide_attack_back;
    level._id_9C81["hide_attack_back"] = maps\jeepride_code::guy_hide_attack_back_check;
    level._id_9C83["hide_starting_back"] = maps\jeepride_code::guy_hide_starting_back;
    level._id_9C81["hide_starting_back"] = maps\jeepride_code::guy_hidetoback_check;
    level._id_9C83["hide_starting_left"] = maps\jeepride_code::guy_hide_startingleft;
    level._id_9C81["hide_starting_left"] = maps\jeepride_code::guy_backtohide_check;
    level._id_9C83["backtohide"] = maps\jeepride_code::guy_backtohide;
    level._id_9C81["backtohide"] = maps\jeepride_code::guy_backtohide_check;
    level._id_9C83["react"] = maps\jeepride_code::guy_react;
    level._id_9C81["react"] = maps\jeepride_code::guy_react_check;

    if ( !isdefined( level.fxplay_model ) || getdvar( "jeepride_crashrepro" ) != "off" )
    {
        common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "ghetto_tag", "targetname" ), maps\jeepride_code::ghetto_tag );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "sparks_on", "script_noteworthy" ), maps\jeepride_code::trigger_sparks_on );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "sparks_off", "script_noteworthy" ), maps\jeepride_code::trigger_sparks_off );
    }

    getent( "gaz", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_gaz );
    getent( "price", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_price );
    getent( "griggs", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_griggs );
    getent( "medic", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_medic );
    getent( "ru1", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_ru1 );
    getent( "ru2", "script_noteworthy" ) maps\_utility::_id_0798( ::setup_ru2 );
    level.lock_on_player_ent = spawn( "script_model", level.playercardbackground.origin + ( 0.0, 0.0, 24.0 ) );
    level.lock_on_player_ent setmodel( "fx" );
    level.lock_on_player_ent linkto( level.playercardbackground );
    level.lock_on_player_ent hide();
    level.lock_on_player_ent._id_7942 = "missile";
    level.lock_on_player_ent._id_7AC2 = 4;
    level.lock_on_player_ent.oldmissiletype = 0;
    level.lock_on_player = 0;
    maps\_utility::_id_1332( "allies" );
    thread _id_6302();
    maps\jeepride_amb::main();
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowsprint( 0 );
    common_scripts\utility::_id_0D13( maps\_vehicle_code::_id_05BE(), maps\jeepride_code::process_vehicles_spawned );
    common_scripts\utility::_id_0D13( getentarray( "missile_offshoot", "targetname" ), maps\jeepride_code::missile_offshoot );
    maps\jeepride_code::crashed_vehicles_setup();
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "fliptruck_ghettoanimate", "targetname" ), maps\jeepride_code::fliptruck_ghettoanimate );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "attack_dummy_path", "targetname" ), maps\jeepride_code::attack_dummy_path );
        common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "vehicle_badplacer", "targetname" ), maps\jeepride_code::vehicle_badplacer );
        common_scripts\utility::_id_0D13( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_animate );
        common_scripts\utility::_id_0D13( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_phys );
    }

    level.struct_remove = undefined;
    level._id_8F60 = [];
    level._id_8F64 = undefined;
    level._id_8F64 = [];
    level._id_8F64["target"] = [];
    level._id_8F64["targetname"] = [];
    level._id_8F64["script_noteworthy"] = [];

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::_id_0D13( getvehiclenodearray( "nodisconnectpaths", "script_noteworthy" ), maps\jeepride_code::nodisconnectpaths );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "crazy_bmp", "script_noteworthy" ), maps\jeepride_code::crazy_bmp );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "do_or_die", "script_noteworthy" ), maps\jeepride_code::do_or_die );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "hillbump", "script_noteworthy" ), maps\jeepride_code::hillbump );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "honker_initiate", "script_noteworthy" ), maps\jeepride_code::honker_initiate );
    }

    common_scripts\utility::_id_0D13( getvehiclenodearray( "bm21_unloader", "script_noteworthy" ), ::bm21_unloader );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "attacknow", "script_noteworthy" ), maps\jeepride_code::attacknow );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "sideswipe", "script_noteworthy" ), maps\jeepride_code::sideswipe );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "destructible_assistance", "script_noteworthy" ), maps\jeepride_code::destructible_assistance );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "no_godmoderiders", "script_noteworthy" ), maps\jeepride_code::no_godmoderiders );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "jolter", "script_noteworthy" ), maps\jeepride_code::jolter );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::_id_0D13( getvehiclenodearray( "clouds_off", "script_noteworthy" ), maps\jeepride_code::clouds_off );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "clouds_on", "script_noteworthy" ), maps\jeepride_code::clouds_on );
        common_scripts\utility::_id_0D13( getvehiclenodearray( "unloadmanager", "script_noteworthy" ), maps\jeepride_code::unloadmanager );
    }

    common_scripts\utility::_id_0D13( getentarray( "hindset", "script_noteworthy" ), ::hindset );
    common_scripts\utility::_id_0D13( getentarray( "hindset_hindbombplayer", "script_noteworthy" ), ::hindset );
    common_scripts\utility::_id_0D13( getentarray( "hindset_hindbombplayer", "script_noteworthy" ), maps\jeepride_code::hind_bombplayer );
    getent( "end_hind_action", "script_noteworthy" ) thread end_hind_action();
    getvehiclenode( "end_bmp_action", "script_noteworthy" ) thread end_bmp_action();
    var_1 = getent( "AI_Stop_shooting", "targetname" );
    var_1 thread maps\jeepride_code::ai_rpg_tunnel_stop();
    var_2 = getent( "mountain_spawn", "targetname" );
    var_2 hide();
    var_2 maps\_utility::_id_27EF( 140, maps\jeepride_code::mountain_bridge );
    common_scripts\utility::_id_0D13( getentarray( "Guardrail_Model", "targetname" ), maps\jeepride_code::guardrail_think );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::_id_0D13( getentarray( "magic_missileguy_spawner", "targetname" ), maps\jeepride_code::magic_missileguy_spawner );
        common_scripts\utility::_id_0D13( getentarray( "stinger_me", "script_noteworthy" ), maps\jeepride_code::stinger_me );
        common_scripts\utility::_id_0D13( getentarray( "stinger_me_nolock", "script_noteworthy" ), maps\jeepride_code::stinger_me, 0 );
        common_scripts\utility::_id_0D13( getentarray( "all_allies_targetme", "script_noteworthy" ), maps\jeepride_code::all_allies_targetme );
        common_scripts\utility::_id_0D13( getentarray( "heli_focusonplayer", "script_noteworthy" ), maps\jeepride_code::heli_focusonplayer );
        common_scripts\utility::_id_0D13( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_hack );
        common_scripts\utility::_id_0D13( getentarray( "hidemeuntilflag", "script_noteworthy" ), maps\jeepride_code::hidemeuntilflag );
        common_scripts\utility::_id_0D13( getspawnerarray(), maps\jeepride_code::spawners_setup );
        common_scripts\utility::_id_0D13( getentarray( "layer_of_death0", "targetname" ), maps\jeepride_code::layer_of_death, 0 );
        common_scripts\utility::_id_0D13( getentarray( "layer_of_death1", "targetname" ), maps\jeepride_code::layer_of_death, 1 );
        common_scripts\utility::_id_0D13( getentarray( "layer_of_death2", "targetname" ), maps\jeepride_code::layer_of_death, 2 );
        common_scripts\utility::_id_0D13( getentarray( "layer_of_death3", "targetname" ), maps\jeepride_code::layer_of_death, 3 );
        common_scripts\utility::_id_0D13( getentarray( "layer_of_death4", "targetname" ), maps\jeepride_code::layer_of_death, 4 );
        common_scripts\utility::_id_0D13( getentarray( "falltrigger", "targetname" ), maps\jeepride_code::_id_17F9 );
    }
    else
        level._id_2417 = [];

    if ( getdvar( "jeepride_startgen" ) != "off" )
        common_scripts\utility::_id_0D13( getvehiclenodearray( "startgen", "script_noteworthy" ), maps\jeepride_code::startgen );

    maps\_utility::_id_27EF( 185, maps\jeepride_code::falling_bridge_price );
    thread maps\jeepride_code::bridge_bumper();
    thread maps\jeepride_code::bridge_uaz_crash();
    common_scripts\utility::_id_383D( "end_action_bmp" );
    common_scripts\utility::_id_383D( "end_action_hind" );
    common_scripts\utility::_id_383D( "rpg_shot" );
    common_scripts\utility::_id_383D( "rpg_taken" );
    common_scripts\utility::_id_383D( "cover_from_heli" );
    common_scripts\utility::_id_383D( "all_end_scene_guys_dead" );
    common_scripts\utility::_id_383D( "kamarov_runs" );
    common_scripts\utility::_id_383D( "bridge_zakhaev_setup" );
    common_scripts\utility::_id_383D( "no_more_drone_unloaders" );
    common_scripts\utility::_id_383D( "murdering_player" );
    common_scripts\utility::_id_383D( "cpr_finished" );
    common_scripts\utility::_id_383D( "slomo_done" );
    common_scripts\utility::_id_383D( "slam_zoom_done" );
    common_scripts\utility::_id_383D( "bridge_section_start" );
    common_scripts\utility::_id_383D( "stop_limp" );
    getent( "ai_spot1", "script_noteworthy" ) hide();
    getent( "ai_spot2", "script_noteworthy" ) hide();
    getent( "ai_spot3", "script_noteworthy" ) hide();
    thread getplayersride();
    thread maps\jeepride_code::_id_6AC6();
    setsaveddvar( "sm_sunSampleSizeNear", 0.4 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    thread _id_5FFB();
    thread maps\jeepride_code::jeepride_start_dumphandle();
    thread maps\jeepride_code::speedbumps_setup();
    thread end_ride();
    thread time_triggers();
    level.intro_offsets_dialog_time = 10;
    thread dialog_ride_price();
    thread dialog_ride_griggs();
    thread dialog_get_off_your_ass();
    thread maps\jeepride_code::dialog_killconfirm();
    thread maps\jeepride_code::dialog_rpg();
    thread end_action();
    thread maps\jeepride_code::bridge_vehiclde_drone_unloader();
    thread maps\jeepride_code::bridge_defence_bounds();
    thread beam_me_up();
    level._id_3010["cliff_blow"]["magnitude"] = 0.7;
    level._id_3010["cliff_blow"]["duration"] = 1;
    level._id_3010["cliff_blow"]["radius"] = 1200;
    level._id_3010["brace_fall"]["magnitude"] = 0.3;
    level._id_3010["brace_fall"]["duration"] = 1.5;
    level._id_3010["brace_fall"]["radius"] = 2200;
    thread bridge_save();
    common_scripts\utility::_id_0D13( getentarray( "notvehicle", "script_noteworthy" ), maps\jeepride_code::_id_2856 );
    wait 0.05;
    setsaveddvar( "compass", "0" );
    thread bx_scripted_events_flags_vfx();
    thread bx_warmup_vfx_bridge();
    thread bx_performance_vfx_count();
    thread rpg_from_griggs();
    level.playercardbackground maps\_utility::_id_27EF( 161, ::bodysense_bridgeexplosion );
    maps\jeepride_code::helicopter_hide_crash_seq();
    maps\jeepride_code::bloodtrail_hide();
    maps\jeepride_code::disable_light_finalseq();
    setup_bridge_mi17();
}

rpg_from_griggs()
{
    var_0 = getent( "rpg_animation", "targetname" );
    var_0 waittill( "trigger" );
    level.rpg = spawn( "script_model", ( 0.0, 0.0, 1.0 ) );
    level.rpg.origin = level.griggs gettagorigin( "tag_weapon_right" );
    level.rpg.angles = level.griggs gettagangles( "tag_weapon_right" );
    level.rpg linkto( level.griggs, "tag_weapon_right" );
    level.rpg common_scripts\utility::_id_27CD( 1, ::setmodel, "weapon_rpg7_no_rocket" );
    level.griggs attach( "projectile_rpg7", "tag_inhand" );
    level._id_6F7C thread hide_weapons();
    level.griggs thread hide_weapons();
    level._id_6F7C thread maps\_anim::_id_0C24( level._id_6F7C, "rpgfromgriggs_price", "tag_guy0" );
    level.griggs maps\_anim::_id_0C24( level.griggs, "rpgfromgriggs_griggs", "tag_passenger" );
    level.griggs notify( "show_weapon" );
}

remove_rpg_models( var_0 )
{
    level.playercardbackground disableweaponpickup();
    level notify( "newrpg" );
    wait 0.1;
    level.rpg delete();
    level.griggs detach( "projectile_rpg7", "tag_inhand" );
    level.griggs waittill( "rpgfromgriggs_griggs" );
    level.playercardbackground enableweaponpickup();
}

hide_weapons( var_0 )
{
    animscripts\shared::_id_297F();
    level._id_6F7C.npcname = "price";
    level._id_6F7C.jeeptag = "tag_guy0";
    level.griggs.npcname = "griggs";
    level.griggs.jeeptag = "tag_passenger";
    maps\_utility::_id_7E44( "rpgfromgriggs_" + self.npcname + "_idle" );
    level.griggs waittill( "show_weapon" );
    wait 0.2;
    animscripts\shared::_id_9AF6();
    wait 2;
    maps\_utility::_id_1EBA();
}

bodysense_bridgeexplosion()
{
    setsaveddvar( "ragdoll_use_linear_velocity", 0 );
    level.playercardbackground disableweapons();
    var_0 = maps\_utility::_id_88D1( "playerview" );
    var_1 = level.playercardbackground getorigin();
    var_2 = level.playercardbackground getplayerangles();
    var_0.origin = var_1;
    var_0.angles = var_2;
    var_0 linktoplayerview( level.playercardbackground, "tag_origin", ( 0.0, 0.0, -50.0 ), ( 0.0, 0.0, 0.0 ), 1 );
    var_0 maps\_anim::_id_0C24( var_0, "player_bridgeexplosion" );
    level.playercardbackground unlink();
    level.playercardbackground freezecontrols( 1 );
    var_0 delete();
    level.playercardbackground enableweapons();
}

slam_zoom_sound()
{
    wait 0.05;
    level.playercardbackground playsound( "ui_camera_whoosh_in" );
}

slam_zoom_intro()
{
    waitframe;
    maps\_utility::_id_8648();
    maps\_utility::_id_8643( 0.25 );
    maps\_utility::_id_8644( 0.25 );
    level.playercardbackground freezecontrols( 1 );
    level.playercardbackground disableweapons();
    level.playercardbackground setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    var_0 = getent( "slam_zoom_start", "targetname" );
    var_1 = getent( var_0._not_team, "targetname" ).origin;
    var_2 = var_0.origin;
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( "tag_origin" );
    var_3.angles = vectortoangles( var_1 - var_2 );
    level.playercardbackground playerlinktodelta( var_3, "tag_origin", 1, 0, 0, 0, 0 );
    wait 0.05;
    setsaveddvar( "cg_fov", 55 );
    var_4 = 4.5;
    thread maps\_utility::_id_5689( 5.5, 65 );
    var_3 moveto( var_1, var_4, 2.5, 1 );
    wait 1;
    soundscripts\_snd::_id_870C( "remove_intro_mute" );
    wait 2;
    wait 0.525;
    wait 0.25;
    thread whitescreen();
    common_scripts\utility::_id_0CF0( getentarray( "slam_zoom_backdrop", "targetname" ), maps\_utility::_id_284E );
    wait 0.45;
    level.playercardbackground setplayerangles( ( -8.4547, 171.59, 0.0 ) );
    maps\jeepride_code::player_link_update();
    level.playercardbackground allowcrouch( 1 );
    wait 0.05;
    maps\_utility::_id_863E();
    common_scripts\utility::_id_383F( "slam_zoom_done" );
    thread common_scripts\utility::_id_69C2( "ui_screen_trans_in", level.playercardbackground.origin );
    wait 0.2;
    level.playercardbackground enableweapons();
    thread common_scripts\utility::_id_69C2( "ui_screen_trans_out", level.playercardbackground.origin );
    wait 2.2;
    level notify( "destroy_hud_elements" );
    var_3 delete();
    maps\_utility::_id_1143( "levelstart" );
}

whitescreen()
{
    wait 0.2;
    var_0 = newhudelem();
    var_0.xpmaxmultipliertimeplayed = 0;
    var_0._id_0538 = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.hostquits = "fullscreen";
    var_0.visionsetnight = "fullscreen";
    var_0.alpha = 0;
    var_0 fadeovertime( 0.15 );
    var_0.alpha = 1;
    wait 0.35;
    soundscripts\_snd::_id_870C( "clear_whitescreen_mix" );
    var_0 fadeovertime( 0.15 );
    var_0.alpha = 0;
    wait 0.15;
    var_0 destroy();
}

end_ride()
{
    common_scripts\utility::_id_384A( "bx_end_bridge_transition" );
    thread bridge_transition();
    common_scripts\utility::_id_384A( "end_ride" );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );

    if ( level._id_8C36 == "bridge_combat" || level._id_8C36 == "bridge_zak" || level._id_8C36 == "bridge_rescue" )
        return;

    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::_id_97CE );
}

getplayersride()
{
    common_scripts\utility::_id_383D( "playersride_init" );
    level.playersride = maps\_vehicle::waittill_vehiclespawn( "playersride" );
    level.playersride._id_2D3D = 1;
    level.playersride maps\_vehicle::_id_4259();
    level.lock_on_player_ent unlink();
    level.lock_on_player_ent.origin = level.playersride.origin + ( 0.0, 0.0, 24.0 );
    level.lock_on_player_ent linkto( level.playersride );
    common_scripts\utility::_id_383F( "playersride_init" );
    level.playersride thread maps\jeepride_aud::start_player_jeep_sfx();
}

ride_start()
{
    setsaveddvar( "ragdoll_max_life", 30000 );
    soundscripts\_snd::_id_870C( "aud_start_checkpoint" );
    thread maps\_vehicle::_id_23DE( 44 );
    thread maps\_vehicle::_id_23DE( 46 );
    thread maps\_vehicle::_id_7B3C( 45 );
    common_scripts\utility::_id_384A( "playersride_init" );
    level.playersride._not_team = "playerspath";
    level.playersride maps\_vehicle_code::_id_4062();
    thread slam_zoom_intro();
    thread maps\_vehicle::_id_427A( level.playersride );
}

wip_start()
{
    soundscripts\_snd::_id_870C( "aud_against_traffic_checkpoint" );
    common_scripts\utility::_id_0D13( getvehiclenodearray( level._id_8C36, "script_noteworthy" ), maps\jeepride_code::sync_vehicle );
    common_scripts\utility::_id_384A( "playersride_init" );
    maps\jeepride_code::player_link_update();
}

music_zak_timing()
{
    wait 2.75;
    common_scripts\utility::_id_383F( "music_zak" );
}

_id_5FFB()
{
    common_scripts\utility::_id_383D( "music_chase_end" );
    common_scripts\utility::_id_383D( "music_bridge" );
    common_scripts\utility::_id_383D( "music_zak" );
    common_scripts\utility::_id_383D( "music_lastman" );
    common_scripts\utility::_id_383D( "music_rescue" );
    waitframe;
    wait 0.8;
    music_flagged( "jeepride_chase_music", "music_chase_end", undefined, 0 );
    music_flagged( "jeepride_chase_end_music", "music_bridge" );
    music_flagged( "jeepride_defend_music", "music_zak" );
    music_flagged( "jeepride_showdown_music", "music_rescue", 0 );
    maps\_utility::_id_6008( "jeepride_rescue_music", 0 );
}

music_flagged( var_0, var_1, var_2, var_3 )
{
    var_4 = 0.2;

    if ( isdefined( var_3 ) )
        var_4 = var_3;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( common_scripts\utility::_id_382E( var_1 ) )
        return;

    maps\_utility::_id_6008( var_0, var_2 );
    common_scripts\utility::_id_384A( var_1 );
    musicstop();
    wait(var_4);
}

music_defend()
{
    maps\_utility::_id_6008( "jeepride_defend_music" );
    var_0 = 43;
    wait(var_0);
}

time_triggers()
{
    common_scripts\utility::_id_383D( "aa_riding_rpg_attackers" );
    common_scripts\utility::_id_383D( "aa_riding_hind_attacker" );
    common_scripts\utility::_id_383D( "aa_bridge_forth" );
    common_scripts\utility::_id_383D( "aa_riding_pre_rpg_attackers" );
    waitframe;
    waitframe;
    common_scripts\utility::_id_383F( "aa_riding_pre_rpg_attackers" );
    thread maps\jeepride_code::delaythread_loc( 51, common_scripts\utility::_id_383F, "aa_riding_rpg_attackers" );
    thread maps\jeepride_code::delaythread_loc( 101, common_scripts\utility::_id_383F, "aa_riding_hind_attacker" );
    thread maps\jeepride_code::delaythread_loc( 159, common_scripts\utility::_id_383F, "aa_bridge_forth" );

    if ( level._id_8C36 == "nowhere" )
        return;

    if ( getdvar( "start" ) != "wip" )
    {
        thread maps\jeepride_code::delaythread_loc( 12, ::autosave_now_loc, "down_the_hill" );
        thread maps\jeepride_code::delaythread_loc( 57, ::autosave_now_loc, "First Tunnel Exit" );
        thread maps\jeepride_code::delaythread_loc( 100, maps\jeepride_code::reset_autosave_condition );
        thread maps\jeepride_code::delaythread_loc( 100, maps\jeepride_code::player_link_update );
        thread maps\jeepride_code::delaythread_loc( 102, ::autosave_now_loc, "Hind Chase" );
        thread maps\jeepride_code::delaythread_loc( 160, ::autosave_now_loc, "Bridge Blown" );
    }

    thread maps\jeepride_code::delaythread_loc( 36, maps\jeepride_code::player_link_update_delta );
    thread maps\jeepride_code::delaythread_loc( 42, maps\jeepride_code::player_link_update );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 0.5, maps\_utility::_id_69C4, "scn_jeepride_dirt1_opening" );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 37, maps\_utility::_id_69C4, "scn_jeepride_dirt2_roadside" );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 82, maps\_utility::_id_69C4, "scn_jeepride_dirt3_medianskid" );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 94, maps\_utility::_id_69C4, "scn_jeepride_dirt4_medianslide" );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 113, maps\_utility::_id_69C4, "scn_jeepride_dirt5_mediancross" );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 91, maps\jeepride_code::player_link_update, 0.3 );
    thread maps\jeepride_code::delaythread_loc( 122, maps\jeepride_code::fake_water_tread );
    thread maps\jeepride_code::delaythread_loc( 128, maps\jeepride_code::stop_fake_water_tread );
    level.playercardbackground thread maps\jeepride_code::delaythread_loc( 96, common_scripts\utility::_id_69C2, "exp_tanker_vehicle" );
}

dialog_ride_price()
{
    if ( level._id_8C36 == "nowhere" )
        return;

    wait 1;
    level._id_6F7C maps\jeepride_code::delaythread_loc( 6.5 + level.intro_offsets_dialog_time, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_helistatus" );
    level.playercardbackground maps\jeepride_code::delaythread_loc( 10 + level.intro_offsets_dialog_time, maps\_utility::_id_69C4, "jeepride_hqr_griggsisnthere" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 15 + level.intro_offsets_dialog_time, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_notgood" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 16 + level.intro_offsets_dialog_time, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_truckleft" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 48, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_coverrear" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 78, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_company" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 100, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_hind6oclock" );
    level._id_6F7C maps\jeepride_code::delaythread_loc( 152, maps\_anim::_id_0C21, level._id_6F7C, "jeepride_pri_buggered" );
    level._id_3C61 maps\jeepride_code::delaythread_loc( 155, maps\_anim::_id_0C21, level._id_3C61, "jeepride_gaz_goodenough" );
    level._id_3C61 maps\jeepride_code::delaythread_loc( 161, maps\_anim::_id_0C21, level._id_3C61, "jeepride_gaz_stopbloodytruck" );
}

dialog_bridge_radio()
{
    level.playercardbackground endon( "death" );
    maps\_utility::_id_1333( "axis" );
    maps\_utility::_id_1332( "allies" );
    level._id_3C61 maps\_anim::_id_0C24( level._id_3C61, "jeepride_gaz_heavyattackbridge" );
    level.griggs maps\_utility::_id_69C4( "jeepride_hqr_workinonit" );
    level._id_3C61 maps\_anim::_id_0C24( level._id_3C61, "jeepride_gaz_uselesswanker" );
    wait 2;
    level._id_6F7C maps\_anim::_id_0C24( level._id_6F7C, "jeepride_pri_sitreponhelis" );
    level._id_3C61 maps\_anim::_id_0C24( level._id_3C61, "jeepride_gaz_wereonourown" );
    wait 3;
    maps\_utility::_id_1333( "allies" );
    wait 7.5;
    maps\_utility::_id_1332( "allies" );
    wait 0.5;
    level.griggs maps\_utility::_id_69C4( "jeepride_kmr_couldusehelp" );
    level._id_3C61 maps\_anim::_id_0C24( level._id_3C61, "jeepride_gaz_goodtohear" );
    wait 1;
    level.griggs maps\_utility::_id_69C4( "jeepride_kmr_standbyalmostthere" );
    wait 1;
    maps\_utility::_id_1333( "allies" );
    wait 3;
    level.griggs maps\_utility::_id_69C4( "jeepride_grg_tankabouttoblow" );
}

dialog_ride_griggs()
{
    if ( level._id_8C36 == "nowhere" )
        return;

    maps\_utility::_id_27EF( 145, ::end_print_fx );
    wait 1;
    level.griggs maps\jeepride_code::delaythread_loc( 9.5, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_hangon" );
    level.griggs maps\jeepride_code::delaythread_loc( 12.5, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_truck6oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 107, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_rpgfirehind" );
    level.griggs maps\jeepride_code::delaythread_loc( 122, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_hind9oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 127, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_hangon" );
    level.griggs maps\jeepride_code::delaythread_loc( 132, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_rpgfirehind" );
    level.griggs maps\jeepride_code::delaythread_loc( 147, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_hind12oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 157, maps\_anim::_id_0C21, level.griggs, "jeepride_grg_takeoutbridge" );
}

end_print_fx()
{

}

blown_bridge( var_0 )
{
    while ( isdefined( var_0 ) && distance2d( self.origin, var_0.origin ) > 350 && isdefined( self ) )
        wait 0.05;

    blow_bridge();
}

blow_bridge()
{
    level notify( "bridge_blower" );

    if ( isdefined( level.bridgeblown ) )
        return;

    level.bridgeblown = 1;
    level.playercardbackground thread maps\_utility::_id_69C6( "scn_player_jeep_bridge_crash" );
    thread bridge_blow_fx();
}

bridge_blow_fx()
{
    earthquake( 1.5, 0.35, ( -35893.6, -15878.5, 460.0 ), 5000 );
    level.playercardbackground playrumbleonentity( "tank_rumble" );
    thread bridge_blow_blur();
    common_scripts\_exploder::_id_3528( 54 );
    wait 0.55;
    maps\jeepride_code::exploder_loc( 3 );
    earthquake( 0.6, 0.3, ( -35893.6, -15878.5, 460.0 ), 5000 );
    level.playercardbackground playrumbleonentity( "tank_rumble" );
    earthquake( 0.3, 1.0, ( -35893.6, -15878.5, 460.0 ), 5000 );
}

bridge_blow_blur()
{
    setblur( 1.5, 0.1 );
    wait 0.1;
    setblur( 0, 0.5 );
}

setup_gaz()
{
    level._id_3C61 = self;
    level._id_3C61._id_0C72 = "gaz";
    level._id_3C61 thread maps\_utility::_id_58D7();
    level._id_3C61 thread maps\_utility::_id_5926();
}

setup_price()
{
    level._id_6F7C = self;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread maps\_utility::_id_58D7();
    level._id_6F7C thread maps\_utility::_id_5926();
}

setup_griggs()
{
    level.griggs = self;
    level.griggs._id_0C72 = "griggs";
    level.griggs thread maps\_utility::_id_58D7();
    level.griggs thread maps\_utility::_id_5926();
}

setup_medic()
{
    level.medic = self;
    level.medic._id_0C72 = "medic";
    level.medic thread maps\_utility::_id_58D7();
    level.medic thread maps\_utility::_id_5926();
}

setup_ru1()
{
    level.ru1 = self;
    level.ru1._id_0C72 = "ru1";
    level.ru1._id_7970 = 1;
}

setup_ru2()
{
    level.ru2 = self;
    level.ru2._id_0C72 = "ru2";
}

dialog_get_off_your_ass()
{
    var_0 = gettime();
    var_1 = gettime();
    level.playercardbackground endon( "death" );
    var_2 = 10000;
    var_3 = 4000;
    level endon( "newrpg" );
    level endon( "bridge_sequence" );

    for (;;)
    {
        if ( level.playercardbackground getstance() == "stand" )
            var_0 = gettime();

        var_4 = gettime();

        if ( var_4 - var_0 > var_3 && var_4 - var_1 > var_2 )
        {
            var_1 = gettime();
            level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "jeepride_pri_getoffyour" );
        }

        wait 0.05;
    }
}

allowallstances()
{
    self _meth_81ce( "stand", "crouch", "prone" );
}

bodysense_bridgecollapse()
{
    setomnvar( "ui_jeepride_crash_recover", 1 );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    maps\_utility::_id_9E6E( "jeepride_end", 0 );
    level.playercardbackground maps\_utility::set_light_set_player( "jeepride_end" );
    var_0 = maps\_utility::_id_88D1( "playerview" );
    var_1 = getent( "endpos", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 0, 0, 0, 0, 0, 0 );
    var_0 thread maps\_anim::_id_0C24( var_0, "player_bridge" );
    soundscripts\_snd::_id_870C( "start_post_bridge_explosion" );
    bridge_visual_transition_phase2();
    h1_bridgecollapserumbleseq();
    wait 8;
    soundscripts\_snd::_id_870C( "stop_post_bridge_explosion" );
    wait 8;
    setomnvar( "ui_jeepride_crash_recover", 0 );
    level.playercardbackground unlink();
    var_0 delete();
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground freezecontrols( 0 );
    thread checkmantle();
}

checkmantle()
{
    level.playercardbackground endon( "death" );
    level endon( "stop_mantle" );

    while ( !level.playercardbackground ismantling() )
        waittillframeend;

    var_0 = maps\_utility::_id_88D1( "playerview", level.playercardbackground.origin, level.playercardbackground.angles );
    var_0 dontcastshadows();
    var_1 = level.playercardbackground _meth_82ef() * -1.0;
    var_0 linktoplayerview( level.playercardbackground, "tag_origin", ( 0, 0, var_1 ), ( 0.0, 0.0, 0.0 ), 0 );
    var_0 maps\_anim::_id_0C24( var_0, "player_bridge_mantle" );
    var_0 delete();
    wait 0.2;
    checkmantle();
}

bridge_transition()
{
    var_0 = 2.0;
    var_1 = 0.5;
    var_2 = 2.0;
    var_3 = getent( "bridge_startspot", "targetname" );
    wait 0.3;
    earthquake( 0.5, 0.4, var_3.origin, 10000 );
    level.playercardbackground takeallweapons();
    wait 0.3;
    earthquake( 0.3, 1, var_3.origin, 10000 );
    wait 0.75;
    earthquake( 0.5, 0.5, var_3.origin, 10000 );
    wait 0.1;
    thread maps\jeepride_aud::start_bridge_uaz_crash();
    var_4 = maps\jeepride_code::_id_23D0( "black", 0 );
    var_4 thread maps\jeepride_code::exp_fade_overlay( 1, 0.001 );
    setblur( 5.0, 0.02 );
    common_scripts\utility::_id_384A( "end_ride" );
    thread bridge_setupguys( var_0 );
    wait(var_0);
    bridge_visual_transition_phase1();
    common_scripts\utility::_id_0D13( getaiarray( "allies" ), maps\jeepride_code::clearenemy_loc );
    maps\jeepride_code::clear_all_vehicles_but_heros_and_hind();
    level.playercardbackground unlink();
    var_5 = spawnstruct();
    var_5 thread maps\_utility::_id_3AF2( maps\_utility::player_fudge_moveto, var_3.origin, 280 );
    thread maps\jeepride_code::player_fudge_rotateto( var_3.angles, var_1 );
    setblur( 8.0, var_1 );
    wait(var_1);
    level.playercardbackground allowstand( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowsprint( 1 );
    common_scripts\utility::_id_383F( "bridge_section_start" );
    wait 3;
    thread play_bridge_collapse_vfx();
    wait 1;
    soundscripts\_snd::_id_870C( "start_bridge_collapse_mix" );
    thread h1_bridgewakeup_dof_seq();
    thread h1_bridgewakeup_fade_seq();
    var_4 thread maps\jeepride_code::exp_fade_overlay( 0, var_2 * 2 );
    bodysense_bridgecollapse();
    thread maps\jeepride_code::limp();
    thread maps\jeepride_code::player_speedscaling_bridge_seq();
    setblur( 0.0, var_2 * 0.5 );
    wait(var_2 * 0.7);
    level.playercardbackground freezecontrols( 0 );
    wait(var_2 * 0.3);
    setsaveddvar( "compass", "1" );
    wait 0.1;
    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::_id_97CE );
    thread autosave_now_loc();
    maps\_utility::_id_070A( "bridge_enemies" );
}

h1_bridgewakeup_dof_seq()
{
    setblur( 0.0, 0.0 );
    level.playercardbackground _meth_84a7( 2.0, 26, 9.0, 9.0 );
    level.playercardbackground _meth_84a5();
    setsaveddvar( "r_mbEnable", 2 );
    wait 3.65;
    level.playercardbackground _meth_84a7( 2.5, 15.5, 0.5, 0.5 );
    wait 1.5;
    level.playercardbackground _meth_84a7( 1.5, 180, 3.0, 3.0 );
    wait 4.15;
    level.playercardbackground _meth_84a7( 1.5, 150, 0.5, 0.5 );
    wait 5.85;
    level.playercardbackground _meth_84a7( 16.0, 500, 0.5, 0.5 );
    wait 3.0;
    level.playercardbackground _meth_84a6();
    setsaveddvar( "r_mbEnable", 0 );
}

h1_bridgecollapserumbleseq()
{
    var_0 = "j_chunk_09";
    maps\_utility::_id_27EF( 16.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.7 );
    maps\_utility::_id_27EF( 16.85, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 22.75, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::_id_27EF( 28.85, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_07";
    maps\_utility::_id_27EF( 11.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::_id_27EF( 16.65, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 17.75, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::_id_27EF( 18.8, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::_id_27EF( 19.65, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 20.2, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.8 );
    maps\_utility::_id_27EF( 21.2, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_08";
    maps\_utility::_id_27EF( 17.0, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.7 );
    maps\_utility::_id_27EF( 17.85, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::_id_27EF( 24.95, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_06";
    maps\_utility::_id_27EF( 17.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 17.45, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 17.9, ::h1_bridgecollapserumblesystem, var_0, "OneBigRumble" );
    maps\_utility::_id_27EF( 18.8, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 19.35, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::_id_27EF( 20.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 29.4, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.25 );
    maps\_utility::_id_27EF( 30.95, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    var_0 = "j_chunk_10";
    maps\_utility::_id_27EF( 24.75, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.6 );
    maps\_utility::_id_27EF( 26.35, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.85 );
    maps\_utility::_id_27EF( 28.35, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 28.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.35 );
    maps\_utility::_id_27EF( 30.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    var_0 = "j_chunk_02";
    maps\_utility::_id_27EF( 21.6, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 22.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 22.85, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.0 );
    maps\_utility::_id_27EF( 24.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 39.15, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.85 );
    maps\_utility::_id_27EF( 40.15, ::h1_bridgecollapserumblesystem, var_0, "OneBigRumble" );
    maps\_utility::_id_27EF( 40.5, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 40.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.45 );
    maps\_utility::_id_27EF( 42.6, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::_id_27EF( 42.65, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleSustain", 0.85 );
    var_0 = "j_chunk_04";
    maps\_utility::_id_27EF( 6.55, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 7.2, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 8.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 8.15, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 2.65 );
    maps\_utility::_id_27EF( 17.85, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 18.5, ::h1_bridgecollapserumblesystem, var_0, "OneSmallRumble" );
    maps\_utility::_id_27EF( 19.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::_id_27EF( 20.5, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 20.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::_id_27EF( 20.85, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 21.95, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::_id_27EF( 22.0, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::_id_27EF( 22.35, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
}

h1_bridgecollapserumblesystem( var_0, var_1, var_2 )
{
    var_3 = "";
    var_4 = 0.0;
    var_5 = 0.0;
    var_6 = "";
    var_7 = 0.09;
    var_8 = 0.13;
    var_9 = 0.25;
    var_10 = getent( "bridgecollapsing", "targetname" );
    var_0 = var_10 gettagorigin( var_0 );

    switch ( var_1 )
    {
        case "OneSmallRumble":
            var_3 = "normal";
            var_4 = var_7;
            var_5 = 0.3;
            var_6 = "damage_light";
            break;
        case "OneMediumRumble":
            var_3 = "normal";
            var_4 = var_8;
            var_5 = 0.4;
            var_6 = "damage_light";
            break;
        case "OneBigRumble":
            var_3 = "normal";
            var_4 = var_9;
            var_5 = 0.5;
            var_6 = "tank_rumble";
            break;
        case "SmallRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_7;
            var_5 = 1.0;
            var_6 = "damage_light";
            break;
        case "MediumRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_8;
            var_5 = 2.0;
            var_6 = "damage_light";
            break;
        case "BigRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_9;
            var_5 = 3.0;
            var_6 = "tank_rumble";
            break;
        case "SmallRumbleSustain":
            var_3 = "sustain";
            var_4 = var_7;
            var_5 = var_2 * 2;
            break;
        case "MediumRumbleSustain":
            var_3 = "sustain";
            var_4 = var_8;
            var_5 = var_2 * 2;
            break;
        case "BigRumbleSustain":
            var_3 = "sustain";
            var_4 = var_9;
            var_5 = var_2 * 2;
            break;
    }

    if ( var_3 == "normal" || var_3 == "sustain" )
    {
        if ( var_6 != "" )
            level.playercardbackground playrumbleonentity( var_6 );

        earthquake( var_4, var_5, var_0, 10000 );
        wait(var_5);

        if ( var_6 == "tank_rumble" )
            level.playercardbackground stoprumble( "tank_rumble" );
    }
    else if ( var_3 == "fade" )
    {
        if ( var_6 != "" )
            level.playercardbackground playrumbleonentity( var_6 );

        earthquake( var_4 * 0.6, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
        earthquake( var_4 * 1.0, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);

        if ( var_6 == "tank_rumble" )
            level.playercardbackground stoprumble( "tank_rumble" );

        earthquake( var_4 * 0.5, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
        earthquake( var_4 * 0.2, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
    }
}

bridge_visual_transition_phase1()
{
    maps\jeepride_code::exploder_loc( 71 );
    maps\jeepride_code::exploder_loc( 73 );
    maps\jeepride_code::exploder_loc( 74 );
    maps\jeepride_code::exploder_loc( 14002 );
}

bridge_visual_transition_phase2()
{
    common_scripts\utility::_id_383F( "bridge_sequence" );
    maps\jeepride_code::exploder_loc( 72 );
    var_0 = getent( "bridgecollapsing", "targetname" );
    var_1 = getent( "left_car", "script_noteworthy" );
    var_2 = getent( "right_car", "script_noteworthy" );
    var_1.origin = var_0 gettagorigin( "j_uaz_goat" );
    var_1.angles = var_0 gettagangles( "j_uaz_goat" );
    var_2.origin = var_0 gettagorigin( "j_wagon" );
    var_2.angles = var_0 gettagangles( "j_wagon" );
    var_1 linkto( var_0, "j_uaz_goat" );
    var_2 linkto( var_0, "j_wagon" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_10", "j_chunk_10" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_7", "j_chunk_07" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_8", "j_chunk_08" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_9", "j_chunk_09" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_6", "j_chunk_06" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_5", "j_chunk_05" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_4", "j_chunk_04" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_3", "j_chunk_03" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_2", "j_chunk_02" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_27", "joint27" );
    var_0 maps\_utility::_id_0D61( "bridge_collapse" );
    var_0 thread maps\_anim::_id_0C21( var_0, "bridge_collapsing" );
    reconnect_bridge_paths();
}

bridge_setupguys( var_0 )
{
    var_1 = getnode( "platform1", "targetname" );
    var_2 = getnode( "platform2", "targetname" );
    var_3 = getnode( "platform3", "targetname" );
    var_4 = getent( "ai_spot1", "script_noteworthy" );
    var_5 = getent( "ai_spot2", "script_noteworthy" );
    var_6 = getent( "ai_spot3", "script_noteworthy" );
    var_4 hide();
    var_5 hide();
    var_6 hide();
    level._id_6F7C unlink();
    maps\jeepride_code::guy_force_remove_from_vehicle( level._id_6F7C._id_750E, level._id_6F7C, var_4.origin );
    level._id_6F7C linkto( var_4, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_6F7C _meth_81c9( var_4.origin, ( 0.0, 0.0, 0.0 ) );
    level._id_6F7C hide();
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level._id_6F7C.a._id_2B20 = 1;
    level._id_6F7C.index = 1;
    maps\jeepride_code::guy_force_remove_from_vehicle( level.griggs._id_750E, level.griggs, var_5.origin );
    level.griggs unlink();
    level.griggs linkto( var_5, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.griggs thread force_position( var_5.origin );
    level.griggs unlink();
    maps\jeepride_code::guy_force_remove_from_vehicle( level._id_3C61._id_750E, level._id_3C61, var_6.origin );
    level._id_3C61 unlink();
    level._id_3C61 linkto( var_6, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_3C61 thread force_position( var_6.origin );
    level._id_3C61 unlink();
    var_7 = [];
    var_7[var_7.size] = getent( "auto4018", "targetname" );
    var_7[var_7.size] = getent( "auto4130", "targetname" );
    var_7[var_7.size] = getent( "auto4133", "targetname" );
    var_7[var_7.size] = getent( "auto4042", "targetname" );
    var_7[var_7.size] = getent( "auto4040", "targetname" );
    var_7[var_7.size] = getent( "auto4044", "targetname" );
    var_7[var_7.size] = getent( "auto4184", "targetname" );
    var_7[var_7.size] = getent( "auto4300", "targetname" );
    common_scripts\utility::_id_0D13( var_7, ::removetreadfx );
    var_8 = getaiarray( "allies" );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
    {
        if ( var_8[var_9] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_8[var_9]._id_58D7 ) && var_8[var_9]._id_58D7 )
        {
            var_8[var_9] maps\_utility::_id_8EA4();
            var_8[var_9] delete();
        }
    }

    wait 5.5;
    var_10 = var_0 - 1;
    wait(var_10);
    thread price_bridge_crawl_anims( var_4 );
    wait(var_0 - var_10);
    level._id_6F7C show();
    wait 3;
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "jeepride_pri_thebridge" );
    wait 14;
    level.griggs unlink();
    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C unlink();
    wait 2;
    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C thread maps\_spawner::_id_4241( var_1 );
    wait 2;
    common_scripts\utility::_id_383F( "stop_limp" );

    if ( !isalive( level.playercardbackground ) )
        return;

    level.playercardbackground endon( "death" );
    level.griggs thread maps\_anim::_id_0C21( level.griggs, "jeepride_grg_bouttocollapse" );
    common_scripts\_exploder::_id_3528( 11 );
    maps\_utility::_id_070A( "allies_startcolor" );
    common_scripts\utility::_id_383F( "music_bridge" );
    maps\_vehicle::_id_23DE( 66 );
    thread maps\jeepride_aud::play_mi17_scripted_sequence();
    thread maps\jeepride_aud::play_bm21_unload_troops_sequence();
    wait 5;
    wait 5;
    setup_bridge_defense();
}

removetreadfx()
{
    self waittill( "spawned", var_0 );
    var_0 notify( "kill_treads_forever" );
}

bridge_explode_start()
{
    soundscripts\_snd::_id_870C( "aud_bridge_explode_checkpoint" );
    thread bridge_explode_onstart();
    wip_start();
}

bridge_explode_onstart()
{
    getvehiclenode( "bridge_explode_onstart", "script_noteworthy" ) waittill( "trigger" );
    blow_bridge();
}

setup_bridge_defense()
{
    var_0 = getnode( "bridge_defendnode", "targetname" );
    thread dialog_bridge_radio();
    remove_non_hero_shields();
    thread maps\jeepride_code::encroacher();
    common_scripts\utility::_id_0D13( getaiarray(), ::allowallstances );
    wait 3;
    maps\_utility::_id_070A( "bridgealliesinplace" );
    common_scripts\utility::_id_3856( "no_more_drone_unloaders", 45 );
    var_1 = maps\_vehicle::_id_23DE( 72 );
    var_1 thread maps\jeepride_aud::play_last_hind_flyby();
    wait 9.8;
    maps\jeepride_code::exploder_loc( 14001 );
}

bridge_combat()
{
    soundscripts\_snd::_id_870C( "aud_bridge_combat_checkpoint" );
    common_scripts\utility::_id_383F( "music_bridge" );
    level.startdelay = 250000;
    var_0 = getent( "bridge_combat_price", "targetname" );
    var_1 = getent( "bridge_combat_griggs", "targetname" );
    var_2 = getent( "bridge_combat_player", "targetname" );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_1.origin + ( 0.0, 128.0, 0.0 ) );
    level.playercardbackground setorigin( var_2.origin );
    maps\_vehicle::_id_23DE( 66 );
    thread maps\jeepride_aud::play_mi17_unload_ennemies( "auto4413", "auto4416", 1 );
    thread maps\jeepride_aud::play_mi17_unload_ennemies( "auto5018", "auto5020", 2 );
    maps\jeepride_code::exploder_loc( 3, 1 );
    maps\jeepride_code::exploder_loc( 71, 1 );
    maps\jeepride_code::exploder_loc( 72, 1 );
    maps\jeepride_code::exploder_loc( 73 );
    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::_id_97CE );
    common_scripts\utility::_id_383F( "end_ride" );
    common_scripts\utility::_id_383F( "bridge_sequence" );
    common_scripts\utility::_id_383F( "bridge_section_start" );
    level.playercardbackground allowstand( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowsprint( 1 );
    wait 1;
    setup_bridge_defense();
    wait 0.1;
}

spawn_heros_for_start( var_0, var_1, var_2 )
{
    var_3 = getent( "price", "script_noteworthy" );
    var_3.origin = var_0;
    var_4 = var_3 stalingradspawn();
    maps\_utility::_id_88F1( var_4 );
    var_3 = getent( "griggs", "script_noteworthy" );
    var_3.origin = var_1;
    var_4 = var_3 stalingradspawn();
    maps\_utility::_id_88F1( var_4 );
    var_3 = getent( "gaz", "script_noteworthy" );
    var_3.origin = var_2;
    var_4 = var_3 stalingradspawn();
    maps\_utility::_id_88F1( var_4 );
}

bridge_zak()
{
    soundscripts\_snd::_id_870C( "aud_bridge_zak_checkpoint" );
    level.startdelay = 250000;
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_griggs_spot", "targetname" );
    var_2 = getent( "zak_player_spot", "targetname" );
    level.playercardbackground setorigin( var_2.origin );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_2.origin );
    common_scripts\utility::_id_383F( "end_ride" );
    common_scripts\utility::_id_383F( "bridge_sequence" );
    common_scripts\utility::_id_383F( "van_smash" );
    common_scripts\utility::_id_383F( "music_bridge" );
    common_scripts\utility::_id_383F( "music_zak" );
    maps\jeepride_code::exploder_loc( 73, 1 );
    wait 4.5;
    var_3 = getaiarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_3[var_4]._id_58D7 ) && var_3[var_4]._id_58D7 )
            var_3[var_4] maps\_utility::_id_8EA4();

        var_3[var_4] delete();
    }

    level.hind = maps\_vehicle::_id_23DE( 70 )[0];
    bridge_zakhaev();
}

hindset()
{
    self waittill( "trigger", var_0 );
    level.hind = var_0;
}

spawn_vehiclegroup_and_go_to_end_node_quick_and_then_blow_up_boy_this_function_name_is_sure_going_to_make_mackey_smile( var_0 )
{
    var_1 = maps\_vehicle::_id_23DE( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] vehicle_setspeed( 200, 200 );
        var_1[var_2] thread blow_up_at_end_node();
    }
}

disable_bridge_triggers_for_zak_start()
{
    var_0 = getentarray( "bridge_triggers", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_97CC();
}

blow_up_at_end_node()
{
    self waittill( "reached_end_node" );
    self._id_4257 = 0;

    if ( common_scripts\utility::_id_50F2() )
        common_scripts\_destructible::_id_3995();
    else
        self notify( "death" );
}

switch_team_fordamage()
{
    if ( self.visionsetnaked == "hind" || self.visionsetnaked == "bmp" )
        return;

    self._id_7AEF = "allies";

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1.classname ) && var_1.classname == "misc_turret" )
            break;

        if ( isdefined( var_1.visionsetnaked ) && ( var_1.visionsetnaked == "hind" || var_1.visionsetnaked == "bmp" ) )
            break;
    }

    maps\_vehicle::_id_4258();

    if ( common_scripts\utility::_id_50F2() )
        common_scripts\_destructible::_id_3995();

    self notify( "death" );
}

destructible_crumble( var_0 )
{
    var_1 = level.destructible_type[self.destuctableinfo]._id_66A7;

    for ( var_2 = 1; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !isdefined( var_1[var_2][var_4].v["tagName"] ) || !isdefined( var_1[var_2][var_4].v["modelName"] ) )
                continue;

            self notify( "damage", 300, var_0, self gettagangles( var_1[var_2][var_4].v["tagName"] ), self gettagorigin( var_1[var_2][var_4].v["tagName"] ), "bullet", var_1[var_2][var_4].v["modelName"], var_1[var_2][var_4].v["tagName"] );
            wait 0.05;
        }
    }
}

remove_non_hero_shields()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !var_0[var_1] maps\jeepride_code::ishero() && isdefined( var_0[var_1]._id_58D7 ) && var_0[var_1]._id_58D7 )
            var_0[var_1] maps\_utility::_id_8EA4();
    }
}

end_hind_action()
{
    self waittill( "trigger", var_0 );
    level.hind = var_0;
    var_0 setlookatent( level.playercardbackground );
    var_0 setturrettargetent( level.playercardbackground );
    var_0 sethoverparams( 40, 20, 15 );
    common_scripts\utility::_id_383F( "end_action_hind" );
    level.lock_on_player_ent._id_7942 = "mg_burst";
    level.lock_on_player_ent unlink();
    level.lock_on_player_ent.origin = level.playercardbackground geteye();
    level.lock_on_player_ent linkto( level.playercardbackground );
    var_0 endon( "stop_killing_theplayer" );
    wait 2;
    var_0 maps\jeepride_code::shootnearest_non_hero_friend();
    var_0 maps\jeepride_code::shootnearest_non_hero_friend();
}

refresh_burst( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );

    for (;;)
    {
        var_0._id_7942 = "mg_burst";
        wait 2;
    }
}

random_around_player( var_0 )
{
    var_1 = -1 * var_0 + randomfloat( 2 * var_0 );
    var_2 = -1 * var_0 + randomfloat( 2 * var_0 );
    var_3 = 0;
    return level.playercardbackground.origin + ( var_1, var_2, var_3 );
}

ignoreall_for_running_away()
{
    self endon( "death" );
    self.index = 1;
    self.ignoreforfixednodesafecheck = 1;
    wait 3;
    self.index = 0;
    self.ignoreforfixednodesafecheck = 0;
}

_id_6302()
{
    common_scripts\utility::_id_383D( "objective_off_the_bridge" );
    common_scripts\utility::_id_383D( "objective_finishedthelevel" );
    objective_add( 1, "active", &"JEEPRIDE_SURVIVE_THE_ESCAPE" );
    objective_current( 1 );
    common_scripts\utility::_id_384A( "objective_finishedthelevel" );
    objective_state( 1, "done" );
}

enemys_run_to_safety()
{
    var_0 = getaiarray( "axis" );
    var_1 = getentarray( "endenemypile", "targetname" );
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3] maps\_utility::_id_2A74();
        var_0[var_3].goalradius = 32;
        var_0[var_3] _meth_81aa( var_1[var_2].origin );
        var_0[var_3] thread ignoreall_for_running_away();
        var_2++;

        if ( var_2 == var_1.size )
            var_2 = 0;
    }
}

end_action()
{
    common_scripts\utility::_id_384A( "end_action_bmp" );
    remove_non_hero_shields();
    common_scripts\utility::_id_384A( "end_action_hind" );
    maps\_utility::_id_070A( "friends_fall_back" );
    enemys_run_to_safety();
    common_scripts\utility::_id_0D13( maps\_vehicle::get_script_vehicles(), ::switch_team_fordamage );
    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getaiarray( "allies" ), ::ignoreall_for_running_away );
    common_scripts\utility::_id_0D13( getentarray( "bridge_triggers2", "script_noteworthy" ), common_scripts\utility::_id_97CE );
    thread bridge_blow_trigger();
}

end_bmp_action()
{
    level endon( "bridge_zakhaev_setup" );
    self waittill( "trigger", var_0 );
    common_scripts\utility::_id_383F( "end_action_bmp" );
    var_0 thread maps\jeepride_code::vehicle_turret_think();
}

bridge_blow_trigger()
{
    wait 0.5;
    thread bridge_zakhaev();
    wait 4.5;
    setomnvar( "ui_jeepride_firefight_recover", 1 );
}

trigger_set_cover_from_heli()
{
    level endon( "cover_from_heli" );

    if ( !level.playercardbackground istouching( self ) )
        self waittill( "trigger" );

    common_scripts\utility::_id_383F( "cover_from_heli" );
}

attack_origin_with_targetname( var_0 )
{
    var_1 = getent( var_0, "targetname" ).origin;
    badplace_cylinder( "tanktarget", 4, var_1, 750, 300, "allies", "axis" );
    self _meth_825d( var_1 );
    self waittill( "turret_on_target" );
    maps\jeepride_code::vehicle_fire_main_cannon( 24 );
}
#using_animtree("generic_human");

force_position( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    self dontinterpolate();
    self _meth_8140( "forcemove", var_0, ( 0.0, 88.0, 0.0 ), %dying_crawl );
}

dying_crawl()
{
    self endon( "death" );
    self.holdingweapon = 0;
    animscripts\shared::_id_6869( self.weapon_switch_invalid, "none" );

    for (;;)
    {
        self _meth_8140( "dieingcrawl", self.origin, ( 0.0, 88.0, 0.0 ), %dying_crawl );
        self waittillmatch( "dieingcrawl", "end" );
    }
}

angletoplayer()
{
    return vectortoangles( level.playercardbackground.origin - self.origin );
}

escape_shellshock_heartbeat()
{
    level endon( "stop_heartbeat_sound" );
    var_0 = -0.5;

    for (;;)
    {
        level.playercardbackground maps\_utility::_id_69C4( "breathing_heartbeat" );

        if ( var_0 > 0 )
            wait(var_0);

        var_0 += 0.1;
    }
}

escape_shellshock_thing( var_0 )
{
    maps\jeepride_code::exploder_loc( 14000 );
    level.playercardbackground maps\_utility::_id_27EF( 1.5, maps\_utility::_id_69C4, "breathing_hurt_start" );
    level.playercardbackground maps\_utility::_id_27EF( 2.5, maps\_utility::_id_69C4, "breathing_hurt" );
    level.playercardbackground maps\_utility::_id_27EF( 4, maps\_utility::_id_69C4, "breathing_hurt" );
    level.playercardbackground maps\_utility::_id_27EF( 5, maps\_utility::_id_69C4, "breathing_hurt" );
    level.playercardbackground maps\_utility::_id_27EF( 13, maps\_utility::_id_69C4, "breathing_better" );
    level.playercardbackground maps\_utility::_id_27EF( 16, maps\_utility::_id_69C4, "breathing_better" );
    thread overlaysmoke();
    var_1 = maps\jeepride_code::_id_23D0( "black", 0 );
    var_1 thread maps\jeepride_code::exp_fade_overlay( 1, 0.55 );
    earthquake( 0.65, 1, level.playercardbackground.origin, 1000 );
    level.playercardbackground playrumbleonentity( "tank_rumble" );
    level thread maps\_utility::_id_61FD( "stop_heartbeat_sound", 18 );
    level.playercardbackground freezecontrols( 1 );
    level.playercardbackground disableweapons();
    waitframe;
    wait 1;
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 5, 5, 5, 5, 1 );
    level.playercardbackground freezecontrols( 0 );
    delete_all_non_heros();
    maps\jeepride_code::remove_all_weapons();
    clearallcorpses();
    maps\jeepride_code::remove_all_weapons();
    wait 1;
    var_2 = 0.5;
    wait 1;
    wait 0.5;
    maps\jeepride_code::remove_all_weapons();
    level.playercardbackground takeallweapons();
    var_1 thread maps\jeepride_code::exp_fade_overlay( 0, 3 );
    maps\_utility::_id_27EF( 3.1, ::_destroy, var_1 );
    soundscripts\_snd::_id_870C( "aud_start_slowmo_mix" );
}

_destroy( var_0 )
{
    var_0 destroy();
}

delete_all_non_heros()
{
    var_0 = getaiarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_0[var_1]._id_58D7 ) )
            var_0[var_1] maps\_utility::_id_8EA4();

        var_0[var_1] delete();
    }
}

set_player_eye_target()
{
    var_0 = spawn( "script_origin", level.playercardbackground geteye() );
    var_0 thread maintain_player_eye_target();
    return var_0;
}

maintain_player_eye_target()
{
    for (;;)
    {
        self.origin = level.playercardbackground geteye();
        wait 0.05;
    }
}

stop_anim_scripted_on_death()
{
    self waittill( "death" );
    self _meth_8143();
}

killguy( var_0 )
{
    var_0 kill();
}

hold_fordeath( var_0 )
{
    self.origin = var_0.origin;
    self.angles = var_0.angles;
    maps\_anim::_id_0BC7( var_0, "pain_pose" );
}

end_scene_actor_unlink_on_death()
{
    self waittill( "death" );
    self unlink();
}

zakhaev_buddy2_execute_guy( var_0 )
{
    self waittillmatch( "single anim", "fire" );
    wait 0.05;

    if ( !isalive( var_0 ) )
        return;

    magicbullet( self.weapon_switch_invalid, self gettagorigin( "tag_flash" ), var_0 geteye() );
}

bridge_zakhaev()
{
    if ( !isalive( level._id_6F7C ) || !isalive( level.griggs ) || !isalive( level._id_3C61 ) || !isalive( level.playercardbackground ) )
        return;

    setsaveddvar( "compass", "0" );
    common_scripts\utility::_id_383F( "bridge_zakhaev_setup" );
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_gaz_spot", "targetname" );
    var_2 = getent( "zak_griggs_spot", "targetname" );
    var_3 = getent( "zak_price_spot_hide", "targetname" );
    maps\jeepride_code::kill_unload_que();
    maps\_utility::_id_27EF( 1, maps\_utility::_id_0CC5 );
    maps\_utility::_id_070A( "clear_fastropers" );
    level._id_6F7C maps\_utility::_id_2A74();
    level._id_3C61 maps\_utility::_id_2A74();
    level.griggs maps\_utility::_id_2A74();
    level._id_6F7C.goalradius = 32;
    level._id_3C61.goalradius = 32;
    level.griggs.goalradius = 32;
    level._id_6F7C _meth_81aa( var_3.origin );
    level._id_3C61 _meth_81aa( var_1.origin );
    level.griggs _meth_81aa( var_2.origin );

    if ( !isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C thread maps\_utility::_id_58D7();

    if ( !isdefined( level.griggs._id_58D7 ) )
        level.griggs thread maps\_utility::_id_58D7();

    if ( !isdefined( level._id_3C61._id_58D7 ) )
        level._id_3C61 thread maps\_utility::_id_58D7();

    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowjump( 0 );
    var_4 = maps\_utility::_id_88D1( "playerview" );
    var_5 = getent( "player_drag_node", "targetname" );
    var_5 maps\_anim::_id_0BC7( var_4, "drag_player" );
    setsaveddvar( "nightVisionDisableEffects", 1 );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3FA9( "hawks" ), common_scripts\utility::_id_671F );
    thread music_zak_timing();
    hind_shoots_the_tanker( var_4.origin );
    setsaveddvar( "hud_showstance", 0 );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3FA9( "cloud_bank_far" ), common_scripts\utility::_id_671F );
    waitframe;
    escape_shellshock_thing( var_4 );
    thread maps\_utility::_id_114E();
    maps\jeepride_code::exploder_loc( 142 );
    maps\jeepride_code::exploder_loc( 143 );
    thread bx_warmup_vfx_end();

    if ( level._id_8C36 != "bridge_zak" )
        level.hind notify( "gunner_new_target" );

    common_scripts\utility::_id_0D13( maps\_vehicle::get_script_vehicles(), ::stop_thinking );
    thread h1_jeepride_bridgeending_dof_seq();
    thread h1_jeepride_bridgeending_rumbles();
    thread h1_finalsequence_fade_seq();
    setsaveddvar( "sM_sunSampleSizeNear", 0.16 );
    setsaveddvar( "sm_sunShadowScale", 1 );
    level._id_3C61 maps\_utility::_id_8EA4();
    var_6 = level._id_3C61 maps\_vehicle_aianim::_id_21A2( level._id_3C61 );
    var_6.origin = var_1.origin;
    var_6 fakeout_donotetracks_animscripts();
    maps\_vehicle_aianim::_id_297A( var_6, "weapon_" );
    level.griggs maps\_utility::_id_8EA4();
    var_7 = level.griggs maps\_vehicle_aianim::_id_21A2( level.griggs );
    var_7._id_0C72 = "griggs";
    var_7 maps\_anim::_id_7F29();
    level._id_6F7C maps\_utility::_id_8EA4();
    thread maps\jeepride_code::bloodtrail_spawn();
    thread maps\jeepride_code::set_final_visionset();
    var_8 = spawn( "script_model", level._id_6F7C.origin );
    var_8.origin = level._id_6F7C.origin;
    var_8 setmodel( level._id_6F7C.motiontrackerenabled );

    if ( isdefined( level._id_6F7C.headmodel ) )
        var_8 attach( level._id_6F7C.headmodel, "", 1 );

    level._id_6F7C delete();
    level.pricedummy = var_8;
    var_8._id_0C72 = "price";
    var_8 maps\_anim::_id_7F29();
    maps\_vehicle_aianim::_id_297A( var_8, "weapon_" );
    var_8 attach( "weapon_colt1911_black", "tag_weapon_right" );
    var_9 = getent( "end_friend_2", "targetname" ) stalingradspawn();
    maps\_utility::_id_88F1( var_9 );
    var_9._id_0C72 = "end_friend_2";
    var_9._id_0BE5 = getent( var_9._not_team, "targetname" );
    var_9.dropweapon = 0;
    var_10 = getent( "end_friend_3", "targetname" ) stalingradspawn();
    maps\_utility::_id_88F1( var_10 );
    var_10.dropweapon = 0;
    var_10._id_0C72 = "end_friend_3";
    var_10._id_0BE5 = getent( var_10._not_team, "targetname" );
    var_11[0] = var_8;
    var_12[0] = var_7;
    var_12[1] = var_4;
    maps\jeepride_code::remove_all_weapons();
    maps\_utility::_id_27EF( 2, maps\_utility::_id_5689, 5, 55 );
    thread bridge_zak_friendly_attack_heli();
    waitframe;
    var_5 thread maps\_anim::_id_0C18( var_12, "drag_player" );
    var_7 thread maps\jeepride_code::spawn_griggs_pistol();
    thread maps\jeepride_code::light_sequence_00();
    thread maps\jeepride_code::light_sequence_01();
    var_13 = var_6;
    var_13._id_0C72 = "end_friend_1";
    var_5 maps\_anim::_id_0BC7( var_13, "end_scene_01" );
    var_9 thread maps\jeepride_code::blead_on_death();
    var_9._id_2652 = %dying_crawl_death_v1;
    var_9._id_0BE5 thread maps\_utility::_id_3AF2( maps\_anim::_id_0BE1, var_9, "pain_loop" );
    var_10 thread maps\jeepride_code::blead_on_death();
    var_10._id_2652 = %dying_back_death_v2;
    var_10._id_0BE5 thread maps\_utility::_id_3AF2( maps\_anim::_id_0C24, var_10, "intopain" );
    var_10._id_0BE5 thread maps\_utility::_id_3AF2( maps\_anim::_id_0BE1, var_10, "pain_loop" );
    var_9 hide();
    var_10 hide();
    maps\_utility::_id_27EF( 0.25, maps\_anim::_id_0C13, var_9, "intopain", 20 );
    maps\_utility::_id_27EF( 0.25, maps\_anim::_id_0C13, var_10, "intopain", 20 );
    var_0 thread maps\_anim::_id_0C18( var_11, "drag_player" );

    if ( getdvar( "chaplincheat" ) == "1" )
        thread bridge_zak_slomo_script_timed_chaplincheat();
    else
        thread bridge_zak_slomo_script_timed();

    level.playercardbackground thread end_slowmo_on_death();
    var_9 maps\_utility::_id_27EF( 1.3, ::_show );
    var_10 maps\_utility::_id_27EF( 1.3, ::_show );
    common_scripts\_exploder::_id_3528( "2001" );
    var_4 waittillmatch( "single anim", "start_price" );
    var_0 thread maps\_anim::_id_0C18( var_11, "jeepride_ending_price01" );
    var_4 waittillmatch( "single anim", "start_approach" );
    level notify( "stop_drag_shots" );
    level.hind thread maps\jeepride_aud::play_zak_enemy_heli_sfx();
    var_14 = getent( "zakhaev", "targetname" ) stalingradspawn();
    maps\_utility::_id_88F1( var_14 );
    var_14._id_0C72 = "zakhaev";
    var_14.dropweapon = 0;
    var_14._id_6159 = 1;
    var_14._id_613F = 1;
    var_14.tracksuit_ignore = 1;
    var_15 = getent( "zakhaev_buddy1", "targetname" ) stalingradspawn();
    maps\_utility::_id_88F1( var_15 );
    var_15._id_0C72 = "zakhaev_buddy1";
    var_15.tracksuit_ignore = 1;
    var_15._id_6159 = 1;
    var_15._id_613F = 1;
    var_16 = getent( "zakhaev_buddy2", "targetname" ) stalingradspawn();
    maps\_utility::_id_88F1( var_16 );
    var_16._id_0C72 = "zakhaev_buddy2";
    var_16.tracksuit_ignore = 1;
    var_16._id_6159 = 1;
    var_16._id_613F = 1;
    var_16 thread zakhaev_buddy2_execute_guy( var_10 );
    var_17 = set_player_eye_target();
    var_18 = [];
    var_18[0] = var_14;
    var_18[1] = var_15;
    var_18[2] = var_16;
    thread bridge_zak_guys_dead( var_18 );
    var_14 thread maps\jeepride_code::blead_on_death( 5 );
    var_15 thread maps\jeepride_code::blead_on_death();
    var_16 thread maps\jeepride_code::blead_on_death();
    level._id_60CB = 800;

    for ( var_19 = 0; var_19 < var_18.size; var_19++ )
    {
        var_20 = spawn( "script_origin", var_18[var_19].origin );
        var_18[var_19] maps\_utility::_id_2A74();
        var_18[var_19] _meth_81aa( var_18[var_19].origin );
        var_18[var_19].goalradius = 32;
        var_18[var_19] linkto( var_20 );
        var_18[var_19] thread end_scene_actor_unlink_on_death();

        if ( getdvar( "jeepride_multi_shot" ) == "off" )
            var_18[var_19].helmet = 1;
        else
            var_18[var_19] thread stop_animscripted_on_damage();

        var_18[var_19].allowdeath = 1;
        var_18[var_19].grenadeammo = 0;
    }

    var_18[3] = var_13;
    level.attack_helidummy notsolid();
    var_9.allowdeath = 1;
    var_10.allowdeath = 1;
    var_9.helmet = 1;
    var_10.helmet = 1;
    var_5 thread maps\_anim::_id_0C24( level.attack_helidummy, "end_scene_01" );
    var_5 thread maps\_anim::_id_0C18( var_18, "end_scene_01" );
    maps\_utility::_id_27EF( 8.15, maps\jeepride_code::shot_in_the_head_point_blank, var_13, ( 3.0, -4.0, 6.0 ), ( 105.0, -80.0, 0.0 ) );
    maps\_utility::_id_27EF( 13.1, maps\jeepride_code::shot_in_the_head_point_blank, var_9, ( -5.0, 2.0, 2.0 ), ( 42.0, -8.0, 0.0 ) );
    maps\_utility::_id_27EF( 8.65, maps\jeepride_code::shot_in_the_head_point_blank, var_10, ( -2.0, 3.0, 4.0 ), ( 100.0, 42.0, 0.0 ) );
    maps\_utility::_id_27EF( 0.72, common_scripts\utility::_id_383F, "attack_heli" );
    var_4 waittillmatch( "single anim", "start_price" );
    thread maps\_utility::_id_114E();
    setomnvar( "ui_jeepride_firefight_recover", 0 );
    var_0 thread maps\_anim::_id_0C18( var_11, "jeepride_ending_price02" );
    var_4 waittillmatch( "single anim", "start_end_badguys" );
    var_18 = common_scripts\utility::_id_0CF6( var_18, var_13 );
    level.player_takes_shots = 0;
    anim._id_37BF["scripted"] = ::shot_counter;
    anim._id_83F3 = ::shot_counter;
    var_5 thread maps\_anim::_id_0C18( var_18, "end_scene_02" );
    var_4 waittillmatch( "single anim", "start_end" );
    level.playercardbackground playerlinktodelta( var_4, "tag_player", 1, 45, 45, 45, 7 );
    level.playercardbackground disableinvulnerability();
    level.playercardbackground giveweapon( "colt45_zak_killer" );
    level.playercardbackground givemaxammo( "colt45_zak_killer" );
    level.playercardbackground switchtoweapon( "colt45_zak_killer" );
    level.playercardbackground enableweapons();
    level.playercardbackground allowmelee( 0 );
    level.playercardbackground setviewmodel( "viewhands_sas_woodland" );
    setsaveddvar( "hud_drawhud", "1" );
    var_8 detach( "weapon_colt1911_black", "tag_weapon_right" );
    level.attack_helidummy hide();
    var_4 waittillmatch( "single anim", "end" );
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    bridge_rescue( var_4 );
}

h1_jeepride_bridgeending_dof_seq()
{
    level.playercardbackground _meth_84a7( 1.0, 50, 9.0, 9.0 );
    level.playercardbackground _meth_84a5();
    setsaveddvar( "r_mbEnable", 2 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 2.5, 16, 1.0, 1.0 );
    wait 2.0;
    level.playercardbackground _meth_84a7( 3.0, 40, 2.5, 2.5 );
    wait 1.0;
    wait 4.5;
    level.playercardbackground _meth_84a7( 3.5, 60, 1.0, 1.0 );
    wait 5.5;
    level.playercardbackground _meth_84a7( 3.8, 58, 2.0, 2.0 );
    wait 1.5;
    level.playercardbackground _meth_84a7( 1.5, 175, 1.5, 1.5 );
    wait 0.75;
    thread maps\_utility::_id_5689( 1.25, 50 );
    wait 4.0;
    thread maps\_utility::_id_5689( 2.4, 55 );
    common_scripts\utility::_id_384A( "attack_heli" );
    level.playercardbackground _meth_84a7( 1.5, 480, 1.0, 1.0 );
    wait 2.75;
    level.playercardbackground _meth_84a7( 1.8, 370, 0.5, 0.5 );
    wait 4.5;
    level.playercardbackground _meth_84a7( 1.5, 360, 4.5, 4.5 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 1.8, 370, 4.5, 4.5 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 1.2, 210, 0.7, 0.7 );
    wait 3.5;
    level.playercardbackground _meth_84a7( 2.0, 1500, 2.0, 2.0 );
    wait 3.5;
    level.playercardbackground _meth_84a7( 2.0, 1600, 2.0, 2.0 );
    wait 1.0;
    thread maps\_utility::_id_5689( 1.35, 47 );
    wait 0.5;
    level.playercardbackground _meth_84a7( 1.5, 180, 4.0, 4.0 );
    wait 2.65;
    level.playercardbackground _meth_84a7( 4.0, 23, 0.7, 0.7 );
    thread maps\_utility::_id_5689( 2.0, 55 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 12.5, 205, 2.0, 2.0 );
    wait 1.5;
    setsaveddvar( "r_mbEnable", 0 );
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    level.playercardbackground _meth_84a7( 4.5, 500, 0.3, 0.3 );
    setsaveddvar( "r_mbEnable", 2 );
    wait 17.0;
    level.playercardbackground _meth_84a7( 4.0, 250, 0.8, 0.8 );
    common_scripts\utility::_id_384A( "kamarov_runs" );
    h1_endingrescuehidenames();
    wait 0.5;
    level.playercardbackground _meth_84a7( 3.5, 24, 0.2, 0.2 );
    wait 4.0;
    level.playercardbackground _meth_84a7( 4.5, 13, 1.0, 1.0 );
    wait 3.5;
    level.playercardbackground _meth_84a7( 4.5, 50, 2.5, 2.5 );
    wait 2.5;
    level.playercardbackground _meth_84a7( 4.5, 60, 2.0, 2.0 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 3.0, 600, 2.0, 2.0 );
    wait 1.5;
    level.playercardbackground _meth_84a7( 4.5, 40, 2.0, 2.0 );
    wait 2.0;
    thread maps\_utility::_id_5689( 2.0, 70 );
    wait 3.5;
    thread maps\_utility::_id_5689( 2.5, 65 );
    wait 2.0;
    level.playercardbackground _meth_84a7( 3.0, 135, 1.2, 1.2 );
    wait 10.0;
    level.playercardbackground _meth_84a7( 3.5, 70, 1.0, 1.0 );
    wait 3.0;
    level.playercardbackground _meth_84a7( 2.5, 300, 1.0, 1.0 );
    wait 10.0;
    level.playercardbackground _meth_84a6();
    setsaveddvar( "r_mbEnable", 0 );
}

h1_endingrescuehidenames()
{
    level.ru2 maps\_utility::_id_27EF( 2.5, common_scripts\utility::_id_4853, "" );
    level.ru1 maps\_utility::_id_27EF( 9.0, common_scripts\utility::_id_4853, "" );
}

h1_jeepride_bridgeending_rumbles()
{
    wait 1.0;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 12.4;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.85;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 0.25;
    thread h1_endingcutsceneshakesystem( "Touch" );
    thread maps\jeepride_code::set_final_visionset_griggsdeath();
    thread maps\jeepride_code::set_final_visionset_zakaev();
    common_scripts\utility::_id_384A( "attack_heli" );
    wait 7.5;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 4.35;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Explosion" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 7.85;
    thread h1_endingcutsceneshakesystem( "Touch" );
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    thread maps\jeepride_code::set_final_visionset_rescue();
    common_scripts\utility::_id_384A( "kamarov_runs" );
    wait 3.65;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 6.15;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 2.5;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 16.15;
    thread h1_endingcutsceneshakesystem( "Touch" );
}

h1_endingcutsceneshakesystem( var_0 )
{
    var_1 = "";
    var_2 = 0.0;
    var_3 = 0.0;
    var_4 = "";
    var_5 = 0.07;
    var_6 = 0.11;
    var_7 = 0.2;
    var_8 = level.playercardbackground getorigin();

    switch ( var_0 )
    {
        case "Heartbeat":
            var_1 = "normal";
            var_2 = var_5;
            var_3 = 0.3;
            var_4 = "damage_light";
            break;
        case "Touch":
            var_1 = "normal";
            var_2 = var_6;
            var_3 = 0.4;
            var_4 = "damage_light";
            break;
        case "Explosion":
            var_1 = "fade";
            var_2 = var_7;
            var_3 = 1.0;
            var_4 = "tank_rumble";
            break;
        case "Gunshot":
            var_1 = "normal";
            var_2 = var_6;
            var_3 = 0.5;
            var_4 = "damage_light";
            break;
    }

    if ( var_1 == "normal" )
    {
        if ( var_4 != "" )
            level.playercardbackground playrumbleonentity( var_4 );

        earthquake( var_2, var_3, var_8, 100 );
        wait(var_3);

        if ( var_4 == "tank_rumble" )
            level.playercardbackground stoprumble( "tank_rumble" );
    }
    else if ( var_1 == "fade" )
    {
        if ( var_4 != "" )
            level.playercardbackground playrumbleonentity( var_4 );

        earthquake( var_2 * 0.6, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
        earthquake( var_2 * 1.0, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);

        if ( var_4 == "tank_rumble" )
            level.playercardbackground stoprumble( "tank_rumble" );

        earthquake( var_2 * 0.5, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
        earthquake( var_2 * 0.2, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
    }
}

stop_animscripted_on_damage()
{
    self waittill( "damage" );
    self _meth_8143();
}

_show()
{
    self show();
}

player_janxed_end_shot( var_0 )
{
    level endon( "all_end_scene_guys_dead" );

    for (;;)
    {
        while ( !level.playercardbackground isfiring() )
            wait 0.05;

        var_1 = undefined;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( janxed_end_shot( var_0[var_2] ) )
                var_1 = var_0[var_2];
        }

        if ( isdefined( var_1 ) )
        {
            var_1 kill( var_1 geteye(), level.playercardbackground );
            var_0 = common_scripts\utility::_id_0CF6( var_0, var_1 );
        }

        if ( !var_0.size )
            break;

        while ( level.playercardbackground isfiring() )
            wait 0.05;
    }
}

janxed_end_shot( var_0 )
{
    return common_scripts\utility::_id_A347( level.playercardbackground geteye(), level.playercardbackground getplayerangles(), var_0 geteye(), cos( 5 ) );
}

arrival_disable()
{
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
}

offset_ent()
{
    self.origin += level.rescue_scene_offset;
}

h1_rescue_viewclamplerp()
{
    level.playercardbackground lerpviewangleclamp( 7, 0, 0, 33, 33, 33, 3 );
    wait 6.5;
    level.playercardbackground lerpviewangleclamp( 7, 0, 0, 19, 19, 19, 3 );
    wait 6.5;
    level.playercardbackground lerpviewangleclamp( 7, 0, 0, 5, 5, 5, 5 );
}

bridge_rescue( var_0 )
{
    setsaveddvar( "hud_drawhud", "1" );
    setsaveddvar( "hud_showstance", "0" );
    thread h1_rescue_viewclamplerp();
    maps\_utility::_id_27EF( 1, maps\_utility::_id_5689, 8, 65 );
    level.playercardbackground disableweapons();
    common_scripts\utility::_id_383F( "music_rescue" );
    var_1 = getent( "rescue_price_spot", "targetname" );
    var_1 thread maps\_anim::_id_0BC7( level.pricedummy, "jeepride_CPR_price" );
    maps\_utility::_id_27EF( 3, common_scripts\utility::_id_383F, "slomo_done" );
    maps\jeepride_code::light_sequence_02();
    var_2 = getent( "player_drag_node", "targetname" );
    var_2 thread maps\_anim::_id_0C24( var_0, "drag_player_wait" );
    var_3 = getent( "rescuenode", "script_noteworthy" );
    var_3 waittill( "trigger", var_4 );
    soundscripts\_snd::_id_870C( "start_rescue_mix" );
    thread bx_vfx_wind_kill();
    var_4 waittill( "unloaded" );
    var_4 sethoverparams( 50, 15, 15 );
    var_5 = maps\jeepride_code::_id_23D0( "black", 0 );
    level.ru1 maps\_utility::_id_8EA4();
    level.ru2 maps\_utility::_id_8EA4();
    var_6 = level.ru1;
    var_7 = level.ru2;
    level.ru1 thread maps\_utility::_id_69C5( "jeepride_ru1_barelybreathing" );
    var_8 = [];
    var_8[0] = var_6;
    var_8[1] = var_7;
    common_scripts\utility::_id_0D13( var_8, ::arrival_disable );
    thread movenlinkh1( var_2, var_0 );
    var_2 thread maps\_anim::_id_0BFF( var_6, "player_pickup" );
    common_scripts\utility::_id_0D13( getentarray( "rescue_scene_patrol_01", "targetname" ), maps\jeepride_code::rescue_scene_patrol_01 );
    common_scripts\utility::_id_383F( "kamarov_runs" );
    var_4 sethoverparams( 0, 0, 0 );
    var_4 maps\_utility::_id_27EF( 6, maps\_vehicle::_id_9D17, getent( "chopper_rescuer", "targetname" ) );
    var_5 thread maps\jeepride_code::exp_fade_overlay( 0, 1 );
    var_8 = [];
    var_8[0] = var_6;
    var_8[1] = var_7;
    var_8[2] = var_0;
    thread dof_focuser_tag( var_7, 30 );
    var_2 thread maps\_anim::_id_0C18( var_8, "player_pickup" );
    wait 9.7;
    var_6 _meth_81aa( var_6.origin );
    var_7 _meth_81aa( var_7.origin );
    var_9 = level.medic;
    var_1 thread maps\_anim::_id_0BC7( var_9, "jeepride_CPR_medic" );
    thread dof_focuser_tag( var_9, 30 );
    maps\_utility::_id_27EF( 3, common_scripts\utility::_id_383F, "rescue_chopper_adjust" );
    wait 4;
    var_1 maps\_utility::_id_27EF( 3.5, maps\_anim::_id_0C24, var_9, "jeepride_CPR_medic" );
    var_1 maps\_utility::_id_27EF( 3.5, maps\_anim::_id_0C24, level.pricedummy, "jeepride_CPR_price" );
    maps\_utility::_id_27EF( 20, ::dof_focuser_tag, var_4, 100, "tag_ground", 7 );
    maps\_utility::_id_27EF( 13, ::beam_me_up_to_the_chopper, var_0 );
    maps\_utility::_id_27EF( 15, ::earthquaker_small );
    maps\_utility::_id_27EF( 5, ::dialog_bbc );
    common_scripts\utility::_id_0D13( maps\_vehicle::get_script_vehicles(), maps\_vehicle::volume_down, 20 );
    overlay_cpr( var_5 );
    common_scripts\utility::_id_383F( "cpr_finished" );
    wait 19;
    maps\_utility::_id_60D6();
}

dialog_bbc()
{
    wait 13;
    level.playercardbackground maps\_utility::_id_69C4( "jeepride_bbc_missiletest" );
    wait 0.5;
    level.playercardbackground maps\_utility::_id_69C4( "jeepride_bbc_unprotocols" );
    wait 0.5;
    level.playercardbackground maps\_utility::_id_69C4( "jeepride_bbc_rumors" );
    wait 1;
    level.playercardbackground maps\_utility::_id_69C4( "jeepride_bbc_calledoff" );
}

set_rescue_guy_pos()
{
    level.medic thread rescue_guy_pos( getent( "end_stander_medic", "targetname" ) );
    level.ru1 thread rescue_guy_pos( getent( "end_stander_ru1", "targetname" ) );
    level.ru2 thread rescue_guy_pos( getent( "end_stander_ru2", "targetname" ) );
}

rescue_guy_pos( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "tag_origin" );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    self linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self _meth_81ce( "stand" );
    self _meth_8140( "animscripted", var_1.origin, var_1.angles, %crouch2stand );
    animscripts\shared::_id_2D06( "animscripted" );
}

stand_up()
{
    self _meth_81ce( "stand" );
    self _meth_8140( "animscripted", self.origin, self.angles, %crouch2stand );
    animscripts\shared::_id_2D06( "animscripted" );
}

movenlink( var_0, var_1 )
{
    lerp_player_view_to_position_oldstyle_loc( var_1 gettagorigin( "tag_player" ), var_1 gettagangles( "tag_camera" ), 0.9, 1, 0, 0, 0, 0 );
    level.playercardbackground playerlinktodelta( var_1, "tag_player", 1, 5, 5, 5, 5 );
}

movenlinkh1( var_0, var_1 )
{

}

lerp_player_view_to_position_oldstyle_loc( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_9.origin = level.playercardbackground maps\_utility::_id_3E24();
    var_9.angles = level.playercardbackground getplayerangles();

    if ( isdefined( var_8 ) )
        level.playercardbackground playerlinktodelta( var_9, "", var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_4 ) )
        level.playercardbackground playerlinktodelta( var_9, "", var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_3 ) )
        level.playercardbackground playerlinktodelta( var_9, "", var_3 );
    else
        level.playercardbackground playerlinktodelta( var_9 );

    var_9 moveto( var_0, var_2, var_2 * 0.25, var_2 * 0.25 );
    var_9 rotateto( var_1, var_2, var_2 * 0.25, var_2 * 0.25 );
    wait(var_2 - 0.05);
}

overlay_cpr( var_0 )
{
    wait 22.3;
    var_1 = var_0;
    var_1 setshader( "white", 640, 480 );
    var_1 maps\_utility::_id_27EF( 7.55, maps\jeepride_code::exp_fade_overlay, 1, 2 );
    maps\_utility::_id_27EF( 3.25, ::_setblur, 2.4, 6 );
    soundscripts\_snd::_id_870C( "start_last_whitescreen_mix" );
    maps\_utility::_id_7F00( "jeepride_flyaway", 8 );
    wait 8;
}

h1_bridgewakeup_fade_seq()
{
    maps\_utility::_id_27EF( 1.0, ::h1_blinkblursystem, 1.5, 0.2, "noblur" );
    maps\_utility::_id_27EF( 8.5, ::h1_blinkblursystem, 1.5, 0.3, "noblur" );
    maps\_utility::_id_27EF( 14.0, ::h1_blinkblursystem, 1.5, 0.4 );
    maps\_utility::_id_27EF( 18.5, ::h1_blinkblursystem, 1.5, 0.3 );
    maps\_utility::_id_27EF( 21.0, ::h1_blinkblursystem, 1.5, 0.2 );
}

h1_finalsequence_fade_seq()
{
    thread h1_blinkblursystem( 2.0, 0.8, "noblur" );
    maps\_utility::_id_27EF( 3.5, ::h1_blinkblursystem, 2.0, 0.4 );
    maps\_utility::_id_27EF( 8.5, ::h1_blinkblursystem, 1.5, 0.4, "noblur" );
    maps\_utility::_id_27EF( 13.3, ::h1_blinkblursystem, 1.0, 0.2 );
    maps\_utility::_id_27EF( 15.2, ::h1_blinkblursystem, 1.8, 0.5 );
    maps\_utility::_id_27EF( 18.5, ::h1_blinkblursystem, 1.0, 0.2 );
    maps\_utility::_id_27EF( 19.8, ::h1_blinkblursystem, 1.8, 0.3 );
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    maps\_utility::_id_27EF( 4.0, ::h1_blinkblursystem, 3.0, 0.3 );
    maps\_utility::_id_27EF( 8.0, ::h1_blinkblursystem, 3.0, 0.4 );
    maps\_utility::_id_27EF( 13.7, ::h1_blinkblursystem, 3.7, 0.3 );
    common_scripts\utility::_id_384A( "kamarov_runs" );
    maps\_utility::_id_27EF( 1.3, ::h1_blinkblursystem, 2.7, 0.4 );
    maps\_utility::_id_27EF( 7.0, ::h1_blinkblursystem, 2.0, 0.3, "noblur" );
    maps\_utility::_id_27EF( 15.3, ::h1_blinkblursystem, 2.6, 0.3 );
    maps\_utility::_id_27EF( 22.0, ::h1_blinkblursystem, 2.8, 0.4 );
    maps\_utility::_id_27EF( 26.2, ::h1_blinkblursystem, 2.8, 0.4 );
    maps\_utility::_id_27EF( 29.6, ::h1_blinkblursystem, 4.0, 0.6 );
}

h1_blinkblursystem( var_0, var_1, var_2 )
{
    var_3 = var_0 * 0.4;
    var_4 = var_0 * 0.2;
    var_5 = var_0 * 0.4;
    var_6 = var_1 * 4 + 0.5;
    thread h1_onefade( var_3, var_4, var_5, var_1 );

    if ( isdefined( var_2 ) )
        return;

    thread h1_blur_overlay( var_6, var_3 * 0.5, 0, var_5, var_4 );
    return;
}

h1_onefade( var_0, var_1, var_2, var_3 )
{
    var_4 = newhudelem();
    var_4.xpmaxmultipliertimeplayed = 0;
    var_4._id_0538 = 0;
    var_4 setshader( "black", 640, 480 );
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.hostquits = "fullscreen";
    var_4.visionsetnight = "fullscreen";
    var_4.alpha = 0;
    var_4.space = 1;
    var_4.foreground = 1;
    var_4 fadeovertime( var_0 );
    var_4.alpha = var_3;
    wait(var_1 + 0.15);
    var_4 fadeovertime( var_2 );
    var_4.alpha = 0;
    wait(var_2 + 0.15);
    var_4 destroy();
}

h1_blur_overlay( var_0, var_1, var_2, var_3, var_4 )
{
    setblur( var_0, var_1 );
    wait(var_1 + var_4);
    setblur( var_2, var_3 );
}

earthquaker_small()
{
    thread common_scripts\_exploder::_id_3528( 192 );
    var_0 = 0.12;

    for (;;)
    {
        earthquake( var_0, randomfloatrange( 0.8, 1.0 ), level.playercardbackground.origin, 150 );
        wait(randomfloatrange( 0.2, 0.4 ));
    }
}

_setblur( var_0, var_1 )
{
    if ( getdvar( "jeepride_player_pickup" ) == "off" )
        setblur( var_0, var_1 );
}

dof_focuser_tag( var_0, var_1, var_2, var_3, var_4 )
{
    level notify( "new_dof_focus" );
    level endon( "new_dof_focus" );

    if ( !isdefined( var_3 ) )
        var_3 = 4;

    if ( !isdefined( var_4 ) )
        var_4 = 4;

    if ( !isdefined( var_2 ) )
        var_2 = "J_Head";

    for (;;)
    {
        var_5 = distance( level.playercardbackground geteye(), var_0 gettagorigin( var_2 ) );
        var_6 = 0;
        var_7 = var_5 - var_1;

        if ( var_7 <= 0 )
            var_7 = 1;

        var_8 = var_5 + var_1;
        var_9 = var_8 + 35000;
        var_3 = 4;
        var_4 = 4;
        level.playercardbackground setdepthoffield( var_6, var_7, var_8, var_9, var_3, var_4 );
        wait 0.05;
    }
}

medic_focus( var_0 )
{
    var_1 = spawn( "script_model", level.playercardbackground.origin );
    var_1 setmodel( "tag_origin" );

    for (;;)
    {
        var_1.angles = level.playercardbackground getplayerangles();
        var_2 = vectortoangles( vectornormalize( level.pricedummy.origin - var_1.origin ) );
        var_0 linkto( var_1 );
        var_0 rotateto( var_2, 0.05, 0, 0 );
        wait 0.05;
        var_0 unlink();
    }
}

player_takes_shots()
{
    level.player_takes_shots = 0;

    while ( level.player_takes_shots < 2 )
        level waittill( "player_takes_shot" );

    maps\jeepride_code::player_kill();
}

shot_counter( var_0 )
{
    var_1 = common_scripts\utility::_id_A347( self gettagorigin( "tag_flash" ), self gettagangles( "tag_flash" ), level.playercardbackground geteye(), cos( 10 ) );

    if ( !var_1 )
    {
        self _meth_81eb();
        return;
    }

    level.player_takes_shots++;
    var_2 = 0;

    if ( level._id_3BFE == 0 )
    {
        if ( level.player_takes_shots > 3 )
            var_2 = 1;
    }
    else if ( level._id_3BFE == 1 )
    {
        if ( level.player_takes_shots > 3 )
            var_2 = 1;
    }
    else if ( level.player_takes_shots > 2 )
        var_2 = 1;

    if ( var_2 )
        level.playercardbackground enablehealthshield( 0 );

    self _meth_81ea( 1, level.playercardbackground geteye() );
}

bridge_zak_friendly_attack_heli()
{
    level.hind thread maps\_vehicle::_id_9D17( getent( "hind_roll_in", "script_noteworthy" ) );
    level.hind setlookatent( level.playercardbackground );
    var_0 = maps\_vehicle::_id_23DE( 71 );
    level.attack_heli = undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].visionsetnaked == "mi28" )
        {
            level.attack_heli = var_0[var_1];
            break;
        }
    }

    level.attack_heli vehicle_turnengineoff();
    level.attack_helidummy = level.attack_heli maps\_vehicle::_id_9D58();
    level.attack_helidummy hide();
    level.attack_helidummy._id_0C72 = "mi28";
    level.attack_helidummy maps\_anim::_id_7F29();
    level.attack_helidummy thread maps\jeepride_anim::override_roto_anim();
    common_scripts\utility::_id_384A( "attack_heli" );
    level.attack_helidummy show();
    wait 2.25;
    maps\jeepride_code::exploder_loc( 14020 );
    wait 10;
    level.attack_heli setlookatent( level.hind );
    level.hind setlookatent( level.attack_heli );
    level.hind maps\_vehicle::_id_4258();
    level.hind clearlookatent();
    level.attack_helidummy thread maps\jeepride_aud::play_zak_ally_heli_sfx();
    level.attack_heli fake_missile( level.hind );
    thread bx_helicopter_death_vfx();
    thread maps\jeepride_code::helicopter_show_crash_seq();
    thread common_scripts\utility::_id_69C2( "scn_hind_missile_boom", level.hind.origin );
    level.hind notify( "death" );
    wait 0.35;
    level.hind delete();
}

fake_missile( var_0 )
{
    var_1 = self.origin + ( 0.0, 0.0, -34.0 );
    var_2 = self.angles;
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = ( 180.0, 0.0, 0.0 );
    var_3 thread maps\_utility::_id_69C5( "scn_hind_missile_incomming" );
    var_3 setmodel( "projectile_sidewinder_missile" );
    playfxontag( level._effect["rocket_trail"], var_3, "TAG_FX" );
    var_4 = 7500;
    var_5 = var_0.origin + ( 0.0, 0.0, -34.0 );
    var_6 = var_1;
    var_3 notsolid();
    var_3 maps\jeepride_code::movewithrate( var_5, var_3.angles, var_4 );
    wait 0.1;
    var_3 delete();
}

bridge_zak_guys_dead( var_0 )
{
    maps\_utility::_id_A07F( var_0 );
    level.playercardbackground playsound( "scn_jeepride_last_gunshot" );
    common_scripts\utility::_id_383F( "all_end_scene_guys_dead" );
}

bridge_zak_slomo_script_timed()
{
    maps\_utility::_id_8648();
    maps\_utility::_id_8646( 0.4 );
    maps\_utility::_id_8640();
    wait 13.4;
    maps\_utility::_id_8646( 0.25 );
    maps\_utility::_id_8640();
    wait 1.2;
    maps\_utility::_id_8646( 0.4 );
    maps\_utility::_id_8640();
    wait 6.7;
    maps\_utility::_id_8646( 0.8 );
    maps\_utility::_id_8640();
    wait 11.2;
    maps\_utility::_id_8646( 0.45 );
    maps\_utility::_id_8640();
    wait 6.2;
    maps\_utility::_id_8646( 0.35 );
    maps\_utility::_id_8640();
    wait 2.1;
    maps\_utility::_id_8646( 0.45 );
    maps\_utility::_id_8640();
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    common_scripts\utility::_id_383F( "rescue_choppers" );
    common_scripts\utility::_id_383F( "music_lastman" );
    maps\_utility::_id_8646( 0.55 );
    maps\_utility::_id_8640();
    common_scripts\utility::_id_384A( "slomo_done" );
    maps\_utility::_id_8644( 8.75 );
    maps\_utility::_id_27EF( 3, maps\_utility::_id_8641 );
    wait 5;
    level.playercardbackground disableweapons();
    common_scripts\utility::_id_383F( "objective_finishedthelevel" );
    maps\_utility::_id_7F00( "jeepride", 10 );
    maps\_utility::_id_863E();
    common_scripts\utility::_id_383F( "disable_slowmo_cheat" );
}

bridge_zak_slomo_script_timed_chaplincheat()
{
    wait 13.4;
    wait 1.2;
    wait 6.7;
    wait 11.2;
    wait 6.2;
    wait 2.1;
    common_scripts\utility::_id_384A( "all_end_scene_guys_dead" );
    common_scripts\utility::_id_383F( "rescue_choppers" );
    common_scripts\utility::_id_383F( "music_lastman" );
    wait 5;
    level.playercardbackground disableweapons();
    common_scripts\utility::_id_383F( "objective_finishedthelevel" );
}

fakeout_donotetracks_animscripts()
{
    self.a = spawnstruct();
    self.a._id_55D7 = gettime();
    self.a._id_18B0 = 500;
    self.weapon_switch_invalid = "colt45";
    self.primaryweapon = "colt45";
    self.secondaryweapon = "colt45";
    self.a.issniper = 0;
    self.a._id_5CE3 = 0;
    self.weapon_switch_invalid = "none";
}

shoot_loc( var_0 )
{
    if ( isdefined( var_0.scriptedweapon ) && var_0.scriptedweapon == "wpn_h1_pst_m1911_vm" )
    {
        playfxontag( level._effect["griggs_pistol"], var_0.scriptedweaponmodel, "TAG_FLASH" );
        var_0.scriptedweaponmodel thread maps\_utility::_id_69C5( "weap_m1911colt45_fire_npc", "TAG_FLASH" );
        wait 0.05;
        playfxontag( level._effect["griggs_pistol_bullet"], var_0.scriptedweaponmodel, "TAG_FLASH" );
    }
    else
    {
        var_1 = var_0 gettagorigin( "TAG_FLASH" );
        bullettracer( var_1, var_1 + maps\_utility::vector_multiply( anglestoforward( var_0 gettagangles( "TAG_FLASH" ) ), 3000 ) );
        playfxontag( level._effect["griggs_saw"], var_0, "TAG_FLASH" );
        var_0 thread maps\_utility::_id_69C5( "weap_m249saw_fire_npc", "TAG_FLASH" );
        wait 0.02;
        playfxontag( level._effect["griggs_saw_bullet"], var_0, "TAG_FLASH" );
    }
}

price_bridge_crawl_anims( var_0 )
{
    var_0 maps\_anim::_id_0C24( level._id_6F7C, "wave_player_over" );
    level._id_6F7C _meth_8140( "animscripted", level._id_6F7C.origin, level._id_6F7C.angles, %stand2crouch_attack );
    level._id_6F7C waittillmatch( "animscripted", "end" );
    level._id_6F7C _meth_8140( "animscripted", level._id_6F7C.origin, level._id_6F7C.angles, %crouch2stand );
    level._id_6F7C waittillmatch( "animscripted", "end" );
}

stop_thinking()
{
    self notify( "stop_thinking" );
    maps\_vehicle::_id_5BD2();
}

hind_shoots_the_tanker( var_0 )
{
    level.hind notify( "gunner_new_target" );
    var_1 = spawn( "script_origin", ( -36282.6, -16678.1, 451.0 ) );
    var_1._id_7942 = "missile_bridgebuster";
    var_1._id_7AC2 = 2;
    var_1.oldmissiletype = 0;
    thread earthquaker( 10 );

    if ( !maps\jeepride_code::player_in_blastradius() )
        level.playercardbackground enableinvulnerability();

    level.playercardbackground thread maps\_utility::_id_69C4( "scn_last_hind_flyby_stinger" );
    level.hind thread maps\jeepride_code::shootenemytarget( var_1 );
    level waittill( "bridge_blower" );

    if ( maps\jeepride_code::player_in_blastradius() )
        maps\jeepride_code::player_kill();

    soundscripts\_snd::_id_870C( "start_hind_shoots_the_tanker_mix" );
    musicstop( 3.5 );
    level.playercardbackground freezecontrols( 0 );
    level.hind notify( "stop_killing_theplayer" );
    level.hind notify( "gunner_new_target" );
    thread rumbler();
    wait 0.25;
    thread earthquaker( 4 );
    maps\jeepride_code::exploder_loc( 13 );
}

rumbler()
{
    var_0 = 5;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        level.playercardbackground playrumbleonentity( "tank_rumble" );
        wait(randomfloatrange( 0.2, 0.5 ));
    }
}

earthquaker( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        earthquake( 0.2, randomfloatrange( 1, 1.5 ), level.playercardbackground.origin, 50 );
        wait(randomfloatrange( 1, 1.5 ));
    }
}

player_trackmissile( var_0, var_1 )
{
    level endon( "bridge_blower" );
    level waittill( "missile_tracker", var_2 );
    wait 0.5;
    var_3 = spawn( "script_model", level.playercardbackground.origin );
    var_3 setmodel( "tag_origin" );
    var_3.angles = level.playercardbackground getplayerangles();
    level.playercardbackground playerlinktoabsolute( var_3, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground freezecontrols( 1 );
    var_4 = vectortoangles( vectornormalize( var_1.origin - level.playercardbackground geteye() ) );
    var_5 = 0.5;
    var_3 rotateto( var_4, var_5, 0.2, 0.2 );
    wait(var_5);
}

overlaysmoke()
{
    var_0 = spawn( "script_model", level.playercardbackground geteye() );
    var_0.origin = level.playercardbackground geteye();
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_0 setmodel( "axis" );
    var_0 hide();
    wait 10;
    var_0 delete();
}

bridge_save()
{
    var_0 = getent( "bridge_save", "targetname" );
    var_0 waittill( "trigger" );
    level._id_8A1C = ::bridge_save_check;
    maps\_loadout::_id_41CA();

    if ( level.cheat_lemonade )
        maps\_cheat::givelemonade();

    level notify( "stop_mantle" );
    maps\_utility::_id_9E6E( "jeepride_end_2", 6 );
    level.playercardbackground maps\_utility::set_light_set_player( "jeepride_end_2" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 250 );
    level._id_6F7C.a._id_2B20 = 0;
    level._id_6F7C.index = 0;
    thread maps\_utility::_id_1143( "bridge_save" );

    while ( !common_scripts\utility::_id_382E( "game_saving" ) )
        level waittill( "game_saving" );

    level._id_8A1C = undefined;
}

bridge_save_check()
{
    var_0 = getent( "bridge_save", "targetname" );
    return distance( common_scripts\utility::_id_38C9( level.playercardbackground.origin ), common_scripts\utility::_id_38C9( var_0.origin ) ) < var_0.rank;
}

shock_ondeath_loc()
{
    precacheshellshock( "jeepride_ridedeath" );
    self._id_8A2B = 1;
    self waittill( "death" );

    if ( getdvar( "r_texturebits" ) == "16" )
        return;

    self shellshock( "jeepride_ridedeath", 3 );
}

bridge_rescue_start()
{
    soundscripts\_snd::_id_870C( "aud_bridge_rescue_checkpoint" );
    level.startdelay = 350000;
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_griggs_spot", "targetname" );
    var_2 = getent( "zak_player_spot", "targetname" );
    level.playercardbackground setorigin( var_2.origin );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_2.origin );
    common_scripts\utility::_id_383F( "end_ride" );
    common_scripts\utility::_id_383F( "bridge_sequence" );
    common_scripts\utility::_id_383F( "van_smash" );
    common_scripts\utility::_id_383F( "music_bridge" );
    common_scripts\utility::_id_383F( "music_zak" );
    common_scripts\utility::_id_383F( "bridge_zakhaev_setup" );
    maps\jeepride_code::exploder_loc( 3, 1 );
    maps\jeepride_code::exploder_loc( 71, 1 );
    maps\jeepride_code::exploder_loc( 72, 1 );
    maps\jeepride_code::exploder_loc( 73, 1 );
    wait 4.5;
    var_3 = getaiarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_3[var_4]._id_58D7 ) && var_3[var_4]._id_58D7 )
            var_3[var_4] maps\_utility::_id_8EA4();

        var_3[var_4] delete();
    }

    thread maps\_vehicle::_id_23DE( 71 );
    level._id_6F7C maps\_utility::_id_8EA4();
    var_5 = maps\_vehicle_aianim::_id_21A2( level._id_6F7C );
    var_5._id_0C72 = "price";
    level.pricedummy = var_5;
    var_6 = maps\_utility::_id_88D1( "playerview" );
    var_7 = getent( "player_drag_node", "targetname" );
    var_7 thread maps\_anim::_id_0C24( var_6, "drag_player" );
    var_7 thread maps\_anim::_id_0C13( var_6, "drag_player", 15 );
    level._id_56D2 = 1;
    level.playercardbackground setdepthoffield( 0, 100, 3100, 19999, 8, 1.65 );
    level.playercardbackground allowstand( 1 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowsprint( 0 );
    wait 5;
    common_scripts\utility::_id_383F( "rescue_choppers" );
    common_scripts\utility::_id_383F( "music_rescue" );
    level.playercardbackground playerlinktodelta( var_6, "tag_player", 1, 45, 45, 45, 3 );
    bridge_rescue( var_6 );
}

bm21_unloader()
{
    var_0 = getvehiclenode( self.teambalanced, "target" );
    var_1 = getvehiclenode( var_0.teambalanced, "target" );
    var_1 waittill( "trigger", var_2 );
    var_2 notify( "unload", "passengers" );
    self waittill( "trigger", var_2 );
    var_2 vehicle_setspeed( 0, 200 );
    var_2 waittill( "unloaded" );
    var_2 resumespeed( 15 );
}

autosave_now_loc( var_0 )
{
    if ( !isalive( level.playercardbackground ) )
        return;

    if ( level._id_5CDE )
        return;

    level.playercardbackground.attackeraccuracy = 0;
    thread maps\_utility::_id_114E();
    level.playercardbackground.attackeraccuracy = 1;
}

start_first_hind()
{
    setsaveddvar( "ragdoll_max_life", level.defaultragdolltime );
    soundscripts\_snd::_id_870C( "aud_first_hind_checkpoint" );
    common_scripts\utility::_id_0D13( getvehiclenodearray( "attacknow_firsthind", "script_noteworthy" ), maps\jeepride_code::attacknow );
    wip_start();
}

start_nowhere()
{
    soundscripts\_snd::_id_870C( "aud_nowhere_checkpoint" );
}

bm21_setanims_override()
{
    var_0 = vehicle_scripts\_bm21_troops::_id_7F23();
    var_0[0]._id_4B63 = [];
    var_0[0]._id_4B63[0] = %uaz_driver_idle;
    var_0[0]._id_4B63[1] = %uaz_driver_duck;
    var_0[0]._id_4B63[2] = %uaz_driver_weave;
    var_0[0]._id_4B7E[0] = 100;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    return var_0;
}

fx_thing()
{
    var_0 = loadfx( "fx/explosions/small_vehicle_explosion" );

    for (;;)
    {
        while ( !level.playercardbackground usebuttonpressed() )
            wait 0.05;

        playfx( var_0, level.playercardbackground geteye() );

        while ( level.playercardbackground usebuttonpressed() )
            wait 0.05;
    }
}

framer( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "tag_origin" );
    level.playercardbackground unlink();
    level.playercardbackground playerlinktodelta( var_2, "tag_origin", 1, 5, 5, 5, 5 );
    return var_2;
}

beam_me_up()
{
    var_0 = getent( "beam_me_up", "targetname" );
    var_0 hide();
    var_1 = getentarray( var_0._not_team, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] hide();
        var_1[var_2] linkto( var_0 );
    }

    var_0.beam_me_uppers = var_1;
}

beam_me_up_to_the_chopper( var_0 )
{
    var_1 = getent( "beam_me_up", "targetname" );
    var_2 = var_1.beam_me_uppers;
    var_1 show();
    level.playercardbackground playrumbleonentity( "tank_rumble" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] show();

    wait 1;
    var_1 ghettolinkto( level.playercardbackground );
}

ghettolinkto( var_0 )
{
    self endon( "death" );
    var_1 = spawn( "script_origin", level.playercardbackground.origin );
    self linkto( var_1 );

    for (;;)
    {
        var_1.origin = var_0.origin;
        wait 0.05;
    }
}

bx_scripted_events_flags_vfx()
{
    common_scripts\utility::_id_384A( "bx_start_level" );
    common_scripts\_exploder::_id_3528( "1001" );
    wait 5.0;
    common_scripts\_exploder::_id_3528( "1002" );
    common_scripts\utility::_id_384A( "bx_start_to_1st_car_crashes" );
    common_scripts\utility::_id_384A( "bx_start_to_1st_player_offtrack" );
    common_scripts\utility::_id_384A( "bx_start_to_1st_tanker_crash" );
    common_scripts\utility::_id_384A( "bx_1st_player_collision" );
    common_scripts\utility::_id_384A( "bx_1st_enemy_jeep_explosions" );
    common_scripts\utility::_id_384A( "tunnel_explosion_fx_flag" );
    common_scripts\_exploder::_id_3528( "680" );
    common_scripts\utility::_id_384A( "bx_2nd_civil_car_crash" );
    wait 0.35;
    common_scripts\_exploder::_id_3528( "7001" );
    wait 0.4;
    common_scripts\_exploder::_id_3528( "7002" );
    common_scripts\utility::_id_384A( "bx_2nd_to_3rd_civil_truck_crashes" );
    common_scripts\utility::_id_384A( "bx_2nd_to_3rd_enemy_jeep_leap" );
    common_scripts\utility::_id_384A( "bx_2nd_to_3rd_enemy_jeep_collision" );
    thread impact_sedan_car_vfx();
    wait 1.5;
    common_scripts\_exploder::_id_3528( "10000" );
    wait 3.01;
    common_scripts\_exploder::_id_3528( "10002" );
    wait 0.0;
    common_scripts\_exploder::_id_3528( "10001" );
    common_scripts\_exploder::_id_3528( "10003" );
    common_scripts\utility::_id_384A( "bx_3rd_civil_truck_crash" );
    common_scripts\utility::_id_384A( "bx_end_bridge_transition" );
    common_scripts\utility::_id_384A( "bridge_sequence" );
    wait 6.1;
    common_scripts\_exploder::_id_3528( "14003" );
}

bx_warmup_vfx_bridge()
{
    var_0 = maps\_utility::_id_3FA9( "smoke_column" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "smoke_column_black_far_jeepride" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "bridge_amb_smk" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "bridge_amb_smk_2" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "bridge_amb_smk_3" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "bridge_amb_smk_4" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cloud_mountain_liar" ) );
    var_1 = maps\_utility::_id_3FA9( "cloud_bank_far" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] common_scripts\utility::_id_671F();

    common_scripts\utility::_id_384A( "bx_start_level" );
    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride", "fx/treadfx/heli_water_jeepride" );
    common_scripts\utility::_id_384A( "bridge_section_start" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] maps\_utility::_id_748D();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::_id_671F();

    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride2" );
}

bx_warmup_vfx_end()
{
    var_0 = maps\_utility::_id_3FA9( "bridge_amb_smk_2" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "bridge_amb_smk_4" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();

    common_scripts\_exploder::_id_5309( "74" );
    common_scripts\_exploder::_id_5309( "14001" );
    common_scripts\_exploder::_id_5309( "14003" );
    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride3" );
}

bx_vfx_wind_kill()
{
    var_0 = maps\_utility::_id_3FA9( "bridge_amb_smk_3" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();

    maps\_utility::_id_8E7E( "142" );
    maps\_utility::_id_8E7E( "14004" );
}

bx_helicopter_death_vfx()
{
    wait 0.15;
    earthquake( 0.6, 0.45, level.playercardbackground.origin, 2500 );
    maps\jeepride_code::exploder_loc( 14010 );
    maps\_utility::_id_8E7E( 14020 );
    setblur( 1.6, 0.05 );
    wait 0.05;
    setblur( 0, 0.3 );
    wait 5.8;
    maps\jeepride_code::exploder_loc( 18001 );
}

bx_performance_vfx_count()
{
    var_0 = maps\_utility::_id_3FA9( "cloud_bank_road_2" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cloud_bank_road_3" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cloud_bank_road_4" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cloud_bank_road_5" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "leaves_fall_2" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "leaves_fall_3" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "leaves_fall_4" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "leaves_fall_5" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();

    thread bx_performance_vfx_out( "cloud_bank_road", "leaves_fall", "bx_perf_section_1_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_2", "leaves_fall_2", "bx_perf_section_2_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_3", "leaves_fall_3", "bx_perf_section_3_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_4", "leaves_fall_4", "bx_perf_section_4_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_5", "leaves_fall_5", "end_ride" );
    thread bx_performance_vfx_in( "cloud_bank_road_2", "leaves_fall_2", "bx_perf_section_2_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_3", "leaves_fall_3", "bx_perf_section_3_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_4", "leaves_fall_4", "bx_perf_section_4_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_5", "leaves_fall_5", "bx_perf_section_5_in" );
}

bx_performance_vfx_out( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::_id_3FA9( var_0 );
    var_3 = common_scripts\utility::_id_0CDD( var_3, maps\_utility::_id_3FA9( var_1 ) );
    common_scripts\utility::_id_384A( var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] common_scripts\utility::_id_671F();
}

bx_performance_vfx_in( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::_id_3FA9( var_0 );
    var_3 = common_scripts\utility::_id_0CDD( var_3, maps\_utility::_id_3FA9( var_1 ) );
    common_scripts\utility::_id_384A( var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] maps\_utility::_id_748D();
}

play_bridge_collapse_vfx()
{
    maps\jeepride_code::exploder_loc( 144 );
}

impact_sedan_car_vfx()
{
    var_0 = getvehiclenode( "auto3649", "targetname" );
    var_0 waittill( "trigger", var_1 );
    playfxontag( level._effect["jeep_tire_hit_sedan"], var_1, "tag_headlight_left" );
    wait 0.35;
    earthquake( 0.5, 0.5, level.playercardbackground.origin, 2500 );
}

reconnect_bridge_paths()
{
    var_0 = getentarray( "reconnect_path", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 connectpaths();
}

play_bridge_vehicle_collapse_vfx( var_0 )
{
    playfxontag( level._effect["bridge_idle_fire_cin"], var_0, "tag_fx_wagon_fire1_1" );
    playfxontag( level._effect["bridge_idle_fire_2_cin"], var_0, "tag_fx_wagon_fire3_1" );
    playfxontag( level._effect["bridge_idle_fire_cin"], var_0, "tag_fx_uaz_fire2_1" );
    playfxontag( level._effect["bridge_idle_fire_2_cin"], var_0, "tag_fx_uaz_fire3_1" );
}

play_bridge_wagon_spark_vfx( var_0, var_1 )
{
    playfxontag( level._effect["bridge_sparks_wagon_cin"], var_0, "tag_fx_wagon_spark_" + var_1 );
}

play_bridge_uaz_spark_vfx( var_0, var_1 )
{
    playfxontag( level._effect["bridge_grind_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
    wait 0.35;
    playfxontag( level._effect["bridge_sparks_uaz_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
}

stop_bridge_wagon_spark_vfx( var_0, var_1 )
{
    stopfxontag( level._effect["bridge_sparks_wagon_cin"], var_0, "tag_fx_wagon_spark_" + var_1 );
}

stop_bridge_uaz_spark_vfx( var_0, var_1 )
{
    stopfxontag( level._effect["bridge_grind_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
    stopfxontag( level._effect["bridge_sparks_uaz_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
}

setup_bridge_mi17()
{
    level._id_9C8D["script_vehicle_mi17_woodland_fly_cheap"]["TAG_FastRope_LE"]._id_2F6D = %h1_mi17_rope_drop_le_fastrope_80ft;
    level._id_9C8D["script_vehicle_mi17_woodland_fly_cheap"]["TAG_FastRope_RI"]._id_2F6D = %h1_mi17_rope_drop_ri_fastrope_80ft;
}

end_slowmo_on_death()
{
    self waittill( "death" );
    maps\_utility::_id_8641();
}
