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
    building_destruction();
    level._id_78AC["civiliandriver_car1"]["idle"][0] = %jeep_driver_driving;
    level._id_78AC["civiliandriver_car2"]["idle"][0] = %jeep_driver_driving;
    level._id_78AC["civiliandriver_car1"]["stop"][0] = %rubicon_idle_driver;
    level._id_78AC["civiliandriver_car2"]["stop"][0] = %rubicon_idle_driver;
    level._id_78AC["civiliandriver_car1"]["runaway"] = %h1_hunted_farmer_runaway;
    level._id_78AC["civiliandriver_car2"]["runaway"] = %h1_hunted_farmer_runaway;
    level._id_78AC["civiliandriver_car1"]["hijack"] = %ac130_carjack_driver_1a;
    level._id_78AC["civiliandriver_car2"]["hijack"] = %ac130_carjack_driver_1b;
    level._id_78AC["hijacker_car1_guy1"]["hijack"] = %ac130_carjack_1a;
    level._id_78AC["hijacker_car1_guy2"]["hijack"] = %ac130_carjack_2;
    level._id_78AC["hijacker_car1_guy3"]["hijack"] = %ac130_carjack_3;
    level._id_78AC["hijacker_car1_guy4"]["hijack"] = %ac130_carjack_4;
    maps\_anim::_id_0807( "hijacker_car1_guy1", "start_others", maps\ac130_code::do_hijack_others );
    level._id_78AC["hijacker_car2_guy1"]["hijack"] = %ac130_carjack_1b;
    level._id_78AC["hijacker_car2_guy2"]["hijack"] = %ac130_carjack_2;
    level._id_78AC["hijacker_car2_guy3"]["hijack"] = %ac130_carjack_3;
    level._id_78AC["hijacker_car2_guy4"]["hijack"] = %ac130_carjack_4;
    maps\_anim::_id_0807( "hijacker_car2_guy1", "start_others", maps\ac130_code::do_hijack_others );
    level._id_78AC["hijacker_car1_guy1"]["idle"][0] = %bm21_driver_idle;
    level._id_78AC["hijacker_car1_guy2"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car1_guy3"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car1_guy4"]["idle"][0] = %technical_passenger_idle_right;
    level._id_78AC["hijacker_car2_guy1"]["idle"][0] = %bm21_driver_idle;
    level._id_78AC["hijacker_car2_guy2"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car2_guy3"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car2_guy4"]["idle"][0] = %technical_passenger_idle_right;
    level._id_78AC["hijacker_car1_guy1"]["getout"] = %pickup_driver_climb_out;
    level._id_78AC["hijacker_car1_guy2"]["getout"] = %pickup_passenger_climb_out;
    level._id_78AC["hijacker_car1_guy3"]["getout"] = %pickup_passenger_rr_climb_out;
    level._id_78AC["hijacker_car1_guy4"]["getout"] = %pickup_passenger_rl_climb_out;
    level._id_78AC["hijacker_car2_guy1"]["getout"] = %pickup_driver_climb_out;
    level._id_78AC["hijacker_car2_guy2"]["getout"] = %pickup_passenger_climb_out;
    level._id_78AC["hijacker_car2_guy3"]["getout"] = %pickup_passenger_rr_climb_out;
    level._id_78AC["hijacker_car2_guy4"]["getout"] = %pickup_passenger_rl_climb_out;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

building_destruction()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_ac130_watertower0_anim"] = %h1_ac130_watertower0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_watertower1_anim"] = %h1_ac130_watertower1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_crane0_anim"] = %h1_ac130_crane0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_crane1_anim"] = %h1_ac130_crane1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story0_anim"] = %h1_ac130_l2story0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story1_anim"] = %h1_ac130_l2story1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story2_anim"] = %h1_ac130_l2story2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story3_anim"] = %h1_ac130_l2story3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm0_anim"] = %h1_ac130_shed_sm0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm1_anim"] = %h1_ac130_shed_sm1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm2_anim"] = %h1_ac130_shed_sm2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm3_anim"] = %h1_ac130_shed_sm3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm0_anim"] = %h1_ac130_barn_sm0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm1_anim"] = %h1_ac130_barn_sm1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm2_anim"] = %h1_ac130_barn_sm2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm3_anim"] = %h1_ac130_barn_sm3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d0_anim"] = %h1_ac130_2story_d0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d1_anim"] = %h1_ac130_2story_d1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d2_anim"] = %h1_ac130_2story_d2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d3_anim"] = %h1_ac130_2story_d3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d4_anim"] = %h1_ac130_2story_d4_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d0_anim"] = %h1_ac130_1story_house_d0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d1_anim"] = %h1_ac130_1story_house_d1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d2_anim"] = %h1_ac130_1story_house_d2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d3_anim"] = %h1_ac130_1story_house_d3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d4_anim"] = %h1_ac130_1story_house_d4_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story0_anim"] = %h1_ac130_1story0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story1_anim"] = %h1_ac130_1story1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story2_anim"] = %h1_ac130_1story2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story3_anim"] = %h1_ac130_1story3_anim;
}
