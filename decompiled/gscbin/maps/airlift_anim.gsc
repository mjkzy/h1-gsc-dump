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
    setup_exploder_anims();
}
#using_animtree("generic_human");

_id_0C7A()
{
    level._id_78AC["frnd"]["spin"] = %combatwalk_f_spin;
    level._id_78AC["drone"]["pilot_idle"][0] = %helicopter_pilot1_idle;
    level._id_78AC["drone"]["pilot_idle"][1] = %helicopter_pilot1_twitch_clickpannel;
    level._id_78AC["drone"]["pilot_idle"][2] = %helicopter_pilot1_twitch_lookback;
    level._id_78AC["drone"]["pilot_idle"][3] = %helicopter_pilot1_twitch_lookoutside;
    level._id_78AC["drone"]["copilot_idle"][0] = %helicopter_pilot2_idle;
    level._id_78AC["drone"]["copilot_idle"][1] = %helicopter_pilot2_twitch_clickpannel;
    level._id_78AC["drone"]["copilot_idle"][2] = %helicopter_pilot2_twitch_radio;
    level._id_78AC["drone"]["copilot_idle"][3] = %helicopter_pilot2_twitch_lookoutside;
    level._id_78AC["generic"]["ch46_load_1"] = %ch46_load_1;
    level._id_78AC["generic"]["ch46_load_2"] = %ch46_load_2;
    level._id_78AC["generic"]["ch46_load_3"] = %ch46_load_3;
    level._id_78AC["generic"]["ch46_load_4"] = %ch46_load_4;
    level._id_78AC["generic"]["ch46_unload_1_generic"] = %ch46_unload_1;
    level._id_78AC["generic"]["ch46_unload_2_generic"] = %ch46_unload_2;
    level._id_78AC["generic"]["ch46_unload_3_generic"] = %ch46_unload_3;
    level._id_78AC["generic"]["ch46_unload_4_generic"] = %ch46_unload_4;
    level._id_78AC["generic"]["ch46_unload_1_smoketown"] = %ch46_unload_1;
    level._id_78AC["generic"]["ch46_unload_2_smoketown"] = %ch46_unload_2;
    level._id_78AC["generic"]["ch46_unload_3_smoketown"] = %ch46_unload_3;
    level._id_78AC["generic"]["ch46_unload_4_smoketown"] = %ch46_unload_4;
    level._id_78AC["generic"]["ch46_unload_1_cobrastreets"] = %h1_airlift_landing_scene2_npc1;
    level._id_78AC["generic"]["ch46_unload_2_cobrastreets"] = %h1_airlift_landing_scene2_npc2;
    level._id_78AC["generic"]["ch46_unload_3_cobrastreets"] = %h1_airlift_landing_scene2_npc3;
    level._id_78AC["generic"]["ch46_unload_4_cobrastreets"] = %h1_airlift_landing_scene2_npc4;
    level._id_78AC["generic"]["ch46_unload_idle"][0] = %exposed_crouch_idle_alert_v1;
    level._id_78AC["frnd"]["AT4_fire_start"] = %launchfacility_a_at4_fire;
    level._id_78AC["frnd"]["AT4_fire"] = %launchfacility_a_at4_fire;
    level._id_78AC["frnd"]["AT4_idle"][0] = %corner_standr_alert_idle;
    level._id_78AC["frnd"]["RPG_conceal_idle_start"] = %rpg_conceal_idle;
    level._id_78AC["frnd"]["RPG_conceal_idle"][0] = %rpg_conceal_idle;
    level._id_78AC["frnd"]["RPG_conceal_2_standR"] = %rpg_conceal_2_standr;
    level._id_78AC["frnd"]["RPG_stand_idle"][0] = %rpg_stand_idle;
    level._id_78AC["frnd"]["RPG_stand_fire"] = %rpg_stand_fire;
    level._id_78AC["frnd"]["RPG_standR_2_conceal"] = %rpg_standr_2_conceal;
    level._id_78AC["frnd"]["AT4_fire_short_start"] = %launchfacility_a_at4_short;
    level._id_78AC["frnd"]["AT4_fire_short"] = %launchfacility_a_at4_short;
    level._id_78AC["frnd"]["AT4_idle_short"][0] = %corner_standr_alert_idle;
    level._id_78AC["frnd"]["crewchief_idle"][0] = %airlift_crewchief_idle;
    level._id_78AC["frnd"]["crewchief_getin"][0] = %airlift_crewchief_getin;
    level._id_78AC["frnd"]["crewchief_getin_lookback"][0] = %airlift_crewchief_getin_lookback;
    level._id_78AC["frnd"]["crewchief_getin_quick"][0] = %airlift_crewchief_getin_quick;
    level._id_78AC["frnd"]["crewchief_gun_idle"][0] = %airlift_crewchief_gun_idle;
    level._id_78AC["frnd"]["crewchief_gun_shoot"][0] = %airlift_crewchief_gun_shoot;
    level._id_78AC["frnd"]["crewchief_gun_getin"][0] = %airlift_crewchief_gun_getin;
    level._id_78AC["frnd"]["crewchief_sucked_out"] = %airlift_crewchief_sucked_out;
    maps\_anim::_id_0805( "frnd", "crewchief_sucked_out", "foley_pilot_sucked_out", "scn_airlift_nuke_pilot_foley" );
    maps\_anim::_id_0810( "frnd", "foley_pilot_slipping_from_hand", "crewchief_sucked_out", "scn_airlift_nuke_plr_foley" );
    level._id_78AC["frnd"]["crewchief_getout_generic"][0] = %airlift_crewchief_getout;
    level._id_78AC["frnd"]["crewchief_getout_cobrastreets"][0] = %h1_airlift_landing_scene2_crewchief;
    level._id_78AC["frnd"]["crewchief_getout_smoketown"][0] = %airlift_crewchief_getout;
    level._id_78AC["frnd"]["airlift_crewchief_stepout"] = %airlift_crewchief_stepout;
    level._id_78AC["frnd"]["airlift_crewchief_stepout_fire"] = %airlift_crewchief_stepout_fire;
    level._id_78AC["frnd"]["airlift_crewchief_stepout_fire_2_idle"] = %airlift_crewchief_stepout_fire_2_idle;
    level._id_78AC["frnd"]["airlift_crewchief_stepout_idle"][0] = %airlift_crewchief_stepout_idle;
    level._id_78AC["frnd"]["wounded_pullout"] = %airlift_pilot_getout;
    level._id_78AC["frnd"]["wounded_cockpit_shoot"][0] = %airlift_pilot_shooting;
    level._id_78AC["frnd"]["wounded_cockpit_wave_over"] = %airlift_pilot_seeyou;
    level._id_78AC["frnd"]["wounded_cockpit_idle"][0] = %airlift_pilot_idle;
    level._id_78AC["frnd"]["wounded_putdown"] = %airlift_pilot_putdown;
    level._id_78AC["frnd"]["carry_run"] = [ %h1_airlift_pilot_carry_run ];
    level._id_78AC["frnd"]["carry_idle"] = [ %h1_airlift_pilot_carry_idle ];
    level._id_78B1["frnd"] = #animtree;
    level._id_78B5["frnd"] = "body_sp_cobra_pilot_desert_velinda_burned";
    level._id_78AC["frnd"]["wounded_pullout_facial"] = %airlift_pilot_facial_getout;
    level._id_78AC["frnd"]["wounded_cockpit_shoot_facial"] = %airlift_pilot_facial_shooting;
    level._id_78AC["frnd"]["wounded_cockpit_wave_over_facial"] = %airlift_pilot_facial_seeyou;
    level._id_78AC["frnd"]["wounded_cockpit_idle_facial"] = %airlift_pilot_facial_idle;
    level._id_78AC["frnd"]["wounded_putdown_facial"] = %airlift_pilot_facial_putdown;
    level._id_78AC["frnd"]["deadpilot_idle"][0] = %airlift_copilot_dead;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

_id_29F3()
{
    level._id_78B9["airlift_mhp_information"] = "airlift_mhp_information";
    level._id_78B9["airlift_hqr_allcallsigns"] = "airlift_hqr_allcallsigns";
    level._id_78B9["airlift_fhp_bigtargets"] = "airlift_fhp_bigtargets";
    level._id_78B9["airlift_mhp_takingfire"] = "airlift_mhp_takingfire";
    level._id_78B9["airlift_mhp_rpgrooftops"] = "airlift_mhp_rpgrooftops";
    level._id_78B9["airlift_mhp_hostilesrpgs"] = "airlift_mhp_hostilesrpgs";
    level._id_78B9["airlift_mhp_groundinfantry"] = "airlift_mhp_groundinfantry";
    level._id_78B9["airlift_mhp_wevegotrpgs"] = "airlift_mhp_wevegotrpgs";
    level._id_78B9["airlift_mhp_lightarmor"] = "airlift_mhp_lightarmor";
    level._id_78B9["airlift_mhp_antiairrooftop"] = "airlift_mhp_antiairrooftop";
    level._id_78B9["airlift_mhp_antiairground"] = "airlift_mhp_antiairground";
    level._id_78B9["airlift_mhp_makingarun"] = "airlift_mhp_makingarun";
    level._id_78B9["airlift_hqr_getabramsfront"] = "airlift_hqr_getabramsfront";
    level._id_78BA["airlift_hcc_downramp"] = "airlift_hcc_downramp";
    level._id_78B9["airlift_hqr_2clickswest"] = "airlift_hqr_2clickswest";
    level._id_78B9["airlift_hqr_enroute"] = "airlift_hqr_enroute";
    level._id_78B9["airlift_fhp_refitandrefuel"] = "airlift_fhp_refitandrefuel";
    level._id_78B9["airlift_hqr_bluesmoke"] = "airlift_hqr_bluesmoke";
    level._id_78B9["airlift_mhp_havevisual"] = "airlift_mhp_havevisual";
    level._id_78BA["frnd"]["airlift_hcc_letsgo"] = "airlift_hcc_letsgo";
    level._id_78B9["airlift_vsq_forwardrecon"] = "airlift_vsq_forwardrecon";
    level._id_78B9["airlift_vsq_desevresaticket"] = "airlift_vsq_desevresaticket";
    level._id_78B9["airlift_vsq_escortback"] = "airlift_vsq_escortback";
    level._id_78B9["airlift_vsq_watchcoloredsmoke"] = "airlift_vsq_watchcoloredsmoke";
    level._id_78B9["airlift_vsq_greensmoke"] = "airlift_vsq_greensmoke";
    level._id_78BA["frnd"]["airlift_gm1_firebalcony"] = "airlift_gm1_firebalcony";
    level._id_78B9["airlift_mhp_lztoohot"] = "airlift_mhp_lztoohot";
    level._id_78B9["airlift_gm1_holdyourfire"] = "airlift_gm1_holdyourfire";
    level._id_78BA["frnd"]["airlift_gm2_firebalcony"] = "airlift_gm2_firebalcony";
    level._id_78BA["frnd"]["airlift_gm3_reinforcements"] = "airlift_gm3_reinforcements";
    level._id_78BA["frnd"]["airlift_gm4_reinforcements"] = "airlift_gm4_reinforcements";
    level._id_78B9["airlift_vsq_moveout"] = "airlift_vsq_moveout";
    level._id_78BA["frnd"]["airlift_vsq_wereit"] = "airlift_vsq_wereit";
    level._id_78B9["airlift_fhp_missme"] = "airlift_fhp_missme";
    level._id_78BA["frnd"]["airlift_gm3_hellyeah"] = "airlift_gm3_hellyeah";
    level._id_78BA["frnd"]["airlift_vsq_letsgo"] = "airlift_vsq_letsgo";
    level._id_78B9["airlift_vsq_gettolz"] = "airlift_vsq_gettolz";
    level._id_78B9["airlift_vsq_gettolz2"] = "airlift_vsq_gettolz2";
    level._id_78BA["frnd"]["airlift_hcc_wheelsup"] = "airlift_hcc_wheelsup";
    level._id_78BA["frnd"]["airlift_hcc_backonmark19"] = "airlift_hcc_backonmark19";
    level._id_78B9["airlift_gm4_hellyeah"] = "airlift_gm4_hellyeah";
    level._id_78B9["airlift_hqr_situation"] = "airlift_hqr_situation";
    level._id_78B9["airlift_mhp_goahead"] = "airlift_mhp_goahead";
    level._id_78B9["airlift_hqr_nestteams"] = "airlift_hqr_nestteams";
    level._id_78B9["airlift_hqr_nestteams"] = "airlift_hqr_nestteams";
    level._id_78B9["airlift_mhp_safedistance"] = "airlift_mhp_safedistance";
    level._id_78B9["airlift_mhp_safedistance"] = "airlift_mhp_safedistance";
    level._id_78B9["airlift_hqr_outtathere"] = "airlift_hqr_outtathere";
    level._id_78B9["airlift_hqr_outtathere"] = "airlift_hqr_outtathere";
    level._id_78B9["airlift_mhp_leadtheway"] = "airlift_mhp_leadtheway";
    level._id_78B9["airlift_mhp_leadtheway"] = "airlift_mhp_leadtheway";
    level._id_78B9["airlift_fhp_getoutta"] = "airlift_fhp_getoutta";
    level._id_78B9["airlift_fhp_werehit"] = "airlift_fhp_werehit";
    level._id_78B9["airlift_fhp_mayday"] = "airlift_fhp_mayday";
    level._id_78B9["airlift_fhp_goingdown"] = "airlift_fhp_goingdown";
    level._id_78B9["airlift_fhp_hangon"] = "airlift_fhp_hangon";
    level._id_78B9["airlift_fhp_hangon"] = "airlift_fhp_hangon";
    level._id_78B9["airlift_mhp_cobradown"] = "airlift_mhp_cobradown";
    level._id_78B9["airlift_mhp_doyoucopy"] = "airlift_mhp_doyoucopy";
    level._id_78B9["airlift_mhp_comein"] = "airlift_mhp_comein";
    level._id_78B9["airlift_mhp_smallarmsfire"] = "airlift_mhp_smallarmsfire";
    level._id_78B9["airlift_hqr_notsafe"] = "airlift_hqr_notsafe";
    level._id_78B9["airlift_mhp_weknow"] = "airlift_mhp_weknow";
    level._id_78B9["airlift_hqr_youcall"] = "airlift_hqr_youcall";
    level._id_78B9["airlift_mhp_youstatus"] = "airlift_mhp_youstatus";
    level._id_78B9["airlift_fhp_usesomehelp"] = "airlift_fhp_usesomehelp";
    level._id_78B9["airlift_mhp_werecoming"] = "airlift_mhp_werecoming";
    level._id_78B9["airlift_hqr_hostilesadvancing"] = "airlift_hqr_hostilesadvancing";
    level._id_78B9["airlift_vsq_90sec"] = "airlift_vsq_90sec";
    level._id_78B9["airlift_hqr_willbeoverrun"] = "airlift_hqr_willbeoverrun";
    level._id_78B9["airlift_vsq_crashsite"] = "airlift_vsq_crashsite";
    level._id_78BA["frnd"]["airlift_vsq_pullherout"] = "airlift_vsq_pullherout";
    level._id_78BA["frnd"]["airlift_vsq_getherout"] = "airlift_vsq_getherout";
    level._id_78BA["frnd"]["airlift_gm2_getpilot"] = "airlift_gm2_getpilot";
    level._id_78BA["frnd"]["airlift_gm2_outofhelo"] = "airlift_gm2_outofhelo";
    level._id_78BA["frnd"]["airlift_gm2_holdemoff"] = "airlift_gm2_holdemoff";
    level._id_78BA["frnd"]["airlift_gm2_coveryou"] = "airlift_gm2_coveryou";
    level._id_78B9["airlift_vsq_getpilot"] = "airlift_vsq_getpilot";
    level._id_78B9["airlift_vsq_outtacockpit"] = "airlift_vsq_outtacockpit";
    level._id_78B9["airlift_vsq_backtoseaknight"] = "airlift_vsq_backtoseaknight";
    level._id_78BA["frnd"]["airlift_vsq_holddown"] = "airlift_vsq_holddown";
    level._id_78BA["frnd"]["airlift_vsq_scuttlecobra"] = "airlift_vsq_scuttlecobra";
    level._id_78B9["airlift_vsq_gogo"] = "airlift_vsq_gogo";
    level._id_78B9["airlift_mhp_goodtime"] = "airlift_mhp_goodtime";
    level._id_78B9["airlift_vsq_onourway"] = "airlift_vsq_onourway";
    level._id_78B9["airlift_hqr_nuclearthreat"] = "airlift_hqr_nuclearthreat";
    level._id_78B9["airlift_mhp_inforchop"] = "airlift_mhp_inforchop";
    level._id_78B9["airlift_cop_rogerthat"] = "airlift_cop_rogerthat";
    level._id_78B9["airlift_hqr_confirmed"] = "airlift_hqr_confirmed";
    level._id_78B9["airlift_vsq_hangon"] = "airlift_vsq_hangon";
    level._id_78BA["airlift_fhp_pains"] = "airlift_fhp_pains";
    _id_6A5B();
    tank_crush_anims();
    seaknight_anims();
    statue_anims();
    animated_palm_trees_setup();
    statue_shattering_anim();
    crane_anims();
    scaffold_collapse_anims();
    bmp_airlift_anims();
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78AC["player_carry"]["wounded_pullout"] = %airlift_player_getout;
    level._id_78AC["player_carry"]["wounded_putdown"] = %airlift_player_putdown;
    level._id_78AC["player_carry"]["carry_idle"] = [ %h1_airlift_player_carry_idle ];
    level._id_78AC["player_carry"]["carry_run"] = [ %h1_airlift_player_carry_run ];
    maps\_anim::_id_0805( "player_carry", "carry_run", "drag_step_right", "airlift_plr_footstep_dragR" );
    maps\_anim::_id_0805( "player_carry", "carry_run", "drag_step_left", "airlift_plr_footstep_dragL" );
    level._id_78B1["player_carry"] = #animtree;
    level._id_78B5["player_carry"] = "viewhands_player_usmc";
    level._id_78B1["player_viewbody"] = #animtree;
    level._id_78B5["player_viewbody"] = "worldbody_h1_usmc_desert";
    level._id_78AC["player_viewbody"]["player_nuke_crash"] = %h1_airlift_crash_player;
    level._id_78B1["player_viewhands"] = #animtree;
    level._id_78B5["player_viewhands"] = "viewhands_player_usmc";
    level._id_78AC["player_viewhands"]["turret_intro_anim"] = %h1_airlift_intro_player;
    level._id_78AC["player_viewhands"]["turret_idle_anim"] = [ %h1_ch46_turret_player_idle ];
    level._id_78AC["player_viewhands"]["turret_fire_anim"] = %h1_ch46_turret_player_fire;
}
#using_animtree("vehicles");

tank_crush_anims()
{
    level._id_78B1["tank_crush"] = #animtree;
    level._id_78AC["sedan"]["tank_crush"] = %sedan_tankcrush_side;
    level._id_78AC["tank"]["tank_crush"] = %tank_tankcrush_side;
    level._id_78BA["tank_crush"] = "airlift_tank_crush_car";
}

bmp_airlift_anims()
{
    level._id_78B1["bmp"] = #animtree;
    level._id_78AC["bmp"]["stopping"] = %bmp_stopping;
}

seaknight_anims()
{
    level._id_78AC["seaknight"]["idle"][0] = %sniper_escape_ch46_idle;
    level._id_78AC["seaknight"]["landing"] = %sniper_escape_ch46_land;
    level._id_78AC["seaknight"]["take_off"] = %sniper_escape_ch46_take_off;
    level._id_78AC["seaknight"]["rotors"] = %sniper_escape_ch46_rotors;
    level._id_78AC["seaknight"]["turret_settle_anim"] = %ch46_turret_idle;
    level._id_78AC["seaknight"]["turret_fire_anim"] = %ch46_turret_fire;
    level._id_78AC["seaknight"]["doors_open"] = %ch46_doors_open;
    level._id_78AC["seaknight"]["turret_intro_anim"] = %h1_airlift_intro_turret;
    level._id_78AC["seaknight"]["h1_ch46r_liftoff"] = %h1_ch46r_liftoff;
    level._id_78B1["seaknight"] = #animtree;
    level._id_78AC["wingman"]["h1_cobra_crash"] = %h1_cobra_crash;
    level._id_78B1["wingman"] = #animtree;
}

seaknight_turret_anim_init()
{
    self useanimtree( #animtree );
    self _meth_814d( %ch46_doors_close );
}

seaknight_turret_anim_idle()
{
    self useanimtree( #animtree );
    self _meth_814d( %ch46_turret_idle );
}

seaknight_turret_anim()
{
    self endon( "death" );
    self endon( "turret_fire" );
    self useanimtree( #animtree );
    self _meth_8147( %ch46_turret_fire, 1, 0, 1 );
}

seaknight_turret_anim_intro()
{
    self endon( "death" );
    self useanimtree( #animtree );
    self _meth_814d( %h1_airlift_intro_turret );
}

seaknight_open_doors()
{
    self useanimtree( #animtree );
    self playsound( "seaknight_door_open" );
    self _meth_8147( %ch46_doors_open, 1, 0, 1 );
}

seaknight_close_doors()
{
    self useanimtree( #animtree );
    self playsound( "seaknight_door_close" );
    self _meth_8147( %ch46_doors_close, 1, 0, 1 );
}
#using_animtree("animated_props");

statue_anims()
{
    level._id_78B1["statue"] = #animtree;
    level._id_78AC["statue"]["statue_collapse"] = %me_statue_destroy_base_01;
}

animated_palm_trees_setup()
{
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["heli"] = %palmtree_tall2_sway;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["still"] = %h1_foliage_backlot_palm_tree_heliwash_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["strong"] = %h1_foliage_backlot_palm_tree_heliwash_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["heli"] = %h1_foliage_backlot_palm_tree_heliwash_wash;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
}
#using_animtree("script_model");

statue_shattering_anim()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_statue_shattering_anim"] = %h1_statue_shattering_anim;
}
#using_animtree("animated_props");

crane_anims()
{
    level._id_78B1["crane"] = #animtree;
    level._id_78AC["crane"]["crane_idle"][0] = %h1_dam_chinese_crane_idle;
    level._id_78AC["crane"]["crane_fall"] = %h1_dam_chinese_crane_fall;
}
#using_animtree("script_model");

scaffold_collapse_anims()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_airlift_scaffold_red_05_dest_anim"] = %h1_airlift_scaffold_red_05_dest_anim;
    level._id_78AC["exploder_script_model"]["h1_airlift_scaffold_red_04_dest_anim"] = %h1_airlift_scaffold_red_04_dest_anim;
    level._id_78AC["exploder_script_model"]["h1_airlift_scaffold_red_03_dest_anim"] = %h1_airlift_scaffold_red_03_dest_anim;
    level._id_78AC["exploder_script_model"]["h1_airlift_scaffold_red_02_dest_anim"] = %h1_airlift_scaffold_red_02_dest_anim;
    level._id_78AC["exploder_script_model"]["h1_airlift_scaffold_red_01_dest_anim"] = %h1_airlift_scaffold_red_01_dest_anim;
}
