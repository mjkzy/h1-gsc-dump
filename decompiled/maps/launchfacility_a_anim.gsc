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
    setup_exploder_anims();
    anims();
    _id_29F3();
    _id_6BD0();
    _id_7A3D();
    animated_model_setup();
}
#using_animtree("generic_human");

anims()
{
    level._id_78AC["frnd"]["spin"] = %combatwalk_f_spin;
    level._id_78AC["frnd"]["AT4_fire_start"] = %launchfacility_a_at4_fire;
    level._id_78AC["frnd"]["AT4_fire"] = %launchfacility_a_at4_fire;
    level._id_78AC["frnd"]["AT4_idle"][0] = %corner_standr_alert_idle;
    level._id_78AC["frnd"]["RPG_conceal_idle_start"] = %rpg_conceal_idle;
    level._id_78AC["frnd"]["RPG_conceal_idle"][0] = %rpg_conceal_idle;
    level._id_78AC["frnd"]["RPG_conceal_2_standR"] = %rpg_conceal_2_standr;
    level._id_78AC["frnd"]["RPG_stand_idle"][0] = %rpg_stand_idle;
    level._id_78AC["frnd"]["RPG_stand_fire"] = %rpg_stand_fire;
    level._id_78AC["frnd"]["RPG_standR_2_conceal"] = %rpg_standr_2_conceal;
    level._id_78AC["frnd"]["RPG_stand_aim_2"] = %rpg_stand_aim_2;
    level._id_78AC["frnd"]["RPG_stand_aim_4"] = %rpg_stand_aim_4;
    level._id_78AC["frnd"]["RPG_stand_aim_5"] = %rpg_stand_aim_5;
    level._id_78AC["frnd"]["RPG_stand_aim_6"] = %rpg_stand_aim_6;
    level._id_78AC["frnd"]["RPG_stand_aim_8"] = %rpg_stand_aim_8;
    level._id_78AC["frnd"]["C4_gate_plant_start"] = %launchfacility_a_c4_plant;
    level._id_78AC["frnd"]["C4_gate_plant"] = %launchfacility_a_c4_plant;
    level._id_78AC["frnd"]["C4_plant_start"] = %explosive_plant_knee;
    level._id_78AC["frnd"]["C4_plant"] = %explosive_plant_knee;
    level._id_78AC["frnd"]["saw_1_start"] = %launchfacility_a_saw_1;
    level._id_78AC["frnd"]["saw_2_start"] = %launchfacility_a_saw_2;
    level._id_78AC["frnd"]["saw_1"] = %launchfacility_a_saw_1;
    level._id_78AC["frnd"]["saw_2"] = %launchfacility_a_saw_2;
    level._id_78AC["frnd"]["saw_1_object"] = %launchfacility_a_saw_1_object;
    level._id_78AC["frnd"]["saw_2_object"] = %launchfacility_a_saw_2_object;
    maps\_anim::addnotetrack_customfunction( "frnd", "saw_pickup", maps\launchfacility_a::saw_notify_pickup, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "start_sparks", maps\launchfacility_a::saw_notify_start, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "stop", maps\launchfacility_a::saw_notify_stop, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "switch", maps\launchfacility_a::saw_notify_switch, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "saw_pickup", maps\launchfacility_a::saw_notify_pickup, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "start_sparks", maps\launchfacility_a::saw_notify_start, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "stop", maps\launchfacility_a::saw_notify_stop, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "switch", maps\launchfacility_a::saw_notify_switch, "saw_2" );
    level._id_78AC["frnd"]["rappel_setup_start"] = %launchfacility_a_setup_idle_1;
    level._id_78AC["frnd"]["rappel_setup_to_stand_1"] = %launchfacility_a_setup_2_rappel_1;
    level._id_78AC["frnd"]["rappel_setup_to_stand_2"] = %launchfacility_a_setup_2_rappel_2;
    level._id_78AC["frnd"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1;
    level._id_78AC["frnd"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2;
    level._id_78AC["frnd"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3;
    level._id_78AC["frnd"]["rappel_drop"] = %launchfacility_a_rappel_1;
}

_id_29F3()
{
    level._id_78BA["launchfacility_a_rul_highalert"] = "launchfacility_a_rul_highalert";
    level._id_78BA["launchfacility_a_rul_underattack"] = "launchfacility_a_rul_underattack";
    level._id_78BA["launchfacility_a_rul_redspentznaz"] = "launchfacility_a_rul_redspentznaz";
    level._id_78BA["launchfacility_a_rul_preptubes"] = "launchfacility_a_rul_preptubes";
    level._id_78BA["launchfacility_a_rul_motherland"] = "launchfacility_a_rul_motherland";
    level._id_78BA["launchfacility_a_rul_avengefallen"] = "launchfacility_a_rul_avengefallen";
    level._id_78BA["launchfacility_a_rul_restorehonor"] = "launchfacility_a_rul_restorehonor";
    level._id_78B9["launchfacility_a_hqr_stillworking"] = "launchfacility_a_hqr_stillworking";
    level._id_78B9["launchfacility_a_hqradio_activity"] = "launchfacility_a_hqr_heavyactivity";
    level._id_78BA["frnd"]["launchfacility_a_price_tarfu"] = "launchfacility_a_us_lead_statustarfu";
    level._id_78BA["frnd"]["launchfacility_a_price_at4_prep"] = "launchfacility_a_us_lead_coversblown";
    level._id_78B9["launchfacility_a_marine_01_at4_prep"] = "launchfacility_a_gm2_lastround";
    level._id_78B9["launchfacility_a_cmd_highalert"] = "launchfacility_a_hqr_stillworking";
    level._id_78BA["frnd"]["launchfacility_a_marine1_chopper"] = "launchfacility_a_gm1_hind12oclock";
    level._id_78B9["launchfacility_a_marine2_killchopper"] = "launchfacility_a_gm2_igothim";
    level._id_78BA["frnd"]["launchfacility_a_price_gogogo1"] = "launchfacility_a_us_lead_gogogo";
    level._id_78BA["frnd"]["launchfacility_a_griggs_moreground"] = "launchfacility_a_grg_groundsupport";
    level._id_78BA["frnd"]["launchfacility_a_price_alreadygot"] = "launchfacility_a_us_lead_alreadygot";
    level._id_78B9["launchfacility_a_recon_sniperteamtwo"] = "launchfacility_a_gm4_team2inposition";
    level._id_78BA["frnd"]["launchfacility_a_price_keepposted"] = "launchfacility_a_us_lead_keepposted";
    level._id_78B9["launchfacility_a_recon_enemiestonorth"] = "launchfacility_a_gm4_hostileslightarmor";
    level._id_78BA["frnd"]["launchfacility_a_price_smoke_nag_01"] = "launchfacility_a_us_lead_throwsmoke";
    level._id_78BA["frnd"]["launchfacility_a_grigsby_smoke_nag_01"] = "launchfacility_a_grg_popsmoke";
    level._id_78BA["frnd"]["launchfacility_a_marine_01_throwing_smoke"] = "launchfacility_a_gm2_poppinsmoke";
    level._id_78B9["launchfacility_a_marine_01_blowing_bmp"] = "launchfacility_a_gm1_chargesplaced";
    level._id_78B9["launchfacility_a_recon_enemies_coming"] = "launchfacility_a_gm4_fullplatoon";
    level._id_78B9["launchfacility_a_cmd_sitrep"] = "launchfacility_a_hqr_sitrep";
    level._id_78BA["frnd"]["launchfacility_a_price_were_inside"] = "launchfacility_a_us_lead_wereinside";
    level._id_78BA["frnd"]["launchfacility_a_pri_breachgate"] = "launchfacility_a_pri_breachgate";
    level._id_78BA["frnd"]["launchfacility_a_marine1_gate_blow"] = "launchfacility_a_gm1_coverme";
    level._id_78BA["frnd"]["launchfacility_a_marine2_gate_getback"] = "launchfacility_a_gm1_getback";
    level._id_78BA["frnd"]["launchfacility_a_marine2_fireinhole"] = "launchfacility_a_gm1_fireinthehole";
    level._id_78BA["frnd"]["launchfacility_a_price_tothetarmac"] = "launchfacility_a_us_lead_throughthegate";
    level._id_78BA["frnd"]["launchfacility_a_griggs_morebmps"] = "launchfacility_a_grg_morebmps";
    level._id_78BA["frnd"]["launchfacility_a_price_knockemout"] = "launchfacility_a_us_lead_knockemout";
    level._id_78BA["frnd"]["launchfacility_a_griggs_userpghint"] = "launchfacility_a_grg_eyesopen";
    level._id_78BA["frnd"]["launchfacility_a_griggs_vehicles_hint_01"] = "launchfacility_a_grg_takeoutbmps";
    level._id_78B9["launchfacility_a_friendlies_east"] = "launchfacility_a_gm3_checktargets";
    level._id_78BA["frnd"]["launchfacility_a_price_copyteamthree"] = "launchfacility_a_us_lead_northtarmac";
    level._id_78B9["launchfacility_a_gm3_cutvents"] = "launchfacility_a_gm3_cutvents";
    level._id_78B9["launchfacility_a_gm1_cutting"] = "launchfacility_a_gm1_cutting";
    level._id_78BA["frnd"]["launchfacility_a_gm1_incoming"] = "launchfacility_a_gm1_incoming";
    level._id_78B9["launchfacility_a_recon_two_helis"] = "launchfacility_a_gm4_getouttasight";
    level._id_78BA["frnd"]["launchfacility_a_price_ropesout_01"] = "launchfacility_a_us_lead_hookup";
    level._id_78B9["launchfacility_a_marine2_rappelling"] = "launchfacility_a_gm2_rappellingnow";
    level._id_78B9["launchfacility_a_marine3_teamin"] = "launchfacility_a_gm3_teaminside";
    level._id_78B9["launchfacility_a_gm3_rapellingnow"] = "launchfacility_a_gm3_rapellingnow";
    level.launchfacility_a_price_bmp_nag_max = 8;
    level.launchfacility_a_price_bmp_nag_number = randomintrange( 1, level.launchfacility_a_price_bmp_nag_max + 1 );
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_01"] = "launchfacility_a_us_lead_c4chargebmp";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_02"] = "launchfacility_a_us_lead_takeoutbmp";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_03"] = "launchfacility_a_pri_pinneddown";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_04"] = "launchfacility_a_sas1_killingus";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_05"] = "launchfacility_a_pri_c4onarmor";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_06"] = "launchfacility_a_pri_findrpg";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_07"] = "launchfacility_a_grg_bulletsgrenades";
    level._id_78BA["frnd"]["launchfacility_a_price_bmp_nag_08"] = "launchfacility_a_grg_getclose";
    level.launchfacility_a_price_ropenag_max = 6;
    level.launchfacility_a_price_ropenag_number = randomintrange( 1, level.launchfacility_a_price_ropenag_max + 1 );
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_01"] = "launchfacility_a_us_lead_hookupgo";
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_02"] = "launchfacility_a_pri_hookupmidvent";
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_03"] = "launchfacility_a_pri_letsmovemidvent";
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_04"] = "launchfacility_a_pri_overhere";
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_05"] = "launchfacility_a_pri_hookupsecvent";
    level._id_78BA["frnd"]["launchfacility_a_price_ropenag_06"] = "launch_a_gaz_downvents";
    level._id_78B9["launchfacility_a_sas2_bloodyhell"] = "launchfacility_a_sas2_bloodyhell";
    level._id_78B9["launchfacility_a_price_inside_facility"] = "launchfacility_a_us_lead_okwerein";
    level.dialoguesniperconfirm_max = 6;
    level.dialoguesniperconfirm_number = randomintrange( 1, level.dialoguesniperconfirm_max + 1 );
    level._id_78B9["launchfacility_a_sniper_confirm_01"] = "launchfacility_a_sn1_gothim";
    level._id_78B9["launchfacility_a_sniper_confirm_02"] = "launchfacility_a_sn1_gotyourback";
    level._id_78B9["launchfacility_a_sniper_confirm_03"] = "launchfacility_a_sn1_thatsakill";
    level._id_78B9["launchfacility_a_sniper_confirm_04"] = "launchfacility_a_sn2_targetdown";
    level._id_78B9["launchfacility_a_sniper_confirm_05"] = "launchfacility_a_sn2_keepyoucovered";
    level._id_78B9["launchfacility_a_sniper_confirm_06"] = "launchfacility_a_sn2_confirmed";
    level.dialoguegatehint_max = 9;
    level.dialoguegatehint_number = randomintrange( 1, level.dialoguegatehint_max + 1 );
    level._id_78B9["launchfacility_a_gate_hint_01"] = "launchfacility_a_gm1_gateblocked";
    level._id_78B9["launchfacility_a_gate_hint_02"] = "launchfacility_a_gm1_gateblocked";
    level._id_78B9["launchfacility_a_gate_hint_03"] = "launchfacility_a_gm1_headright";
    level._id_78B9["launchfacility_a_gate_hint_04"] = "launchfacility_a_sas1_headright";
    level._id_78B9["launchfacility_a_gate_hint_05"] = "launchfacility_a_pri_uprightside";
    level._id_78B9["launchfacility_a_gate_hint_06"] = "launchfacility_a_gm1_wayisblocked";
    level._id_78B9["launchfacility_a_gate_hint_07"] = "launchfacility_a_sas1_leftblocked";
    level._id_78B9["launchfacility_a_gate_hint_08"] = "launchfacility_a_pri_throughgate";
    level._id_78B9["launchfacility_a_gate_hint_09"] = "launchfacility_a_pri_leftgateblocked";
    level.dialoguerpghit_max = 2;
    level.dialoguerpghit_number = randomintrange( 1, level.dialoguerpghit_max + 1 );
    level._id_78B9["launchfacility_a_rpg_hit_01"] = "launchfacility_a_gm2_thatsahit";
    level._id_78B9["launchfacility_a_rpg_hit_02"] = "launchfacility_a_gm3_hitagain";
    level.dialoguerpggoodshot_max = 4;
    level.dialoguerpggoodshot_number = randomintrange( 1, level.dialoguerpghit_max + 1 );
    level._id_78B9["launchfacility_a_rpg_kill_01"] = "launchfacility_a_gm1_nicework";
    level._id_78B9["launchfacility_a_rpg_kill_02"] = "launchfacility_a_gm2_bmpshistory";
    level._id_78B9["launchfacility_a_rpg_kill_03"] = "launch_a_gaz_goodshot";
    level._id_78B9["launchfacility_a_rpg_kill_04"] = "launch_a_gaz_niceone";
    level.dialoguejavelingoodshot_max = 2;
    level.dialoguejavelingoodshot_number = randomintrange( 1, level.dialoguejavelingoodshot_max + 1 );
    level._id_78B9["launchfacility_a_javelin_kill_01"] = "launchfacility_a_gm3_hellyeah";
    level._id_78B9["launchfacility_a_javelin_kill_02"] = "launchfacility_a_gm3_fniceshot";
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("player");

_id_6BD0()
{
    level._id_78AC["player_rappel"]["rappel"] = %launchfacility_a_player_rappel;
    level._id_78B1["player_rappel"] = #animtree;
    level._id_78B5["player_rappel"] = "worldbody_h1_sas_woodland";
    maps\_anim::addnotetrack_animsound( "player_rappel", "rappel", "start", "rappel_liftrope_clipin_npc" );
}
#using_animtree("script_model");

_id_7A3D()
{
    precachemodel( "rappelrope100_le" );
    level._id_78AC["player_rope"]["rappel_for_player_start"] = %launchfacility_a_player_rappel_100ft_rope;
    level._id_78AC["player_rope"]["rappel_idle_for_player"][0] = %launchfacility_a_player_rappel_idle_100ft_rope;
    level._id_78AC["player_rope"]["rappel_for_player"] = %launchfacility_a_player_rappel_100ft_rope;
    level._id_78B1["player_rope"] = #animtree;
    level._id_78B5["player_rope"] = "rappelrope100_le";
    precachemodel( "rappelrope100_ri" );
    level._id_78B1["rope"] = #animtree;
    level._id_78B5["rope"] = "rappelrope100_ri";
    level._id_78AC["rope"]["rappel_setup_start"] = %launchfacility_a_setup_2_rappel_1_100ft_rope;
    level._id_78AC["rope"]["rappel_setup_to_stand_1"] = %launchfacility_a_setup_2_rappel_1_100ft_rope;
    level._id_78AC["rope"]["rappel_setup_to_stand_2"] = %launchfacility_a_setup_2_rappel_2_100ft_rope;
    level._id_78AC["rope"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1_100ft_rope;
    level._id_78AC["rope"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2_100ft_rope;
    level._id_78AC["rope"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3_100ft_rope;
    level._id_78AC["rope"]["rappel_drop"] = %launchfacility_a_rappel_1_100ft_rope;
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_wall_breach_truck0_anim"] = %h1_wall_breach_truck0_anim;
    level._id_78AC["exploder_script_model"]["h1_wall_breach_truck1_anim"] = %h1_wall_breach_truck1_anim;
    level._id_78AC["exploder_script_model"]["h1_wall_breach_truck2_anim"] = %h1_wall_breach_truck2_anim;
    level._id_78AC["exploder_script_model"]["h1_launchfacility_a_gate_broken_anim"] = %h1_launchfacility_a_gate_broken_anim;
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
