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
    common_scripts\utility::_id_383D( "player_is_on_turret" );
    common_scripts\utility::_id_383D( "player_made_it_to_seaknight" );
    common_scripts\utility::_id_383D( "heli_shot_down" );
    common_scripts\utility::_id_383D( "heli_comes_to_rest" );
    common_scripts\_ca_blockout::init();
    maps\createart\sniperescape_art::main();
    maps\createfx\sniperescape_audio::main();
    maps\sniperescape_fx::main();
    maps\sniperescape_precache::main();
    maps\_load::main();
    maps\sniperescape_aud::main();
    maps\sniperescape_anim::main();
    level thread maps\sniperescape_amb::main();
    maps\sniperescape_lighting::main();
}

main()
{
    precacheitem( "cobra_seeker" );
    precacheitem( "hind_turret_penetration" );
    level.sniperescape_fastload = 0;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\sniperescape_precache::main();
    precacheitem( "barrett_fake" );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\sniperescape_anim::uaz_anims, maps\sniperescape_anim::uaz_vehicle_anims );
    level._id_9C83["talk"] = maps\sniperescape_exchange::guy_talk;
    level._id_9C81["talk"] = maps\sniperescape_exchange::guy_talk_check;
    level._id_9C83["panic"] = maps\sniperescape_exchange::guy_panic;
    level._id_9C81["panic"] = maps\sniperescape_exchange::guy_panic_check;
    maps\createart\sniperescape_art::main();
    maps\createfx\sniperescape_audio::main();
    maps\sniperescape_fx::main();
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    maps\_load::_id_7E9E( "viewhands_player_marines" );
    setsaveddvar( "sv_znear", "1.0" );
    level.playercardbackground allowstand( 0 );
    animscripts\dog\dog_init::_id_4DAB();
    setsaveddvar( "ai_eventDistFootstep", "32" );
    setsaveddvar( "ai_eventDistFootstepWalk", "32" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precachemodel( "temp" );
    precachemodel( "afr_restaurantchair_2" );
    precachemodel( "weapon_c4" );
    precachemodel( "body_complete_usmc_ghillie_price_damaged" );
    precachemodel( "vehicle_mi28_center_hub" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "body_force_assault_pilot_woodland" );
    precacheitem( "cobra_seeker" );
    precacheitem( "flash_grenade" );
    precacheshellshock( "barrett" );
    precachestring( &"SNIPERESCAPE_ELIMINATE_IMRAN_ZAKHAEV" );
    precachestring( &"SNIPERESCAPE_CHANGE_THE_FUTURE" );
    precachestring( &"SNIPERESCAPE_TAKE_OUT_THE_ATTACK_CHOPPER" );
    precachestring( &"SNIPERESCAPE_GET_OUT_OF_THE_HOTEL" );
    precachestring( &"SNIPERESCAPE_REACH_THE_EXTRACTION" );
    precachestring( &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY" );
    precachestring( &"SNIPERESCAPE_PUT_CPT_MACMILLAN_DOWN" );
    precachestring( &"SNIPERESCAPE_PREP_AREA_FOR_FIGHT" );
    precachestring( &"SNIPERESCAPE_HOLD_OUT_UNTIL_EVAC" );
    precachestring( &"SNIPERESCAPE_SEAKNIGHT_INCOMING" );
    precachestring( &"SNIPERESCAPE_GET_CPT_MACMILLAN_TO" );
    precachestring( &"SNIPERESCAPE_PICK_UP_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_CARRY_MACMILLAN_TO_THE" );
    precachestring( &"SNIPERESCAPE_CLAYMORE_HELP" );
    precachestring( &"SNIPERESCAPE_PRESS_FORWARDS_OR_BACKWARDS" );
    precachestring( &"SNIPERESCAPE_YOU_FAILED_TO_REACH_THE" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_PUT_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_PICK_UP_CPT" );
    precachestring( &"SNIPERESCAPE_YOU_LEFT_YOUR_SPOTTER" );
    precachestring( &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    precachestring( &"SNIPERESCAPE_TOO_FAR_FROM_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_RAPPEL" );
    precachestring( &"SNIPERESCAPE_TIME_REMAINING" );
    precachestring( &"SNIPERESCAPE_TARGET" );
    precachestring( &"SNIPERESCAPE_ZAKHAEV" );
    precachestring( &"SNIPERESCAPE_DISTANCE" );
    precachestring( &"SNIPERESCAPE_M" );
    precachestring( &"SNIPERESCAPE_BULLET_TRAVEL" );
    precachestring( &"SNIPERESCAPE_S" );
    precachestring( &"SCRIPT_HINT_C4_THROW" );
    precacherumble( "crash_heli_rumble" );
    precacherumble( "crash_heli_rumble_rest" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_light_1500" );
    precacherumble( "generic_attack_light_2000" );
    precacherumble( "generic_attack_medium_500" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    level.heli_objective = precacheshader( "objective_heli" );
    level.last_price_kill = 0;
    maps\_utility::_id_079C( "rappel", ::rappel_out_of_hotel, &"STARTS_RAPPEL" );
    maps\_utility::_id_079C( "run", ::start_run, &"STARTS_RUN" );
    maps\_utility::_id_079C( "apart", ::start_apartment, &"STARTS_APART" );
    maps\_utility::_id_079C( "wounding", ::start_wounding, &"STARTS_WOUNDING" );
    maps\_utility::_id_079C( "crash", ::_id_8B7C, &"STARTS_CRASH" );
    maps\_utility::_id_079C( "wounded", ::start_wounded, &"STARTS_WOUNDED" );
    maps\_utility::_id_079C( "burnt", ::start_burnt, &"STARTS_BURNT" );
    maps\_utility::_id_079C( "pool", ::start_pool, &"STARTS_POOL" );
    maps\_utility::_id_079C( "fair", ::start_fair, &"STARTS_FAIR" );
    maps\_utility::_id_079C( "fair_battle", ::start_fair_battle, &"STARTS_FAIRBATTLE" );
    maps\_utility::_id_079C( "fair_battle2", ::start_fair_battle, &"STARTS_FAIRBATTLE" );
    maps\_utility::_id_079C( "seaknight", ::start_seaknight, &"STARTS_SEAKNIGHT" );
    maps\_utility::_id_278B( ::snipe );
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "dog" );
    setignoremegroup( "price", "dog" );
    createthreatbiasgroup( "dog_allies" );
    setignoremegroup( "dog", "dog_allies" );
    setignoremegroup( "dog_allies", "dog" );
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 8 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_dragunov_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_m14_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_mp5_clip";
    maps\sniperescape_code::set_legit_weapons_for_sniper_escape();
    maps\_load::main();
    maps\sniperescape_code::force_player_to_use_legit_sniper_escape_weapon();
    maps\sniperescape_lighting::main();
    maps\sniperescape_aud::main();
    maps\_compass::setupminimap( "compass_map_sniperescape" );
    var_0 = getaiarray( "allies" );
    common_scripts\utility::_id_0D13( var_0, maps\_stealth_logic::_id_3A66 );
    var_1 = getentarray( "actor_enemy_dog", "classname" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, maps\sniperescape_wounding::set_dog_threatbias_group );
    level._id_6302 = [];
    maps\sniperescape_wounding::addobj( "zakhaev" );
    maps\sniperescape_wounding::addobj( "future" );
    maps\sniperescape_wounding::addobj( "heli" );
    maps\sniperescape_wounding::addobj( "hotel" );
    maps\sniperescape_wounding::addobj( "heat" );
    maps\sniperescape_wounding::addobj( "wounded" );
    maps\sniperescape_wounding::addobj( "putdown" );
    maps\sniperescape_wounding::addobj( "prep" );
    maps\sniperescape_wounding::addobj( "holdout" );
    maps\sniperescape_wounding::addobj( "seaknight" );
    level._id_6302["wounded"] = level._id_6302["heat"];
    maps\_utility::_id_0764( "claymore_plant", &"SCRIPT_LEARN_CLAYMORES", maps\sniperescape_exchange::should_break_claymores );
    maps\_utility::_id_0764( "c4", &"SCRIPT_C4_USE", maps\sniperescape_exchange::should_break_c4 );
    maps\_utility::_id_0764( "barrett", &"SNIPERESCAPE_PRESS_FORWARDS_OR_BACKWARDS", maps\sniperescape_exchange::should_break_zoom_hint );
    maps\_utility::_id_0764( "where_is_he", &"SNIPERESCAPE_WHERE_IS_HE", maps\sniperescape_code::should_break_where_is_he );
    maps\sniperescape_code::set_c4_throw_binding();

    if ( level._id_8C36 != "sunset" )
        thread maps\_radiation::main();

    maps\sniperescape_anim::main();
    level thread maps\sniperescape_amb::main();
    var_2 = getentarray( "curtain_left", "targetname" );
    common_scripts\utility::_id_0D13( var_2, maps\sniperescape_code::curtain, "curtain_left" );
    var_3 = getentarray( "curtain_right", "targetname" );
    common_scripts\utility::_id_0D13( var_3, maps\sniperescape_code::curtain, "curtain_right" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C thread priceinit();
    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C.dontavoidplayer = 1;
    level._id_6F7C.invisible = 0;
    level.price_sticky_target_time = 5000;
    maps\_utility::_id_1332( "allies" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "player_looks_through_skylight", common_scripts\_exploder::_id_3528, 1 );
    level.engagement_dist_func = [];
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SHTGN_winchester", maps\sniperescape_code::engagement_shotgun );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_AR_ak47", maps\sniperescape_code::engagement_rifle );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_LMG_rpd", maps\sniperescape_code::engagement_gun );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SNPR_dragunov", maps\sniperescape_code::engagement_sniper );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SMG_skorpion", maps\sniperescape_code::engagement_smg );
    var_4 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_4, maps\sniperescape_code::enemy_override );
    maps\_utility::_id_0761( "axis", maps\sniperescape_code::enemy_override );
    maps\_utility::_id_0761( "axis", maps\sniperescape_code::dog_check );
    maps\_utility::_id_0761( "axis", maps\sniperescape_code::price_kill_check );
    common_scripts\utility::_id_383D( "player_on_barret" );
    common_scripts\utility::_id_383D( "launch_zak" );
    common_scripts\utility::_id_383D( "player_is_on_turret" );
    common_scripts\utility::_id_383D( "player_rappels" );
    common_scripts\utility::_id_383D( "exchange_heli_alerted" );
    common_scripts\utility::_id_383D( "wounding_sight_blocker_deleted" );
    common_scripts\utility::_id_383D( "heli_destroyed" );
    common_scripts\utility::_id_383D( "player_gets_off_turret_fade" );
    common_scripts\utility::_id_383D( "player_gets_off_turret" );
    common_scripts\utility::_id_383D( "wounded_zak_runs_for_car" );
    common_scripts\utility::_id_383D( "player_can_rappel" );
    common_scripts\utility::_id_383D( "price_starts_rappel" );
    common_scripts\utility::_id_383D( "price_comments_on_zak_miss" );
    common_scripts\utility::_id_383D( "price_comments_on_zak_hit" );
    common_scripts\utility::_id_383D( "makarov_killed" );
    common_scripts\utility::_id_383D( "zak_uaz_leaves" );
    common_scripts\utility::_id_383D( "zak_spawns" );
    common_scripts\utility::_id_383D( "player_used_zoom" );
    common_scripts\utility::_id_383D( "player_attacks_exchange" );
    common_scripts\utility::_id_383D( "exchange_success" );
    common_scripts\utility::_id_383D( "hotel_destroyed" );
    common_scripts\utility::_id_383D( "apartment_explosion" );
    common_scripts\utility::_id_383D( "heat_area_cleared" );
    common_scripts\utility::_id_383D( "player_defends_heat_area" );
    common_scripts\utility::_id_383D( "price_is_safe_after_wounding" );
    common_scripts\utility::_id_383D( "price_was_hit_by_heli" );
    common_scripts\utility::_id_383D( "price_picked_up" );
    common_scripts\utility::_id_383D( "stop_adjusting_vision" );
    common_scripts\utility::_id_383D( "beacon_placed" );
    common_scripts\utility::_id_383D( "beacon_ready" );
    common_scripts\utility::_id_383D( "seaknight_flies_in" );
    common_scripts\utility::_id_383D( "enemy_choppers_incoming" );
    common_scripts\utility::_id_383D( "first_pickup" );
    common_scripts\utility::_id_383D( "seaknight_prepares_to_leave" );
    common_scripts\utility::_id_383D( "seaknight_leaves" );
    common_scripts\utility::_id_383D( "price_cuts_to_woods" );
    common_scripts\utility::_id_383D( "player_moves_through_burnt_apartment" );
    common_scripts\utility::_id_383D( "fairbattle_detected" );
    common_scripts\utility::_id_383D( "price_can_be_left" );
    common_scripts\utility::_id_383D( "fair_hold_fire" );
    common_scripts\utility::_id_383D( "fairbattle_high_intensity" );
    common_scripts\utility::_id_383D( "seaknight_lands" );
    common_scripts\utility::_id_383D( "faiground_battle_begins" );
    common_scripts\utility::_id_383D( "fairbattle_gunshot" );
    common_scripts\utility::_id_383D( "price_wants_apartment_cleared" );
    common_scripts\utility::_id_383D( "heli_comes_to_rest" );
    common_scripts\utility::_id_383D( "heli_swap_dirt" );
    common_scripts\utility::_id_383D( "can_manage_price" );
    common_scripts\utility::_id_383F( "can_manage_price" );
    common_scripts\utility::_id_383D( "price_moves_to_position" );
    common_scripts\utility::_id_383D( "break_for_apartment" );
    common_scripts\utility::_id_383D( "player_looked_in_pool" );
    common_scripts\utility::_id_383D( "player_made_it_to_seaknight" );
    common_scripts\utility::_id_383D( "player_putting_down_price_seaknight" );
    common_scripts\utility::_id_383D( "price_calls_out_kills" );
    common_scripts\utility::_id_383F( "price_calls_out_kills" );
    common_scripts\utility::_id_383D( "price_calls_out_enemy_location" );
    common_scripts\utility::_id_383F( "price_calls_out_enemy_location" );
    common_scripts\utility::_id_383D( "price_told_player_to_go_prone" );
    common_scripts\utility::_id_383D( "seaknight_leaves_prematurely" );
    common_scripts\utility::_id_383D( "exchange_uazs_arrive" );
    common_scripts\utility::_id_383D( "fence_dog_dies" );
    common_scripts\utility::_id_383D( "heat_heli_transport" );
    common_scripts\utility::_id_383D( "price_opens_door" );
    common_scripts\utility::_id_383D( "kill_heli_attacks" );
    common_scripts\utility::_id_383D( "price_is_put_down_near_wheel" );
    common_scripts\utility::_id_383D( "fairbattle_threat_visible" );
    common_scripts\utility::_id_383D( "put_price_near_wheel" );
    common_scripts\utility::_id_383D( "heli_shot_down" );
    common_scripts\utility::_id_383D( "can_use_turret" );
    common_scripts\utility::_id_383D( "crash_heli_shows_up" );
    common_scripts\utility::_id_383D( "price_arrives_wait_more_behind_node" );
    common_scripts\utility::_id_383D( "aa_snipe" );
    common_scripts\utility::_id_383D( "aa_heat" );
    common_scripts\utility::_id_383D( "aa_wounded" );
    common_scripts\utility::_id_383D( "aa_burnt_apartment" );
    common_scripts\utility::_id_383D( "aa_seaknight_rescue" );
    common_scripts\utility::_id_383D( "wounding_enemy_detected" );
    common_scripts\utility::_id_383D( "carry_me_music_resume" );
    common_scripts\utility::_id_383D( "music_fairgrounds_fade" );
    common_scripts\utility::_id_383D( "havoc_hits_ground" );
    common_scripts\utility::_id_383D( "rescue_music_start" );
    common_scripts\utility::_id_383D( "zak_is_facing_player" );
    level.firstplay = 1;
    maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "apartment_explosion" );
    maps\_utility::_id_075F( maps\sniperescape_exchange::blow_up_hotel );
    thread maps\_utility::_id_2BDC();
    maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "player_enters_fairgrounds" );
    maps\_utility::_id_075F( maps\sniperescape_wounding::check_for_price );
    thread maps\_utility::_id_2BDC();
    var_5 = getentarray( "group_1", "script_noteworthy" );
    var_6 = spawnstruct();
    var_6.count = 0;
    common_scripts\utility::_id_0D13( var_5, maps\sniperescape_code::group1_enemies_think, var_6 );
    level.debounce_triggers = [];
    common_scripts\utility::_id_76BB( "leave_one", maps\sniperescape_code::leave_one_think );
    common_scripts\utility::_id_76BB( "heli_trigger", maps\sniperescape_code::heli_trigger );
    common_scripts\utility::_id_76BB( "block_path", maps\sniperescape_code::block_path );
    common_scripts\utility::_id_76BB( "debounce_trigger", maps\sniperescape_code::debounce_think );
    common_scripts\utility::_id_76BB( "set_go_line", maps\sniperescape_code::set_go_line );
    common_scripts\utility::_id_76BB( "enemy_door_trigger", maps\sniperescape_code::enemy_door_trigger );

    if ( getdvar( "use_old_obj_grass" ) == "1" )
        common_scripts\utility::_id_76BB( "grass_obj", maps\sniperescape_wounding::grass_obj );
    else
        thread maps\sniperescape_wounding::ferris_wheel_placement_objective();

    level.kill_heli_last_warning_refresh_time = 0;
    level.kill_heli_index = 0;
    level.kill_heli_progression = 0;
    level.kill_heli_progression_triggers = [];
    level.kill_heli_progression_triggers[0] = 0;
    level.kill_heli_progression_warnings = [];
    level.kill_heli_progression_warnings[0] = 0;
    level.kill_heli_triggers = [];
    common_scripts\utility::_id_76BB( "heat_progression", maps\sniperescape_code::heat_progression_summons_kill_heli );
    common_scripts\utility::_id_76BB( "uaz_placeholder", maps\sniperescape_code::_id_2856 );
    common_scripts\utility::_id_76BB( "deleteme", maps\sniperescape_code::_id_2856 );
    common_scripts\utility::_id_76BB( "bus_grenade_trigger", maps\sniperescape_wounding::bus_grenade_think );
    common_scripts\utility::_id_76BB( "fair_grenade_trigger", maps\sniperescape_wounding::fair_grenade_trigger_think );
    common_scripts\utility::_id_76BB( "script_animator", maps\sniperescape_wounding::script_animator );
    common_scripts\utility::_id_76BB( "merry_go_round_bottom", maps\sniperescape_wounding::merry_go_round_bottom );
    common_scripts\utility::_id_76BB( "merry_grass_delete", maps\sniperescape_wounding::merry_grass_delete );
    common_scripts\utility::_id_76BB( "final_heli_clip", maps\sniperescape_wounding::final_heli_clip );
    common_scripts\utility::_id_76BB( "heli_dirt_mesh", maps\sniperescape_wounding::heli_dirt_mesh );
    common_scripts\utility::_id_76BB( "heli_dirt_mesh_hide", maps\sniperescape_wounding::heli_dirt_mesh_hide );
    common_scripts\utility::_id_76BB( "heli_fence_clip", maps\sniperescape_wounding::heli_fence_clip_delete );
    common_scripts\utility::_id_76B9( "patrol_guy", maps\_utility::_id_0798, maps\sniperescape_code::patrol_guy );
    common_scripts\utility::_id_76B9( "chopper_guys", maps\_utility::_id_0798, maps\sniperescape_code::chopper_guys_land );
    common_scripts\utility::_id_76B9( "chase_chopper_guys", maps\_utility::_id_0798, maps\sniperescape_code::chase_chopper_guys_land );
    common_scripts\utility::_id_76B9( "house_chase_spawner", maps\_utility::_id_0798, maps\sniperescape_code::house_chase_spawner );
    thread maps\sniperescape_code::handle_radiation_warning();
    var_7 = getarraykeys( level.heli_flag );
    common_scripts\utility::_id_0CF0( var_7, maps\sniperescape_wounding::helicopter_broadcast );
    maps\sniperescape_code::create_price_dialogue_master();
    wait 0.05;
    level.playercardbackground setplayerturretfov( 70 );
    thread maps\sniperescape_exchange::player_learns_to_zoom();
    level.playercardbackground allowstand( 1 );
    level._id_6F7C thread monitor_macmellon();
    thread maps\_wibble::setup_wibble_triggers( 1, "seaknight_flies_in", "exterior", 0, 1 );
    thread set_combat_ads_lods_at_rappel();
}

monitor_macmellon()
{
    thread maps\_cheat::melonhead_monitor();
    self endon( "death" );
    self endon( "melonhead_monitor" );

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
            self.nearz = "Cpt. MacMellon";
        else
            self.nearz = "Cpt. MacMillan";

        level waittill( "melonhead_mode_updated" );
    }
}

_id_5FFB()
{
    level endon( "music_fairgrounds_fade" );
    level endon( "havoc_hits_ground" );
    level endon( "rescue_music_start" );
    musicstop( 0.05 );
    wait 0.2;

    for (;;)
    {
        maps\_utility::_id_6008( "sniperescape_secondary_run_music" );

        if ( !common_scripts\utility::_id_382E( "fairbattle_detected" ) && common_scripts\utility::_id_382E( "heat_enemies_back_off" ) )
            wait 56;
        else
            wait 24;

        if ( level.firstplay )
        {
            level.firstplay = 0;
            musicstop( 3 );
            wait 3.5;
            maps\_utility::_id_6008( "sniperescape_secondary_run_music" );
            wait 24;
        }

        musicstop( 4 );
        wait 4.5;
        maps\_utility::_id_6008( "sniperescape_run_music" );
        wait 134;
        musicstop( 2 );
        wait 2.5;
    }
}

music_helicrash()
{
    common_scripts\utility::_id_384A( "havoc_hits_ground" );
    wait 12;
    musicstop( 1 );
    common_scripts\utility::_id_384A( "carry_me_music_resume" );
    wait 0.1;
    thread _id_5FFB();
}

music_fairgrounds()
{
    level endon( "fairbattle_detected" );
    common_scripts\utility::_id_384A( "music_fairgrounds_fade" );
    musicstop( 8 );
    wait 8.5;

    for (;;)
    {
        maps\_utility::_id_6008( "sniperescape_fairgrounds_music" );
        wait 101;
        musicstop( 1 );
        wait 1;
    }
}

music_fairground_battle()
{
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    wait 15;
    musicstop( 6 );
    wait 6.1;
    thread _id_5FFB();
}

music_rescue()
{
    common_scripts\utility::_id_384A( "seaknight_flies_in" );
    wait 36;
    common_scripts\utility::_id_383F( "rescue_music_start" );
    musicstop( 6 );
    wait 6.5;
    maps\_utility::_id_6008( "sniperescape_rescue_music" );
}

priceinit()
{
    maps\_utility::_id_88F1( self );
    self.psoffsettime = 0;
    thread maps\_utility::_id_58D7();
    self._id_1300 = 1000;
    self._id_5F65 = 1.21;
    self.index = 1;
    self._id_0C72 = "price";
    self.ikweight = 1;
    thread maps\_props::_id_418B();
}

playerangles()
{
    for (;;)
        wait 0.05;
}

snipe()
{
    soundscripts\_snd::_id_870C( "start_default_checkpoint" );
    objective_add( maps\sniperescape_wounding::getobj( "zakhaev" ), "active", &"SNIPERESCAPE_ELIMINATE_IMRAN_ZAKHAEV", maps\sniperescape_exchange::exchange_turret_org() );
    setsaveddvar( "xanim_disableFootIKOutsidePlayerView", 0 );
    level.playercardbackground setplayerangles( ( 9.8, -104.0, 0.0 ) );
    maps\_utility::enable_scuff_footsteps_sound( 0 );
    thread maps\sniperescape_exchange::exchange_wind_flunctuates();
    thread maps\sniperescape_exchange::exchange_heli();
    thread maps\sniperescape_exchange::exchange_trace_converter();
    h1_set_up_mac_run_rappel();
    level._id_6F7C thread price_watches();
    thread price_talks();
    thread maps\sniperescape_lighting::snipe_vision_adjust();
    thread maps\sniperescape_wounding::player_gets_on_barret();
    common_scripts\utility::_id_76BB( "flag_org", maps\sniperescape_exchange::exchange_flag );
    common_scripts\utility::_id_76BB( "uaz_clip_brush", maps\sniperescape_exchange::exchange_vehicle_clip );
    thread maps\sniperescape_exchange::barrett_intro();
    thread maps\sniperescape_exchange::exchange_claymore();
    thread exchange_uaz();
    thread maps\sniperescape_exchange::exchange_turret();
    thread maps\sniperescape_exchange::exchange_barrett_trigger();
    thread maps\sniperescape_exchange::exchange_vehicles_flee_conflict();
    thread maps\sniperescape_exchange::exchange_dof();
    thread maps\sniperescape_exchange::exchange_uaz_that_backs_up();
    thread maps\sniperescape_exchange::exchange_wind_flag();
    thread maps\sniperescape_exchange::exchange_wind_generator();
    thread maps\sniperescape_exchange::exchange_mission_failure();
    thread maps\sniperescape_exchange::flashback_guys_anim();
    thread maps\sniperescape_exchange::flashback_guys_failure();
    thread maps\sniperescape_exchange::flashback_time_paradox_monitor();
    common_scripts\utility::_id_383F( "aa_snipe" );
    common_scripts\utility::_id_76B9( "leaning_smoker", maps\_utility::_id_0798, maps\sniperescape_exchange::lean_and_smoke );
    common_scripts\utility::_id_76B9( "standing_smoker", maps\_utility::_id_0798, maps\sniperescape_exchange::stand_and_smoke );
    var_0 = getentarray( "exchange_rider", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, maps\_utility::_id_7E5D, 1 );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, maps\sniperescape_exchange::exchange_baddie_main_think );
    common_scripts\utility::_id_76BB( "exchange_makarov", maps\_utility::_id_0798, maps\sniperescape_exchange::flashback_guy_setup );
    common_scripts\utility::_id_76BB( "exchange_yuri", maps\_utility::_id_0798, maps\sniperescape_exchange::flashback_guy_setup );
    var_1 = getentarray( "exchange_guard", "targetname" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, maps\_utility::_id_7E5D, 1 );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, maps\sniperescape_exchange::exchange_baddie_main_think );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, maps\sniperescape_exchange::exchange_bored_idle );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_88C3 );
    var_2 = getentarray( "exchange_baddy", "targetname" );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_0798, maps\_utility::_id_7E5D, 1 );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_0798, maps\sniperescape_exchange::exchange_baddie_main_think );
    var_3 = maps\_utility::_id_0D08( var_2 );
    level.exchanger_surprise_time = 0.5;
    var_4 = var_3[0];
    var_5 = var_3[1];
    var_4._id_0C72 = "guard";
    var_5._id_0C72 = "dealer";
    var_4.main_baddie = 1;
    var_5.main_baddie = 1;
    var_6 = getent( "exchange_org", "targetname" );
    var_6 thread maps\_anim::_id_0BDD( var_3, "exchange_idle" );
    maps\sniperescape_exchange::exchange_zak_and_guards_jab_it_up( var_6, var_3 );
    var_6 notify( "stop_loop" );
    level._id_6F7C _meth_81ce( "prone", "crouch", "stand" );
    common_scripts\utility::_id_3852( "player_attacks_exchange", "zakhaev_escaped" );
    musicstop( 3 );
    wait 0.25;
    maps\sniperescape_code::price_clears_dialogue();

    if ( !common_scripts\utility::_id_382E( "exchange_success" ) )
        common_scripts\utility::_id_384A( "exchange_success" );

    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "zakhaev" ) );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "heli_destroyed" ) )
    {
        maps\sniperescape_code::price_line( "take_out_that_heli" );
        objective_add( maps\sniperescape_wounding::getobj( "heli" ), "active", &"SNIPERESCAPE_TAKE_OUT_THE_ATTACK_CHOPPER", maps\sniperescape_exchange::exchange_turret_org() );
        common_scripts\utility::_id_384A( "heli_destroyed" );
        maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "heli" ) );
    }

    thread maps\sniperescape_exchange::exchange_heli_second_wave();
    objective_add( maps\sniperescape_wounding::getobj( "hotel" ), "active", &"SNIPERESCAPE_GET_OUT_OF_THE_HOTEL", maps\sniperescape_wounding::rappel_obj_org() );
    objective_current( maps\sniperescape_wounding::getobj( "hotel" ) );
    maps\sniperescape_code::price_line( "great_shot_now_go" );
    thread _id_5FFB();
    thread music_helicrash();
    thread music_fairgrounds();
    thread music_fairground_battle();
    thread music_rescue();
    wait 2.0;
    common_scripts\utility::_id_383F( "player_gets_off_turret_fade" );
    wait 0.5;
    common_scripts\utility::_id_383F( "player_gets_off_turret" );
    setomnvar( "ui_barret", 0 );
    soundscripts\_snd::_id_870C( "escape_hotel_mix" );
    var_7 = getent( "inc_heli_sfx_1", "targetname" );
    var_8 = getent( "inc_heli_sfx_2", "targetname" );
    var_7 thread common_scripts\utility::_id_69C2( "scn_se_havoc_inbound1", var_7.origin );
    var_8 thread common_scripts\utility::_id_69C2( "scn_se_havoc_inbound2", var_8.origin );
    maps\_utility::enable_scuff_footsteps_sound( 1 );
    thread rappel_out_of_hotel();
    setsaveddvar( "xanim_disableFootIKOutsidePlayerView", 1 );
}

exchange_uaz()
{
    var_0 = getentarray( "base_uaz", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_exchange::exchange_uaz_preps_for_escape );
    var_1 = maps\_vehicle::_id_897C( "uaz" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_exchange::exchange_uaz_preps_for_escape );
    var_2 = maps\sniperescape_wounding::get_ent_with_key_from_array( var_1, "zaks_ride", "script_noteworthy" );
    level.flashback_guys_uaz = maps\sniperescape_wounding::get_ent_with_key_from_array( var_1, "flashback_guys_uaz", "script_noteworthy" );
    level.flashback_guys_uaz thread maps\sniperescape_exchange::flashback_uaz_stop_while_driverdead();
    var_3 = getent( "jeep_window", "targetname" );
    var_3 linkto( var_2, "body_animate_jnt", ( -20.0, 0.0, 54.0 ), ( 0.0, 180.0, 0.0 ) );
    wait 2;
    common_scripts\utility::_id_384A( "player_on_barret" );
    common_scripts\utility::_id_0CF0( var_1, maps\_vehicle::_id_427A );
    common_scripts\utility::_id_384A( "zak_arrives" );
    wait 2;
    common_scripts\utility::_id_383F( "exchange_uazs_arrive" );
}

price_watches( var_0 )
{
    self._id_0C72 = "price";
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( level._id_78B5["binocs"] );
    var_1 linkto( self, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.binocs = var_1;
    var_2 = getent( self._not_team, "targetname" );
    var_2 maps\_anim::_id_0C24( self, "intro_spotter" );
    var_2 thread maps\_anim::_id_0BE1( self, "spotter_idle" );
}

price_talks()
{
    level endon( "player_attacks_exchange" );
    maps\sniperescape_code::price_line( "transport_sighted" );
    common_scripts\utility::_id_384A( "player_on_barret" );
    maps\_utility::_id_6008( "sniperescape_exchange_music" );
    wait 1.25;
    thread maps\sniperescape_code::price_line( "get_on_barrett" );
    maps\sniperescape_code::price_line( "remember_my_teaching" );
    common_scripts\utility::_id_384A( "zak_is_seen" );
    common_scripts\utility::_id_383F( "launch_zak" );
    level.wind_setting = "middle";
    maps\_utility::_id_27EF( 25.8, common_scripts\utility::_id_383F, "block_heli_starts" );
    wait 5.6;
    maps\sniperescape_code::price_line( "i_see_him" );
    thread maps\sniperescape_code::price_line( "target_acquired" );
    thread maps\sniperescape_code::price_line( "wind_picked_up" );
    common_scripts\utility::_id_384A( "block_heli_arrives" );
    level.helitimer = gettime();
    wait 1.2;
    thread maps\sniperescape_code::price_line( "where_did_he_come_from" );
    common_scripts\utility::_id_384A( "block_heli_moves" );
    wait 13;
    level.wind_setting = "start";
    wait 3;
    level notify( "wind_stops_flunctuating" );
    level.wind_vel = 0;
    level.wind_setting = "end";
    wait 5;
    maps\sniperescape_code::price_line( "now_or_never" );
    musicstop( 3 );
}

barline()
{
    for (;;)
        wait 0.05;
}

setup_rappel()
{
    var_0 = getent( "rappel_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 = maps\_utility::_id_88D1( "rope" );
    level._id_75E0 = var_1;
    var_2 = getnode( "price_rappel_node", "targetname" );
    var_2 thread maps\_anim::_id_0BC7( var_1, "rappel_start" );
    var_3 = getent( "bullet_block", "targetname" );
    var_3 delete();
    var_4 = getent( level._id_6F7C._not_team, "targetname" );
    var_4 notify( "stop_loop" );
    level._id_6F7C _meth_8143();
    common_scripts\utility::_id_3831( "aa_snipe" );
    var_4 maps\_anim::_id_0C24( level._id_6F7C, "spotter_exit" );

    if ( isdefined( level.binocs ) )
        level.binocs delete();
}

trigger_monitor_player_lean()
{
    self endon( "stop_monitor_lean" );

    for (;;)
    {
        if ( level.playercardbackground isleaning() )
            common_scripts\utility::_id_97CC();
        else
            common_scripts\utility::_id_97CE();

        waittillframeend;
    }
}

_id_6BD0()
{
    var_0 = getnode( "player_rappel_node", "targetname" );
    var_1 = maps\_utility::_id_88D1( "player_rope" );
    var_0 thread maps\_anim::_id_0BC7( var_1, "rappel_for_player" );
    var_2 = maps\_utility::_id_88D1( "player_rope_obj" );
    var_0 thread maps\_anim::_id_0BC7( var_2, "rappel_for_player" );
    var_2 hide();
    var_3 = maps\_utility::_id_88D1( "player_rappel" );
    var_3 hide();
    var_0 maps\_anim::_id_0BC7( var_3, "rappel" );
    var_4 = getent( "rappel_trigger", "targetname" );
    var_4.origin = ( 481.4, -10823.2, 1068.9 );
    var_4 sethintstring( &"SNIPERESCAPE_HOLD_1_TO_RAPPEL" );
    var_2 show();
    var_4 thread trigger_monitor_player_lean();

    for (;;)
    {
        var_4 waittill( "trigger" );
        waittillframeend;

        if ( !level.playercardbackground isleaning() )
        {
            var_4 notify( "stop_monitor_lean" );
            break;
        }
    }

    var_4 delete();
    thread maps\sniperescape_lighting::vision_glow_change();
    var_2 hide();
    common_scripts\utility::_id_383F( "player_rappels" );
    soundscripts\_snd::_id_870C( "rappel_foley_mix" );
    level.rappel_buffer = gettime();
    level._id_9373 = gettime();
    level.playercardbackground thread maps\sniperescape_code::take_weapons();
    thread rappel_rumble();
    maps\_utility::_id_27EF( 1.2, common_scripts\utility::_id_383F, "apartment_explosion" );
    setsaveddvar( "bg_scriptFullPitchRange", 1 );
    var_3 maps\_utility::_id_5696( "tag_player", 0.5, 0.9, 5, 5, 45, 0 );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowlean( 0 );
    level.playercardbackground playerlinktodelta( var_3, "tag_player", 1.0, 0, 0, 0, 0 );
    var_3 show();
    var_0 thread maps\_anim::_id_0C24( var_3, "rappel" );
    var_0 thread maps\_anim::_id_0C24( var_1, "rappel_for_player" );
    var_0 waittill( "rappel" );
    level.playercardbackground unlink();
    setsaveddvar( "cg_drawCrosshair", getdvar( "cg_drawCrosshairOption", 1 ) );
    setsaveddvar( "bg_scriptFullPitchRange", 0 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowlean( 1 );
    var_3 delete();
    common_scripts\utility::_id_383F( "can_save" );
    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "hotel" ) );
    level.playercardbackground maps\sniperescape_code::give_back_weapons();
    maps\_utility::_id_27EF( 1.5, common_scripts\utility::_id_383F, "heli_moves_on" );
}

rappel_rumble()
{
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 1.02, "generic_attack_light_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 3.36, "generic_attack_light_1500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 4.81, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 6.13, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 7.45, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 8.37, "generic_attack_medium_500" );
    level.playercardbackground thread maps\_utility::rumble_sequence_play( var_0, 0 );
}

rappel_out_of_hotel()
{
    soundscripts\_snd::_id_870C( "start_rappel_checkpoint" );
    wait 0.05;
    thread setup_rappel();
    thread _id_6BD0();
    var_0 = getnode( "price_rappel_node", "targetname" );
    common_scripts\utility::_id_383F( "player_can_rappel" );

    if ( getdvarint( "use_old_macmillan_rappel" ) == 1 )
        var_0 thread maps\_anim::_id_0BFF( level._id_6F7C, "rappel_start" );
    else
        h1_handle_mac_run_past_chair();

    maps\_utility::_id_27EF( 2, common_scripts\_exploder::_id_3528, 6 );
    var_1 = [];
    var_1[var_1.size] = level._id_6F7C;
    var_1[var_1.size] = level._id_75E0;

    if ( !common_scripts\utility::_id_382E( "player_rappels" ) )
        price_climbs_until_player_rappels( var_1, var_0 );

    if ( !common_scripts\utility::_id_382E( "price_starts_rappel" ) )
    {
        level.price_anim_start_time = gettime() + 100;
        var_0 maps\_utility::_id_27EF( 0.1, maps\_anim::_id_0C18, var_1, "rappel_start" );
    }

    wait 0.15;
    var_2 = 1;

    if ( !isdefined( level.rappel_buffer ) )
        wait(var_2);
    else
        maps\_utility::_id_9F8C( level.rappel_buffer, var_2 );

    var_3 = getanimlength( level._id_6F7C maps\_utility::_id_3EF5( "rappel_start" ) );
    var_4 = gettime() - level.price_anim_start_time;
    var_5 = var_4 * 0.001 / var_3;
    var_6 = 0.51;

    if ( var_5 < var_6 )
    {
        level._id_6F7C maps\_anim::_id_0C0F( "rappel_start", var_6 );
        level._id_75E0 maps\_anim::_id_0C0F( "rappel_start", var_6 );
    }

    level._id_6F7C common_scripts\utility::waittillend( "single anim" );
    level._id_6F7C.a._id_6E5A = "stand";
    level.move_in_trigger_used = [];
    common_scripts\utility::_id_76BB( "move_in_trigger", maps\sniperescape_code::move_in );
    var_3 = getanimlength( level._id_6F7C maps\_utility::_id_3EF5( "rappel_end" ) );
    var_0 thread maps\_anim::_id_0C18( var_1, "rappel_end" );
    wait(var_3 - 0.5);
    level._id_6F7C maps\_anim::_id_0C0F( "rappel_end", 1 );
    setsaveddvar( "phys_bulletspinscale", "3" );
    level._id_6F7C maps\_utility::_id_7E38( "r" );
    thread battle_through_heat_area();
}

activate_chair_clip()
{
    level endon( "player_rappels" );

    while ( level.playercardbackground istouching( self ) )
        waittillframeend;

    self solid();
}

price_climbs_until_player_rappels( var_0, var_1 )
{
    level endon( "player_rappels" );
    level._id_6F7C waittill( "goal" );
    thread apartment_explosion();
    common_scripts\utility::_id_383F( "price_starts_rappel" );
    level.price_anim_start_time = gettime();
    var_1 maps\_anim::_id_0C18( var_0, "rappel_start" );

    if ( !common_scripts\utility::_id_382E( "player_rappels" ) )
    {
        var_1 thread maps\_anim::_id_0BDD( var_0, "rappel_idle", "stop_idle" );
        common_scripts\utility::_id_384A( "player_rappels" );
        var_1 notify( "stop_idle" );
    }

    maps\_utility::arcademode_checkpoint( 5, "a" );
    var_1 thread maps\_anim::_id_0C18( var_0, "rappel_end" );
}

apartment_explosion()
{
    wait 4.0;
    common_scripts\utility::_id_383F( "apartment_explosion" );
}

start_run()
{
    soundscripts\_snd::_id_870C( "start_run_checkpoint" );
    thread _id_5FFB();
    thread maps\sniperescape_lighting::vision_glow_change();
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_code::delete_living );
    var_1 = getnode( "tele_node", "targetname" );
    var_2 = getent( "tele_org", "targetname" );
    level.move_in_trigger_used = [];
    common_scripts\utility::_id_76BB( "move_in_trigger", maps\sniperescape_code::move_in );
    level.playercardbackground setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level._id_6F7C _meth_81c9( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setorigin( var_2.origin );
    thread battle_through_heat_area();
}

battle_through_heat_area()
{
    thread maps\sniperescape_code::_id_5319();
    level._id_6F7C._id_2D3B = 1;
    thread maps\sniperescape_wounding::heat_helis_transport_guys_in();
    var_0 = getentarray( "weapons_dealer", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_code::delete_living );
    thread maps\sniperescape_code::enemy_accuracy_assignment();
    var_1 = getentarray( "east_spawner", "targetname" );
    thread maps\sniperescape_code::heat_spawners_attack( var_1, "start_heat_spawners", "stop_heat_spawners" );
    var_2 = getentarray( "west_spawner", "targetname" );
    thread maps\sniperescape_code::heat_spawners_attack( var_2, "start_heat_spawners", "stop_heat_spawners" );
    wait 1;
    common_scripts\utility::_id_383F( "aa_heat" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "follow_me" );
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_REACH_THE_EXTRACTION", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_wounding::modify_objective_destination_babystep( maps\sniperescape_wounding::getobj( "heat" ) );
    level._id_9373 = gettime();
    maps\_utility::_id_27EF( 1, maps\sniperescape_code::price_line, "compromised" );
    maps\_utility::_id_27EF( 3, maps\sniperescape_code::price_line, "eta_20_min" );
    maps\_utility::_id_27EF( 9.35, maps\_utility::_id_1143, "eta_20_min" );
    maps\_utility::_id_27EF( 5.5, maps\sniperescape_code::countdown, 20 );
    thread price_runs_for_woods_on_contact();
    common_scripts\utility::_id_384A( "start_heat_spawners" );
    maps\_vehicle::_id_8979( "introchopper1" );
    common_scripts\utility::_id_384A( "heat_enemies_back_off" );
    waitframe;
    maps\_utility::_id_070A( "price_heads_for_apartment" );
    thread maps\sniperescape_code::defend_heat_area_until_enemies_leave();
    level._id_6F7C maps\_utility::_id_7E38( "y" );
    thread the_apartment();
}

price_runs_for_woods_on_contact()
{
    common_scripts\utility::_id_384A( "start_heat_spawners" );
    level._id_6F7C maps\_utility::_id_7E38( "b" );
    level._id_6F7C._id_2D3B = undefined;
    common_scripts\utility::_id_383F( "price_cuts_to_woods" );
}

start_apartment()
{
    soundscripts\_snd::_id_870C( "start_apart_checkpoint" );
    thread _id_5FFB();
    thread maps\sniperescape_lighting::vision_glow_change();
    thread maps\sniperescape_code::countdown( 18 );
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apartment_org", "targetname" );
    var_2 = getent( "player_apartment_org", "targetname" );
    level.playercardbackground setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level._id_6F7C _meth_81c9( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setorigin( var_2.origin );
    level._id_6F7C maps\_utility::_id_7E38( "y" );
    thread the_apartment();
}

the_apartment()
{
    thread maps\sniperescape_code::set_min_time_remaining( 8 );
    common_scripts\utility::_id_383F( "break_for_apartment" );
    common_scripts\utility::_id_3831( "aa_heat" );
    thread maps\sniperescape_wounding::apartment_price_waits_for_dog_death();
    level notify( "stop_adjusting_enemy_accuracy" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "lose_them_in_apartment" );
    var_0 = getent( "price_explore_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( var_0._not_team, "targetname" );
    maps\_utility::_id_1143( "into_the_apartment" );
    maps\_utility::arcademode_checkpoint( 4, "b" );
    common_scripts\utility::_id_383F( "price_opens_door" );
    thread maps\sniperescape_code::player_touches_wounded_blocker();
    maps\_utility::_id_070A( "price_opens_door" );
    var_1 maps\_anim::_id_0BFF( level._id_6F7C, "spin" );
    var_2 = getanimlength( level._id_6F7C maps\_utility::_id_3EF5( "spin" ) );
    var_2 *= 0.87;
    var_1 thread maps\_anim::_id_0C24( level._id_6F7C, "spin" );
    wait(var_2);
    level._id_6F7C _meth_8143();
    level._id_6F7C _meth_816a();
    level._id_6F7C thread maps\_utility::_id_7E5D( 1 );
    var_3 = getnode( "slow_door_macmillan_node", "targetname" );
    var_3 maps\_anim::_id_0BFF( level._id_6F7C, "smooth_door_open_init" );
    var_3 maps\_anim::_id_0C24( level._id_6F7C, "smooth_door_open_init" );
    var_4 = getent( "slow_door", "targetname" );
    var_5 = getent( "slow_door_model", "targetname" );
    var_5 linkto( var_4 );
    var_4 thread maps\_utility::_id_6666();
    var_3 maps\_anim::_id_0C24( level._id_6F7C, "smooth_door_open" );
    level._id_6F7C maps\_utility::_id_7E38( "y" );
    thread window_mantle_transition();
    common_scripts\utility::_id_384A( "fence_dog_attacks" );
    level._id_6F7C _meth_816a();
    level._id_6F7C thread maps\_utility::_id_7E5D( 0 );
    thread maps\sniperescape_code::dog_attacks_fence();
    thread the_wounding();
}

window_mantle_transition()
{
    var_0 = getent( "mantle_disable_cqb", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level._id_6F7C )
            break;
    }

    level._id_6F7C maps\_utility::_id_2A8D();
    var_0 = getent( "mantle_enable_cqb", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level._id_6F7C )
            break;
    }

    level._id_6F7C maps\_utility::_id_30B0();
}

start_wounding()
{
    soundscripts\_snd::_id_870C( "start_wounding_checkpoint" );
    thread _id_5FFB();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_code::countdown( 16 );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apart_org", "targetname" );
    var_2 = getent( "player_apart_org", "targetname" );
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level._id_6F7C _meth_81c9( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setorigin( var_2.origin );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C maps\_utility::_id_30B0();
    level._id_6F7C maps\_utility::_id_7E38( "y" );
    thread the_wounding();
    thread maps\sniperescape_code::player_touches_wounded_blocker();
}

_id_8B7C()
{
    soundscripts\_snd::_id_870C( "start_crash_checkpoint" );
    thread _id_5FFB();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_code::countdown( 16 );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apart_org", "targetname" );
    var_2 = getent( "player_wounding_org", "targetname" );
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level._id_6F7C _meth_81c9( var_1.origin );
    var_3 = getnode( "price_wounding_node", "targetname" );
    var_3 maps\_anim::_id_0C43( level._id_6F7C, "crash" );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setorigin( var_2.origin );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C maps\_utility::_id_30B0();
    level._id_6F7C maps\_utility::_id_7E38( "y" );
    thread maps\sniperescape_code::player_touches_wounded_blocker();
    thread maps\sniperescape_wounding::heli_attacks_price_new();
    wait 1;
    common_scripts\utility::_id_0D13( level._id_265B["surprise_guys_dead"]["ai"], maps\_utility::_id_7C71 );
    common_scripts\utility::_id_0D13( level._id_265B["surprise_guys_dead"]["spawners"], maps\_utility::_id_7C71 );
    common_scripts\utility::_id_383F( "surprise_guys_dead" );
    common_scripts\utility::_id_383F( "patrol_guys_dead" );
    level waittill( "start_continues" );
    common_scripts\utility::_id_383F( "heli_shot_down" );
}

the_wounding()
{
    thread maps\sniperescape_code::set_min_time_remaining( 7 );
    common_scripts\utility::_id_383F( "price_calls_out_kills" );
    common_scripts\utility::_id_384A( "price_signals_holdup" );

    if ( !maps\sniperescape_wounding::player_is_enemy() && !common_scripts\utility::_id_382E( "wounding_enemy_detected" ) )
    {
        maps\sniperescape_wounding::price_goes_to_window_to_shoot();
        level._id_6F7C.ignoretriggers = 0;
    }

    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C maps\_utility::_id_309A();
    maps\_utility::_id_070A( "price_moves_to_window_trigger" );
    level._id_6F7C.ignoreforfixednodesafecheck = 0;
    maps\sniperescape_code::delete_wounding_sight_blocker();
    wait 2.5;
    common_scripts\utility::_id_3852( "patrol_guys_dead", "player_touches_wounding_clip" );
    level._id_6F7C maps\_utility::_id_2A74();
    level._id_6F7C.fixednodesaferadius = 32;
    level._id_6F7C.fixednode = 1;
    level._id_6F7C.goalradius = 32;
    var_0 = getnode( "price_wait_more_behind_node", "targetname" );
    level._id_6F7C _meth_81a9( var_0 );
    thread confirm_price_at_goal();
    common_scripts\utility::_id_384A( "player_touches_wounding_clip" );
    var_1 = getentarray( "surprise_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::surprisers_interval );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::surprisers_goal );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_88C3 );
    level._id_6F7C maps\_utility::_id_27EF( 2, maps\_anim::_id_0C21, level._id_6F7C, "more_behind" );
    level._id_6F7C maps\_utility::_id_27EF( 2, ::fight_enemies_behind );
    common_scripts\utility::_id_384A( "price_arrives_wait_more_behind_node" );
    level._id_6F7C.meleeattackdist = 8000;
    thread maps\sniperescape_wounding::heli_attacks_price_new();
}

confirm_price_at_goal()
{
    level._id_6F7C waittill( "goal" );
    common_scripts\utility::_id_383F( "price_arrives_wait_more_behind_node" );
}

fight_enemies_behind()
{
    level endon( "crash_heli_shows_up" );

    if ( common_scripts\utility::_id_382E( "price_arrives_wait_more_behind_node" ) )
        maps\_anim::_id_0C24( self, "behind_turn" );

    var_0 = getnode( "price_more_behind_node", "targetname" );
    self _meth_81a9( var_0 );
}

surprisers_interval()
{
    self.invisible = 128;
}

surprisers_goal()
{
    var_0 = getnode( "surprise_guys_goal", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        maps\_utility::_id_7E4B( var_0 );
}

heli_attacks_price()
{
    var_0 = getnode( "price_apartment_destination_node", "targetname" );
    var_1 = maps\_vehicle::_id_8979( "heli_price" );
    level.price_heli = var_1;
    var_1 thread maps\_vehicle_code::helipath( var_1._not_team, 70, 70 );
    wait 1;
    level._id_6F7C endon( "death" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "more_behind" );
    var_0 maps\_anim::_id_0BFF( level._id_6F7C, "wounded_begins" );
    common_scripts\utility::_id_384A( "price_heli_in_position" );
    var_0 maps\_anim::_id_0BFF( level._id_6F7C, "wounded_begins" );
    maps\_utility::_id_27EF( 5.5, common_scripts\utility::_id_383F, "price_heli_moves_on" );
    var_2 = getent( "wounding_target", "targetname" );
    var_1 maps\_utility::_id_27EF( 6.5, maps\sniperescape_code::heli_shoots_rockets_at_ent, var_2 );
    maps\_utility::_id_27EF( 7.2, common_scripts\_exploder::_id_3528, 500 );
    var_0 maps\_anim::_id_0C24( level._id_6F7C, "wounded_begins" );
    thread wounded_combat();
}

price_waits_for_enemies_to_walk_past()
{
    if ( common_scripts\utility::_id_382E( "enemies_walked_past" ) )
        return;

    if ( common_scripts\utility::_id_382E( "wounding_sight_blocker_deleted" ) )
        return;

    level endon( "wounding_sight_blocker_deleted" );
    common_scripts\utility::_id_384A( "price_says_wait" );
    maps\_utility::_id_1143( "standby" );
    common_scripts\utility::_id_384A( "walked_past_price" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "now" );
}

start_wounded()
{
    soundscripts\_snd::_id_870C( "start_wounded_checkpoint" );
    thread _id_5FFB();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 13 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getnode( "price_apartment_destination_node", "targetname" );
    var_3 = getent( "player_post_wound_org", "targetname" );
    level.playercardbackground setplayerangles( var_3.angles );
    level.playercardbackground setorigin( var_3.origin + ( 0.0, 0.0, -34341.0 ) );
    level._id_6F7C _meth_81c9( var_2.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setorigin( var_3.origin );
    level._id_6F7C maps\_utility::_id_2A74();
    thread wounded_combat();
}

wounded_combat()
{
    level._id_6F7C endon( "death" );
    maps\_spawner::_id_533A( 10 );
    common_scripts\utility::_id_76B9( "flee_guy", maps\_utility::_id_0798, maps\sniperescape_code::flee_guy_runs );
    common_scripts\utility::_id_76B9( "force_patrol", maps\_utility::_id_0798, maps\sniperescape_code::force_patrol_think );
    maps\_utility::_id_0761( "axis", maps\sniperescape_code::on_the_run_enemies );
    common_scripts\utility::_id_76BB( "wounded_combat_trigger", maps\sniperescape_code::wounded_combat_trigger );
    thread maps\sniperescape_code::second_apartment_line();
    common_scripts\utility::_id_383F( "price_is_safe_after_wounding" );
    maps\_utility::_id_1143( "carry_price" );
    maps\sniperescape_code::kill_all_enemies();
    thread maps\sniperescape_code::price_line( "cant_move_3" );
    objective_string( maps\sniperescape_wounding::getobj( "wounded" ), &"SNIPERESCAPE_PICK_UP_CPT_MACMILLAN" );
    objective_position( maps\sniperescape_wounding::getobj( "wounded" ), level._id_6F7C.origin );
    level notify( "stop_updating_objective" );
    thread escort_to_park();
}

escort_to_park()
{
    thread maps\sniperescape_code::set_min_time_remaining( 5 );
    thread maps\sniperescape_code::price_wounded_logic();
    thread maps\sniperescape_code::price_followup_line();
    soundscripts\_snd::_id_870C( "carrying_macmillan_mix" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "price_picked_up", maps\sniperescape_code::price_line, "extraction_is_southwest" );
    common_scripts\utility::_id_384A( "price_picked_up" );
    maps\_utility::arcademode_checkpoint( 10, "c" );
    common_scripts\utility::_id_383F( "aa_wounded" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "enter_burnt", common_scripts\utility::_id_3831, "aa_wounded" );
    objective_string( maps\sniperescape_wounding::getobj( "wounded" ), &"SNIPERESCAPE_CARRY_MACMILLAN_TO_THE" );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    thread maps\sniperescape_code::enemy_zone_spawner();
    common_scripts\utility::_id_384A( "enter_burnt" );
    maps\_utility::_id_1143( "entered_burnt" );
    thread enter_burnt_apartment();
}

start_burnt()
{
    soundscripts\_snd::_id_870C( "start_burnt_checkpoint" );
    thread _id_5FFB();
    common_scripts\utility::_id_383F( "first_pickup" );
    maps\_utility::_id_0761( "axis", maps\sniperescape_code::on_the_run_enemies );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 6 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_burnt_org", "targetname" );
    var_3 = getent( "price_burnt_org", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level._id_6F7C _meth_81c9( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    thread enter_burnt_apartment();
}

enter_burnt_apartment()
{
    thread maps\sniperescape_code::burnt_blocker();
    thread maps\sniperescape_code::spooky_sighting();
    thread maps\sniperescape_code::spooky_dog();
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "spawn_spooky_dog", common_scripts\utility::_id_383F, "aa_burnt_apartment" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "apartment_cleared", common_scripts\utility::_id_3831, "aa_burnt_apartment" );
    setdvar( "player_sees_pool_dogs", "" );
    common_scripts\utility::_id_76B9( "apartment_guard", maps\_utility::_id_0798, maps\_utility::_id_7E24 );
    common_scripts\utility::_id_76B9( "apartment_guard", maps\_utility::_id_0798, maps\_utility::_id_7DDD, 100 );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "enter_burnt", maps\_utility::_id_1EB2, "player_hasnt_been_spooked" );
    thread maps\sniperescape_code::player_navigates_burnt_apartment();
    thread _id_6E2F();
    var_0 = getent( "level_end", "targetname" );
    var_0.origin += ( 0.0, 150.0, 0.0 );
    thread fairgrounds_before_battle();
}

start_pool()
{
    soundscripts\_snd::_id_870C( "start_pool_checkpoint" );
    thread _id_5FFB();
    common_scripts\utility::_id_383F( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 8 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_pool_org", "targetname" );
    var_3 = getent( "price_pool_org", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level._id_6F7C _meth_81c9( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin );
    setdvar( "player_sees_pool_dogs", "" );
    wait 0.05;
    common_scripts\utility::_id_383F( "to_the_pool" );
    thread maps\sniperescape_code::price_wounded_logic();
    thread fairgrounds_before_battle();
    thread _id_6E2F();
}

_id_6E2F()
{
    thread maps\sniperescape_code::set_min_time_remaining( 4 );
    common_scripts\utility::_id_384A( "to_the_pool" );
    common_scripts\utility::_id_383F( "price_calls_out_enemy_location" );
    maps\_utility::arcademode_checkpoint( 20, "d" );
    thread maps\_utility::_id_2BC3( common_scripts\utility::_id_384A, "pool_lookat", common_scripts\utility::_id_383F, "player_looked_in_pool" );
    var_0 = level.playercardbackground.meleeattackdist;
    level.playercardbackground.meleeattackdist = 168;
    maps\_utility::_id_1143( "to_the_pool" );
    thread maps\sniperescape_code::price_line( "almost_there" );
    common_scripts\utility::_id_383F( "music_fairgrounds_fade" );
    thread maps\sniperescape_wounding::pool_have_body();
    common_scripts\utility::_id_383D( "pool_dogs_flee" );

    if ( getdvar( "player_sees_pool_dogs" ) == "" )
        setdvar( "player_sees_pool_dogs", "1" );
    else
        common_scripts\utility::_id_383F( "pool_dogs_flee" );

    if ( !common_scripts\utility::_id_382E( "fairbattle_high_intensity" ) )
    {
        var_1 = maps\_utility::get_guys_with_targetname_from_spawner( "eating_dog" );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] thread maps\sniperescape_wounding::pool_dog_think( var_2 );
    }

    common_scripts\utility::_id_384A( "player_enters_fairgrounds" );
    level.playercardbackground.meleeattackdist = var_0;
}

start_fair()
{
    soundscripts\_snd::_id_870C( "start_fair_checkpoint" );
    thread _id_5FFB();
    common_scripts\utility::_id_383F( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 20 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_fair_org", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level._id_6F7C _meth_81c9( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    common_scripts\utility::_id_384A( "price_picked_up" );
    thread fairgrounds_before_battle();
    common_scripts\utility::_id_383F( "player_enters_fairgrounds" );
    common_scripts\utility::_id_383F( "to_the_pool" );
    common_scripts\utility::_id_383F( "fair_snipers_died" );
}

start_fair_battle()
{
    soundscripts\_snd::_id_870C( "start_fair_battle_checkpoint" );
    thread _id_5FFB();
    common_scripts\utility::_id_383F( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_gnoll", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level._id_6F7C _meth_81c9( var_3.origin, var_3.angles );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin );
    wait 0.05;
    common_scripts\utility::_id_383F( "price_can_be_left" );
    thread maps\sniperescape_code::price_wounded_logic();
    thread fairgrounds_after_prep();
    common_scripts\utility::_id_383F( "player_enters_fairgrounds" );
    common_scripts\utility::_id_383F( "to_the_pool" );
}

fairgrounds_before_battle()
{
    thread maps\sniperescape_wounding::fairground_patrollers();
    level.price_gnoll_dist = 250;
    common_scripts\utility::_id_384A( "player_enters_fairgrounds" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "player_reaches_extraction_point" );

        if ( common_scripts\utility::_id_382E( "price_picked_up" ) )
            break;

        common_scripts\utility::_id_3831( "player_reaches_extraction_point" );
    }

    common_scripts\utility::_id_0D13( level._id_265B["fair_snipers_died"]["ai"], maps\sniperescape_code::fair_spawner_seeks_player );
    common_scripts\utility::_id_384A( "fair_snipers_died" );
    maps\sniperescape_code::price_line( "waiting_for_signal" );
    wait 0.35;
    maps\sniperescape_code::price_line( "helicopter_is_standing_by" );
    maps\sniperescape_code::price_line( "put_down_behind_wheel" );
    wait 2;
    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "wounded" ) );
    common_scripts\utility::_id_383F( "put_price_near_wheel" );
    objective_add( maps\sniperescape_wounding::getobj( "putdown" ), "active", &"SNIPERESCAPE_PUT_CPT_MACMILLAN_DOWN", maps\sniperescape_code::price_fair_defendspot() );
    objective_current( maps\sniperescape_wounding::getobj( "putdown" ) );
    thread maps\sniperescape_wounding::update_objective_position_for_fairground( maps\sniperescape_wounding::getobj( "putdown" ) );
    thread maps\sniperescape_code::price_says_this_is_fine();
    thread maps\sniperescape_wounding::price_says_a_bit_farther();
    var_0 = getent( "price_placement_trigger", "targetname" );

    for (;;)
    {
        common_scripts\utility::_id_3857( "price_picked_up" );

        if ( level._id_6F7C istouching( var_0 ) )
            break;

        if ( distance( level._id_6F7C.origin, maps\sniperescape_code::price_fair_defendspot() ) <= level.price_gnoll_dist )
            break;

        common_scripts\utility::_id_384A( "price_picked_up" );
    }

    common_scripts\utility::_id_383F( "price_is_put_down_near_wheel" );
    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "putdown" ) );
    soundscripts\_snd::_id_870C( "clear_carrying_mix" );
    thread fairgrounds_prep_objective();
    thread fairgrounds_after_prep();
}

fairgrounds_prep_objective()
{
    objective_add( maps\sniperescape_wounding::getobj( "prep" ), "active", &"SNIPERESCAPE_PREP_AREA_FOR_FIGHT" );
    objective_current( maps\sniperescape_wounding::getobj( "prep" ) );
    level waittill( "prep_complete" );
    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "prep" ) );
}

fairgrounds_after_prep()
{
    common_scripts\utility::_id_383F( "price_moves_to_position" );
    common_scripts\utility::_id_3831( "can_manage_price" );
    common_scripts\utility::_id_383F( "fair_hold_fire" );
    common_scripts\utility::_id_383F( "price_can_be_left" );
    common_scripts\utility::_id_383F( "first_pickup" );
    common_scripts\utility::_id_3831( "price_calls_out_enemy_location" );
    var_0 = getentarray( "chase_chopper_spawner", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, maps\sniperescape_code::fairground_enemies );
    maps\_utility::_id_1143( "the_fairgrounds" );
    wait 2;
    maps\sniperescape_code::sniper_escape_initial_secondary_weapon_loadout();

    if ( level._id_3BFE <= 1 )
        maps\sniperescape_code::max_ammo_on_legit_sniper_escape_weapon();

    if ( getdvar( "claymore_hint" ) == "" )
    {
        setdvar( "claymore_hint", "claymore" );
        var_1 = level.playercardbackground maps\_utility::_id_4088();

        if ( var_1 )
        {
            if ( var_1 < 9 )
                thread maps\sniperescape_code::price_line( "take_my_claymores" );
            else
                thread maps\sniperescape_code::price_line( "use_claymores" );

            level.playercardbackground thread maps\_utility::_id_2B4A( "claymore_plant" );
            wait 4;
        }
    }
    else if ( getdvar( "claymore_hint" ) == "claymore" )
    {
        setdvar( "claymore_hint", "c4" );
        level.playercardbackground thread maps\sniperescape_code::c4_hint();
    }

    thread maps\sniperescape_code::price_line( "find_a_good_snipe" );
    thread maps\sniperescape_code::price_line( "i_will_signal_in_30" );
    wait 4;
    var_1 = level.playercardbackground maps\_utility::_id_4088();
    maps\sniperescape_wounding::wait_for_player_to_place_claymores();

    if ( maps\sniperescape_wounding::autosave_on_good_claymore_placement( var_1 ) )
    {

    }

    level notify( "prep_complete" );
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_HOLD_OUT_UNTIL_EVAC", level._id_6F7C.origin );
    objective_current( maps\sniperescape_wounding::getobj( "holdout" ) );
    maps\sniperescape_code::price_line( "activated_beacon" );
    wait 2.2;
    thread maps\sniperescape_code::price_line( "have_a_fix" );
    common_scripts\utility::_id_383F( "beacon_placed" );
    var_2 = getent( "price_putdown_hint_trigger", "targetname" );
    var_2 delete();
    thread maps\sniperescape_code::fairground_battle();
    thread seaknight_flies_in( 0 );
    wait 1;
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_SEAKNIGHT_INCOMING", level.seaknight.origin );
    objective_additionalcurrent( maps\sniperescape_wounding::getobj( "holdout" ) );
    objective_icon( maps\sniperescape_wounding::getobj( "holdout" ), "objective_heli" );
    thread maps\sniperescape_code::update_seaknight_objective_pos( maps\sniperescape_wounding::getobj( "holdout" ) );
}

start_seaknight()
{
    soundscripts\_snd::_id_870C( "start_seaknight_checkpoint" );
    thread _id_5FFB();
    common_scripts\utility::_id_383F( "price_can_be_left" );
    common_scripts\utility::_id_383F( "first_pickup" );
    common_scripts\utility::_id_383F( "faiground_battle_begins" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 8 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_gnoll", "targetname" );
    level.playercardbackground setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level._id_6F7C _meth_81c9( var_3.origin, var_3.angles );
    maps\sniperescape_wounding::plant_price();
    level.playercardbackground setplayerangles( var_2.angles );
    level.playercardbackground setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    common_scripts\utility::_id_383F( "player_enters_fairgrounds" );
    thread seaknight_flies_in( 1 );
    wait 1;
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_SEAKNIGHT_INCOMING", level.seaknight.origin );
    objective_additionalcurrent( maps\sniperescape_wounding::getobj( "holdout" ) );
    objective_icon( maps\sniperescape_wounding::getobj( "holdout" ), "objective_heli" );
    thread maps\sniperescape_code::update_seaknight_objective_pos( maps\sniperescape_wounding::getobj( "holdout" ) );
}

seaknight_flies_in( var_0 )
{
    var_1 = "seaknight_normal";

    if ( level._id_3BFE >= 1 )
        var_1 = "seaknight_hard";

    var_2 = maps\_vehicle::_id_8979( var_1 );
    level.seaknight = var_2;
    thread seaknight_pilot();

    if ( !var_0 )
        var_2 waittill( "reached_dynamic_path_end" );

    var_3 = getent( "seaknight_landing", "targetname" );
    var_4 = var_2;
    var_2 = var_2 maps\_vehicle::_id_9D58();
    var_2 setmodel( "vehicle_ch46e_opened_door_interior_a" );
    var_5 = spawn( "script_model", var_2 gettagorigin( "body_animate_jnt" ) );
    var_5 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_5.angles = var_2.angles;
    var_5 linkto( var_2, "body_animate_jnt" );
    var_6 = spawn( "script_model", var_2 gettagorigin( "body_animate_jnt" ) );
    var_6 setmodel( "vehicle_ch46e_wires" );
    var_6.angles = var_2.angles;
    var_6 linkto( var_2, "body_animate_jnt" );

    if ( level._id_8C36 == "seaknight" )
    {
        var_2 thread maps\_debug::_id_2DE8( "tag_detach" );
        var_2 thread maps\_debug::_id_2DE8( "tag_origin" );
        var_2 thread maps\_debug::_id_2DDF();
    }

    var_2._id_0C72 = "seaknight";
    var_2 thread maps\_vehicle_code::_id_7611();
    common_scripts\utility::_id_383F( "seaknight_flies_in" );
    level.seaknight = var_2;
    var_2 thread maps\sniperescape_code::seaknight_badplace();
    var_2 maps\_utility::_id_0D61();
    var_7 = getent( "seaknight_collmap", "targetname" );
    var_7 linkto( var_2, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight );
    var_2 thread maps\sniperescape_wounding::seaknight_sound();
    var_8 = getent( "seaknight_trigger", "targetname" );
    var_8 thread maps\_utility::_id_5972( var_7 );
    var_9 = getent( "seaknight_death_trigger", "targetname" );
    var_9 thread maps\_utility::_id_5972( var_2 );
    var_9 thread maps\_vehicle::heli_squashes_stuff( "seaknight_lands" );
    var_2 thread spawn_seaknight_crew();
    var_3 maps\_anim::_id_0C24( var_2, "landing" );
    common_scripts\utility::_id_383F( "seaknight_lands" );
    thread maps\sniperescape_code::fairbattle_autosave();
    thread maps\sniperescape_wounding::player_becomes_invul_on_pickup();
    thread maps\sniperescape_code::price_line( "heli_at_the_lz" );
    var_10 = 60;
    thread maps\sniperescape_wounding::seaknight_leaving_warning( var_10 );
    common_scripts\utility::_id_3831( "can_save" );
    maps\_utility::_id_0761( "axis", maps\sniperescape_wounding::_id_60FD );
    var_11 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_11, maps\_utility::_id_7E52, 0 );
    var_3 thread maps\_anim::_id_0BE1( var_2, "idle", undefined, "stop_idle" );
    var_9 delete();
    maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "holdout" ) );
    var_12 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_12.origin = var_2 gettagorigin( "tag_door_rear" );
    var_12.rank = 27.7311;
    objective_add( maps\sniperescape_wounding::getobj( "seaknight" ), "active", &"SNIPERESCAPE_GET_CPT_MACMILLAN_TO", var_12.origin );
    objective_current( maps\sniperescape_wounding::getobj( "seaknight" ) );
    common_scripts\utility::_id_383F( "can_manage_price" );
    thread maps\sniperescape_wounding::player_abandons_seaknight_protection();
    thread maps\sniperescape_wounding::player_boards_seaknight( var_2, var_12 );
    maps\_utility::_id_27EF( var_10, common_scripts\utility::_id_383F, "seaknight_leaves_prematurely" );
    maps\sniperescape_wounding::wait_for_seaknight_to_take_off();

    if ( common_scripts\utility::_id_382E( "player_made_it_to_seaknight" ) )
    {
        wait 5;
        thread bring_in_heli_spawners();
    }

    common_scripts\utility::_id_383F( "seaknight_prepares_to_leave" );

    if ( !common_scripts\utility::_id_382E( "player_made_it_to_seaknight" ) )
    {
        wait 1.5;
        thread maps\_hud_util::_id_35DC( 1.5 );
        setdvar( "ui_deadquote", &"SNIPERESCAPE_YOU_FAILED_TO_REACH_THE" );
        maps\_utility::_id_5CDF();
    }

    wait 12;
    var_3 notify( "stop_idle" );
    common_scripts\utility::_id_383F( "seaknight_leaves" );
    var_7 delete();
    var_3 thread maps\_anim::_id_0C24( var_2, "take_off" );

    if ( common_scripts\utility::_id_382E( "player_made_it_to_seaknight" ) )
    {
        wait 2.5;
        common_scripts\utility::_id_3831( "aa_seaknight_rescue" );
        wait 2;

        if ( isalive( level.playercardbackground ) )
            maps\_utility::_id_62EC( maps\sniperescape_wounding::getobj( "seaknight" ) );

        return;
    }
}

_id_3137( var_0 )
{
    maps\_utility::_id_60D6();
}

bring_in_heli_spawners()
{
    wait 6;
    maps\_utility::_id_735B( "axis", maps\sniperescape_wounding::no_accuracy );
    level notify( "stop_having_low_accuracy" );
    var_0 = getentarray( "heli_chaser_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::heli_chaser_think );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_88C3 );
    badplace_delete( "seaknight_badplace" );
}

heli_chaser_think()
{
    self endon( "death" );
    self.ignoreforfixednodesafecheck = 1;
    self waittill( "goal" );
    self.ignoreforfixednodesafecheck = 0;
}

spawn_seaknight_crew()
{
    var_0 = getentarray( "seaknight_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::seaknight_defender );
    var_1 = self gettagorigin( "tag_detach" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3].origin = var_1;
        var_4 = var_0[var_3] stalingradspawn();
        var_4._id_0C72 = "guy" + ( var_3 + 1 );
        var_2[var_2.size] = var_4;
    }

    thread maps\_anim::_id_0BC5( var_2, "unload", "tag_detach" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] linkto( self, "tag_detach" );
        var_2[var_3].attackeraccuracy = 0;
    }

    common_scripts\utility::_id_384A( "seaknight_lands" );
    common_scripts\utility::_id_0D13( var_2, maps\_utility::_id_7C82, "stop_first_frame" );
    maps\_anim::_id_0C18( var_2, "unload", "tag_detach" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] unlink();

    common_scripts\utility::_id_384A( "player_putting_down_price_seaknight" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] linkto( self, "tag_detach" );
        var_2[var_3] maps\_utility::_id_08EB();
    }

    thread maps\_anim::_id_0C18( var_2, "load", "tag_detach" );
    wait 0.05;
    maps\_anim::_id_0C11( var_2, "load", 0 );
    common_scripts\utility::_id_384A( "seaknight_prepares_to_leave" );
    maps\_anim::_id_0C11( var_2, "load", 1 );
    common_scripts\utility::_id_0D13( var_2, ::seaknight_guys_cleanup );
    common_scripts\utility::_id_384A( "player_made_it_to_seaknight" );
    common_scripts\utility::_id_384A( "seaknight_leaves" );
}

seaknight_guys_cleanup()
{
    self waittillmatch( "single anim", "end" );
    maps\_utility::_id_8EA4();
    self delete();
}

seaknight_pilot()
{
    if ( isdefined( level.seaknight._id_0DF4[0] ) )
        level.seaknight._id_0DF4[0] setmodel( "body_force_assault_pilot_woodland" );
}

seaknight_defender()
{
    thread maps\_utility::_id_58D7();
    self setthreatbiasgroup( "price" );
    self _meth_81ce( "crouch" );
    wait 1;
    self.a._id_6E5A = "crouch";
    self waittillmatch( "single anim", "end" );
    self _meth_81aa( self.origin );
    self.goalradius = 16;
}

h1_set_up_mac_run_rappel()
{
    level.scripted_node_mac_run_rappel = spawn( "script_origin", ( 630.813, -11560.4, 998.389 ) );
    level.rappel_chair = maps\_utility::_id_88D1( "rappel_chair" );
    level.scripted_node_mac_run_rappel maps\_anim::_id_0BC7( level.rappel_chair, "run_to_rappel" );
}

h1_handle_mac_run_past_chair()
{
    level endon( "player_rappels" );

    if ( !isdefined( level.scripted_node_mac_run_rappel ) )
        h1_set_up_mac_run_rappel();

    var_0 = [];
    var_0[var_0.size] = level._id_6F7C;
    var_0[var_0.size] = level.rappel_chair;
    var_1 = getent( "rappel_run_chair_clip", "targetname" );
    var_1 notsolid();
    level.scripted_node_mac_run_rappel thread maps\_anim::_id_0C18( var_0, "run_to_rappel" );
    level.rappel_chair waittillmatch( "single anim", "chair_out" );
    var_1 thread activate_chair_clip();
    level._id_6F7C waittillmatch( "single anim", "end" );
}

set_combat_ads_lods_at_rappel()
{
    common_scripts\utility::_id_384A( "player_rappels" );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
}
