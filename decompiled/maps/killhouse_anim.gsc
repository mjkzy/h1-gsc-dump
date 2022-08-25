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

anim_main()
{
    level _id_29E7();
    level._id_78AC["generic"]["jog"] = %combat_jog;
    level._id_78AC["generic"]["walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["generic"]["fast_walk"] = %active_patrolwalk_gundown;
    level._id_78AC["generic"]["casual_killer_jog_A"] = %casual_killer_jog_a;
    level._id_78AC["price"]["reveal"] = %killhouse_sas_price;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "reveal", "killhouse_pri_muppet" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog2", "reveal", "killhouse_pri_cqbtest" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog3", "reveal", "killhouse_pri_runsolo" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog4", "reveal", "killhouse_pri_record19sec" );
    maps\_anim::addnotetrack_customfunction( "price", "dialog5", maps\killhouse::reveal_dialog_ladder, "reveal" );
    level._id_78AC["price"]["reveal_idle"][0] = %killhouse_sas_price_idle;
    level._id_78AC["price"]["debrief_p"] = %h1_killhouse_07_price;
    level._id_78AC["price"]["debrief_idle_s4_b"][0] = %h1_killhouse_07_price_idle;
    level._id_78AC["price"]["price_mask_up"] = %price_mask_up;
    level._id_78AC["price"]["price_mask_outloop"] = %h1_cargoship_price_mask_outloop;
    maps\_anim::addnotetrack_dialogue( "sas1", "dialog", "reveal", "killhouse_sas4_fng" );
    maps\_anim::addnotetrack_dialogue( "sas1", "dialog", "reveal", "killhouse_sas4_goeasy" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "debrief_p", "killhouse_pri_wheelsup" );
    level._id_78AC["sas1"]["reveal"] = %killhouse_sas_1;
    level._id_78AC["sas1"]["reveal_idle"][0] = %killhouse_sas_1_idle;
    level._id_78AC["spectator"]["spectator_idle"][0] = %killhouse_woodland_sas_priceidle;
    level._id_78AC["sas1"]["debrief_S1"] = %h1_killhouse_07_soldier1;
    level._id_78AC["sas1"]["debrief_idle_s1_b"][0] = %h1_killhouse_07_soldier1_idle;
    level._id_78AC["sas2"]["reveal"] = %killhouse_sas_2;
    level._id_78AC["sas2"]["reveal_idle"][0] = %killhouse_sas_2_idle;
    level._id_78AC["sas2"]["debrief_S2"] = %h1_killhouse_07_soldier2;
    level._id_78AC["sas2"]["debrief_idle_s2_b"][0] = %h1_killhouse_07_soldier2_idle;
    level._id_78AC["sas3"]["reveal"] = %killhouse_sas_3;
    level._id_78AC["sas3"]["reveal_idle"][0] = %killhouse_sas_3_idle;
    level._id_78AC["sas3"]["debrief_S3"] = %h1_killhouse_07_soldier3;
    level._id_78AC["sas3"]["debrief_idle_s3_b"][0] = %h1_killhouse_07_soldier3_idle;
    level._id_78AC["price"]["h1_price_before_reveal_idle"][0] = %h1_killhouse_sas_price_intro_idle;
    level._id_78AC["sas1"]["h1_sas1_before_reveal_idle"][0] = %h1_killhouse_sas_1_intro_idle;
    level._id_78AC["sas2"]["h1_sas2_before_reveal_idle"][0] = %h1_killhouse_sas_2_intro_idle;
    level._id_78AC["sas3"]["h1_sas3_before_reveal_idle"][0] = %h1_killhouse_sas_3_intro_idle;
    level._id_78AC["generic"]["chair_typing"] = %h1_killhouse_laptopguy_generic_typing;
    level._id_78AC["generic"]["chair_typing_variation"] = %h1_killhouse_laptopguy_typing_variation;
    level._id_78AC["generic"]["chair_typing_pause"] = %h1_killhouse_laptopguy_pause_think;
    level._id_78AC["generic"]["chair_nod_01"] = %h1_killhouse_laptopguy_head_nod_01;
    level._id_78AC["generic"]["chair_nod_02"] = %h1_killhouse_laptopguy_head_nod_02;
    level._id_78AC["generic"]["guy_chair_turnaround"] = %h1_killhouse_laptopguy_turnaround;
    level._id_78AC["generic"]["guy_chair_counting"] = %h1_killhouse_laptopguy_counting;
    level._id_78AC["generic"]["guy_inventory_idle01"][0] = %h1_killhouse_inventory_idle01;
    level._id_78AC["generic"]["guy_inventory_idle02"][0] = %h1_killhouse_inventory_idle02;
    level._id_78AC["generic"]["guy_inventory_lookback"][0] = %h1_killhouse_inventory_lookback;
    level._id_78AC["generic"]["patrol_walk_unarmed"] = %patrol_unarmed_walk;
    level._id_78BA["generic"]["chair_typing"] = "npc_generic_typing";
    level._id_78BA["generic"]["chair_typing_variation"] = "npc_typing_variation";
    level._id_78BA["generic"]["chair_typing_pause"] = "npc_laptop_pause_think";
    level._id_78BA["generic"]["chair_nod_01"] = "npc_laptop_head_nod_1";
    level._id_78BA["generic"]["cchair_nod_02"] = "npc_laptop_head_nod_2";
    level._id_78AC["gaz"]["h1_killhouse_gaz_walkonstage"] = %h1_killhouse_gaz_walkonstage;
    level._id_78AC["gaz"]["killhouse_gaz_idleB"][0] = %h1_killhouse_gaz_idleb;
    level._id_78AC["gaz"]["killhouse_gaz_idleA"] = %h1_killhouse_gaz_idlea;
    level._id_78AC["gaz"]["killhouse_gaz_idleC"][0] = %h1_killhouse_gaz_idlec;
    level._id_78AC["gaz"]["killhouse_gaz_lookdown"] = %h1_killhouse_gaz_lookdown;
    level._id_78AC["gaz"]["killhouse_gaz_lookdown_idle"][0] = %h1_killhouse_gaz_lookdown_idle;
    level._id_78AC["gaz"]["killhouse_gaz_point_side"] = %h1_killhouse_gaz_point_side;
    level._id_78AC["gaz"]["killhouse_gaz_talk_side"] = %h1_killhouse_gaz_talk_side;
    level._id_78AC["gaz"]["killhouse_gaz_talk_side_alt"] = %h1_killhouse_gaz_talk_side_alt;
    level._id_78AC["gaz"]["killhouse_gaz_talk"] = %h1_killhouse_gaz_talk;
    level._id_78AC["gaz"]["killhouse_gaz_explain"] = %h1_killhouse_gaz_explain;
    level._id_78AC["gaz"]["killhouse_gaz_explain2"] = %h1_killhouse_gaz_explain2;
    level._id_78AC["gaz"]["killhouse_gaz_point_front"] = %h1_killhouse_gaz_point_front;
    level._id_78AC["gaz"]["killhouse_gaz_nod"] = %h1_killhouse_gaz_nod;

    if ( getdvarint( "loc_language", 99 ) == 0 )
    {
        level._id_78B2["gaz"]["evenfaster"] = %killhouse_gaz_evenfaster;
        level._id_78B2["gaz"]["knifewatermelon"] = %killhouse_gaz_knifewatermelon;
        level._id_78B2["gaz"]["seeyoufire"] = %killhouse_gaz_seeyoufire;
        level._id_78B2["gaz"]["takearifle"] = %killhouse_gaz_takearifle;
        level._id_78B2["gaz"]["youknowdrill"] = %killhouse_gaz_youknowdrill;
        level._id_78B2["gaz"]["gotostation1"] = %killhouse_gaz_gotostation1;
        level._id_78B2["gaz"]["heygo"] = %killhouse_gaz_heygo;
        level._id_78B2["gaz"]["getback"] = %killhouse_gaz_getback;
        level._id_78B2["gaz"]["lovely"] = %killhouse_gaz_lovely;
        level._id_78B2["gaz"]["shooteachtarget"] = %killhouse_gaz_shooteachtarget;
        level._id_78B2["gaz"]["firingfromhip"] = %killhouse_gaz_firingfromhip;
        level._id_78B2["gaz"]["blocktargets"] = %killhouse_gaz_blocktargets;
        level._id_78B2["gaz"]["shoottargets"] = %killhouse_gaz_shoottargets;
        level._id_78B2["gaz"]["bulletspenetrate"] = %killhouse_gaz_bulletspenetrate;
        level._id_78B2["gaz"]["targetspop"] = %killhouse_gaz_targetspop;
        level._id_78B2["gaz"]["hitall"] = %killhouse_gaz_hitall;
        level._id_78B2["gaz"]["onemoretime"] = %killhouse_gaz_onemoretime;
        level._id_78B2["gaz"]["switchtorifle"] = %killhouse_gaz_switchtorifle;
        level._id_78B2["gaz"]["pulloutsidearm"] = %killhouse_gaz_pulloutsidearm;
        level._id_78B2["gaz"]["switchingfaster"] = %killhouse_gaz_switchingfaster;
        level._id_78B2["gaz"]["comethisway"] = %killhouse_gaz_comethisway;
        level._id_78B2["gaz"]["knifemelon"] = %killhouse_gaz_knifemelon;
        level._id_78B2["gaz"]["fruitkilling"] = %killhouse_gaz_fruitkilling;
        level._id_78B2["gaz"]["wantstosee"] = %killhouse_gaz_wantstosee;
        level._id_78B2["nwc"]["timeforfun"] = %killhouse_nwc_timeforfun;
        level._id_78B2["nwc"]["pickupfrag"] = %killhouse_nwc_pickupfrag;
        level._id_78B2["nwc"]["getinsafety"] = %killhouse_nwc_getinthesafetypit;
        level._id_78B2["nwc"]["nowbacktopit"] = %killhouse_nwc_nowbacktopit;
        level._id_78B2["nwc"]["followme2"] = %killhouse_nwc_followme2;
        level._id_78B2["nwc"]["equipc4"] = %killhouse_nwc_equipc4;
        level._id_78B2["nwc"]["exwifecar"] = %killhouse_nwc_exwifecar;
        level._id_78B2["nwc"]["placec4"] = %killhouse_nwc_placec4;
        level._id_78B2["nwc"]["safedistance"] = %killhouse_nwc_safedistance;
        level._id_78B2["nwc"]["fireinhole"] = %killhouse_nwc_fireinhole;
        level._id_78B2["nwc"]["chuckle"] = %killhouse_nwc_chuckle;
        level._id_78B2["nwc"]["muchimproved"] = %killhouse_nwc_muchimproved;
        level._id_78B2["nwc"]["passedeval"] = %killhouse_nwc_passedeval;
    }

    level._id_78AC["gaz"]["intro"] = %killhouse_gaz_intro;
    level._id_78AC["gaz"]["intro_idle"][0] = %h1_killhouse_gaz_intro_idle;
    maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "intro", "killhouse_gaz_goodtosee" );
    level._id_78AC["generic"]["training_sleeping_in_chair"][0] = %training_sleeping_in_chair;
    level._id_78AC["generic"]["training_basketball_rest"][0] = %training_basketball_rest;
    level._id_78AC["generic"]["training_basketball_guy1"][0] = %training_basketball_guy1;
    level._id_78AC["generic"]["training_basketball_guy2"][0] = %training_basketball_guy2;
    level._id_78AC["generic"]["training_humvee_repair"][0] = %training_humvee_repair;
    level._id_78AC["generic"]["training_pushups_guy1"][0] = %training_pushups_guy1;
    level._id_78AC["generic"]["training_pushups_guy2"][0] = %training_pushups_guy2;
    level._id_78AC["generic"]["training_humvee_repair"][0] = %training_humvee_repair;
    level._id_78AC["generic"]["cliffhanger_welder_wing"][0] = %cliffhanger_welder_wing;
    level._id_78AC["generic"]["cliffhanger_welder_engine"][0] = %cliffhanger_welder_engine;
    level._id_78AC["generic"]["patrolstand_idle"][0] = %patrolstand_idle;
    level._id_78AC["generic"]["parabolic_guard_sleeper_idle"][0] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["roadkill_cover_spotter_idle"][0] = %roadkill_cover_spotter_idle;
    level._id_78AC["generic"]["oilrig_balcony_smoke_idle"][0] = %oilrig_balcony_smoke_idle;
    level._id_78AC["generic"]["killhouse_gaz_idleB"][0] = %killhouse_gaz_idleb;
    level._id_78AC["generic"]["civilian_sitting_talking_A_2"] = %civilian_sitting_talking_a_2;
    level._id_78AC["generic"]["civilian_sitting_talking_A_2_Idle"][0] = %civilian_sitting_talking_a_2_idle;
    level._id_78AC["generic"]["civilian_sitting_talking_A_2_facial"] = %civilian_sitting_talking_a_2_facial;
    level._id_78AC["generic"]["parabolic_leaning_guy_smoking_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["parabolic_leaning_guy_idle"][0] = %parabolic_leaning_guy_idle;
    level._id_78AC["generic"]["parabolic_leaning_guy_idle_training"][0] = %parabolic_leaning_guy_idle_training;
    level._id_78AC["generic"]["civilian_texting_sitting"][0] = %civilian_texting_sitting;
    level._id_78AC["generic"]["sitting_guard_loadAK_idle"][0] = %sitting_guard_loadak_idle;
    level._id_78AC["generic"]["afgan_caves_sleeping_guard_idle"][0] = %afgan_caves_sleeping_guard_idle;
    level._id_78AC["generic"]["cargoship_sleeping_guy_idle_2"][0] = %cargoship_sleeping_guy_idle_2;
    level._id_78AC["generic"]["civilian_sitting_talking_A_1"][0] = %civilian_sitting_talking_a_1;
    level._id_78AC["generic"]["bunker_toss_idle_guy1"][0] = %bunker_toss_idle_guy1;
    level._id_78AC["generic"]["roadkill_cover_radio_soldier3"][0] = %roadkill_cover_radio_soldier3;
    level._id_78AC["generic"]["civilian_sitting_talking_B_1"][0] = %civilian_sitting_talking_b_1;
    level._id_78AC["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level._id_78AC["generic"]["civilian_reader_1"][0] = %civilian_reader_1;
    level._id_78AC["generic"]["civilian_reader_2"][0] = %civilian_reader_2;
    level._id_78AC["generic"]["civilian_reader_2_facial"] = %civilian_reader_2_facial;
    level._id_78AC["generic"]["guardA_sit_sleeper_sleep_idle"] = %guarda_sit_sleeper_sleep_idle;
    level._id_78AC["generic"]["roadkill_humvee_map_sequence_quiet_idle"][0] = %roadkill_humvee_map_sequence_quiet_idle;
    level._id_78AC["generic"]["guardB_sit_drinker_idle"][0] = %guardb_sit_drinker_idle;
    level._id_78AC["generic"]["guardB_standing_cold_idle"][0] = %guardb_standing_cold_idle;
    level._id_78AC["generic"]["civilian_texting_standing"][0] = %civilian_texting_standing;
    level._id_78AC["generic"]["killhouse_sas_2_idle"][0] = %killhouse_sas_2_idle;
    level._id_78AC["generic"]["killhouse_sas_3_idle"][0] = %killhouse_sas_3_idle;
    level._id_78AC["generic"]["killhouse_sas_price_idle"][0] = %killhouse_sas_price_idle;
    level._id_78AC["generic"]["killhouse_sas_1_idle"][0] = %killhouse_sas_1_idle;
    level._id_78AC["generic"]["little_bird_casual_idle_guy1"][0] = %little_bird_casual_idle_guy1;
    level._id_78AC["generic"]["sniper_escape_spotter_idle"][0] = %sniper_escape_spotter_idle;
    level._id_78AC["generic"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level._id_78AC["generic"]["patrol_unarmed_idle"][0] = %patrol_unarmed_idle;
    level._id_78AC["generic"]["patrol_unarmed_walk"] = %patrol_unarmed_walk;
    level._id_78AC["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn_fng;
    level._id_78AC["generic"]["patrol_idle_1"] = %patrol_bored_idle;
    level._id_78AC["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
    level._id_78AC["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["patrol_turn_l45_rfoot"] = %h1_bored_patrol_walk_turn_l45_right_foot;
    level._id_78AC["generic"]["patrol_turn_l45_lfoot"] = %h1_bored_patrol_walk_turn_l45_left_foot;
    level._id_78AC["generic"]["patrol_turn_l90_rfoot"] = %h1_bored_patrol_walk_turn_l90_right_foot;
    level._id_78AC["generic"]["patrol_turn_l90_lfoot"] = %h1_bored_patrol_walk_turn_l90_left_foot;
    level._id_78AC["generic"]["patrol_turn_l135_rfoot"] = %h1_bored_patrol_walk_turn_l135_right_foot;
    level._id_78AC["generic"]["patrol_turn_l135_lfoot"] = %h1_bored_patrol_walk_turn_l135_left_foot;
    level._id_78AC["generic"]["patrol_turn_r45_rfoot"] = %h1_bored_patrol_walk_turn_r45_right_foot;
    level._id_78AC["generic"]["patrol_turn_r45_lfoot"] = %h1_bored_patrol_walk_turn_r45_left_foot;
    level._id_78AC["generic"]["patrol_turn_r90_rfoot"] = %h1_bored_patrol_walk_turn_r90_right_foot;
    level._id_78AC["generic"]["patrol_turn_r90_lfoot"] = %h1_bored_patrol_walk_turn_r90_left_foot;
    level._id_78AC["generic"]["patrol_turn_r135_rfoot"] = %h1_bored_patrol_walk_turn_r135_right_foot;
    level._id_78AC["generic"]["patrol_turn_r135_lfoot"] = %h1_bored_patrol_walk_turn_r135_left_foot;
    level._id_78AC["generic"]["patrol_walk_in_lfoot"] = %h1_bored_patrol_walk_turn_walk_in_left;
    level._id_78AC["generic"]["patrol_walk_out_lfoot"] = %h1_bored_patrol_walk_turn_walk_out_left;
    level._id_78AC["generic"]["patrol_walk_in_rfoot"] = %h1_bored_patrol_walk_turn_walk_in_right;
    level._id_78AC["generic"]["patrol_walk_out_rfoot"] = %h1_bored_patrol_walk_turn_walk_out_right;
    level._id_78AC["generic"]["RunNoGun_1"] = %h1_ambiant_run_no_gun;
    level._id_78AC["generic"]["RunNoGun_2"] = %h1_ambiant_run_no_gun_2;
    level._id_78AC["generic"]["RunNoGun_3"] = %h1_ambiant_run_no_gun_3;
    level._id_78AC["generic"]["RunNoGun_4"] = %h1_ambiant_run_no_gun;
    level._id_78AC["generic"]["RunNoGun_5"] = %h1_ambiant_run_no_gun_5;
    level._id_78AC["generic"]["runner_facial_1"] = %facial_run_1;
    level._id_78AC["generic"]["runner_facial_2"] = %facial_run_2;
    level._id_78AC["generic"]["runner_facial_3"] = %facial_pain_1;
    level._id_78AC["generic"]["runner_facial_4"] = %facial_pain_2;
    level._id_78AC["generic"]["runner_facial_5"] = %facial_pain_3;
    level._id_78AC["generic"]["training_jog_guy1"] = %training_jog_guy1;
    level._id_78AC["generic"]["training_jog_guy2"] = %training_jog_guy2;
    level._id_78AC["generic"]["v2_idle"][0] = %casual_stand_v2_idle;
    level._id_78AC["generic"]["v2_idle"][1] = %casual_stand_v2_twitch_shift;
    level._id_78AC["generic"]["v2_idle"][2] = %casual_stand_v2_twitch_radio;
    level._id_78AC["generic"]["jog_stop"] = %casual_killer_jog_stop;
    level._id_78AC["generic"]["prone_to_stand"] = %killhouse_course_prone_2_stand;
    anim_view_body();
    anim_props();
    anim_chair();
    maps\_patrol::init_patrol_animation_list();
}
#using_animtree("player");

anim_view_body()
{
    precachemodel( "vb_generic_s1" );
    level._id_78B1["view_body"] = #animtree;
    level._id_78B5["view_body"] = "vb_generic_s1";
    level._id_78AC["view_body"]["training_rope"] = %h1_killhouse_player_fastrope;
    precachemodel( "worldbody_h1_sas_ct" );
    level._id_78B1["view_body_door"] = #animtree;
    level._id_78B5["view_body_door"] = "worldbody_h1_sas_ct";
    level._id_78AC["view_body_door"]["player_opendoor"] = %h1_killhouse_player_opendoor;
}

_id_29E7()
{
    level._id_78BA["gaz"]["wantstosee"] = "killhouse_gaz_wantstosee";
    level._id_78BA["gaz"]["onemoretime"] = "killhouse_gaz_onemoretime";
    level._id_78BA["gaz"]["getarifle"] = "killhouse_gaz_getarifle";
    level._id_78BA["gaz"]["getasidearm"] = "killhouse_gaz_getasidearm";
    level._id_78BA["gaz"]["snaponto"] = "killhouse_gaz_snaponto";
    level._id_78BA["gaz"]["evenfaster"] = "killhouse_gaz_evenfaster";
    level._id_78BA["gaz"]["knifewatermelon"] = "killhouse_gaz_knifewatermelon";
    level._id_78BA["gaz"]["stopaiming"] = "killhouse_gaz_stopaiming";
    level._id_78BA["gaz"]["seeyoufire"] = "killhouse_gaz_seeyoufire";
    level._id_78BA["sas2"]["fng"] = "killhouse_sas4_fng";
    level._id_78BA["sas2"]["goeasy"] = "killhouse_sas4_goeasy";
    level._id_78BA["price"]["cqbsim"] = "killhouse_pri_cqbsim";
    level._id_78BA["price"]["muppet"] = "killhouse_pri_muppet";
    level._id_78BA["price"]["cbqtest"] = "killhouse_pri_cqbtest";
    level._id_78BA["price"]["runsolo"] = "killhouse_pri_runsolo";
    level._id_78BA["price"]["record19sec"] = "killhouse_pri_record19sec";
    level._id_78BA["price"]["welcome"] = "killhouse_pri_welcome";
    level._id_78BA["price"]["ladderhere"] = "killhouse_pri_ladderhere";
    level._id_78BA["price"]["ladderthere"] = "killhouse_pri_ladderthere";
    level._id_78BA["price"]["wheelsup"] = "killhouse_pri_wheelsup";
    level._id_78BA["price"]["sprint"] = "killhouse_pri_sprint";
    level._id_78BA["price"]["tooslow"] = "killhouse_pri_tooslow";
    level._id_78BA["price"]["comeback"] = "killhouse_pri_comeback";
    level._id_78BA["price"]["youlldo"] = "killhouse_pri_youlldo";
    level._id_78BA["price"]["seenbetter2"] = "killhouse_pri_seenbetter";
    level._id_78BA["price"]["sloppy"] = "killhouse_pri_sloppy";
    level._id_78BA["price"]["tryitagain"] = "killhouse_pri_tryitagain";
    level._id_78BA["price"]["notgreat"] = "killhouse_pri_notgreat";
    level._id_78BA["price"]["lesstime"] = "killhouse_pri_lesstime";
    level._id_78BA["price"]["letyouskip"] = "killhouse_pri_letyouskip";
    level._id_78BA["gaz"]["illletyouin"] = "killhouse_gaz_illletyouin";
    level._id_78BA["gaz"]["smalldoor"] = "killhouse_gaz_smalldoor";
    level._id_78BA["gaz"]["gotallday"] = "killhouse_gaz_gotallday";
    level._id_78BA["gaz"]["getamoveon"] = "killhouse_gaz_getamoveon";
    level._id_78BA["gaz"]["goodtosee"] = "killhouse_gaz_goodtosee";
    level._id_78BA["gaz"]["takearifle"] = "killhouse_gaz_takearifle";
    level._id_78BA["gaz"]["youknowdrill"] = "killhouse_gaz_youknowdrill";
    level._id_78BA["gaz"]["gotostation1"] = "killhouse_gaz_gotostation1";
    level._id_78BA["gaz"]["heygo"] = "killhouse_gaz_heygo";
    level._id_78BA["gaz"]["getback"] = "killhouse_gaz_getback";
    level._id_78BA["gaz"]["priceevaluation"] = "killhouse_gaz_priceevaluation";
    level._id_78BA["gaz"]["rifledownrange"] = "killhouse_gaz_rifledownrange";
    level._id_78BA["gaz"]["aimyourrifle"] = "killhouse_gaz_aimyourrifle";
    level._id_78BA["gaz"]["lovely"] = "killhouse_gaz_lovely";
    level._id_78BA["gaz"]["shooteachtarget"] = "killhouse_gaz_shooteachtarget";
    level._id_78BA["gaz"]["brilliant"] = "killhouse_gaz_brilliant";
    level._id_78BA["gaz"]["firingfromhip"] = "killhouse_gaz_firingfromhip";
    level._id_78BA["gaz"]["changessize"] = "killhouse_gaz_changessize";
    level._id_78BA["gaz"]["stupidtest"] = "killhouse_gaz_stupidtest";
    level._id_78BA["gaz"]["stupidinnit"] = "killhouse_gaz_stupidinnit";
    level._id_78BA["gaz"]["overwith"] = "killhouse_gaz_overwith";
    level._id_78BA["gaz"]["blocktargets"] = "killhouse_gaz_blocktargets";
    level._id_78BA["gaz"]["shoottargets"] = "killhouse_gaz_shoottargets";
    level._id_78BA["gaz"]["good"] = "killhouse_gaz_good";
    level._id_78BA["gaz"]["bulletspenetrate"] = "killhouse_gaz_bulletspenetrate";
    level._id_78BA["gaz"]["largerweapon"] = "killhouse_gaz_largerweapon";
    level._id_78BA["gaz"]["youknewthat"] = "killhouse_gaz_youknewthat";
    level._id_78BA["gaz"]["movingon"] = "killhouse_gaz_movingon";
    level._id_78BA["gaz"]["targetspop"] = "killhouse_gaz_targetspop";
    level._id_78BA["gaz"]["hitall"] = "killhouse_gaz_hitall";
    level._id_78BA["gaz"]["cansnap"] = "killhouse_gaz_cansnap";
    level._id_78BA["gaz"]["tryagain"] = "killhouse_gaz_tryagain";
    level._id_78BA["gaz"]["stilltooslow"] = "killhouse_gaz_stilltooslow";
    level._id_78BA["gaz"]["again"] = "killhouse_gaz_again";
    level._id_78BA["gaz"]["again2"] = "killhouse_gaz_again2";
    level._id_78BA["gaz"]["walkinpark"] = "killhouse_gaz_walkinpark";
    level._id_78BA["gaz"]["propergood"] = "killhouse_gaz_propergood";
    level._id_78BA["gaz"]["getsidearm"] = "killhouse_gaz_getsidearm";
    level._id_78BA["gaz"]["switchtorifle"] = "killhouse_gaz_switchtorifle";
    level._id_78BA["gaz"]["pulloutsidearm"] = "killhouse_gaz_pulloutsidearm";
    level._id_78BA["gaz"]["switchback"] = "killhouse_gaz_switchback";
    level._id_78BA["gaz"]["drawsidearm"] = "killhouse_gaz_drawsidearm";
    level._id_78BA["gaz"]["switchsidearm"] = "killhouse_gaz_switchsidearm";
    level._id_78BA["gaz"]["switchingfaster"] = "killhouse_gaz_switchingfaster";
    level._id_78BA["gaz"]["shortofelephant"] = "killhouse_gaz_shortofelephant";
    level._id_78BA["gaz"]["comethisway"] = "killhouse_gaz_comethisway";
    level._id_78BA["gaz"]["fewfeet"] = "killhouse_gaz_fewfeet";
    level._id_78BA["gaz"]["whatdoyoudo"] = "killhouse_gaz_whatdoyoudo";
    level._id_78BA["gaz"]["attackwithknife"] = "killhouse_gaz_attackwithknife";
    level._id_78BA["gaz"]["attackwithknife"] = "Killhouse_gaz_knifemelon";
    level._id_78BA["gaz"]["fruitkilling"] = "killhouse_gaz_fruitkilling";
    level._id_78BA["gaz"]["followme"] = "killhouse_gaz_followme";
    level._id_78BA["gaz"]["herebymelon"] = "killhouse_gaz_herebymelon";
    level._id_78BA["gaz"]["therebymelon"] = "killhouse_gaz_therebymelon";
    level._id_78BA["gaz"]["allgoodhere"] = "killhouse_gaz_allgoodhere";
    level._id_78BA["nwc"]["timeforfun"] = "killhouse_nwc_timeforfun";
    level._id_78BA["nwc"]["pickupfrag"] = "killhouse_nwc_pickupfrag";
    level._id_78BA["nwc"]["getinsafety"] = "killhouse_nwc_getinsafety";
    level._id_78BA["nwc"]["getbackin"] = "killhouse_nwc_getbackin";
    level._id_78BA["nwc"]["stayinpit"] = "killhouse_nwc_stayinpit";
    level._id_78BA["nwc"]["throwgrenade"] = "killhouse_nwc_throwgrenade";
    level._id_78BA["nwc"]["23and4"] = "killhouse_nwc_23and4";
    level._id_78BA["nwc"]["2and3"] = "killhouse_nwc_2and3";
    level._id_78BA["nwc"]["2and4"] = "killhouse_nwc_2and4";
    level._id_78BA["nwc"]["3and4"] = "killhouse_nwc_3and4";
    level._id_78BA["nwc"]["window2"] = "killhouse_nwc_window2";
    level._id_78BA["nwc"]["window3"] = "killhouse_nwc_window3";
    level._id_78BA["nwc"]["window4"] = "killhouse_nwc_window4";
    level._id_78BA["nwc"]["getsomemore"] = "killhouse_nwc_getsomemore";
    level._id_78BA["nwc"]["moregrenades"] = "killhouse_nwc_moregrenades";
    level._id_78BA["nwc"]["aimabovetarget"] = "killhouse_nwc_aimabovetarget";
    level._id_78BA["nwc"]["whereyougoing"] = "killhouse_nwc_whereyougoing";
    level._id_78BA["nwc"]["comebackidiot"] = "killhouse_nwc_comebackidiot";
    level._id_78BA["nwc"]["moremojo"] = "killhouse_nwc_moremojo";
    level._id_78BA["nwc"]["pickuplauncher"] = "killhouse_nwc_pickuplauncher";
    level._id_78BA["nwc"]["launcherfromtable"] = "killhouse_nwc_launcherfromtable";
    level._id_78BA["nwc"]["icononhud"] = "killhouse_nwc_icononhud";
    level._id_78BA["nwc"]["nowbacktopit"] = "killhouse_nwc_nowbacktopit";
    level._id_78BA["nwc"]["equiplauncher"] = "killhouse_nwc_equiplauncher";
    level._id_78BA["nwc"]["firewall1"] = "killhouse_nwc_firewall1";
    level._id_78BA["nwc"]["didntexplode"] = "killhouse_nwc_didntexplode";
    level._id_78BA["nwc"]["safearming"] = "killhouse_nwc_safearming";
    level._id_78BA["nwc"]["wontexplode"] = "killhouse_nwc_wontexplode";
    level._id_78BA["nwc"]["56and7"] = "killhouse_nwc_56and7";
    level._id_78BA["nwc"]["switchaway"] = "killhouse_nwc_switchaway";
    level._id_78BA["nwc"]["c4offtable"] = "killhouse_nwc_c4offtable";
    level._id_78BA["nwc"]["pickupc4"] = "killhouse_nwc_pickupc4";
    level._id_78BA["nwc"]["followme2"] = "killhouse_nwc_followme2";
    level._id_78BA["nwc"]["c4icon"] = "killhouse_nwc_c4icon";
    level._id_78BA["nwc"]["dpadicon"] = "killhouse_nwc_dpadicon";
    level._id_78BA["nwc"]["dpadicons"] = "killhouse_nwc_dpadicons";
    level._id_78BA["nwc"]["hudinventory"] = "killhouse_nwc_hudinventory";
    level._id_78BA["nwc"]["equipwillchange"] = "killhouse_nwc_equipwillchange";
    level._id_78BA["nwc"]["equipc4"] = "killhouse_nwc_equipc4";
    level._id_78BA["nwc"]["hudchanges"] = "killhouse_nwc_hudchanges";
    level._id_78BA["nwc"]["exwifecar"] = "killhouse_nwc_exwifecar";
    level._id_78BA["nwc"]["exwifeantique"] = "killhouse_nwc_exwifeantique";
    level._id_78BA["nwc"]["placec4"] = "killhouse_nwc_placec4";
    level._id_78BA["nwc"]["throwc4"] = "killhouse_nwc_throwc4";
    level._id_78BA["nwc"]["throwc4car"] = "killhouse_nwc_throwc4car";
    level._id_78BA["nwc"]["c4furniture"] = "killhouse_nwc_c4furniture";
    level._id_78BA["nwc"]["morec4"] = "killhouse_nwc_morec4";
    level._id_78BA["nwc"]["behindwall"] = "killhouse_nwc_behindwall";
    level._id_78BA["nwc"]["safedistance"] = "killhouse_nwc_safedistance";
    level._id_78BA["nwc"]["fireinhole"] = "killhouse_nwc_fireinhole";
    level._id_78BA["nwc"]["chuckle"] = "killhouse_nwc_chuckle";
    level._id_78BA["nwc"]["muchimproved"] = "killhouse_nwc_muchimproved";
    level._id_78BA["nwc"]["passedeval"] = "killhouse_nwc_passedeval";
    level._id_78BA["nwc"]["reporttomac"] = "killhouse_nwc_reporttomac";
    level._id_78BA["nwc"]["justbetween"] = "killhouse_nwc_justbetween";
    level._id_78BA["nwc"]["thrilledtosee"] = "killhouse_nwc_thrilledtosee";
    level._id_78BA["nwc"]["goodluck"] = "killhouse_nwc_goodluck";
    level._id_78BA["mac"]["misssoap"] = "killhouse_mcm_misssoap";
    level._id_78BA["mac"]["lineup"] = "killhouse_mcm_lineup";
    level._id_78BA["mac"]["go"] = "killhouse_mcm_go";
    level._id_78BA["mac"]["jumpobstacles"] = "killhouse_mcm_jumpobstacles";
    level._id_78BA["mac"]["isntcharitywalk"] = "killhouse_mcm_isntcharitywalk";
    level._id_78BA["mac"]["commandos"] = "killhouse_mcm_commandos";
    level._id_78BA["mac"]["bertud"] = "killhouse_mcm_bertud";
    level._id_78BA["mac"]["youcrawllike"] = "killhouse_mcm_youcrawllike";
    level._id_78BA["mac"]["passedtest"] = "killhouse_mcm_passedtest";
    level._id_78BA["mac"]["runitagain"] = "killhouse_mcm_runitagain";
    level._id_78BA["sas2"]["fingy"] = "killhouse_sas2_fingy";
    level._id_78BA["price"]["ropedeck"] = "killhouse_pri_ropedeck";
    level._id_78BA["price"]["stormstairs"] = "killhouse_pri_stormstairs";
    level._id_78BA["price"]["hit3and4"] = "killhouse_pri_hit3and4";
    level._id_78BA["price"]["gogogo"] = "killhouse_pri_gogogo";
    level._id_78BA["price"]["hittargets"] = "killhouse_pri_hittargets";
    level._id_78BA["price"]["position2"] = "killhouse_pri_position2";
    level._id_78BA["price"]["flashthrudoor"] = "killhouse_pri_flashthrudoor";
    level._id_78BA["price"]["position3"] = "killhouse_pri_position3";
    level._id_78BA["price"]["hittargets"] = "killhouse_pri_hittargets";
    level._id_78BA["price"]["position4"] = "killhouse_pri_position4";
    level._id_78BA["price"]["hittargets"] = "killhouse_pri_hittargets";
    level._id_78BA["price"]["startover"] = "killhouse_pri_startover";
    level._id_78BA["price"]["doitagain"] = "killhouse_pri_doitagain";
    level._id_78BA["price"]["goodjob"] = "killhouse_pri_goodjob";
    level._id_78BA["price"]["pickupmp5"] = "killhouse_pri_pickupmp5";
    level._id_78BA["price"]["markcompass"] = "killhouse_pri_markcompass";
    level._id_78BA["price"]["grabrope"] = "killhouse_pri_grabrope";
    level._id_78BA["price"]["waitsignal"] = "killhouse_pri_waitsignal";
    level._id_78BA["price"]["soap4flash"] = "killhouse_pri_soap4flash";
    level._id_78BA["price"]["replaceflash"] = "killhouse_pri_replaceflash";
    level._id_78BA["price"]["getflash"] = "killhouse_pri_getflash";
    level._id_78BA["price"]["moreflash"] = "killhouse_pri_moreflash";
    level._id_78BA["price"]["soapequipmp5"] = "killhouse_pri_soapequipmp5";
    level._id_78BA["price"]["equipmp5"] = "killhouse_pri_equipmp5";
    level._id_78BA["price"]["missgoback"] = "killhouse_pri_missgoback";
    level._id_78BA["price"]["passgoback"] = "killhouse_pri_passgoback";
    level._id_78BA["price"]["goback"] = "killhouse_pri_goback";
    level._id_78BA["price"]["flashroomfirst"] = "killhouse_pri_flashroomfirst";
    level._id_78BA["price"]["notthatgood"] = "killhouse_pri_notthatgood";
    level._id_78BA["price"]["seenbetter"] = "killhouse_pri_seenbetter";
    level._id_78BA["price"]["anothergo"] = "killhouse_pri_anothergo";
    level._id_78BA["price"]["debrief"] = "killhouse_pri_debrief";
    level._id_78BA["price"]["newrecord"] = "killhouse_pri_newrecord";
    level._id_78BA["price"]["5go"] = "killhouse_pri_5go";
    level._id_78BA["price"]["6go"] = "killhouse_pri_6go";
    level._id_78BA["price"]["finalgo"] = "killhouse_pri_finalgo";
    level._id_78BA["price"]["flashroom"] = "killhouse_pri_flashroom";
    level._id_78BA["price"]["flashintoroom"] = "killhouse_pri_flashintoroom";
    level._id_78BA["price"]["missedflash"] = "killhouse_pri_missedflash";
    level._id_78BA["price"]["youmissed"] = "killhouse_pri_youmissed";
    level._id_78BA["price"]["followarrows"] = "killhouse_pri_followarrows";
    level._id_78BA["price"]["2"] = "killhouse_pri_2position";
    level._id_78BA["price"]["3"] = "killhouse_pri_3position";
    level._id_78BA["price"]["4"] = "killhouse_pri_4";
    level._id_78BA["price"]["5"] = "killhouse_pri_5";
    level._id_78BA["price"]["finalposition"] = "killhouse_pri_finalposition";
    level._id_78BA["price"]["shoottarget"] = "killhouse_pri_shoottarget";
    level._id_78BA["price"]["remainingtarg"] = "killhouse_pri_remainingtarg";
    level._id_78BA["price"]["hitother"] = "killhouse_pri_hitother";
}
#using_animtree("animated_props");

anim_props()
{
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["still"] = %foliage_sequoia_cut_12_still;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["strong"] = %foliage_sequoia_cut_12_sway;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["heli"] = %foliage_sequoia_cut_12_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["still"] = %jr_pine_01_still;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["strong"] = %jr_pine_01_sway;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["heli"] = %jr_pine_01_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["still"] = %jr_pine_02_still;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["strong"] = %jr_pine_02_sway;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["heli"] = %jr_pine_02_heliwash;
}
#using_animtree("chair");

anim_chair()
{
    level._id_78AC["chair"]["chair_turnaround"] = %h1_killhouse_laptopguy_chair_turnaround;
    level._id_78AC["chair"]["chair_idle"] = %h1_killhouse_laptopguy_chair_idle;
    level._id_78AC["chair"]["chair_counting"] = %h1_killhouse_laptopguy_chair_counting;
    level._id_78B1["chair"] = #animtree;
    level._id_78B5["chair"] = "h1_mwr_com_office_chair_black";
}
#using_animtree("generic_human");

play_idle_facial_anim( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = randomint( anim._id_35C1["idle"].size );

    self _meth_814B( anim._id_35C1["idle"][var_0], %head, 1 );
    self _meth_814E( %head, 1 );
    wait(getanimlength( anim._id_35C1["idle"][var_0] ));
}

gaz_face_think( var_0 )
{
    level waittill( "navigationTraining_end" );
    level endon( "out_of_firing_range" );

    for (;;)
    {
        if ( var_0.speaking == 1 )
        {
            wait 0.1;
            var_0 _meth_814A( %facial_idle_1, %head, 0.1, 0.1 );
            var_0 _meth_814E( %head, 0.11, 0.1 );
            continue;
        }

        if ( var_0.speaking == 0 )
        {
            var_0 _meth_814C( %facial_idle_1, %head, 0.8 );
            var_0 _meth_814E( %head, 0.8 );

            for (;;)
            {
                if ( var_0.speaking == 1 )
                    break;
                else
                    wait 0.2;
            }
        }
    }
}

newcastle_face_think( var_0 )
{
    level endon( "explosivesTraining_end" );

    for (;;)
    {
        if ( var_0.speaking )
        {
            wait 0.4;
            var_0 _meth_814A( %h1_killhouse_nwc_idle_facial, %newcastle_face, 0.1, 0.4 );
            var_0 _meth_814E( %newcastle_face, 0.1, 0.4 );
            continue;
        }

        var_0 _meth_814C( %h1_killhouse_nwc_idle_facial, %newcastle_face, 0.8 );
        var_0 _meth_814E( %newcastle_face, 0.8 );

        for (;;)
        {
            if ( var_0.speaking == 1 )
                break;

            wait 0.8;
        }
    }
}
