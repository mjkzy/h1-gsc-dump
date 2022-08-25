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

main()
{
    anim_gen_human();
    anim_door();
    anim_chair();
    anim_seaknight();
    anim_sea();
    anim_player();
    _id_29F3();
    anim_blackhawk();
    anim_props();
}

_id_29F3()
{
    level._id_78B9["cargoship_hp1_baseplatehammertwo"] = "cargoship_hp1_baseplatehammertwo";
    level._id_78B9["cargoship_hqr_copytwofour"] = "cargoship_hqr_copytwofour";
    level._id_78B9["cargoship_hp1_thirtysecdark"] = "cargoship_hp1_thirtysecdark";
    level._id_78B9["cargoship_pri_crewexpend"] = "cargoship_pri_crewexpend";
    level._id_78B9["cargoship_hp1_tensecondsradio"] = "cargoship_hp1_tensecondsradio";
    level._id_78B9["cargoship_hp1_radiocheck"] = "cargoship_hp1_radiocheck";
    level._id_78B9["cargoship_hp1_greenlightgoradio"] = "cargoship_hp1_greenlightgoradio";
    level._id_78B9["cargoship_gm1_bridgesecure"] = "cargoship_gm1_bridgesecure";
    level._id_78B9["cargoship_pri_weaponsfree"] = "cargoship_pri_weaponsfree";
    level._id_78B9["cargoship_pri_holdyourfire"] = "cargoship_pri_holdyourfire";
    level._id_78B9["cargoship_grg_rogerthat"] = "cargoship_grg_rogerthat";
    level._id_78B9["cargoship_pri_squadonme"] = "cargoship_pri_squadonme";
    level._id_78B9["cargoship_pri_stairsclear"] = "cargoship_pri_stairsclear";
    level._id_78B9["cargoship_pri_hallwayclear"] = "cargoship_pri_hallwayclear";
    level._id_78B9["cargoship_pri_crewquarters"] = "cargoship_pri_crewquarters";
    level._id_78B9["cargoship_pri_moveup"] = "cargoship_pri_moveup";
    level._id_78B9["cargoship_hp1_forwarddeckradio"] = "cargoship_hp1_forwarddeckradio";
    level._id_78B9["cargoship_grg_readysir"] = "cargoship_grg_readysir";
    level._id_78B9["cargoship_pri_fanout"] = "cargoship_pri_fanout";
    level._id_78B9["cargoship_grg_gottwo"] = "cargoship_grg_gottwo";
    level._id_78B9["cargoship_pri_iseeem"] = "cargoship_pri_iseeem";
    level._id_78B9["cargoship_grg_gotcompany"] = "cargoship_grg_gotcompany";
    level._id_78B9["cargoship_pri_tangos2ndfl"] = "cargoship_pri_tangos2ndfl";
    level._id_78B9["cargoship_hp1_copyengaging"] = "cargoship_hp1_copyengaging";
    level._id_78B9["cargoship_hp1_bingofuel"] = "cargoship_hp1_bingofuel";
    level._id_78B9["cargoship_pri_copyhammer"] = "cargoship_pri_copyhammer";
    level._id_78B9["cargoship_pri_restonme"] = "cargoship_pri_restonme";
    level._id_78B9["cargoship_grg_closeencounters"] = "cargoship_grg_closeencounters";
    level._id_78B9["cargoship_gm1_tooright"] = "cargoship_gm1_tooright";
    level._id_78B9["cargoship_pri_onmymark"] = "cargoship_pri_onmymark";
    level._id_78B9["cargoship_pri_checkcorners"] = "cargoship_pri_checkcorners";
    level._id_78B9["cargoship_pri_checkthose"] = "cargoship_pri_checkthose";
    level._id_78B9["cargoship_pri_keepittight"] = "cargoship_pri_keepittight";
    level._id_78B9["cargoship_gm1_moveup"] = "cargoship_gm1_moveup";
    level._id_78B9["cargoship_pri_rightside"] = "cargoship_pri_rightside";
    level._id_78B9["cargoship_grg_onit"] = "cargoship_grg_onit";
    level._id_78B9["cargoship_gm1_standingby"] = "cargoship_gm1_standingby";
    level._id_78B9["cargoship_pri_move"] = "cargoship_pri_move";
    level._id_78B9["cargoship_pri_stackup"] = "cargoship_pri_stackup";
    level._id_78B9["cargoship_grg_oneready"] = "cargoship_grg_oneready";
    level._id_78B9["cargoship_gm1_twoready"] = "cargoship_gm1_twoready";
    level._id_78B9["cargoship_pri_go"] = "cargoship_pri_go";
    level._id_78B9["cargoship_grg_zeromovement"] = "cargoship_grg_zeromovement";
    level._id_78B9["cargoship_gm1_looksquiet"] = "cargoship_gm1_looksquiet";
    level._id_78B9["cargoship_pri_stayfrosty"] = "cargoship_pri_stayfrosty";
    level._id_78B9["cargoship_pri_nextroom"] = "cargoship_pri_nextroom";
    level._id_78B9["cargoship_pri_standby"] = "cargoship_pri_standby";
    level._id_78B9["cargoship_pri_flashbangout"] = "cargoship_pri_flashbangout";
    level._id_78B9["cargoship_pri_report"] = "cargoship_pri_report";
    level._id_78B9["cargoship_grg_roomsempty"] = "cargoship_grg_roomsempty";
    level._id_78BA["escape"]["cargoship_pri_packagesecured"] = "cargoship_pri_packagesecured";
    level._id_78B9["cargoship_grg_soundrussian"] = "cargoship_grg_soundrussian";
    level._id_78B9["cargoship_hqr_notime"] = "cargoship_hqr_notime";
    level._id_78BA["escape"]["cargoship_grg_fastmovers"] = "cargoship_grg_fastmovers";
    level._id_78BA["escape"]["cargoship_pri_getmanifestmove"] = "cargoship_pri_getmanifestmove";
    level._id_78BA["escape"]["cargoship_pri_macgetmanifest"] = "cargoship_pri_macgetmanifest";
    level._id_78BA["escape"]["cargoship_pri_donthavetime"] = "cargoship_pri_donthavetime";
    level._id_78BA["escape"]["cargoship_pri_getmanifest"] = "cargoship_pri_getmanifest";
    level._id_78BA["escape"]["cargoship_pri_gottamove"] = "cargoship_pri_gottamove";
    level._id_78BA["escape"]["cargoship_pri_manifestletsgo"] = "cargoship_pri_manifestletsgo";
    level._id_78BA["escape"]["cargoship_pri_topside"] = "cargoship_pri_topside";
    level._id_78BA["escape"]["cargoship_grg_strongreading"] = "cargoship_grg_strongreading";
    level._id_78BA["escape"]["cargoship_gaz_takealook"] = "cargoship_gaz_takealook";
    level._id_78BA["escape"]["cargoship_pri_inarabic"] = "cargoship_pri_inarabic";
    level._id_78BA["escape"]["cargoship_pri_readytosecure"] = "cargoship_pri_readytosecure";
    level._id_78B9["cargoship_pri_lastcall"] = "cargoship_pri_lastcall";
    level._id_78B9["cargoship_sas4_sweetdreams"] = "cargoship_sas4_sweetdreams";
    level._id_78B9["cargoship_sas4_sleeptight"] = "cargoship_sas4_sleeptight";
    level._id_78BA["escape"]["cargoship_pri_status"] = "cargoship_pri_status";
    level._id_78B9["cargoship_gm2_aircraftinbound2"] = "cargoship_gm2_aircraftinbound2";
    level._id_78B9["cargoship_hp3_yourstatus"] = "cargoship_hp3_yourstatus";
    level._id_78BA["escape"]["cargoship_grg_shipssinking"] = "cargoship_grg_shipssinking";
    level._id_78B9["cargoship_grg_whathappened"] = "cargoship_grg_whathappened";
    level._id_78B9["cargoship_hp3_comein"] = "cargoship_hp3_comein";
    level._id_78BA["escape"]["cargoship_pri_weareleaving"] = "cargoship_pri_weareleaving";
    level._id_78BA["escape"]["cargoship_pri_onyourfeet"] = "cargoship_pri_onyourfeet";
    level._id_78BA["escape"]["cargoship_pri_gettocatwalks"] = "cargoship_pri_gettocatwalks";
    level._id_78BA["escape"]["cargoship_pri_weareleaving"] = "cargoship_pri_weareleaving";
    level._id_78BA["escape"]["cargoship_pri_backonfeet"] = "cargoship_pri_backonfeet";
    level._id_78BA["escape"]["cargoship_grg_keepmoving"] = "cargoship_grg_keepmoving";
    level._id_78B9["cargoship_hp3_talktome"] = "cargoship_hp3_talktome";
    level._id_78BA["escape"]["cargoship_pri_almostthere"] = "cargoship_pri_almostthere";
    level._id_78BA["escape"]["cargoship_grg_breakinaway"] = "cargoship_grg_breakinaway";
    level._id_78BA["escape"]["cargoship_pri_comeoncomeon"] = "cargoship_pri_comeoncomeon";
    level._id_78BA["escape"]["cargoship_grg_watchpipes"] = "cargoship_grg_watchpipes";
    level._id_78B9["cargoship_gm1_watchyerhead"] = "cargoship_gm1_watchyerhead";
    level._id_78B9["cargoship_hp3_moveit"] = "cargoship_pri_go";
    level._id_78BA["escape"]["cargoship_pri_walkinpark"] = "cargoship_pri_walkinpark";
    level._id_78BA["escape"]["cargoship_grg_outtatime"] = "cargoship_grg_outtatime";
    level._id_78BA["escape"]["cargoship_pri_keepmoving"] = "cargoship_pri_keepmoving";
    level._id_78B9["cargoship_gm1_whichway"] = "cargoship_gm1_whichway";
    level._id_78BA["escape"]["cargoship_pri_totheright"] = "cargoship_pri_totheright";
    level._id_78BA["escape"]["cargoship_grg_movego"] = "cargoship_grg_movego";
    level._id_78BA["escape"]["cargoship_grg_whereisit"] = "cargoship_grg_whereisit";
    level._id_78B9["cargoship_gm2_jumpforit"] = "cargoship_gm2_jumpforit";
    level._id_78B9["cargoship_pri_gotcha"] = "cargoship_pri_gotcha";
    level._id_78BA["escape"]["cargoship_pri_allaboard"] = "cargoship_pri_allaboard";
    level._id_78B9["cargoship_pri_allaboard"] = "cargoship_pri_allaboard";
    level._id_78B9["cargoship_hp3_outtahere"] = "cargoship_hp3_outtahere";
    level._id_78B9["cargoship_hp3_returntobase"] = "cargoship_hp3_returntobase";
    level._id_78B9["cargoship_grg_clearleft"] = "cargoship_grg_clearleft";
    level._id_78B9["cargoship_grg_clearright"] = "cargoship_grg_clearright";
    level._id_78B9["cargoship_grg_movementright"] = "cargoship_grg_movementright";
    level._id_78B9["cargoship_grg_catwalkclear"] = "cargoship_grg_catwalkclear";
    level._id_78B9["cargoship_grg_forwardclear"] = "cargoship_grg_forwardclear";
    level._id_78B9["cargoship_grg_notangos"] = "cargoship_grg_notangos";
    level._id_78B9["cargoship_gm1_clearleft"] = "cargoship_gm1_clearleft";
    level._id_78B9["cargoship_gm1_clearright"] = "cargoship_gm1_clearright";
    level._id_78B9["cargoship_gm1_movementright"] = "cargoship_gm1_movementright";
    level._id_78B9["cargoship_gm1_catwalkclear"] = "cargoship_gm1_catwalkclear";
    level._id_78B9["cargoship_gm1_forwardclear"] = "cargoship_gm1_forwardclear";
    level._id_78B9["cargoship_gm1_notangos"] = "cargoship_gm1_notangos";
    level._id_78B9["cargoship_gm1_targetneutralized"] = "cargoship_gm1_targetneutralized";
    level._id_78B9["cargoship_gm1_tangodown"] = "cargoship_gm1_tangodown";
    level._id_78B9["cargoship_gm2_targetneutralized"] = "cargoship_gm2_targetneutralized";
    level._id_78B9["cargoship_gm2_tangodown"] = "cargoship_gm2_tangodown";
    level._id_78B9["cargoship_grg_targetneutralized"] = "cargoship_grg_targetneutralized";
    level._id_78B9["cargoship_grg_tangodown"] = "cargoship_grg_tangodown";
}
#using_animtree("generic_human");

anim_gen_human()
{
    level._id_78AC["bridge_capt"]["idle"][0] = %cargoship_stunned_coffee_react_idle;
    level._id_78AC["bridge_capt"]["react"] = %cargoship_stunned_coffee_react;
    level._id_78AC["bridge_capt"]["death"] = %cargoship_stunned_coffee_death;
    level._id_78AC["bridge_tv"]["idle"][0] = %cargoship_stunned_tv_react_idle;
    level._id_78AC["bridge_tv"]["react"] = %cargoship_stunned_tv_react;
    level._id_78AC["bridge_tv"]["death"] = %cargoship_stunned_tv_death;
    level._id_78AC["bridge_clipboard"]["idle"][0] = %cargoship_stunned_clipboard_react_idle;
    level._id_78AC["bridge_clipboard"]["react"] = %cargoship_stunned_clipboard_react;
    level._id_78AC["bridge_clipboard"]["death"] = %cargoship_stunned_clipboard_death;
    level._id_78AC["bridge_stand1"]["idle"][0] = %cargoship_stunned_react_v2_idle;
    level._id_78AC["bridge_stand1"]["react"] = %cargoship_stunned_react_v2;
    level._id_78AC["bridge_stand1"]["death"] = %cargoship_stunned_react_v2_death;
    level._id_78AC["sleeper_0"]["sleep"][0] = %cargoship_sleeping_guy_idle_1;
    level._id_78AC["sleeper_0"]["death"] = %cargoship_sleeping_guy_death_1;
    level._id_78AC["sleeper_1"]["sleep"][0] = %cargoship_sleeping_guy_idle_2;
    level._id_78AC["sleeper_1"]["death"] = %cargoship_sleeping_guy_death_2;
    level._id_78AC["drunk"]["walk"] = %cargoship_drunk_sequence;
    level._id_78AC["drunk"]["death"] = %cargoship_drunk_sequence_death;
    level._id_78AC["price"]["bridge_breach"] = %h1_cgoship_bridge_breach_price;
    maps\_anim::addnotetrack_animsound( "price", "bridge_breach", "kick_door", "wood_door_kick" );
    level._id_78AC["price"]["stair_cover_exit"] = %h1_cgoship_stair_cover_exit_price;
    level._id_78AC["price"]["door_breach_setup"] = %shotgunbreach_cs_shoot_hinge;
    level._id_78AC["price"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_shoot_hinge_idle;
    level._id_78AC["price"]["door_breach_idle"] = %shotgunbreach_v1_shoot_hinge_ready_idle;
    level._id_78AC["price"]["door_breach"] = %shotgunbreach_cs_shoot_hinge_runin;
    level._id_78AC["alavi"]["bridge_breach"] = %h1_cgoship_bridge_breach_ally;
    maps\_anim::addnotetrack_animsound( "alavi", "bridge_breach", "turn_wheel_start", "scn_cargoship_intro_breaching" );
    level._id_78AC["alavi"]["bunkbed_approach"] = %h1_cgoship_bunkbed_approach_ally;
    level._id_78AC["alavi"]["door_breach_setup"] = %shotgunbreach_cs_stackb;
    level._id_78AC["alavi"]["door_breach_setup_idle"][0] = %breach_cargo_alavis_idle;
    level._id_78AC["alavi"]["door_breach_idle"] = %shotgunbreach_v1_stackb_ready_idle;
    level._id_78AC["alavi"]["door_breach"] = %breach_cargo_alavis_runin;
    level._id_78AC["grigsby"]["door_breach_setup"] = %shotgunbreach_cs_stackb;
    level._id_78AC["grigsby"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_stackb_idle;
    level._id_78AC["grigsby"]["door_breach_idle"] = %shotgunbreach_v1_stackb_ready_idle;
    level._id_78AC["grigsby"]["door_breach"] = %shotgunbreach_cs_stackb_runin;
    level._id_78AC["guy"]["grigsturn"] = %crouch_2run_180;
    level._id_78AC["guy"]["grigstop"] = %run_2_stand_f_6;
    level._id_78AC["guy"]["grigsgo"] = %stand_2_run_f_2;
    level._id_78AC["patrol"]["pause"] = %active_patrolwalk_pause;
    level._id_78AC["patrol"]["turn"] = %active_patrolwalk_turn_180;
    level._id_78AC["patrol"]["walk1"] = %active_patrolwalk_v1;
    level._id_78AC["patrol"]["walk2"] = %active_patrolwalk_v2;
    level._id_78AC["patrol"]["walk3"] = %active_patrolwalk_v3;
    level._id_78AC["patrol"]["walk4"] = %active_patrolwalk_v4;
    level._id_78AC["patrol"]["walk5"] = %active_patrolwalk_v5;
    level._id_78AC["guy"]["explosion"] = %death_explosion_run_f_v1;
    level._id_78AC["sprinter"]["sprint"] = %sprint1_loop;
    level._id_78AC["pulp_fiction_guy"]["run"] = %unarmed_run_russian;
    level._id_78AC["guy"]["grenade_throw"] = %corner_standl_grenade_b;
    level._id_78AC["guy"]["corner_l_look"] = %corner_standl_alert_2_look;
    level._id_78AC["guy"]["corner_l_quickreact"] = %corner_standl_look_2_alert_fast_v1;
    level._id_78AC["guy"]["corner_l_idle"][0] = %corner_standl_alert_idle;
    level._id_78AC["guy"]["corner_l_idle"][1] = %corner_standl_alert_twitch01;
    level._id_78AC["guy"]["corner_l_idle"][2] = %corner_standl_alert_twitch02;
    level._id_78AC["guy"]["corner_l_idle"][3] = %corner_standl_alert_twitch03;
    level._id_78AC["guy"]["corner_l_idle"][4] = %corner_standl_alert_twitch06;
    level._id_78AC["guy"]["corner_l_idle"][5] = %corner_standl_alert_twitch07;
    level._id_78AC["guy"]["grenade_throw"] = %corner_standl_grenade_b;
    level._id_78AC["guy"]["grenade_throwR"] = %corner_standr_grenade_b;
    level._id_78AC["guy"]["onme"] = %cqb_stand_wave_on_me;
    level._id_78AC["guy"]["go"] = %cqb_stand_wave_go_v1;
    level._id_78AC["guy"]["onme_back"] = %cqb_stand_wave_on_me_back;
    level._id_78AC["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["onme_back"] = %cqb_stand_wave_on_me_back;
    level._id_78AC["generic"]["signal_go_cqb"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_onme_cqb"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_onme_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_go_crouch"] = %cqb_stand_wave_go_v1;
    maps\_anim::addnotetrack_animsound( "generic", "signal_onme", "foley_sound", "foly_waving_go" );
    level._id_78AC["guy"]["coverstand_aim"] = %coverstand_hide_2_aim;
    level._id_78AC["guy"]["coverleft_crouch_aim"] = %cornercrl_alert_2_stand;
    level._id_78AC["guy"]["standaim2idle"] = %casual_stand_idle_trans_in;
    level._id_78AC["generic"]["standidle2aim"] = %casual_stand_idle_trans_out;
    level._id_78AC["generic"]["standaim"][0] = %exposed_aim_5;
    level._id_78AC["guy"]["standidle"][0] = %casual_stand_idle;
    level._id_78AC["guy"]["standidle"][1] = %casual_stand_idle_twitch;
    level._id_78AC["guy"]["standidle"][2] = %casual_stand_idle_twitchb;
    level._id_78AC["shuffle"]["loop"] = %walk_left;
    level._id_78AC["shuffle"]["exit"] = %trans_walkl_2_run;
    level._id_78AC["shuffle"]["stop"] = %casual_stand_idle_trans_in;
    level._id_78AC["shuffle"]["arrival"] = %trans_run_2_walkl;
    level._id_78AC["guy"]["cornerright8"] = %corner_standr_trans_out_8;
    level._id_78AC["guy"]["cornerright9"] = %corner_standr_trans_out_9;
    level._id_78AC["guy"]["cornerleft8"] = %corner_standl_trans_out_8;
    level._id_78AC["guy"]["cornerleft7"] = %corner_standl_trans_out_7;
    level._id_78AC["guy"]["cornerleft6"] = %corner_standl_trans_out_6;
    level._id_78AC["guy"]["stand2run"] = %stand_2_run_f_2;
    level._id_78AC["generic"]["stand2run"] = %stand_2_run_f_2;
    level._id_78AC["guy"]["stand2run180"] = %stand_2_run_180_med;
    level._id_78AC["guy"]["stand2runL"] = %stand_2_run_l;
    level._id_78AC["guy"]["stand2runR"] = %stand_2_run_r;
    level._id_78AC["guy"]["cqbstart4"] = %cqb_start_4;
    level._id_78AC["flashed"]["0"] = %exposed_flashbang_v1;
    level._id_78AC["flashed"]["1"] = %exposed_flashbang_v2;
    level._id_78AC["flashed"]["2"] = %exposed_flashbang_v3;
    level._id_78AC["flashed"]["3"] = %exposed_flashbang_v4;
    level._id_78AC["flashed"]["4"] = %exposed_flashbang_v5;
    level._id_78AC["guy"]["crouch2run"] = %crouch_2run_f;
    level._id_78AC["guy"]["walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["guy"]["jog"] = %huntedrun_2;
    level._id_78AC["escape"]["blowback"] = %backdraft;
    level._id_78AC["escape"]["standup"] = %prone_2_stand;
    level._id_78AC["generic"]["lean_left"] = %cargoship_run_leanl;
    level._id_78AC["generic"]["lean_right"] = %cargoship_run_leanr;
    level._id_78AC["generic"]["lean_forward"] = %run_lowready_f;
    level._id_78AC["generic"]["lean_back"] = %run_lowready_f;
    level._id_78AC["generic"]["lean_none"] = %run_lowready_f;
    level._id_78AC["generic"]["lean_left_jog"] = %cargoship_jog_leanl;
    level._id_78AC["generic"]["lean_right_jog"] = %cargoship_jog_leanr;
    level._id_78AC["generic"]["lean_forward_jog"] = %combat_jog;
    level._id_78AC["generic"]["lean_back_jog"] = %combat_jog;
    level._id_78AC["generic"]["lean_none_jog"] = %combat_jog;
    level._id_78AC["escape"]["stumble1"] = %run_pain_fallonknee;
    level._id_78AC["escape"]["stumble2"] = %run_pain_stomach;
    level._id_78AC["escape"]["stumble3"] = %run_pain_fallonknee_02;
    level._id_78AC["escape"]["turn_l"] = %run_tight_turn_l90;
    level._id_78AC["escape"]["turn_r"] = %run_tight_turn_r90;
    level._id_78AC["seat5"]["rescue"][0] = %cargoship_ch46_rescue_load_4_idle;
    level._id_78AC["seat6"]["rescue"][0] = %cargoship_ch46_rescue_load_5_idle;
    level._id_78AC["generic"]["rescue_alavi"] = %cargoship_ch46_rescue_load_1;
    level._id_78AC["generic"]["rescue_alavi_idle"][0] = %cargoship_ch46_rescue_load_1_idle;
    level._id_78AC["generic"]["help_alavi"] = %cargoship_ch46_rescue_load_1_help;
    level._id_78AC["generic"]["rescue_grigsby"] = %cargoship_ch46_rescue_load_2;
    level._id_78AC["generic"]["rescue_grigsby_idle"][0] = %cargoship_ch46_rescue_load_2_idle;
    level._id_78AC["generic"]["help_grigsby"] = %cargoship_ch46_rescue_load_2_help;
    level._id_78AC["generic"]["rescue_price"] = %cargoship_ch46_rescue_load_3;
    level._id_78AC["generic"]["reach_price"] = %cargoship_ch46_rescue_load_3_alt;
    level._id_78AC["generic"]["rescue_price_idle"][0] = %cargoship_ch46_rescue_price_idle;
    level._id_78AC["generic"]["help_price"] = %cargoship_ch46_rescue_price_help;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "help_price", "cargoship_pri_gotcha" );
    level._id_78AC["generic"]["price_explosion"] = %cargoship_explosion_price;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "price_explosion", "cargoship_pri_weareleaving" );
    level._id_78AC["generic"]["grigsby_explosion"] = %h1_cargoship_explosion_gaz;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "grigsby_explosion", "cargoship_grg_shipssinking" );
    level._id_78AC["generic"]["breach2_price_arrival"] = %cargoship_price_run2door;
    level._id_78AC["generic"]["breach2_price_idle"][0] = %cargoship_price_run2door_idle;
    level._id_78AC["generic"]["breach2_price_breach"] = %cargoship_price_runin;
    maps\_anim::addnotetrack_animsound( "generic", "breach2_price_breach", "sound_opendoor", "scn_door_cargoship_hatch_open" );
    level._id_78AC["generic"]["breach2_grigsby_arrival"] = %cargoship_grigsby_run2door;
    level._id_78AC["generic"]["breach2_grigsby_idle"][0] = %cargoship_grigsby_run2door_idle;
    level._id_78AC["generic"]["breach2_grigsby_breach"] = %cargoship_grigsby_runin;
    level._id_78AC["generic"]["breach2_grigsby_talk"] = %cargoship_grigsby_shotgun_pullout;
    level._id_78AC["generic"]["breach2_alavi_arrival"] = %cargoship_alavie_run2door;
    level._id_78AC["generic"]["breach2_alavi_idle"][0] = %cargoship_alavie_run2door_idle;
    level._id_78AC["generic"]["breach2_alavi_breach"] = %cargoship_alavie_runin;
    maps\_anim::addnotetrack_customfunction( "generic", "gun_2_chest", maps\cargoship_code::carogship_shotgunpulla, "breach2_grigsby_talk" );
    maps\_anim::addnotetrack_customfunction( "generic", "shotgun_pickup", maps\cargoship_code::carogship_shotgunpullb, "breach2_grigsby_talk" );
    level._id_78AC["generic"]["breach2_door_breach"] = %cargoship_price_runin_door;
    level._id_78AC["generic"]["package_idle_waitinggunup"][0] = %exposed_aim_5;
    level._id_78AC["generic"]["package_idle_waitinggundown"][0] = %casual_stand_idle;
    level._id_78AC["generic"]["package_opendoor_price"] = %h1_cargoship_open_cargo_price;
    level._id_78AC["generic"]["package_idle_price"][0] = %h1_cargoship_open_cargo_price_idle;
    level._id_78AC["generic"]["package_idle_grigs"][0] = %h1_cargoship_open_cargo_guyl_idle;
    level._id_78AC["escape"]["package_grigs"] = %cargoship_open_cargo_guyl;
    level._id_78AC["generic"]["package_grigs"] = %cargoship_open_cargo_guyl;
    level._id_78AC["generic"]["package_doorL"] = %cargoship_open_cargo_doorl;
    level._id_78AC["generic"]["package_doorR"] = %cargoship_open_cargo_doorr;
    maps\_anim::addnotetrack_animsound( "generic", "package_doorR", "sound", "door_cargo_container_pull_open" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_opendoor_price", "cargoship_pri_inarabic" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_opendoor_price", "cargoship_pri_readytosecure" );
    maps\_anim::addnotetrack_flag( "generic", "radio", "radiomessage_notime", "package_opendoor_price" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog2", "package_opendoor_price", "cargoship_pri_getmanifestmove" );
    maps\_anim::addnotetrack_flag( "generic", "animend", "package_orders", "package_opendoor_price" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_grigs", "cargoship_grg_fastmovers" );
    level._id_78B1["escape"] = #animtree;
    level._id_78AC["escape"]["price_escape_1"] = %h1_cargoship_priceescape01;
    level._id_78AC["escape"]["price_escape_2"] = %h1_cargoship_priceescape02;
    level._id_78AC["escape"]["price_escape_3"] = %h1_cargoship_priceescape03;
    level._id_78AC["escape"]["price_escape_4"] = %h1_cargoship_priceescape04;
    level._id_78AC["escape"]["price_escape_5"] = %h1_cargoship_priceescape05;
}
#using_animtree("player");

anim_player()
{
    precachemodel( "worldhands_h1_sas_ct" );
    level._id_78B1["end_hands"] = #animtree;
    level._id_78B5["end_hands"] = "worldhands_h1_sas_ct";
    level._id_78AC["end_hands"]["player_rescue"] = %cargoship_ch46_rescue_load_player;
    precachemodel( "worldbody_h1_sas_ct" );
    precacheitem( "mp5_silencer" );
    level._id_78B1["fastrope_intro"] = #animtree;
    level._id_78B5["fastrope_intro"] = "worldbody_h1_sas_ct";
    level._id_78AC["fastrope_intro"]["opening"] = %h1_cargoship_opening_player;
    level._id_78AC["fastrope_intro"]["loop"][0] = %h1_cargoship_opening_player;
    level.scr_gun["fastrope_intro"] = "viewmodel_mp5_silencer";
    level._id_78B1["player_viewbody"] = #animtree;
    level._id_78B5["player_viewbody"] = "worldbody_h1_sas_ct";
    level._id_78AC["player_viewbody"]["player_explosion"] = %cargoship_explosion_player;
    level._id_78AC["player_viewbody"]["player_explosion_start"] = %h1_cargoship_explosion_reaction_player;
    maps\_anim::addnotetrack_flag( "player_viewbody", "fade_in", "shellshock_blinking", "player_explosion" );
    maps\_anim::addnotetrack_flag_clear( "player_viewbody", "fade_out", "shellshock_blinking", "player_explosion" );
    maps\_anim::addnotetrack_flag( "player_viewbody", "blur_in", "shellshock_blur", "player_explosion" );
    maps\_anim::addnotetrack_flag_clear( "player_viewbody", "blur_out", "shellshock_blur", "player_explosion" );
    maps\_anim::addnotetrack_animsound( "fastrope_intro", "opening", "scn_cgo_intro_player_fastrope", "scn_cgo_intro_player_fastrope" );
    maps\_anim::addnotetrack_animsound( "player_viewbody", "player_explosion", "scn_cargo_explosion_foley", "scn_cargo_explosion_foley" );
}
#using_animtree("vehicles");

anim_seaknight()
{
    level._id_78AC["bigbird"]["in"] = %cargoship_ch46_rescue_in;
    level._id_78AC["bigbird"]["idle"][0] = %cargoship_ch46_rescue_idle;
    level._id_78AC["bigbird"]["drift"] = %cargoship_ch46_rescue_drift;
    level._id_78AC["bigbird"]["drift_idle"][0] = %cargoship_ch46_rescue_drift_idle;
    level._id_78AC["bigbird"]["out"] = %cargoship_ch46_rescue_out;
}

anim_blackhawk()
{
    level._id_78B1["blackhawk"] = #animtree;
    level._id_78AC["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}
#using_animtree("door");

anim_door()
{
    level._id_78AC["door"]["door_breach"] = %shotgunbreach_v1_shoot_hinge_door;
    level._id_78B1["door"] = #animtree;
    level._id_78B5["door"] = "cs_cargoship_door_PUSH";
    precachemodel( level._id_78B5["door"] );
}
#using_animtree("chair");

anim_chair()
{
    level._id_78AC["chair"]["start"][0] = %cargoship_stunned_coffee_death_chair_startidle;
    level._id_78AC["chair"]["fall"] = %cargoship_stunned_coffee_death_chair;
    level._id_78AC["chair"]["end"][0] = %cargoship_stunned_coffee_death_chair_endidle;
}
#using_animtree("script_model");

anim_sea()
{
    level._id_78AC["sea"]["waves"][0] = %cargoship_water;
}

anim_props()
{
    level._id_78B1["bridge_door_anim"] = #animtree;
    level._id_78B5["bridge_door_anim"] = "cs_cargoship_door_PULL";
    level._id_78AC["bridge_door_anim"]["bridge_breach"] = %h1_cgoship_bridge_breach_door;
}
