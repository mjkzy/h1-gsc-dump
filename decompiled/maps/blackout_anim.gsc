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
    setup_exploder_anims();
    exploder_script_model_anims();
    maps\_props::_id_0796( "generic" );
    maps\_props::_id_073F( "generic" );
    maps\_hand_signals::_id_4DC4();
    level._id_78AC["generic"]["rappel_end"] = %sniper_escape_rappel_finish;
    level._id_78AC["generic"]["rappel_start"] = %blackout_rappel_start;
    level._id_78AC["generic"]["rappel_idle"][0] = %sniper_escape_rappel_idle;
    level._id_78AC["generic"]["grenade_throw"] = %corner_standl_grenade_b;
    level._id_78AC["generic"]["moveout_cqb"] = %cqb_stand_signal_move_out;
    level._id_78AC["generic"]["moveup_cqb"] = %cqb_stand_signal_move_up;
    level._id_78AC["generic"]["stop_cqb"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["onme_cqb"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_go_cqb"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["moveout_exposed"] = %stand_exposed_wave_move_out;
    level._id_78AC["generic"]["moveup_exposed"] = %stand_exposed_wave_move_up;
    level._id_78AC["generic"]["stop_exposed"] = %stand_exposed_wave_halt;
    level._id_78AC["generic"]["stop2_exposed"] = %stand_exposed_wave_halt_v2;
    level._id_78AC["generic"]["onme_exposed"] = %stand_exposed_wave_on_me;
    level._id_78AC["generic"]["onme2_exposed"] = %stand_exposed_wave_on_me_v2;
    level._id_78AC["generic"]["enemy_exposed"] = %stand_exposed_wave_target_spotted;
    level._id_78AC["generic"]["down_exposed"] = %stand_exposed_wave_down;
    level._id_78AC["generic"]["go_exposed"] = %stand_exposed_wave_go;
    level._id_78AC["generic"]["walk_1"] = %patrolwalk_tired;
    level._id_78AC["generic"]["walk_2"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["walk_3"] = %patrolwalk_bounce;
    level._id_78AC["generic"]["walk_4"] = %patrolwalk_swagger;
    level._id_78AC["generic"]["walk_5"] = %walk_lowready_f;
    level._id_78AC["kamarov"]["binoc_idle"][0] = %blackout_binoc_idle;
    level._id_78B5["binocs"] = "weapon_binocular";
    level._id_78AC["gaz"]["powercut"] = %h1_blackout_gaz_powercut;
    level._id_78BA["gaz"]["powercut_dialog"] = "blackout_gaz_ivecutthepower";
    maps\_anim::_id_0807( "gaz", "dialog", maps\blackout_code::gaz_play_powercut_generic_facial_anim, "powercut" );
    level._id_78AC["gaz"]["powercut_idle"][0] = %h1_blackout_gaz_powercut_idle;
    maps\_anim::_id_080C( "price", "start_gaz", "start_cliff_scene_gaz" );
    maps\_anim::_id_080C( "price", "start_kam", "start_cliff_scene_kamarov" );
    maps\_anim::_id_080C( "kamarov", "drop binoculars", "kamarov_drops_binocs" );
    level._id_78AC["gaz"]["open_blackout_door"] = %h1_blackout_gaz_open_blackout_door;

    if ( getdvarint( "use_old_rappel_fight" ) == 1 )
    {
        level._id_78AC["price"]["cliff_start"] = %blackout_price_cliff;
        level._id_78AC["kamarov"]["cliff_start"] = %blackout_kam_cliff;
        level._id_78AC["gaz"]["cliff_start"] = %blackout_gaz_cliff;
        level._id_78AC["kamarov"]["cliff_start_idle"][0] = %blackout_kam_start;
        level._id_78AC["gaz"]["cliff_start_idle"][0] = %blackout_gaz_cliff_start;
        level._id_78AC["kamarov"]["cliff_end_idle"][0] = %blackout_kam_cliff_endidle;
    }
    else
    {
        level._id_78AC["kamarov"]["cliff_runin"] = %h1_blackout_kam_cliff_runin;
        level._id_78AC["price"]["cliff_runin"] = %h1_blackout_price_cliff_runin;
        level._id_78AC["gaz"]["cliff_runin"] = %h1_blackout_gaz_cliff_runin;
        level._id_78AC["kamarov"]["cliff_prestart"] = %h1_blackout_kam_cliff_gunaway;

        if ( getdvarint( "loc_language", 99 ) == 0 )
            level._id_78B2["kamarov"]["final_assault"] = %h1_blackout_kamarov_cliff_start_dialog_facial;

        level._id_78AC["price"]["cliff_start"] = %h1_blackout_price_cliff;
        level._id_78AC["kamarov"]["cliff_start"] = %h1_blackout_kam_cliff;
        level._id_78AC["gaz"]["cliff_start"] = %h1_blackout_gaz_cliff;
        level._id_78AC["price"]["cliff_start_idle"][0] = %h1_blackout_price_cliff_start;
        level._id_78AC["kamarov"]["cliff_start_idle"][0] = %h1_blackout_kam_start;
        level._id_78AC["gaz"]["cliff_start_idle"][0] = %h1_blackout_gaz_cliff_start;
        level._id_78AC["kamarov"]["cliff_end_idle"][0] = %h1_blackout_kam_cliff_endidle;
        maps\_anim::_id_080B( "gaz", "dialog", "cliff_start", "blackout_gaz_enoughsniping" );
        maps\_anim::_id_080B( "kamarov", "dialog", "cliff_start", "blackout_kmr_outofmind" );
        maps\_anim::_id_080B( "gaz", "dialog", "cliff_start", "blackout_gaz_whereishe" );
        maps\_anim::_id_080B( "kamarov", "dialog", "cliff_start", "blackout_kmr_thehouse" );
        maps\_anim::_id_080B( "gaz", "dialog", "cliff_start", "blackout_gaz_thatwasntsohard" );
        maps\_anim::_id_080B( "price", "dialog", "cliff_start", "blackout_pri_reachthathouse" );
    }

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        level._id_78AC["price"]["meeting"] = %blackout_meeting_price;
        level._id_78AC["kamarov"]["meeting"] = %blackout_meeting_kamarov;
    }
    else
    {
        level._id_78AC["price"]["meeting"] = %h1_blackout_meeting_price;
        level._id_78AC["kamarov"]["meeting"] = %h1_blackout_meeting_kamarov;
        level._id_78AC["kamarov"]["meeting_idle"][0] = %h1_blackout_meeting_kamarov_idle;
        level._id_78AC["gaz"]["meeting"] = %h1_blackout_meeting_gaz;
        maps\_anim::_id_080B( "gaz", "dialog", "meeting", "blackout_gaz_bloodyrightyoudo" );
    }

    maps\_anim::_id_0805( "kamarov", "cliff_start", "scn_blackout_kam_cliff", "scn_blackout_kam_cliff" );
    maps\_anim::_id_0805( "gaz", "cliff_start", "scn_blackout_gaz_cliff", "scn_blackout_gaz_cliff" );
    maps\_anim::_id_0805( "price", "meeting", "scn_blackout_price_meeting", "scn_blackout_price_meeting" );
    maps\_anim::_id_0805( "kamarov", "meeting", "scn_blackout_kam_meeting", "scn_blackout_kam_meeting" );
    maps\_anim::_id_0805( "kamarov", "meeting", "scn_blackout_kam_meeting_step", "scn_blackout_kam_meeting_step" );
    maps\_anim::_id_0805( "gaz", "meeting", "scn_blackout_gaz_meeting", "scn_blackout_gaz_meeting" );
    maps\_anim::_id_080B( "price", "dialog", "meeting", "blackout_pri_whattarget" );
    maps\_anim::_id_080B( "price", "dialog", "meeting", "blackout_pri_beirut" );
    level._id_78BA["price"]["move_out"] = "blackout_pri_moveout";
    maps\_anim::_id_080B( "kamarov", "dialog", "meeting", "blackout_kmr_welcome" );
    maps\_anim::_id_080B( "kamarov", "dialog", "meeting", "blackout_kmr_valleybelow" );
    maps\_anim::_id_080B( "kamarov", "dialog", "meeting", "blackout_kmr_oweyouone" );
    level._id_78AC["frnd"]["signal_assault_coverstand"] = %coverstand_hide_idle_wave02;
    level._id_78AC["frnd"]["signal_forward_coverstand"] = %coverstand_hide_idle_wave01;
    level._id_78AC["generic"]["surprise_1"] = %parabolic_chessgame_surprise_a;
    level._id_78AC["generic"]["surprise_2"] = %parabolic_chessgame_surprise_b;
    level._id_78AC["generic"]["idle_1"][0] = %parabolic_chessgame_idle_a;
    level._id_78AC["generic"]["idle_2"][0] = %parabolic_chessgame_idle_b;
    level._id_78AC["chess_guy1"]["death"] = %parabolic_chessgame_death_a;
    level._id_78AC["chess_guy2"]["death"] = %parabolic_chessgame_death_b;
    level._id_78AC["kamarov"]["overlook_gunaway"] = %h1_blackout_kamarov_overlook_gunaway;
    level._id_78AC["kamarov"]["overlook_idle"][0] = %h1_blackout_kamarov_overlook_idle;
    level._id_78AC["kamarov"]["walk_burning_house"] = %h1_blackout_burninghouse_kamarov;
    level._id_78BA["kamarov"]["walk_burning_house"] = "scn_kam_burninghouse_kick";
    level._id_78AC["kamarov"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_kamarov_idle;
    level._id_78AC["price"]["walk_burning_house"] = %h1_blackout_burninghouse_price;
    level._id_78AC["price"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_price_idle;
    level._id_78AC["gaz"]["walk_burning_house"] = %h1_blackout_burninghouse_gaz;
    level._id_78AC["gaz"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_gaz_idle;

    if ( getdvarint( "use_old_evac" ) == 1 )
    {
        level._id_78AC["vip"]["evac"] = %blackout_bh_evac_1;
        level._id_78AC["gaz"]["evac"] = %blackout_bh_evac_2;
        level._id_78AC["price"]["evac"] = %blackout_bh_evac_price;
        level._id_78AC["price"]["evac_flyaway"] = %blackout_bh_evac_price_flyaway;
        level._id_78AC["price"]["evac_idle"][0] = %blackout_bh_evac_price_idle;
    }
    else
    {
        level._id_78AC["vip"]["evac"] = %h1_blackout_bh_evac_1;
        level._id_78AC["gaz"]["evac"] = %h1_blackout_bh_evac_2;
        level._id_78AC["price"]["evac"] = %h1_blackout_bh_evac_price;
        level._id_78AC["price"]["evac_flyaway"] = %h1_blackout_bh_evac_price_flyaway;
        level._id_78AC["price"]["evac_idle"][0] = %h1_blackout_bh_evac_price_idle;
        maps\_anim::_id_0805( "vip", "evac", "scn_vip_evac_foley", "scn_vip_evac_foley" );
    }

    maps\_anim::_id_080B( "vip", "dialog", "evac", "blackout_nkd_americansattacked" );
    maps\_anim::_id_080B( "vip", "dialog", "evac", "blackout_nkd_makingamistake" );
    maps\_anim::_id_080B( "price", "dialog", "evac_flyaway", "blackout_pri_invasion" );

    if ( getdvarint( "use_old_nikolai_rescue" ) == 1 )
    {
        level._id_78AC["price"]["rescue"] = %blackout_rescue_price;
        maps\_anim::_id_0807( "price", "dialog", maps\blackout_code::vip_rescue_dialogue, "rescue" );
        level._id_78AC["vip"]["idle"][0] = %blackout_vip_cower_idle;
        level._id_78AC["vip"]["rescue"] = %blackout_rescue_vip;
        level._id_78BA["vip"]["rescue"] = "scn_blackout_vip_rescue";
        level._id_78AC["flashlight_guy"]["fl_death"] = %blackout_flashlightguy_death_only;
        level._id_78AC["flashlight_guy"]["fl_death_local"] = %blackout_flashlightguy_death_local;
        level._id_78AC["flashlight_guy"]["search"] = %blackout_flashlightguy_moment2death;
    }
    else
    {
        level._id_78AC["price"]["rescue"] = %h1_blackout_rescue_price;
        maps\_anim::_id_0807( "price", "dialog", maps\blackout_code::vip_rescue_dialogue, "rescue" );
        level._id_78AC["vip"]["idle"][0] = %h1_blackout_vip_cower_idle;
        level._id_78AC["vip"]["rescue"] = %h1_blackout_rescue_vip;
        level._id_78BA["vip"]["rescue"] = "scn_blackout_vip_rescue";
        level._id_78AC["flashlight_guy"]["fl_death"] = %h1_blackout_flashlightguy_death_only;
        level._id_78AC["flashlight_guy"]["fl_death_local"] = %blackout_flashlightguy_death_local;
        level._id_78AC["flashlight_guy"]["search"] = %h1_blackout_flashlightguy_moment2death;
        level._id_78AC["flashlight_guy"]["fire_loop"][0] = %h1_blackout_flashlightguy_loop;
        maps\_anim::_id_0805( "price", "rescue", "scn_price_rescue_get_flashlight", "scn_price_rescue_get_flashlight" );
        maps\_anim::_id_0805( "price", "rescue", "scn_price_rescue_get_vip", "scn_price_rescue_get_vip" );
        maps\_anim::_id_0805( "price", "rescue", "scn_price_rescue_get_weapon", "scn_price_rescue_get_weapon" );
    }

    maps\_anim::_id_0807( "flashlight_guy", "fire", maps\blackout_code::flashlight_fire );
    level._id_78AC["generic"]["casual_patrol_jog"] = %patrol_jog;
    level._id_78AC["generic"]["casual_patrol_walk"] = %patrolwalk_tired;
    level._id_78AC["generic"]["combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["smoke"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["moveout_cqb"] = %cqb_stand_signal_move_out;
    level._id_78AC["generic"]["moveup_cqb"] = %cqb_stand_signal_move_up;
    level._id_78AC["generic"]["stop_cqb"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["onme_cqb"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_moveup"] = %cqb_stand_signal_move_up;
    level._id_78AC["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_stop"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["bored_idle_reach"] = %patrol_bored_idle;
    level._id_78AC["generic"]["bored_idle"][0] = %patrol_bored_idle;
    level._id_78AC["generic"]["bored_idle"][1] = %patrol_bored_twitch_bug;
    level._id_78AC["generic"]["bored_idle"][2] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["bored_alert"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["bored_smoke"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["bored_cell"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["bored_salute"] = %patrol_bored_twitch_salute;
    level._id_78AC["generic"]["bored_checkphone"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["bored_cell_loop"][0] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["sleep_idle"][0] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["sleep_react"] = %parabolic_guard_sleeper_react_v2;
    level._id_78AC["generic"]["stealth_jog"] = %patrol_jog;
    level._id_78AC["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["prone_to_stand_1"] = %hunted_pronehide_2_stand_v1;
    level._id_78AC["generic"]["prone_to_stand_2"] = %hunted_pronehide_2_stand_v2;
    level._id_78AC["generic"]["prone_to_stand_3"] = %hunted_pronehide_2_stand_v3;
    level._id_78AC["generic"]["smoking_reach"] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level._id_78AC["generic"]["smoking_react"] = %parabolic_leaning_guy_react;
    level._id_78AC["generic"]["prone_dive"] = %hunted_dive_2_pronehide_v1;
    level._id_78AC["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level._id_78AC["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level._id_78AC["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level._id_78AC["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level._id_78AC["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_heard_scream"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level._id_78AC["generic"]["blind_fire_pistol"] = %blackout_blind_fire_pistol;
    level._id_78AC["generic"]["blind_fire_pistol_death"] = %blackout_blind_fire_pistol_death;
    maps\_anim::_id_0818( "generic", "blind_hide_fire", "blackout_ru1_scream" );
    level._id_78AC["generic"]["blind_hide_fire"] = %blackout_blind_hide_fire;
    level._id_78AC["generic"]["blind_hide_fire_death"] = %blackout_blind_hide_fire_death;
    maps\_anim::_id_0818( "generic", "blind_lightswitch", "blackout_ru1_electrician" );
    level._id_78AC["generic"]["blind_lightswitch"] = %blackout_blind_lightswitch;
    level._id_78AC["generic"]["blind_lightswitch_death"] = %blackout_blind_lightswitch_death;
    maps\_anim::_id_0812( "generic", "switch_up", "blind_lightswitch", "scn_blackout_lightswitch_on" );
    maps\_anim::_id_0812( "generic", "switch_down", "blind_lightswitch", "scn_blackout_lightswitch_off" );
    maps\_anim::_id_0818( "generic", "blind_wall_feel", "blackout_ru1_sasha" );
    level._id_78AC["generic"]["blind_wall_feel"] = %blackout_blind_wall_feel;
    level._id_78AC["generic"]["blind_wall_feel_death"] = %blackout_blind_wall_feel_death;
    level._id_78BA["generic"]["breathing"] = "blackout_ru4_breathing";
    level._id_78AC["generic"]["smooth_door_open"] = %hunted_open_barndoor_flathand;
    level._id_78AC["generic"]["standup"] = %exposed_crouch_2_stand;
    level._id_78BA["price"]["do_it"] = "villagedef_pri_doit";
    level._id_78BA["price"]["this_night_vision"] = "blackout_pri_nightvision";
    level._id_78BA["price"]["lets_go"] = "blackout_pri_letsgo2";
    level._id_78AC["price"]["captainpricebrief"] = %h1_blackout_captainpricebrief_price;
    level._id_78AC["gaz"]["captainpricebrief"] = %h1_blackout_captainpricebrief_gaz;
    level._id_78BA["price"]["expecting_us"] = "blackout_pri_halfaclick";

    if ( getdvarint( "use_old_captainprice_briefing" ) == 1 )
        level._id_78B2["price"]["expecting_us"] = %blackout_price_facial_moveout;
    else
        maps\_anim::_id_080B( "price", "dialog", "captainpricebrief", "blackout_pri_halfaclick" );

    level._id_78BA["price"]["wont_shoot_us"] = "blackout_pri_shootatus";
    level._id_78BA["price"]["lets_get_to_it"] = "blackout_pri_gettoit";
    level._id_78BA["price"]["over_here"] = "blackout_pri_overhere";
    level._id_78BA["price"]["in_position"] = "blackout_pri_leftflank";
    level._id_78BA["price"]["machine_gunners_in_windows"] = "blackout_pri_takeoutmgs";
    level._id_78BA["price"]["not_a_problem"] = "blackout_pri_takecare";
    level._id_78BA["price"]["watch_bmp"] = "blackout_pri_watchbmp";
    level._id_78BA["price"]["go_go_go"] = "blackout_pri_gogogo";
    level._id_78BA["price"]["cover_cliff"] = "blackout_pri_edgeofcliff";
    level._id_78BA["price"]["nice_work"] = "blackout_pri_nicework";
    level._id_78BA["price"]["where_is_informant"] = "blackout_pri_ourbargain";
    level._id_78BA["price"]["lets_move"] = "blackout_pri_stillbealive";
    level._id_78BA["price"]["cut_the_power"] = "blackout_pri_cutpower";
    level._id_78BA["price"]["its_him"] = "blackout_pri_itshim";
    level._id_78BA["price"]["have_the_package"] = "blackout_pri_meetatlz";
    level._id_78BA["price"]["lets_go_lets_go"] = "blackout_pri_letsgo";
    level._id_78BA["gaz"]["loyalists_eh"] = "blackout_gaz_loyalistseh";
    level._id_78BA["gaz"]["good_enough"] = "blackout_gaz_goodenough";
    level._id_78BA["gaz"]["cover_left_flank"] = "blackout_gaz_leftflank";
    level._id_78BA["gaz"]["got_a_bmp"] = "blackout_gaz_opportunity";
    level._id_78BA["gaz"]["helicopter_troops"] = "blackout_gaz_helitroops";
    level._id_78BA["gaz"]["tangos_neutralized"] = "blackout_gaz_allclear";
    level._id_78BA["gaz"]["hate_bargaining"] = "blackout_gaz_maybealive";
    level._id_78BA["gaz"]["regroup_with_price"] = "blackout_gaz_regroupprice";
    level._id_78BA["gaz"]["are_you_all_right"] = "blackout_gaz_allright";
    level._id_78BA["price"]["gaz_do_it"] = "blackout_pri_gazdoit";
    level._id_78BA["gaz"]["i_cut_the_power"] = "blackout_gaz_ivecutthepower";
    level._id_78B9["on_our_way"] = "blackout_mhp_onourway";
    level._id_78BA["vip"]["yes_can_still_fight"] = "blackout_nkd_icanstillfight";
    level._id_78BA["kamarov"]["moving_into_position"] = "blackout_ru2_movingintoposition";
    level._id_78BA["kamarov"]["welcome_to_new_russia"] = "blackout_kmr_newrussia";
    level._id_78BA["kamarov"]["provide_sniper"] = "blackout_kmr_snipersupprt";
    level._id_78BA["kamarov"]["bm21s_on_other_side"] = "blackout_kmr_valleybelow";
    level._id_78BA["kamarov"]["give_informant_location"] = "blackout_kmr_givelocation";
    level._id_78BA["kamarov"]["this_way"] = "blackout_kmr_thisway";
    level._id_78BA["kamarov"]["prepare_to_attack"] = "blackout_kmr_prepareattack";
    level._id_78BA["kamarov"]["find_good_vantage"] = "blackout_kmr_beready";
    level._id_78BA["kamarov"]["standby_to_attack"] = "blackout_kmr_sniperteam";
    level._id_78BA["kamarov"]["commence_attack"] = "blackout_kmr_commence";
    level._id_78BA["kamarov"]["enemy_heli_circling"] = "blackout_kmr_holdthemoff";
    level._id_78B9["informant_held_in_house"] = "blackout_kmr_deadoralive";
    level._id_78BA["price"]["tango_down"] = "UK_pri_inform_killfirm_generic_s";
    level._id_78BA["gaz"]["tango_down"] = "UK_2_inform_killfirm_generic_s";
    new_dialogue();
    maps\_breach_explosive_left::main();
    _id_7A3D();
    _id_6BD0();
    blackhawk_anims();
    radio_prec();
    animated_model_setup();
}
#using_animtree("script_model");

_id_7A3D()
{
    level._id_78AC["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level._id_78B1["chair"] = #animtree;
    level._id_78B5["chair"] = "com_folding_chair";
    maps\_anim::_id_0807( "chair", "scn_relaxed_guard_chair_death", ::play_relaxed_guard_chair_death, "sleep_react" );
    level._id_78B1["rope"] = #animtree;
    level._id_78B5["rope"] = "rappelrope100_ri";
    level._id_78AC["player_rope"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level._id_78B1["player_rope"] = #animtree;
    level._id_78B5["player_rope"] = "rappelrope100_le";
    level._id_78AC["rope"]["rappel_end"] = %sniper_escape_rappel_finish_rappelrope100;
    level._id_78AC["rope"]["rappel_start"] = %blackout_rappel_start_rappelrope100;
    level._id_78AC["rope"]["rappel_idle"][0] = %sniper_escape_rappel_idle_rappelrope100;

    if ( getdvarint( "use_old_nikolai_rescue" ) == 1 )
    {
        level._id_78AC["flashlight"]["rescue"] = %blackout_rescue_price_flashlight;
        level._id_78AC["flashlight"]["search"] = %blackout_flashlightguy_moment2death_flashlight;
        level._id_78BA["flashlight"]["search"] = "scn_blackout_drop_flashlight_draw";
        level._id_78AC["flashlight"]["fl_death"] = %blackout_flashlightguy_death_flashlight;
        level._id_78BA["flashlight"]["fl_death"] = "scn_blackout_drop_flashlight";
    }
    else
    {
        level._id_78AC["flashlight"]["rescue"] = %h1_blackout_rescue_price_flashlight;
        level._id_78AC["flashlight"]["search"] = %h1_blackout_flashlightguy_moment2death_flashlight;
        level._id_78BA["flashlight"]["search"] = "scn_blackout_drop_flashlight_draw";
        level._id_78AC["flashlight"]["fire_loop"][0] = %h1_blackout_flashlightguy_loop_flashlight;
        level._id_78AC["flashlight"]["fl_death"] = %h1_blackout_flashlightguy_death_flashlight;
        level._id_78BA["flashlight"]["fl_death"] = "scn_blackout_drop_flashlight";
    }

    level._id_78B1["flashlight"] = #animtree;
    level._id_78B5["flashlight"] = "com_flashlight_on";
    level._id_78AC["player_rope_obj"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level._id_78B1["player_rope_obj"] = #animtree;
    level._id_78B5["player_rope_obj"] = "rappelrope100_le_obj";
    level._id_78B1["electrical_box_animated"] = #animtree;
    level._id_78B5["electrical_box_animated"] = "me_electricbox4_dirty_rus_animated";
    level._id_78AC["electrical_box_animated"]["idle"][0] = %h1_blackout_electric_box_animated_1_idle;
    level._id_78AC["electrical_box_animated"]["powercut"] = %h1_blackout_electric_box_animated_2_cutting_power;
    level._id_78AC["electrical_box_animated"]["idle_cut"][0] = %h1_blackout_electric_box_animated_3_idle_cut;
}
#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["still"] = %foliage_birch_tree_hero_still;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["strong"] = %foliage_birch_tree_hero_sway;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["heli"] = %foliage_birch_tree_hero_heliwash;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["still"] = %h1_tree_pine_evergreen_03_hero_still;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["strong"] = %h1_tree_pine_evergreen_03_hero_sway;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["heli"] = %h1_tree_pine_evergreen_03_hero_heliwash;
}

play_relaxed_guard_chair_death( var_0 )
{
    var_0 thread common_scripts\utility::_id_69C2( "scn_relaxed_guard_chair_fall", var_0.origin + ( 0, 0, 30 ) );
}
#using_animtree("player");

_id_6BD0()
{
    level._id_78B1["player_rig"] = #animtree;
    level._id_78B5["player_rig"] = "worldbody_h1_sas_woodland";
    level._id_78AC["player_rig"]["rappel"] = %sniper_escape_player_rappel;

    if ( getdvarint( "use_old_evac" ) == 1 )
        level._id_78AC["player_rig"]["player_evac"] = %blackout_bh_evac_player;
    else
    {
        level._id_78B1["evac_rig"] = #animtree;
        level._id_78B5["evac_rig"] = "worldbody_h1_sas_woodland";
        level._id_78AC["evac_rig"]["player_evac"] = %h1_blackout_bh_evac_player;
    }
}
#using_animtree("vehicles");

blackhawk_anims()
{
    level._id_78AC["blackhawk"]["idle"][0] = %blackout_bh_evac_heli_idle;
    level._id_78AC["blackhawk"]["landing"] = %h1_blackout_bh_evac_heli_land;
    level._id_78AC["blackhawk"]["take_off"] = %blackout_bh_evac_heli_takeoff;
    maps\_anim::_id_0807( "blackhawk", "fade", ::blackout_missionsuccess );
    level._id_78AC["blackhawk"]["rotors"] = %bh_rotors;
    level._id_78B1["blackhawk"] = #animtree;
}

blackout_missionsuccess( var_0 )
{
    maps\_utility::_id_60D6();
}

radio_prec()
{
    level._id_78B9["weapons_free"] = "cargoship_pri_weaponsfree";
    level._id_78B9["roger_that"] = "cargoship_grg_rogerthatradio";
    level._id_78B9["go!"] = "cargoship_pri_go";
    level._id_78B9["watch_for_movement"] = "cargoship_pri_watchmovement";
    level._id_78B9["whats_noise"] = "cargoship_grg_whatsnoise";
}

new_dialogue()
{
    level._id_78BA["price"]["guard_posts_ahead"] = "blackout_pri_guardpostsahead";
    level._id_78BA["price"]["smell_that"] = "blackout_pri_smellthatgaz";
    level._id_78BA["gaz"]["yeah_kam"] = "blackout_gaz_yeahkamarov";
    level._id_78BA["gaz"]["bloody_right"] = "blackout_gaz_bloodyrightyoudo";
    level._id_78BA["price"]["what_target"] = "blackout_pri_whattarget";
    level._id_78BA["kamarov"]["good_spot"] = "blackout_kmr_goodspot";
    level._id_78BA["price"]["switch_sniper"] = "blackout_pri_switchtosniper";
    level._id_78BA["price"]["mg_windows"] = "blackout_pri_mgwindows";
    level._id_78BA["price"]["mg_walls"] = "blackout_pri_mgwalls";
    level._id_78BA["price"]["other_mg_wall"] = "blackout_pri_othermgwall";
    level._id_78BA["price"]["mg_low"] = "blackout_pri_mglow";
    level._id_78BA["price"]["macmillan_impressed"] = "blackout_pri_impressed";
    level._id_78BA["kamarov"]["damn_helis"] = "blackout_kmr_damnhelis";
    level._id_78BA["price"]["you_didnt_say"] = "blackout_pri_youdidntsay";
    level._id_78BA["kamarov"]["need_protect"] = "blackout_kmr_needtoprotect";
    level._id_78BA["price"]["make_quick"] = "blackout_pri_makeitquick";
    level._id_78BA["kamarov"]["nothing_to_worry"] = "blackout_kmr_nothingtoworry";
    level._id_78BA["gaz"]["beat_it_out"] = "blackout_gaz_beatitoutofhim";
    level._id_78BA["price"]["not_yet"] = "blackout_pri_notyet";
    level._id_78BA["kamarov"]["stalling"] = "blackout_kmr_stalling";
    level._id_78BA["kamarov"]["heavy_resistance"] = "blackout_kmr_heavyresistance";
    level._id_78BA["price"]["our_informant"] = "blackout_pri_ourinformant";
    level._id_78BA["kamarov"]["then_help"] = "blackout_kmr_thenhelpus";
    level._id_78BA["kamarov"]["making_progress"] = "blackout_kmr_makingprogress";
    level._id_78BA["kamarov"]["final_assault"] = "blackout_kmr_finalassault";
    level._id_78BA["gaz"]["enough_sniping"] = "blackout_gaz_enoughsniping";
    level._id_78BA["kamarov"]["russian_out_of_mind"] = "blackout_kmr_outofmind";
    level._id_78BA["kamarov"]["english_out_of_mind"] = "blackout_kmr_areyououteng";
    level._id_78BA["gaz"]["where_is"] = "blackout_gaz_whereishe";
    level._id_78BA["kamarov"]["the_house"] = "blackout_kmr_thehouse";
    level._id_78BA["gaz"]["wasnt_that_hard"] = "blackout_gaz_thatwasntsohard";
    level._id_78BA["price"]["reach_that_house"] = "blackout_pri_reachthathouse";
    level._id_78BA["price"]["get_down_here"] = "blackout_pri_getdownhere";
    level._id_78BA["gaz"]["plant_claymore"] = "blackout_gaz_plantsomeclaymores";
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

exploder_script_model_anims()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_01_anim"] = %h1_blackout_burning_house_01_anim;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_02_anim"] = %h1_blackout_burning_house_02_anim;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_03_0_anim"] = %h1_blackout_burning_house_03_0_anim;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_03_1_anim"] = %h1_blackout_burning_house_03_1_anim;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_03_2_anim"] = %h1_blackout_burning_house_03_2_anim;
    level._id_78AC["exploder_script_model"]["h1_blackout_burning_house_03_3_anim"] = %h1_blackout_burning_house_03_3_anim;
}
