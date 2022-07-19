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
    setup_exploder_anims();
    exploder_script_model_anims();
}
#using_animtree("generic_human");

_id_0C7A()
{
    level._id_78BA["price"]["ambush_pri_notbad"] = "ambush_pri_notbad";
    level._id_78BA["price"]["ambush_pri_onmymark"] = "ambush_pri_onmymark";
    level._id_78BA["price"]["ambush_pri_takethemout"] = "ambush_pri_takethemout";
    level._id_78BA["price"]["ambush_pri_cleartower"] = "ambush_pri_cleartower";
    level._id_78BA["price"]["ambush_pri_movemove"] = "ambush_pri_movemove";
    level._id_78AC["price"]["tower_briefing"] = %ambush_tower_briefing_guy1;
    _id_A510::_id_080B( "price", "dialog", "tower_briefing", "ambush_pri_sortedout" );
    _id_A510::_id_080B( "price", "dialog", "tower_briefing", "ambush_pri_keepbusy" );
    _id_A510::_id_080B( "price", "dialog", "tower_briefing", "ambush_pri_muchtime" );
    level._id_78BA["price"]["ambush_pri_copythat"] = "ambush_pri_copythat";
    level._id_78BA["price"]["ambush_pri_youknow"] = "ambush_pri_youknow";
    level._id_78BA["price"]["ambush_pri_targetinjeep"] = "ambush_pri_targetinjeep";
    level._id_78BA["price"]["ambush_pri_thirdfront"] = "ambush_pri_thirdfront";
    level._id_78BA["price"]["ambush_pri_takealive"] = "ambush_pri_takealive";
    level._id_78BA["price"]["ambush_pri_standby"] = "ambush_pri_standby";
    level._id_78BA["price"]["ambush_pri_go"] = "ambush_pri_go";
    level._id_78BA["price"]["ambush_pri_nobodyfires"] = "ambush_pri_nobodyfires";
    level._id_78BA["price"]["ambush_pri_smokeem"] = "ambush_pri_smokeem";
    level._id_78BA["price"]["ambush_pri_goloud"] = "ambush_pri_goloud";
    level._id_78BA["price"]["ambush_pri_runforit"] = "ambush_pri_runforit";
    level._id_78BA["price"]["ambush_pri_chasehim"] = "ambush_pri_chasehim";
    level._id_78BA["price"]["ambush_pri_goafterhim"] = "ambush_pri_goafterhim";
    level._id_78AC["price"]["roof_idle"][0] = %ambush_price_idle;
    level._id_78AC["price"]["roof_move"] = %ambush_price_shout;
    level._id_78BA["price"]["ambush_pri_cantriskit"] = "ambush_pri_cantriskit";
    level._id_78BA["price"]["ambush_pri_restrainhim"] = "ambush_pri_restrainhim";
    level._id_78BA["price"]["ambush_pri_restrainnow"] = "ambush_pri_restrainnow";
    level._id_78BA["price"]["ambush_pri_sonisdead"] = "ambush_pri_sonisdead";
    level._id_78BA["price"]["ambush_pri_2isdead"] = "ambush_pri_2isdead";
    level._id_78BA["price"]["ambush_pri_knowtheman"] = "ambush_pri_knowtheman";
    level._id_78BA["steve"]["ambush_gaz_visualtarget"] = "ambush_gaz_visualtarget";
    level._id_78BA["steve"]["ambush_gaz_gotcompany"] = "ambush_gaz_gotcompany";
    level._id_78BA["steve"]["ambush_gaz_fivestory"] = "ambush_gaz_fivestory";
    level._id_78BA["steve"]["ambush_gaz_heavyfire"] = "ambush_gaz_heavyfire";
    level._id_78BA["steve"]["ambush_gaz_dropgun"] = "ambush_gaz_dropgun";
    level._id_78BA["steve"]["ambush_gaz_dropit"] = "ambush_gaz_dropit";
    level._id_78BA["steve"]["ambush_gaz_dropitnow"] = "ambush_gaz_dropitnow";
    level._id_78BA["steve"]["ambush_gaz_no"] = "ambush_gaz_no";
    level._id_78BA["steve"]["ambush_gaz_onlylead"] = "ambush_gaz_onlylead";
    level._id_78AC["steve"]["tower_briefing"] = %h1_ambush_tower_briefing_gaz;
    level._id_78AC["steve"]["ambush_gaz_tower_briefing"] = %h1_ambush_tower_briefing_gaz;
    level._id_78AC["mark"]["sprint"] = %sprint1_loop;
    level._id_78BA["mark"]["ambush_grg_areasecure"] = "ambush_grg_areasecure";
    level._id_78BA["mark"]["ambush_grg_blackrussian"] = "ambush_grg_blackrussian";
    level._id_78BA["mark"]["ambush_grg_likeaclown"] = "ambush_grg_likeaclown";
    level._id_78BA["mark"]["ambush_grg_nothinglikerussian"] = "ambush_grg_nothinglikerussian";
    level._id_78BA["mark"]["ambush_grg_friendliessixoclock"] = "ambush_grg_friendliessixoclock";
    level._id_78BA["mark"]["ambush_grg_inhisleg"] = "ambush_grg_inhisleg";
    level._id_78BA["mark"]["ambush_grg_catseriousissues"] = "ambush_grg_catseriousissues";
    level._id_78BA["mark"]["ambush_grg_easynow"] = "ambush_grg_easynow";
    level._id_78BA["mark"]["ambush_grg_kidissues"] = "ambush_grg_kidissues";
    level._id_78BA["mark"]["ambush_grg_hittower"] = "ambush_grg_hittower";
    level._id_78BA["mark"]["ambush_grg_ohno1"] = "ambush_grg_ohno1";
    level._id_78BA["mark"]["ambush_grg_ohno2"] = "ambush_grg_ohno2";
    level._id_78BA["mark"]["ambush_grg_downboy"] = "ambush_grg_downboy";
    level._id_78BA["mark"]["ambush_grg_soapgoalley"] = "ambush_grg_soapgoalley";
    level._id_78BA["mark"]["ambush_grg_thisway"] = "ambush_grg_thisway";
    level._id_78BA["mark"]["ambush_grg_movementroof"] = "ambush_grg_movementroof";
    level._id_78BA["mark"]["ambush_grg_bydumpster"] = "ambush_grg_bydumpster";
    level._id_78BA["mark"]["ambush_grg_acrosslot"] = "ambush_grg_acrosslot";
    level._id_78BA["mark"]["ambush_grg_gottahustle"] = "ambush_grg_gottahustle";
    level._id_78BA["mark"]["ambush_grg_gettingaway"] = "ambush_grg_gettingaway";
    level._id_78AC["mark"]["tower_briefing"] = %h1_ambush_tower_briefing_griggs;
    level._id_78AC["mark"]["ambush_grg_tower_talk"] = %h1_ambush_tower_griggs_talk;
    level._id_78AC["mark"]["ambush_grg_tower_idle1"] = %h1_ambush_tower_griggs_idle;
    level._id_78AC["mark"]["ambush_grg_tower_idle2"] = %h1_ambush_tower_griggs_idle2;
    level._id_78AC["mark"]["ambush_grg_tower_idle3"] = %h1_ambush_tower_griggs_idle3;
    level._id_78AC["mark"]["ambush_grg_tower_fall"] = %h1_ambush_tower_fall_griggs;
    level._id_78AC["mark"]["ambush_grg_tower_fall_stand"] = %h1_ambush_tower_fall_griggs_from_stand;
    level._id_78AC["mark"]["ambush_grg_tower_fall_crouch"] = %h1_ambush_tower_fall_griggs_from_crouch;

    if ( getdvarint( "use_old_griggs_tower" ) != 1 )
    {
        _id_A510::_id_080B( "mark", "dialog", "ambush_grg_tower_talk", "ambush_grg_likeaclown" );
        _id_A510::_id_080B( "mark", "dialog", "ambush_grg_tower_talk", "ambush_grg_nothinglikerussian" );
    }

    level._id_78AC["generic"]["tower_briefing"] = %ambush_tower_briefing_guy2;
    level._id_78B9["ambush_mhp_radiojammers"] = "ambush_mhp_radiojammers";
    level._id_78B9["ambush_mhp_enemyconvoy"] = "ambush_mhp_enemyconvoy";
    level._id_78B9["ambush_mhp_jmovesfast"] = "ambush_mhp_jmovesfast";
    level._id_78B9["ambush_mhp_junkyard"] = "ambush_mhp_junkyard";
    level._id_78B9["ambush_mhp_cityoutskirts"] = "ambush_mhp_cityoutskirts";
    level._id_78B9["ambush_mhp_hostileforces"] = "ambush_mhp_hostileforces";
    level._id_78B9["ambush_mhp_checkyourfire"] = "ambush_mhp_checkyourfire";
    level._id_78B9["ambush_mhp_watchfire"] = "ambush_mhp_watchfire";
    level._id_78B9["ambush_mhp_sidealley"] = "ambush_mhp_sidealley";
    level._id_78B9["ambush_mhp_cuthrualley"] = "ambush_mhp_cuthrualley";
    level._id_78B9["ambush_mhp_wrongway"] = "ambush_mhp_wrongway";
    level._id_78B9["ambush_mhp_passedalley"] = "ambush_mhp_passedalley";
    level._id_78B9["ambush_mhp_getaway"] = "ambush_mhp_getaway";
    level._id_78B9["ambush_mhp_betterhurry"] = "ambush_mhp_betterhurry";
    level._id_78B9["ambush_mhp_gonnalose"] = "ambush_mhp_gonnalose";
    level._id_78B9["ambush_mhp_guyshaulin"] = "ambush_mhp_guyshaulin";
    level._id_78B9["ambush_mhp_losthim_0"] = "ambush_mhp_losthim1";
    level._id_78B9["ambush_mhp_losthim_1"] = "ambush_mhp_losttarget";
    level._id_78B9["ambush_mhp_losthim_2"] = "ambush_mhp_losthim2";
    level._id_78B9["ambush_mhp_losthim_3"] = "ambush_mhp_abortmission";
    level._id_78B9["ambush_mhp_dumpster"] = "ambush_mhp_dumpster";
    level._id_78B9["ambush_mhp_greencar"] = "ambush_mhp_greencar";
    level._id_78B9["ambush_mhp_ironfence"] = "ambush_mhp_ironfence";
    level._id_78B9["ambush_mhp_rightflank"] = "ambush_mhp_rightflank";
    level._id_78B9["ambush_mhp_rooftops"] = "ambush_mhp_rooftops";
    level._id_78B9["ambush_mhp_topright"] = "ambush_mhp_topright";
    level._id_78B9["ambush_mhp_secondfloor"] = "ambush_mhp_secondfloor";
    level._id_78B9["ambush_mhp_overturneddump"] = "ambush_mhp_overturneddump";
    level._id_78B9["ambush_mhp_deadahead"] = "ambush_mhp_deadahead";
    level._id_78B9["ambush_mhp_alleyleft"] = "ambush_mhp_alleyleft";
    level._id_78B9["ambush_mhp_gotem"] = "ambush_mhp_gotem";
    level._id_78B9["ambush_mhp_goodkill"] = "ambush_mhp_goodkill";
    level._id_78B9["ambush_mhp_niceone"] = "ambush_mhp_niceone";
    level._id_78B9["ambush_mhp_allclear"] = "ambush_mhp_allclear";
    level._id_78B9["ambush_mhp_fivestory"] = "ambush_mhp_fivestory";
    level._id_78B9["ambush_mhp_visual"] = "ambush_mhp_visual";
    level._id_78B9["ambush_mhp_firstonefree"] = "ambush_mhp_firstonefree";
    level._id_78B9["ambush_mhp_northeast"] = "ambush_mhp_northeast";
    level._id_78B9["ambush_mhp_staircase"] = "ambush_mhp_staircase";
    level._id_78B9["ambush_mhp_deeperinto"] = "ambush_mhp_deeperinto";
    level._id_78B9["ambush_mhp_holdon"] = "ambush_mhp_holdon";
    level._id_78B9["ambush_mhp_goodtogo"] = "ambush_mhp_goodtogo";
    level._id_78B9["ambush_mhp_movementroof"] = "ambush_mhp_movementroof";
    level._id_78B9["ambush_mhp_onroof"] = "ambush_mhp_onroof";
    level._id_78BA["kamarov"]["ambush_kmr_bestwayin"] = "ambush_kmr_bestwayin";
    level._id_78BA["loyalist"]["ambush_ru2_papersplease"] = "ambush_ru2_papersplease";
    level._id_78BA["loyalist"]["ambush_ru2_illdothatrightnow"] = "ambush_ru2_illdothatrightnow";
    level._id_78BA["russian"]["ambush_ru1_paperswhatpapers"] = "ambush_ru1_paperswhatpapers";
    level._id_78BA["russian"]["ambush_ru1_fatpolitician"] = "ambush_ru1_fatpolitician";
    level._id_78BA["russian"]["ambush_ru1_whatareyouwaitingfor"] = "ambush_ru1_whatareyouwaitingfor";
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
    level._id_78AC["generic"]["sprint"] = %sprint1_loop;
    level._id_78AC["generic"]["death_pose_0"] = %death_sitting_pose_v1;
    level._id_78AC["generic"]["death_pose_1"] = %death_sitting_pose_v2;
    level._id_78AC["generic"]["det_school_enter_pt2_npc_deadbody_01"] = %det_school_enter_pt2_npc_deadbody_01;
    level._id_78AC["generic"]["det_school_enter_pt2_npc_deadbody_08"] = %det_school_enter_pt2_npc_deadbody_08;
    level._id_78AC["badguy"]["jump"] = %ambush_vip_son_jump;
    level._id_78AC["badguy"]["quick_jump"] = %ambush_vip_son_quickdeath;
    _id_A510::_id_080B( "badguy", "dialog", "jump", "ambush_soz_deadsoonanyway" );
    _id_6A5B();
    level._id_78AC["badguy"]["h1_climb_up"] = %h1_ambush_zakhaev_son_jump_pt1;
    level._id_78AC["badguy"]["h1_up_idle"][0] = %h1_ambush_zakhaev_son_idle;
    level._id_78AC["badguy"]["h1_quickdeath_up"] = %h1_ambush_zakhaev_son_quickdeath_up;
    level._id_78AC["badguy"]["h1_climb_back_down_die"] = %h1_ambush_zakhaev_son_jump_pt2;
    _id_A510::_id_080B( "badguy", "dialog", "h1_climb_back_down_die", "ambush_soz_deadsoonanyway" );
    level._id_78AC["badguy"]["h1_quickdeath_down"] = %h1_ambush_zakhaev_son_quickdeath_down;
    bmp_anims();
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78B1["player_rig"] = #animtree;
    level._id_78B5["player_rig"] = "worldbody_h1_spetsnaz";
    level._id_78AC["player_rig"]["ambush_plr_tower_fall"] = %h1_ambush_tower_fall_player;
    level._id_78AC["player_rig"]["vip_escape_player"] = %ambush_vip_escape_player;
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
    level._id_78AC["exploder_script_model"]["h1_ambush_apartment_01_anim"] = %h1_ambush_apartment_01_anim;
}
#using_animtree("vehicles");

bmp_anims()
{
    level._id_78B1["bmp"] = #animtree;
    level._id_78AC["bmp"]["stopping"] = %bmp_stopping;
}
