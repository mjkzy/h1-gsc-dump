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
#using_animtree("generic_human");

main()
{
    if ( !level.sniperescape_fastload )
    {
        maps\_props::add_smoking_notetracks( "generic" );
        maps\_props::add_cellphone_notetracks( "generic" );
    }

    level._id_78B5["stone_block_1"] = "me_stone_block01";
    level._id_78B5["stone_block_2"] = "me_stone_block02";
    level._id_78B5["stone_block_3"] = "me_stone_block03";
    level._id_78AC["price"]["run_to_rappel"] = %h1_sniper_escape_macmillan_run_to_rappel;
    level._id_78AC["price"]["rappel_end"] = %sniper_escape_rappel_finish;
    level._id_78AC["price"]["rappel_start"] = %sniper_escape_rappel_start;
    level._id_78AC["price"]["rappel_idle"][0] = %sniper_escape_rappel_idle;
    level._id_78AC["dead_guy"]["pool_death"] = %exposed_death_nerve;
    level._id_78B1["dead_guy"] = #animtree;
    level._id_78BA["price"]["rappel_start"] = "sniperescape_mcm_shortcut";
    level._id_78AC["generic"]["pilot_idle_ff"] = %helicopter_pilot1_idle;
    level._id_78AC["price"]["smooth_door_open_init"] = %hunted_open_barndoor_stop;
    level._id_78AC["price"]["smooth_door_open"] = %hunted_open_barndoor_flathand;
    level._id_78AC["price"]["chopper_point"] = %h1_sniper_escape_macmillan_chopper_point;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "chopper_point", "sniperescape_mcm_incomingheli" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level._id_78AC["price"]["precrash_idle"][0] = %sniper_escape_crash_macmillan_aim;
        level._id_78AC["price"]["fire_idle"][0] = %sniper_escape_crash_macmillan_fire;
        level._id_78AC["price"]["fire_idle"][1] = %sniper_escape_crash_macmillan_aim;
        level._id_78AC["price"]["crash"] = %sniper_escape_crash_macmillan_runaway;
        level._id_78AC["price"]["crash_idle"][0] = %sniper_escape_crash_macmillan_wounded_idle;
    }
    else
    {
        level._id_78AC["price"]["precrash_idle"][0] = %h1_sniper_escape_crash_macmillan_aim;
        level._id_78AC["price"]["fire_idle"][0] = %h1_sniper_escape_crash_macmillan_fire;
        level._id_78AC["price"]["fire_idle"][1] = %h1_sniper_escape_crash_macmillan_aim;
        level._id_78AC["price"]["crash"] = %h1_sniper_escape_crash_macmillan_runaway;
        level._id_78AC["price"]["crash_idle"][0] = %h1_sniper_escape_crash_macmillan_wounded_idle;
    }

    level._id_78AC["generic"]["pilot_idle"][0] = %helicopter_pilot1_idle;
    level._id_78AC["generic"]["pilot_idle"][1] = %helicopter_pilot1_twitch_clickpannel;
    level._id_78AC["generic"]["pilot_idle"][2] = %helicopter_pilot1_twitch_lookback;
    level._id_78AC["generic"]["pilot_idle"][3] = %helicopter_pilot1_twitch_lookoutside;
    level._id_78AC["generic"]["gunner_idle"][0] = %helicopter_pilot2_idle;
    level._id_78AC["generic"]["gunner_idle"][1] = %helicopter_pilot2_twitch_clickpannel;
    level._id_78AC["generic"]["gunner_idle"][2] = %helicopter_pilot2_twitch_radio;
    level._id_78AC["generic"]["gunner_idle"][3] = %helicopter_pilot2_twitch_lookoutside;
    level._id_78AC["zakhaev"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_front;
    level._id_78AC["zakhaev"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_back;
    level._id_78AC["zakhaev"]["run"] = %unarmed_run_russian;
    level._id_78AC["zakhaev"]["exchange"] = %sniper_escape_meeting_zakhaev;
    level._id_78AC["guard"]["exchange"] = %sniper_escape_meeting_guard;
    level._id_78AC["dealer"]["exchange"] = %sniper_escape_meeting_dealer;
    level._id_78AC["guard"]["exchange_idle"][0] = %sniper_escape_meeting_guard_idle;
    level._id_78AC["dealer"]["exchange_idle"][0] = %sniper_escape_meeting_dealer_idle;
    maps\_anim::addnotetrack_flag( "zakhaev", "zak_front", "zak_is_facing_player", "exchange" );
    maps\_anim::addnotetrack_flag_clear( "zakhaev", "zak_back", "zak_is_facing_player", "exchange" );
    level._id_78AC["price"]["spin"] = %combatwalk_f_spin;
    level._id_78AC["price"]["halt"] = %stand_exposed_wave_halt_v2;
    level._id_78AC["price"]["wounded_turn_left"] = %sniper_escape_price_turn_l;
    level._id_78AC["price"]["wounded_turn_right"] = %sniper_escape_price_turn_r;
    level._id_78AC["price"]["spotter_exit"] = %sniper_escape_spotter_exit;
    level._id_78AC["price"]["spotter_idle"][0] = %sniper_escape_spotter_idle;
    level._id_78AC["price"]["spotter_wave"] = %sniper_escape_spotter_wave;
    level._id_78AC["price"]["intro_spotter"] = %sniper_escape_macmillanintro_macmillan;
    level._id_78AC["price"]["behind_turn"] = %h1_exposed_stand_180_l;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "wounded_begins", "sniperescape_mcm_choppergetback" );
    level._id_78AC["price"]["wounded_begins"] = %sniper_escape_price_hit;
    level._id_78AC["price"]["wounded_idle_reach"] = %sniper_escape_price_hit_idle;
    level._id_78AC["price"]["wounded_idle"][0] = %sniper_escape_price_hit_idle;
    level._id_78AC["price"]["wounded_idleweight"][0] = 100;
    level._id_78AC["price"]["wounded_idle"][1] = %sniper_escape_price_hit_idle;
    level._id_78AC["price"]["wounded_idleweight"][1] = 35;
    level._id_78AC["price"]["wounded_fire"] = %sniper_escape_price_hit_fire;
    level._id_78AC["price"]["wounded_crawl_start"] = %sniper_escape_price_crawl_start;
    level._id_78AC["price"]["wounded_crawl_end"] = %sniper_escape_price_crawl_end;
    level._id_78AC["price"]["wounded_crawl"] = %sniper_escape_price_crawl;
    level._id_78AC["generic"]["stealth_jog"] = %patrol_jog;
    level._id_78AC["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level._id_78AC["price"]["wounded_death"] = %sniper_escape_price_killed;
    level._id_78AC["price"]["wounded_base"] = %wounded_aim;
    level._id_78AC["price"]["wounded_aim_left"] = %sniper_escape_price_aim_l;
    level._id_78AC["price"]["wounded_aim_right"] = %sniper_escape_price_aim_r;
    level._id_78AC["price"]["wounded_carry"][0] = %sniper_escape_price_walk;
    level._id_78AC["player"]["wounded_carry"][0] = %sniper_escape_playerview_walk;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level._id_78AC["price"]["crash_pickup"] = %sniper_escape_crash_pickup_macmillan;
        level._id_78AC["price"]["wounded_pickup"] = %sniper_escape_price_getup;
        level._id_78AC["price"]["wounded_putdown"] = %sniper_escape_price_putdown;
    }
    else
    {
        level._id_78AC["price"]["crash_pickup"] = %h1_sniper_escape_crash_pickup_macmillan;
        maps\_anim::addnotetrack_animsound( "price", "crash_pickup", "start", "h1_macmillan_initial" );
        level._id_78AC["price"]["wounded_pickup"] = %h1_sniper_escape_price_getup;
        level._id_78AC["price"]["wounded_putdown"] = %h1_sniper_escape_price_putdown;
        maps\_anim::addnotetrack_animsound( "price", "wounded_pickup", "start", "h1_macmillan_up" );
        maps\_anim::addnotetrack_animsound( "price", "wounded_putdown", "start", "h1_macmillan_down" );
        level._id_78B1["carry_price"] = #animtree;
        level._id_78B5["carry_price"] = "body_complete_sp_usmc_ghillie_price";
        level._id_78AC["carry_price"]["carry_idle"] = [ %h1_sniper_escape_price_carry_idle ];
        level._id_78AC["carry_price"]["carry_run"] = [ %h1_sniper_escape_price_carry ];
        level._id_78AC["carry_price"]["ladder_on"] = %h1_sniper_escape_price_ladder_takeoff;
        level._id_78AC["carry_price"]["ladder_off"] = %h1_sniper_escape_price_ladder_puton;
    }

    level._id_78AC["price"]["wounded_seaknight_putdown"] = %h1_sniperescape_macmillan_putdown;
    level._id_78AC["price"]["pickup_idle"][0] = %sniper_escape_price_wounded_idle;
    level._id_78AC["generic"]["patrol_look_up"] = %patrol_jog_look_up;
    level._id_78AC["generic"]["patrol_360"] = %patrol_jog_360;
    level._id_78AC["generic"]["patrol_jog"] = %patrol_jog;
    level._id_78AC["generic"]["patrol_orders"] = %patrol_jog_orders;
    level._id_78AC["generic"]["patrol_look_up_once"] = %patrol_jog_look_up_once;
    level._id_78AC["generic"]["patrol_360_once"] = %patrol_jog_360_once;
    level._id_78AC["generic"]["patrol_jog_once"] = %patrol_jog_once;
    level._id_78AC["generic"]["patrol_orders_once"] = %patrol_jog_orders_once;
    level._id_78AC["generic"]["exchange_surprise_zakhaev"] = %unarmed_cowerstand_react;
    level._id_78AC["generic"]["exchange_surprise_0"] = %exposed_idle_reacta;
    level._id_78AC["generic"]["exchange_surprise_1"] = %exposed_idle_reactb;
    level._id_78AC["generic"]["exchange_surprise_2"] = %exposed_idle_twitch;
    level._id_78AC["generic"]["exchange_surprise_3"] = %exposed_idle_twitch_v4;
    maps\_anim::addnotetrack_customfunction( "generic", "ready_to_run", maps\sniperescape_exchange::exchange_ready_to_run );
    level.surprise_anims = 4;
    level._id_78AC["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level._id_78AC["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level._id_78AC["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level._id_78AC["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level._id_78AC["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["sprint"] = %sprint1_loop;
    level._id_78AC["generic"]["prone_dive"] = %hunted_dive_2_pronehide_v1;
    level._id_78AC["generic"]["prone_idle"][0] = %hunted_pronehide_idle_relative;
    level._id_78AC["generic"]["bored_cell_loop"][0] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level._id_78AC["generic"]["bored_idle"][0] = %patrol_bored_idle;
    level._id_78AC["generic"]["bored_idle"][1] = %patrol_bored_twitch_bug;
    level._id_78AC["generic"]["bored_idle"][2] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level._id_78AC["guy1"]["load"] = %ch46_load_1;
    level._id_78AC["guy1"]["unload"] = %ch46_unload_1;
    level._id_78AC["guy2"]["load"] = %ch46_load_2;
    level._id_78AC["guy2"]["unload"] = %ch46_unload_2;
    level._id_78AC["guy3"]["load"] = %ch46_load_3;
    level._id_78AC["guy3"]["unload"] = %ch46_unload_3;
    level._id_78AC["guy4"]["load"] = %ch46_load_4;
    level._id_78AC["guy4"]["unload"] = %ch46_unload_4;
    level._id_78AC["victim"]["shot"] = %h1_helicopter_pilot2_death;
    level._id_78AC["copilot"]["shot"][0] = %h1_helicopter_pilot1_reaction;
    level._id_78AC["makarov"]["talking"] = %dubai_finale_draw_makarov_face;
    level._id_78AC["price"]["crouch"] = %exposed_stand_2_crouch;
    level._id_78B9["incoming_helicopter"] = "sniperescape_mcm_incomingheli";
    level._id_78B9["hit_the_rotor"] = "sniperescape_mcm_hittherotor";
    level._id_78B9["shoot_the_helicopter"] = "sniperescape_mcm_downtogether";
    level._id_78B9["fire_fire"] = "sniperescape_mcm_firefire";
    level._id_78B9["goodnight_ya_bastard"] = "sniperescape_mcm_goodnight";
    level._id_78B9["aw_shite"] = "sniperescape_mcm_run";
    level._id_78B9["ahh_crap"] = "sniperescape_mcm_run";
    level._id_78B9["cant_move_1"] = "sniperescape_mcm_cantmove";
    level._id_78B9["cant_move_2"] = "sniperescape_mcm_cantmove";
    level._id_78B9["cant_move_3"] = "sniperescape_mcm_cantmove";
    maps\_anim::addnotetrack_customfunction( "price", "fire", maps\sniperescape_code::price_fires, "wounded_fire" );
    level._id_78B9["transport_sighted"] = "sniperescape_mcm_enemysighted";
    level._id_78B9["get_on_barrett"] = "sniperescape_mcm_getonbarrett";
    level._id_78B9["remember_my_teaching"] = "sniperescape_mcm_corioliseffect";
    level._id_78B9["prepare_for_ranging"] = "sniperescape_mcm_prepranging";
    level._id_78B9["white_truck"] = "sniperescape_mcm_whitetruck";
    level._id_78B9["range_to_bmp"] = "sniperescape_mcm_bmprange";
    level._id_78B9["table_with_case"] = "sniperescape_mcm_table";
    level._id_78B9["i_see_him"] = "sniperescape_mcm_mymark";
    level._id_78B9["target_acquired"] = "sniperescape_mcm_positiveid";
    level._id_78B9["where_did_he_come_from"] = "sniperescape_mcm_clearshot";
    level._id_78B9["wind_picked_up"] = "sniperescape_mcm_eyeonflag";
    level._id_78B9["take_the_shot"] = "sniperescape_mcm_taketheshot";
    level._id_78B9["did_you_take_him_out"] = "sniperescape_mcm_armflyoff";
    level._id_78B9["take_out_that_heli"] = "sniperescape_mcm_buysometime";
    level._id_78B9["great_shot_now_go"] = "sniperescape_mcm_greatshot";
    level._id_78B9["compromised"] = "sniperescape_mcm_comrpomised";
    level._id_78B9["eta_20_min"] = "sniperescape_hqr_stretchingourfuel";
    level._id_78BA["price"]["follow_me"] = "sniperescape_mcm_followme";
    level._id_78B9["head_for_extract"] = "sniperescape_mcm_headforpoint";
    level._id_78BA["price"]["more_behind"] = "sniperescape_mcm_morebehind";
    level._id_78BA["price"]["bushes_north"] = "sniperescape_mcm_bushesnorth";
    level._id_78BA["price"]["bushes_northwest"] = "sniperescape_mcm_bushesNW";
    level._id_78BA["price"]["woods_north"] = "sniperescape_mcm_inthewoods";
    level._id_78BA["price"]["woods_northeast"] = "sniperescape_mcm_woodsNE";
    level._id_78BA["price"]["woods_east"] = "sniperescape_mcm_woodseast";
    level._id_78BA["price"]["woods_southeast"] = "sniperescape_mcm_inthewoods";
    level._id_78BA["price"]["woods_south"] = "sniperescape_mcm_woodssouth";
    level._id_78BA["price"]["woods_southwest"] = "sniperescape_mcm_woodsSW";
    level._id_78BA["price"]["woods_west"] = "sniperescape_mcm_inthewoods";
    level._id_78BA["price"]["woods_northwest"] = "sniperescape_mcm_inthewoods";
    level._id_78BA["price"]["bushes_west"] = "sniperescape_mcm_busheswest";
    level._id_78BA["price"]["enemies_north"] = "sniperescape_mcm_comingnorth";
    level._id_78BA["price"]["enemies_northeast"] = "sniperescape_mcm_movementNE";
    level._id_78BA["price"]["enemies_east"] = "sniperescape_mcm_tangoseast";
    level._id_78BA["price"]["enemies_southeast"] = "sniperescape_mcm_targetsSE";
    level._id_78BA["price"]["enemies_south"] = "sniperescape_mcm_morefromsouth";
    level._id_78BA["price"]["enemies_southwest"] = "sniperescape_mcm_contactSW";
    level._id_78BA["price"]["enemies_west"] = "sniperescape_mcm_hostileswest";
    level._id_78BA["price"]["enemies_northwest"] = "sniperescape_mcm_tangosNW";
    level._id_78BA["price"]["lose_them_in_apartment"] = "sniperescape_mcm_apartmentcomeon";
    level._id_78BA["price"]["place_claymore"] = "sniperescape_mcm_plantclaymore";
    level._id_78BA["price"]["standby"] = "sniperescape_mcm_standby";
    level._id_78BA["price"]["now"] = "sniperescape_mcm_now";
    level._id_78BA["price"]["im_hit"] = "sniperescape_mcm_imhit";
    level._id_78BA["price"]["carry_me"] = "sniperescape_mcm_sorrymate";
    level._id_78B9["put_me_down_1"] = "sniperescape_mcm_coveryou";
    level._id_78B9["put_me_down_2"] = "sniperescape_mcm_oisit";
    level._id_78B9["put_me_down_quick"] = "sniperescape_mcm_fightback";
    level._id_78BA["price"]["dont_go_far"] = "sniperescape_mcm_toofarahead";
    level._id_78B9["extraction_is_southwest"] = "sniperescape_mcm_makeithurry";
    level._id_78BA["price"]["got_one"] = "sniperescape_mcm_gotone";
    level._id_78BA["price"]["tango_down"] = "sniperescape_mcm_tangodown";
    level._id_78BA["price"]["he_is_down"] = "sniperescape_mcm_hesdown";
    level._id_78BA["price"]["got_another"] = "sniperescape_mcm_gotanother";
    level._id_78BA["price"]["got_him"] = "sniperescape_mcm_gothim";
    level._id_78BA["price"]["target_neutralized"] = "sniperescape_mcm_targetneutralized";
    level._id_78BA["price"]["head_for_apartment"] = "sniperescape_mcm_headforapartment";
    level._id_78B9["almost_there"] = "sniperescape_mcm_otherside";
    level._id_78BA["price"]["transport_inbound"] = "sniperescape_mcm_enemysighted";
    level._id_78BA["price"]["cut_through_woods"] = "sniperescape_mcm_cutthruwoods";
    level._id_78BA["price"]["extract_southwest"] = "sniperescape_mcm_makeithurry";
    level._id_78B9["head_for_apartment"] = "sniperescape_mcm_headforapartment";
    level._id_78BA["price"]["alright_go"] = "sniperescape_mcm_alrightgo";
    level._id_78BA["price"]["get_ready"] = "sniperescape_mcm_getready";
    level._id_78BA["price"]["go!"] = "sniperescape_mcm_go";
    level._id_78BA["price"]["come_on_lets_go"] = "sniperescape_mcm_comeon";
    level._id_78BA["price"]["time_to_move"] = "sniperescape_mcm_timetomove";
    level._id_78BA["price"]["spotter_exit"] = "sniperescape_mcm_timetomove";
    level._id_78B9["sweep_the_rooms"] = "sniperescape_mcm_putmedown";
    level._id_78BA["price"]["put_down_1"] = "sniperescape_mcm_easydoesit";
    level._id_78BA["price"]["put_down_2"] = "sniperescape_mcm_easynow";
    level._id_78BA["price"]["put_down_3"] = "sniperescape_mcm_careful";
    level._id_78BA["price"]["lets_get_moving_1"] = "sniperescape_mcm_givemealift";
    level._id_78BA["price"]["lets_get_moving_2"] = "sniperescape_mcm_intheclear";
    level._id_78BA["price"]["good_sniping_position"] = "sniperescape_mcm_snipingposition";
    level._id_78B9["new_put_me_down_1"] = "sniperescape_mcm_enemytroops";
    level._id_78B9["new_put_me_down_2"] = "sniperescape_mcm_closingin";
    level._id_78B9["new_put_me_down_3"] = "sniperescape_mcm_tangosfast";
    level._id_78B9["new_put_me_down_4"] = "sniperescape_mcm_movingin";
    level._id_78B9["find_good_spot"] = "sniperescape_mcm_findgoodspot";
    level._id_78B9["waiting_for_signal"] = "sniperescape_hp1_yoursignal";
    level._id_78B9["find_sniping_spot"] = "sniperescape_mcm_overrunlz";
    level._id_78B9["use_claymores"] = "sniperescape_mcm_claymores";
    level._id_78B9["find_spot_go_prone"] = "sniperescape_mcm_goprone";
    level._id_78B9["activated_beacon"] = "sniperescape_mcm_beacon";
    level._id_78B9["have_a_fix"] = "sniperescape_hp1_hangtight";
    level._id_78B9["let_them_get_closer"] = "sniperescape_mcm_getcloser";
    level._id_78B9["standby_to_engage"] = "sniperescape_mcm_standbyengage";
    level._id_78B9["open_fire"] = "sniperescape_mcm_openfire";
    level._id_78B9["where_is_he"] = "sniperescape_sas2_wheresmac";
    level._id_78B9["heli_at_the_lz"] = "sniperescape_hp1_atthelz";
    level._id_78B9["heli_got_thirty_seconds"] = "sniperescape_hp1_bingofuel";
    level._id_78B9["heli_goodbye"] = "sniperescape_hp1_toolow";
    level._id_78BA["price"]["gotta_go_1"] = "sniperescape_mcm_leftbehind";
    level._id_78BA["price"]["gotta_go_2"] = "sniperescape_mcm_outoftime";
    level._id_78BA["price"]["gotta_go_3"] = "sniperescape_mcm_gettrapped";
    level._id_78BA["price"]["gotta_go_4"] = "sniperescape_mcm_gettolz";
    level._id_78BA["price"]["gotta_go_5"] = "sniperescape_mcm_keepmoving";
    level._id_78BA["price"]["gotta_go_6"] = "sniperescape_mcm_wastingtime";
    level._id_78BA["price"]["gotta_go_7"] = "sniperescape_mcm_gottogo";
    level._id_78BA["price"]["gotta_go_8"] = "sniperescape_mcm_coverrear";
    level._id_78BA["price"]["gotta_go_9"] = "sniperescape_mcm_coverback";
    level._id_78BA["price"]["gotta_go_10"] = "sniperescape_mcm_forgetit";
    level._id_78BA["price"]["fifteen_minutes"] = "sniperescape_mcm_15mins";
    level._id_78BA["price"]["ten_minuets"] = "sniperescape_mcm_10mins";
    level._id_78BA["price"]["eight_minutes"] = "sniperescape_mcm_8mins";
    level._id_78BA["price"]["six_minutes"] = "sniperescape_mcm_6mins";
    level._id_78BA["price"]["five_minutes"] = "sniperescape_mcm_5mins";
    level._id_78BA["price"]["wait_make_sure"] = "sniperescape_mcm_makesureclear";
    level._id_78BA["price"]["signal_transport"] = "sniperescape_mcm_signaltransport";
    level._id_78BA["price"]["put_down_behind_wheel"] = "sniperescape_mcm_snipersupport";
    level._id_78BA["price"]["this_is_fine"] = "sniperescape_mcm_thisllbefine";
    level._id_78BA["price"]["a_bit_farther_north"] = "sniperescape_mcm_getaclearshot";
    level._id_78BA["price"]["over_to_that_hill"] = "sniperescape_mcm_clearview";
    level._id_78BA["price"]["find_a_good_snipe"] = "sniperescape_mcm_enterthisarea";
    level._id_78BA["price"]["i_will_signal_in_30"] = "sniperescape_mcm_thirtysec";
    level._id_78BA["price"]["prep_the_killzone"] = "sniperescape_mcm_prepkillzone";
    level._id_78BA["price"]["helicopter_is_standing_by"] = "sniperescape_mcm_safedistance";
    level._id_78BA["price"]["move_me"] = "sniperescape_mcm_betterposition";
    level._id_78BA["price"]["check_your_compass"] = "sniperescape_mcm_checkcompass";
    level._id_78BA["price"]["pick_me_up_and_move_me"] = "sniperescape_mcm_pickupnorth";
    level._id_78BA["price"]["a_bit_farther_north_2"] = "sniperescape_mcm_farthernorth";
    level._id_78BA["price"]["over_there_behind_ferris_wheel"] = "sniperescape_mcm_behindferris";
    level.heli_flag["cant_pick_up_price"] = "near_pool";
    level._id_78BA["heli"]["near_pool"] = "sniperescape_rul_nearpool";
    level.heli_flag["player_abandon_protection"] = "amusement_park";
    level._id_78BA["heli"]["amusement_park"] = "sniperescape_rul_amusementpk";
    level.heli_flag["start_heat_spawners"] = "hotel_police";
    level._id_78BA["heli"]["hotel_police"] = "sniperescape_rul_hotelpolissa";
    level.heli_flag["stop_east_spawners"] = "cut_exits";
    level._id_78BA["heli"]["cut_exits"] = "sniperescape_rul_cutoffexits";
    level.heli_flag["enter_burnt"] = "snipers_in_area";
    level._id_78BA["heli"]["snipers_in_area"] = "sniperescape_rul_snipersinarea";
    level.heli_flag["to_the_pool"] = "south_of_city";
    level._id_78BA["heli"]["south_of_city"] = "sniperescape_rul_southofcity";
    level.heli_flag["player_leaves_price_wounding"] = "cover_woods";
    level._id_78BA["heli"]["cover_woods"] = "sniperescape_rul_coverwoods";
    level.heli_flag["plant_claymore"] = "move_move";
    level._id_78BA["heli"]["move_move"] = "sniperescape_rul_movemove";
    level._id_78B9["plant_claymore_by_door"] = "sniperescape_mcm_bydoor";
    level._id_78B9["enemy_left_flank"] = "snescape_mcm_movinglt";
    level._id_78B9["enemy_right_flank"] = "snescape_mcm_movingrt";
    level._id_78B9["enemy_left_flank_2"] = "snescape_mcm_ltflank";
    level._id_78B9["enemy_right_flank_2"] = "snescape_mcm_rtflank";
    level._id_78B9["went_wide"] = "snescape_mcm_wentwide";
    level._id_78B9["target_still_standing"] = "snescape_mcm_stillstand";
    level._id_78B9["target_down_1"] = "snescape_mcm_wegothim";
    level._id_78B9["target_down_2"] = "snescape_mcm_shock";
    level._id_78B9["target_down_3"] = "snescape_mcm_niceshotlt";
    level._id_78B9["now_or_never"] = "snescape_mcm_nownever";
    level._id_78B9["pickup_breathing"] = "sniperescape_mcm_breathing";
    level._id_78B9["take_my_claymores"] = "snescape_mcm_takemy";
    level._id_78B9["enemy_choppers"] = "snescape_mcm_enemychop";
    level._id_78B9["watch_out_1"] = "snescape_mcm_watchout";
    level._id_78B9["watch_out_2"] = "snescape_mcm_payattention";
    level._id_78B9["where_are_you"] = "sniperescape_mcm_bigbird";
    level._id_78B9["be_there_asap"] = "sniperescape_hp1_holdtight";
    level._id_78B9["are_you_insane"] = "scoutsniper_mcm_youinsane";
    level._id_78B9["scoutsniper_mcm_youdaft"] = "scoutsniper_mcm_youdaft";
    setup_exploder_anims();
    _id_6BD0();
    dog_anims();
    seaknight_anims();
    _id_7A3D();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("player");

_id_6BD0()
{
    level._id_78AC["player_grab_barret"]["grab_barret_idle"][0] = %sniper_escape_macmillanintro_player_idle;
    level._id_78AC["player_grab_barret"]["grab_barret_prep"] = %sniper_escape_macmillanintro_player_idle;
    level._id_78AC["player_grab_barret"]["grab_barret"] = %sniper_escape_macmillanintro_player;
    level._id_78B1["player_grab_barret"] = #animtree;
    level._id_78B5["player_grab_barret"] = "viewhands_player_marines";
    level._id_78AC["player_rappel"]["rappel"] = %sniper_escape_player_rappel;
    level._id_78B1["player_rappel"] = #animtree;
    level._id_78B5["player_rappel"] = "worldbody_h1_sas_woodland_ghillie";
    level._id_78B1["player_carry"] = #animtree;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level._id_78B5["player_carry"] = "viewhands_player_marines";
        level._id_78AC["player_carry"]["crash_pickup"] = %sniper_escape_crash_pickup_player;
        level._id_78AC["player_carry"]["wounded_putdown"] = %sniper_escape_player_putdown;
        level._id_78AC["player_carry"]["wounded_pickup"] = %sniper_escape_player_getup;
        level._id_78AC["player_carry"]["wounded_seaknight_putdown"] = %h1_sniperescape_player_putdown;
    }
    else
    {
        level._id_78B5["player_carry"] = "worldbody_h1_sas_woodland_ghillie";
        level._id_78AC["player_carry"]["crash_pickup"] = %h1_sniper_escape_crash_pickup_player;
        level._id_78B1["wounded_carry"] = #animtree;
        level._id_78B5["wounded_carry"] = "viewhands_player_marines";
        level._id_78AC["wounded_carry"]["wounded_putdown"] = %h1_sniper_escape_player_putdown;
        level._id_78AC["wounded_carry"]["wounded_pickup"] = %h1_sniper_escape_player_getup;
        level._id_78AC["wounded_carry"]["carry_idle"] = [ %h1_sniper_escape_player_carry_idle ];
        level._id_78AC["wounded_carry"]["carry_run"] = [ %h1_sniper_escape_player_carry ];
        maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_right", "sniperescape_plr_footstep_dragR" );
        maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_left", "sniperescape_plr_footstep_dragL" );
        level._id_78AC["wounded_carry"]["ladder_on"] = %h1_sniper_escape_player_ladder_takeoff;
        level._id_78AC["wounded_carry"]["ladder_off"] = %h1_sniper_escape_player_ladder_puton;
        level._id_78AC["wounded_carry"]["wounded_seaknight_putdown"] = %h1_sniperescape_player_putdown;
    }
}
#using_animtree("dog");

dog_anims()
{
    level._id_78AC["dog"]["fence_attack"] = %sniper_escape_dog_fence;
    level._id_78AC["generic"]["dog_food"][0] = %german_shepherd_eating;
    level._id_78AC["generic"]["dog_food_w_sound"][0] = %german_shepherd_eating;
    level._id_78AC["generic"]["dog_food_nonidle"] = %german_shepherd_eating;
    level._id_78BA["generic"]["dog_food_w_sound"][0] = "anml_dog_eating_body";
    maps\_anim::addnotetrack_sound( "dog", "fence", "fence_attack", "fence_smash" );
}
#using_animtree("vehicles");

seaknight_anims()
{
    level._id_78AC["seaknight"]["idle"][0] = %sniper_escape_ch46_idle;
    level._id_78AC["seaknight"]["landing"] = %sniper_escape_ch46_land;
    level._id_78AC["seaknight"]["take_off"] = %sniper_escape_ch46_take_off;
    maps\_anim::addnotetrack_customfunction( "seaknight", "fade", maps\sniperescape::_id_3137, "take_off" );
    maps\_anim::addnotetrack_customfunction( "mi28", "rotor", maps\sniperescape_wounding::rotor_blades );
    maps\_anim::addnotetrack_customfunction( "mi28", "rotor", maps\sniperescape_wounding::rotor_hub );
    level._id_78AC["seaknight"]["rotors"] = %sniper_escape_ch46_rotors;
    level._id_78B1["seaknight"] = #animtree;
    level._id_78AC["mi28"]["entrance"] = %sniper_escape_crash_mi28_entrance;
    level._id_78AC["mi28"]["idle"][0] = %sniper_escape_crash_mi28_idle;
    level._id_78AC["mi28"]["crash"] = %sniper_escape_crash_mi28_crash;
}
#using_animtree("script_model");

_id_7A3D()
{
    level._id_78AC["zak_script_model"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_front;
    level._id_78AC["zak_script_model"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_back;
    level._id_78B1["zak_script_model"] = #animtree;
    level._id_78AC["curtain"]["curtain_right"] = %chechnya_curtain_sway_le;
    level._id_78AC["curtain"]["curtain_left"] = %chechnya_curtain_sway_ri;
    level._id_78B1["curtain"] = #animtree;
    level._id_78B5["curtain"] = "ch_curtain01";
    level._id_78AC["rappel_chair"]["run_to_rappel"] = %h1_sniper_escape_macmillan_run_to_rappel_chair;
    level._id_78B1["rappel_chair"] = #animtree;
    level._id_78B5["rappel_chair"] = "afr_restaurantchair_2";
    level._id_78B1["rope"] = #animtree;
    level._id_78B5["rope"] = "rappelrope100_ri";
    level._id_78AC["player_rope"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level._id_78B1["player_rope"] = #animtree;
    level._id_78B5["player_rope"] = "rappelrope100_le";
    level._id_78AC["player_rope_obj"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level._id_78B1["player_rope_obj"] = #animtree;
    level._id_78B5["player_rope_obj"] = "rappelrope100_le_obj";
    level._id_78AC["rope"]["rappel_end"] = %sniper_escape_rappel_finish_rappelrope100;
    level._id_78AC["rope"]["rappel_start"] = %sniper_escape_rappel_start_rappelrope100;
    level._id_78AC["rope"]["rappel_idle"][0] = %sniper_escape_rappel_idle_rappelrope100;
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_sniperescape_building01_anim"] = %h1_sniperescape_building01_anim;
    level._id_78AC["exploder_script_model"]["h1_sniperescape_building010_anim"] = %h1_sniperescape_building010_anim;
    level._id_78AC["exploder_script_model"]["h1_sniperescape_building011_anim"] = %h1_sniperescape_building011_anim;
    level._id_78AC["exploder_script_model"]["h1_sniperescape_building012_anim"] = %h1_sniperescape_building012_anim;
    level._id_78AC["briefcase"]["exchange"] = %sniper_escape_meeting_briefcase;
    level._id_78B1["briefcase"] = #animtree;
    level._id_78AC["brick"]["exchange"] = %sniper_escape_meeting_briefcase;
    level._id_78B1["brick"] = #animtree;
    level._id_78AC["flag"]["up"] = %sniper_escape_flag_wave_up;
    level._id_78AC["flag"]["down"] = %sniper_escape_flag_wave_down;
    level._id_78B1["flag"] = #animtree;

    if ( !level.sniperescape_fastload )
    {
        level._id_78B5["binocs"] = "weapon_binocular";
        level._id_78B5["flag"] = "prop_car_flag";
        level._id_78B5["brick"] = "com_golden_brick";
        level._id_78B5["briefcase"] = "com_gold_brick_case";
        level._id_78B5["zak_one_arm"] = "body_zakhaev_imran_onearm";
        level._id_78B5["zak_left_arm"] = "spawn_zakhaev_imran_l_arm";
    }

    level._id_78B1["zak_left_arm"] = #animtree;
    level._id_78AC["zak_left_arm"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_arm_front;
    level._id_78AC["zak_left_arm"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_arm_back;
    maps\_anim::addnotetrack_flag( "briefcase", "dust", "briefcase_placed", "exchange" );
    level._id_78B5["tag_gunner"] = "vehicle_mi-28_window_front";
    level._id_78B5["tag_pilot"] = "vehicle_mi-28_window_back";
    level._id_78B5["blade1"] = "vehicle_mi-28_hub";
    level._id_78B5["blade2"] = "vehicle_mi-28_blade1";
    level._id_78B5["blade3"] = "vehicle_mi-28_blade2";
    level._id_78B5["blade4"] = "vehicle_mi-28_blade3";
    level._id_78B5["blade5"] = "vehicle_mi-28_blade4";
    maps\_anim::addnotetrack_customfunction( "blade1", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade2", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade3", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade4", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade5", "blade", maps\sniperescape_wounding::remove_blade );
    level._id_78B1["blade1"] = #animtree;
    level._id_78B1["blade2"] = #animtree;
    level._id_78B1["blade3"] = #animtree;
    level._id_78B1["blade4"] = #animtree;
    level._id_78B1["blade5"] = #animtree;
    level._id_78AC["blade1"]["spin"] = %sniper_escape_crash_mi28_rotor_1;
    level._id_78AC["blade2"]["spin"] = %sniper_escape_crash_mi28_rotor_2;
    level._id_78AC["blade3"]["spin"] = %sniper_escape_crash_mi28_rotor_3;
    level._id_78AC["blade4"]["spin"] = %sniper_escape_crash_mi28_rotor_4;
    level._id_78AC["blade5"]["spin"] = %sniper_escape_crash_mi28_rotor_5;
    level._id_78AC["generic"]["dead_pilot"] = %sniper_escape_crash_mi28_pilot;
    level._id_78AC["generic"]["dead_gunner"] = %sniper_escape_crash_mi28_copilot;
    level._id_78B1["dead_heli_pilot"] = #animtree;
}
#using_animtree("generic_human");

uaz_anims()
{
    var_0 = vehicle_scripts\_uaz::_id_7F23();
    var_0[2]._id_4B63 = %uaz_rear_driver_idle;
    var_0[3]._id_4B63 = %uaz_passenger2_idle;
    var_0[2]._id_3FD2 = %uaz_rear_driver_enter_from_huntedrun;
    var_0[0]._id_4068 = undefined;
    var_0[1]._id_612E = 1;
    var_0[3]._id_4068 = undefined;
    var_0[0].talk = %h1_sniper_escape_flashback_makarov;
    var_0[0].talk_transition = %h1_sniper_escape_flashback_makarov_transition;
    var_0[3].talk = %h1_sniper_escape_flashback_yuri;
    var_0[0].panic = %h1_sniper_escape_flashback_makarov_transition_back;
    var_0[3].panic = %technical_passenger_duck;
    return var_0;
}
#using_animtree("vehicles");

uaz_vehicle_anims( var_0 )
{
    var_0 = vehicle_scripts\_uaz::_id_7EFA( var_0 );
    var_0[2]._id_9CD0 = %uaz_rear_driver_enter_from_huntedrun_door;
    var_0[3]._id_9CD0 = %uaz_passenger2_enter_from_huntedrun_door;
    var_0[2]._id_9CD5 = %uaz_rear_driver_exit_into_run_door;
    return var_0;
}
