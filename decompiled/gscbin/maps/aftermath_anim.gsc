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
    animated_model_setup();
    setup_exploder_anims();
    exploder_script_model_anims();
    deadbody__anims();
    player_body_sense();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["h1_aftermath_swing"]["idle"] = %h1_aftermath_swing_anim;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle1"] = %h1_aftermath_horse_rocking1;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle2"] = %h1_aftermath_horse_rocking2;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle3"] = %h1_aftermath_horse_rocking3;
    level.anim_prop_models["vehicle_bus_animated"]["still"] = %vehicle_animated_bus_still;
    level.anim_prop_models["vehicle_bus_animated"]["strong"] = %vehicle_animated_bus_sway;
}
#using_animtree("script_model");

exploder_script_model_anims()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm0_anim"] = %h1_aftermath_build_sm0_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm1_anim"] = %h1_aftermath_build_sm1_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm2_anim"] = %h1_aftermath_build_sm2_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm3_anim"] = %h1_aftermath_build_sm3_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm2_0_anim"] = %h1_aftermath_build_sm2_0_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm2_1_anim"] = %h1_aftermath_build_sm2_1_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm2_2_anim"] = %h1_aftermath_build_sm2_2_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_sm2_3_anim"] = %h1_aftermath_build_sm2_3_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_tall_0_anim"] = %h1_aftermath_build_tall_0_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_tall_1_anim"] = %h1_aftermath_build_tall_1_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_tall_2_anim"] = %h1_aftermath_build_tall_2_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_tall_3_anim"] = %h1_aftermath_build_tall_3_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_tall_4_anim"] = %h1_aftermath_build_tall_4_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_0_anim"] = %h1_aftermath_build_a_0_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_1_anim"] = %h1_aftermath_build_a_1_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_2_anim"] = %h1_aftermath_build_a_2_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_3_anim"] = %h1_aftermath_build_a_3_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_4_anim"] = %h1_aftermath_build_a_4_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_5_anim"] = %h1_aftermath_build_a_5_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_6_anim"] = %h1_aftermath_build_a_6_anim;
    level._id_78AC["exploder_script_model"]["h1_aftermath_build_a_7_anim"] = %h1_aftermath_build_a_7_anim;
}
#using_animtree("generic_human");

deadbody__anims()
{
    level._id_78AC["dead_guy"]["pelayo_dying"] = %h1_aftermath_dyingbodies_pelayo;
    level._id_78AC["dead_guy"]["soldierA_dying"] = %h1_aftermath_dyingbodies_soldiera;
    level._id_78AC["dead_guy"]["soldierB_dying"] = %h1_aftermath_dyingbodies_soldierb;
    _id_A510::_id_0805( "dead_guy", "pelayo_dying", "scn_dying_soldier_b", "h1_vo_female_dying_breath_02" );
    _id_A510::_id_0805( "dead_guy", "soldierB_dying", "scn_dyin_pelayo_dying", "h1_male_crew_helico_suffering_02" );
    _id_A510::_id_0805( "dead_guy", "soldierA_dying", "scn_dying_soldier_a", "h1_male_crew_helico_suffering_01" );
}
#using_animtree("player");

player_body_sense()
{
    precachemodel( "worldbody_h1_usmc_desert" );
    level._id_78AC["player_body"]["jackson_wakeup"] = %h1_aftermath_jackson_wakeup;
    level._id_78AC["player_body"]["jackson_helicopterfall"] = %h1_aftermath_jackson_helicopterfall;
    level._id_78AC["player_body"]["jackson_fall"] = %h1_aftermath_jackson_fall;
    level._id_78AC["player_body"]["jackson_death"] = %h1_aftermath_jackson_death;
    level._id_78B5["player_body"] = "worldbody_h1_usmc_desert";
    level._id_78B1["player_body"] = #animtree;
    _id_A510::_id_0805( "player_body", "jackson_death", "body_hit_ground", "bodyfall_gravel_large" );
}
