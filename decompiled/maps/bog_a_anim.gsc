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
    level._id_78B5["tank_draw"] = "vehicle_m1a1_abrams_drawing";
    precachemodel( maps\_utility::_id_4026( "tank_draw" ) );
    level._id_78AC["paulsen"]["melee"] = %bog_melee_r_defend;
    level._id_78BA["paulsen"]["melee"] = "bog_scn_melee_struggle";
    level._id_78BA["paulsen"]["melee_sound_stop"] = "bog_scn_melee_struggle_end";
    level._id_78AC["paulsen"]["back_death1"] = %bog_melee_r_backdeath1;
    level._id_78AC["paulsen"]["back_death2"] = %bog_melee_r_backdeath2;
    level._id_78AC["paulsen"]["stand_death"] = %bog_melee_r_standdeath;
    maps\_anim::addnotetrack_customfunction( "paulsen", "fire", maps\bog_a_code::paulsen_end_fire, "stand_death" );
    maps\_anim::addnotetrack_customfunction( "paulsen", "end standdeath", maps\bog_a_code::paulsen_end_standdeath );
    maps\_anim::addnotetrack_customfunction( "paulsen", "start backdeath1", maps\bog_a_code::paulsen_start_backdeath1 );
    maps\_anim::addnotetrack_customfunction( "paulsen", "start backdeath2", maps\bog_a_code::paulsen_start_backdeath2 );
    level._id_78AC["price"]["tank_is_stuck"] = %bog_a_start_briefing;
    maps\_anim::addnotetrack_sound( "price", "dialog", "tank_is_stuck", "bog_vsq_halfaclick" );
    thread saw_ac_unit();
    level._id_78AC["saw"]["setup"] = %bog_a_saw_setup;
    level._id_78AC["saw"]["fire_loop"][0] = %bog_a_saw_fire;
    maps\_anim::addnotetrack_customfunction( "saw", "kick", maps\bog_a::kick_ac_unit );
    level._id_78AC["emslie"]["melee"] = %bog_melee_r_attack;
    level._id_78AC["emslie"]["melee_done"] = %pistol_stand_switch;
    level._id_78AC["emslie"]["death"] = %exposed_death_groin;
    maps\_anim::addnotetrack_customfunction( "emslie", "scn_melee_custom_pistol_fire", maps\bog_a_aud::play_melee_custom_pistol_fire_sfx, "melee" );
    level._id_78AC["generic"]["spin"] = %combatwalk_f_spin;
    level._id_78AC["price"]["wait_approach"] = %bog_price_wait_idle_approach;
    level._id_78AC["price"]["wait_idle"][0] = %bog_price_wait_idle;
    level._id_78AC["price"]["wave1"] = %bog_price_wait_wave_a;
    level._id_78AC["price"]["wave2"] = %bog_price_wait_wave_b;
    level._id_78BA["price"]["javelin_briefing"] = "bog_vsq_hitemwithjavelin";
    level._id_78AC["javelin_guy"]["hangout_arrival"] = %bog_a_javelin_jog_2_idle;
    level._id_78AC["javelin_guy"]["hangout_idle"][0] = %bog_a_javelin_idle;
    level._id_78AC["javelin_guy"]["run"] = %bog_a_javelin_jog;
    level._id_78AC["javelin_guy"]["death"] = %bog_a_javelin_death;
    level._id_78AC["generic"]["sprint"] = %sprint1_loop;
    level._id_78AC["price"]["sprint"] = %sprint1_loop;
    level._id_78BA["javelin_guy"]["right_away"] = "bog_gm2_rightaways_alt";
    level._id_78BA["price"]["get_jav"] = "bog_a_vsq_takeouttanks";
    level._id_78BA["price"]["jav_reminder_1"] = "bog_vsq_javelinsecondfloormove";
    level._id_78BA["price"]["jav_reminder_2"] = "bog_vsq_jacksonpickupjavelin";
    level._id_78AC["second_floor_right_guy"]["door_breach_setup"] = %shotgunbreach_v1_shoot_hinge;
    level._id_78AC["second_floor_right_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_shoot_hinge_idle;
    level._id_78AC["second_floor_right_guy"]["door_breach_idle"][0] = %shotgunbreach_v1_shoot_hinge_ready_idle;
    level._id_78AC["second_floor_right_guy"]["door_breach"] = %shotgunbreach_v1_shoot_hinge_runin;
    level._id_78AC["second_floor_left_guy"]["door_breach_setup"] = %shotgunbreach_v1_stackb;
    level._id_78AC["second_floor_left_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_stackb_idle;
    level._id_78AC["second_floor_left_guy"]["door_breach_idle"][0] = %shotgunbreach_v1_stackb_ready_idle;
    level._id_78AC["second_floor_left_guy"]["door_breach"] = %shotgunbreach_v1_stackb_runin;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        level._id_78AC["fence_guy1"]["fence_cut"] = %icbm_fence_cutting_guy1;
        level._id_78AC["fence_guy2"]["fence_cut"] = %icbm_fence_cutting_guy2;
    }
    else
    {
        level._id_78AC["fence_guy1"]["fence_cut"] = %h1_bog_a_fence_cutting_guy1;
        level._id_78AC["fence_guy2"]["fence_cut"] = %h1_bog_a_fence_cutting_guy2;
    }

    maps\_anim::addnotetrack_animsound( "second_floor_right_guy", "door_breach_setup", "fire", "bog_a_doorbreach_scripted_gun" );
    maps\_anim::addnotetrack_animsound( "second_floor_right_guy", "door_breach", "fire", "bog_a_doorbreach_scripted_gun" );
    maps\_anim::addnotetrack_attach( "fence_guy1", "can_in_hand", "com_spray_can01", "tag_inhand", "fence_cut" );
    precachemodel( "com_spray_can01" );
    maps\_anim::addnotetrack_detach( "fence_guy1", "can_out_hand", "com_spray_can01", "tag_inhand", "fence_cut" );
    maps\_anim::addnotetrack_animsound( "fence_guy1", "fence_cut", "scn_icbm_fence_cut", "scn_bog_a_fence_cut" );
    maps\_anim::addnotetrack_animsound( "fence_guy1", "fence_cut", "scn_icbm_fence_pull", "scn_bog_a_fence_pull" );
    maps\_anim::addnotetrack_customfunction( "fence_guy1", "can_start_spray", ::spraycan_fx, "fence_cut" );
    maps\_anim::addnotetrack_customfunction( "fence_guy1", "can_stop_spray", ::spraycan_fx_stop, "fence_cut" );
    level._id_78BA["generic"]["move_it"] = "bog_gm2_moveit";
    level._id_78BA["generic"]["keep_moving_up"] = "bog_gm3_clearkeepmoving";
    level._id_78BA["generic"]["ambush1"] = "bog_gm2_ambush1";
    level._id_78BA["generic"]["ambush2"] = "bog_gm2_ambush2";
    level._id_78BA["guy_two"]["contact_left"] = "bog_gm2_contactleft";
    level._id_78BA["price"]["switch_to_night_vision"] = "bog_vsq_contactright";
    level._id_78BA["generic"]["contact_right"] = "bog_gm1_contactright";
    level._id_78BA["price"]["suppress_building"] = "bog_vsq_suppressionbuilding";
    level._id_78BA["price"]["keep_moving"] = "bog_vsq_keepforward";
    level._id_78BA["price"]["take_the_stairs"] = "bog_vsq_alphatakestairs";
    level._id_78BA["price"]["follow_me"] = "bog_vsq_letsgojackson";
    level._id_78BA["price"]["move_it"] = "bog_vsq_comeonjackson";
    level._id_78BA["price"]["this_way"] = "bog_vsq_jacksonthisway";
    level._id_78BA["price"]["head_upstairs"] = "bog_vsq_jacksonheadupstairs";
    level._id_78BA["price"]["hit_their_flank"] = "bog_vsq_hittheirflank";
    level._id_78BA["price"]["use_their_gun"] = "bog_vsq_usemachinegun";
    level._id_78BA["price"]["shoot_through_wall"] = "bog_vsq_cutemdown";
    level._id_78BA["price"]["good_job"] = "bog_vsq_goodjob";
    level._id_78BA["price"]["move_out"] = "bog_vsq_letsmoveout";
    level._id_78BA["price"]["flank_right"] = "bog_vsq_squadthisway";
    level._id_78BA["price"]["secure_the_upper_floors"] = "bog_vsq_gowithsgtpaulsen";
    level._id_78BA["second_floor_left_guy"]["clear"] = "bog_gm1_clear";
    level._id_78BA["second_floor_right_guy"]["clear"] = "bog_gm2_clear1";
    level._id_78BA["third_floor_left_guy"]["clear"] = "bog_gm2_clear2";
    level._id_78BA["third_floor_right_guy"]["clear"] = "bog_gm2_clear3";
    level._id_78BA["guy_one"]["more_holed_up"] = "bog_gm1_moreholedup";
    level._id_78BA["guy_three"]["coming_back_down"] = "bog_gm3_secondsquad";
    level._id_78BA["price"]["roger_that"] = "bog_gm2_rogerthat";
    level._id_78BA["price"]["working_on_it"] = "bog_vsq_workingonit";
    level._id_78BA["second_floor_left_guy"]["three_coming_out"] = "bog_gm1_threecomin";
    level._id_78BA["price"]["squad_regroup"] = "bog_vsq_squadregroup";
    level._id_78BA["guy_one"]["contact_overpass"] = "bog_gm1_contactoverpass";
    level._id_78BA["price"]["get_on_the_roof"] = "bog_vsq_skigettoroof";
    level._id_78BA["guy_two"]["got_the_javelin"] = "bog_gm2_ivegotjavelin";
    level._id_78BA["price"]["pickup_hint_1"] = "bog_a_vsq_takeouttanks";
    level._id_78BA["price"]["pickup_hint_2"] = "bog_a_vsq_pickupjavnow";
    level._id_78BA["price"]["pickup_hint_3"] = "bog_a_vsq_pickupjav";
    level._id_78BA["price"]["second_floor_hint_1"] = "bog_a_vsq_secondfloor";
    level._id_78BA["price"]["second_floor_hint_2"] = "bog_gm1_vehiclesbridge";
    level._id_78BA["price"]["right_away_s"] = "bog_gm2_rightaways";
    level._id_78BA["price"]["watch_your_fire"] = "bog_pls_onsecondfloor";
    level._id_78BA["paulsen"]["gah"] = "bog_pls_gah";
    level._id_78BA["paulsen"]["shoot_him"] = "bog_pls_shoothim";
    level._id_78BA["paulsen"]["thanks_jackson"] = "bog_pls_thanksjackson";
    level._id_78BA["saw"]["ton_of_them"] = "bog_ems_tonofem";
    level._id_78BA["price"]["shut_up"] = "bog_vsq_shutup";
    level._id_78BA["saw"]["suppressing_fire"] = "bog_ems_suppressingfire";
    level._id_78B9["shifting_fire"] = "bog_gm2_shiftingfire";
    level._id_78B9["get_there_asap"] = "bog_hqr_moreenemytroops";
    level._id_78B9["coming_from_south"] = "bog_vsq_cominginfromsouth";
    level._id_78B9["switch_off_nightvision"] = "bog_gm1_offnightvision";
    level._id_78B9["could_use_help"] = "bog_gm3_rogerthat";
    level._id_78BA["generic"]["hit_vehicles"] = "bog_gm2_hitvehicles";
    level._id_78BA["generic"]["backblast_clear"] = "bog_gm2_backblastclear";
    level._id_78BA["generic"]["hit_target_1"] = "bog_gm2_targetdestroyed";
    level._id_78BA["generic"]["hit_target_2"] = "bog_gm2_niceone";
    level._id_78BA["generic"]["hit_target_3"] = "bog_gm2_goodshotman";
    level._id_78BA["generic"]["hit_target_4"] = "bog_gm2_lastofem";
    level._id_78B9["where_are_you"] = "bog_gm3_bravosix";
    level._id_78BA["price"]["almost_there"] = "bog_vsq_almostthere";
    level._id_78BA["generic"]["other_side"] = "bog_gm2_tanksotherside";
    level._id_78BA["price"]["this_way"] = "bog_vsq_thiswayletsgo";
    _id_2D52();
    animated_model_setup();
    setup_exploder_anims();
    _id_7A3D();
}
#using_animtree("ac");

saw_ac_unit()
{
    level._id_78AC["ac"]["setup"] = %bog_a_ac_falldown;
    level._id_78B1["ac"] = #animtree;
}
#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_tree_palm_tall_3"]["still"] = %palmtree_tall3_still;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["strong"] = %palmtree_tall3_sway;
    level.anim_prop_models["foliage_tree_palm_med_2"]["still"] = %palmtree_med2_still;
    level.anim_prop_models["foliage_tree_palm_med_2"]["strong"] = %palmtree_med2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["still"] = %palmtree_bushy1_still;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["strong"] = %palmtree_bushy1_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["still"] = %palmtree_bushy2_still;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["strong"] = %palmtree_bushy2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_med_1"]["still"] = %palmtree_med1_still;
    level.anim_prop_models["foliage_tree_palm_med_1"]["strong"] = %palmtree_med1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["still"] = %palmtree_tall1_still;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["strong"] = %palmtree_tall1_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["still"] = %h1_foliage_backlot_palm_tree_03_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["strong"] = %h1_foliage_backlot_palm_tree_03_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["heli"] = %h1_foliage_backlot_palm_tree_03_hero_heliwash;
}
#using_animtree("door");

_id_2D52()
{
    level._id_78AC["door"]["door_breach"] = %shotgunbreach_door_immediate;
    level._id_78B1["door"] = #animtree;
    level._id_78B5["door"] = "com_door_01_handleleft2";
    precachemodel( level._id_78B5["door"] );
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

_id_7A3D()
{
    level._id_78B1["fence"] = #animtree;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        level._id_78AC["fence"]["fence_cut"] = %icbm_fence_cutting_guy1_fence;
    else
        level._id_78AC["fence"]["fence_cut"] = %h1_bog_a_fence_cutting_guy1_fence;

    level._id_78B5["fence"] = "icbm_fence_cut";
    precachemodel( maps\_utility::_id_4026( "fence" ) );
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_boga_center0_anim"] = %h1_boga_center0_anim;
    level._id_78AC["exploder_script_model"]["h1_boga_center1_anim"] = %h1_boga_center1_anim;
    level._id_78AC["exploder_script_model"]["h1_boga_left0_anim"] = %h1_boga_left0_anim;
    level._id_78AC["exploder_script_model"]["h1_boga_left1_anim"] = %h1_boga_left1_anim;
    level._id_78AC["exploder_script_model"]["h1_boga_left2_anim"] = %h1_boga_left2_anim;
    level._id_78AC["exploder_script_model"]["h1_boga_left3_anim"] = %h1_boga_left3_anim;
}

spraycan_fx( var_0 )
{
    level endon( "stop_spray_fx" );
    level endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::_id_3FA8( "freezespray" ), var_0, "tag_spraycan_fx" );
        wait 0.1;
    }
}

spraycan_fx_stop( var_0 )
{
    level notify( "stop_spray_fx" );
}
