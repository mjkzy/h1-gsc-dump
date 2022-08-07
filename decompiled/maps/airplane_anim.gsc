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
    _id_0C7A();
    _id_29F3();
    exploder_script_model_anims();
    luggage_compartment_anims();
    center_console_anims();
    air_mask_anims();
    bathroom_door_anims();
}
#using_animtree("generic_human");

_id_0C7A()
{
    level._id_78AC["frnd"]["C4_plant_start"] = %explosive_plant_knee;
    level._id_78AC["frnd"]["C4_plant"] = %explosive_plant_knee;
    maps\_hand_signals::_id_4DC4();
    level._id_78AC["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_stop"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["signal_moveup"] = %cqb_stand_signal_move_up;
    level._id_78AC["generic"]["signal_moveout"] = %cqb_stand_signal_move_out;
    level._id_78AC["generic"]["signal_check"] = %cqb_stand_signal_twitch_check;
    level._id_78AC["generic"]["signal_look"] = %cqb_stand_signal_twitch_look;
    level._id_78AC["generic"]["signal_quicklook"] = %cqb_stand_signal_twitch_quicklook;
    level._id_78AC["generic"]["signal_shift"] = %cqb_stand_signal_twitch_shift;
    level._id_78AC["generic"]["signal_twitch"] = %cqb_stand_twitch;
    level._id_78AC["generic"]["moveout_exposed"] = %stand_exposed_wave_move_out;
    level._id_78AC["generic"]["moveup_exposed"] = %stand_exposed_wave_move_up;
    level._id_78AC["generic"]["stop_exposed"] = %stand_exposed_wave_halt;
    level._id_78AC["generic"]["stop2_exposed"] = %stand_exposed_wave_halt_v2;
    level._id_78AC["generic"]["onme_exposed"] = %stand_exposed_wave_on_me;
    level._id_78AC["generic"]["onme2_exposed"] = %stand_exposed_wave_on_me_v2;
    level._id_78AC["generic"]["enemy_exposed"] = %stand_exposed_wave_target_spotted;
    level._id_78AC["generic"]["down_exposed"] = %stand_exposed_wave_down;
    level._id_78AC["generic"]["go_exposed"] = %stand_exposed_wave_go;
    level._id_78AC["generic"]["moveout_cornerR"] = %cornerstndr_alert_signal_move_out;
    level._id_78AC["generic"]["stop_cornerR"] = %cornerstndr_alert_signal_stopstay_down;
    level._id_78AC["generic"]["onme_cornerR"] = %cornerstndr_alert_signal_on_me;
    level._id_78AC["generic"]["enemy_cornerR"] = %cornerstndr_alert_signal_enemy_spotted;
    level._id_78AC["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
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
    level._id_78AC["generic"]["patrol_jog"] = %patrol_jog;
    level._id_78AC["generic"]["combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["patrol_jog_turn180"] = %patrol_jog_360;
    level._id_78AC["generic"]["stealth_jog"] = %patrol_jog;
    level._id_78AC["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["death_pose_sit_1"][0] = %death_sitting_pose_v1;
    level._id_78AC["generic"]["death_pose_sit_2"][0] = %death_sitting_pose_v2;
    level._id_78AC["generic"]["death_pose_chair_1"][0] = %airlift_copilot_dead;
    level._id_78AC["generic"]["death_pose_floor_1"][0] = %cargoship_sleeping_guy_idle_1;
    level._id_78AC["generic"]["death_pose_floor_2"][0] = %cargoship_sleeping_guy_idle_2;
    level._id_78AC["generic"]["death_pose_desk"][0] = %death_pose_on_desk;
    level._id_78AC["generic"]["death_pose_window"][0] = %death_pose_on_window;
    level._id_78AC["hostage"]["unarmed_run1"] = %unarmed_run_russian;
    level._id_78AC["hostage"]["unarmed_run2"] = %unarmed_panickedrun_loop_v1;
    level._id_78AC["hostage"]["unarmed_run3"] = %unarmed_panickedrun_loop_v2;
    level._id_78AC["hostage"]["human_shield_idle"][0] = %human_shield_idle_1_h;
    level._id_78AC["terrorist"]["human_shield_idle"][0] = %human_shield_idle_1_t;
    level._id_78AC["terrorist"]["human_shield_death"] = %human_shield_death_1_t;
    level._id_78AC["hostage"]["human_shield_death"] = %hostage_human_shield_host_death;
    level._id_78AC["terrorist"]["human_shield_pain"] = %human_shield_wounded_1_t;
    level._id_78AC["hostage"]["human_shield_breakfree_partner_dead"] = %human_shield_death_1_h;
    level._id_78AC["terrorist"]["human_shield_breakfree_partner_dead"] = %terrorist_human_shield_host_death;
    level._id_78AC["hostage"]["human_shield_breakfree_partner_wounded"] = %human_shield_wounded_1_h;
    level._id_78AC["bridge_stand1"]["idle"][0] = %cargoship_stunned_react_v2_idle;
    level._id_78AC["bridge_stand1"]["react"] = %cargoship_stunned_react_v2;
    level._id_78AC["bridge_stand1"]["death"] = %cargoship_stunned_react_v2_death;
    level._id_78AC["hostage"]["standunarmed_idle_loop"][0] = %standunarmed_idle_loop;
    level._id_78AC["hostage"]["unarmed_crouch_idle1"][0] = %unarmed_crouch_idle1;
    level._id_78AC["hostage"]["unarmed_crouch_twitch1"] = %unarmed_crouch_twitch1;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        level._id_78AC["hostage"]["airplane_end_VIP_idle"][0] = %airplane_end_vip_idle;
        level._id_78AC["hostage"]["airplane_end_VIP_start"] = %airplane_end_vip;
        level._id_78AC["frnd"]["airplane_end_VIP_start"] = %airplane_end_soldier;
        level._id_78AC["hostage"]["airplane_end_VIP"] = %airplane_end_vip;
        level._id_78AC["frnd"]["airplane_end_VIP"] = %airplane_end_soldier;
    }
    else
    {
        level._id_78AC["hostage"]["airplane_end_VIP_idle"][0] = %h1_airplane_tandem_jump_vip_idle;
        level._id_78AC["hostage"]["airplane_end_VIP_start"] = %h1_airplane_tandem_jump_vip;
        level._id_78AC["frnd"]["airplane_end_VIP_start"] = %h1_airplane_tandem_jump_soldier;
        level._id_78AC["hostage"]["airplane_end_VIP"] = %h1_airplane_tandem_jump_vip;
        level._id_78AC["frnd"]["airplane_end_VIP"] = %h1_airplane_tandem_jump_soldier;
    }
}

_id_29F3()
{
    level.dialoguemovelines = 3;
    level._id_78B9["airplane_gaz_keepmoving_1"] = "airplane_gaz_move";
    level._id_78B9["airplane_gaz_keepmoving_2"] = "airplane_gaz_moveup";
    level._id_78B9["airplane_gaz_keepmoving_3"] = "airplane_gaz_keepmoving";
    level.dialoguehostiledown = 12;
    level._id_78B9["airplane_killfirm_1"] = "airplane_gaz_tangodown";
    level._id_78B9["airplane_killfirm_2"] = "airplane_gaz_xraydown";
    level._id_78B9["airplane_killfirm_3"] = "airplane_gaz_hostileneut";
    level._id_78B9["airplane_killfirm_4"] = "airplane_gaz_targneut";
    level._id_78B9["airplane_killfirm_5"] = "airplane_sas1_tangodown";
    level._id_78B9["airplane_killfirm_6"] = "airplane_sas1_xraydown";
    level._id_78B9["airplane_killfirm_7"] = "airplane_sas1_hostileneut";
    level._id_78B9["airplane_killfirm_8"] = "airplane_sas1_targneut";
    level._id_78B9["airplane_killfirm_9"] = "airplane_sas4_tangodown";
    level._id_78B9["airplane_killfirm_10"] = "airplane_sas4_xraydown";
    level._id_78B9["airplane_killfirm_11"] = "airplane_sas4_hostileneut";
    level._id_78B9["airplane_killfirm_12"] = "airplane_sas4_targneut";
    level.dialogueareaclear = 9;
    level._id_78B9["airplane_areaclear_1"] = "airplane_gaz_areaclear";
    level._id_78B9["airplane_areaclear_2"] = "airplane_gaz_sectionclear";
    level._id_78B9["airplane_areaclear_3"] = "airplane_gaz_clear";
    level._id_78B9["airplane_areaclear_4"] = "airplane_sas1_areaclear";
    level._id_78B9["airplane_areaclear_5"] = "airplane_sas1_sectionclear";
    level._id_78B9["airplane_areaclear_6"] = "airplane_sas1_clear";
    level._id_78B9["airplane_areaclear_7"] = "airplane_sas4_areaclear";
    level._id_78B9["airplane_areaclear_8"] = "airplane_sas4_sectionclear";
    level._id_78B9["airplane_areaclear_9"] = "airplane_sas4_clear";
    level._id_78B9["airplane_gaz_capturekriegler"] = "airplane_gaz_capturekriegler";
    level._id_78B9["airplane_gaz_goindeep"] = "airplane_gaz_goindeep";
    level._id_78B9["airplane_sas1_surely"] = "airplane_sas1_surely";
    level._id_78B9["airplane_gaz_shirley"] = "airplane_gaz_shirley";
    level._id_78B9["airplane_gaz_okgetready"] = "airplane_gaz_okgetready";
    level._id_78B9["airplane_first_hostile_killed_1"] = "airplane_sas4_onealpha";
    level._id_78B9["airplane_first_hostile_killed_2"] = "airplane_gaz_weaponsfree";
    level._id_78B9["airplane_sas4_multiplecont"] = "airplane_sas4_multiplecont";
    level._id_78B9["airplane_gaz_stairwayclear"] = "airplane_gaz_stairwayclear";
    level._id_78B9["airplane_gaz_standby"] = "airplane_gaz_standby";
    level._id_78B9["airplane_gaz_hullbreach"] = "airplane_gaz_hullbreach";
    level._id_78B9["airplane_gaz_watchyourfire"] = "airplane_gaz_watchyourfire";
    level._id_78B9["airplane_gaz_needkriegleralive"] = "airplane_gaz_needkriegleralive";
    level._id_78B9["airplane_gaz_needvipalive"] = "airplane_gaz_needvipalive";
    level._id_78B9["airplane_gaz_downonfloor"] = "airplane_gaz_downonfloor";
    level._id_78B9["airplane_gaz_takehim"] = "airplane_gaz_takehim";
    level._id_78BA["terrorist"]["airplane_ter_illkillhim"] = "airplane_ter_illkillhim";
    level._id_78B9["airplane_gaz_niceone"] = "airplane_gaz_niceone";
    level._id_78B9["airplane_sas4_armedbomb"] = "airplane_sas4_armedbomb";
    level._id_78BA["frnd"]["airplane_gaz_dooropen"] = "airplane_gaz_dooropen";
    level._id_78B9["airplane_gaz_preptobreach"] = "airplane_gaz_preptobreach";
    level._id_78BA["hostage"]["airplane_ru4_donthurtme"] = "airplane_ru4_donthurtme";
    level._id_78BA["hostage"]["airplane_ru4_gettoaphone"] = "airplane_ru4_gettoaphone";
    level._id_78B9["airplane_gaz_littlefreefall"] = "airplane_gaz_littlefreefall";
    level._id_78B9["airplane_gaz_onyourfeet"] = "airplane_gaz_onyourfeet";
    level._id_78BA["hostage"]["airplane_ru4_noparachute"] = "airplane_ru4_noparachute";
    level._id_78B9["airplane_sas4_thatsoneway"] = "airplane_sas4_thatsoneway";
    level._id_78B9["airplane_sas1_letsgo"] = "airplane_sas1_letsgo";
    level._id_78B9["airplane_gaz_seeya"] = "airplane_gaz_seeya";
    _id_6C50();
}
#using_animtree("player");

_id_6C50()
{
    level._id_78B1["player_view"] = #animtree;
    level._id_78B5["player_view"] = "viewhands_player_usmc";
    level._id_78B1["worldbody"] = #animtree;
    level._id_78B5["worldbody"] = "worldbody_h1_sas_ct";
    level._id_78AC["worldbody"]["airplane_end_player"] = %h1_airplane_tandem_jump_full;
}
#using_animtree("script_model");

exploder_script_model_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_airplane_breach_lowwer0_anim"] = %h1_airplane_breach_lowwer0_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_breach_lowwer1_anim"] = %h1_airplane_breach_lowwer1_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_breach_lowwer2_anim"] = %h1_airplane_breach_lowwer2_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_breach_lowwer3_anim"] = %h1_airplane_breach_lowwer3_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_breach_lowwer4_anim"] = %h1_airplane_breach_lowwer4_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_upper_breach0_anim"] = %h1_airplane_upper_breach0_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_upper_breach1_anim"] = %h1_airplane_upper_breach1_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_upper_breach2_anim"] = %h1_airplane_upper_breach2_anim;
    level._id_78AC["exploder_script_model"]["h1_airplane_upper_breach3_anim"] = %h1_airplane_upper_breach3_anim;
}

luggage_compartment_anims()
{
    level._id_78B1["bin"] = #animtree;
    level._id_78AC["bin"]["bin_open"] = %h1_airplane_overhead_bin_open_anim;
    level._id_78AC["bin"]["bin_shake"][0] = %h1_airplane_overhead_bin_shake_anim;
}

center_console_anims()
{
    level._id_78B1["center_console"] = #animtree;
    level._id_78AC["center_console"]["center_console_open"] = %h1_airplane_center_console_open;
    level._id_78AC["center_console"]["center_console_shake"][0] = %h1_airplane_center_console_shake;
}

air_mask_anims()
{
    level._id_78B1["air_mask"] = #animtree;
    level._id_78AC["air_mask"]["air_masks_breach_fall"] = %ap_air_masks_breach_fall;
    level._id_78AC["air_mask"]["air_masks_breach_loop"][0] = %ap_air_masks_breach_loop;
    level._id_78AC["air_mask"]["air_masks_fall"] = %ap_air_masks_fall;
    level._id_78AC["air_mask"]["air_masks_loop"][0] = %ap_air_masks_loop;
}

bathroom_door_anims()
{
    level._id_78B1["bathroom_door"] = #animtree;
    level._id_78AC["bathroom_door"]["bathroom_door_shake"][0] = %h1_airplane_bathroom_door_animated_shake;
    maps\_anim::_id_0805( "bathroom_door", "bathroom_door_shake", "start", "emt_metal_shake" );
}
