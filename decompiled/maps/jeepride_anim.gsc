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
    main_anim();
    animated_palm_trees_setup();
}
#using_animtree("generic_human");

main_anim()
{
    level._id_78BA["price"]["stand_down"] = "armada_pri_allteamsstanddown";
    level._id_78BA["price"]["roger_hq"] = "armada_pri_rogerhq";
    level._id_78BA["price"]["heads_up"] = "armada_pri_headsup";
    level._id_78BA["generic"]["tvstation"] = "armada_gm1_tvstation";
    level._id_78BA["generic"]["breaching_breaching"] = "armada_gm1_breachingbreaching";
    level._id_78BA["price"]["jeepride_pri_helistatus"] = "jeepride_pri_helistatus";
    level._id_78BA["price"]["jeepride_pri_notgood"] = "jeepride_pri_notgood";
    level._id_78BA["price"]["jeepride_pri_lockandload"] = "jeepride_pri_lockandload";
    level._id_78BA["price"]["jeepride_pri_bmprear"] = "jeepride_pri_bmprear";
    level._id_78BA["price"]["jeepride_pri_bmpright"] = "jeepride_pri_bmpright";
    level._id_78BA["price"]["jeepride_pri_bmpleft"] = "jeepride_pri_bmpleft";
    level._id_78BA["price"]["jeepride_pri_bmpfront"] = "jeepride_pri_bmpfront";
    level._id_78BA["price"]["jeepride_pri_hind6oclock"] = "jeepride_pri_hind6oclock";
    level._id_78BA["price"]["jeepride_pri_hind9oclock"] = "jeepride_pri_hind9oclock";
    level._id_78BA["price"]["jeepride_pri_hind3oclock"] = "jeepride_pri_hind3oclock";
    level._id_78BA["price"]["jeepride_pri_hinddeadahead"] = "jeepride_pri_hinddeadahead";
    level._id_78BA["price"]["jeepride_pri_grabrpg"] = "jeepride_pri_grabrpg";
    level._id_78BA["price"]["jeepride_pri_letsgetfire"] = "jeepride_pri_letsgetfire";
    level._id_78BA["price"]["jeepride_pri_openfire"] = "jeepride_pri_openfire";
    level._id_78BA["price"]["jeepride_pri_takehimout"] = "jeepride_pri_takehimout";
    level._id_78BA["price"]["jeepride_pri_firefire"] = "jeepride_pri_firefire";
    level._id_78BA["price"]["jeepride_pri_takehimdown"] = "jeepride_pri_takehimdown";
    level._id_78BA["price"]["jeepride_pri_company"] = "jeepride_pri_company";
    level._id_78BA["price"]["jeepride_pri_truckleft"] = "jeepride_pri_truckleft";
    level._id_78BA["price"]["jeepride_pri_truckright"] = "jeepride_pri_truckright";
    level._id_78BA["price"]["jeepride_pri_truck12oclock"] = "jeepride_pri_truck12oclock";
    level._id_78BA["price"]["jeepride_pri_getoffyour"] = "jeepride_pri_getoffyour";
    level._id_78BA["price"]["jeepride_pri_fireontruck"] = "jeepride_pri_fireontruck";
    level._id_78BA["price"]["jeepride_pri_shootthattruck"] = "jeepride_pri_shootthattruck";
    level._id_78BA["price"]["jeepride_pri_goodshot"] = "jeepride_pri_goodshot";
    level._id_78BA["price"]["jeepride_pri_wegothim"] = "jeepride_pri_wegothim";
    level._id_78BA["price"]["jeepride_pri_damaged"] = "jeepride_pri_damaged";
    level._id_78BA["price"]["jeepride_pri_watchyour6"] = "jeepride_pri_watchyour6";
    level._id_78BA["price"]["jeepride_pri_coverfront"] = "jeepride_pri_coverfront";
    level._id_78BA["price"]["jeepride_pri_coverflanks"] = "jeepride_pri_coverflanks";
    level._id_78BA["price"]["jeepride_pri_coverrear"] = "jeepride_pri_coverrear";
    level._id_78BA["price"]["jeepride_pri_buggered"] = "jeepride_pri_buggered";
    level._id_78BA["price"]["jeepride_pri_sitreponhelis"] = "jeepride_pri_sitreponhelis";
    level._id_78BA["price"]["jeepride_pri_thebridge"] = "jeepride_pri_thebridge";
    level._id_78BA["friendguy"]["jeepride_gaz_boxingin"] = "jeepride_gaz_boxingin";
    level._id_78BA["friendguy"]["jeepride_gaz_takecareofit"] = "jeepride_gaz_takecareofit";
    level._id_78BA["hq"]["jeepride_hqr_griggsisnthere"] = "jeepride_hqr_griggsisnthere";
    level._id_78BA["griggs"]["jeepride_grg_hangon"] = "jeepride_grg_hangon";
    level._id_78BA["griggs"]["jeepride_grg_bmpbehind"] = "jeepride_grg_bmpbehind";
    level._id_78BA["griggs"]["jeepride_grg_bmpright"] = "jeepride_grg_bmpright";
    level._id_78BA["griggs"]["jeepride_grg_bmpleft"] = "jeepride_grg_bmpleft";
    level._id_78BA["griggs"]["jeepride_grg_bmp12oclock"] = "jeepride_grg_bmp12oclock";
    level._id_78BA["griggs"]["jeepride_grg_hindbehind"] = "jeepride_grg_hindbehind";
    level._id_78BA["griggs"]["jeepride_grg_hind9oclock"] = "jeepride_grg_hind9oclock";
    level._id_78BA["griggs"]["jeepride_grg_hind3oclock"] = "jeepride_grg_hind3oclock";
    level._id_78BA["griggs"]["jeepride_grg_hind12oclock"] = "jeepride_grg_hind12oclock";
    level._id_78BA["griggs"]["jeepride_grg_rpgfirehind"] = "jeepride_grg_rpgfirehind";
    level._id_78BA["griggs"]["jeepride_grg_hithelicopter"] = "jeepride_grg_hithelicopter";
    level._id_78BA["griggs"]["jeepride_grg_rpgontruck"] = "jeepride_grg_rpgontruck";
    level._id_78BA["griggs"]["jeepride_grg_takemout"] = "jeepride_grg_takemout";
    level._id_78BA["griggs"]["jeepride_grg_anotherrpg"] = "jeepride_grg_anotherrpg";
    level._id_78BA["griggs"]["jeepride_grg_hostilerpg"] = "jeepride_grg_hostilerpg";
    level._id_78BA["griggs"]["jeepride_grg_truck6oclock"] = "jeepride_grg_truck6oclock";
    level._id_78BA["griggs"]["jeepride_grg_truck3oclock"] = "jeepride_grg_truck3oclock";
    level._id_78BA["griggs"]["jeepride_grg_truck9oclock"] = "jeepride_grg_truck9oclock";
    level._id_78BA["griggs"]["jeepride_grg_truckdeadahead"] = "jeepride_grg_truckdeadahead";
    level._id_78BA["griggs"]["jeepride_grg_killfirm"] = "jeepride_grg_killfirm";
    level._id_78BA["griggs"]["jeepride_grg_niceshootin"] = "jeepride_grg_niceshootin";
    level._id_78BA["griggs"]["jeepride_grg_success"] = "jeepride_grg_success";
    level._id_78BA["griggs"]["jeepride_grg_thatsahit"] = "jeepride_grg_thatsahit";
    level._id_78BA["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level._id_78BA["griggs"]["jeepride_grg_bouttocollapse"] = "jeepride_grg_bouttocollapse";
    level._id_78BA["griggs"]["jeepride_grg_tankabouttoblow"] = "jeepride_grg_tankabouttoblow";
    level._id_78BA["griggs"]["jeepride_grg_takeoutbridge"] = "jeepride_grg_takeoutbridge";
    level._id_78BA["gaz"]["jeepride_gaz_heavyattackbridge"] = "jeepride_gaz_heavyattackbridge";
    level._id_78BA["gaz"]["jeepride_gaz_uselesswanker"] = "jeepride_gaz_uselesswanker";
    level._id_78BA["gaz"]["jeepride_gaz_wereonourown"] = "jeepride_gaz_wereonourown";
    level._id_78BA["gaz"]["jeepride_gaz_goodtohear"] = "jeepride_gaz_goodtohear";
    level._id_78BA["gaz"]["jeepride_gaz_goodenough"] = "jeepride_gaz_goodenough";
    level._id_78BA["gaz"]["jeepride_gaz_stopbloodytruck"] = "jeepride_gaz_stopbloodytruck";
    level._id_78BA["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level._id_78BA["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level._id_78AC["price"]["jeepride_ending_price01"] = %jeepride_ending_price;
    level._id_78AC["price"]["jeepride_ending_price02"] = %jeepride_ending_price;
    level._id_78AC["price"]["wave_player_over"] = %h1_jeepride_bridgecollapse_price;
    maps\_anim::_id_0805( "price", "jeepride_ending_price02", "scn_price_throw_colt_to_player", "scn_price_throw_colt_to_player" );
    level._id_78AC["medic"]["jeepride_CPR_medic"] = %jeepride_cpr_medic;
    level._id_78AC["price"]["jeepride_CPR_price"] = %jeepride_cpr_price;
    level._id_78B1["price"] = #animtree;
    level._id_78AC["griggs"]["drag_player"] = %jeepride_drag_grigsby;
    level._id_78AC["price"]["drag_player"] = %jeepride_ending_price;
    level._id_78B1["griggs"] = #animtree;
    maps\_anim::_id_0807( "griggs", "drop_pistol", ::drop_pistol );
    maps\_anim::_id_0807( "griggs", "fire", maps\jeepride::shoot_loc );
    maps\_anim::_id_0807( "griggs", "scripted_weaponswitch", ::scripted_weaponswitch );
    maps\_anim::_id_0807( "griggs", "brain_splatter", maps\jeepride_code::shot_in_the_head );
    maps\_anim::_id_0807( "griggs", "brain_splatter_sfx", ::play_griggs_brain_splatter_sfx, "drag_player" );
    maps\_anim::_id_0807( "griggs", "fire", ::play_griggs_custom_fire_sfx, "drag_player" );
    maps\_anim::_id_0813( "vehicles", "start_cabin_fire", "bettle_Crash", "fire_crash_jeepride", "tag_deathfx" );
    maps\_anim::_id_0813( "vehicles", "explosion_02", "bettle_Crash", "vehicle_explosion_generic", "tag_deathfx" );
    maps\_anim::_id_0807( "griggs", "scn_griggs_drag_colt_empty", ::play_griggs_custom_fire_empty_sfx, "drag_player" );
    level._id_78AC["zakhaev"]["end_scene_01"] = %jeepride_zak_approach;
    level._id_78AC["zakhaev_buddy1"]["end_scene_01"] = %jeepride_lguy_approach;
    level._id_78AC["zakhaev_buddy2"]["end_scene_01"] = %jeepride_rguy_approach;
    level._id_78AC["end_friend_1"]["end_scene_01"] = %jeepride_dying_approach;
    level._id_78AC["end_friend_2"]["intopain"] = %dying_stand_2_crawl_v1;
    level._id_78AC["end_friend_3"]["intopain"] = %dying_stand_2_back_v3;
    level._id_78AC["end_friend_2"]["pain_pose"] = %dying_crawl_death_v1;
    level._id_78AC["end_friend_2"]["pain_loop"][0] = %h1_jeepride_ending_dyingsoldier;
    level._id_78AC["end_friend_3"]["pain_loop"][0] = %jeepride_dying_back_idle;
    level._id_78AC["end_friend_3"]["pain_loop"][1] = %jeepride_dying_back_idle;
    level._id_78AC["ru1"]["player_pickup"] = %jeepride_player_pickup_guy1;
    level._id_78AC["ru2"]["player_pickup"] = %jeepride_player_pickup_guy2;
    maps\_anim::_id_080B( "ru2", "dialog", "player_pickup", "jeepride_ru2_allrightmyfriend" );
    maps\_anim::_id_080B( "ru2", "dialog", "player_pickup", "jeepride_ru2_gethimoutofhere" );
    maps\_anim::_id_0812( "ru1", "scn_jeepride_player_pickup_guy1_foley", "player_pickup", "scn_jeepride_player_pickup_guy1_foley" );
    maps\_anim::_id_0812( "ru2", "scn_jeepride_player_pickup_guy2_foley", "player_pickup", "scn_jeepride_player_pickup_guy2_foley" );
    level._id_78AC["zakhaev"]["end_scene_02"] = %jeepride_zak_end;
    level._id_78AC["zakhaev_buddy1"]["end_scene_02"] = %jeepride_lguy_end;
    level._id_78AC["zakhaev_buddy2"]["end_scene_02"] = %jeepride_rguy_end;
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
    level._id_78AC["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["patrol_jog"] = %patrol_jog;
    level._id_78AC["generic"]["combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["patrol_jog_turn180"] = %patrol_jog_360;
    level._id_78AC["generic"]["stealth_jog"] = %patrol_jog;
    level._id_78AC["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["price"]["rpgfromgriggs_price"] = %h1_jeepride_rpgfromgriggs_price;
    level._id_78AC["generic"]["rpgfromgriggs_price_idle"] = %uaz_lguy_idle_hide;
    level._id_78AC["griggs"]["rpgfromgriggs_griggs"] = %h1_jeepride_rpgfromgriggs_griggs;
    level._id_78AC["generic"]["rpgfromgriggs_griggs_idle"] = %uaz_rguy_idle;
    maps\_anim::_id_0807( "griggs", "drop_rpg", maps\jeepride::remove_rpg_models, "rpgfromgriggs_griggs" );
    _id_9C8B();
    _id_6A5B();
    thread cliff_collapse_anim();
    bridge_animation();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

scripted_weaponswitch( var_0 )
{
    var_0 attach( "weapon_saw", "tag_weapon_right" );
    var_0.scriptedweapon = "saw";
}

drop_pistol( var_0 )
{
    var_1 = "tag_weapon_right";
    var_2 = var_0 gettagorigin( var_1 );
    wait 0.2;
    var_3 = spawn( "script_model", var_0 gettagorigin( var_1 ) );
    var_3 setmodel( "weapon_colt1911_white" );
    var_3.angles = var_0 gettagorigin( var_1 );
    var_3 physicslaunch( var_3.origin + ( 0.0, 0.0, 0.0 ), maps\_utility::vector_multiply( var_3.origin - var_2, 25 ) );
}

play_griggs_brain_splatter_sfx( var_0 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_griggs_shot_in_the_head", "TAG_EYE" );
}

play_griggs_custom_fire_sfx( var_0 )
{
    if ( isdefined( var_0.scriptedweapon ) && var_0.scriptedweapon == "wpn_h1_pst_m1911_vm" )
        var_0.scriptedweaponmodel thread maps\_utility::_id_69C5( "scn_griggs_drag_colt_shot", "TAG_FLASH" );
    else
        var_0 thread maps\_utility::_id_69C5( "scn_griggs_drag_saw_shot", "TAG_FLASH" );
}

play_griggs_custom_fire_empty_sfx( var_0 )
{
    var_0.scriptedweaponmodel thread maps\_utility::_id_69C5( "scn_griggs_drag_colt_empty", "TAG_FLASH" );
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78AC["playerview"]["drag_player"] = %jeepride_drag_player;
    level._id_78AC["playerview"]["player_pickup"] = %jeepride_player_pickup_player;
    level._id_78AC["playerview"]["drag_player_wait"] = %h1_jeepride_drag_player_wait;
    level._id_78B5["playerview"] = "worldbody_h1_sas_woodland_nopistol";
    level._id_78B1["playerview"] = #animtree;
    level._id_78AC["playerview"]["player_bridge"] = %h1_jeepride_bridgeexplosion_wakeup;
    level._id_78AC["playerview"]["player_bridgeexplosion"] = %h1_jeepride_beforeexplosion_player;
    level._id_78AC["playerview"]["player_bridge_mantle"] = %h1_jeepride_bridgecollapse_mantle;
}
#using_animtree("vehicles");

_id_9C8B()
{
    level._id_78AC["mi28"]["end_scene_01"] = %jeepride_mi28_flyby;
    level._id_78B1["mi28"] = #animtree;
    level.jeepride_crash_model = [];
    level.jeepride_crash_anim["Jeepride_crash_tunnel_pickup"] = %jeepride_crash_pillar;
    level.jeepride_crash_model["Jeepride_crash_tunnel_pickup"] = "vehicle_pickup_tankcrush";
    level.jeepride_crash_animtree["Jeepride_crash_tunnel_pickup"] = #animtree;
    level.jeepride_crash_anim["Jeepride_crash_tunnel_pickup2"] = %jeepride_flip_pickup;
    level.jeepride_crash_model["Jeepride_crash_tunnel_pickup2"] = "vehicle_pickup_4door";
    level.jeepride_crash_animtree["Jeepride_crash_tunnel_pickup2"] = #animtree;
    level._id_78B1["vehicles"] = #animtree;
    level._id_78AC["vehicles"]["crossroad_crash"] = %h1_jeepride_truck_crash_woodbeam;
    level._id_78AC["vehicles"]["truck_tanker_crash"] = %h1_jeepride_truck_crash_tanker_bm21;
    level._id_78AC["vehicles"]["tanker_tanker_crash"] = %h1_jeepride_truck_crash_tanker_tanker;
    level._id_78AC["vehicles"]["tunnel_crash_truck01"] = %h1_jeepride_truck_crash_tunnel_truck01;
    level._id_78AC["vehicles"]["tunnel_crash_truck02"] = %h1_jeepride_truck_crash_tunnel_truck02;
    level._id_78AC["vehicles"]["drift_01"] = %h1_jeepride_civillian_car_drift01;
    level._id_78AC["vehicles"]["three_crash"] = %h1_civilian_car_treecrash;
    level._id_78AC["vehicles"]["heli_crash"] = %h1_jeepride_crashheli_ending;
    level._id_78AC["vehicles"]["bettle_Crash"] = %h1_civilian_beetle_explosion;
    level._id_78AC["vehicles"]["rock_Crash"] = %h1_civilian_pickup_rockcrash;
    level._id_78AC["vehicles"]["concrete_Crash"] = %h1_civilian_pickup_concretecrash;
    maps\_anim::_id_0807( "vehicles", "scripted_sfx", maps\jeepride_aud::crossroad_crash, "crossroad_crash" );
    maps\_anim::_id_0807( "vehicles", "explosion_end", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "crossroad_crash", "scn_bm21_explode" );
    maps\_anim::_id_0807( "vehicles", "scripted_sfx", maps\jeepride_aud::truck_tanker_crash, "truck_tanker_crash" );
    maps\_anim::_id_0807( "vehicles", "explosion_end_FX", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "truck_tanker_crash", "scn_bm21_explode" );
    maps\_anim::_id_0807( "vehicles", "scripted_sfx", maps\jeepride_aud::tanker_tanker_crash, "tanker_tanker_crash" );
    maps\_anim::_id_0807( "vehicles", "scripted_sfx", maps\jeepride_aud::tunnel_crash_truck01, "tunnel_crash_truck01" );
    maps\_anim::_id_0807( "vehicles", "explosion_fx", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "tunnel_crash_truck01", "scn_bm21_explode" );
    maps\_anim::_id_0807( "vehicles", "scripted_sfx", maps\jeepride_aud::tunnel_crash_truck02, "tunnel_crash_truck02" );
    maps\_anim::_id_0813( "vehicles", "hit_three_crash", "three_crash", "sedan_impact_civilian_treecrash", "rear_door_left_jnt" );
    maps\_anim::_id_0813( "vehicles", "rock_hit", "rock_Crash", "pickuptruck_civilian_rockcrash", "door_open_r2_jnt" );
    maps\_anim::_id_0813( "vehicles", "HitConcrete", "crossroad_crash", "offroad_truck_tire_hit_concrete", "tag_wheel_front_left" );
    maps\_anim::_id_0813( "vehicles", "impact_water", "crossroad_crash", "offroad_truck_hit_water", "tag_wheel_front_left" );
    maps\_anim::_id_0813( "vehicles", "explosion_end", "crossroad_crash", "offroad_truck_explosion", "tag_wheel_front_left" );
    maps\_anim::_id_080C( "vehicles", "explosion_fx", "tunnel_explosion_fx_flag", "tunnel_crash_truck01" );
    maps\_anim::_id_0813( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_leak_jeepride", "tag_fx_top_ladder" );
    maps\_anim::_id_0813( "vehicles", "HitRock", "truck_tanker_crash", "jeep_tire_hit_cliff", "tag_wheel_front_right" );
    maps\_anim::_id_0813( "vehicles", "HitTanker_FX", "truck_tanker_crash", "jeep_tire_hit_tanker", "tag_parkinglight_left_f" );
    maps\_anim::_id_0813( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side1" );
    maps\_anim::_id_0813( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side2" );
    maps\_anim::_id_0813( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side3" );
    maps\_anim::_id_0813( "vehicles", "explosion_end_FX", "truck_tanker_crash", "tanker_truck_explosion_end", "tag_wheel_middle_right" );
    maps\_anim::_id_0813( "vehicles", "hit_concrete", "concrete_Crash", "pickuptruck_civilian_concretecrash", "tag_headlight_right" );
    maps\_anim::_id_0807( "vehicles", "HitFence", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "crossroad_crash" );
    maps\_anim::_id_0807( "vehicles", "HitWall", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "tunnel_crash_truck01" );
    maps\_anim::_id_0807( "vehicles", "Flip", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "tunnel_crash_truck02" );
    maps\_anim::_id_0807( "vehicles", "HitTanker", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "truck_tanker_crash" );
    level._id_78B3["vehicles"]["crossroad_crash"] = 0;
    level._id_78B3["vehicles"]["tunnel_crash_truck01"] = 0;
    level._id_78B3["vehicles"]["tunnel_crash_truck02"] = 0;
    level._id_78B3["vehicles"]["truck_tanker_crash"] = 0;
    level._id_78B3["vehicles"]["tanker_tanker_crash"] = 0;
    maps\_anim::_id_0807( "vehicles", "sparks_on", maps\jeepride_code::anim_spark_on );
    maps\_anim::_id_0807( "vehicles", "sparks_off", maps\jeepride_code::anim_spark_off );
    precache_crash_models();
}

precache_crash_models()
{
    if ( !isdefined( level.jeepride_crash_model ) )
        return;

    var_0 = getarraykeys( level.jeepride_crash_model );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachemodel( level.jeepride_crash_model[var_0[var_1]] );
}
#using_animtree("generic_human");

uaz_overrides()
{
    var_0 = vehicle_scripts\_uaz::_id_7F23();
    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_guy0";
    var_0[3]._id_85AE = "tag_guy1";
    var_0[4]._id_85AE = "tag_guy2";
    var_0[5]._id_85AE = "tag_guy3";
    var_0[0]._id_4B63 = %uaz_driver_idle;
    var_0[1]._id_4B63 = %uaz_rguy_idle;
    var_0[2]._id_4068 = %uaz_driver_exit_into_run;
    var_0[3]._id_4068 = %uaz_passenger_exit_into_run;
    var_0[2]._id_4B63 = [];
    var_0[2]._id_4B63[0] = %uaz_lguy_idle_hide;
    var_0[2]._id_4B63[1] = %uaz_lguy_idle_react;
    var_0[2]._id_4B7E[0] = 1000;
    var_0[2]._id_4B7E[1] = 100;
    var_0[3]._id_4B63 = %uaz_rguy_idle;
    var_0[4]._id_4B63 = undefined;
    var_0[5]._id_4B63 = undefined;
    var_0[2].hidetoback = %uaz_lguy_trans_hide2back;
    var_0[2].back_attack = %uaz_lguy_fire_back;
    var_0[2].backtohide = %uaz_lguy_trans_back2hide;
    var_0[2].hide_attack_forward = %uaz_lguy_fire_hide_forward;
    var_0[2].hide_attack_left[0] = %uaz_lguy_fire_side_v1;
    var_0[2].hide_attack_left[1] = %uaz_lguy_fire_side_v2;
    var_0[2].hide_attack_left_occurrence[0] = 500;
    var_0[2].hide_attack_left_occurrence[1] = 500;
    var_0[2].hide_attack_left_standing[0] = %uaz_lguy_standfire_side_v3;
    var_0[2].hide_attack_left_standing[1] = %uaz_lguy_standfire_side_v4;
    var_0[2].hide_attack_left_standing_occurrence[0] = 100;
    var_0[2].hide_attack_left_standing_occurrence[1] = 100;
    var_0[2].hide_attack_back[0] = %uaz_lguy_fire_hide_back_v1;
    var_0[2].hide_attack_back[1] = %uaz_lguy_fire_hide_back_v2;
    var_0[2].hide_attack_back_occurrence[0] = 500;
    var_0[2].hide_attack_back_occurrence[1] = 500;
    var_0[2].react = %uaz_lguy_idle_react;
    var_0[1].hide_attack_back[0] = %uaz_rguy_fire_back_v2;
    var_0[1].hide_attack_back[1] = %uaz_rguy_fire_back_v1;
    var_0[1].hide_attack_back_occurrence[0] = 500;
    var_0[1].hide_attack_back_occurrence[1] = 500;
    var_0[1].hide_attack_left[0] = %h1_uaz_rguy_fire_side_v1_l;
    var_0[1].hide_attack_left[1] = %h1_uaz_rguy_fire_side_v2_l;
    var_0[1].hide_attack_left_occurrence[0] = 500;
    var_0[1].hide_attack_left_occurrence[1] = 500;
    var_0[0]._id_2FB6 = %uaz_driver_duck;
    var_0[0]._id_9925 = %uaz_driver_turnright;
    var_0[0]._id_990B = %uaz_driver_turnleft;
    var_0[0]._id_A2F7 = %uaz_driver_weave;
    return var_0;
}
#using_animtree("vehicles");

override_roto_anim()
{
    self endon( "death" );
    var_0 = getanimlength( %mi28_rotors_add );

    for (;;)
    {
        self _meth_814d( %mi28_rotors_add, 1, 0.2, 1 );
        wait(var_0);
    }
}

uaz_override_vehicle( var_0 )
{
    var_0 = vehicle_scripts\_uaz::_id_7EFA( var_0 );
    var_0[0]._id_9CE4 = %uaz_steeringwheel_idle;
    var_0[0]._id_9CBE = %uaz_steeringwheel_duck;
    var_0[0]._id_9D5C = %uaz_steeringwheel_turnleft;
    var_0[0]._id_9D5D = %uaz_steeringwheel_turnright;
    var_0[0]._id_9D6C = %uaz_steeringwheel_weave;
    var_0[2]._id_9CD5 = %uaz_rear_driver_exit_into_run_door;
    var_0[3]._id_9CD5 = %uaz_passenger2_exit_into_run_door;
    return var_0;
}
#using_animtree("animated_props");

bridge_animation()
{
    level._id_78B1["bridge_collapse"] = #animtree;
    level._id_78AC["bridge_collapse"]["bridge_collapsing"] = %h1_jeepride_bridgecollapse;
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_01", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "01" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_02", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "02" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_03", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "03" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_04", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "04" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_05", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "05" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_06", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "06" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_07", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "07" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_08", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "08" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_09", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "09" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_10", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "10" );
    maps\_anim::_id_0807( "bridge_collapse", "scn_bridge_collapse_11", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "11" );
    maps\_anim::_id_0807( "bridge_collapse", "vfx_vehicle_build_up", maps\jeepride::play_bridge_vehicle_collapse_vfx, "bridge_collapsing" );
    maps\_anim::_id_0813( "bridge_collapse", "vfx_vehicle_explosion", "bridge_collapsing", "bridge_small_exp_cin", "tag_fx_wagon_explosion_1" );

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        maps\_anim::_id_0807( "bridge_collapse", "vfx_wagon_spark_on_" + var_0, maps\jeepride::play_bridge_wagon_spark_vfx, "bridge_collapsing", var_0 );
        maps\_anim::_id_0807( "bridge_collapse", "vfx_wagon_spark_off_" + var_0, maps\jeepride::stop_bridge_wagon_spark_vfx, "bridge_collapsing", var_0 );
    }

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        maps\_anim::_id_0807( "bridge_collapse", "vfx_uaz_spark_on_" + var_0, maps\jeepride::play_bridge_uaz_spark_vfx, "bridge_collapsing", var_0 );
        maps\_anim::_id_0807( "bridge_collapse", "vfx_uaz_spark_off_" + var_0, maps\jeepride::stop_bridge_uaz_spark_vfx, "bridge_collapsing", var_0 );
    }

    for ( var_0 = 1; var_0 <= 14; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_falling_dust_" + var_0, "bridge_collapsing", "bridge_collapse_dust", "tag_fx_falling_dust_" + var_0 );

    for ( var_0 = 1; var_0 <= 17; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_falling_dust_os_" + var_0, "bridge_collapsing", "bridge_collapse_dust_os", "tag_fx_falling_dust_os_" + var_0 );

    for ( var_0 = 1; var_0 <= 14; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_stone_impact_" + var_0, "bridge_collapsing", "bridge_collapse_stone_impact", "tag_fx_stone_impact_" + var_0 );

    for ( var_0 = 1; var_0 <= 3; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_stone_detach_" + var_0, "bridge_collapsing", "bridge_collapse_stone_detach", "tag_fx_stone_detach_" + var_0 );

    for ( var_0 = 1; var_0 <= 2; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_frame_spark_" + var_0, "bridge_collapsing", "bridge_collapse_spark", "tag_fx_frame_spark_" + var_0 );

    for ( var_0 = 1; var_0 <= 2; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_frame_impact_" + var_0, "bridge_collapsing", "bridge_collapse_frame_hit", "tag_fx_frame_impact_" + var_0 );

    for ( var_0 = 1; var_0 <= 7; var_0++ )
        maps\_anim::_id_0813( "bridge_collapse", "vfx_dust_ambient_" + var_0, "bridge_collapsing", "bridge_leftovers_2", "tag_fx_dust_ambient_" + var_0 );

    level._id_78B1["rpgfromgriggs"] = #animtree;
    level._id_78AC["rpgfromgriggs"]["rpgfromgriggs_rpg"] = %h1_jeepride_rpgfromgriggs_rpg;
    level._id_78B1["pistol_griggs"] = #animtree;
    level._id_78AC["pistol_griggs"]["drag_pistol"] = %h1_jeepride_drag_pistol;
}
#using_animtree("script_model");

cliff_collapse_anim()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_jeepride_cliff_collapse_1_anim"] = %h1_jeepride_cliff_collapse_1_anim;
    level._id_78AC["exploder_script_model"]["h1_jeepride_cliff_collapse_2_anim"] = %h1_jeepride_cliff_collapse_2_anim;
    level._id_78AC["exploder_script_model"]["h1_jeepride_cliff_collapse_3_anim"] = %h1_jeepride_cliff_collapse_3_anim;
    level._id_78AC["exploder_script_model"]["h1_jeepride_cliff_collapse_4_anim"] = %h1_jeepride_cliff_collapse_4_anim;
    level._id_78AC["exploder_script_model"]["h1_jeepride_cliff_collapse_5_anim"] = %h1_jeepride_cliff_collapse_5_anim;
}
#using_animtree("animated_props");

animated_palm_trees_setup()
{
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["still"] = %foliage_sequoia_cut_12_still;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["strong"] = %foliage_sequoia_cut_12_sway;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["heli"] = %foliage_sequoia_cut_12_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["still"] = %jr_pine_01_still;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["strong"] = %jr_pine_01_sway;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["heli"] = %jr_pine_01_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["still"] = %jr_pine_02_still;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["strong"] = %jr_pine_02_sway;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["heli"] = %jr_pine_02_heliwash;
}
