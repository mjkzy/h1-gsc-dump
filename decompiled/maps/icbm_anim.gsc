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

anim_main()
{
    level._id_78BA["price"]["wheresgriggs"] = "icbm_pri_wheresgriggs";
    level._id_78BA["gaz"]["noidea"] = "icbm_uk2_noidea";
    level._id_78BA["price"]["wereonourway"] = "icbm_pri_wereonourway";
    level._id_78BA["price"]["takealook"] = "icbm_pri_takealook";
    level._id_78BA["price"]["Charlie_status"] = "icbm_pri_status";
    level._id_78BA["price"]["charlie_towersdown"] = "icbm_pri_towersdown";
    level._id_78BA["price"]["scoutthrough"] = "icbm_pri_scoutthrough";
    level._id_78BA["price"]["alternateroute"] = "icbm_pri_alternateroute";
    maps\_props::add_smoking_notetracks( "generic" );
    maps\_props::add_cellphone_notetracks( "generic" );
    maps\_props::add_smoking_notetracks( "hostile" );
    maps\_props::add_cellphone_notetracks( "hostile" );
    anims();
    _id_6A5B();
    _id_66FC();
    tower_explode_anims();
    _id_7A3D();
    level._id_78BA["price"]["grigsby_landed"] = "icbm_pri_wherelanded";
    level._id_78BA["gaz"]["bybuildingseast"] = "icbm_uk2_buildingseast";
    level._id_78BA["price"]["abouttofindout"] = "icbm_pri_tofindout";
    level._id_78BA["gaz"]["yougotit"] = "icbm_uk2_yougotit";
    level._id_78BA["gaz"]["enemyvehicle"] = "icbm_uk2_contactfront";
    level._id_78BA["generic"]["insight"] = "icbm_sas3_insight";
    level._id_78BA["price"]["move"] = "icbm_pri_move";
    level._id_78BA["price"]["griggsinhouses"] = "icbm_pri_griggsinhouses";
    level._id_78BA["price"]["keepitquiet"] = "icbm_pri_basementdoor";
    level._id_78BA["gaz"]["proceedupstairs"] = "icbm_uk2_proceedupstairs";
    level._id_78BA["gaz"]["1clear"] = "icbm_uk2_1clear";
    level._id_78BA["gaz"]["griggsnothere"] = "icbm_uk2_griggsisnthere";
    level._id_78BA["price"]["regroupdownstairs"] = "icbm_pri_regroupdownstairs";
    level._id_78BA["gaz"]["copythat"] = "icbm_uk2_copythat";
    level._id_78BA["price"]["nexthouse"] = "icbm_pri_nexthouse";
    level._id_78BA["gaz"]["allclear"] = "icbm_uk2_allclear";
    level._id_78BA["generic"]["building2secured"] = "icbm_sas2_2secured";
    level._id_78BA["gaz"]["roomclear"] = "icbm_uk2_roomclear";
    level._id_78BA["gaz"]["roomclear2"] = "icbm_uk2_roomclear2";
    level._id_78BA["generic"]["neutralized"] = "icbm_sas2_neutralized";
    level._id_78BA["gaz"]["roger"] = "icbm_uk2_roger";
    level._id_78BA["gaz"]["floorsclear"] = "icbm_uk2_floorsclear";
    level._id_78BA["gaz"]["building1clear"] = "icbm_uk2_1clear";
    level._id_78BA["generic"]["tangodown"] = "icbm_sas2_tangodown";
    level._id_78BA["price"]["regrouponme"] = "icbm_pri_regrouponme";
    level._id_78BA["price"]["jacksonregroup"] = "icbm_pri_jacksonregroup";
    level._id_78BA["price"]["letsgo"] = "icbm_pri_letsgo";
    level._id_78BA["generic"]["contact"] = "icbm_sas2_contact";
    level._id_78BA["griggs"]["leavemebehind"] = "icbm_grg_leavemebehind";
    level._id_78BA["price"]["firstthought"] = "icbm_pri_firstthought";
    level._id_78BA["price"]["youallright"] = "icbm_pri_youallright";
    level._id_78BA["griggs"]["goodtogo"] = "icbm_grg_goodtogo";
    level._id_78BA["price"]["gotgriggs"] = "icbm_pri_gotgriggs";
    level._id_78BA["gaz"]["enemyhelicopters"] = "icbm_uk2_helicopters";
    level._id_78BA["price"]["slicksinbound"] = "icbm_pri_slicksinbound";
    level._id_78BA["price"]["status"] = "icbm_pri_team2status";
    level._id_78BA["price"]["killthepower"] = "icbm_gm4_inposition";
    level._id_78BA["price"]["jackgriggsplant"] = "icbm_pri_jacksonplant";
    level._id_78BA["griggs"]["chargesset"] = "icbm_grg_chargesset";
    level._id_78BA["price"]["doit"] = "icbm_pri_doit";
    level._id_78BA["price"]["towersdown"] = "icbm_pri_powersout";
    level._id_78BA["price"]["breachingperimeter"] = "icbm_gm4_breachperimeter";
    level._id_78BA["price"]["standby"] = "icbm_gm4_standby";
    level._id_78BA["griggs"]["backuppower"] = "icbm_grg_backuppower";
    level._id_78BA["griggs"]["fiveseconds"] = "icbm_grg_fiveseconds";
    level._id_78BA["price"]["rallypoint"] = "icbm_gm4_rallypoint";
    level._id_78BA["price"]["onourway"] = "icbm_pri_onourway";
    level._id_78BA["griggs"]["poweronline"] = "icbm_grg_poweronline";
    level._id_78BA["price"]["getfenceopen"] = "icbm_pri_getfenceopen";
    level._id_78BA["griggs"]["getbusy2"] = "icbm_grg_getbusy2";
    level._id_78BA["generic"]["truckswithshooters"] = "icbm_gm5_3trucks";
    level._id_78BA["price"]["rogerthat"] = "icbm_pri_rogerthat";
    level._id_78BA["price"]["approachingbase"] = "icbm_pri_oldbase";
    level._id_78BA["generic"]["haveavisual"] = "icbm_uk2_visualontrucks";
    level._id_78BA["price"]["youknowdrill"] = "icbm_pri_youknowdrill";
    level._id_78BA["price"]["flankingthrough"] = "icbm_pri_flankingthrough";
    level._id_78BA["gaz"]["rpgsonrooftop"] = "icbm_sas1_rpgsonrooftop";
    level._id_78BA["gaz"]["rpgsonrooftop2"] = "icbm_sas2_rpgsonrooftops";
    level._id_78BA["price"]["grabrpg"] = "icbm_pri_grabrpg";
    level._id_78BA["price"]["behindus"] = "icbm_pri_behindus";
    level._id_78BA["gaz"]["behindus2"] = "icbm_sas1_behindus";
    level._id_78BA["price"]["takeoutbmp"] = "icbm_pri_takeoutbmp";
    level._id_78BA["price"]["keepmoving"] = "icbm_pri_keepmoving";
    level._id_78BA["gaz"]["choppersinbound"] = "icbm_sas1_choppersinbound";
    level._id_78BA["price"]["droppingin"] = "icbm_pri_droppingin";
    level._id_78BA["gaz"]["whatthe"] = "icbm_uk2_looksoutheast";
    level._id_78BA["griggs"]["problemhere"] = "icbm_grg_problemhere";
    level._id_78BA["price"]["onemissile"] = "icbm_pri_onemissile";
    level._id_78BA["griggs"]["anotherone"] = "icbm_grg_anotherone";
    level._id_78BA["price"]["twomissiles"] = "icbm_pri_twomissiles";
    level._id_78BA["price"]["gettingabortcodes"] = "icbm_hqr_satellitestracking";
    level._id_78BA["griggs"]["itsonnow"] = "icbm_grg_itsonnow";
    level._id_78BA["price"]["youretellinme"] = "icbm_pri_gottomove";
    level._id_78BA["gm5"]["treeline"] = "icbm_gm5_treelineS";
    level._id_78BA["price"]["americanteams"] = "icbm_pri_americanteams";
    level._id_78BA["gm5"]["goodtosee"] = "icbm_gm5_whatthe";
    level._id_78BA["price"]["keepquiet"] = "icbm_pri_keepitquiet";
    level._id_78BA["price"]["sunsup"] = "icbm_pri_sunscomingup";
    level._id_78BA["price"]["blowuptower"] = "icbm_pri_knockouttower";
    level._id_78BA["price"]["flankingbehind"] = "icbm_pri_flankingbehind";
    level._id_78BA["ru1"]["whereothers"] = "icbm_ru1_whereothers";
    level._id_78BA["griggs"]["grg_678452056"] = "icbm_grg_678452056";
    level._id_78BA["ru1"]["tovarisch"] = "icbm_ru1_tovarisch";
    level._id_78BA["ru1"]["howmany"] = "icbm_ru1_howmany";
    level._id_78BA["griggs"]["grg_678"] = "icbm_grg_678";
    level._id_78BA["ru1"]["whoisofficer"] = "icbm_ru1_whoisofficer";
    level._id_78BA["griggs"]["blowme"] = "icbm_grg_getbusy";
    level._id_78BA["ru1"]["whereshacksaw"] = "icbm_ru1_whereshacksaw";
    level._id_78BA["ru1"]["youhadit"] = "icbm_ru2_youhadit";
    level._id_78BA["ru1"]["ifihad"] = "icbm_ru1_ifihad";
    level._id_78BA["price"]["thisisplace"] = "icbm_pri_thisisplace";
    level._id_78BA["price"]["readytobreach"] = "icbm_pri_readytobreach";
    level._id_78BA["price"]["gogogo"] = "icbm_pri_gogogo";
    level._id_78BA["price"]["cutloose"] = "icbm_pri_cutloose";
}
#using_animtree("generic_human");

_id_66FC()
{
    level._id_78AC["generic"]["patrolwalk_1"] = %active_patrolwalk_v1;
    level._id_78AC["generic"]["patrolwalk_2"] = %active_patrolwalk_v2;
    level._id_78AC["generic"]["patrolwalk_3"] = %active_patrolwalk_v3;
    level._id_78AC["generic"]["patrolwalk_4"] = %active_patrolwalk_v4;
    level._id_78AC["generic"]["patrolwalk_5"] = %active_patrolwalk_v5;
    level._id_78AC["generic"]["patrolwalk_pause"] = %active_patrolwalk_pause;
    level._id_78AC["generic"]["patrolwalk_turn"] = %active_patrolwalk_turn_180;
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
}

anims()
{
    level._id_78AC["price"]["intro_briefing"] = %h1_icbm_introbrief_price;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_regrouponme" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_wheresgriggs" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_wereonourway" );
    level._id_78AC["gaz"]["intro_briefing"] = %h1_icbm_introbrief_gaz;
    maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "intro_briefing", "icbm_uk2_noidea" );
    level._id_78AC["generic"]["intro_briefing"] = %h1_icbm_introbrief_soldier;
    level._id_78AC["generic"]["pronehide_dive1"] = %hunted_dive_2_pronehide_v1;
    level._id_78AC["generic"]["pronehide_dive2"] = %hunted_dive_2_pronehide_v2;
    level._id_78AC["generic"]["pronehide_dive3"] = %hunted_dive_2_pronehide_v3;
    level._id_78AC["generic"]["pronehide_idle1"] = %hunted_pronehide_idle_v1;
    level._id_78AC["generic"]["pronehide_idle2"] = %hunted_pronehide_idle_v2;
    level._id_78AC["generic"]["pronehide_idle3"] = %hunted_pronehide_idle_v3;
    level._id_78AC["generic"]["pronehide_2_stand1"] = %hunted_pronehide_2_stand_v1;
    level._id_78AC["generic"]["pronehide_2_stand2"] = %hunted_pronehide_2_stand_v2;
    level._id_78AC["generic"]["pronehide_2_stand3"] = %hunted_pronehide_2_stand_v3;
    level._id_78AC["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level._id_78AC["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level._id_78AC["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level._id_78AC["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level._id_78AC["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_heard_scream"] = %exposed_idle_twitch_v4;
    level._id_78AC["price"]["hunted_open_barndoor"] = %hunted_open_barndoor;
    level._id_78AC["price"]["hunted_open_barndoor_stop"] = %hunted_open_barndoor_idle;
    level._id_78AC["price"]["hunted_open_barndoor_idle"][0] = %hunted_open_barndoor_idle;
    level._id_78AC["hostile"]["patrol_twitch"] = %patrolstand_twitch;
    level._id_78AC["hostile"]["phoneguy_idle_start"] = %patrol_bored_idle_cellphone;
    level._id_78AC["hostile"]["phoneguy_idle"][0] = %patrol_bored_idle_cellphone;
    level._id_78AC["hostile"]["phoneguy_alerted"] = %parabolic_phoneguy_reaction;
    level._id_78AC["hostile"]["phoneguy_death"] = %icbm_patrol_knifekill_looser;
    level._id_78AC["hostile"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level._id_78AC["hostile"]["patrol_bored_idle_smoke"][0] = %patrol_bored_idle_smoke;
    level._id_78AC["hostile"]["patrol_bored_idle_cellphone"][0] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["cellphone_idle"][0] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["lean_smoke_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["lean_smoke_idle"][1] = %parabolic_leaning_guy_smoking_twitch;
    level._id_78AC["generic"]["coffee_idle"][0] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["sleep_idle"][0] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["cellphone_reach"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["smoke_reach"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["lean_smoke_reach"] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["generic"]["coffee_reach"] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["sleep_reach"] = %parabolic_guard_sleeper_idle;
    level._id_78AC["generic"]["cellphone_react"] = %patrol_bored_react_look_retreat;
    level._id_78AC["generic"]["smoke_react"] = %patrol_bored_react_look_advance;
    level._id_78AC["generic"]["lean_smoke_react"] = %patrol_bored_react_walkstop_short;
    level._id_78AC["generic"]["coffee_react"] = %parabolic_guard_sleeper_react;
    level._id_78AC["generic"]["sleep_react"] = %parabolic_guard_sleeper_react;
    maps\_anim::addnotetrack_customfunction( "generic", "fire", maps\icbm_code::kill_during_breach1, "detcord_stack_leftbreach_01" );
    maps\_anim::addnotetrack_customfunction( "generic", "fire", maps\icbm_code::kill_during_breach2, "detcord_stack_leftbreach_02" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "exhale", "h1_ru_smoker_exhale" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "puff", "h1_ru_smoker_inhale" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "openlighter", "h1_icbm_ru_lighter_open" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "closelighter", "h1_icbm_ru_lighter_close" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "rattle", "h1_scn_ru_rattle" );
    maps\_anim::addnotetrack_animsound( "generic", "sleep_idle", "start", "h1_icbm_ru_snore_loop" );
    level._id_78AC["price"]["knifekill_price"] = %icbm_patrol_knifekill_winner;
    maps\_anim::addnotetrack_customfunction( "price", "attach knife", ::show_prices_knife, "knifekill_price" );
    maps\_anim::addnotetrack_customfunction( "price", "detach knife", ::hide_prices_knife, "knifekill_price" );
    level._id_78AC["price"]["signal_assault_coverstand"] = %coverstand_hide_idle_wave02;
    level._id_78AC["price"]["signal_forward_coverstand"] = %coverstand_hide_idle_wave01;

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        level._id_78AC["griggs"]["grigsby_rescue"] = %grigsby_rescue;
        maps\_anim::addnotetrack_customfunction( "griggs", "grab gun", maps\icbm_code::griggs_grab_gun, "grigsby_rescue" );
        level._id_78AC["griggs"]["grigsby_rescue_idle"][0] = %grigsby_rescue_idle;
        level._id_78AC["griggs"]["grigsby_rescue_react"] = %grigsby_rescue_react;
    }
    else
    {
        level._id_78AC["griggs"]["grigsby_rescue"] = %h1_grigsby_rescue;
        maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "grigsby_rescue", "icbm_grg_leavemebehind" );
        maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "grigsby_rescue", "icbm_grg_goodtogo" );
        maps\_anim::addnotetrack_customfunction( "griggs", "grab gun", maps\icbm_code::griggs_grab_gun, "grigsby_rescue" );
        level._id_78AC["griggs"]["grigsby_rescue_idle"][0] = %h1_grigsby_rescue_idle;
        level._id_78AC["price"]["grigsby_rescue_price_idle"][0] = %h1_grigsby_rescue_price_idle;
        level._id_78AC["price"]["grigsby_rescue_price"] = %h1_grigsby_rescue_price;
        level._id_78AC["price"]["grigsby_rescue_price_in"] = %h1_grigsby_rescue_price_in;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price_in", "icbm_pri_cutloose" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price", "icbm_pri_firstthought" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price", "icbm_pri_youallright" );
        level._id_78AC["griggs"]["grigsby_rescue_react"] = %grigsby_rescue_react;
    }

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        level._id_78AC["griggs"]["icbm_fence_cutting_guys"] = %icbm_fence_cutting_guy2;
        level._id_78AC["gaz"]["icbm_fence_cutting_guys"] = %icbm_fence_cutting_guy1;
    }
    else
    {
        level._id_78AC["griggs"]["icbm_fence_cutting_guys"] = %h1_icbm_fence_cutting_guy2;
        level._id_78AC["gaz"]["icbm_fence_cutting_guys"] = %h1_icbm_fence_cutting_guy1;
    }

    level._id_78AC["generic"]["fence_stand_idle"][0] = %cqb_stand_idle;
    maps\_anim::addnotetrack_attach( "gaz", "can_in_hand", "com_spray_can01", "tag_inhand", "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_detach( "gaz", "can_out_hand", "com_spray_can01", "tag_inhand", "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_animsound( "gaz", "icbm_fence_cutting_guys", "scn_icbm_fence_cut", "scn_icbm_fence_cut" );
    maps\_anim::addnotetrack_animsound( "gaz", "icbm_fence_cutting_guys", "scn_icbm_fence_pull", "scn_icbm_fence_pull" );
    maps\_anim::addnotetrack_customfunction( "gaz", "can_start_spray", maps\icbm_code::spraycan_fx, "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_customfunction( "gaz", "can_stop_spray", maps\icbm_code::spraycan_fx_stop, "icbm_fence_cutting_guys" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
    {
        level._id_78AC["price"]["icbm_end_price"] = %icbm_end_price;
        level._id_78AC["gm5"]["icbm_end_sniper"] = %icbm_end_sniper;
    }
    else
    {
        level._id_78AC["price"]["icbm_end_price_idle"][0] = %h1_icbm_end_price_idle;
        level._id_78AC["price"]["icbm_end_price"] = %h1_icbm_end_price;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "icbm_end_price", "icbm_pri_onemissile" );
        level._id_78AC["gm5"]["icbm_end_sniper"] = %h1_icbm_end_sniper;
        maps\_anim::addnotetrack_dialogue( "gm5", "dialog", "icbm_end_sniper", "icbm_gm5_whatthe" );
    }
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78B1["player_rescue_griggs_model"] = #animtree;
    level._id_78B5["player_rescue_griggs_model"] = "viewhands_player_sas_woodland";
    level._id_78AC["player_rescue_griggs_model"]["grigsby_rescue_player"] = %h1_grigsby_rescue_player;
    maps\_anim::addnotetrack_animsound( "player_rescue_griggs_model", "grigsby_rescue_player", "start", "scn_icbm_rescue_griggs_cut" );
}
#using_animtree("icbm");

tower_explode_anims()
{
    level._id_78B1["tower"] = #animtree;
    level._id_78AC["tower"]["explosion"] = %icbm_power_tower_crash;
    level._id_78B1["wire"] = #animtree;
    level._id_78AC["wire"]["idle6"][0] = %icbm_power_tower_wire_idle_le4;
    level._id_78AC["wire"]["idle7"][0] = %icbm_power_tower_wire_idle_le5;
    level._id_78AC["wire"]["idle8"][0] = %icbm_power_tower_wire_idle_le6;
    level._id_78AC["wire"]["idle9"][0] = %icbm_power_tower_wire_idle_ri4;
    level._id_78AC["wire"]["idle10"][0] = %icbm_power_tower_wire_idle_ri5;
    level._id_78AC["wire"]["idle11"][0] = %icbm_power_tower_wire_idle_ri6;
    level._id_78AC["wire"]["idle0"][0] = %h1_icbm_power_tower_wire_idle_le1;
    level._id_78AC["wire"]["idle1"][0] = %h1_icbm_power_tower_wire_idle_le2;
    level._id_78AC["wire"]["idle2"][0] = %h1_icbm_power_tower_wire_idle_le3;
    level._id_78AC["wire"]["idle3"][0] = %h1_icbm_power_tower_wire_idle_ri1;
    level._id_78AC["wire"]["idle4"][0] = %h1_icbm_power_tower_wire_idle_ri2;
    level._id_78AC["wire"]["idle5"][0] = %h1_icbm_power_tower_wire_idle_ri3;
    level._id_78AC["wire"]["idle12"][0] = %h1_icbm_power_tower_wire_idle_ri4;
    level._id_78AC["wire"]["idle13"][0] = %h1_icbm_power_tower_wire_idle_ri5;
    level._id_78AC["wire"]["idle14"][0] = %h1_icbm_power_tower_wire_idle_ri6;
    level._id_78AC["wire"]["idle15"][0] = %h1_icbm_power_tower_wire_idle_le4;
    level._id_78AC["wire"]["idle16"][0] = %h1_icbm_power_tower_wire_idle_le5;
    level._id_78AC["wire"]["idle17"][0] = %h1_icbm_power_tower_wire_idle_le6;
    level._id_78AC["wire"]["explosion6"] = %icbm_power_tower_wire_le4;
    level._id_78AC["wire"]["explosion7"] = %icbm_power_tower_wire_le5;
    level._id_78AC["wire"]["explosion8"] = %icbm_power_tower_wire_le6;
    level._id_78AC["wire"]["explosion9"] = %icbm_power_tower_wire_ri4;
    level._id_78AC["wire"]["explosion10"] = %icbm_power_tower_wire_ri5;
    level._id_78AC["wire"]["explosion11"] = %icbm_power_tower_wire_ri6;
    level._id_78AC["wire"]["explosion0"] = %h1_icbm_power_tower_wire_le1;
    level._id_78AC["wire"]["explosion1"] = %h1_icbm_power_tower_wire_le2;
    level._id_78AC["wire"]["explosion2"] = %h1_icbm_power_tower_wire_le3;
    level._id_78AC["wire"]["explosion3"] = %h1_icbm_power_tower_wire_ri1;
    level._id_78AC["wire"]["explosion4"] = %h1_icbm_power_tower_wire_ri2;
    level._id_78AC["wire"]["explosion5"] = %h1_icbm_power_tower_wire_ri3;
    level._id_78AC["wire"]["explosion12"] = %h1_icbm_power_tower_wire_ri4;
    level._id_78AC["wire"]["explosion13"] = %h1_icbm_power_tower_wire_ri5;
    level._id_78AC["wire"]["explosion14"] = %h1_icbm_power_tower_wire_ri6;
    level._id_78AC["wire"]["explosion15"] = %h1_icbm_power_tower_wire_le4;
    level._id_78AC["wire"]["explosion16"] = %h1_icbm_power_tower_wire_le5;
    level._id_78AC["wire"]["explosion17"] = %h1_icbm_power_tower_wire_le6;
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion0", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion1", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion2", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion3", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion4", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion5", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion6", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion7", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_break", maps\icbm_code::tower_legbreak_fx, "explosion" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_sparks", maps\icbm_code::tower_spark_fx, "explosion" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_crash", maps\icbm_code::tower_impact_fx, "explosion" );
    level._id_78B1["fence"] = #animtree;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        level._id_78AC["fence"]["model_cut"] = %icbm_fence_cutting_guy1_fence;
    else
        level._id_78AC["fence"]["model_cut"] = %h1_icbm_fence_cutting_guy1_fence;
}
#using_animtree("generic_human");

uaz_overrides()
{
    var_0 = vehicle_scripts\_uaz::_id_7F23();
    var_0[0].death = %uaz_rear_driver_death;
    var_0[1].death = %uaz_passenger_death;
    var_0[0]._id_3540 = %death_explosion_left11;
    var_0[1]._id_3540 = %death_explosion_right13;
    var_0[0]._id_4068 = %h1_driver_getout_2_run;
    var_0[1]._id_4068 = %h1_passenger_getout_2_run;
    var_0[0]._id_4068 = %h1_uaz_driver_exit_into_run;
    var_0[0].getout_ik = 1;
    var_0[1]._id_4068 = %h1_uaz_passenger_exit_into_run;
    var_0[1].getout_ik = 1;
    var_0[2]._id_4068 = %h1_uaz_driver_exit_into_run;
    var_0[2].getout_ik = 1;
    var_0[3]._id_4068 = %h1_uaz_passenger_exit_into_run;
    var_0[3].getout_ik = 1;
    return var_0;
}
#using_animtree("vehicles");

uaz_vehicle_overrides( var_0 )
{
    var_0 = vehicle_scripts\_uaz::_id_7EFA( var_0 );
    var_0[0]._id_9CD5 = %h1_uaz_driver_exit_into_run_door;
    var_0[1]._id_9CD5 = %h1_uaz_passenger_exit_into_run_door;
    var_0[2]._id_9CD5 = %h1_uaz_driver_exit_into_run_door;
    var_0[3]._id_9CD5 = %h1_uaz_passenger_exit_into_run_door;
    var_0[0]._id_9CD7 = "h1_icbm_jeep_door1";
    var_0[1]._id_9CD7 = "h1_icbm_jeep_door2";
    return var_0;
}
#using_animtree("script_model");

_id_7A3D()
{
    level._id_78AC["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level._id_78B1["chair"] = #animtree;
    level._id_78B5["chair"] = "com_folding_chair";
    maps\_anim::addnotetrack_customfunction( "chair", "scn_relaxed_guard_chair_death", ::play_relaxed_guard_chair_death, "sleep_react" );
}

play_relaxed_guard_chair_death( var_0 )
{
    var_0 thread common_scripts\utility::_id_69C2( "scn_icbm_relaxed_chair_fall", var_0.origin );
}

show_prices_knife( var_0 )
{
    level.price_knife show();
}

hide_prices_knife( var_0 )
{
    level.price_knife hide();
}
