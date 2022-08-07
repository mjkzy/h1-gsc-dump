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

_id_4D1B()
{
    if ( isdefined( anim._id_5F39 ) )
        return;

    anim._id_5F39 = 1;

    if ( !isdefined( anim._id_22C7 ) )
        anim._id_22C7 = [];

    if ( !isdefined( anim._id_22A3 ) )
        anim._id_22A3 = [];

    anim._id_5A2F = [];
    anim._id_33E8 = [];
    anim._id_973E = [];

    if ( !isdefined( anim._id_22C9 ) )
        anim._id_22C9 = [];

    if ( !isdefined( anim._id_22A5 ) )
        anim._id_22A5 = [];

    anim._id_22A7 = [];
    anim._id_22CA = [];

    if ( !isdefined( anim._id_22C8 ) )
        anim._id_22C8 = [];

    if ( !isdefined( anim._id_22A4 ) )
        anim._id_22A4 = [];

    anim._id_0D24 = [];
}
#using_animtree("generic_human");

_id_4E1E()
{
    var_0 = [];
    var_0["right"][1] = %corner_standr_trans_in_1;
    var_0["right"][2] = %corner_standr_trans_in_2;
    var_0["right"][3] = %corner_standr_trans_in_3;
    var_0["right"][4] = %corner_standr_trans_in_4;
    var_0["right"][6] = %corner_standr_trans_in_6;
    var_0["right"][8] = %corner_standr_trans_in_8;
    var_0["right"][9] = %corner_standr_trans_in_9;
    var_0["right_crouch"][1] = %cornercrr_trans_in_ml;
    var_0["right_crouch"][2] = %cornercrr_trans_in_m;
    var_0["right_crouch"][3] = %cornercrr_trans_in_mr;
    var_0["right_crouch"][4] = %cornercrr_trans_in_l;
    var_0["right_crouch"][6] = %cornercrr_trans_in_r;
    var_0["right_crouch"][8] = %cornercrr_trans_in_f;
    var_0["right_crouch"][9] = %cornercrr_trans_in_mf;
    var_0["right_cqb"][1] = %corner_standr_trans_cqb_in_1;
    var_0["right_cqb"][2] = %corner_standr_trans_cqb_in_2;
    var_0["right_cqb"][3] = %corner_standr_trans_cqb_in_3;
    var_0["right_cqb"][4] = %corner_standr_trans_cqb_in_4;
    var_0["right_cqb"][6] = %corner_standr_trans_cqb_in_6;
    var_0["right_cqb"][8] = %corner_standr_trans_cqb_in_8;
    var_0["right_cqb"][9] = %corner_standr_trans_cqb_in_9;
    var_0["right_crouch_cqb"][1] = %cornercrr_cqb_trans_in_1;
    var_0["right_crouch_cqb"][2] = %cornercrr_cqb_trans_in_2;
    var_0["right_crouch_cqb"][3] = %cornercrr_cqb_trans_in_3;
    var_0["right_crouch_cqb"][4] = %cornercrr_cqb_trans_in_4;
    var_0["right_crouch_cqb"][6] = %cornercrr_cqb_trans_in_6;
    var_0["right_crouch_cqb"][8] = %cornercrr_cqb_trans_in_8;
    var_0["right_crouch_cqb"][9] = %cornercrr_cqb_trans_in_9;
    var_0["left"][1] = %corner_standl_trans_in_1;
    var_0["left"][2] = %corner_standl_trans_in_2;
    var_0["left"][3] = %corner_standl_trans_in_3;
    var_0["left"][4] = %corner_standl_trans_in_4;
    var_0["left"][6] = %corner_standl_trans_in_6;
    var_0["left"][7] = %corner_standl_trans_in_7;
    var_0["left"][8] = %corner_standl_trans_in_8;
    var_0["left_crouch"][1] = %cornercrl_trans_in_ml;
    var_0["left_crouch"][2] = %cornercrl_trans_in_m;
    var_0["left_crouch"][3] = %cornercrl_trans_in_mr;
    var_0["left_crouch"][4] = %cornercrl_trans_in_l;
    var_0["left_crouch"][6] = %cornercrl_trans_in_r;
    var_0["left_crouch"][7] = %cornercrl_trans_in_mf;
    var_0["left_crouch"][8] = %cornercrl_trans_in_f;
    var_0["left_cqb"][1] = %corner_standl_trans_cqb_in_1;
    var_0["left_cqb"][2] = %corner_standl_trans_cqb_in_2;
    var_0["left_cqb"][3] = %corner_standl_trans_cqb_in_3;
    var_0["left_cqb"][4] = %corner_standl_trans_cqb_in_4;
    var_0["left_cqb"][6] = %corner_standl_trans_cqb_in_6;
    var_0["left_cqb"][7] = %corner_standl_trans_cqb_in_7;
    var_0["left_cqb"][8] = %corner_standl_trans_cqb_in_8;
    var_0["left_crouch_cqb"][1] = %cornercrl_cqb_trans_in_1;
    var_0["left_crouch_cqb"][2] = %cornercrl_cqb_trans_in_2;
    var_0["left_crouch_cqb"][3] = %cornercrl_cqb_trans_in_3;
    var_0["left_crouch_cqb"][4] = %cornercrl_cqb_trans_in_4;
    var_0["left_crouch_cqb"][6] = %cornercrl_cqb_trans_in_6;
    var_0["left_crouch_cqb"][7] = %cornercrl_cqb_trans_in_7;
    var_0["left_crouch_cqb"][8] = %cornercrl_cqb_trans_in_8;
    var_0["crouch"][1] = %covercrouch_run_in_ml;
    var_0["crouch"][2] = %covercrouch_run_in_m;
    var_0["crouch"][3] = %covercrouch_run_in_mr;
    var_0["crouch"][4] = %covercrouch_run_in_l;
    var_0["crouch"][6] = %covercrouch_run_in_r;
    var_0["stand"][1] = %coverstand_trans_in_ml;
    var_0["stand"][2] = %coverstand_trans_in_m;
    var_0["stand"][3] = %coverstand_trans_in_mr;
    var_0["stand"][4] = %coverstand_trans_in_l;
    var_0["stand"][6] = %coverstand_trans_in_r;
    var_0["stand_saw"][1] = %saw_gunner_runin_ml;
    var_0["stand_saw"][2] = %saw_gunner_runin_m;
    var_0["stand_saw"][3] = %saw_gunner_runin_mr;
    var_0["stand_saw"][4] = %saw_gunner_runin_l;
    var_0["stand_saw"][6] = %saw_gunner_runin_r;
    var_0["stand_unstable"] = [];
    var_0["stand_unstable"][1] = %lag_unstable_moveforward_arrive_1;
    var_0["stand_unstable"][2] = %lag_unstable_moveforward_arrive_2;
    var_0["stand_unstable"][3] = %lag_unstable_moveforward_arrive_3;
    var_0["stand_unstable"][4] = %lag_unstable_moveforward_arrive_4;
    var_0["stand_unstable"][6] = %lag_unstable_moveforward_arrive_6;
    var_0["stand_unstable"][7] = %lag_unstable_moveforward_arrive_7;
    var_0["stand_unstable"][8] = %lag_unstable_moveforward_arrive_8;
    var_0["stand_unstable"][9] = %lag_unstable_moveforward_arrive_9;
    var_0["stand_unstable_run"] = [];
    var_0["stand_unstable_run"][1] = %lag_unstable_run_arrive_1;
    var_0["stand_unstable_run"][2] = %lag_unstable_run_arrive_2;
    var_0["stand_unstable_run"][3] = %lag_unstable_run_arrive_3;
    var_0["stand_unstable_run"][4] = %lag_unstable_run_arrive_4;
    var_0["stand_unstable_run"][6] = %lag_unstable_run_arrive_6;
    var_0["stand_unstable_run"][7] = %lag_unstable_run_arrive_7;
    var_0["stand_unstable_run"][8] = %lag_unstable_run_arrive_8;
    var_0["stand_unstable_run"][9] = %lag_unstable_run_arrive_9;
    var_0["crouch_saw"][1] = %saw_gunner_lowwall_runin_ml;
    var_0["crouch_saw"][2] = %saw_gunner_lowwall_runin_m;
    var_0["crouch_saw"][3] = %saw_gunner_lowwall_runin_mr;
    var_0["crouch_saw"][4] = %saw_gunner_lowwall_runin_l;
    var_0["crouch_saw"][6] = %saw_gunner_lowwall_runin_r;
    var_0["prone_saw"][1] = %saw_gunner_prone_runin_ml;
    var_0["prone_saw"][2] = %saw_gunner_prone_runin_m;
    var_0["prone_saw"][3] = %saw_gunner_prone_runin_mr;
    var_0["exposed"] = [];
    var_0["exposed"][1] = %run_2_idle_1;
    var_0["exposed"][2] = %run_2_stand_f_6;
    var_0["exposed"][3] = %run_2_idle_3;
    var_0["exposed"][4] = %run_2_stand_90l;
    var_0["exposed"][6] = %run_2_stand_90r;
    var_0["exposed"][7] = %run_2_idle_7;
    var_0["exposed"][8] = %run_2_stand_180l;
    var_0["exposed"][9] = %run_2_idle_9;
    var_0["exposed_smg"] = [];
    var_0["exposed_smg"][1] = %cqb_stop_1;
    var_0["exposed_smg"][2] = %smg_run_2_stand_f_6;
    var_0["exposed_smg"][3] = %cqb_stop_3;
    var_0["exposed_smg"][4] = %run_2_stand_90l;
    var_0["exposed_smg"][6] = %run_2_stand_90r;
    var_0["exposed_smg"][7] = %cqb_stop_7;
    var_0["exposed_smg"][8] = %run_2_stand_180l;
    var_0["exposed_smg"][9] = %cqb_stop_9;
    var_0["exposed_crouch"] = [];
    var_0["exposed_crouch"][1] = %run_2_crouch_idle_1;
    var_0["exposed_crouch"][2] = %run_2_crouch_f;
    var_0["exposed_crouch"][3] = %run_2_crouch_idle_3;
    var_0["exposed_crouch"][4] = %run_2_crouch_90l;
    var_0["exposed_crouch"][6] = %run_2_crouch_90r;
    var_0["exposed_crouch"][7] = %run_2_crouch_idle_7;
    var_0["exposed_crouch"][8] = %run_2_crouch_180l;
    var_0["exposed_crouch"][9] = %run_2_crouch_idle_9;
    var_0["exposed_crouch_crouchwalk"] = [];
    var_0["exposed_crouch_crouchwalk"][1] = %crouchwalk_2_crouch_stop_1;
    var_0["exposed_crouch_crouchwalk"][2] = %crouchwalk_2_crouch_stop_2;
    var_0["exposed_crouch_crouchwalk"][3] = %crouchwalk_2_crouch_stop_3;
    var_0["exposed_crouch_crouchwalk"][4] = %crouchwalk_2_crouch_stop_4;
    var_0["exposed_crouch_crouchwalk"][6] = %crouchwalk_2_crouch_stop_6;
    var_0["exposed_crouch_crouchwalk"][7] = %crouchwalk_2_crouch_stop_7;
    var_0["exposed_crouch_crouchwalk"][8] = %crouchwalk_2_crouch_stop_8;
    var_0["exposed_crouch_crouchwalk"][9] = %crouchwalk_2_crouch_stop_9;
    var_0["exposed_cqb"] = [];
    var_0["exposed_cqb"][1] = %cqb_stop_1;
    var_0["exposed_cqb"][2] = %cqb_stop_2;
    var_0["exposed_cqb"][3] = %cqb_stop_3;
    var_0["exposed_cqb"][4] = %cqb_stop_4;
    var_0["exposed_cqb"][6] = %cqb_stop_6;
    var_0["exposed_cqb"][7] = %cqb_stop_7;
    var_0["exposed_cqb"][8] = %cqb_stop_8;
    var_0["exposed_cqb"][9] = %cqb_stop_9;
    var_0["exposed_crouch_cqb"] = [];
    var_0["exposed_crouch_cqb"][1] = %cqb_crouch_stop_1;
    var_0["exposed_crouch_cqb"][2] = %cqb_crouch_stop_2;
    var_0["exposed_crouch_cqb"][3] = %cqb_crouch_stop_3;
    var_0["exposed_crouch_cqb"][4] = %cqb_crouch_stop_4;
    var_0["exposed_crouch_cqb"][6] = %cqb_crouch_stop_6;
    var_0["exposed_crouch_cqb"][7] = %cqb_crouch_stop_7;
    var_0["exposed_crouch_cqb"][8] = %cqb_crouch_stop_8;
    var_0["exposed_crouch_cqb"][9] = %cqb_crouch_stop_9;
    var_0["exposed_unstable"] = [];
    var_0["exposed_unstable"][1] = %lag_unstable_moveforward_arrive_1;
    var_0["exposed_unstable"][2] = %lag_unstable_moveforward_arrive_2;
    var_0["exposed_unstable"][3] = %lag_unstable_moveforward_arrive_3;
    var_0["exposed_unstable"][4] = %lag_unstable_moveforward_arrive_4;
    var_0["exposed_unstable"][6] = %lag_unstable_moveforward_arrive_6;
    var_0["exposed_unstable"][7] = %lag_unstable_moveforward_arrive_7;
    var_0["exposed_unstable"][8] = %lag_unstable_moveforward_arrive_8;
    var_0["exposed_unstable"][9] = %lag_unstable_moveforward_arrive_9;
    var_0["exposed_unstable_run"] = [];
    var_0["exposed_unstable_run"][1] = %lag_unstable_run_arrive_1;
    var_0["exposed_unstable_run"][2] = %lag_unstable_run_arrive_2;
    var_0["exposed_unstable_run"][3] = %lag_unstable_run_arrive_3;
    var_0["exposed_unstable_run"][4] = %lag_unstable_run_arrive_4;
    var_0["exposed_unstable_run"][6] = %lag_unstable_run_arrive_6;
    var_0["exposed_unstable_run"][7] = %lag_unstable_run_arrive_7;
    var_0["exposed_unstable_run"][8] = %lag_unstable_run_arrive_8;
    var_0["exposed_unstable_run"][9] = %lag_unstable_run_arrive_9;
    var_0["heat"] = [];
    var_0["heat"][1] = %heat_approach_1;
    var_0["heat"][2] = %heat_approach_2;
    var_0["heat"][3] = %heat_approach_3;
    var_0["heat"][4] = %heat_approach_4;
    var_0["heat"][6] = %heat_approach_6;
    var_0["heat"][8] = %heat_approach_8;
    var_0["heat_left"] = [];
    var_0["heat_right"] = [];
    var_0["wall_over_96"][1] = %traverse90_in_ml;
    var_0["wall_over_96"][2] = %traverse90_in_m;
    var_0["wall_over_96"][3] = %traverse90_in_mr;
    anim._id_973E["wall_over_96"]["height"] = 96;
    var_0["wall_over_40"][1] = %traverse_window_m_2_run;
    var_0["wall_over_40"][2] = %traverse_window_m_2_run;
    var_0["wall_over_40"][3] = %traverse_window_m_2_run;
    anim._id_0CCA["soldier"]["cover_trans"] = var_0;
}

_id_4E1F()
{
    var_0 = [];
    var_0["right"][1] = %corner_standr_trans_out_1;
    var_0["right"][2] = %corner_standr_trans_out_2;
    var_0["right"][3] = %corner_standr_trans_out_3;
    var_0["right"][4] = %corner_standr_trans_out_4;
    var_0["right"][6] = %corner_standr_trans_out_6;
    var_0["right"][8] = %corner_standr_trans_out_8;
    var_0["right"][9] = %corner_standr_trans_out_9;
    var_0["right_crouch"][1] = %cornercrr_trans_out_ml;
    var_0["right_crouch"][2] = %cornercrr_trans_out_m;
    var_0["right_crouch"][3] = %cornercrr_trans_out_mr;
    var_0["right_crouch"][4] = %cornercrr_trans_out_l;
    var_0["right_crouch"][6] = %cornercrr_trans_out_r;
    var_0["right_crouch"][8] = %cornercrr_trans_out_f;
    var_0["right_crouch"][9] = %cornercrr_trans_out_mf;
    var_0["right_cqb"][1] = %corner_standr_trans_cqb_out_1;
    var_0["right_cqb"][2] = %corner_standr_trans_cqb_out_2;
    var_0["right_cqb"][3] = %corner_standr_trans_cqb_out_3;
    var_0["right_cqb"][4] = %corner_standr_trans_cqb_out_4;
    var_0["right_cqb"][6] = %corner_standr_trans_cqb_out_6;
    var_0["right_cqb"][8] = %corner_standr_trans_cqb_out_8;
    var_0["right_cqb"][9] = %corner_standr_trans_cqb_out_9;
    var_0["right_crouch_cqb"][1] = %cornercrr_cqb_trans_out_1;
    var_0["right_crouch_cqb"][2] = %cornercrr_cqb_trans_out_2;
    var_0["right_crouch_cqb"][3] = %cornercrr_cqb_trans_out_3;
    var_0["right_crouch_cqb"][4] = %cornercrr_cqb_trans_out_4;
    var_0["right_crouch_cqb"][6] = %cornercrr_cqb_trans_out_6;
    var_0["right_crouch_cqb"][8] = %cornercrr_cqb_trans_out_8;
    var_0["right_crouch_cqb"][9] = %cornercrr_cqb_trans_out_9;
    var_0["left"][1] = %corner_standl_trans_out_1;
    var_0["left"][2] = %corner_standl_trans_out_2;
    var_0["left"][3] = %corner_standl_trans_out_3;
    var_0["left"][4] = %corner_standl_trans_out_4;
    var_0["left"][6] = %corner_standl_trans_out_6;
    var_0["left"][7] = %corner_standl_trans_out_7;
    var_0["left"][8] = %corner_standl_trans_out_8;
    var_0["left_crouch"][1] = %cornercrl_trans_out_ml;
    var_0["left_crouch"][2] = %cornercrl_trans_out_m;
    var_0["left_crouch"][3] = %cornercrl_trans_out_mr;
    var_0["left_crouch"][4] = %cornercrl_trans_out_l;
    var_0["left_crouch"][6] = %cornercrl_trans_out_r;
    var_0["left_crouch"][7] = %cornercrl_trans_out_mf;
    var_0["left_crouch"][8] = %cornercrl_trans_out_f;
    var_0["left_cqb"][1] = %corner_standl_trans_cqb_out_1;
    var_0["left_cqb"][2] = %corner_standl_trans_cqb_out_2;
    var_0["left_cqb"][3] = %corner_standl_trans_cqb_out_3;
    var_0["left_cqb"][4] = %corner_standl_trans_cqb_out_4;
    var_0["left_cqb"][6] = %corner_standl_trans_cqb_out_6;
    var_0["left_cqb"][7] = %corner_standl_trans_cqb_out_7;
    var_0["left_cqb"][8] = %corner_standl_trans_cqb_out_8;
    var_0["left_crouch_cqb"][1] = %cornercrl_cqb_trans_out_1;
    var_0["left_crouch_cqb"][2] = %cornercrl_cqb_trans_out_2;
    var_0["left_crouch_cqb"][3] = %cornercrl_cqb_trans_out_3;
    var_0["left_crouch_cqb"][4] = %cornercrl_cqb_trans_out_4;
    var_0["left_crouch_cqb"][6] = %cornercrl_cqb_trans_out_6;
    var_0["left_crouch_cqb"][7] = %cornercrl_cqb_trans_out_7;
    var_0["left_crouch_cqb"][8] = %cornercrl_cqb_trans_out_8;
    var_0["crouch"][1] = %covercrouch_run_out_ml;
    var_0["crouch"][2] = %covercrouch_run_out_m;
    var_0["crouch"][3] = %covercrouch_run_out_mr;
    var_0["crouch"][4] = %covercrouch_run_out_l;
    var_0["crouch"][6] = %covercrouch_run_out_r;
    var_0["stand"][1] = %coverstand_trans_out_ml;
    var_0["stand"][2] = %coverstand_trans_out_m;
    var_0["stand"][3] = %coverstand_trans_out_mr;
    var_0["stand"][4] = %coverstand_trans_out_l;
    var_0["stand"][6] = %coverstand_trans_out_r;
    var_0["stand_saw"][1] = %saw_gunner_runout_ml;
    var_0["stand_saw"][2] = %saw_gunner_runout_m;
    var_0["stand_saw"][3] = %saw_gunner_runout_mr;
    var_0["stand_saw"][4] = %saw_gunner_runout_l;
    var_0["stand_saw"][6] = %saw_gunner_runout_r;
    var_0["stand_unstable"] = [];
    var_0["stand_unstable"][1] = %lag_unstable_moveforward_exit_1;
    var_0["stand_unstable"][2] = %lag_unstable_moveforward_exit_2;
    var_0["stand_unstable"][3] = %lag_unstable_moveforward_exit_3;
    var_0["stand_unstable"][4] = %lag_unstable_moveforward_exit_4;
    var_0["stand_unstable"][6] = %lag_unstable_moveforward_exit_6;
    var_0["stand_unstable"][7] = %lag_unstable_moveforward_exit_7;
    var_0["stand_unstable"][8] = %lag_unstable_moveforward_exit_8;
    var_0["stand_unstable"][9] = %lag_unstable_moveforward_exit_9;
    var_0["stand_unstable_run"] = [];
    var_0["stand_unstable_run"][1] = %lag_unstable_run_exit_1;
    var_0["stand_unstable_run"][2] = %lag_unstable_run_exit_2;
    var_0["stand_unstable_run"][3] = %lag_unstable_run_exit_3;
    var_0["stand_unstable_run"][4] = %lag_unstable_run_exit_4;
    var_0["stand_unstable_run"][6] = %lag_unstable_run_exit_6;
    var_0["stand_unstable_run"][7] = %lag_unstable_run_exit_7;
    var_0["stand_unstable_run"][8] = %lag_unstable_run_exit_8;
    var_0["stand_unstable_run"][9] = %lag_unstable_run_exit_9;
    var_0["prone_saw"][2] = %saw_gunner_prone_runout_m;
    var_0["prone_saw"][4] = %saw_gunner_prone_runout_l;
    var_0["prone_saw"][6] = %saw_gunner_prone_runout_r;
    var_0["prone_saw"][8] = %saw_gunner_prone_runout_f;
    var_0["crouch_saw"][1] = %saw_gunner_lowwall_runout_ml;
    var_0["crouch_saw"][2] = %saw_gunner_lowwall_runout_m;
    var_0["crouch_saw"][3] = %saw_gunner_lowwall_runout_mr;
    var_0["crouch_saw"][4] = %saw_gunner_lowwall_runout_l;
    var_0["crouch_saw"][6] = %saw_gunner_lowwall_runout_r;
    var_0["exposed"] = [];
    var_0["exposed"][1] = %cqb_start_1;
    var_0["exposed"][2] = %stand_2_run_180l;
    var_0["exposed"][3] = %cqb_start_3;
    var_0["exposed"][4] = %stand_2_run_l;
    var_0["exposed"][6] = %stand_2_run_r;
    var_0["exposed"][7] = %cqb_start_7;
    var_0["exposed"][8] = %surprise_start_v1;
    var_0["exposed"][9] = %cqb_start_9;
    var_0["exposed_smg"] = [];
    var_0["exposed_smg"][1] = %cqb_start_1;
    var_0["exposed_smg"][2] = %smg_stand_2_run_180l;
    var_0["exposed_smg"][3] = %cqb_start_3;
    var_0["exposed_smg"][4] = %smg_stand_2_run_l;
    var_0["exposed_smg"][6] = %smg_stand_2_run_r;
    var_0["exposed_smg"][7] = %cqb_start_7;
    var_0["exposed_smg"][8] = %smg_stand_2_run_f_2;
    var_0["exposed_smg"][9] = %cqb_start_9;
    var_0["exposed_crouch"] = [];
    var_0["exposed_crouch"][1] = %cqb_crouch_start_1;
    var_0["exposed_crouch"][2] = %crouch_2run_180;
    var_0["exposed_crouch"][3] = %cqb_crouch_start_3;
    var_0["exposed_crouch"][4] = %crouch_2run_l;
    var_0["exposed_crouch"][6] = %crouch_2run_r;
    var_0["exposed_crouch"][7] = %cqb_crouch_start_7;
    var_0["exposed_crouch"][8] = %crouch_2run_f;
    var_0["exposed_crouch"][9] = %cqb_crouch_start_9;
    var_0["exposed_crouch_crouchwalk"] = [];
    var_0["exposed_crouch_crouchwalk"][1] = %crouchwalk_2_crouch_start_1;
    var_0["exposed_crouch_crouchwalk"][2] = %crouchwalk_2_crouch_start_2;
    var_0["exposed_crouch_crouchwalk"][3] = %crouchwalk_2_crouch_start_3;
    var_0["exposed_crouch_crouchwalk"][4] = %crouchwalk_2_crouch_start_4;
    var_0["exposed_crouch_crouchwalk"][6] = %crouchwalk_2_crouch_start_6;
    var_0["exposed_crouch_crouchwalk"][7] = %crouchwalk_2_crouch_start_7;
    var_0["exposed_crouch_crouchwalk"][8] = %crouchwalk_2_crouch_start_8;
    var_0["exposed_crouch_crouchwalk"][9] = %crouchwalk_2_crouch_start_9;
    var_0["exposed_cqb"] = [];
    var_0["exposed_cqb"][1] = %cqb_start_1;
    var_0["exposed_cqb"][2] = %cqb_start_2;
    var_0["exposed_cqb"][3] = %cqb_start_3;
    var_0["exposed_cqb"][4] = %cqb_start_4;
    var_0["exposed_cqb"][6] = %cqb_start_6;
    var_0["exposed_cqb"][7] = %cqb_start_7;
    var_0["exposed_cqb"][8] = %cqb_start_8;
    var_0["exposed_cqb"][9] = %cqb_start_9;
    var_0["exposed_crouch_cqb"] = [];
    var_0["exposed_crouch_cqb"][1] = %cqb_crouch_start_1;
    var_0["exposed_crouch_cqb"][2] = %cqb_crouch_start_2;
    var_0["exposed_crouch_cqb"][3] = %cqb_crouch_start_3;
    var_0["exposed_crouch_cqb"][4] = %cqb_crouch_start_4;
    var_0["exposed_crouch_cqb"][6] = %cqb_crouch_start_6;
    var_0["exposed_crouch_cqb"][7] = %cqb_crouch_start_7;
    var_0["exposed_crouch_cqb"][8] = %cqb_crouch_start_8;
    var_0["exposed_crouch_cqb"][9] = %cqb_crouch_start_9;
    var_0["exposed_unstable"] = [];
    var_0["exposed_unstable"][1] = %lag_unstable_moveforward_exit_1;
    var_0["exposed_unstable"][2] = %lag_unstable_moveforward_exit_2;
    var_0["exposed_unstable"][3] = %lag_unstable_moveforward_exit_3;
    var_0["exposed_unstable"][4] = %lag_unstable_moveforward_exit_4;
    var_0["exposed_unstable"][6] = %lag_unstable_moveforward_exit_6;
    var_0["exposed_unstable"][7] = %lag_unstable_moveforward_exit_7;
    var_0["exposed_unstable"][8] = %lag_unstable_moveforward_exit_8;
    var_0["exposed_unstable"][9] = %lag_unstable_moveforward_exit_9;
    var_0["exposed_unstable_run"] = [];
    var_0["exposed_unstable_run"][1] = %lag_unstable_run_exit_1;
    var_0["exposed_unstable_run"][2] = %lag_unstable_run_exit_2;
    var_0["exposed_unstable_run"][3] = %lag_unstable_run_exit_3;
    var_0["exposed_unstable_run"][4] = %lag_unstable_run_exit_4;
    var_0["exposed_unstable_run"][6] = %lag_unstable_run_exit_6;
    var_0["exposed_unstable_run"][7] = %lag_unstable_run_exit_7;
    var_0["exposed_unstable_run"][8] = %lag_unstable_run_exit_8;
    var_0["exposed_unstable_run"][9] = %lag_unstable_run_exit_9;
    var_0["heat"] = [];
    var_0["heat"][1] = %heat_exit_1;
    var_0["heat"][2] = %heat_exit_2;
    var_0["heat"][3] = %heat_exit_3;
    var_0["heat"][4] = %heat_exit_4;
    var_0["heat"][6] = %heat_exit_6;
    var_0["heat"][7] = %heat_exit_7;
    var_0["heat"][8] = %heat_exit_8;
    var_0["heat"][9] = %heat_exit_9;
    var_0["heat_left"] = [];
    var_0["heat_left"][1] = %heat_exit_1;
    var_0["heat_left"][2] = %heat_exit_2;
    var_0["heat_left"][3] = %heat_exit_3;
    var_0["heat_left"][4] = %heat_exit_4;
    var_0["heat_left"][6] = %heat_exit_6;
    var_0["heat_left"][7] = %heat_exit_8l;
    var_0["heat_left"][8] = %heat_exit_8l;
    var_0["heat_left"][9] = %heat_exit_8r;
    var_0["heat_right"] = [];
    var_0["heat_right"][1] = %heat_exit_1;
    var_0["heat_right"][2] = %heat_exit_2;
    var_0["heat_right"][3] = %heat_exit_3;
    var_0["heat_right"][4] = %heat_exit_4;
    var_0["heat_right"][6] = %heat_exit_6;
    var_0["heat_right"][7] = %heat_exit_8l;
    var_0["heat_right"][8] = %heat_exit_8r;
    var_0["heat_right"][9] = %heat_exit_8r;
    var_0["prone"] = [];
    var_0["prone"][1] = %h1_crawlstart_l90;
    var_0["prone"][2] = %h1_crawlstart_180;
    var_0["prone"][3] = %h1_crawlstart_180;
    var_0["prone"][4] = %h1_crawlstart_l90;
    var_0["prone"][6] = %h1_crawlstart_r90;
    var_0["prone"][7] = %h1_crawlstart_l45;
    var_0["prone"][8] = %h1_crawlstart_f_codemove;
    var_0["prone"][9] = %h1_crawlstart_r45;
    anim._id_0CCA["soldier"]["cover_exit"] = var_0;
}

getmoveend( var_0 )
{
    var_1 = 0.5;
    var_2 = 0;
    var_3 = 1;
    var_4 = 0.05;

    for ( var_5 = getanimlength( var_0 ); ( var_3 - var_2 ) * var_5 > var_4; var_1 = ( var_3 - var_2 ) / 2 + var_2 )
    {
        var_6 = getmovedelta( var_0, var_1, 1 );

        if ( length2dsquared( var_6 ) < 1 )
        {
            var_3 = var_1;
            continue;
        }

        var_2 = var_1;
    }

    return var_3;
}

_id_4E2F( var_0 )
{
    if ( !isdefined( anim._id_0CCA[var_0] ) )
        return;

    var_1 = [];
    var_1[0] = "left";
    var_1[1] = "right";
    var_1[2] = "left_crouch";
    var_1[3] = "right_crouch";
    var_1[4] = "crouch";
    var_1[5] = "stand";
    var_1[6] = "exposed";
    var_1[7] = "exposed_crouch";
    var_1[8] = "stand_saw";
    var_1[9] = "prone_saw";
    var_1[10] = "crouch_saw";
    var_1[11] = "wall_over_40";
    var_1[12] = "right_cqb";
    var_1[13] = "right_crouch_cqb";
    var_1[14] = "left_cqb";
    var_1[15] = "left_crouch_cqb";
    var_1[16] = "exposed_cqb";
    var_1[17] = "exposed_crouch_cqb";
    var_1[18] = "heat";
    var_1[19] = "heat_left";
    var_1[20] = "heat_right";
    var_1[21] = "exposed_ready";
    var_1[22] = "exposed_ready_cqb";
    var_1[23] = "exposed_smg";
    var_1[24] = "exposed_unstable";
    var_1[25] = "stand_unstable";
    var_1[26] = "exposed_unstable_run";
    var_1[27] = "stand_unstable_run";
    var_1[28] = "exposed_crouch_crouchwalk";
    var_1[29] = "prone";

    if ( !isdefined( anim._id_0CCA[var_0]["cover_trans"] ) )
        return;

    for ( var_2 = 1; var_2 <= 6; var_2++ )
    {
        if ( var_2 == 5 )
            continue;

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = var_1[var_3];

            if ( isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4] ) && isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] ) )
            {
                anim._id_0CCA[var_0]["cover_trans_dist"][var_4][var_2] = getmovedelta( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2], 0, 1 );
                anim._id_0CCA[var_0]["cover_trans_angles"][var_4][var_2] = getangledelta( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2], 0, 1 );
                anim._id_0CCA[var_0]["cover_trans_move_end"][var_4][var_2] = getmoveend( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] );
            }

            if ( isdefined( anim._id_0CCA[var_0]["cover_exit"][var_4] ) && isdefined( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2] ) )
            {
                if ( animhasnotetrack( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], "code_move" ) )
                    var_5 = getnotetracktimes( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], "code_move" )[0];
                else
                    var_5 = 1;

                anim._id_0CCA[var_0]["cover_exit_dist"][var_4][var_2] = getmovedelta( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], 0, var_5 );
                anim._id_0CCA[var_0]["cover_exit_angles"][var_4][var_2] = getangledelta( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], 0, 1 );
            }
        }
    }

    if ( !isdefined( anim._id_0CCA[var_0]["CoverTransLongestDist"] ) )
        anim._id_0CCA[var_0]["CoverTransLongestDist"] = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];
        anim._id_0CCA[var_0]["CoverTransLongestDist"][var_4] = 0;

        for ( var_2 = 1; var_2 <= 6; var_2++ )
        {
            if ( var_2 == 5 || !isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4] ) || !isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] ) )
                continue;

            var_6 = lengthsquared( anim._id_0CCA[var_0]["cover_trans_dist"][var_4][var_2] );

            if ( anim._id_0CCA[var_0]["CoverTransLongestDist"][var_4] < var_6 )
                anim._id_0CCA[var_0]["CoverTransLongestDist"][var_4] = var_6;
        }

        anim._id_0CCA[var_0]["CoverTransLongestDist"][var_4] = sqrt( anim._id_0CCA[var_0]["CoverTransLongestDist"][var_4] );
    }

    anim._id_3594["exposed"] = 1;
    anim._id_3594["exposed_crouch"] = 1;
    anim._id_3594["exposed_crouch_crouchwalk"] = 1;
    anim._id_3594["exposed_cqb"] = 1;
    anim._id_3594["exposed_crouch_cqb"] = 1;
    anim._id_3594["exposed_ready_cqb"] = 1;
    anim._id_3594["exposed_unstable"] = 1;
    anim._id_3594["exposed_unstable_run"] = 1;
    anim._id_3594["exposed_ready"] = 1;
    anim._id_3594["exposed_smg"] = 1;
    anim._id_3594["heat"] = 1;

    if ( !isdefined( anim._id_0CCA[var_0]["longestExposedApproachDist"] ) )
        anim._id_0CCA[var_0]["longestExposedApproachDist"] = 0;

    foreach ( var_4, var_8 in anim._id_3594 )
    {
        for ( var_2 = 7; var_2 <= 9; var_2++ )
        {
            if ( isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4] ) && isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] ) )
            {
                anim._id_0CCA[var_0]["cover_trans_dist"][var_4][var_2] = getmovedelta( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2], 0, 1 );
                anim._id_0CCA[var_0]["cover_trans_angles"][var_4][var_2] = getangledelta( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2], 0, 1 );
                anim._id_0CCA[var_0]["cover_trans_move_end"][var_4][var_2] = getmoveend( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] );
            }

            if ( isdefined( anim._id_0CCA[var_0]["cover_exit"][var_4] ) && isdefined( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2] ) )
            {
                var_9 = animhasnotetrack( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], "code_move" );
                var_5 = getnotetracktimes( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], "code_move" )[0];
                anim._id_0CCA[var_0]["cover_exit_dist"][var_4][var_2] = getmovedelta( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], 0, var_5 );
                anim._id_0CCA[var_0]["cover_exit_angles"][var_4][var_2] = getangledelta( anim._id_0CCA[var_0]["cover_exit"][var_4][var_2], 0, 1 );
            }
        }

        for ( var_2 = 1; var_2 <= 9; var_2++ )
        {
            if ( !isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4] ) || !isdefined( anim._id_0CCA[var_0]["cover_trans"][var_4][var_2] ) )
                continue;

            var_10 = length( anim._id_0CCA[var_0]["cover_trans_dist"][var_4][var_2] );

            if ( var_10 > anim._id_0CCA[var_0]["longestExposedApproachDist"] )
                anim._id_0CCA[var_0]["longestExposedApproachDist"] = var_10;
        }
    }
}

_id_4DF3()
{
    _id_4D1B();
    anim._id_0CB6 = [];
    anim._id_0CB6["Cover Left"] = [];
    anim._id_0CB6["Cover Left"]["stand"] = "left";
    anim._id_0CB6["Cover Left"]["crouch"] = "left_crouch";
    anim._id_0CB6["Cover Wide Left"] = anim._id_0CB6["Cover Left"];
    anim._id_5A2F["Cover Left"] = 9;
    anim._id_33E8["Cover Left"] = 9;
    anim._id_0CB6["Cover Right"] = [];
    anim._id_0CB6["Cover Right"]["stand"] = "right";
    anim._id_0CB6["Cover Right"]["crouch"] = "right_crouch";
    anim._id_0CB6["Cover Wide Right"] = anim._id_0CB6["Cover Right"];
    anim._id_5A2F["Cover Right"] = 9;
    anim._id_33E8["Cover Right"] = 7;
    anim._id_0CB6["Cover Crouch"] = [];
    anim._id_0CB6["Cover Crouch"]["stand"] = "crouch";
    anim._id_0CB6["Cover Crouch"]["crouch"] = "crouch";
    anim._id_0CB6["Conceal Crouch"] = anim._id_0CB6["Cover Crouch"];
    anim._id_0CB6["Cover Crouch Window"] = anim._id_0CB6["Cover Crouch"];
    anim._id_5A2F["Cover Crouch"] = 6;
    anim._id_33E8["Cover Crouch"] = -1;
    anim._id_5A2F["Conceal Crouch"] = 6;
    anim._id_33E8["Conceal Crouch"] = -1;
    anim._id_0CB6["Cover Stand"] = [];
    anim._id_0CB6["Cover Stand"]["stand"] = "stand";
    anim._id_0CB6["Cover Stand"]["crouch"] = "stand";
    anim._id_0CB6["Conceal Stand"] = anim._id_0CB6["Cover Stand"];
    anim._id_5A2F["Cover Stand"] = 6;
    anim._id_33E8["Cover Stand"] = -1;
    anim._id_5A2F["Conceal Stand"] = 6;
    anim._id_33E8["Conceal Stand"] = -1;
    anim._id_0CB6["Cover Prone"] = [];
    anim._id_0CB6["Cover Prone"]["stand"] = "exposed";
    anim._id_0CB6["Cover Prone"]["crouch"] = "exposed";
    anim._id_0CB6["Conceal Prone"] = anim._id_0CB6["Cover Prone"];
    anim._id_33E8["Conceal Prone"] = -1;
    anim._id_0CB6["Path"] = [];
    anim._id_0CB6["Path"]["stand"] = "exposed";
    anim._id_0CB6["Path"]["crouch"] = "exposed_crouch";
    anim._id_0CB6["Guard"] = anim._id_0CB6["Path"];
    anim._id_0CB6["Guard"]["prone"] = "prone";
    anim._id_0CB6["Ambush"] = anim._id_0CB6["Path"];
    anim._id_0CB6["Scripted"] = anim._id_0CB6["Path"];
    anim._id_0CB6["Exposed"] = anim._id_0CB6["Path"];
    anim._id_50E3["Guard"] = 1;
    anim._id_50E3["Ambush"] = 1;
    anim._id_50E3["Exposed"] = 1;
    anim._id_50E4["Guard"] = 1;
    anim._id_50E4["Exposed"] = 1;
    _id_4E1E();
    _id_4E1F();

    if ( maps\_utility::_id_76FF() )
    {
        animscripts\s1_common_anims::_id_4E21();
        animscripts\s1_common_anims::_id_4E22();
    }

    _id_4E2F( "soldier" );

    if ( maps\_utility::_id_76FF() )
        _id_4E2F( "s1_soldier" );

    anim._id_8A78 = [];
    anim._id_8A78["left"] = 1;
    anim._id_8A78["left_crouch"] = 1;
    anim._id_8A78["left_crouch_cqb"] = 1;
    anim._id_8A78["left_cqb"] = 1;
    anim._id_8A7A = [];
    anim._id_8A7A["left"] = 1;
    anim._id_8A7A["left_crouch"] = 1;
    anim._id_8A7A["left_crouch_cqb"] = 1;
    anim._id_8A7A["left_cqb"] = 1;
    anim._id_8A7A["heat_left"] = 1;
    anim._id_8A79 = [];
    anim._id_8A79["right"] = 1;
    anim._id_8A79["right_crouch"] = 1;
    anim._id_8A79["right_cqb"] = 1;
    anim._id_8A79["right_crouch_cqb"] = 1;
    anim._id_8A7B = [];
    anim._id_8A7B["right"] = 1;
    anim._id_8A7B["right_crouch"] = 1;
    anim._id_8A7B["right_cqb"] = 1;
    anim._id_8A7B["right_crouch_cqb"] = 1;
    anim._id_8A7B["heat_right"] = 1;
    _id_40E1( "soldier" );

    if ( maps\_utility::_id_76FF() )
        _id_40E1( "s1_soldier" );

    anim._id_0D24["left"] = "stand";
    anim._id_0D24["left_cqb"] = "stand";
    anim._id_0D24["right"] = "stand";
    anim._id_0D24["right_cqb"] = "stand";
    anim._id_0D24["stand"] = "stand";
    anim._id_0D24["stand_saw"] = "stand";
    anim._id_0D24["stand_unstable"] = "stand";
    anim._id_0D24["exposed"] = "stand";
    anim._id_0D24["exposed_cqb"] = "stand";
    anim._id_0D24["exposed_smg"] = "stand";
    anim._id_0D24["exposed_unstable"] = "stand";
    anim._id_0D24["exposed_unstable_run"] = "stand";
    anim._id_0D24["heat"] = "stand";
    anim._id_0D24["left_crouch"] = "crouch";
    anim._id_0D24["left_crouch_cqb"] = "crouch";
    anim._id_0D24["right_crouch"] = "crouch";
    anim._id_0D24["right_crouch_cqb"] = "crouch";
    anim._id_0D24["crouch_saw"] = "crouch";
    anim._id_0D24["crouch"] = "crouch";
    anim._id_0D24["exposed_crouch"] = "crouch";
    anim._id_0D24["exposed_crouch_crouchwalk"] = "crouch";
    anim._id_0D24["exposed_crouch_cqb"] = "crouch";
    anim._id_0D24["prone_saw"] = "prone";
    anim._id_0D24["exposed_ready"] = "stand";
    anim._id_0D24["exposed_ready_cqb"] = "stand";
    anim._id_740B["Cover Stand"] = "stand";
    anim._id_740B["Conceal Stand"] = "stand";
    anim._id_740B["Cover Crouch"] = "crouch";
    anim._id_740B["Conceal Crouch"] = "crouch";
}

_id_40E1( var_0 )
{
    _id_40E2( var_0, 7, 8, 0, anim._id_8A78, anim._id_8A7A );
    _id_40E2( var_0, 8, 9, 1, anim._id_8A79, anim._id_8A7B );
}

getsplitdeltas( var_0, var_1 )
{
    var_2 = 1;

    if ( animhasnotetrack( var_0, "code_move" ) )
        var_2 = getnotetracktimes( var_0, "code_move" )[0];

    var_3 = spawnstruct();
    var_3.predist = getmovedelta( var_0, 0, var_1 );
    var_3.postdist = getmovedelta( var_0, 0, var_2 ) - var_3.predist;
    var_3.angledelta = getangledelta( var_0, 0, 1 );
    return var_3;
}

_id_40E2( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    for ( var_6 = var_1; var_6 <= var_2; var_6++ )
    {
        if ( isdefined( anim._id_0CCA[var_0]["cover_trans"] ) )
        {
            foreach ( var_11, var_8 in var_4 )
            {
                if ( issubstr( var_11, "heat" ) )
                    continue;

                if ( isdefined( anim._id_0CCA[var_0]["cover_trans"][var_11] ) && isdefined( anim._id_0CCA[var_0]["cover_trans"][var_11][var_6] ) )
                {
                    var_9 = findbestsplittime( anim._id_0CCA[var_0]["cover_trans"][var_11][var_6], 1, var_3 );
                    var_10 = getsplitdeltas( anim._id_0CCA[var_0]["cover_trans"][var_11][var_6], var_9 );
                    anim._id_0CCA[var_0]["cover_trans_predist"][var_11][var_6] = var_10.predist;
                    anim._id_0CCA[var_0]["cover_trans_dist"][var_11][var_6] = var_10.postdist;
                    anim._id_0CCA[var_0]["cover_trans_angles"][var_11][var_6] = var_10.angledelta;
                    anim._id_0CCA[var_0]["cover_trans_move_end"][var_11][var_6] = getmoveend( anim._id_0CCA[var_0]["cover_trans"][var_11][var_6] );
                }
            }
        }

        if ( isdefined( anim._id_0CCA[var_0]["cover_exit"] ) )
        {
            foreach ( var_11, var_8 in var_5 )
            {
                if ( issubstr( var_11, "heat" ) )
                    continue;

                if ( isdefined( anim._id_0CCA[var_0]["cover_exit"][var_11] ) && isdefined( anim._id_0CCA[var_0]["cover_exit"][var_11][var_6] ) )
                {
                    var_9 = findbestsplittime( anim._id_0CCA[var_0]["cover_exit"][var_11][var_6], 0, var_3 );
                    var_10 = getsplitdeltas( anim._id_0CCA[var_0]["cover_exit"][var_11][var_6], var_9 );
                    anim._id_0CCA[var_0]["cover_exit_dist"][var_11][var_6] = var_10.predist;
                    anim._id_0CCA[var_0]["cover_exit_postdist"][var_11][var_6] = var_10.postdist;
                    anim._id_0CCA[var_0]["cover_exit_angles"][var_11][var_6] = var_10.angledelta;
                }
            }
        }
    }
}

findbestsplittime( var_0, var_1, var_2 )
{
    var_3 = getangledelta( var_0, 0, 1 );
    var_4 = getmovedelta( var_0, 0, 1 );
    var_5 = 1000;
    var_6 = -1;
    var_7 = -100000000;
    var_8 = ( 0, 0, 0 );

    for ( var_9 = 0; var_9 < var_5; var_9++ )
    {
        var_10 = 1.0 * var_9 / ( var_5 - 1 );
        var_11 = getmovedelta( var_0, 0, var_10 );

        if ( var_1 )
            var_11 = deltarotate( var_4 - var_11, 180 - var_3 );

        if ( var_2 )
            var_11 = ( var_11[0], 0 - var_11[1], var_11[2] );

        var_12 = min( var_11[0] - 32, var_11[1] );

        if ( var_12 > var_7 || var_6 < 0 )
        {
            var_7 = var_12;
            var_6 = var_10;
            var_8 = var_11;
        }
    }

    return var_6;
}

deltarotate( var_0, var_1 )
{
    var_2 = cos( var_1 );
    var_3 = sin( var_1 );
    return ( var_0[0] * var_2 - var_0[1] * var_3, var_0[1] * var_2 + var_0[0] * var_3, 0 );
}
