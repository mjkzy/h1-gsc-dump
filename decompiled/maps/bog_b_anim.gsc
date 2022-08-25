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
    animated_model_setup();
    setup_exploder_anims();
    exploder_script_model_anims();
    level._id_78AC["dumpsterGuy"]["dumpster_idle1"][0] = %bog_b_dumpster_guy1_idle;
    level._id_78AC["dumpsterGuy"]["dumpster_peek"] = %bog_b_dumpster_guy1_peek;
    level._id_78AC["dumpsterGuy"]["dumpster_idle2_reach"] = %bog_b_dumpster_guy1_push_idle;
    level._id_78AC["dumpsterGuy"]["dumpster_idle2"][0] = %bog_b_dumpster_guy1_push_idle;
    level._id_78AC["dumpsterGuy"]["dumpster_push"] = %bog_b_dumpster_guy1_push;
    level._id_78AC["price"]["dumpster_push"] = %bog_b_dumpster_guy2_push;
    level._id_78B3["price"]["dumpster_push"] = 0.25;
    level._id_78AC["alley_door_kicker_left"]["idle"][0] = %breach_kick_stackl1_idle;
    level._id_78AC["alley_door_kicker_left"]["idle_reach"] = %breach_kick_stackl1_idle;
    level._id_78AC["alley_door_kicker_left"]["enter"] = %breach_kick_stackl1_enter;
    level._id_78AC["alley_door_kicker_right"]["enter"] = %breach_kick_kickerr1_enter;
    level._id_78BA["alley_door_kicker_right"]["enter"] = "bog_gm1_breaching";
    maps\_anim::addnotetrack_customfunction( "alley_door_kicker_right", "kick", maps\bog_b::alley_dooropen );
    level._id_78AC["price"]["alley_breach"] = %h1_bog_b_vasquez_door_breach_vasquez;
    maps\_anim::addnotetrack_customfunction( "price", "door_kick", maps\bog_b::alley_dooropen, "alley_breach" );
    level._id_78AC["alley_breach_buddy"]["alley_breach"] = %h1_bog_b_vasquez_door_breach_soldier;
    level._id_78BA["alley_breach_buddy"]["alley_breach"] = "bog_gm1_breaching";
    level._id_78AC["guard"]["stop"] = %bog_b_guard_stop;
    level._id_78BA["guard"]["stop_snd"] = "bog_gm4_holdhere";
    level._id_78AC["guard"]["react"] = %bog_b_guard_react;
    level._id_78AC["guard"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["gm1"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["gm2"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["gm3"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["gm4"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["gm5"]["celebrate"] = %hunted_celebrate;
    level._id_78AC["price"]["casual_2_spot"] = %bog_b_spotter_casual_2_spot;
    level._id_78AC["price"]["spot_2_casual"] = %bog_b_spotter_spot_2_casual;
    level._id_78AC["price"]["spot"][0] = %bog_b_spotter_spot_idle;
    level._id_78AC["price"]["spot"][1] = %bog_b_spotter_spot_twitch;
    level._id_78AC["price"]["react"] = %bog_b_spotter_react;
    level._id_78AC["casualcrouch"]["react"] = %bog_b_casualcrouch_react;
    level._id_78AC["price"]["new_react"] = %h1_bog_b_cheers_vasquez_react;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "new_react", "bog_pri_niceshootingpig" );
    maps\_anim::addnotetrack_customfunction( "price", "radio", maps\bog_b::docomingthroughaudio, "new_react" );
    level._id_78AC["guard"]["new_react"] = %h1_bog_b_cheers_soldier_left;
    maps\_anim::addnotetrack_dialogue( "guard", "dialog", "new_react", "bog_gm1_wooyeah" );
    level._id_78AC["casualcrouch"]["new_react"] = %h1_bog_b_cheers_soldier_right;
    maps\_anim::addnotetrack_dialogue( "casualcrouch", "dialog", "new_react", "bog_gm4_talkinabout" );

    if ( !isdefined( level._id_78B1 ) )
        level._id_78B1 = [];

    dumpster_anims();
    tank_crush_anims();
    tank_explode_anims();
    _id_29E7();
}
#using_animtree("script_model");

dumpster_anims()
{
    level._id_78B1["dumpster"] = #animtree;
    level._id_78AC["dumpster"]["dumpster_idle1"][0] = %bog_b_dumpster_guy1_idle_dumpster;
    level._id_78AC["dumpster"]["dumpster_peek"] = %bog_b_dumpster_guy1_peek_dumpster;
    level._id_78AC["dumpster"]["dumpster_idle2"][0] = %bog_b_dumpster_guy1_push_idle_dumpster;
    level._id_78AC["dumpster"]["dumpster_push"] = %bog_b_dumpster_guy1_push_dumpster;
}
#using_animtree("vehicles");

tank_crush_anims()
{
    level._id_78B1["tank_crush"] = #animtree;
    level._id_78AC["truck"]["tank_crush"] = %pickup_tankcrush_front;
    level._id_78AC["tank"]["tank_crush"] = %tank_tankcrush_front;
    level._id_78BA["tank_crush"] = "bog_tank_crush_truck";
    level._id_78B1["tank_crush2"] = #animtree;
    level._id_78AC["truck"]["tank_crush2"] = %pickup_tankcrush_front;
    level._id_78AC["tank"]["tank_crush2"] = %tank_tankcrush_front;
    level._id_78BA["tank_crush2"] = "bog_tank_crush_truck2";
}

tank_explode_anims()
{
    level._id_78B1["tank_explosion"] = #animtree;

    if ( getdvarint( "use_old_explosion" ) == 1 )
    {
        level._id_78AC["tank"]["explosion1"] = %bog_b_tank_explosion;
        level._id_78AC["tank"]["explosion2"] = %bog_b_tank_explosion2;
    }
    else
    {
        level._id_78AC["tank"]["explosion1"] = %bog_b_tank_new_explosion;
        level._id_78AC["tank"]["explosion2"] = %bog_b_tank_new_explosion2;
    }
}

_id_29E7()
{
    level._id_78BA["marine1"]["getyourass"] = "bog_gm1_getyourass";
    level._id_78BA["marine1"]["rightflank"] = "bog_gm1_rightflank";
    level._id_78BA["marine2"]["enemyair"] = "bog_gm2_enemyair";
    level._id_78BA["tank_commander"]["wereclear"] = "bog_tcm_wereclear";
    level._id_78BA["tank_commander"]["possibleambush"] = "bog_tcm_possibleambush";
    level._id_78BA["tank_commander"]["standclear"] = "bog_tcm_standclear";
    level._id_78BA["tank_commander"]["cleartoadvance"] = "bog_tcm_cleartoadvance";
    level._id_78BA["tank_commander"]["rogermoving"] = "bog_tcm_rogermoving";
    level._id_78BA["tank_commander"]["movingup"] = "bog_tcm_movingup";
    level._id_78BA["tank_commander"]["3story11_2ndfloor"] = "bog_tcm_3story11_2ndfloor";
    level._id_78BA["tank_commander"]["3story1130_2ndfloor"] = "bog_tcm_3story1130_2ndfloor";
    level._id_78BA["tank_commander"]["2story1_ground"] = "bog_tcm_2story1_ground";
    level._id_78BA["tank_commander"]["2story1_2ndfloor"] = "bog_tcm_2story1_2ndfloor";
    level._id_78BA["tank_commander"]["3story1230_2ndfloor"] = "bog_tcm_3story1230_2ndfloor";
    level._id_78BA["tank_commander"]["fire"] = "bog_tcm_fire1";
    level._id_78BA["tank_commander"]["switchmanual"] = "bog_tcm_switchmanual";
    level._id_78BA["tank_commander"]["takeshot"] = "bog_tcm_takeshot";
    level._id_78BA["tank_loader"]["up1"] = "bog_tld_up1";
    level._id_78BA["tank_loader"]["up2"] = "bog_tld_up2";
    level._id_78BA["tank_loader"]["up3"] = "bog_tld_up3";
    level._id_78BA["tank_loader"]["up4"] = "bog_tld_up4";
    level._id_78BA["tank_gunner"]["targetacquired1"] = "bog_tgn_targetacquired1";
    level._id_78BA["tank_gunner"]["targetacquired2"] = "bog_tgn_targetacquired2";
    level._id_78BA["tank_gunner"]["targetacquired3"] = "bog_tgn_targetacquired3";
    level._id_78BA["price"]["grabrpg"] = "bog_pri_grabrpg";
    level._id_78BA["price"]["watchrooftops"] = "bog_pri_watchrooftops";
    level._id_78BA["price"]["rogermoveup"] = "bog_pri_rogermoveup";
    level._id_78BA["price"]["roger"] = "bog_pri_roger";
    level._id_78BA["price"]["keeppinned"] = "bog_pri_keeppinned";
    level._id_78BA["grigsby"]["staysharp"] = "bog_grg_staysharp";
    level._id_78BA["mgkiller_right"]["comingleft"] = "bog_gm1_comingleft";
    level._id_78BA["price"]["rogerthat"] = "bog_pri_rogerthat";
    level._id_78BA["price"]["t72behind"] = "bog_pri_t72behind";
    level._id_78BA["gm1"]["callit"] = "bog_gm1_callit";
    level._id_78BA["gm2"]["afterlast"] = "bog_gm2_afterlast";
    level._id_78BA["gm1"]["youreon"] = "bog_gm1_youreon";
    level._id_78BA["gm1"]["wooyeah"] = "bog_gm1_wooyeah";
    level._id_78BA["gm2"]["holyshit"] = "bog_gm2_holyshit";
    level._id_78BA["gm3"]["hellyeah"] = "bog_gm3_hellyeah";
    level._id_78BA["gm4"]["yeahwoo"] = "bog_gm4_yeahwoo";
    level._id_78BA["gm5"]["talkinabout"] = "bog_gm4_talkinabout";
    level._id_78BA["price"]["niceshootingpig"] = "bog_pri_niceshootingpig";
    level._id_78BA["tank_commander"]["wethereyet"] = "bog_tcm_wethereyet";
    level._id_78BA["tank_commander"]["comingthrough"] = "bog_tcm_comingthrough";
    level._id_78BA["hq_radio"]["statusover"] = "bog_hqr_statusover";
    level._id_78BA["price"]["cargo"] = "bog_pri_cargo";
    level._id_78BA["saknight"]["getonboard"] = "bog_mhp_getonboard";
    level._id_78BA["price"]["fixonposition"] = "bog_pri_fixonposition";
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

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

exploder_script_model_anims()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["wallshot_all0_anim"] = %wallshot_all0_anim;
    level._id_78AC["exploder_script_model"]["wallshot_all1_anim"] = %wallshot_all1_anim;
    level._id_78AC["exploder_script_model"]["wallshot_all2_anim"] = %wallshot_all2_anim;
    level._id_78AC["exploder_script_model"]["wallshot_all3_anim"] = %wallshot_all3_anim;
    level._id_78AC["exploder_script_model"]["wallshot_all4_anim"] = %wallshot_all4_anim;
    level._id_78AC["exploder_script_model"]["wallshot_all5_anim"] = %wallshot_all5_anim;
    level._id_78AC["exploder_script_model"]["bog_b_wallshot_b0_anim"] = %bog_b_wallshot_b0_anim;
    level._id_78AC["exploder_script_model"]["bog_b_wallshot_b1_anim"] = %bog_b_wallshot_b1_anim;
    level._id_78AC["exploder_script_model"]["h1_bog_b_tankdeath_wallshot0_anim"] = %h1_bog_b_tankdeath_wallshot0_anim;
    level._id_78AC["exploder_script_model"]["h1_bog_b_tankdeath_wallshot1_anim"] = %h1_bog_b_tankdeath_wallshot1_anim;
    level._id_78AC["exploder_script_model"]["h1_bog_b_tankdeath_wallshot2_anim"] = %h1_bog_b_tankdeath_wallshot2_anim;
    level._id_78AC["exploder_script_model"]["h1_bogb_wallshot_c0_anim"] = %h1_bogb_wallshot_c0_anim;
    level._id_78AC["exploder_script_model"]["h1_bogb_wallshot_c1_anim"] = %h1_bogb_wallshot_c1_anim;
    level._id_78AC["exploder_script_model"]["h1_bogb_wallshot_c2_anim"] = %h1_bogb_wallshot_c2_anim;
    level._id_78AC["exploder_script_model"]["h1_bogb_wallshot_c3_anim"] = %h1_bogb_wallshot_c3_anim;
    level._id_78AC["exploder_script_model"]["h1_bogb_wallshot_c4_anim"] = %h1_bogb_wallshot_c4_anim;
}
#using_animtree("vehicles");

shoot_m1a1_anim()
{
    self _meth_8144( %abrams_shoot_kick, 0 );
    self _meth_814F( %abrams_shoot_kick );
}

shoot_t72_anim()
{
    self _meth_8144( %t72_shoot_kick, 0 );
    self _meth_814F( %t72_shoot_kick );
}
