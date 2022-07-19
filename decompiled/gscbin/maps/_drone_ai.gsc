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

init()
{
    level._id_2E22["allies"]["stand"]["idle"] = %casual_stand_idle;
    level._id_2E22["allies"]["stand"]["run"] = %run_lowready_f_relative;
    level._id_2E22["allies"]["stand"]["death"] = %exposed_death;
    level._id_2E22["allies"]["stairs"]["up"] = %traverse_stair_run_relative;
    level._id_2E22["allies"]["stairs"]["down"] = %traverse_stair_run_down_relative;
    level._id_2E22["allies"]["covercrouch"]["idle"][0] = %covercrouch_hide_idle;
    level._id_2E22["allies"]["covercrouch"]["idle"][1] = %covercrouch_twitch_1;
    level._id_2E22["allies"]["covercrouch"]["idle"][2] = %covercrouch_twitch_2;
    level._id_2E22["allies"]["covercrouch"]["idle"][3] = %covercrouch_twitch_3;
    level._id_2E22["allies"]["covercrouch"]["idle"][4] = %covercrouch_hide_look;
    level._id_2E22["allies"]["covercrouch"]["hide_2_aim"] = %covercrouch_hide_2_aim;
    level._id_2E22["allies"]["covercrouch"]["aim_2_hide"] = %covercrouch_aim_2_hide;
    level._id_2E22["allies"]["covercrouch"]["reload"] = %covercrouch_reload_hide;
    level._id_2E22["allies"]["covercrouch"]["fire"] = %covercrouch_aim5;
    level._id_2E22["allies"]["covercrouch"]["death"] = %covercrouch_death_1;
    level._id_2E22["allies"]["covercrouch"]["pop_up_chance"] = 1;
    level._id_2E22["allies"]["coverstand"]["idle"][0] = %coverstand_hide_idle;
    level._id_2E22["allies"]["coverstand"]["idle"][1] = %coverstand_look_quick;
    level._id_2E22["allies"]["coverstand"]["idle"][2] = %coverstand_look_quick_v2;
    level._id_2E22["allies"]["coverstand"]["idle"][3] = %coverstand_hide_idle_twitch04;
    level._id_2E22["allies"]["coverstand"]["idle"][4] = %coverstand_hide_idle_twitch05;
    level._id_2E22["allies"]["coverstand"]["hide_2_aim"] = %coverstand_hide_2_aim;
    level._id_2E22["allies"]["coverstand"]["aim_2_hide"] = %coverstand_aim_2_hide;
    level._id_2E22["allies"]["coverstand"]["reload"] = %coverstand_reloada;
    level._id_2E22["allies"]["coverstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["allies"]["coverstand"]["death"] = %coverstand_death_left;
    level._id_2E22["allies"]["coverstand"]["pop_up_chance"] = 1;
    level._id_2E22["allies"]["coverleftstand"]["idle"][0] = %corner_standl_alert_idle;
    level._id_2E22["allies"]["coverleftstand"]["idle"][1] = %corner_standl_alert_twitch01;
    level._id_2E22["allies"]["coverleftstand"]["idle"][2] = %corner_standl_alert_twitch02;
    level._id_2E22["allies"]["coverleftstand"]["idle"][3] = %corner_standl_alert_twitch03;
    level._id_2E22["allies"]["coverleftstand"]["idle"][4] = %corner_standl_alert_twitch04;
    level._id_2E22["allies"]["coverleftstand"]["hide_2_aim"] = %corner_standl_trans_alert_2_b_v2;
    level._id_2E22["allies"]["coverleftstand"]["aim_2_hide"] = %corner_standl_trans_b_2_alert_v2;
    level._id_2E22["allies"]["coverleftstand"]["reload"] = %corner_standl_reload_v1;
    level._id_2E22["allies"]["coverleftstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["allies"]["coverleftstand"]["death"] = %corner_standl_deathb;
    level._id_2E22["allies"]["coverleftstand"]["pop_up_chance"] = 1;
    level._id_2E22["allies"]["coverrightstand"]["idle"][0] = %corner_standr_alert_idle;
    level._id_2E22["allies"]["coverrightstand"]["idle"][1] = %corner_standr_alert_twitch01;
    level._id_2E22["allies"]["coverrightstand"]["idle"][2] = %corner_standr_alert_twitch02;
    level._id_2E22["allies"]["coverrightstand"]["idle"][3] = %corner_standr_alert_twitch04;
    level._id_2E22["allies"]["coverrightstand"]["hide_2_aim"] = %corner_standr_trans_alert_2_b;
    level._id_2E22["allies"]["coverrightstand"]["aim_2_hide"] = %corner_standr_trans_b_2_alert;
    level._id_2E22["allies"]["coverrightstand"]["reload"] = %corner_standr_reload_v1;
    level._id_2E22["allies"]["coverrightstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["allies"]["coverrightstand"]["death"] = %corner_standr_deathb;
    level._id_2E22["allies"]["coverrightstand"]["pop_up_chance"] = 1;
    level._id_2E22["allies"]["coverrightcrouch"]["idle"][0] = %cornercrr_alert_idle;
    level._id_2E22["allies"]["coverrightcrouch"]["idle"][1] = %cornercrr_alert_twitch_v1;
    level._id_2E22["allies"]["coverrightcrouch"]["idle"][2] = %cornercrr_alert_twitch_v2;
    level._id_2E22["allies"]["coverrightcrouch"]["idle"][3] = %cornercrr_alert_twitch_v3;
    level._id_2E22["allies"]["coverrightcrouch"]["hide_2_aim"] = %cornercrr_alert_2_lean;
    level._id_2E22["allies"]["coverrightcrouch"]["aim_2_hide"] = %cornercrr_lean_2_alert;
    level._id_2E22["allies"]["coverrightcrouch"]["reload"] = %cornercrr_reloada;
    level._id_2E22["allies"]["coverrightcrouch"]["death"] = %exposed_crouch_death_fetal;
    level._id_2E22["allies"]["coverrightcrouch"]["pop_up_chance"] = 1;
    level._id_2E22["allies"]["coverguard"]["idle"][0] = %exposed_crouch_idle_twitch_v2;
    level._id_2E22["allies"]["coverguard"]["idle"][1] = %exposed_crouch_idle_twitch_v3;
    level._id_2E22["allies"]["coverguard"]["reload"] = %exposed_crouch_reload;
    level._id_2E22["allies"]["coverguard"]["fire"] = %exposed_crouch_aim_5;
    level._id_2E22["allies"]["coverguard"]["death"] = %exposed_crouch_death_fetal;
    level._id_2E22["allies"]["coverguard"]["pop_up_chance"] = 0;
    level._id_2E22["allies"]["coverprone"]["idle"][0] = %prone_reaction_a;
    level._id_2E22["allies"]["coverprone"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_2E22["allies"]["coverprone"]["idle"][2] = %prone_twitch_scan;
    level._id_2E22["allies"]["coverprone"]["idle"][3] = %prone_twitch_look;
    level._id_2E22["allies"]["coverprone"]["idle"][4] = %prone_twitch_lookup;
    level._id_2E22["allies"]["coverprone"]["hide_2_aim"] = %prone_2_crouch;
    level._id_2E22["allies"]["coverprone"]["aim_2_hide"] = %crouch_2_prone;
    level._id_2E22["allies"]["coverprone"]["reload"] = %prone_reload;
    level._id_2E22["allies"]["coverprone"]["fire"] = %prone_fire_1;
    level._id_2E22["allies"]["coverprone"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_2E22["allies"]["coverprone"]["death"] = %saw_gunner_prone_death;
    level._id_2E22["allies"]["coverprone"]["pop_up_chance"] = 0.5;
    level._id_2E22["allies"]["coverprone_no_pop"]["idle"][0] = %prone_reaction_a;
    level._id_2E22["allies"]["coverprone_no_pop"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_2E22["allies"]["coverprone_no_pop"]["idle"][2] = %prone_twitch_scan;
    level._id_2E22["allies"]["coverprone_no_pop"]["idle"][3] = %prone_twitch_look;
    level._id_2E22["allies"]["coverprone_no_pop"]["idle"][4] = %prone_twitch_lookup;
    level._id_2E22["allies"]["coverprone_no_pop"]["hide_2_aim"] = %prone_2_crouch;
    level._id_2E22["allies"]["coverprone_no_pop"]["aim_2_hide"] = %crouch_2_prone;
    level._id_2E22["allies"]["coverprone_no_pop"]["reload"] = %prone_reload;
    level._id_2E22["allies"]["coverprone_no_pop"]["fire"] = %prone_fire_1;
    level._id_2E22["allies"]["coverprone_no_pop"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_2E22["allies"]["coverprone_no_pop"]["death"] = %saw_gunner_prone_death;
    level._id_2E22["allies"]["coverprone_no_pop"]["pop_up_chance"] = 0;
    level._id_2E22["axis"]["stand"]["idle"] = %casual_stand_idle;
    level._id_2E22["axis"]["stand"]["run"] = %run_lowready_f_relative;
    level._id_2E22["axis"]["stand"]["death"] = %exposed_death;
    level._id_2E22["axis"]["covercrouch"]["idle"][0] = %covercrouch_hide_idle;
    level._id_2E22["axis"]["covercrouch"]["idle"][1] = %covercrouch_twitch_1;
    level._id_2E22["axis"]["covercrouch"]["idle"][2] = %covercrouch_twitch_2;
    level._id_2E22["axis"]["covercrouch"]["idle"][3] = %covercrouch_twitch_3;
    level._id_2E22["axis"]["covercrouch"]["idle"][4] = %covercrouch_hide_look;
    level._id_2E22["axis"]["covercrouch"]["hide_2_aim"] = %covercrouch_hide_2_aim;
    level._id_2E22["axis"]["covercrouch"]["aim_2_hide"] = %covercrouch_aim_2_hide;
    level._id_2E22["axis"]["covercrouch"]["reload"] = %covercrouch_reload_hide;
    level._id_2E22["axis"]["covercrouch"]["fire"] = %covercrouch_aim5;
    level._id_2E22["axis"]["covercrouch"]["death"] = %covercrouch_death_1;
    level._id_2E22["axis"]["covercrouch"]["pop_up_chance"] = 1;
    level._id_2E22["axis"]["coverstand"]["idle"][0] = %coverstand_hide_idle;
    level._id_2E22["axis"]["coverstand"]["idle"][1] = %coverstand_look_quick;
    level._id_2E22["axis"]["coverstand"]["idle"][2] = %coverstand_look_quick_v2;
    level._id_2E22["axis"]["coverstand"]["idle"][3] = %coverstand_hide_idle_twitch04;
    level._id_2E22["axis"]["coverstand"]["idle"][4] = %coverstand_hide_idle_twitch05;
    level._id_2E22["axis"]["coverstand"]["hide_2_aim"] = %coverstand_hide_2_aim;
    level._id_2E22["axis"]["coverstand"]["aim_2_hide"] = %coverstand_aim_2_hide;
    level._id_2E22["axis"]["coverstand"]["reload"] = %coverstand_reloada;
    level._id_2E22["axis"]["coverstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["axis"]["coverstand"]["death"] = %coverstand_death_left;
    level._id_2E22["axis"]["coverstand"]["pop_up_chance"] = 1;
    level._id_2E22["axis"]["coverleftstand"]["idle"][0] = %corner_standl_alert_idle;
    level._id_2E22["axis"]["coverleftstand"]["idle"][1] = %corner_standl_alert_twitch01;
    level._id_2E22["axis"]["coverleftstand"]["idle"][2] = %corner_standl_alert_twitch02;
    level._id_2E22["axis"]["coverleftstand"]["idle"][3] = %corner_standl_alert_twitch03;
    level._id_2E22["axis"]["coverleftstand"]["idle"][4] = %corner_standl_alert_twitch04;
    level._id_2E22["axis"]["coverleftstand"]["hide_2_aim"] = %corner_standl_trans_alert_2_b_v2;
    level._id_2E22["axis"]["coverleftstand"]["aim_2_hide"] = %corner_standl_trans_b_2_alert_v2;
    level._id_2E22["axis"]["coverleftstand"]["reload"] = %corner_standl_reload_v1;
    level._id_2E22["axis"]["coverleftstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["axis"]["coverleftstand"]["death"] = %corner_standl_deathb;
    level._id_2E22["axis"]["coverleftstand"]["pop_up_chance"] = 1;
    level._id_2E22["axis"]["coverrightstand"]["idle"][0] = %corner_standr_alert_idle;
    level._id_2E22["axis"]["coverrightstand"]["idle"][1] = %corner_standr_alert_twitch01;
    level._id_2E22["axis"]["coverrightstand"]["idle"][2] = %corner_standr_alert_twitch02;
    level._id_2E22["axis"]["coverrightstand"]["idle"][3] = %corner_standr_alert_twitch04;
    level._id_2E22["axis"]["coverrightstand"]["hide_2_aim"] = %corner_standr_trans_alert_2_b;
    level._id_2E22["axis"]["coverrightstand"]["aim_2_hide"] = %corner_standr_trans_b_2_alert;
    level._id_2E22["axis"]["coverrightstand"]["reload"] = %corner_standr_reload_v1;
    level._id_2E22["axis"]["coverrightstand"]["fire"] = %exposed_aim_5;
    level._id_2E22["axis"]["coverrightstand"]["death"] = %corner_standr_deathb;
    level._id_2E22["axis"]["coverrightstand"]["pop_up_chance"] = 1;
    level._id_2E22["axis"]["coverrightcrouch"]["idle"][0] = %cornercrr_alert_idle;
    level._id_2E22["axis"]["coverrightcrouch"]["idle"][1] = %cornercrr_alert_twitch_v1;
    level._id_2E22["axis"]["coverrightcrouch"]["idle"][2] = %cornercrr_alert_twitch_v2;
    level._id_2E22["axis"]["coverrightcrouch"]["idle"][3] = %cornercrr_alert_twitch_v3;
    level._id_2E22["axis"]["coverrightcrouch"]["hide_2_aim"] = %cornercrr_alert_2_lean;
    level._id_2E22["axis"]["coverrightcrouch"]["aim_2_hide"] = %cornercrr_lean_2_alert;
    level._id_2E22["axis"]["coverrightcrouch"]["reload"] = %cornercrr_reloada;
    level._id_2E22["axis"]["coverrightcrouch"]["death"] = %exposed_crouch_death_fetal;
    level._id_2E22["axis"]["coverrightcrouch"]["pop_up_chance"] = 1;
    level._id_2E22["axis"]["coverguard"]["idle"][0] = %exposed_crouch_idle_twitch_v2;
    level._id_2E22["axis"]["coverguard"]["idle"][1] = %exposed_crouch_idle_twitch_v3;
    level._id_2E22["axis"]["coverguard"]["reload"] = %exposed_crouch_reload;
    level._id_2E22["axis"]["coverguard"]["fire"] = %exposed_crouch_aim_5;
    level._id_2E22["axis"]["coverguard"]["death"] = %exposed_crouch_death_fetal;
    level._id_2E22["axis"]["coverguard"]["pop_up_chance"] = 0;
    level._id_2E22["axis"]["coverprone"]["idle"][0] = %prone_reaction_a;
    level._id_2E22["axis"]["coverprone"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_2E22["axis"]["coverprone"]["idle"][2] = %prone_twitch_scan;
    level._id_2E22["axis"]["coverprone"]["idle"][3] = %prone_twitch_look;
    level._id_2E22["axis"]["coverprone"]["idle"][4] = %prone_twitch_lookup;
    level._id_2E22["axis"]["coverprone"]["hide_2_aim"] = %prone_2_crouch;
    level._id_2E22["axis"]["coverprone"]["aim_2_hide"] = %crouch_2_prone;
    level._id_2E22["axis"]["coverprone"]["reload"] = %prone_reload;
    level._id_2E22["axis"]["coverprone"]["fire"] = %prone_fire_1;
    level._id_2E22["axis"]["coverprone"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_2E22["axis"]["coverprone"]["death"] = %saw_gunner_prone_death;
    level._id_2E22["axis"]["coverprone"]["pop_up_chance"] = 0.5;
    level._id_2E22["axis"]["coverprone_no_pop"]["idle"][0] = %prone_reaction_a;
    level._id_2E22["axis"]["coverprone_no_pop"]["idle"][1] = %prone_twitch_ammocheck;
    level._id_2E22["axis"]["coverprone_no_pop"]["idle"][2] = %prone_twitch_scan;
    level._id_2E22["axis"]["coverprone_no_pop"]["idle"][3] = %prone_twitch_look;
    level._id_2E22["axis"]["coverprone_no_pop"]["idle"][4] = %prone_twitch_lookup;
    level._id_2E22["axis"]["coverprone_no_pop"]["hide_2_aim"] = %prone_2_crouch;
    level._id_2E22["axis"]["coverprone_no_pop"]["aim_2_hide"] = %crouch_2_prone;
    level._id_2E22["axis"]["coverprone_no_pop"]["reload"] = %prone_reload;
    level._id_2E22["axis"]["coverprone_no_pop"]["fire"] = %prone_fire_1;
    level._id_2E22["axis"]["coverprone_no_pop"]["fire_exposed"] = %exposed_crouch_aim_5;
    level._id_2E22["axis"]["coverprone_no_pop"]["death"] = %saw_gunner_prone_death;
    level._id_2E22["axis"]["coverprone_no_pop"]["pop_up_chance"] = 0;
    level._effect["pdrone_flash_wv"] = loadfx( "vfx/muzzleflash/pdrone_flash_wv" );
    _id_A52B::_id_4DC1();
}
