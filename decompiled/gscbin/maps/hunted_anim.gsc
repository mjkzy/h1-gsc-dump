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
    run_anims();
    _id_29F3();
    _id_6A5B();
    anim_blackhawk();
    scriptmodel_anims();
    animated_model_setup();
    bm21_custom();
}
#using_animtree("generic_human");

_id_0C7A()
{
    level._id_78AC["price"]["hunted_opening_price"] = %hunted_opening_price;
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_onepiece" );
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_getup" );
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_comeonsearchparties" );
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_casualtyreport" );
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_bugger" );
    _id_A510::_id_080B( "price", "dialog", "hunted_opening_price", "hunted_pri_extractionpoint" );
    level._id_78AC["steve"]["hunted_opening_nikolai"] = %hunted_opening_nikolai;
    level._id_78AC["dead_guy"]["hunted_dying"] = %hunted_dying_deadguy;
    level._id_78AC["dead_guy"]["hunted_dying_endidle"][0] = %hunted_dying_deadguy_endidle;
    level._id_78AC["steve"]["hunted_dying"] = %hunted_dying_soldier;
    level._id_78AC["mark"]["mark_hunted_dying"] = %hunted_dying_gaz;
    _id_A510::_id_080B( "mark", "dialog", "mark_hunted_dying", "hunted_uk2_bothpilotsdead" );
    level._id_78AC["price"]["hunted_wave_chat"] = %hunted_wave_chat;
    level._id_78BA["price"]["hunted_wave_chat_snd"] = "hunted_pri_underbridge";
    level._id_78AC["charlie"]["hunted_wave_chat"] = %hunted_spotter_wave_chat;
    level._id_78BA["charlie"]["hunted_wave_chat_snd"] = "hunted_sas2_vehiclesnorth";
    level._id_78AC["charlie"]["hunted_spotter_idle"][0] = %hunted_spotter_idle;
    level._id_78AC["charlie"]["hunted_spotter_idle"][1] = %hunted_spotter_twitch;
    level._id_78AC["mark"]["hunted_tunnel_guy1_runin"] = %hunted_tunnel_guy1_runin;
    level._id_78AC["mark"]["hunted_tunnel_guy1_idle"][0] = %hunted_tunnel_guy1_idle;
    level._id_78AC["mark"]["hunted_tunnel_guy1_lookup"] = %hunted_tunnel_guy1_lookup;
    level._id_78AC["mark"]["hunted_tunnel_guy1_runout"] = %hunted_tunnel_guy1_runout;
    level._id_78AC["price"]["hunted_tunnel_guy2_runin"] = %hunted_tunnel_guy2_runin;
    level._id_78AC["price"]["hunted_tunnel_guy2_idle"][0] = %hunted_tunnel_guy2_idle;
    level._id_78AC["price"]["hunted_tunnel_guy2_runout"] = %hunted_tunnel_guy2_runout;
    level._id_78BA["price"]["hunted_tunnel_guy2_runout"] = "hunted_pri_letsmove";
    level._id_78AC["price"]["hunted_tunnel_guy2_runout_interrupt"] = %hunted_tunnel_guy2_runout;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        level._id_78AC["price"]["hunted_open_barndoor"] = %hunted_open_barndoor;
        level._id_78AC["price"]["hunted_open_barndoor_nodialogue"] = %hunted_open_barndoor;
    }
    else
    {
        level._id_78AC["price"]["hunted_open_barndoor"] = %h1_hunted_open_barndoor_01;
        level._id_78AC["price"]["hunted_open_barndoor_nodialogue"] = %h1_hunted_open_barndoor_01;
    }

    level._id_78BA["price"]["hunted_open_barndoor"] = "hunted_pri_holdup";

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        level._id_78AC["price"]["hunted_open_barndoor_stop"] = %hunted_open_barndoor_stop;
        level._id_78AC["price"]["hunted_open_barndoor_idle"][0] = %hunted_open_barndoor_idle;
    }
    else
    {
        level._id_78AC["price"]["hunted_open_barndoor_stop"] = %h1_hunted_open_barndoor_stop;
        level._id_78AC["price"]["hunted_open_barndoor_idle"][0] = %h1_hunted_open_barndoor_idle;
    }

    level._id_78AC["mark"]["door_kick_in"] = %doorkick_2_cqbwalk;
    level._id_78AC["leader"]["hunted_farmsequence"] = %hunted_farmsequence_leader;
    level._id_78AC["farmer"]["hunted_farmsequence"] = %hunted_farmsequence_farmer;
    level._id_78AC["thug"]["hunted_farmsequence"] = %hunted_farmsequence_brute1;
    level._id_78AC["thug2"]["hunted_farmsequence"] = %hunted_farmsequence_brute2;
    level._id_78AC["farmer"]["farmer_deathpose"][0] = %hunted_farmsequence_farmer_deathpose;
    level._id_78AC["farmer"]["farmer_altending"] = %hunted_farmsequence_farmer_altending;
    level._id_78AC["farmer"]["hack_idle"][0] = %hunted_pronehide_idle_v3;
    _id_A510::_id_080B( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_dontplaystupid" );
    _id_A510::_id_080B( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_hidingsoldiers" );
    _id_A510::_id_080B( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_forgetit" );
    _id_A510::_id_080B( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_whatsgoingon" );
    _id_A510::_id_080B( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_hidingwho" );
    _id_A510::_id_080B( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_british" );
    level._id_78AC["price"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v1;
    level._id_78AC["price"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v1;
    level._id_78AC["price"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v1;
    level._id_78AC["mark"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v1;
    level._id_78AC["mark"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v1;
    level._id_78AC["mark"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v1;
    level._id_78AC["steve"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v2;
    level._id_78AC["steve"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v2;
    level._id_78AC["steve"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v2;
    level._id_78AC["charlie"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v3;
    level._id_78AC["charlie"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v3;
    level._id_78AC["charlie"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v3;
    level._id_78AC["mark"]["hunted_open_basement_door_kick"] = %hunted_open_basement_door_kick;
    level._id_78B3["mark"]["hunted_open_basement_door_kick"] = 0.4;
    level._id_78AC["price"]["hunted_basement_door_block"] = %hunted_basement_door_block;
    level._id_78AC["price"]["hunted_open_creek_gate_stop"] = %hunted_open_barndoor_stop;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        level._id_78AC["price"]["hunted_open_creek_gate"] = %hunted_open_barndoor;
    else
        level._id_78AC["price"]["hunted_open_creek_gate"] = %h1_hunted_open_grilldoor;

    level._id_78AC["guard1"]["roadblock_sequence"] = %hunted_roadblock_guy1_sequence;
    level._id_78AC["guard1"]["roadblock_startidle"][0] = %hunted_roadblock_guy1_startidle;
    level._id_78AC["guard2"]["roadblock_sequence"] = %hunted_roadblock_guy2_sequence;
    level._id_78AC["guard2"]["roadblock_startidle"][0] = %hunted_roadblock_guy2_startidle;
    level._id_78AC["price"]["hunted_open_big_barn_gate_stop"] = %hunted_open_barndoor_stop;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        level._id_78AC["price"]["hunted_open_big_barn_gate"] = %hunted_open_barndoor;
    else
        level._id_78AC["price"]["hunted_open_big_barn_gate"] = %h1_hunted_open_barndoor_02;

    level._id_78AC["mark"]["hunted_celebrate"] = %hunted_celebrate;
    level._id_78BA["mark"]["hunted_celebrate"] = "hunted_uk2_outrageous";
    level._id_78AC["steve"]["hunted_celebrate"] = %hunted_celebrate_v2;
    level._id_78AC["charlie"]["hunted_celebrate"] = %hunted_celebrate_v3;
    level._id_78AC["dead_guy"]["death1"] = %exposed_death_nerve;
    level._id_78AC["dead_guy"]["death2"] = %exposed_death_falltoknees;
    level._id_78AC["dead_guy"]["death3"] = %exposed_death_headshot;
    level._id_78AC["dead_guy"]["death4"] = %exposed_crouch_death_twist;
    level._id_78AC["dead_guy"]["death5"] = %exposed_crouch_death_fetal;
    level._id_78B1["dead_guy"] = #animtree;
    level._id_78AC["farmer"]["farmer_surprised"] = %h1_hunted_farmer_surprised;
    level._id_78AC["farmer"]["runaway"] = %h1_hunted_farmer_runaway;
    level._id_78AC["price"]["talk_to_control"] = %h1_hunted_price_talks_to_control;
    _id_A510::_id_080B( "price", "dialog", "talk_to_control", "hunted_pri_100metres" );
}

run_anims()
{
    level._id_78AC["price"]["path_slow"] = %huntedrun_1_idle;
    level._id_78AC["price"]["path_slow_left"] = %huntedrun_1_look_left;
    level._id_78AC["price"]["path_slow_right"] = %huntedrun_1_look_right;
    level._id_78AC["price"]["sprint"] = %sprint1_loop;
    level._id_78AC["mark"]["path_slow"] = %huntedrun_1_idle;
    level._id_78AC["mark"]["sprint"] = %sprint1_loop;
    level._id_78AC["steve"]["path_slow"] = %huntedrun_2;
    level._id_78AC["steve"]["sprint"] = %sprint1_loop;
    level._id_78AC["charlie"]["path_slow"] = %huntedrun_1_idle;
    level._id_78AC["charlie"]["sprint"] = %sprint1_loop;
    level._id_78AC["thug"]["walk_slow"] = %huntedrun_2;
    level._id_78AC["farmer"]["walk"] = %huntedrun_1_idle;
    level._id_78AC["guard1"]["patrolwalk"] = %active_patrolwalk_v1;
    level._id_78AC["guard2"]["patrolwalk"] = %active_patrolwalk_v2;
    level._id_78AC["axis"]["patrolwalk_1"] = %active_patrolwalk_v1;
    level._id_78AC["axis"]["patrolwalk_2"] = %active_patrolwalk_v2;
    level._id_78AC["axis"]["patrolwalk_3"] = %active_patrolwalk_v3;
    level._id_78AC["axis"]["patrolwalk_4"] = %active_patrolwalk_v4;
    level._id_78AC["axis"]["patrolwalk_5"] = %active_patrolwalk_v5;
    level._id_78AC["axis"]["patrolwalk_pause"] = %active_patrolwalk_pause;
    level._id_78AC["axis"]["patrolwalk_turn"] = %active_patrolwalk_turn_180;
    level._id_78AC["axis"]["patrolwalk_nolight"] = %huntedrun_1_idle;
    level._id_78AC["axis"]["dazed_0"] = %hunted_dazed_walk_e_run;
    level._id_78AC["axis"]["dazed_1"] = %hunted_dazed_walk_a_zombie;
    level._id_78AC["axis"]["dazed_2"] = %hunted_dazed_walk_b_blind;
    level._id_78AC["axis"]["dazed_3"] = %hunted_dazed_walk_d_woozy;
    level._id_78AC["axis"]["dazed_4"] = %hunted_dazed_walk_c_limp;
}

_id_29F3()
{
    level._id_78BA["price"]["youallright"] = "hunted_pri_youallright";
    level._id_78BA["price"]["casualtyreport"] = "hunted_pri_casualtyreport";
    level._id_78BA["mark"]["bothpilotsdead"] = "hunted_uk2_bothpilotsdead";
    level._id_78BA["price"]["bugger"] = "hunted_pri_bugger";
    level._id_78BA["price"]["extractionpoint"] = "hunted_pri_extractionpoint";
    level._id_78B9["hunted_price_ac130_inbound"] = "hunted_price_ac130_inbound";
    level._id_78BA["price"]["hunted_pri_copy"] = "hunted_pri_copy";
    level._id_78BA["mark"]["hunted_uk2_ac130"] = "hunted_uk2_ac130";
    level._id_78BA["price"]["lowprofile"] = "hunted_pri_lowprofile";
    level._id_78BA["price"]["killoldman"] = "hunted_pri_killoldman";
    level._id_78BA["price"]["keepmoving"] = "hunted_pri_keepmoving";
    level._id_78BA["mark"]["areaclear"] = "hunted_uk2_areaclear";
    level._id_78BA["price"]["holdfire"] = "hunted_pri_holdfire";
    level._id_78BA["generic"]["hunted_ru1_isadump"] = "hunted_ru1_isadump";
    level._id_78BA["generic"]["laugh1"] = "hunted_ru1_laugh";
    level._id_78BA["generic"]["laugh2"] = "hunted_ru2_laugh";
    level._id_78BA["price"]["hitdeck"] = "hunted_pri_hitdeck";
    level._id_78BA["generic"]["bythehouse"] = "hunted_ru1_bythehouse";
    level._id_78BA["price"]["staydown"] = "hunted_pri_staydown";
    level._id_78BA["price"]["helismoving"] = "hunted_pri_helismoving";
    level._id_78BA["price"]["ontous"] = "hunted_pri_ontous";
    level._id_78BA["price"]["returnfire2"] = "hunted_pri_returnfire2";
    level._id_78BA["price"]["basementdooropen2"] = "hunted_pri_basementdooropen2";
    level._id_78BA["price"]["getinhouse"] = "hunted_pri_getinhouse";
    level._id_78BA["price"]["whatwaitingfor"] = "hunted_pri_whatwaitingfor";
    level._id_78BA["price"]["getinbasement"] = "hunted_pri_getinbasement";
    level._id_78BA["mark"]["contact6oclock"] = "hunted_uk2_contact6oclock";
    level._id_78BA["mark"]["imonit"] = "hunted_uk2_imonit";
    level._id_78BA["mark"]["doorsopen"] = "hunted_uk2_doorsopen";
    level._id_78BA["price"]["takepoint"] = "hunted_pri_takepoint";
    level._id_78BA["mark"]["warn_flashbang"] = "hunted_uk2_flashbang";
    level._id_78BA["charlie"]["tooquiet"] = "hunted_sas2_tooquiet";
    level._id_78BA["mark"]["regrouping"] = "hunted_uk2_regrouping";
    level._id_78BA["price"]["staysharp"] = "hunted_pri_staysharp";
    level._id_78BA["mark"]["helicoptersback"] = "hunted_uk2_helicoptersback";
    level._id_78BA["price"]["keepitthatway"] = "hunted_pri_keepitthatway";
    level._id_78BA["price"]["presson"] = "hunted_pri_presson";
    level._id_78BA["price"]["sentriesatbridge"] = "hunted_pri_sentriesatbridge";
    level._id_78BA["price"]["outofspotlight"] = "hunted_pri_outofspotlight";
    level._id_78BA["price"]["staylow"] = "hunted_pri_staylow";
    level._id_78BA["price"]["moveit"] = "hunted_pri_moveit";
    level._id_78BA["price"]["endoffield"] = "hunted_pri_endoffield";
    level._id_78BA["price"]["watchhelicopter"] = "hunted_pri_watchhelicopter";
    level._id_78BA["mark"]["hunted_uk2_werecompromised"] = "hunted_uk2_werecompromised";
    level._id_78BA["generic"]["hunted_ru2_bythecreek"] = "hunted_ru2_bythecreek";
    level._id_78BA["generic"]["hunted_ru1_inthefield"] = "hunted_ru1_inthefield";
    level._id_78BA["generic"]["hunted_ru4_outonfield"] = "hunted_ru4_outonfield";
    level._id_78BA["price"]["anotherpass"] = "hunted_pri_anotherpass";
    level._id_78BA["mark"]["missilesinbarn"] = "hunted_uk2_missilesinbarn";
    level._id_78BA["price"]["takeoutchopper"] = "hunted_pri_takeoutchopper";
    level._id_78BA["mark"]["hunted_uk2_poppingflares"] = "hunted_uk2_poppingflares";
    level._id_78BA["mark"]["hunted_uk2_fireagain"] = "hunted_uk2_fireagain";
    level._id_78BA["mark"]["niceshooting"] = "hunted_uk2_niceshooting";
    level._id_78BA["price"]["everyoneonme"] = "hunted_pri_everyoneonme";
    level._id_78BA["mark"]["bringingintanks"] = "hunted_uk2_bringingintanks";
    level._id_78BA["price"]["blockedpath"] = "hunted_pri_blockedpath";
    level._id_78B9["requestfire"] = "hunted_hqr_requestfire";
    level._id_78B9["usesomehelp"] = "hunted_acc_usesomehelp";
    level._id_78BA["price"]["100metres"] = "hunted_pri_100metres";
    level._id_78B9["comindown"] = "hunted_acc_comindown";
    level._id_78B9["getmovin"] = "hunted_acc_getmovin";
    level._id_78BA["price"]["comeonletsgo"] = "hunted_pri_comeonletsgo";
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78AC["player_flight_helicopter"]["flight_crash_player"] = %hunted_bh_crash_player;
    level._id_78B1["player_flight_helicopter"] = #animtree;
    level._id_78B5["player_flight_helicopter"] = "worldbody_h1_sas_woodland";
    level._id_78AC["opening_player_model"]["opening_player"] = %hunted_opening_player;
    level._id_78B1["opening_player_model"] = #animtree;
    level._id_78B5["opening_player_model"] = "worldbody_h1_sas_woodland";
}
#using_animtree("vehicles");

anim_blackhawk()
{
    level._id_78B1["blackhawk"] = #animtree;
    level._id_78AC["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}
#using_animtree("script_model");

scriptmodel_anims()
{
    if ( getdvarint( "use_old_door_openings" ) != 1 )
    {
        level._id_78AC["creekgate"]["open"] = %h1_hunted_open_grilldoor_door;
        level._id_78B1["creekgate"] = #animtree;
        level._id_78B5["creekgate"] = "h1_hunted_gatelatch";
        level._id_78AC["barndoor_01"]["open"] = %h1_hunted_open_barndoor_01_door;
        level._id_78B1["barndoor_01"] = #animtree;
        level._id_78B5["barndoor_01"] = "h1_me_armada_door_hq_entrance_ver1";
        level._id_78AC["barndoor_02"]["open"] = %h1_hunted_open_barndoor_02_door;
        level._id_78B1["barndoor_02"] = #animtree;
        level._id_78B5["barndoor_02"] = "h1_hunted_barndoor";
    }

    level._id_78AC["dogtags"]["hunted_dying"] = %h1_hunted_dogtags_pickup;
    level._id_78B1["dogtags"] = #animtree;
    level._id_78B5["dogtags"] = "h1_prop_dogtag";
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
#using_animtree("vehicles");

bm21_custom()
{
    level.bm21_custom["explosion"] = %vehicle_80s_sedan1_destroy;
}
