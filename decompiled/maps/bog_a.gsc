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
    maps\bog_a_precache::main();
    maps\_flare::main( "tag_flash" );
    maps\_zpu::main( "vehicle_zpu4" );
    maps\bog_a_fx::main();
    maps\createart\bog_a_art::main();
    maps\createfx\bog_a_audio::main();
    maps\_load::main();
    maps\bog_a_anim::main();
    maps\bog_a_backhalf_anim::main();
    level thread maps\bog_a_amb::main();
    maps\bog_a_lighting::main();
    maps\_nightvision::main();
}

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        if ( !common_scripts\utility::_id_3839( "_cloaked_stealth_enabled" ) )
            common_scripts\utility::_id_383D( "_cloaked_stealth_enabled" );

        return;
    }

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    setdvar( "use_old_meleestruggle", 1 );
    setsaveddvar( "r_specularColorScale", "2.42" );
    var_0 = getent( "real", "targetname" );
    level.player setplayerangles( var_0.angles );
    level.player setorigin( var_0.origin );
    setsaveddvar( "compassMaxRange", 2500 );
    precacheitem( "rpg_straight" );
    precacheitem( "cobra_ffar_bog_a_lite" );
    precachemodel( "tag_laser" );
    precachemodel( "weapon_javelin" );
    precachemodel( "vehicle_zpu4_burn" );
    precachemodel( "com_night_beacon_obj" );
    precachemodel( "com_night_beacon" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachestring( &"BOG_A_ELIMINATE_ENEMY_FORCES" );
    precachestring( &"BOG_A_GET_THE_JAVELIN" );
    precachestring( &"BOG_A_DESTROY_THE_ARMORED_VEHICLES" );
    precachestring( &"BOG_A_SECURE_THE_M1A2_ABRAMS" );
    precachestring( &"BOG_A_SECURE_THE_M1A1_ABRAMS" );
    precachestring( &"BOG_A_INTERCEPT_THE_ENEMY_BEFORE" );
    precachestring( &"BOG_A_DESTROY_THE_ZPU_ANTI" );
    precachestring( &"BOG_A_SECURE_THE_SOUTHERN_SECTOR" );
    precachestring( &"BOG_A_PLANT_THE_IR_BEACON_TO" );
    precachestring( &"BOG_A_WAIT_FOR_AIR_SUPPORT" );
    precachestring( &"BOG_A_REGROUP_WITH_THE_SQUAD" );
    precachestring( &"BOG_A_THE_TANK_WAS_OVERRUN" );
    precachestring( &"SCRIPT_PLATFORM_HINT_PLANTBEACON" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_heavy_500" );
    precacherumble( "heli_loop" );
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
    maps\bog_a_precache::main();
    maps\bog_a_fx::main();
    maps\_javelin::init();
    maps\_utility::_id_079C( "melee", maps\bog_a_code::start_melee, &"STARTS_MELEE" );
    maps\_utility::_id_079C( "breach", maps\bog_a_code::start_breach, &"STARTS_BREACH1" );
    maps\_utility::_id_079C( "alley", maps\bog_a_code::start_alley, &"STARTS_ALLEY" );
    maps\_utility::_id_079C( "shanty", maps\bog_a_code::start_alley, &"STARTS_SHANTY" );
    maps\_utility::_id_079C( "bog", maps\bog_a_code::start_bog, &"STARTS_BOG" );
    maps\_utility::_id_079C( "zpu", maps\bog_a_backhalf::start_zpu, &"STARTS_ZPU" );
    maps\_utility::_id_079C( "cobras", maps\bog_a_backhalf::start_cobras, &"STARTS_COBRAS" );
    maps\_utility::_id_079C( "end", maps\bog_a_backhalf::start_end, &"STARTS_END1" );
    maps\_utility::_id_278B( ::ambush );
    level.flare_fog = "bog_a_flare";
    level.flare_fog_return = "bog_a";
    maps\_flare::main( "tag_flash" );
    maps\_c4::main();
    maps\createart\bog_a_art::main();
    maps\createfx\bog_a_audio::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_dragunov_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_saw_clip";
    level.weaponclipmodels[4] = "weapon_m14_clip";
    level.weaponclipmodels[5] = "weapon_g3_clip";
    maps\_load::main();
    maps\_nightvision::main();
    maps\_zpu::main( "vehicle_zpu4" );
    maps\bog_a_backhalf::bog_backhalf_init();
    maps\bog_a_lighting::main();
    maps\bog_a_aud::main();
    maps\_helicopter_globals::_id_4CFA();
    thread maps\bog_a_code::debug_player_damage();
    maps\_utility::_id_1332( "allies" );
    maps\_utility::_id_0764( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::_id_8487 );
    maps\_utility::_id_0764( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::_id_8451 );
    maps\_utility::_id_0764( "c4_use", &"SCRIPT_C4_USE", maps\bog_a_backhalf::dont_show_c4_hint );
    thread maps\bog_a_code::disable_nvg();
    level.aim_targets = getentarray( "aim_target", "targetname" );
    createthreatbiasgroup( "upstairs_unreachable_enemies" );
    createthreatbiasgroup( "upstairs_window_enemies" );
    createthreatbiasgroup( "pacifist_lower_level_enemies" );
    createthreatbiasgroup( "melee_struggle_guy" );
    createthreatbiasgroup( "friendlies_flanking_apartment" );
    createthreatbiasgroup( "friendlies_under_unreachable_enemies" );
    createthreatbiasgroup( "player_seeker" );
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    setthreatbias( "player", "player_seeker", 15000 );
    maps\_utility::_id_4BB3( "pacifist_lower_level_enemies", "friendlies_flanking_apartment" );
    maps\_utility::_id_4BB3( "pacifist_lower_level_enemies", "allies" );
    maps\_utility::_id_4BB3( "upstairs_window_enemies", "friendlies_flanking_apartment" );
    maps\_utility::_id_4BB3( "upstairs_window_enemies", "friendlies_under_unreachable_enemies" );
    maps\_utility::_id_4BB3( "friendlies_under_unreachable_enemies", "upstairs_window_enemies" );
    maps\_utility::_id_4BB3( "upstairs_unreachable_enemies", "friendlies_under_unreachable_enemies" );
    maps\_utility::_id_4BB3( "upstairs_unreachable_enemies", "friendlies_flanking_apartment" );
    var_1 = getentarray( "enable_pacifists_to_attack_me", "targetname" );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::enable_pacifists_to_attack_me );
    common_scripts\utility::_id_383D( "friendlies_take_fire" );
    common_scripts\utility::_id_383D( "move_up!" );
    common_scripts\utility::_id_383D( "initial_contact" );
    common_scripts\utility::_id_383D( "melee_sequence_complete" );
    common_scripts\utility::_id_383D( "laundry_room_price_talks_to_hq" );
    common_scripts\utility::_id_383D( "price_reaches_end_of_bridge" );
    common_scripts\utility::_id_383D( "price_flanks_apartment" );
    common_scripts\utility::_id_383D( "friendlies_move_up_the_bridge" );
    common_scripts\utility::_id_383D( "second_floor_ready_for_storming" );
    common_scripts\utility::_id_383D( "unreachable_enemies_under_attack" );
    common_scripts\utility::_id_383D( "window_enemies_under_attack" );
    common_scripts\utility::_id_383D( "lasers_have_moved" );
    common_scripts\utility::_id_383D( "friendlies_lead_player" );
    common_scripts\utility::_id_383D( "lasers_shift_fire" );
    common_scripts\utility::_id_383D( "melee_sequence_begins" );
    common_scripts\utility::_id_383D( "armada_passes_by" );
    common_scripts\utility::_id_383D( "price_reaches_moveup_point" );
    common_scripts\utility::_id_383D( "alley_enemies_spawn" );
    common_scripts\utility::_id_383D( "javelin_guy_in_position" );
    common_scripts\utility::_id_383D( "force_kill_javelin_guy" );
    common_scripts\utility::_id_383D( "right_away_done" );
    common_scripts\utility::_id_383D( "west_is_down_done" );
    common_scripts\utility::_id_383D( "price_in_position_for_jav_seq" );
    common_scripts\utility::_id_383D( "player_has_javelin" );
    common_scripts\utility::_id_383D( "javelin_guy_died" );
    common_scripts\utility::_id_383D( "pickup_javelin" );
    common_scripts\utility::_id_383D( "overpass_baddies_flee" );
    common_scripts\utility::_id_383D( "shanty_speedrun" );
    common_scripts\utility::_id_383D( "kill_bog_ambient_fighting" );
    common_scripts\utility::_id_383D( "second_floor_door_breach_initiated" );
    common_scripts\utility::_id_383D( "friendlies_storm_second_floor" );
    common_scripts\utility::_id_383D( "price_in_alley_position" );
    common_scripts\utility::_id_383D( "vas_stops_leading" );
    common_scripts\utility::_id_383D( "bmp_got_killed" );
    common_scripts\utility::_id_383D( "all_bmps_dead" );
    common_scripts\utility::_id_383D( "contact_on_the_overpado!" );
    common_scripts\utility::_id_383D( "jav_guy_ready_for_briefing" );
    common_scripts\utility::_id_383D( "overpass_guy_attacks!" );
    common_scripts\utility::_id_383D( "player_enters_the_fray" );
    common_scripts\utility::_id_383D( "ambush_player" );
    common_scripts\utility::_id_383D( "player_interupts_melee_struggle" );
    common_scripts\utility::_id_383D( "cobra_missiles_done" );
    common_scripts\utility::_id_383D( "unreachable_apartment_cleared" );
    common_scripts\utility::_id_383D( "price_to_minigun" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "player_heads_towards_apartment", common_scripts\utility::_id_383F, "pacifist_guys_move_up" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "alley_enemies_spawn", maps\_utility::_id_0709, "laundryroom_spawner" );
    maps\bog_a_anim::main();
    maps\bog_a_backhalf_anim::main();
    maps\_compass::setupminimap( "compass_map_bog_a" );
    level thread maps\bog_a_amb::main();
    level._effect["vehicle_explosion"] = loadfx( "fx/explosions/large_vehicle_explosion" );
    var_2 = getentarray( "upper_floor_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, maps\bog_a_code::upstairs_unreachable_enemies );
    var_3 = getentarray( "window_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, maps\bog_a_code::upstairs_window_enemies );
    maps\_utility::_id_1332( "allies" );
    var_4 = getaiarray( "allies" );
    level._id_3A89 = maps\bog_a_code::bridge_friendly_spawns;
    var_5 = getentarray( "aim_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_5, maps\bog_a_code::aim_trigger_think );
    var_6 = getentarray( "delete", "targetname" );
    common_scripts\utility::_id_0D13( var_6, maps\bog_a_code::_id_2819 );
    var_7 = getentarray( "threatbias_lower", "targetname" );
    common_scripts\utility::_id_0D13( var_7, maps\bog_a_code::threatbias_lower_trigger );
    var_8 = getentarray( "threatbias_normal", "targetname" );
    common_scripts\utility::_id_0D13( var_8, maps\bog_a_code::threatbias_normal_trigger );
    thread apartment_second_floor();
    var_9 = getent( "alley_balcony_guy", "script_noteworthy" );
    var_9 thread maps\_utility::_id_0798( maps\bog_a_code::alley_balcony_guy );
    var_10 = getentarray( "alley_longrange_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_10, maps\_utility::_id_0798, maps\bog_a_code::alley_sniper_engagementdistance );
    var_11 = getentarray( "alley_shortrange_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_11, maps\_utility::_id_0798, maps\bog_a_code::alley_close_smg_engagementdistance );
    var_12 = getentarray( "alley_mediumrange_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_12, maps\_utility::_id_0798, maps\bog_a_code::alley_smg_engagementdistance );
    var_13 = getentarray( "alley_roof_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_13, maps\_utility::_id_0798, maps\bog_a_code::alley_roof_guy );
    var_14 = getentarray( "alley_playerseeker", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_14, maps\_utility::_id_0798, maps\bog_a_code::alley_smg_playerseeker );
    var_15 = getent( "breach_1", "script_noteworthy" );
    var_15 thread maps\_utility::_id_0798( maps\bog_a_code::die_after_spawn, 1.5 );
    var_16 = getent( "breach_2", "script_noteworthy" );
    var_16 thread maps\_utility::_id_0798( maps\bog_a_code::die_after_spawn, 4.95 );
    thread maps\bog_a_code::shanty_fence_cut_setup();
    thread _id_5FFB();
}

ambush()
{
    soundscripts\_snd::_id_870C( "start_ambush_checkpoint" );
    thread maps\bog_a_code::second_floor_door_breach_guys( 0 );
    thread maps\bog_a_code::flank_guy();
    thread maps\bog_a_code::street_laser_light_show();
    ambush_enemies();
    thread helicopters_fly_by();
    thread apartment_rubble_helicopter();
    var_0 = getaiarray();
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E5E, 1 );
    maps\bog_a_code::remove_corner_ai_blocker();
    var_1 = getentarray( "initial_friendly", "targetname" );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::initial_friendly_setup );
    level._id_6F7C = getent( "price", "targetname" );
    maps\_utility::_id_88F1( level._id_6F7C );
    level._id_6F7C maps\_utility::_id_5926();
    level._id_6F7C thread run_down_street();
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread maps\_utility::_id_58D7();
    level._id_6F7C._id_0C78 = 1;
    level.mark = getent( "friendly3", "script_noteworthy" );
    level.mark thread maps\_utility::_id_58D7();
    level.mark maps\_utility::_id_5926();
    thread friendlies_advance_up_the_bridge();
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "tank_is_stuck" );
    var_2 = getent( "friendly1", "script_noteworthy" );
    var_3 = getent( "friendly2", "script_noteworthy" );
    var_2._id_0C72 = "generic";
    var_3._id_0C72 = "generic";
    var_2 maps\_utility::_id_27EF( 0, maps\_anim::_id_0C24, var_2, "spin" );
    var_3 maps\_utility::_id_27EF( 1.5, maps\_anim::_id_0C24, var_3, "spin" );
    maps\_utility::_id_27EF( 5.5, ::price_blends_into_run );
    common_scripts\utility::_id_384A( "safe_for_objectives" );
    objective_add( 1, "active", &"BOG_A_SECURE_THE_M1A2_ABRAMS", ( 4800.0, 1488.0, 32.0 ) );
    objective_current( 1 );
}

price_blends_into_run()
{
    level._id_6F7C _meth_8143();
    level._id_6F7C notify( "single anim", "end" );
}

ambush_enemies()
{
    var_0 = getentarray( "rooftop_guy", "targetname" );
    var_1 = getentarray( "pacifist_rubble_guys", "targetname" );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::ignore_suppression_until_ambush );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::increase_goal_radius_when_friendlies_flank );
    var_2 = getentarray( "ambusher_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_2, maps\_spawner::_id_38F3 );
    var_3 = getent( "window_mg_spawner", "script_noteworthy" );
    var_3 maps\_utility::_id_0798( maps\bog_a_code::set_threatbias_group, "upstairs_window_enemies" );
    waitframe;
}

friendlies_advance_up_the_bridge()
{
    var_0 = getent( "lose_goal_volume_trigger", "targetname" );
    var_0 thread maps\bog_a_code::lose_goal_volume();
    maps\_utility::_id_1ECF();
    maps\_utility::_id_7EA2( "c", "y" );
    maps\_utility::_id_7EA2( "b", "y" );
    level._id_7474 = getent( "respawn_spawner", "targetname" );
    thread ambush_trigger();
    var_1 = getent( "friendly1", "script_noteworthy" );
    var_2 = getent( "friendly2", "script_noteworthy" );
    var_3 = getent( "friendly3", "script_noteworthy" );
    var_4 = getent( "friendly4", "script_noteworthy" );
    var_5 = getent( "friendly5", "script_noteworthy" );
    var_6 = getent( "friendly6", "script_noteworthy" );
    var_7 = getent( "friendly7", "script_noteworthy" );
    var_3 _meth_81ce( "crouch" );
    var_4 _meth_81ce( "crouch" );
    var_7 _meth_81ce( "crouch" );
    var_3 _meth_8168( 1 );
    var_4 _meth_8168( 1 );
    var_7 _meth_8168( 1 );
    var_1 maps\_utility::_id_27EF( 0, ::run_down_street );
    wait 3.5;
    thread additional_guys_chime_in();
    var_8 = getentarray( "initial_friendly", "targetname" );
    var_9 = [];

    for ( var_10 = 0; var_10 < 6; var_10++ )
        var_9[var_10] = var_10 * 0.3 + randomfloat( 0.15 );

    var_9 = common_scripts\utility::_id_0CF5( var_9 );
    var_2 maps\_utility::_id_27EF( 0.0, ::run_down_street, var_9[0] );
    var_3 maps\_utility::_id_27EF( 0.4, ::run_down_street, var_9[1] );
    var_4 maps\_utility::_id_27EF( 0.4, ::run_down_street, var_9[2] );
    var_5 maps\_utility::_id_27EF( 0.0, ::run_down_street, var_9[3] );
    var_6 maps\_utility::_id_27EF( 0.0, ::run_down_street, var_9[4] );
    var_7 maps\_utility::_id_27EF( 0.5, ::run_down_street, var_9[5] );
    common_scripts\utility::_id_384A( "friendlies_take_fire" );
    var_11 = getaiarray();
    common_scripts\utility::_id_0D13( var_11, maps\_utility::_id_7E5E, 0 );
    var_3 _meth_8168( 1 );
    var_4 _meth_8168( 1 );
    var_7 _meth_8168( 1 );
    maps\_utility::_id_27EF( 2, maps\bog_a_code::incoming_rpg );
    maps\_utility::_id_7ED3( "axis", 0 );
    wait 2.5;
    thread maps\_flare::flare_from_targetname( "flare" );
    common_scripts\_exploder::_id_3528( 1 );
    var_12 = getent( "underground_obj_org", "targetname" );
    common_scripts\utility::_id_76BB( "update_underground_obj_trigger", maps\bog_a_code::update_apartment_objective_position );
    objective_add( 2, "active", &"BOG_A_ELIMINATE_ENEMY_FORCES", var_12.origin );
    objective_indentlevel( 2, 1 );
    objective_current( 2 );

    if ( !common_scripts\utility::_id_382E( "friendlies_already_moved_up_bridge" ) )
        maps\_utility::_id_070A( "friendlies_move_up_bridge" );

    wait 1.5;
    common_scripts\utility::_id_383F( "friendlies_move_up_the_bridge" );
    thread price_moves_behind_concrete_barrier();
    thread friendly_bridge_flank_grabber();
    var_13 = getaiarray( "allies" );
    var_13 = maps\_utility::_id_735E( var_13 );
    var_13 = common_scripts\utility::_id_0CDA( var_13, level.mark );
    common_scripts\utility::_id_0D13( var_13, maps\_utility::_id_7E38, "y" );
    var_14 = maps\_utility::_id_3D7A( "allies", "y" );

    for ( var_10 = var_14.size; var_10 < 8; var_10++ )
        thread maps\_utility::_id_8944( "m4grunt" );

    thread price_tells_squad_to_flank_right();
    common_scripts\utility::_id_384A( "player_heads_towards_apartment" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "switch_to_night_vision" );
    thread maps\bog_a_code::window_enemies_respond_to_attack();
    thread maps\bog_a_code::upstairs_enemies_respond_to_attack();
    level.flank_guy _meth_81ce( "stand" );
    level.flank_guy thread maps\_spawner::_id_4241();
    var_15 = maps\_utility::_id_3D7A( "allies", "c" );
    var_15 = maps\_utility::_id_735E( var_15 );

    for ( var_10 = var_15.size; var_10 < 2; var_10++ )
        thread maps\_utility::_id_7017( "y", "c", "m4grunt" );

    maps\_utility::_id_070A( "friendlies_leave_bridge" );
    player_flanks_right_or_goes_straight();
    level.flank_guy maps\_utility::_id_8EA4();
    level.flank_guy thread maps\_utility::_id_7402();
    level.flank_guy maps\_utility::_id_9A4B();
    level.flank_guy flanks_apartment();
    common_scripts\utility::_id_384A( "grenade_launcher_hint" );
    thread maps\bog_a_code::melee_sequence();
    thread player_enters_second_floor();
    maps\_utility::_id_070A( "player_enters_apartment_rubble_area" );
    var_15 = maps\_utility::_id_3D7A( "allies", "c" );
    common_scripts\utility::_id_383F( "friendlies_lead_player" );
    common_scripts\utility::_id_0D13( var_15, maps\bog_a_code::cyan_guys_lead_player_to_apartment );
    level._id_3A7A = maps\bog_a_code::promoted_cyan_guy_leads_player_to_apartment;
    common_scripts\utility::_id_384A( "player_enters_apartment_rubble_area" );
    thread price_directs_players_upstairs();
}

player_gets_ambushed()
{
    level endon( "friendlies_take_fire" );
    common_scripts\utility::_id_384A( "ambush_player" );
    var_0 = getentarray( "apartment_manual_mg", "targetname" );
    var_1 = var_0[0];
    var_2 = var_0[1];
    level._id_1ADC = 0;
    level.player endon( "death" );
    var_1 settargetentity( level.player );
    var_2 settargetentity( level.player );
    var_1 thread maps\bog_a_code::manual_mg_fire();
    wait 0.15;
    var_2 thread maps\bog_a_code::manual_mg_fire();
    wait 1.0;
    level.player enablehealthshield( 0 );
    level.player kill();
}

ambush_trigger()
{
    thread player_gets_ambushed();
    var_0 = getentarray( "apartment_manual_mg", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\bog_a_code::scr_setmode, "manual" );
    var_1 = var_0[0];
    var_2 = var_0[1];
    var_3 = getent( "ambush_trigger", "targetname" );
    var_4 = [];
    var_5 = [];

    for (;;)
    {
        var_3 waittill( "trigger", var_6 );
        var_6 thread maps\_utility::_id_4BAC();

        if ( var_6 maps\_utility::_id_5036() )
            continue;

        if ( isdefined( var_5[var_6._id_0908] ) )
            continue;

        var_5[var_6._id_0908] = 1;
        var_4[var_4.size] = var_6;

        if ( var_4.size >= 3 )
            break;
    }

    if ( !common_scripts\utility::_id_382E( "player_enters_the_fray" ) )
        common_scripts\utility::_id_0D13( var_4, maps\_utility::_id_8EA4 );

    var_7 = getaiarray( "allies" );

    for ( var_8 = 0; var_8 < var_7.size; var_8++ )
    {
        if ( !isdefined( var_5[var_7[var_8]._id_0908] ) )
            var_7[var_8] thread maps\_utility::_id_2BC3( maps\_utility::waitspread, 0.25, maps\_utility::_id_7C82, "stop_running_to_node" );
    }

    maps\_utility::_id_1333( "allies" );
    common_scripts\utility::_id_383F( "friendlies_take_fire" );
    var_1 settargetentity( var_4[0] );
    var_2 settargetentity( var_4[1] );
    var_1 thread maps\bog_a_code::manual_mg_fire();
    wait 0.15;
    var_2 thread maps\bog_a_code::manual_mg_fire();
    var_4[0] thread maps\bog_a_code::die_soon( 0.2 );
    maps\bog_a_code::_id_9F91( var_4[0] );
    var_1 settargetentity( var_4[2] );
    var_4[1] thread maps\bog_a_code::die_soon( 0.2 );
    maps\bog_a_code::_id_9F91( var_4[1] );
    wait 0.5;
    var_2 thread maps\bog_a_code::shoot_mg_targets();
    var_4[2] thread maps\bog_a_code::die_soon( 0.2 );
    maps\bog_a_code::_id_9F91( var_4[2] );
    wait 0.5;
    var_1 thread maps\bog_a_code::shoot_mg_targets();
}

player_enters_second_floor()
{
    for (;;)
    {
        common_scripts\utility::_id_3831( "player_nears_second_floor" );
        common_scripts\utility::_id_384A( "player_nears_second_floor" );
        setignoremegroup( "player", "axis" );
        common_scripts\utility::_id_3831( "player_disrupts_second_floor" );
        common_scripts\utility::_id_3831( "player_leaves_second_floor" );
        maps\bog_a_code::wait_for_player_to_disrupt_second_floor_or_leave();
        maps\bog_a_code::clear_player_threatbias_vs_apartment_enemies();
        setthreatbias( "player", "axis", 0 );

        if ( common_scripts\utility::_id_382E( "player_disrupts_second_floor" ) )
            break;
    }

    common_scripts\utility::_id_383F( "second_floor_ready_for_storming" );
    common_scripts\utility::_id_384A( "window_enemies_under_attack" );
    waitframe;
    setthreatbias( "player", "upstairs_window_enemies", 0 );
}

handle_player_flanking()
{
    level endon( "player_enters_apartment_rubble_area" );
    common_scripts\utility::_id_384A( "player_nears_first_building" );

    if ( !common_scripts\utility::_id_382E( "friendlies_moves_through_first_building" ) )
    {
        level.flank_guy maps\_utility::_id_7E38( "g" );
        common_scripts\utility::_id_384A( "friendlies_moves_through_first_building" );
    }
}

player_flanks_right_or_goes_straight()
{
    handle_player_flanking();
    var_0 = getent( "ai_apartment_flank_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    maps\_utility::_id_070A( "friendlies_moves_through_first_building" );
}

price_tells_squad_to_flank_right()
{
    common_scripts\utility::_id_384A( "player_reaches_end_of_bridge" );
    common_scripts\utility::_id_384A( "price_reaches_end_of_bridge" );
    var_0 = "";
    var_1 = "";
    var_2 = [];
    var_2[var_2.size] = "follow_me";
    var_2[var_2.size] = "move_it";
    var_2[var_2.size] = "this_way";

    while ( !common_scripts\utility::_id_382E( "player_heads_towards_apartment" ) )
    {
        var_3 = 1;

        if ( common_scripts\utility::_id_382E( "price_flanks_apartment" ) )
            var_3 = distance( level.player.origin, level._id_6F7C.origin ) > 200;

        if ( var_3 )
        {
            while ( var_1 == var_0 )
                var_1 = common_scripts\utility::_id_710E( var_2 );

            var_0 = var_1;
            level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, var_1 );
        }

        wait(randomfloatrange( 5, 8 ));
    }
}

price_moves_behind_concrete_barrier()
{
    while ( !isdefined( level._id_6F7C.reached_bridge_flee_spot ) )
        wait 1;

    price_moves_up_and_waves_player_on();
    common_scripts\utility::_id_384A( "player_heads_towards_apartment" );
    var_0 = getnode( "price_flank_node", "targetname" );
    var_0 notify( "stop_idle" );
    common_scripts\utility::_id_383F( "price_flanks_apartment" );

    if ( !common_scripts\utility::_id_382E( "price_to_minigun" ) )
        level._id_6F7C flanks_apartment();
}

price_moves_up_and_waves_player_on()
{
    if ( common_scripts\utility::_id_382E( "player_heads_towards_apartment" ) )
        return;

    level endon( "player_heads_towards_apartment" );
    var_0 = getnode( "price_road_node", "targetname" );
    level._id_6F7C _meth_81a9( var_0 );
    level._id_6F7C.goalradius = 64;
    level._id_6F7C waittill( "goal" );
    common_scripts\utility::_id_383F( "price_reaches_moveup_point" );
    wait 1;
    var_0 = getnode( "price_flank_node", "targetname" );
    var_0 maps\_anim::_id_0BFF( level._id_6F7C, "wait_approach" );
    var_0 maps\_anim::_id_0C24( level._id_6F7C, "wait_approach" );
    thread maps\bog_a_code::price_waits_at_node_and_waves( var_0, "price_flanks_apartment" );
    common_scripts\utility::_id_383F( "price_reaches_end_of_bridge" );
    wait_until_player_gets_close_or_progresses();
}

wait_until_player_gets_close_or_progresses()
{
    if ( common_scripts\utility::_id_382E( "player_heads_towards_apartment" ) )
        return;

    level endon( "player_heads_towards_apartment" );

    while ( distance( level.player.origin, level._id_6F7C.origin ) > 115 )
        wait 1;
}

flanks_apartment()
{
    maps\_utility::_id_7E38( "c" );
    self.ignoresuppression = 1;
    self.ignoreme = 0;
    self.pacifist = 0;

    if ( self getthreatbiasgroup() == "friendlies_flanking_apartment" )
        return;

    if ( self getthreatbiasgroup() == "allies" )
        self setthreatbiasgroup( "friendlies_flanking_apartment" );
    else
    {

    }
}

friendly_bridge_flank_grabber()
{
    level endon( "player_heads_towards_apartment" );
    thread friendly_flank_deleter();
    var_0 = getent( "friendly_bridge_trigger", "targetname" );
    var_1 = 2;
    wait 5;

    for (;;)
    {
        var_2 = maps\_utility::_id_3D7A( "allies", "c" ).size;

        if ( var_2 >= 2 )
        {
            wait 1;
            continue;
        }

        var_3 = getaiarray( "allies" );
        var_3 = maps\_utility::_id_735E( var_3 );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = var_3[var_4];

            if ( !var_5 istouching( var_0 ) )
                continue;

            var_5 flanks_apartment();
            break;
        }

        wait 10;
    }
}

friendly_flank_deleter()
{
    level endon( "player_heads_towards_apartment" );
    var_0 = getent( "allies_apartment_delete", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 == level._id_6F7C )
        {
            var_1 thread maps\_utility::_id_4BAC();
            continue;
        }

        var_1 maps\_utility::_id_7E38( "y" );

        if ( isdefined( var_1._id_58D7 ) )
            var_1 maps\_utility::_id_8EA4();

        var_1 delete();
    }
}

additional_guys_chime_in()
{
    var_0 = spawnstruct();
    var_0._id_44CE = getentarray( "initial_friendly", "targetname" );
    var_0.index = 0;
    wait 3.5;
    var_0 maps\bog_a_code::set_talker();
    var_0._id_9133 thread maps\_anim::_id_0C24( var_0._id_9133, "move_it" );
    wait 2.2;
    var_0 maps\bog_a_code::set_talker();
    var_0._id_9133 thread maps\_anim::_id_0C24( var_0._id_9133, "keep_moving_up" );
    common_scripts\utility::_id_384A( "friendlies_take_fire" );
    wait 1.35;
    var_0 maps\bog_a_code::set_talker();
    var_0._id_9133 thread maps\_anim::_id_0C24( var_0._id_9133, "ambush1" );
    wait 1.3;
    var_0 maps\bog_a_code::set_talker();
    var_0._id_9133 thread maps\_anim::_id_0C24( var_0._id_9133, "contact_right" );
    wait 0.5;
    var_0 maps\bog_a_code::set_talker();
    var_0._id_9133 thread maps\_anim::_id_0C24( var_0._id_9133, "ambush2" );
    wait 1.5;
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "suppress_building" );
    common_scripts\utility::_id_384A( "price_reaches_moveup_point" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "keep_moving" );
    common_scripts\utility::_id_384A( "price_reaches_end_of_bridge" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "take_the_stairs" );
}

apartment_second_floor()
{
    thread maps\bog_a_code::second_floor_laser_light_show();
    maps\bog_a_code::wait_until_player_goes_into_second_floor_or_melee_sequence_completes();
    level notify( "stop_melee_sequence" );
    common_scripts\utility::_id_384A( "melee_sequence_complete" );
    thread maps\bog_a_code::upstairs_enemies_respond_to_attack();
    common_scripts\utility::_id_383F( "friendlies_storm_second_floor" );
    level._id_6F7C maps\_utility::_id_7E38( "p" );
    common_scripts\utility::_id_383F( "price_to_minigun" );
    level._id_6F7C.ignoresuppression = 1;
    maps\_utility::_id_4E8A( "b", "p" );
    var_0 = maps\_utility::_id_3D7A( "allies", "p" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E60, 1 );
    common_scripts\utility::_id_384A( "magic_lasers_turn_on" );
    level.mark maps\_utility::_id_8EA4();
    level.mark delete();
    maps\bog_a_code::teleport_purple_guys_closer();
    var_0 = maps\_utility::_id_3D7A( "allies", "p" );
    common_scripts\utility::_id_0D13( var_0, maps\bog_a_code::set_threatbias_group, "friendlies_under_unreachable_enemies" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E5E, 1 );
    common_scripts\utility::_id_384A( "second_floor_ready_for_storming" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E5E, 0 );
    maps\_utility::_id_1F0B( "friendlies_under_unreachable_enemies", "upstairs_window_enemies" );
    common_scripts\utility::_id_384A( "lasers_have_moved" );
    wait 3;
    maps\_utility::_id_070A( "friendlies_storm_second_floor" );
    common_scripts\utility::_id_383F( "player_can_trigger_rubble_attack" );
    var_1 = getent( "second_floor_pacifist_trigger", "script_noteworthy" );
    var_1 common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_384A( "rubble_room_cleared" );
    common_scripts\utility::_id_383F( "second_floor_door_breach_initiated" );
    wait 1;
    var_2 = maps\_utility::_id_3CF4( "p", ( 10327.1, -386.339, 236.0 ) );
    var_2._id_0C72 = "third_floor_left_guy";
    var_2 maps\_anim::_id_0C24( var_2, "clear" );
    common_scripts\utility::_id_3831( "player_can_trigger_rubble_attack" );
    maps\_utility::_id_070A( "mg_flank_trigger" );
    setthreatbias( "upstairs_unreachable_enemies", "friendlies_under_unreachable_enemies", 0 );
    fight_across_the_gap_until_the_enemies_die();
    maps\_spawner::_id_533A( 5 );
    var_3 = [];
    var_4 = getentarray( "window_enemies", "script_noteworthy" );
    var_3 = common_scripts\utility::_id_0CDD( var_3, var_4 );
    var_5 = getentarray( "pacifist_rubble_guys", "targetname" );
    var_3 = common_scripts\utility::_id_0CDD( var_3, var_5 );
    common_scripts\utility::_id_0D13( var_3, maps\bog_a_code::die_shortly );
    wait 1;
    var_6 = getent( "door_trace_org", "targetname" );
    maps\bog_a_code::waittill_player_not_looking( var_6.origin );
    thread open_laundrymat();
    thread price_talks_to_hq();
    var_7 = maps\_utility::_id_3CBE();
    common_scripts\utility::_id_0D13( var_7, maps\_utility::scrub );
    common_scripts\utility::_id_0D13( var_7, maps\_utility::_id_7E60, 1 );
    restart_price();
    level._id_6F7C maps\_utility::_id_7E38( "c" );
    var_7 = maps\_utility::_id_735E( var_7 );
    var_7 = maps\_utility::_id_4E8D( var_7, "o", "shotgun" );
    var_7 = maps\_utility::_id_4E8D( var_7, "o", "m4grunt" );
    var_7 = maps\_utility::_id_4E8C( var_7, "y" );
    var_7 = maps\_utility::_id_4E8C( var_7, "y" );
    var_7 = maps\_utility::_id_4E8C( var_7, "y" );
    var_8 = var_7.size;

    if ( var_8 > 2 )
        var_8 = 2;

    for ( var_9 = 0; var_9 < var_8; var_9++ )
        var_7 = maps\_utility::_id_4E8C( var_7, "r" );

    common_scripts\utility::_id_0D13( var_7, maps\_utility::_id_7E38, "g" );
    common_scripts\utility::_id_0D13( var_7, maps\_utility::_id_7E5D, 1 );
    var_10 = maps\_utility::_id_3D7A( "allies", "y" );
    var_11 = maps\_utility::_id_3D7A( "allies", "o" );
    var_12 = maps\_utility::_id_3D7A( "allies", "r" );
    common_scripts\utility::_id_0D13( var_12, maps\_utility::_id_7402 );
    common_scripts\utility::_id_0D13( var_10, maps\_utility::_id_7402 );
    common_scripts\utility::_id_0D13( var_11, maps\_utility::_id_7402 );
}

price_talks_to_hq()
{
    maps\_utility::_id_1332( "allies" );
    maps\_utility::_id_70BD( "get_there_asap" );
    wait 0.5;
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "working_on_it" );
    common_scripts\utility::_id_383F( "laundry_room_price_talks_to_hq" );
    maps\_utility::_id_1333( "allies" );
}

player_mg_reminder()
{
    level endon( "unreachable_apartment_cleared" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "use_their_gun" );
    wait 4;

    if ( common_scripts\utility::_id_382E( "unreachable_enemies_under_attack" ) )
        return;

    level endon( "unreachable_enemies_under_attack" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            if ( maps\bog_a_code::player_is_on_mg() )
                return;

            wait 1;
        }

        level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "use_their_gun" );
    }
}

player_mg_laser_hint()
{
    if ( common_scripts\utility::_id_382E( "unreachable_apartment_cleared" ) )
        return;

    var_0 = getent( "laser_hint_ent", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_0 maps\bog_a_code::get_laser();
    var_2.origin = var_0.origin;
    var_2.angles = vectortoangles( var_1.origin - var_0.origin );
    var_2 laser_hint_on_mg();
    var_2 notify( "stop_line" );
    var_2 delete();
}

laser_hint_on_mg()
{
    level endon( "unreachable_apartment_cleared" );

    for (;;)
    {
        if ( maps\bog_a_code::player_is_on_mg() )
            thread maps\bog_a_code::modulate_laser();

        while ( maps\bog_a_code::player_is_on_mg() )
            wait 0.05;

        self notify( "stop_line" );
        self laseroff();

        while ( !maps\bog_a_code::player_is_on_mg() )
            wait 0.05;
    }
}

fight_across_the_gap_until_the_enemies_die()
{
    if ( common_scripts\utility::_id_382E( "unreachable_apartment_cleared" ) )
        return;

    level endon( "unreachable_apartment_cleared" );
    maps\bog_a_code::wait_until_price_nears_balcony();
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "hit_their_flank" );
    wait 1;
    maps\bog_a_code::wait_until_player_nears_balcony();

    if ( !maps\bog_a_code::player_is_on_mg() )
        thread player_mg_reminder();

    var_0 = getentarray( "upper_floor_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, maps\bog_a_code::waitspread_death, 12 );

    for ( var_1 = 0; var_1 < 4; var_1++ )
    {
        if ( maps\bog_a_code::player_is_on_mg() )
            break;

        wait 1;
    }

    var_2 = getent( "upper_floor_hiding_blocker", "targetname" );
    var_2 connectpaths();
    var_2 delete();
    var_3 = maps\bog_a_code::spawn_guy_from_targetname( "upper_floor_hiding_spawner" );
    var_3 maps\_utility::_id_7E3A( 1 );
    var_3 thread maps\bog_a_code::price_congrates();
    wait 2.5;

    if ( isalive( var_3 ) )
    {
        if ( maps\bog_a_code::player_is_on_mg() )
            level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "shoot_through_wall" );

        var_3 maps\_utility::_id_27EF( 10, maps\bog_a_code::killme );
    }

    common_scripts\utility::_id_384A( "unreachable_apartment_cleared" );
}

javelin_guy_spawns()
{
    common_scripts\utility::_id_384A( "contact_on_the_overpado!" );
    maps\bog_a_code::wait_until_price_reaches_his_trigger();
    maps\bog_a_code::wait_for_friendlies_to_reach_alley_goal();
    var_0 = getent( "javelin_spawner", "targetname" );
    var_1 = var_0 maps\_utility::_id_988B();
    var_1 thread javelin_guy_runs_in();
}

javelin_guy_runs_in()
{
    self._id_0C72 = "javelin_guy";
    self._id_2652 = maps\_utility::_id_3EF5( "death" );
    maps\_utility::_id_7EAB( "run" );
    thread maps\_utility::_id_58D7();
    animscripts\shared::_id_6869( self.weapon, "back" );
    level.javelin_guy = self;
    maps\_utility::_id_5926();
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "weapon_javelin" );
    var_0 linkto( self, "tag_weapon_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.javmodel = var_0;
    var_1 = getent( self.target, "targetname" );
    var_1 maps\_anim::_id_0BFF( self, "hangout_arrival" );
    var_1 maps\_anim::_id_0C24( self, "hangout_arrival" );
    var_1 thread maps\_anim::_id_0BE1( self, "hangout_idle", undefined, "stop_looping" );
    common_scripts\utility::_id_383F( "jav_guy_ready_for_briefing" );
    var_1 notify( "stop_looping" );
    self _meth_8143();
    var_2 = getnode( "jav_drop", "targetname" );
    var_1.origin = var_2.origin;
    self.ignorerandombulletdamage = 1;
    maps\_utility::_id_2AC2();
    var_1 maps\_anim::_id_0BFF( self, "hangout_arrival" );
    var_1 maps\_anim::_id_0C24( self, "hangout_arrival" );
    var_1 thread maps\_anim::_id_0BE1( self, "hangout_idle", undefined, "stop_looping" );
    common_scripts\utility::_id_383F( "javelin_guy_in_position" );
    common_scripts\utility::_id_384A( "right_away_done" );
    var_3 = level.javelin_guy.origin;
    level.javelin_guy.ignoreme = 0;
    level.javelin_guy.threatbias = 2342343;
    level.javelin_guy.health = 1;
    level.javelin_guy.allowdeath = 1;
    level.javelin_guy maps\_utility::_id_8EA4();
    level.javelin_guy maps\_utility::_id_07BE( maps\_utility::_id_0694, 16 );
    level.javelin_guy maps\_utility::_id_07BE( maps\_utility::_id_A099, "death" );
    level.javelin_guy maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "force_kill_javelin_guy" );
    maps\_utility::_id_2BDD();
    level.javelin_guy thread common_scripts\utility::_id_69C2( "scn_bog_a_javelin_guy_death", var_3 );

    if ( isalive( self ) )
        self kill();

    common_scripts\utility::_id_383F( "javelin_guy_died" );
    wait 2.0;
    thread common_scripts\utility::_id_69C2( "bog_a_gm1_westisdown", ( 9153.57, 64.5412, 80.0 ), 1 );
    level maps\_utility::_id_27EF( 4.0, common_scripts\utility::_id_383F, "west_is_down_done" );
    level.player.threatbias = -450;
    wait 2;
    var_4 = spawn( "weapon_javelin", ( 0.0, 0.0, 0.0 ), 1 );
    var_4.origin = var_0.origin;
    var_4.angles = var_0.angles;
    var_4 thread maps\_utility::_id_076A( "overpass_baddies_flee" );
    var_5 = var_4.origin;
    level.javweap = var_4;
    var_0 hide();
    wait 0.25;
    var_0 delete();
    maps\_utility::_id_1143( "javelin_sequence" );
    common_scripts\utility::_id_384A( "pickup_javelin" );

    if ( maps\bog_a_code::player_has_javelin() )
    {
        common_scripts\utility::_id_383F( "player_has_javelin" );
        return;
    }

    thread price_reminds_player_about_javelin();
    objective_add( 4, "active", &"BOG_A_GET_THE_JAVELIN", var_5 );
    objective_indentlevel( 4, 1 );
    objective_current( 4 );

    while ( !maps\bog_a_code::player_has_javelin() )
        wait 0.05;

    objective_delete( 4 );
    common_scripts\utility::_id_383F( "player_has_javelin" );
    thread price_reminds_player_about_shooting_javelin();
}

price_reminds_player_about_javelin()
{
    level endon( "player_has_javelin" );
    var_0 = [];
    var_0[var_0.size] = "pickup_hint_1";
    var_0[var_0.size] = "pickup_hint_2";
    var_0[var_0.size] = "pickup_hint_3";
    var_1 = 0;

    for (;;)
    {
        wait(randomfloatrange( 8, 12 ));
        objective_ring( 4 );
        level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

price_reminds_player_about_shooting_javelin()
{
    common_scripts\utility::_id_382F( "overpass_baddies_flee" );
    level endon( "overpass_baddies_flee" );
    level endon( "bmp_got_killed" );
    var_0 = [];
    var_0[var_0.size] = "second_floor_hint_1";
    var_0[var_0.size] = "second_floor_hint_2";
    var_1 = 0;

    for (;;)
    {
        wait(randomfloatrange( 8, 12 ));
        objective_ring( 4 );
        level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, var_0[var_1] );
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

open_laundrymat()
{
    common_scripts\utility::_id_3831( "aa_apartment" );
    maps\_utility::_id_27EF( 2, maps\_utility::_id_1143, "javelin_sequence" );
    thread laundryroom_saw_gunner();
    thread javelin_guy_spawns();
    common_scripts\utility::_id_383F( "alley_enemies_spawn" );
    maps\_utility::_id_070A( "alley_friendly_trigger" );
    maps\_utility::_id_1ECF();
    maps\_utility::_id_7E19( "y" );
    maps\_utility::_id_7E19( "o" );
    maps\_utility::_id_7E19( "g" );
    maps\_utility::_id_7EA2( "r", "o" );
    var_0 = getent( "apartment_door", "targetname" );
    var_0 playsound( "door_wood_slow_open" );
    var_0 connectpaths();
    var_0 rotateyaw( -100, 1, 0.5, 0 );
    wait 1;
    objective_state( 2, "done" );
    maps\_utility::arcademode_checkpoint( 8, "a" );
    objective_current( 1 );
    common_scripts\utility::_id_383F( "laundrymat_open" );
    waitframe;
    var_1 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_2A8D );
    thread player_enters_laundrymat();
}

kick_ac_unit( var_0 )
{
    var_1 = getent( "window_ac_unit", "targetname" );
    var_1 stoploopsound( "bog_ac_loop" );
    var_1 playsound( "bog_ac_kick" );
    wait 1;
    var_1 playsound( "bog_ac_crash" );
}

seetag()
{
    for (;;)
    {
        maps\_debug::_id_2DE7( "tag_origin" );
        wait 0.05;
    }
}

laundryroom_saw_gunner()
{
    var_0 = maps\bog_a_code::spawn_guy_from_targetname( "saw_gunner" );
    level.mark = var_0;
    var_0 thread maps\_utility::_id_58D7();
    var_0 maps\_utility::_id_5926();
    var_0.goalradius = 4;
    var_0.interval = 0;
    var_1 = getent( "friendly_enters_laundrymat", "targetname" );
    var_2 = getnode( var_1.target, "targetname" );
    var_3 = getent( "window_ac_unit", "targetname" );
    var_3 playloopsound( "bog_ac_loop" );
    var_3._id_0C72 = "ac";
    var_3 maps\_utility::_id_0D61();
    var_2 maps\_anim::_id_0C3A( var_3, "setup" );
    common_scripts\utility::_id_384A( "player_nears_laundrymat" );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 0, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 1, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 30, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 31, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 70, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "alley_heli", 71, 135, 95 );
    var_0._id_0C72 = "saw";
    var_4 = [];
    var_4[var_4.size] = var_3;
    var_4[var_4.size] = var_0;
    var_5 = getent( "mark_ac_block", "targetname" );
    var_5 connectpaths();
    var_5 delete();
    var_0._id_4BB7 = 1;
    var_2 maps\_anim::_id_0BFF( var_0, "setup" );
    var_0.goalradius = 4;
    var_0._id_4BB7 = undefined;
    maps\_utility::_id_27EF( 0, maps\_utility::_id_1143, "saw_gunner" );
    var_2 maps\_anim::_id_0C18( var_4, "setup" );
    var_0.interval = 96;
    var_0 _meth_81aa( var_0.origin );
    var_0.goalradius = 32;
    var_0 thread saw_gunner_chatter();
    var_2 thread maps\_anim::_id_0BE1( var_0, "fire_loop", undefined, "stop_loop" );
    wait 5;
    var_2 notify( "stop_loop" );
    var_0.fixednode = 0;
    common_scripts\utility::_id_384A( "friendlies_charge_alley" );
    var_0.fixednode = 1;
}

saw_gunner_chatter()
{
    maps\_utility::_id_1332( "allies" );
    common_scripts\utility::_id_384A( "laundry_room_price_talks_to_hq" );
    maps\_anim::_id_0C24( self, "ton_of_them" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "shut_up" );
    wait 0.5;
    maps\_anim::_id_0C24( self, "suppressing_fire" );
    maps\_utility::_id_1333( "allies" );
}

player_enters_laundrymat()
{
    maps\_utility::_id_070A( "alley_friendly_trigger" );
    common_scripts\utility::_id_384A( "player_enters_alley" );
    var_0 = maps\_utility::_id_3D7A( "allies", "g" );
    common_scripts\utility::_id_0D13( var_0, maps\bog_a_code::die_asap );
    var_1 = maps\_utility::_id_3D7A( "allies", "r" ).size;

    for ( var_2 = var_1; var_2 < 2; var_2++ )
    {
        maps\_utility::_id_7016( "o", "r" );
        maps\_utility::_id_8944( undefined, "o" );
    }

    thread maps\bog_a_code::friendlies_charge_alley_early();
    common_scripts\utility::_id_3856( "friendlies_charge_alley", 45 );
    common_scripts\utility::_id_383F( "friendlies_charge_alley" );
    maps\_utility::_id_070A( "friendly_alley_charge_trigger" );
    var_3 = getent( "friendly_alley_blocker", "targetname" );
    var_3 delete();
    maps\_spawner::_id_533A( 10 );
    maps\_spawner::_id_533A( 9 );
    var_4 = getentarray( "alley_roof_guy", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        var_5 = var_4[var_2];

        if ( isalive( var_5 ) )
        {
            var_5 kill();
            wait(randomfloatrange( 0.5, 1.5 ));
        }
    }

    var_6 = getaiarray( "axis" );
    var_7 = getnode( "enemy_alley_node", "targetname" );
    common_scripts\utility::_id_0D13( var_6, ::move_in_on_goal, var_7 );
    common_scripts\utility::_id_383F( "price_in_alley_position" );
    thread maps\bog_a_code::wait_for_fence_guys_to_be_drafted();
    maps\bog_a_code::wait_until_deathflag_enemies_remaining( "alley_cleared", 6 );
    maps\_utility::_id_1332( "allies" );
    maps\bog_a_code::wait_for_fence_guys_to_be_drafted();
    defend_the_roof_with_javelin();
}

price_responds_to_overpass()
{
    self waittill( "javelin_briefing" );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C.goalradius = 32;
    level._id_6F7C _meth_81ce( "crouch" );
    level._id_6F7C _meth_81ce( "stand", "crouch", "prone" );
    wait 3;
    level._id_6F7C.goalradius = 512;
}

right_away_line()
{
    var_0 = maps\_utility::_id_273B( "timer1", 5.71 );

    if ( getdvarint( "loc_language", 0 ) == 2 )
        var_0 = maps\_utility::_id_273B( "timer1", 6.5 );

    wait(var_0);
    var_1 = spawn( "script_origin", level.javelin_guy.origin );
    var_1 playsound( level._id_78BA[level.javelin_guy._id_0C72]["right_away"] );
    wait 0.42;
    common_scripts\utility::_id_383F( "right_away_done" );
    common_scripts\utility::_id_383F( "force_kill_javelin_guy" );
}

bridge_wave_spawner_think()
{
    self endon( "death" );
    self.ignoreme = 1;
    self._id_2D3B = 1;
    self._id_2AF3 = 1;

    while ( self.a._id_55D7 == 0 )
        wait 0.05;

    wait 1.2;
    common_scripts\utility::_id_383F( "overpass_guy_attacks!" );
    self.ignoreme = 0;
    common_scripts\utility::_id_384A( "javelin_guy_in_position" );
    self._id_1300 = 1000;
    self.accuracy = 1000;
    wait(randomfloat( 0.5 ));
    self _meth_81ea();
    common_scripts\utility::_id_384A( "javelin_guy_died" );
    self._id_1300 = 1;
    self.accuracy = 1;
}

friendly_overpass_dialogue_response()
{
    common_scripts\utility::_id_384A( "overpass_guy_attacks!" );
    common_scripts\utility::_id_3831( "aa_alley" );
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::_id_735E( var_0 );
    var_1 = common_scripts\utility::_id_3F33( level.player.origin, var_0 );
    var_1._id_0C72 = "guy_one";
    common_scripts\utility::_id_383F( "contact_on_the_overpado!" );
    level.player.end_nightvision_disable_hint = 1;
    maps\_utility::_id_1143( "contact_on_the_overpass" );
    var_1 maps\_anim::_id_0C24( var_1, "contact_overpass" );
}

defend_the_roof_with_javelin()
{
    common_scripts\utility::_id_383D( "bmps_are_dead" );
    var_0 = getentarray( "bridge_wave_spawner", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::bridge_wave_spawner_think );
    var_1 = getentarray( "initial_contact_spawner", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, maps\_spawner::_id_38F3 );
    thread maps\bog_a_code::overpass_baddies_attack();
    var_2 = gettime();
    level.brieftime = gettime();
    maps\bog_a_code::set_all_ai_ignoreme( 0 );
    level.player.ignoreme = 0;
    thread friendly_overpass_dialogue_response();
    wait 15;
    common_scripts\utility::_id_384A( "jav_guy_ready_for_briefing" );
    level._id_6F7C thread maps\_anim::_id_0C24( level._id_6F7C, "javelin_briefing" );
    thread right_away_line();
    common_scripts\utility::_id_384A( "javelin_guy_died" );
    maps\_utility::arcademode_checkpoint( 3.0, "b" );
    maps\_utility::_id_1143( "javelin_defense_begins" );
    wait 1.5;
    maps\_utility::_id_070A( "allies_prep_for_fence" );
    level common_scripts\utility::_id_384A( "west_is_down_done" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "get_jav" );
    common_scripts\utility::_id_383F( "pickup_javelin" );
    var_3 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_3, maps\bog_a_code::take_cover_against_overpass );
    var_3 = maps\_utility::remove_all_animnamed_guys_from_array( var_3 );
    var_3 = maps\_utility::_id_735E( var_3 );
    var_4 = common_scripts\utility::_id_3F33( level.player.origin, var_3 );
    level.javelin_helper = var_4;
    var_4 thread maps\_utility::_id_58D7();
    var_4 maps\_utility::_id_5926();
    var_4._id_0C72 = "generic";
    var_5 = getnode( "friendly_javelin_node", "targetname" );
    var_4 _meth_81a9( var_5 );
    var_4.goalradius = 64;
    maps\_utility::_id_1333( "allies" );
    maps\_utility::_id_27EF( 3, maps\bog_a_code::set_flag_when_bmps_are_dead );
    maps\_colors::_id_5300();
    common_scripts\utility::_id_384A( "player_has_javelin" );
    var_7 = getent( "apartment_door", "targetname" );
    var_7 rotateyaw( 100, 1, 0.5, 0 );
    thread maps\bog_a_code::update_obj_on_dropped_jav( var_5.origin );
    level._id_6F7C maps\_utility::_id_27EF( 1, maps\_anim::_id_0C21, level._id_6F7C, "second_floor_hint_2" );
    objective_add( 4, "active", &"BOG_A_DESTROY_THE_ARMORED_VEHICLES", var_5.origin );
    objective_indentlevel( 4, 1 );
    objective_current( 4 );
    common_scripts\utility::_id_384A( "overpass_baddies_flee" );
    var_8 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_8, ::flee_overpass );
    var_3 = getaiarray( "allies" );
    var_3 = maps\_utility::_id_735E( var_3 );
    var_9 = 0;

    for ( var_10 = 0; var_10 < 40; var_10++ )
    {
        if ( getaiarray( "allies" ).size <= 5 )
            break;

        var_11 = var_3[var_9];
        var_11 maps\_utility::_id_2ACC();
        var_11 kill();
        var_9++;
    }

    common_scripts\utility::_id_384A( "bmps_are_dead" );
    maps\_utility::_id_7438();
    wait 1;
    objective_state( 4, "done" );
    objective_current( 1 );
    maps\_utility::arcademode_checkpoint( 10, "c" );
    thread shanty_opens();
    common_scripts\utility::_id_384A( "all_bmps_dead" );
    wait 2;

    if ( isdefined( var_4._id_58D7 ) )
        var_4 maps\_utility::_id_8EA4();

    var_4 maps\_utility::_id_9A4B();
}

flee_overpass()
{
    var_0 = getnodearray( "bridge_flee_node", "targetname" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    self _meth_81a9( var_1 );
    self.goalradius = 64;
    self endon( "death" );
    wait(randomfloat( 3.5 ));
    self.ignoreme = 1;
}

shanty_opens()
{
    thread shanty_speedrun_monitor();
    soundscripts\_snd::_id_870C( "start_shanty_open_audio" );
    var_0 = getentarray( "magic_rpg_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\bog_a_code::magic_rpg_trigger );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "shanty_flare_trigger", maps\_flare::flare_from_targetname, "shanty_flare" );

    if ( isalive( level.javelin_guy ) )
    {
        level.javelin_guy maps\_utility::_id_8EA4();
        level.javelin_guy delete();
    }

    maps\_utility::_id_1143( "shanty_opens" );
    level._id_250D["allies"] = [];
    maps\_utility::_id_070A( "allies_prep_for_shanty" );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_7E38, "o" );
    maps\bog_a_code::shanty_fence_cut();
    maps\_utility::_id_27EF( 1.1, maps\_flare::flare_from_targetname, "alley_flare" );
    var_1 = getaiarray( "allies" );
    level.ending_bog_redshirts = 0;
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_30B0 );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::shanty_allies_cqb_through );
    common_scripts\utility::_id_0D13( var_1, maps\bog_a_code::shanty_allies_cqb_end );
    common_scripts\utility::_id_383F( "shanty_open" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "start_shanty_run", maps\_utility::_id_070A, "backhalf_friendly_start_trigger" );
    var_7 = getentarray( "bog_ambient_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_7, maps\_utility::_id_0798, maps\bog_a_code::bog_ambient_fighting );
    common_scripts\utility::_id_0D13( var_7, maps\_utility::_id_88C3 );
    var_8 = getent( "shanty_run_trigger", "targetname" );
    var_8.trigger_num = 1;
    level.shanty_timer = 0;
    level.player.trigger_num = 0;
    var_8 thread shanty_run_drop_weapon();
    thread radio_heavy_fire_dialogue();
    common_scripts\utility::_id_384A( "shanty_progress" );
    maps\_utility::_id_070A( "friendly_tank_defend_trigger" );
    var_9 = getentarray( "magic_shanty_rpg", "targetname" );
    common_scripts\utility::_id_0D13( var_9, maps\bog_a_code::magic_rpgs_fire_randomly );
    var_1 = getaiarray( "allies" );
    var_1 = maps\_utility::_id_735E( var_1 );
    var_10 = common_scripts\utility::_id_3F33( level.player.origin, var_1 );
    var_10._id_0C72 = "generic";
    var_10 thread maps\_anim::_id_0C24( var_10, "other_side" );
    thread this_way_trigger();
    common_scripts\utility::_id_384A( "coming_from_south" );
    common_scripts\utility::_id_383F( "kill_bog_ambient_fighting" );
    var_10 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_10, maps\_utility::_id_7E24 );
    waitframe;
    maps\bog_a_backhalf::start_bog_backhalf();
}

shanty_speedrun_monitor()
{
    var_0 = getent( "trigger_shanty_speedrun", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::_id_382E( "shanty_progress" ) )
        common_scripts\utility::_id_383F( "shanty_progress" );

    wait 5;

    if ( !common_scripts\utility::_id_382E( "coming_from_south" ) )
        common_scripts\utility::_id_383F( "coming_from_south" );
}

this_way_trigger()
{
    common_scripts\utility::_id_384A( "this_way" );
}

radio_heavy_fire_dialogue()
{
    maps\_utility::_id_1332( "allies" );
    wait 4;
    maps\_utility::_id_70BD( "where_are_you" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "almost_there" );
    wait 5;
    maps\_utility::_id_1333( "allies" );
}

run_until_ambush()
{
    self endon( "stop_running_to_node" );
    self _meth_81ce( "stand" );
    self endon( "going_to_link_node" );
    var_0 = self;

    for (;;)
    {
        var_0 = getent( var_0.target, "targetname" );
        self.goalradius = var_0.radius;
        self _meth_81aa( var_0.origin );
        self waittill( "goal" );

        if ( !isdefined( var_0.target ) )
            break;
    }

    common_scripts\utility::_id_384A( "friendlies_take_fire" );
}

stop_shield_when_player_runs_street()
{
    self endon( "death" );

    if ( maps\_utility::_id_5036() )
        return;

    thread maps\_utility::_id_58D7();
    common_scripts\utility::_id_384A( "player_enters_the_fray" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();
}

run_down_street( var_0 )
{
    maps\_utility::_id_88F1( self );
    self.fixednode = 0;
    thread maps\_utility::_id_7402();
    thread stop_shield_when_player_runs_street();
    self endon( "death" );
    self.interval = 45;
    self.pushable = 0;
    self._id_2D3B = 1;
    self.ignorerandombulletdamage = 1;
    self._id_5F65 = self._id_79AC;
    run_until_ambush();

    if ( isdefined( var_0 ) )
        wait(var_0);

    self.interval = 96;
    self.pushable = 1;
    animscripts\init::_id_7DBE();
    self _meth_81ce( "stand", "crouch", "prone" );
    self.ignoresuppression = 1;
    var_1 = anglestoforward( self.angles );
    var_2 = maps\_utility::vector_multiply( var_1, 130 );
    var_3 = gettime() + 1000;
    self _meth_81aa( self.origin + var_2 );
    self.goalradius = 8;
    self waittill( "goal" );
    var_4 = ( var_3 - gettime() ) * 0.001;

    if ( var_4 > 0 )
        wait(var_4);

    self.pacifist = 0;
    self.goalradius = 4000;

    if ( !common_scripts\utility::_id_382E( "friendlies_move_up_the_bridge" ) )
    {
        var_5 = getent( "bridge_volume", "targetname" );

        if ( !isdefined( self.dont_use_goal_volume ) )
            self _meth_81ac( var_5 );

        while ( !isdefined( self.node ) )
            wait 0.05;

        self _meth_81a9( self.node );
        self.goalradius = 32;
        self waittill( "goal" );
        self.reached_bridge_flee_spot = 1;
    }

    thread maps\bog_a_code::set_engagement_to_closer();
    self.fixednode = 1;
    self._id_2D3B = undefined;

    if ( self == level._id_6F7C )
        return;

    common_scripts\utility::_id_384A( "friendlies_move_up_the_bridge" );
    self.pacifist = 0;
}

apartment_rubble_helicopter()
{
    common_scripts\utility::_id_384A( "player_attacks_unreachable_guys_second_floor" );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "apartment_heli", 0, 95, 95 );
    wait 1;
    common_scripts\utility::_id_384A( "player_attacks_unreachable_guys" );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "apartment_heli2", 0, 95, 95 );
    wait 5;
    thread maps\bog_a_code::helicopter_flies_by_overhead( "apartment_heli", 0, 95, 95 );
    wait 1;
    thread maps\bog_a_code::helicopter_flies_by_overhead( "apartment_heli2", 0, 95, 95 );
}

price_directs_players_upstairs()
{
    level endon( "melee_sequence_begins" );

    if ( common_scripts\utility::_id_382E( "melee_sequence_begins" ) )
        return;

    var_0 = getent( "price_sends_you_upstairs_trigger", "targetname" );
    var_0 waittill( "trigger" );
    level.player.end_nightvision_hint = 1;

    for (;;)
    {
        level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "head_upstairs" );
        wait(randomfloatrange( 12, 14 ));
    }
}

helicopters_fly_by()
{
    thread maps\bog_a_code::helis_ambient();
    soundscripts\_snd::_id_870C( "play_intro_scripted_cobra_pass_by" );
    var_0 = getent( "armada_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_0 = getent( "vehicle_crash_trigger", "targetname" );
    var_0 thread maps\bog_a_code::cobra_crash();
    thread maps\bog_a_code::helicopters_flies_by_overhead( "intro_heli5", 0, 135, 95 );
    thread maps\bog_a_code::helicopter_flies_by_overhead( "heli_crash", 0, 135, 95 );
}

restart_price()
{
    level._id_6F7C thread maps\_utility::_id_58D7();
    level._id_6F7C maps\_utility::_id_5926();
}

runout()
{
    var_0 = [];
    wait 5;

    for (;;)
    {
        for ( var_1 = 0; var_1 < 500; var_1++ )
            var_0[var_0.size] = 5;

        wait 0.05;
    }
}

bcs_disabler()
{
    wait 0.05;
    setdvar( "bcs_enable", "off" );
}

move_in_on_goal( var_0 )
{
    self endon( "death" );
    wait 10;
    self.goalradius = var_0.radius;
    self.goalheight = 64;
    self _meth_81a9( var_0 );
    var_1 = 300;

    for (;;)
    {
        wait(randomfloatrange( 3, 11 ));
        var_2 = distance( var_0.origin, self.origin ) - 125;

        if ( var_2 < var_1 )
            var_2 = var_1;

        self.goalradius = var_2;
    }
}

_id_5FFB()
{
    var_0 = getent( "shantyMusicTrig", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_6008( "bog_a_shantytown" );
    var_1 = getent( "bogMusicTrig", "targetname" );
    var_1 waittill( "trigger" );
    musicstop( 3 );
    wait 3.25;
    maps\_utility::_id_6008( "bog_a_tankdefense" );
}

shanty_run_drop_weapon()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0 thread maps\_utility::_id_4BAC( 1.0 );

        if ( isplayer( var_0 ) )
            break;
    }

    var_1 = getentarray( "weapon_javelin", "classname" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_7C71 );

    if ( !maps\bog_a_code::player_has_javelin() )
        return;

    var_2 = 0;
    var_3 = 0;
    var_4 = level.player getweaponslistprimaries();
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( issubstr( var_4[var_6], "avelin" ) )
        {
            var_3 = 1;

            if ( issubstr( level.player getcurrentweapon(), "avelin" ) )
            {
                var_5 = 1;
                level.player disableweapons();
                wait 1.5;
            }

            level.player takeweapon( "javelin" );
            continue;
        }

        if ( var_4[var_6] == "m4_grenadier" )
            var_2 = 1;
    }

    if ( !var_3 )
        return;

    level.player enableweapons();

    if ( !var_2 )
        level.player giveweapon( "m4_grenadier" );

    if ( var_5 )
        level.player switchtoweapon( "m4_grenadier" );
}

wait_then_go_to_target()
{
    self endon( "death" );
    wait 2;
    maps\_spawner::_id_4241();
}

grenade_launcher_hint( var_0 )
{
    common_scripts\utility::_id_384A( "nightvision_on" );
    wait 1.5;
    maps\_utility::_id_2B4A( "grenade_launcher" );
}
