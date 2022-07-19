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
    common_scripts\utility::_id_383D( "player_in_house" );
    maps\createart\blackout_art::main();
    maps\blackout_precache::main();
    level thread maps\blackout_fx::main();
    _id_A550::main();
    level thread maps\blackout_amb::main();
    maps\blackout_anim::main();
    maps\blackout_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.next_tango_timer = 0;
    maps\createart\blackout_art::main();
    precachemodel( "weapon_mp5" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_rpd_MG_setup" );
    precachemodel( "com_folding_chair" );
    precachemodel( "ch_street_wall_light_01_off" );
    precachemodel( "greece_gaslamp" );
    precachemodel( "dt_light_on_hunted" );
    precachemodel( "weapon_skorpion" );
    precachemodel( "weapon_ak47" );
    precachemodel( "weapon_ak74u" );
    precachemodel( "weapon_dragunov" );
    precachemodel( "weapon_beretta" );
    precachemodel( "weapon_g3" );
    precachemodel( "weapon_m4gre_sp_silencer_reflex" );
    precachemodel( "weapon_m21sd_woodland" );
    precachemodel( "vehicle_blackhawk_sas_night_interior" );
    precacheturret( "heli_spotlight" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "com_blackhawk_spotlight_off_mg_setup" );
    precachestring( &"BLACKOUT_THE_INFORMANT_WAS_KILLED" );
    precachestring( &"SCRIPT_LEARN_CLAYMORES" );
    precachestring( &"BLACKOUT_PROVIDE_SNIPER_SUPPORT" );
    precachestring( &"BLACKOUT_CUT_OFF_ENEMY_REINFORCEMENTS" );
    precachestring( &"BLACKOUT_PROVIDE_SNIPER_SUPPORT1" );
    precachestring( &"BLACKOUT_FOLLOW_KAMAROV_TO_POWER_STATION" );
    precachestring( &"BLACKOUT_PROVIDE_MORE_SNIPER_SUPPORT" );
    precachestring( &"BLACKOUT_RAPPEL_DOWN_FROM_THE" );
    precachestring( &"BLACKOUT_RESCUE_THE_INFORMANT" );
    precachestring( &"BLACKOUT_EVAC_WITH_THE_INFORMANT" );
    precachestring( &"BLACKOUT_ELIMINATE_THE_OUTER_GUARD" );
    precachestring( &"BLACKOUT_MEET_THE_RUSSIAN_LOYALISTS" );
    precachestring( &"BLACKOUT_RAPPEL_HINT" );
    precachestring( &"BLACKOUT_THE_INFORMANT_WAS_KILLED" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_light_1500" );
    precacherumble( "generic_attack_light_2000" );
    precacherumble( "generic_attack_medium_500" );
    thread maps\blackout_code::breach_door();
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    _id_A516::main();
    maps\blackout_precache::main();
    level thread maps\blackout_fx::main();
    _id_A545::init();
    maps\_hiding_door_anims::main();
    _id_A5A4::_id_278B( ::start_normal );
    _id_A5A4::_id_079C( "chess", ::start_chess, &"STARTS_CHESS" );
    _id_A5A4::_id_079C( "field", ::start_field, &"STARTS_FIELD1" );
    _id_A5A4::_id_079C( "overlook", ::_id_8C24, &"STARTS_OVERLOOK" );
    _id_A5A4::_id_079C( "cliff", ::start_cliff, &"STARTS_CLIFF" );
    _id_A5A4::_id_079C( "rappel", ::start_rappel, &"STARTS_RAPPEL" );
    _id_A5A4::_id_079C( "farmhouse", ::start_farmhouse, &"STARTS_FARMHOUSE" );
    _id_A5A4::_id_079C( "blackout", ::start_blackout, &"STARTS_BLACKOUT" );
    _id_A5A4::_id_079C( "rescue", ::start_rescue, &"STARTS_RESCUE" );
    level._id_8F58["mantle"] = &"BLACKOUT_MANTLE";
    _id_A546::_id_23CB();
    setsaveddvar( "ai_eventDistProjImpact", "0" );
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_dragunov_clip";
    level.weaponclipmodels[3] = "weapon_g36_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_m16_clip";
    _id_A550::main();
    maps\_hiding_door::init_hiding_door();
    _id_A51D::setupminimap( "compass_map_blackout" );
    var_0 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_0, maps\_stealth_logic::_id_3A66 );
    _id_A5A4::_id_0761( "allies", maps\_stealth_logic::_id_3A66 );
    _id_A55E::main();
    _id_A550::_id_7E9E( "viewhands_sas_woodland" );
    level thread maps\blackout_amb::main();
    maps\blackout_anim::main();
    maps\blackout_lighting::main();
    maps\blackout_aud::main();
    common_scripts\utility::_id_383D( "high_alert" );
    common_scripts\utility::_id_383D( "second_shacks" );
    common_scripts\utility::_id_383D( "russians_stand_up" );
    common_scripts\utility::_id_383D( "go_up_hill" );
    common_scripts\utility::_id_383D( "go_to_overlook" );
    common_scripts\utility::_id_383D( "overlook_attack_begins" );
    common_scripts\utility::_id_383D( "overlook_attention" );
    common_scripts\utility::_id_383D( "hut_cleared" );
    common_scripts\utility::_id_383D( "cliff_fighting" );
    common_scripts\utility::_id_383D( "cliff_moveup" );
    common_scripts\utility::_id_383D( "recent_flashed" );
    common_scripts\utility::_id_383D( "on_to_the_farm" );
    common_scripts\utility::_id_383D( "player_rappels" );
    common_scripts\utility::_id_383D( "head_to_rappel_spot" );
    common_scripts\utility::_id_383D( "gaz_and_price_go_up_hill" );
    common_scripts\utility::_id_383D( "kam_heads_to_rappel_spot" );
    common_scripts\utility::_id_383D( "gaz_opens_door" );
    common_scripts\utility::_id_383D( "farm_complete" );
    common_scripts\utility::_id_383D( "blackout_rescue_complete" );
    common_scripts\utility::_id_383D( "blackout_flashlightguy_dead" );
    common_scripts\utility::_id_383D( "blackhawk_lands" );
    common_scripts\utility::_id_383D( "blackhawk_spawn_start" );
    common_scripts\utility::_id_383D( "kam_go_through_burning_house" );
    common_scripts\utility::_id_383D( "kamarov_moving_burning_house" );
    common_scripts\utility::_id_383D( "h1_burninghouse_kam" );
    common_scripts\utility::_id_383D( "h1_burninghouse_gaz" );
    common_scripts\utility::_id_383D( "h1_burninghouse_price" );
    common_scripts\utility::_id_383D( "gaz_goes_by_other_window" );
    common_scripts\utility::_id_383D( "price_and_gaz_attack_flashlight_guy" );
    common_scripts\utility::_id_383D( "gaz_got_to_blackout_door" );
    common_scripts\utility::_id_383D( "player_finishes_rappel" );
    common_scripts\utility::_id_383D( "gaz_do_it" );
    common_scripts\utility::_id_383D( "lights_out" );
    common_scripts\utility::_id_383D( "commence_attack" );
    common_scripts\utility::_id_383D( "player_enters_burning_house" );
    common_scripts\utility::_id_383D( "player_near_heli" );
    common_scripts\utility::_id_383D( "meeting_reached_price" );
    common_scripts\utility::_id_383D( "meeting_reached_gaz" );
    common_scripts\utility::_id_383D( "meeting_begins" );
    common_scripts\utility::_id_383D( "rappel_kamarov_ready" );
    common_scripts\utility::_id_383D( "rappel_gaz_ready" );
    common_scripts\utility::_id_383D( "ready_to_commence_attack" );
    common_scripts\utility::_id_383D( "start_cliff_scene_gaz" );
    common_scripts\utility::_id_383D( "start_cliff_scene_kamarov" );
    common_scripts\utility::_id_383D( "kamarov_drops_binocs" );
    common_scripts\utility::_id_383D( "first_bmp_destroyed" );
    common_scripts\utility::_id_383D( "bm21s_attack" );
    common_scripts\utility::_id_383D( "weapons_free" );
    common_scripts\utility::_id_383D( "gaz_rappels" );
    common_scripts\utility::_id_383D( "hurry_to_nikolai" );
    common_scripts\utility::_id_383D( "go_through_burning_house" );
    common_scripts\utility::_id_383D( "player_near_pier" );
    common_scripts\utility::_id_383D( "shack_signal" );
    common_scripts\utility::_id_383D( "field_stop" );
    common_scripts\utility::_id_383D( "field_go" );
    common_scripts\utility::_id_383D( "gaz_rushes_hut" );
    common_scripts\utility::_id_383D( "visible_mg_gunner_alive" );
    common_scripts\utility::_id_383D( "head_to_the_cliff" );
    common_scripts\utility::_id_383D( "power_station_dialogue_begins" );
    common_scripts\utility::_id_383D( "kam_wants_more_sniping" );
    common_scripts\utility::_id_383D( "gaz_convinces_kam_otherwise" );
    common_scripts\utility::_id_383D( "gaz_fight_preps" );
    common_scripts\utility::_id_383D( "gaz_kam_fight_begins" );
    common_scripts\utility::_id_383D( "final_raid_begins" );
    common_scripts\utility::_id_383D( "price_got_to_go" );
    common_scripts\utility::_id_383D( "mission_chatter" );
    common_scripts\utility::_id_383D( "price_and_gaz_arrive_at_fight" );
    common_scripts\utility::_id_383D( "price_at_fight" );
    common_scripts\utility::_id_383D( "gaz_at_fight" );
    common_scripts\utility::_id_383D( "kam_at_fight" );
    common_scripts\utility::_id_383D( "friendly_head_to_LZ" );
    common_scripts\utility::_id_383D( "enemy_heli_unloaded" );
    common_scripts\utility::_id_383F( "no_ai_tv_damage" );
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "power_plant_cleared", common_scripts\utility::_id_3831, "aa_power_plant" );
    common_scripts\utility::_id_383F( "gaz_goes_by_other_window" );
    thread maps\blackout_code::set_high_alert();
    thread maps\blackout_code::hut_cleared();
    _id_A5A4::_id_0764( "nvg", &"SCRIPT_NIGHTVISION_USE", _id_A55E::_id_8487 );
    _id_A5A4::_id_0764( "grenade_launcher", &"SCRIPT_LEARN_GRENADE_LAUNCHER", maps\blackout_code::should_break_grenade_launcher_hint );
    _id_A5A4::_id_0764( "sniper_rifle", &"SCRIPT_LEARN_M14_SWITCH", maps\blackout_code::should_break_sniper_rifle_hint );
    _id_A5A4::_id_0764( "claymore_plant", &"SCRIPT_LEARN_CLAYMORES", maps\blackout_code::should_break_claymores );
    _id_A5A4::_id_0764( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", _id_A55E::_id_8451 );
    _id_A5A4::_id_0764( "claymore_placement", &"SCRIPT_LEARN_CLAYMORE_PLACEMENT", maps\blackout_code::should_break_claymore_placement );
    thread maps\blackout_code::grenade_hint_logic();
    common_scripts\utility::_id_76BB( "second_shack_trigger", maps\blackout_code::second_shack_trigger );
    common_scripts\utility::_id_76BB( "physics_launch", maps\blackout_code::physics_launch_think );
    common_scripts\utility::_id_76BB( "prep_for_rappel", maps\blackout_code::prep_for_rappel_think );
    common_scripts\utility::_id_76BB( "price_finishes_farm", maps\blackout_code::price_finishes_farm );
    common_scripts\utility::_id_76BB( "delete", _id_A5A4::_id_057D );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
        common_scripts\utility::_id_76BB( "burning_door_trigger", maps\blackout_code::open_door_trigger, "burning" );
    else
        common_scripts\utility::_id_383D( "burning_door_open" );

    common_scripts\utility::_id_76BB( "meeting_door_trigger", maps\blackout_code::open_door_trigger, "meeting" );
    common_scripts\utility::_id_76BB( "sniper_remove_trigger", maps\blackout_code::sniper_remove_trigger );
    common_scripts\utility::_id_76BB( "trigger_deletes_children", maps\blackout_code::trigger_deletes_children );
    common_scripts\utility::_id_76B9( "shack_sleeper", _id_A5A4::_id_0798, maps\blackout_code::shack_sleeper );
    common_scripts\utility::_id_76B9( "power_plant_spawner", _id_A5A4::_id_0798, maps\blackout_code::power_plant_spawner );
    common_scripts\utility::_id_76B9( "power_plant_second_wave", _id_A5A4::_id_0798, maps\blackout_code::swarm_hillside );
    common_scripts\utility::_id_76B9( "clear_target_radius", maps\blackout_code::clear_target_radius );
    common_scripts\utility::_id_76B9( "visible_mgguy", _id_A5A4::_id_0798, maps\blackout_code::visible_mgguy_think );
    common_scripts\utility::_id_76B9( "bored_guy", maps\blackout_code::ignore_until_high_alert );
    var_1 = getent( "hut_runner", "script_linkname" );
    var_1 thread maps\blackout_code::hut_runner_think();
    common_scripts\utility::_id_76B9( "hut_sentry", maps\blackout_code::tango_down_detection );
    common_scripts\utility::_id_76BB( "hut_patrol", maps\blackout_code::tango_down_detection );
    common_scripts\utility::_id_76B9( "chess_guy_1", _id_A5A4::_id_0798, maps\blackout_code::tango_down_detection );
    common_scripts\utility::_id_76B9( "chess_guy_2", _id_A5A4::_id_0798, maps\blackout_code::tango_down_detection );
    common_scripts\utility::_id_76B9( "shack_sleeper", _id_A5A4::_id_0798, maps\blackout_code::tango_down_detection );
    common_scripts\utility::_id_76B9( "instant_high_alert", _id_A5A4::_id_0798, maps\blackout_code::instant_high_alert );
    thread maps\blackout_code::buring_house_exploder_think( "burning_house_balcony_exploder", "field_trigger", "player_finishes_rappel" );
    thread maps\blackout_code::buring_house_exploder_think( "burning_house_interior_exploder", "kamarov_moving_burning_house", "player_finishes_rappel" );
    thread maps\blackout_code::smell_kamarov();
    thread maps\blackout_code::power_station_dialogue();
    thread maps\blackout_code::descriptions();
    thread maps\blackout_code::blackout_stealth_settings();
    level._id_7474 = getent( "ally_respawn", "targetname" );
    common_scripts\utility::_id_383F( "respawn_friendlies" );
    var_2 = getentarray( "assault_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, _id_A5A4::_id_7402 );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, maps\blackout_code::ground_allied_forces );
    var_3 = getentarray( "assault_second_wave", "targetname" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, _id_A5A4::_id_7402 );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, maps\blackout_code::ground_allied_forces );
    var_4 = getentarray( "color_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, maps\blackout_code::ground_allied_forces );
    var_5 = getent( "heli_rescue_trigger", "script_noteworthy" );
    var_5 common_scripts\utility::_id_97CC();
    var_6 = getent( "blackout_fence_down", "targetname" );
    var_6 hide();
    var_6 notsolid();
    var_7 = getent( "blackout_fence_down_model", "targetname" );
    var_7 hide();
    level._id_3AB9 = getdvarint( "g_friendlynamedist" );
    thread maps\blackout_code::player_rappel_think();
    thread maps\blackout_code::detect_recent_flashed();
    _id_A5A4::_id_1332( "allies" );
    thread _id_A5A4::ai_team_run_twitch_think( "allies", "player_finishes_rappel", "blackout_rescue_complete", "farmhouse", undefined );
    thread maps\blackout_aud::start_scripted_uaz_audio();
    thread burning_house_exploders_init();
    thread maps\blackout_code::music_control();
    thread maps\_wibble::setup_wibble_helis( 1, "blackhawk_spawn_start" );

    if ( !getdvarint( "use_old_bbc_voice" ) )
    {
        var_8 = getentarray( "interactive_tv", "targetname" );
        common_scripts\utility::_id_0D13( var_8, maps\blackout_code::bbc_voice );
    }

    wait 5;
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "hut_tv_on" );
        thread loop_cinematic();
        common_scripts\utility::_id_3857( "hut_tv_on" );
        level notify( "stop_cinematic" );
        stopcinematicingame();
    }
}

loop_cinematic()
{
    level endon( "stop_cinematic" );

    for (;;)
    {
        cinematicingameloopresident( "asad_speech_180" );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}

burning_house_exploders_init()
{
    common_scripts\utility::_id_384A( "mgs_cleared" );
    var_0 = getent( "burning_house_exploder_78", "targetname" );
    var_0 waittill( "trigger" );
    thread common_scripts\_exploder::_id_3528( 78 );
    thread maps\blackout_code::shoot_magic_rocket( "overlook_magic_rocket_02" );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
    {
        var_0 = getent( "burning_house_exploder_76", "targetname" );
        var_0 waittill( "trigger" );
        thread common_scripts\_exploder::_id_3528( 76 );
        var_0 = getent( "burning_house_exploder_77", "targetname" );
        var_0 waittill( "trigger" );
        thread common_scripts\_exploder::_id_3528( 77 );
    }
}

start_normal()
{
    _id_A5E8::_id_870C( "start_default_checkpoint" );
    common_scripts\utility::_id_383F( "start_swamp_fog" );
    thread maps\blackout_code::aa_town_init();
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    walking_the_stream();
}

start_chess()
{
    _id_A5E8::_id_870C( "start_chess_checkpoint" );
    var_0 = getent( "player_chess_org", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    _id_A5A4::_id_070A( "second_shack_trigger" );
    start_normal();
}

walking_the_stream()
{
    thread maps\blackout_code::outpost_objectives();
    thread field_meeting();
    var_0 = getnode( "signal1", "script_noteworthy" );
    level._id_6F7C thread maps\blackout_code::first_signal_on_node( var_0, "stop2_exposed" );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_1, maps\blackout_code::friendly_think );
    thread maps\blackout_code::hut_tv();
    var_2 = getent( "hut_sentry", "script_noteworthy" );
    var_2 thread maps\blackout_code::idle_relative_to_target( "smoke_idle", "bored_alert" );
    var_2 thread maps\blackout_code::alert_on_grenade_body_impact();
    var_3 = getentarray( "bored_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, maps\blackout_code::alert_on_grenade_body_impact );
    common_scripts\utility::_id_0D13( var_3, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_idle", "bored_alert" );

    foreach ( var_5 in var_3 )
        var_5.flashbangstopsscriptedanim = 1;

    var_3 = getentarray( "hut_hanger", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, maps\blackout_code::alert_on_grenade_body_impact );
    common_scripts\utility::_id_0D13( var_3, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_cell_loop", "bored_alert" );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "play_nears_second_shacks" );
    _id_A5A4::_id_075F( _id_A5A4::_id_1143, "claymore_save" );
    thread _id_A5A4::_id_2BDC();
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "pier_guys" );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "hut_cleared" );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "play_nears_second_shacks" );
    _id_A5A4::_id_2BDD();

    if ( common_scripts\utility::_id_382E( "play_nears_second_shacks" ) )
    {
        maps\blackout_code::kill_all_ai_of_deathflag( "pier_guys" );
        maps\blackout_code::kill_all_ai_of_deathflag( "hut_guys" );
        maps\blackout_code::price_and_gaz_catchup_to_bridge();
    }
    else if ( !common_scripts\utility::_id_382E( "high_alert" ) )
    {
        wait(randomfloatrange( 0.6, 1.2 ));
        level._id_6F7C _id_A5A4::_id_7E38( "b" );
        level._id_3C61 _id_A5A4::_id_7E38( "o" );
        thread maps\blackout_code::price_and_gaz_flash_hut();
        _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "gaz_rushes_hut" );
        _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "high_alert" );
        _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "hut_cleared" );
        _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "recent_flashed" );
        _id_A5A4::_id_2BDD();

        if ( isdefined( level._id_6F7C.h1_scripted_grenade ) )
            level._id_6F7C animscripts\combat_utility::h1_grenade_attach_detach_listener( "grenade_throw" );

        level._id_6F7C _meth_8143();
        var_7 = getnode( "gaz_hut_node", "targetname" );
        level._id_3C61 _id_A5A4::_id_2A74();
        level._id_3C61.fixednodesaferadius = 0;
        level._id_3C61 _meth_81a9( var_7 );
        level._id_3C61 _meth_81a7( 1 );
        level._id_3C61.ignoreforfixednodesafecheck = 0;
        level._id_6F7C.ignoreforfixednodesafecheck = 0;
    }

    common_scripts\utility::_id_384A( "hut_cleared" );

    if ( isdefined( level.friendly_flashbangimmunity ) )
    {
        level.friendly_flashbangimmunity = undefined;
        level._id_6F7C _id_A5A4::_id_7F71( 0 );
        level._id_3C61 _id_A5A4::_id_7F71( 0 );
    }

    level._id_3C61 _meth_81a7( 0 );

    if ( !common_scripts\utility::_id_382E( "high_alert" ) )
    {
        level._id_3C61.fixednodesaferadius = 32;
        level._id_6F7C.ignoreforfixednodesafecheck = 1;
        level._id_3C61.ignoreforfixednodesafecheck = 1;
    }

    wait 0.4;
    level._id_6F7C thread _id_A5A4::_id_2A32( "guard_posts_ahead" );
    wait 0.3;
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    level._id_3C61 _id_A5A4::_id_7E38( "p" );
    common_scripts\utility::_id_3852( "shack_signal", "chess_cleared" );

    if ( !common_scripts\utility::_id_382E( "high_alert" ) && !common_scripts\utility::_id_382E( "chess_cleared" ) )
    {
        var_0 = getnode( "shack_node", "targetname" );
        thread maps\blackout_code::shack_signal( var_0 );
        var_0 = getnode( "shack_node2", "targetname" );
        thread maps\blackout_code::shack_signal( var_0 );
    }

    common_scripts\utility::_id_3852( "chess_cleared", "high_alert" );

    if ( common_scripts\utility::_id_382E( "high_alert" ) )
        _id_A5A4::_id_070A( "hide_from_shack" );
    else
        _id_A5A4::_id_070A( "sneak_up_on_shack" );

    common_scripts\utility::_id_384A( "shack_cleared" );
    common_scripts\utility::_id_384A( "chess_cleared" );
    wait 1.5;
    level._id_6F7C _id_A5A4::_id_7E38( "c" );
    level._id_3C61 _id_A5A4::_id_7E38( "g" );
    _id_A5A4::_id_0761( "axis", maps\blackout_code::commence_attack_on_death );
    var_8 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_8, maps\blackout_code::commence_attack_on_death );
    common_scripts\utility::_id_384A( "meeting_door_open" );
    _id_A5A4::_id_070A( "meeting_trigger" );
    common_scripts\utility::_id_383F( "meeting_begins" );
    setsaveddvar( "g_friendlynamedist", "0" );
    common_scripts\utility::_id_384A( "commence_attack" );
    _id_A5A4::_id_735B( "axis", maps\blackout_code::commence_attack_on_death );
}

start_field()
{
    _id_A5E8::_id_870C( "start_field_checkpoint" );
    common_scripts\utility::_id_383F( "meeting_begins" );
    thread maps\blackout_code::aa_town_init();
    thread field_meeting();
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_0, _id_A5A4::_id_284E );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::_id_383F( "second_shacks" );
    var_2 = getent( "player_meeting_org", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0, 0, -27000 ) );
    var_3 = getent( "price_meeting_org", "targetname" );
    var_4 = getent( "price_meeting_org", "targetname" );
    level._id_6F7C _meth_81c9( var_3.origin, var_3.angles );
    level._id_3C61 _meth_81c9( var_4.origin, var_4.angles );
    level.playercardbackground setorigin( var_2.origin );
    _id_A5A4::_id_070A( "meet_at_field" );
    level._id_3C61 _id_A5A4::_id_7E38( "y" );
}

field_meeting()
{
    var_0 = getnode( "farm_meet_node", "targetname" );
    var_0 = getent( "farm_meet_org", "targetname" );
    common_scripts\utility::_id_384A( "second_shacks" );
    thread overlook_sniping();
    _id_A5A4::_id_3601();
    level.field_russians = [];
    var_1 = getentarray( "field_russian", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::field_russian_think );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    var_2 = getent( "russian_leader", "targetname" );
    var_2 thread _id_A5A4::_id_0798( maps\blackout_code::russian_leader_think, 1 );
    var_2 thread _id_A5A4::_id_0798( _id_A5A4::_id_58D7 );
    var_2 thread _id_A5A4::_id_0798( maps\blackout_code::set_allowed_stances, "crouch" );
    var_2 thread _id_A5A4::_id_88C3();

    if ( getdvarint( "use_old_meeting" ) != 1 )
    {
        wait 1;
        var_0 thread _id_A510::_id_0BE1( level.kamarov, "meeting_idle", undefined, "stop_kam_loop" );
    }

    var_3 = getent( "meeting_clip", "targetname" );
    common_scripts\utility::_id_384A( "meeting_begins" );
    _id_A5A4::arcademode_checkpoint( 6, "a" );
    level._id_6F7C _id_A5A4::_id_2A74();
    level._id_3C61 _id_A5A4::_id_2A74();

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        var_0 thread _id_A510::_id_0BFF( level._id_6F7C, "meeting" );
        var_4 = getnode( "gaz_field_node", "targetname" );
        level._id_3C61 _meth_81a9( var_4 );
        var_5 = _id_A5A4::_id_590F( level._id_6F7C, level.kamarov );
        level._id_6F7C.goalradius = 180;
        level._id_6F7C waittill( "goal" );
        level._id_6F7C.goalradius = 8;
        level.kamarov _id_A510::_id_0BC9( level.kamarov, "standup" );
        level.kamarov _meth_81ce( "stand", "crouch", "prone" );
        common_scripts\utility::_id_384A( "field_trigger" );
        level._id_6F7C waittill( "goal" );
    }
    else
    {
        var_5 = _id_A5A4::_id_590F( level._id_6F7C, level.kamarov, level._id_3C61 );
        var_6 = _id_A5A4::_id_590F( "meeting_reached_price", "meeting_reached_gaz", "field_trigger" );
        level._id_6F7C thread maps\blackout_code::meeting_reach_think( var_0, "meeting_reached_price", var_6 );
        level._id_3C61 thread maps\blackout_code::meeting_reach_think( var_0, "meeting_reached_gaz", var_6 );
        common_scripts\utility::_id_384B( "meeting_reached_price", "meeting_reached_gaz", "field_trigger" );
    }

    var_0 = getent( "farm_meet_org", "targetname" );
    thread maps\blackout_code::field_russians_go_up_hill();
    thread maps\blackout_code::kam_and_price_chat();
    level._id_6F7C.a._id_5F5B = "run";
    level.kamarov.a._id_5F5B = "run";
    level.kamarov.a._id_6E5A = "stand";
    var_3 disconnectpaths();
    var_3 solid();
    setsaveddvar( "g_friendlynamedist", "0" );
    _id_A5A4::_id_27EF( 7, common_scripts\utility::_id_383F, "russians_stand_up" );
    _id_A5A4::_id_27EF( 9, _id_A5A4::_id_063E, "g_friendlynamedist", level._id_3AB9 );

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        _id_A5A4::_id_27EF( 16.0, common_scripts\utility::_id_383F, "go_up_hill" );
        _id_A5A4::_id_27EF( 25.3, common_scripts\utility::_id_383F, "field_go" );
        _id_A5A4::_id_27EF( 19.2, common_scripts\utility::_id_383F, "field_stop" );
        level.kamarov _id_A5A4::_id_27EF( 25.5, _id_A5A4::_id_0C3D );
        level._id_6F7C _id_A5A4::_id_27EF( 26.0, _id_A5A4::_id_0C3D );
        _id_A5A4::_id_27EF( 25.2, common_scripts\utility::_id_383F, "gaz_and_price_go_up_hill" );
    }
    else
    {
        level._id_3C61.a._id_5F5B = "jog";
        level.kamarov _meth_81ce( "stand", "crouch", "prone" );
        _id_A5A4::_id_27EF( 18.3, common_scripts\utility::_id_383F, "go_up_hill" );
        _id_A5A4::_id_27EF( 26, common_scripts\utility::_id_383F, "field_go" );
    }

    level._id_9373 = gettime();
    var_7 = getent( "kaz_overlook_org", "targetname" );
    level.kamarov _meth_81aa( var_7.origin );

    if ( getdvarint( "use_old_meeting" ) != 1 )
        var_0 notify( "stop_kam_loop" );

    _id_A5E8::_id_870C( "aud_start_meeting" );
    var_0 _id_A510::_id_0C18( var_5, "meeting" );

    if ( getdvarint( "use_old_meeting" ) != 1 )
        common_scripts\utility::_id_383F( "gaz_and_price_go_up_hill" );

    _id_A5E8::_id_870C( "aud_stop_meeting" );
    _id_A5A4::_id_1143( "follow_me" );
    level.hilltop_mortar_team_1 = [];
    level.hilltop_mortar_team_2 = [];
    level.kamarov _id_A5A4::_id_8EA4();
    level.kamarov thread maps\blackout_code::sas_main_think();
    var_8 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_7E5D, 1 );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_7E5E, 1 );
    common_scripts\utility::_id_383F( "go_to_overlook" );
    thread overlook_mortars();
    objective_add( 3, "current", &"BLACKOUT_PROVIDE_SNIPER_SUPPORT", ( -7587, -2233, 857 ) );

    if ( getdvarint( "use_old_meeting" ) != 1 )
    {
        level._id_3C61._id_76B8 = "jog";
        wait 1;
        level._id_3C61._id_76B8 = "";
        level._id_3C61.a._id_5F5B = "run";
    }

    common_scripts\utility::_id_384A( "over_here" );
    common_scripts\utility::_id_384A( "player_near_overlook" );
    _id_A5A4::_id_615C();

    if ( common_scripts\utility::_id_382E( "high_alert" ) )
    {
        common_scripts\utility::_id_383F( "commence_attack" );
        return;
    }

    level endon( "high_alert" );
    level._id_6F7C _id_A5A4::_id_2A32( "in_position" );
    level._id_3C61 _id_A5A4::_id_2A32( "cover_left_flank" );
    wait 1;
    common_scripts\utility::_id_3852( "player_at_overlook", "high_alert" );
    common_scripts\utility::_id_383F( "commence_attack" );
}

overlook_mortars()
{
    common_scripts\utility::_id_3852( "commence_attack", "high_alert" );
    common_scripts\utility::_id_384A( "ready_to_commence_attack" );
    wait 1;
    level.kamarov _id_A5A4::_id_2A32( "commence_attack" );
    wait 1.5;
    thread common_scripts\_exploder::_id_3528( 60 );
    wait 3;
    common_scripts\utility::_id_383F( "overlook_attack_begins" );
}

_id_8C24()
{
    _id_A5E8::_id_870C( "start_overlook_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::_id_383F( "go_up_hill" );
    common_scripts\utility::_id_383F( "second_shacks" );
    common_scripts\utility::_id_383F( "bm21s_attack" );
    common_scripts\utility::_id_383F( "ready_to_commence_attack" );
    thread overlook_mortars();
    maps\blackout_code::setup_sas_buddies();
    var_0 = getent( "russian_leader", "targetname" );
    var_0 thread _id_A5A4::_id_0798( maps\blackout_code::russian_leader_think );
    var_0 thread _id_A5A4::_id_0798( maps\blackout_code::sas_main_think );
    var_0 thread _id_A5A4::_id_88C3();
    maps\blackout_code::_id_825D();
    _id_A5A4::_id_27EF( 0.05, common_scripts\utility::_id_383F, "go_to_overlook" );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_1, _id_A5A4::_id_284E );
    var_2 = getaiarray( "allies" );
    var_3 = getent( "player_overlook_org", "targetname" );
    level.playercardbackground setorigin( var_3.origin + ( 0, 0, -27000 ) );
    var_4 = getentarray( "friendly_overlook_org", "targetname" );

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5].ignoreforfixednodesafecheck = 1;
        var_2[var_5] _meth_81c9( var_4[var_5].origin, var_4[var_5].angles );
    }

    thread overlook_sniping();
    level.playercardbackground setorigin( var_3.origin );
    wait 2;
    common_scripts\utility::_id_383F( "commence_attack" );
}

overlook_sniping()
{
    common_scripts\utility::_id_384A( "go_up_hill" );
    thread maps\blackout_code::price_tells_player_to_come_over();
    var_0 = getent( "village_blocker", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    var_1 = getentarray( "overlook_runner", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::overlook_runner_think );
    var_2 = getentarray( "smoker_spawner", "targetname" );
    common_scripts\utility::_id_0D16( var_2, _id_A5A4::_id_0798, maps\blackout_code::reach_and_idle_relative_to_target, "smoking_reach", "smoking", "smoking_react" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, _id_A573::_id_0DDC );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );
    var_3 = getentarray( "wall_idler", "targetname" );
    common_scripts\utility::_id_0D16( var_3, _id_A5A4::_id_0798, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_cell_loop", "bored_alert" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_88C3 );
    var_4 = getentarray( "street_walker", "targetname" );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, maps\blackout_code::street_walker_think );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_384A( "player_at_overlook" );
    common_scripts\utility::_id_383F( "bm21s_attack" );
    _id_A5A4::_id_1143( "overlook" );
    _id_A5A4::_id_27EF( 2, maps\blackout_code::display_sniper_hint );
    level.playercardbackground.threatsightdelayfalloff = -350;
    thread maps\blackout_code::turn_off_stealth();
    thread maps\blackout_code::hilltop_sniper();
    thread maps\blackout_code::overlook_player_mortarvision();
    common_scripts\utility::_id_384A( "overlook_attack_begins" );
    thread maps\blackout_code::shoot_magic_rocket( "overlook_magic_rocket_01" );
    _id_A5A4::_id_1333( "allies" );
    var_5 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_7E5E, 0 );
    _id_A5A4::_id_070A( "overlook_charge" );
    var_6 = getentarray( "assault_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_6, _id_A5A4::_id_88C3 );
    var_7 = getentarray( "first_mg_guys", "targetname" );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\blackout_code::overlook_turret_think );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_88C3 );
    thread maps\blackout_code::overlook_price_tells_you_to_shoot_mgs();
    thread overlook_badguys_pour_in();
    var_8 = getent( "first_rpg_spawner", "targetname" );
    var_8 thread _id_A5A4::_id_0798( maps\blackout_code::first_rpg_spawner_think );
    var_8 _id_A5A4::_id_88C3();
    common_scripts\utility::_id_384A( "first_bmp_destroyed" );
    common_scripts\utility::_id_384A( "mgs_cleared" );
    thread maps\blackout_code::breach_first_building();
    thread _id_A5A8::_id_897D( "enemy_heli" );
    var_9 = getentarray( "enemy_heli", "targetname" );
    common_scripts\utility::_id_0D13( var_9, ::enemy_heli_riders );
    thread common_scripts\_exploder::_id_3528( 61 );
    _id_A5E8::_id_870C( "aud_start_enemy_heli_mix" );
    wait 4.5;
    common_scripts\utility::_id_384A( "begin_the_breach" );
    level.playercardbackground.threatsightdelayfalloff = 0;
    level.playercardbackground.meleeattackdist = 2048;

    if ( getdvarint( "use_old_burning_house" ) == 1 )
    {
        common_scripts\utility::_id_383F( "kam_go_through_burning_house" );
        _id_A5A4::_id_070A( "to_the_cliff" );
        maps\blackout_code::damn_helicopters();
    }
    else
    {
        maps\blackout_code::damn_helicopters();
        _id_A5A4::_id_070A( "to_the_cliff" );
        common_scripts\utility::_id_383F( "kam_go_through_burning_house" );
    }

    _id_A5A4::_id_62EC( 3 );
    objective_add( 4, "current", &"BLACKOUT_CUT_OFF_ENEMY_REINFORCEMENTS", maps\blackout_code::power_plant_org() );
    common_scripts\utility::_id_384A( "kamarov_moving_burning_house" );
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    _id_A5A4::arcademode_checkpoint( 8, "b" );
    wait 1.2;
    _id_A5A4::_id_1143( "to_the_cliff" );
    _id_A5A4::_id_27EF( 20, maps\blackout_code::cliff_reminder );
    common_scripts\utility::_id_384A( "player_reaches_cliff_area" );
    level._id_3C61 _id_A5A4::_id_27EF( 1.5, _id_A5A4::_id_2A32, "helicopter_troops" );
    _id_A5A4::_id_070A( "cliff_ground_forces" );
    level._id_6F7C.ignoreforfixednodesafecheck = 0;
    level._id_3C61.ignoreforfixednodesafecheck = 0;
    level.kamarov.ignoreforfixednodesafecheck = 0;
    thread cliff_sniping();
    thread player_battles_towards_power_plant();
    common_scripts\utility::_id_384A( "power_plant_cleared" );
    level._id_6F7C._id_1300 = 1;
    level._id_3C61._id_1300 = 1;
    level.kamarov._id_1300 = 1;
    _id_A5A4::_id_62EC( 4 );
    objective_add( 5, "current", &"BLACKOUT_PROVIDE_SNIPER_SUPPORT1", maps\blackout_code::cliff_org() );
}

enemy_heli_riders()
{
    var_0 = self._id_555C;

    foreach ( var_2 in var_0._id_750A )
        var_2 thread rider_damaged();
}

rider_damaged()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_1 ) && var_1 == level.playercardbackground )
        _id_A5A4::arcademode_kill( self.origin, var_4, 60 );
}

player_battles_towards_power_plant()
{
    level endon( "power_plant_cleared" );
    common_scripts\utility::_id_382F( "power_plant_cleared" );
    common_scripts\utility::_id_384A( "heroes_high_accuracy" );
    common_scripts\utility::_id_0D13( level._id_265B["power_plant_cleared"]["ai"], maps\blackout_code::attack_player );
    level._id_6F7C._id_1300 = 1000;
    level._id_3C61._id_1300 = 1000;
    level.kamarov._id_1300 = 1000;
    common_scripts\utility::_id_384A( "player_approaches_power_plant" );
    common_scripts\utility::_id_0D13( level._id_265B["power_plant_cleared"]["spawners"], _id_A5A4::_id_057D );
    common_scripts\utility::_id_0D13( level._id_265B["power_plant_cleared"]["ai"], maps\blackout_code::kill_player );
}

overlook_badguys_pour_in()
{
    level endon( "breach_complete" );
    common_scripts\utility::_id_382F( "breach_complete" );
    common_scripts\utility::_id_3856( "overlook_attention", 20 );
    thread maps\blackout_code::overlook_alarm();
    var_0 = getentarray( "east_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, maps\blackout_code::fall_back_to_defensive_position );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    wait 15;
    var_1 = getentarray( "mid_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::fall_back_to_defensive_position );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    thread maps\blackout_code::spawn_replacement_baddies();
    var_2 = getentarray( "assault_second_wave", "targetname" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );
}

haunted_sniping()
{
    var_0 = getent( "bmp_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = _id_A5A8::_id_8979( "bmp" );
}

start_cliff()
{
    _id_A5E8::_id_870C( "start_cliff_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    common_scripts\utility::_id_383F( "go_up_hill" );
    common_scripts\utility::_id_383F( "go_to_overlook" );
    common_scripts\utility::_id_383F( "overlook_attack_begins" );
    common_scripts\utility::_id_383F( "breach_complete" );
    common_scripts\utility::_id_383F( "bm21s_attack" );
    _id_A5A4::_id_27EF( 1, common_scripts\utility::_id_383F, "power_plant_cleared" );
    var_0 = getent( "russian_leader", "targetname" );
    var_0 thread _id_A5A4::_id_0798( maps\blackout_code::russian_leader_think );
    var_0 thread _id_A5A4::_id_88C3();
    var_1 = getaiarray( "allies" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    var_2 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_2, _id_A5A4::_id_284E );
    thread cliff_sniping();
    var_3 = _id_A5A4::get_guys_with_targetname_from_spawner( "assault_spawner" );
    var_4 = _id_A5A4::get_guys_with_targetname_from_spawner( "assault_second_wave" );
    var_3 = common_scripts\utility::_id_0CDD( var_3, var_4 );
    wait 0.05;
    var_5 = getentarray( "ally_cliff_start_org", "targetname" );

    for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        var_3[var_6] _meth_81c9( var_5[var_6].origin );

    common_scripts\utility::_id_383F( "player_reaches_cliff_area" );
    wait 0.5;
    var_7 = getent( "player_cliff_org", "targetname" );
    level.playercardbackground setorigin( var_7.origin + ( 0, 0, -27000 ) );
    var_8 = getentarray( "friendly_cliff_org", "targetname" );

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
        var_1[var_6] _meth_81c9( var_8[var_6].origin, var_8[var_6].angles );

    level.playercardbackground setorigin( var_7.origin );
}

cliff_sniping()
{
    _id_A5A4::_id_070A( "cliff_trigger" );
    level._id_6F7C._id_6163 = 1;
    level._id_3C61._id_6163 = 1;
    level.kamarov._id_6163 = 1;
    level._id_7474 = getent( "ally_cliff_spawner", "targetname" );
    common_scripts\utility::_id_383F( "cliff_fighting" );
    thread maps\blackout_code::spawn_replacement_cliff_baddies();
    level.enemy_bmp = _id_A5A8::_id_8979( "enemy_bmp" );
    level.enemy_bmp thread maps\blackout_code::bmp_targets_stuff();
    level.enemy_bmp _id_A5A8::_id_4259();
    level.defenders_killed = 0;
    thread maps\blackout_code::cliff_bm21_blows_up();
    common_scripts\utility::_id_384A( "cliff_look" );
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "power_plant_cleared", _id_A5A4::_id_1143, "power_plant_cleared" );
    common_scripts\utility::_id_383F( "cliff_tanks_move" );
    level.playercardbackground.ignoretriggers = 1;
    common_scripts\utility::_id_384A( "cliff_moveup" );
    _id_A5A4::_id_070A( "cliff_allies_advance" );
    common_scripts\utility::_id_384A( "cliff_tank_path_end" );
    wait 3;
    var_0 = getent( "bmp_killer_spawner", "targetname" );
    var_0 thread _id_A5A4::_id_0798( maps\blackout_code::bmp_killer_spawner_think );
    var_0 thread _id_A5A4::_id_88C3();
    wait 0.05;

    if ( !common_scripts\utility::_id_382E( "power_plant_cleared" ) )
    {
        common_scripts\utility::_id_0D13( level._id_265B["power_plant_cleared"]["ai"], maps\blackout_code::attack_player );
        common_scripts\utility::_id_0D13( level._id_265B["power_plant_cleared"]["spawners"], _id_A5A4::_id_057D );
        common_scripts\utility::_id_384A( "power_plant_cleared" );
    }

    var_1 = getentarray( "roof_sniper_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::roof_spawner_think );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_384A( "cliff_roof_snipers_cleared" );
    level._id_6F7C._id_6163 = 0;
    level._id_3C61._id_6163 = 0;
    level.kamarov._id_6163 = 0;
    level.kamarov thread _id_A5A4::_id_2A32( "making_progress" );
    common_scripts\utility::_id_383F( "kam_heads_to_rappel_spot" );
    wait 4;
    common_scripts\utility::_id_383F( "cliff_complete" );
    _id_A5A4::_id_070A( "friendlies_charge_farmhouse" );
    _id_A5E8::_id_870C( "aud_stop_sniping_mix" );
    _id_A5A4::_id_62EC( 5 );
    objective_add( 6, "current", &"BLACKOUT_FOLLOW_KAMAROV_TO_POWER_STATION", maps\blackout_code::rappel_org() );
    common_scripts\utility::_id_383F( "head_to_rappel_spot" );
    _id_A5A4::arcademode_checkpoint( 10, "c" );
    common_scripts\utility::_id_384A( "final_raid_begins" );
    thread raid_farmhouse();
    common_scripts\utility::_id_384A( "kam_starts_talking" );
    _id_A5A4::_id_62EC( 6 );
    common_scripts\utility::_id_384A( "kam_wants_more_sniping" );
    common_scripts\utility::_id_384A( "gaz_convinces_kam_otherwise" );
    objective_add( 6, "current", &"BLACKOUT_RAPPEL_DOWN_FROM_THE", maps\blackout_code::rappel_org() );
    common_scripts\utility::_id_384A( "player_rappels" );
    _id_A5A4::_id_62EC( 6 );
    objective_add( 7, "current", &"BLACKOUT_RESCUE_THE_INFORMANT", maps\blackout_code::informant_org() );
    _id_A5A4::_id_1143( "attack_farmhouse" );
}

start_rappel()
{
    _id_A5E8::_id_870C( "start_rappel_checkpoint" );
    common_scripts\utility::_id_383F( "cliff_look" );
    common_scripts\utility::_id_383F( "cliff_moveup" );
    common_scripts\utility::_id_383F( "cliff_roof_snipers_cleared" );
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    common_scripts\utility::_id_383F( "bm21s_attack" );
    common_scripts\utility::_id_383F( "kam_heads_to_rappel_spot" );
    common_scripts\utility::_id_383F( "head_to_rappel_spot" );
    common_scripts\utility::_id_383F( "cliff_complete" );
    thread start_cliff();
}

start_farmhouse()
{
    _id_A5E8::_id_870C( "start_farmhouse_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::_id_383F( "saw_first_bm21" );
    thread maps\blackout_code::cliff_bm21_blows_up();
    common_scripts\utility::_id_383F( "go_up_hill" );
    common_scripts\utility::_id_383F( "go_to_overlook" );
    common_scripts\utility::_id_383F( "overlook_attack_begins" );
    common_scripts\utility::_id_383F( "breach_complete" );
    common_scripts\utility::_id_383F( "on_to_the_farm" );
    common_scripts\utility::_id_383F( "power_plant_cleared" );
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    common_scripts\utility::_id_383F( "kam_go_through_burning_house" );
    common_scripts\utility::_id_383F( "bm21s_attack" );
    var_0 = getaiarray( "allies" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    var_1 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_1, _id_A5A4::_id_284E );
    common_scripts\utility::_id_383F( "player_reaches_cliff_area" );
    wait 0.5;
    var_2 = getent( "player_farmhouse_org", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0, 0, -27000 ) );
    var_3 = getentarray( "ally_farmhouse_org", "targetname" );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] _meth_81c9( var_3[var_4].origin, var_3[var_4].angles );

    level.playercardbackground setorigin( var_2.origin );
    thread raid_farmhouse();
    common_scripts\_exploder::_id_3528( 300 );
}

raid_farmhouse()
{
    _id_A5A4::_id_070A( "friendlies_charge_farmhouse" );
    var_0 = getentarray( "ally_forced_farm_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, _id_A5A4::_id_7402 );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    var_1 = getent( "ally_farm_spawner", "targetname" );
    level._id_7474 = var_1;
    _id_A5A4::_id_1ECF();
    _id_A5A4::_id_7EA2( "c", "r" );
    _id_A5A4::_id_4E8A( "r", "c" );
    _id_A5A4::_id_4E8A( "r", "c" );
    _id_A5A4::_id_4E8A( "r", "c" );
    thread maps\blackout_code::activate_farmhouse_defenders();
    var_2 = getent( "farm_rpg_spawner", "targetname" );
    var_2 thread _id_A5A4::_id_0798( maps\blackout_code::farm_rpg_guy_attacks_bm21s );
    var_2 _id_A5A4::_id_88C3();
    common_scripts\utility::_id_384A( "rpg_guy_attacks_bm21s" );
    common_scripts\utility::_id_384A( "farm_complete" );
    level._id_6F7C _id_A5A4::_id_2A32( "lets_move" );
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    wait 0.6;
    level._id_3C61 _id_A5A4::_id_7E38( "y" );
    thread blackout_house();
}

start_blackout()
{
    _id_A5E8::_id_870C( "start_blackout_checkpoint" );
    common_scripts\utility::_id_383F( "go_up_hill" );
    common_scripts\utility::_id_383F( "go_to_overlook" );
    common_scripts\utility::_id_383F( "overlook_attack_begins" );
    common_scripts\utility::_id_383F( "farm_complete" );
    common_scripts\utility::_id_383F( "blackout_house_begins" );
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    thread maps\_wibble::setup_wibble_helis( 1, "blackhawk_spawn_start" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_0, _id_A5A4::_id_284E );
    var_1 = getent( "player_blackout_org", "targetname" );
    level.playercardbackground setorigin( var_1.origin + ( 0, 0, -27000 ) );
    var_2 = getaiarray( "allies" );
    var_3 = getentarray( "ally_blackout_org", "targetname" );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] _meth_81c9( var_3[var_4].origin, var_3[var_4].angles );

    level.playercardbackground setorigin( var_1.origin );
    thread blackout_house();
    common_scripts\_exploder::_id_3528( 300 );
}

blackout_house()
{
    _id_A5A4::_id_1332( "allies" );
    objective_position( 7, maps\blackout_code::informant_org() );
    objective_ring( 7 );
    var_0 = getent( "blackout_path_block", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    common_scripts\utility::_id_384A( "blackout_house_begins" );
    var_1 = getentarray( "blind_guy_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::blind_guy_think );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\blackout_code::add_to_no_delete_group );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    level._id_6F7C._id_1300 = 5000;
    level._id_3C61._id_1300 = 5000;
    level._id_6F7C.grenadeammo = 0;
    level._id_3C61.grenadeammo = 0;
    level._id_6F7C _meth_8565( 1 );
    level._id_3C61 _meth_8565( 1 );
    level._id_6F7C _id_A5A4::_id_2A32( "cut_the_power" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
        thread maps\blackout_code::gaz_goes_to_cut_the_power();
    else
        thread maps\blackout_code::gaz_goes_to_cut_the_power_h1();

    level._id_6F7C _id_A5A4::_id_2A74();
    level._id_3C61 _id_A5A4::_id_2A74();
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "player_in_house" );
    _id_A5A4::_id_075F( maps\blackout_code::player_in_house );
    thread _id_A5A4::_id_2BDC();
    maps\blackout_code::price_approaches_door();
    _id_A5A4::_id_1143( "blackout" );
    level._id_3C61.goalradius = 120;
    level._id_3C61 waittill( "goal" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
        common_scripts\utility::_id_384A( "player_at_blackout_door" );
    else
    {
        while ( !common_scripts\utility::_id_382E( "player_at_blackout_door" ) && distancesquared( level._id_3C61.origin, level.playercardbackground.origin ) > 62500 )
            wait 0.1;
    }

    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "gaz_do_it" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
    {
        maps\blackout_code::blackout_lights_go_out();
        wait 0.5;
        level._id_3C61 thread _id_A510::_id_0C21( level._id_3C61, "i_cut_the_power" );
    }
    else
    {
        common_scripts\utility::_id_383F( "gaz_do_it" );
        level._id_3C61 waittillmatch( "single anim", "dialog" );
    }

    wait 0.25;
    level._id_6F7C _id_A5A4::_id_22DA( "on" );
    thread maps\blackout_code::lightswitch_response();
    maps\blackout_code::price_opens_door_and_goes_in();
    common_scripts\utility::_id_384A( "player_in_house" );
    maps\blackout_code::gaz_teleports_upstairs();
    thread blackout_rescue();
    common_scripts\utility::_id_384A( "gaz_runs_by_window" );
    _id_A5A4::_id_1143( "blackout_inside" );
    common_scripts\utility::_id_383F( "blackout_upstairs_spotlight_turn_on" );
    maps\blackout_code::blackout_fence_swap();
    thread maps\blackout_code::gaz_runs_by_window();
    common_scripts\utility::_id_3852( "turned_corner", "heli_flies_by" );
    common_scripts\utility::_id_383F( "turned_corner" );

    if ( !common_scripts\utility::_id_382E( "door" ) )
    {
        _id_A5A4::_id_27EF( 2, maps\blackout_code::price_attacks_door_guy );
        common_scripts\utility::_id_384A( "door" );
        wait 0.75;
    }
    else
        thread maps\blackout_code::price_attacks_door_guy();

    thread maps\blackout_code::gaz_opens_door_and_enters();
    common_scripts\utility::_id_384A( "blackout_rescue_complete" );
}

start_rescue()
{
    _id_A5E8::_id_870C( "start_rescue_checkpoint" );
    common_scripts\utility::_id_383F( "door" );
    common_scripts\utility::_id_383F( "go_up_hill" );
    common_scripts\utility::_id_383F( "go_to_overlook" );
    common_scripts\utility::_id_383F( "overlook_attack_begins" );
    common_scripts\utility::_id_383F( "farm_complete" );
    common_scripts\utility::_id_383F( "blackout_house_begins" );
    common_scripts\utility::_id_383F( "player_in_house" );
    common_scripts\utility::_id_383F( "go_through_burning_house" );
    common_scripts\utility::_id_383F( "gaz_opens_door" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::_id_825D();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0CF0( var_0, _id_A5A4::_id_284E );
    var_1 = getent( "rescue_player_org", "targetname" );
    level.playercardbackground setorigin( var_1.origin + ( 0, 0, -27000 ) );
    var_2 = getent( "rescue_price_org", "targetname" );
    level._id_6F7C _meth_81c9( var_2.origin );
    level.playercardbackground setorigin( var_1.origin );
    level.playercardbackground setplayerangles( var_1.angles );
    var_3 = getnode( "gaz_door_dead_node", "targetname" );
    level._id_3C61 _meth_81c9( var_3.origin );
    thread blackout_rescue();
    level._id_6F7C._id_1300 = 5000;
    level._id_3C61._id_1300 = 5000;
    level._id_6F7C.grenadeammo = 0;
    level._id_3C61.grenadeammo = 0;
    maps\blackout_code::blackout_fence_swap();
    wait 1;
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C.goalradius = 32;
    level._id_3C61 _meth_81a9( var_3 );
    level._id_3C61.goalradius = 32;
    var_4 = getent( "exit_door", "targetname" );
    var_4 thread _id_A5A4::_id_6666();
    common_scripts\_exploder::_id_3528( 300 );
}

blackout_rescue()
{
    thread maps\blackout_code::blackout_flashlight_guy();
    common_scripts\utility::_id_384A( "door" );
    common_scripts\utility::_id_384A( "blackout_flashlightguy_dead" );
    common_scripts\utility::_id_3831( "heli_flies_by" );
    _id_A5A4::_id_62EC( 7 );
    objective_add( 8, "current", &"BLACKOUT_EVAC_WITH_THE_INFORMANT", maps\blackout_code::get_evac_org() );
    common_scripts\utility::_id_383F( "blackhawk_spawn_start" );
    var_0 = _id_A5A8::_id_8978( "rescue_blackhawk" );
    var_0._id_799F = 1;
    var_1 = getent( "rescue_heli_org", "targetname" );
    var_2 = spawn( "script_model", var_0 gettagorigin( "body_animate_jnt" ) );
    var_2 setmodel( "vehicle_blackhawk_sas_night_interior" );
    var_2.angles = var_0.angles;
    var_2 linkto( var_0, "body_animate_jnt" );
    var_3 = getent( "blackhawk_collision", "targetname" );
    var_3 linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4 = getent( "blackhawk_death_trigger", "targetname" );
    var_4 thread _id_A5A4::_id_5972( var_0, ( 0, 0, -50 ) );
    var_4 thread _id_A5A8::heli_squashes_stuff( "blackhawk_lands" );
    var_0._id_0C72 = "blackhawk";
    var_0 thread _id_A5AA::_id_7611();
    level.blackhawk = var_0;
    var_0 _id_A5A4::_id_0D61();
    maps\_wibble::wibble_add_heli_to_track( var_0 );
    playfxontag( level._effect["blackout_heli_cockpit_red"], var_0, "tag_light_cargo01" );
    common_scripts\utility::_id_3857( "player_in_house" );
    var_1 _id_A510::_id_0BC7( var_0, "landing" );
    var_0 thread maps\blackout_code::blackhawk_sound();
    thread common_scripts\_exploder::_id_3528( 400 );
    setsaveddvar( "cg_skipDObjFilterIntoCells", 1 );
    var_1 _id_A510::_id_0C24( var_0, "landing" );
    setsaveddvar( "cg_skipDObjFilterIntoCells", 0 );
    var_1 thread _id_A510::_id_0BE1( var_0, "idle" );
    common_scripts\utility::_id_383F( "blackhawk_lands" );

    if ( getdvarint( "use_old_evac" ) != 1 )
        var_5 = _id_A5A4::_id_88D1( "evac_rig" );
    else
        var_5 = _id_A5A4::_id_88D1( "player_rig" );

    var_5 hide();
    var_0 _id_A510::_id_0BC7( var_5, "player_evac", "tag_detach" );
    var_5 linkto( var_0, "tag_detach" );
    common_scripts\utility::_id_384A( "friendly_head_to_LZ" );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "evac", "tag_detach" );
    level._id_6F7C linkto( var_0, "tag_detach" );
    level._id_6F7C maps\_headtracking::head_tracking_end();
    var_0 thread _id_A510::_id_0C24( level._id_6F7C, "evac", "tag_detach" );
    var_0 thread maps\blackout_code::price_evac_idle();
    var_6 = getent( "heli_rescue_trigger", "script_noteworthy" );
    var_6 common_scripts\utility::_id_97CE();
    thread maps\blackout_code::player_jumps_into_heli();
    common_scripts\utility::_id_384A( "player_gets_on_heli" );
    var_7 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_7, maps\_headtracking::head_tracking_end );
    _id_A5E8::_id_870C( "start_player_gets_on_heli_mix" );

    if ( isdefined( level.playercardbackground._id_60EA ) )
        thread _id_A55E::force_remove_nightvision();

    var_6 delete();
    level._id_4AC8["text"].alpha = 0;
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground disableweapons();
    var_8 = [];
    var_8[var_8.size] = level._id_3C61;
    var_8[var_8.size] = level.vip;

    if ( getdvarint( "use_old_evac" ) != 1 )
    {
        var_5 attach( "viewmodel_m4m203_silencer_reflex", "tag_weapon_right" );
        var_5 _id_A5A4::_id_5699( level.playercardbackground, "tag_player", 0.5, 0.9, 70, 60, 40, 30 );
        wait 0.5;
        var_5 show();
        var_0 thread _id_A510::_id_0C24( var_5, "player_evac", "tag_detach" );
        thread h1_rescueclimbheli_viewclamp_seq();
        var_0 _id_A510::_id_0BC5( var_8, "evac", "tag_detach" );
        level._id_3C61 linkto( var_0, "tag_detach" );
        level.vip linkto( var_0, "tag_detach" );
        wait 1.5;
        var_0 thread _id_A510::_id_0C18( var_8, "evac", "tag_detach" );
        wait 5.5;
        common_scripts\utility::_id_3831( "blackhawk_lands" );
        var_0 notify( "stop_loop" );
        var_0 thread _id_A510::_id_0C24( level._id_6F7C, "evac_flyaway", "tag_detach" );
        wait 2.5;
    }
    else
    {
        var_5 _id_A5A4::_id_5699( level.playercardbackground, "tag_player", 0.5, 0.9, 90, 90, 90, 90 );
        var_0 thread _id_A510::_id_0C24( var_5, "player_evac", "tag_detach" );
        wait 2.5;
        common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_05E1, var_0, "tag_detach" );
        var_0 thread _id_A510::_id_0C18( var_8, "evac", "tag_detach" );
        wait 8;
        common_scripts\utility::_id_3831( "blackhawk_lands" );
        var_0 notify( "stop_loop" );
        var_0 thread _id_A510::_id_0C24( level._id_6F7C, "evac_flyaway", "tag_detach" );
    }

    var_1 notify( "stop_loop" );
    var_1 thread _id_A510::_id_0C24( var_0, "take_off" );
    _id_A5A4::_id_62EC( 8 );
}

h1_rescueclimbheli_viewclamp_seq()
{
    level.playercardbackground lerpviewangleclamp( 0.7, 0, 0, 0, 0, 0, 0 );
    wait 1.7;
    level.playercardbackground lerpviewangleclamp( 1.0, 0, 0, 0, 30, 0, 25 );
    wait 1.8;
    level.playercardbackground lerpviewangleclamp( 1.0, 0, 0, 0, 60, 0, 25 );
    wait 16.5;
}

rescue_blackhawk_spotlight()
{
    maps\blackout_code::helicopter_searchlight_on();

    if ( distancesquared( self.origin, level.playercardbackground.origin ) < 25000000 )
    {
        self waittillmatch( "single anim", "spot_player" );
        thread maps\blackout_code::spot_target( level.playercardbackground, undefined, 700 );
    }

    self waittillmatch( "single anim", "spot_path" );
    var_0 = getent( "first_spotlight_org", "targetname" );
    thread maps\blackout_code::spot_target( var_0 );
}
