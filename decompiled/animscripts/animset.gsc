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

_id_4C76()
{
    if ( isdefined( anim._id_0CCA ) )
        return;

    anim._id_0CCA = [];
    anim._id_0CCA["soldier"] = [];
    animscripts\cover_left::_id_4C7D();
    animscripts\cover_right::_id_4C80();
    animscripts\cover_prone::_id_4C7F();
    animscripts\cover_multi::_id_4C7E();
    animscripts\cover_wall::_id_4C81();
    animscripts\reactions::_id_4CA2();
    animscripts\pain::_id_4C9F();
    animscripts\death::_id_4C86();
    animscripts\combat::_id_4C7A();
    animscripts\move::_id_4C88();
    animscripts\move::_id_4CAC();
    animscripts\flashed::_id_4C8B();
    animscripts\stop::_id_4C8F();
    animscripts\melee::_id_4C9E();
    anim._id_0C81 = spawnstruct();
    anim._id_0C81._id_5EFE = [];
    _id_4C8A();
    _id_4C83();
    _id_4CA1();
    _id_4CA4();
    _id_4CA8();
    _id_4C8E();
    _id_4CAD();
    _id_4CAF();
    _id_4C87();
    _id_4CA3();
    _id_4CA7();
    _id_4CAA();
    _id_4C89();
    _id_4CA5();
    _id_4CB1();
    _id_4C82();
    _id_4C8D();
    _id_4CB0();
    _id_4CAE();
    _id_4CA0();
    _id_4D1C();
    _id_4CE8();
    init_cqb_stationary_turn_animations();
    init_casual_stationary_turn_animations();
    _id_4C8C();
    _id_4CF5();
    _id_4CA6();
    _id_4C79();
    _id_4CA9();
    _id_4CAB();

    if ( maps\_utility::_id_76FF() )
    {
        anim._id_0CCA["s1_soldier"] = [];
        animscripts\s1_common_anims::_id_4D4B();
        animscripts\s1_common_anims::_id_4D43();
        animscripts\s1_common_anims::_id_4D47();
        animscripts\s1_common_anims::_id_4D45();
        animscripts\s1_common_anims::_id_4D41();
        animscripts\s1_common_anims::_id_4D3E();
        animscripts\s1_common_anims::_id_4D3F();
        animscripts\s1_common_anims::_id_4D40();
        animscripts\s1_common_anims::_id_4D49();
        animscripts\s1_common_anims::_id_4D4F();
        animscripts\s1_common_anims::_id_4D4A();
        animscripts\s1_common_anims::_id_4D48();
        animscripts\s1_common_anims::_id_4D42();
        animscripts\s1_common_anims::_id_4D46();
        animscripts\s1_common_anims::_id_4D4C();
        animscripts\s1_common_anims::_id_4D44();
        animscripts\s1_common_anims::_id_4D3D();
        animscripts\s1_common_anims::_id_4D4E();
        animscripts\s1_common_anims::_id_4D4D();
        anim._id_0CCA["s1_soldier"]["old_default_stand"] = anim._id_0CCA["soldier"]["default_stand"];
    }
}

_id_72ED( var_0, var_1, var_2 )
{
    _id_4C76();
    anim._id_0CCA[var_0] = var_1;

    if ( isdefined( var_1["flashed"] ) )
        anim._id_38A4[var_0] = 0;

    if ( isdefined( var_2 ) && var_2 )
        animscripts\init_move_transitions::_id_40E1( var_0 );
}

_id_0CC9( var_0 )
{
    return isdefined( anim._id_0CCA[var_0] );
}
#using_animtree("generic_human");

_id_4CA5()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %sprint_loop_distant;
    anim._id_4D88["sprint_short"] = %sprint1_loop;
    anim._id_4D88["prone"] = %prone_crawl;
    anim._id_4D88["straight"] = %run_lowready_f;
    anim._id_4D88["smg_straight"] = %smg_run_lowready_f;
    anim._id_4D88["straight_twitch"] = [ %run_twitch_guncheck, %run_twitch_aim_straight, %run_twitch_aim_above, %run_twitch_lookbehind_a, %run_twitch_lookbehind_b ];
    anim._id_4D88["move_f"] = %walk_forward;
    anim._id_4D88["move_l"] = %walk_left;
    anim._id_4D88["move_r"] = %walk_right;
    anim._id_4D88["move_b"] = %walk_backward;
    anim._id_4D88["crouch"] = %crouch_fastwalk_f;
    anim._id_4D88["crouch_l"] = %crouch_fastwalk_l;
    anim._id_4D88["crouch_r"] = %crouch_fastwalk_r;
    anim._id_4D88["crouch_b"] = %crouch_fastwalk_b;
    init_animset_run_stairs();
    anim._id_4D88["reload"] = [ %run_reload_a, %run_reload_b ];
    anim._id_0CCA["soldier"]["run"] = anim._id_4D88;
}

init_animset_run_stairs()
{
    anim._id_4D88["stairs_up_6x8"] = %h1_run_stairs_up_6x8;
    anim._id_4D88["stairs_up_in_6x8"] = %h1_run_stairs_up_6x8_in;
    anim._id_4D88["stairs_up_out_6x8"] = %h1_run_stairs_up_6x8_out;
    anim._id_4D88["stairs_down_6x8"] = %h1_run_stairs_down_6x8;
    anim._id_4D88["stairs_down_in_6x8"] = %h1_run_stairs_down_6x8_in;
    anim._id_4D88["stairs_down_out_6x8"] = %h1_run_stairs_down_6x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_6x8"] = %h1_turn_90l_2_run_stairs_up_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_6x8"] = %h1_turn_90r_2_run_stairs_up_6x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_6x8"] = %h1_turn_90l_2_run_stairs_down_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_6x8"] = %h1_turn_90r_2_run_stairs_down_6x8_in;
    anim._id_4D88["stairs_up_8x8"] = %h1_run_stairs_up_8x8;
    anim._id_4D88["stairs_up_in_8x8"] = %h1_run_stairs_up_8x8_in;
    anim._id_4D88["stairs_up_out_8x8"] = %h1_run_stairs_up_8x8_out;
    anim._id_4D88["stairs_down_8x8"] = %h1_run_stairs_down_8x8;
    anim._id_4D88["stairs_down_in_8x8"] = %h1_run_stairs_down_8x8_in;
    anim._id_4D88["stairs_down_out_8x8"] = %h1_run_stairs_down_8x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_8x8"] = %h1_turn_90l_2_run_stairs_up_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_8x8"] = %h1_turn_90r_2_run_stairs_up_8x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_8x8"] = %h1_turn_90l_2_run_stairs_down_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_8x8"] = %h1_turn_90r_2_run_stairs_down_8x8_in;
    anim._id_4D88["stairs_up_10x8"] = %h1_run_stairs_up_10x8;
    anim._id_4D88["stairs_up_in_10x8"] = %h1_run_stairs_up_10x8_in;
    anim._id_4D88["stairs_up_out_10x8"] = %h1_run_stairs_up_10x8_out;
    anim._id_4D88["stairs_down_10x8"] = %h1_run_stairs_down_10x8;
    anim._id_4D88["stairs_down_in_10x8"] = %h1_run_stairs_down_10x8_in;
    anim._id_4D88["stairs_down_out_10x8"] = %h1_run_stairs_down_10x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_10x8"] = %h1_turn_90l_2_run_stairs_up_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_10x8"] = %h1_turn_90r_2_run_stairs_up_10x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_10x8"] = %h1_turn_90l_2_run_stairs_down_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_10x8"] = %h1_turn_90r_2_run_stairs_down_10x8_in;
    anim._id_4D88["stairs_up_12x6"] = %h1_run_stairs_up_12x6;
    anim._id_4D88["stairs_up_in_12x6"] = %h1_run_stairs_up_12x6_in;
    anim._id_4D88["stairs_up_out_12x6"] = %h1_run_stairs_up_12x6_out;
    anim._id_4D88["stairs_down_12x6"] = %h1_run_stairs_down_12x6;
    anim._id_4D88["stairs_down_in_12x6"] = %h1_run_stairs_down_12x6_in;
    anim._id_4D88["stairs_down_out_12x6"] = %h1_run_stairs_down_12x6_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x6"] = %h1_turn_90l_2_run_stairs_up_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x6"] = %h1_turn_90r_2_run_stairs_up_12x6_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x6"] = %h1_turn_90l_2_run_stairs_down_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x6"] = %h1_turn_90r_2_run_stairs_down_12x6_in;
    anim._id_4D88["stairs_up_12x8"] = %h1_run_stairs_up_12x8;
    anim._id_4D88["stairs_up_in_12x8"] = %h1_run_stairs_up_12x8_in;
    anim._id_4D88["stairs_up_out_12x8"] = %h1_run_stairs_up_12x8_out;
    anim._id_4D88["stairs_down_12x8"] = %h1_run_stairs_down_12x8;
    anim._id_4D88["stairs_down_in_12x8"] = %h1_run_stairs_down_12x8_in;
    anim._id_4D88["stairs_down_out_12x8"] = %h1_run_stairs_down_12x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x8"] = %h1_turn_90l_2_run_stairs_up_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x8"] = %h1_turn_90r_2_run_stairs_up_12x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x8"] = %h1_turn_90l_2_run_stairs_down_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x8"] = %h1_turn_90r_2_run_stairs_down_12x8_in;
    anim._id_4D88["stairs_up_16x8"] = %h1_run_stairs_up_16x8;
    anim._id_4D88["stairs_up_in_16x8"] = %h1_run_stairs_up_16x8_in;
    anim._id_4D88["stairs_up_out_16x8"] = %h1_run_stairs_up_16x8_out;
    anim._id_4D88["stairs_down_16x8"] = %h1_run_stairs_down_16x8;
    anim._id_4D88["stairs_down_in_16x8"] = %h1_run_stairs_down_16x8_in;
    anim._id_4D88["stairs_down_out_16x8"] = %h1_run_stairs_down_16x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_16x8"] = %h1_turn_90l_2_run_stairs_up_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_16x8"] = %h1_turn_90r_2_run_stairs_up_16x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_16x8"] = %h1_turn_90l_2_run_stairs_down_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_16x8"] = %h1_turn_90r_2_run_stairs_down_16x8_in;
}

_id_4CAE()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %lag_unstable_run;
    anim._id_4D88["sprint_short"] = %lag_unstable_run;
    anim._id_4D88["straight"] = %lag_unstable_run;
    anim._id_4D88["straight_twitch"] = [ %lag_unstable_run ];
    anim._id_4D88["move_f"] = %walk_cqb_f;
    anim._id_4D88["move_l"] = %walk_left;
    anim._id_4D88["move_r"] = %walk_right;
    anim._id_4D88["move_b"] = %walk_backward;
    anim._id_4D88["aim_2"] = %cqb_run_aim_2;
    anim._id_4D88["aim_4"] = %cqb_run_aim_4;
    anim._id_4D88["aim_5"] = %cqb_run_aim_5;
    anim._id_4D88["aim_6"] = %cqb_run_aim_6;
    anim._id_4D88["aim_8"] = %cqb_run_aim_8;
    init_animset_run_stairs();
    anim._id_4D88["shotgun_pullout"] = %shotgun_cqbrun_pullout;
    anim._id_4D88["shotgun_putaway"] = %shotgun_cqbrun_putaway;
    anim._id_4D88["reload"] = [ %cqb_run_reload_a_iw6, %cqb_run_reload_b_iw6 ];
    anim._id_0CCA["soldier"]["unstable_run"] = anim._id_4D88;
}

_id_4C8D()
{
    anim._id_4D88 = anim._id_0CCA["soldier"]["run"];
    anim._id_4D88["straight"] = %heat_run_loop;
    anim._id_0CCA["soldier"]["heat_run"] = anim._id_4D88;
}

_id_4CB1()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %sprint_loop_distant;
    anim._id_4D88["sprint_short"] = %sprint1_loop;
    anim._id_4D88["prone"] = %prone_crawl;
    anim._id_4D88["straight"] = %walk_cqb_f;
    anim._id_4D88["smg_straight"] = %walk_cqb_f;
    anim._id_4D88["move_f"] = %walk_cqb_f;
    anim._id_4D88["move_l"] = %walk_left;
    anim._id_4D88["move_r"] = %walk_right;
    anim._id_4D88["move_b"] = %walk_backward;
    anim._id_4D88["crouch"] = %crouch_fastwalk_f;
    anim._id_4D88["crouch_l"] = %crouch_fastwalk_l;
    anim._id_4D88["crouch_r"] = %crouch_fastwalk_r;
    anim._id_4D88["crouch_b"] = %crouch_fastwalk_b;
    anim._id_4D88["aim_2"] = %walk_aim_2;
    anim._id_4D88["aim_4"] = %walk_aim_4;
    anim._id_4D88["aim_6"] = %walk_aim_6;
    anim._id_4D88["aim_8"] = %walk_aim_8;
    init_animset_cqb_stairs();
    anim._id_0CCA["soldier"]["walk"] = anim._id_4D88;
}

_id_4CB0()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %lag_unstable_run;
    anim._id_4D88["sprint_short"] = %lag_unstable_run;
    anim._id_4D88["straight"] = %lag_unstable_moveforward_walk;
    anim._id_4D88["straight_twitch_l"] = [ %lag_unstable_moveforward_stumble_l ];
    anim._id_4D88["straight_twitch_r"] = [ %lag_unstable_moveforward_stumble_r ];
    anim._id_4D88["straight_twitch"] = [ %lag_unstable_moveforward_stumble ];
    anim._id_4D88["move_f"] = %walk_cqb_f;
    anim._id_4D88["move_l"] = %walk_left;
    anim._id_4D88["move_r"] = %walk_right;
    anim._id_4D88["move_b"] = %walk_backward;
    anim._id_4D88["aim_2"] = %cqb_run_aim_2;
    anim._id_4D88["aim_4"] = %cqb_run_aim_4;
    anim._id_4D88["aim_5"] = %cqb_run_aim_5;
    anim._id_4D88["aim_6"] = %cqb_run_aim_6;
    anim._id_4D88["aim_8"] = %cqb_run_aim_8;
    init_animset_cqb_stairs();
    anim._id_4D88["shotgun_pullout"] = %shotgun_cqbrun_pullout;
    anim._id_4D88["shotgun_putaway"] = %shotgun_cqbrun_putaway;
    anim._id_4D88["reload"] = [ %cqb_run_reload_a_iw6, %cqb_run_reload_b_iw6 ];
    anim._id_0CCA["soldier"]["unstable_walk"] = anim._id_4D88;
}

_id_4C82()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %sprint_loop_distant;
    anim._id_4D88["sprint_short"] = %sprint1_loop;
    anim._id_4D88["straight"] = %run_cqb_f_search_v1;
    anim._id_4D88["straight_twitch"] = [ %cqb_run_twitch_a_iw6, %cqb_run_twitch_b_iw6, %cqb_run_twitch_c_iw6, %cqb_run_twitch_d_iw6 ];
    anim._id_4D88["move_f"] = %walk_cqb_f;
    anim._id_4D88["move_l"] = %walk_left;
    anim._id_4D88["move_r"] = %walk_right;
    anim._id_4D88["move_b"] = %walk_backward;
    anim._id_4D88["aim_2"] = %cqb_run_aim_2;
    anim._id_4D88["aim_4"] = %cqb_run_aim_4;
    anim._id_4D88["aim_5"] = %cqb_run_aim_5;
    anim._id_4D88["aim_6"] = %cqb_run_aim_6;
    anim._id_4D88["aim_8"] = %cqb_run_aim_8;
    init_animset_cqb_stairs();
    anim._id_4D88["shotgun_pullout"] = %shotgun_cqbrun_pullout;
    anim._id_4D88["shotgun_putaway"] = %shotgun_cqbrun_putaway;
    anim._id_4D88["reload"] = [ %cqb_run_reload_a_iw6, %cqb_run_reload_b_iw6 ];
    anim._id_0CCA["soldier"]["cqb"] = anim._id_4D88;
}

init_animset_cqb_stairs()
{
    anim._id_4D88["stairs_up_6x8"] = %h1_cqb_stairs_up_6x8;
    anim._id_4D88["stairs_up_in_6x8"] = %h1_cqb_stairs_up_6x8_in;
    anim._id_4D88["stairs_up_out_6x8"] = %h1_cqb_stairs_up_6x8_out;
    anim._id_4D88["stairs_down_6x8"] = %h1_cqb_stairs_down_6x8;
    anim._id_4D88["stairs_down_in_6x8"] = %h1_cqb_stairs_down_6x8_in;
    anim._id_4D88["stairs_down_out_6x8"] = %h1_cqb_stairs_down_6x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_6x8"] = %h1_cqb_stairs_up_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_6x8"] = %h1_cqb_stairs_up_6x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_6x8"] = %h1_cqb_stairs_down_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_6x8"] = %h1_cqb_stairs_down_6x8_in;
    anim._id_4D88["stairs_up_8x8"] = %h1_cqb_stairs_up_8x8;
    anim._id_4D88["stairs_up_in_8x8"] = %h1_cqb_stairs_up_8x8_in;
    anim._id_4D88["stairs_up_out_8x8"] = %h1_cqb_stairs_up_8x8_out;
    anim._id_4D88["stairs_down_8x8"] = %h1_cqb_stairs_down_8x8;
    anim._id_4D88["stairs_down_in_8x8"] = %h1_cqb_stairs_down_8x8_in;
    anim._id_4D88["stairs_down_out_8x8"] = %h1_cqb_stairs_down_8x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_8x8"] = %h1_turn_90l_2_cqb_stairs_up_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_8x8"] = %h1_turn_90r_2_cqb_stairs_up_8x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_8x8"] = %h1_turn_90l_2_cqb_stairs_down_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_8x8"] = %h1_turn_90r_2_cqb_stairs_down_8x8_in;
    anim._id_4D88["stairs_up_10x8"] = %h1_cqb_stairs_up_10x8;
    anim._id_4D88["stairs_up_in_10x8"] = %h1_cqb_stairs_up_10x8_in;
    anim._id_4D88["stairs_up_out_10x8"] = %h1_cqb_stairs_up_10x8_out;
    anim._id_4D88["stairs_down_10x8"] = %h1_cqb_stairs_down_10x8;
    anim._id_4D88["stairs_down_in_10x8"] = %h1_cqb_stairs_down_10x8_in;
    anim._id_4D88["stairs_down_out_10x8"] = %h1_cqb_stairs_down_10x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_10x8"] = %h1_cqb_stairs_up_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_10x8"] = %h1_cqb_stairs_up_10x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_10x8"] = %h1_cqb_stairs_down_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_10x8"] = %h1_cqb_stairs_down_10x8_in;
    anim._id_4D88["stairs_up_12x6"] = %h1_cqb_stairs_up_12x6;
    anim._id_4D88["stairs_up_in_12x6"] = %h1_cqb_stairs_up_12x6_in;
    anim._id_4D88["stairs_up_out_12x6"] = %h1_cqb_stairs_up_12x6_out;
    anim._id_4D88["stairs_down_12x6"] = %h1_cqb_stairs_down_12x6;
    anim._id_4D88["stairs_down_in_12x6"] = %h1_cqb_stairs_down_12x6_in;
    anim._id_4D88["stairs_down_out_12x6"] = %h1_cqb_stairs_down_12x6_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x6"] = %h1_turn_90l_2_cqb_stairs_up_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x6"] = %h1_turn_90r_2_cqb_stairs_up_12x6_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x6"] = %h1_turn_90l_2_cqb_stairs_down_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x6"] = %h1_turn_90r_2_cqb_stairs_down_12x6_in;
    anim._id_4D88["stairs_up_12x8"] = %h1_cqb_stairs_up_12x8;
    anim._id_4D88["stairs_up_in_12x8"] = %h1_cqb_stairs_up_12x8_in;
    anim._id_4D88["stairs_up_out_12x8"] = %h1_cqb_stairs_up_12x8_out;
    anim._id_4D88["stairs_down_12x8"] = %h1_cqb_stairs_down_12x8;
    anim._id_4D88["stairs_down_in_12x8"] = %h1_cqb_stairs_down_12x8_in;
    anim._id_4D88["stairs_down_out_12x8"] = %h1_cqb_stairs_down_12x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x8"] = %h1_turn_90l_2_cqb_stairs_up_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x8"] = %h1_turn_90r_2_cqb_stairs_up_12x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x8"] = %h1_turn_90l_2_cqb_stairs_down_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x8"] = %h1_turn_90r_2_cqb_stairs_down_12x8_in;
    anim._id_4D88["stairs_up_16x8"] = %h1_cqb_stairs_up_16x8;
    anim._id_4D88["stairs_up_in_16x8"] = %h1_cqb_stairs_up_16x8_in;
    anim._id_4D88["stairs_up_out_16x8"] = %h1_cqb_stairs_up_16x8_out;
    anim._id_4D88["stairs_down_16x8"] = %h1_cqb_stairs_down_16x8;
    anim._id_4D88["stairs_down_in_16x8"] = %h1_cqb_stairs_down_16x8_in;
    anim._id_4D88["stairs_down_out_16x8"] = %h1_cqb_stairs_down_16x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_16x8"] = %h1_cqb_stairs_up_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_16x8"] = %h1_cqb_stairs_up_16x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_16x8"] = %h1_cqb_stairs_down_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_16x8"] = %h1_cqb_stairs_down_16x8_in;
}

_id_4CA0()
{
    anim._id_4D88 = [];
    anim._id_4D88["sprint"] = %pistol_sprint;
    anim._id_4D88["sprint_short"] = %pistol_sprint;
    anim._id_4D88["straight"] = %pistol_walk;
    anim._id_4D88["move_f"] = %pistol_walk;
    anim._id_4D88["move_l"] = %pistol_walk_left;
    anim._id_4D88["move_r"] = %pistol_walk_right;
    anim._id_4D88["move_b"] = %pistol_walk_back;
    anim._id_0CCA["soldier"]["pistol_move"] = anim._id_4D88;
}

_id_4CA1()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %pistol_stand_aim_8_add;
    anim._id_4D88["add_aim_down"] = %pistol_stand_aim_2_add;
    anim._id_4D88["add_aim_left"] = %pistol_stand_aim_4_add;
    anim._id_4D88["add_aim_right"] = %pistol_stand_aim_6_add;
    anim._id_4D88["straight_level"] = %pistol_stand_aim_5;
    anim._id_4D88["fire"] = %pistol_stand_fire_a;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %pistol_stand_fire_a );
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %pistol_stand_reload_a );
    anim._id_4D88["reload_crouchhide"] = [];
    anim._id_4D88["exposed_idle"] = [ %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 ];
    _id_7DD6();
    anim._id_4D88["add_turn_aim_up"] = %pistol_stand_aim_8_alt;
    anim._id_4D88["add_turn_aim_down"] = %pistol_stand_aim_2_alt;
    anim._id_4D88["add_turn_aim_left"] = %pistol_stand_aim_4_alt;
    anim._id_4D88["add_turn_aim_right"] = %pistol_stand_aim_6_alt;
    anim._id_0CCA["soldier"]["pistol_stand"] = anim._id_4D88;
}

_id_4CA4()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %rpg_stand_aim_8;
    anim._id_4D88["add_aim_down"] = %rpg_stand_aim_2;
    anim._id_4D88["add_aim_left"] = %rpg_stand_aim_4;
    anim._id_4D88["add_aim_right"] = %rpg_stand_aim_6;
    anim._id_4D88["straight_level"] = %rpg_stand_aim_5;
    anim._id_4D88["fire"] = %rpg_stand_fire;
    anim._id_4D88["single"] = [ %exposed_shoot_semi1 ];
    anim._id_4D88["reload"] = [ %rpg_stand_reload ];
    anim._id_4D88["reload_crouchhide"] = [];
    anim._id_4D88["exposed_idle"] = [ %rpg_stand_idle ];
    _id_7DD0();
    _id_7DD5();
    _id_7DC1();
    anim._id_0CCA["soldier"]["rpg_stand"] = anim._id_4D88;
}

_id_4CA8()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %shotgun_aim_8;
    anim._id_4D88["add_aim_down"] = %shotgun_aim_2;
    anim._id_4D88["add_aim_left"] = %shotgun_aim_4;
    anim._id_4D88["add_aim_right"] = %shotgun_aim_6;
    anim._id_4D88["straight_level"] = %shotgun_aim_5;
    anim._id_4D88["fire"] = %exposed_shoot_auto_v3;
    anim._id_4D88["single"] = [ %shotgun_stand_fire_1a, %shotgun_stand_fire_1b ];
    _id_7DC3();
    anim._id_4D88["exposed_idle"] = [ %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 ];
    anim._id_4D88["reload"] = [ %shotgun_stand_reload_a, %shotgun_stand_reload_b, %shotgun_stand_reload_c, %shotgun_stand_reload_c, %shotgun_stand_reload_c ];
    anim._id_4D88["reload_crouchhide"] = [ %shotgun_stand_reload_a, %shotgun_stand_reload_b ];
    _id_7DD0();
    _id_7DD5();
    _id_7DC1();
    anim._id_0CCA["soldier"]["shotgun_stand"] = anim._id_4D88;
}

_id_4CAD()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %smg_exposed_aim_8;
    anim._id_4D88["add_aim_down"] = %smg_exposed_aim_2;
    anim._id_4D88["add_aim_left"] = %smg_exposed_aim_4;
    anim._id_4D88["add_aim_right"] = %smg_exposed_aim_6;
    anim._id_4D88["straight_level"] = %smg_exposed_aim_5;
    anim._id_4D88["fire"] = %smg_exposed_shoot_auto_v3;
    anim._id_4D88["fire_corner"] = %smg_exposed_shoot_auto_v2;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %smg_exposed_shoot_semi1 );
    _id_7DC3();
    anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( %smg_exposed_idle_alert_v1, %smg_exposed_idle_alert_v2, %smg_exposed_idle_alert_v3 );
    anim._id_4D88["exposed_grenade"] = animscripts\utility::_id_0CD8( %smg_exposed_grenadethrowb, %smg_exposed_grenadethrowc );
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %smg_exposed_reload );
    anim._id_4D88["reload_crouchhide"] = animscripts\utility::_id_0CD8( %smg_exposed_reloadb );
    _id_7DD1();
    _id_7DCF();
    _id_7DBF();
    anim._id_0CCA["soldier"]["smg_stand"] = anim._id_4D88;
}

_id_4C83()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %cqb_stand_aim8;
    anim._id_4D88["add_aim_down"] = %cqb_stand_aim2;
    anim._id_4D88["add_aim_left"] = %cqb_stand_aim4;
    anim._id_4D88["add_aim_right"] = %cqb_stand_aim6;
    anim._id_4D88["straight_level"] = %cqb_stand_aim5;
    anim._id_4D88["fire"] = %exposed_shoot_auto_v3;
    anim._id_4D88["single"] = [ %exposed_shoot_semi1 ];
    _id_7DC3();
    anim._id_4D88["exposed_idle"] = [ %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 ];
    anim._id_4D88["reload"] = [ %cqb_stand_reload_steady ];
    anim._id_4D88["reload_crouchhide"] = [ %cqb_stand_reload_knee ];
    _id_7DD0();
    _id_7DD5();
    _id_7DC1();
    anim._id_0CCA["soldier"]["cqb_stand"] = anim._id_4D88;
}

_id_4CAF()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %cqb_stand_aim8;
    anim._id_4D88["add_aim_down"] = %cqb_stand_aim2;
    anim._id_4D88["add_aim_left"] = %cqb_stand_aim4;
    anim._id_4D88["add_aim_right"] = %cqb_stand_aim6;
    anim._id_4D88["straight_level"] = %lag_unstable_idle;
    anim._id_4D88["fire"] = %exposed_shoot_auto_v3;
    anim._id_4D88["single"] = [ %exposed_shoot_semi1 ];
    _id_7DC3();
    anim._id_4D88["exposed_idle"] = [ %lag_unstable_idle ];
    anim._id_4D88["reload"] = [ %cqb_stand_reload_steady ];
    anim._id_4D88["reload_crouchhide"] = [ %cqb_stand_reload_knee ];
    _id_7DD0();
    _id_7DD5();
    _id_7DC1();
    anim._id_0CCA["soldier"]["unstable_stand"] = anim._id_4D88;
}

_id_4C8E()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %heat_stand_aim_8;
    anim._id_4D88["add_aim_down"] = %heat_stand_aim_2;
    anim._id_4D88["add_aim_left"] = %heat_stand_aim_4;
    anim._id_4D88["add_aim_right"] = %heat_stand_aim_6;
    anim._id_4D88["straight_level"] = %heat_stand_aim_5;
    anim._id_4D88["fire"] = %heat_stand_fire_auto;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %heat_stand_fire_single );
    _id_7DCA( %heat_stand_fire_burst );
    anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( %heat_stand_idle, %heat_stand_scana, %heat_stand_scanb );
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %heat_exposed_reload );
    anim._id_4D88["reload_crouchhide"] = animscripts\utility::_id_0CD8();
    _id_7DD0();
    anim._id_4D88["turn_left_45"] = %heat_stand_turn_l;
    anim._id_4D88["turn_left_90"] = %heat_stand_turn_l;
    anim._id_4D88["turn_left_135"] = %heat_stand_turn_180;
    anim._id_4D88["turn_left_180"] = %heat_stand_turn_180;
    anim._id_4D88["turn_right_45"] = %heat_stand_turn_r;
    anim._id_4D88["turn_right_90"] = %heat_stand_turn_r;
    anim._id_4D88["turn_right_135"] = %heat_stand_turn_180;
    anim._id_4D88["turn_right_180"] = %heat_stand_turn_180;
    _id_7DC1();
    anim._id_0CCA["soldier"]["heat_stand"] = anim._id_4D88;
}

_id_4C8C()
{
    anim._id_4D88 = [];
    anim._id_4D88["reload_cover_left"] = %heat_cover_reload_r;
    anim._id_4D88["reload_cover_right"] = %heat_cover_reload_l;
    anim._id_4D88["reload_default"] = %heat_cover_reload_l;
    anim._id_0CCA["soldier"]["heat_reload"] = anim._id_4D88;
}

_id_4C8A()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %exposed_aim_8;
    anim._id_4D88["add_aim_down"] = %exposed_aim_2;
    anim._id_4D88["add_aim_left"] = %exposed_aim_4;
    anim._id_4D88["add_aim_right"] = %exposed_aim_6;
    anim._id_4D88["straight_level"] = %exposed_aim_5;
    anim._id_4D88["fire"] = %exposed_shoot_auto_v3;
    anim._id_4D88["fire_corner"] = %exposed_shoot_auto_v2;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %exposed_shoot_semi1 );
    _id_7DC3();
    anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( %exposed_idle_alert_v1, %exposed_idle_alert_v2, %exposed_idle_alert_v3 );
    anim._id_4D88["exposed_grenade"] = animscripts\utility::_id_0CD8( %exposed_grenadethrowb, %exposed_grenadethrowc );
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %exposed_reload );
    anim._id_4D88["reload_crouchhide"] = animscripts\utility::_id_0CD8( %exposed_reloadb );
    _id_7DD0();
    _id_7DD5();
    _id_7DC1();
    anim._id_0CCA["soldier"]["default_stand"] = anim._id_4D88;
}

_id_4C87()
{
    anim._id_4D88 = [];
    _id_7DC4();
    anim._id_4D88["fire"] = %exposed_crouch_shoot_auto_v2;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %exposed_crouch_shoot_semi1 );
    _id_7DC2();
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %exposed_crouch_reload );
    anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( %exposed_crouch_idle_alert_v1, %exposed_crouch_idle_alert_v2, %exposed_crouch_idle_alert_v3 );
    _id_7DD0();
    _id_7DC8();
    _id_7DC0();
    anim._id_0CCA["soldier"]["default_crouch"] = anim._id_4D88;
}

_id_4CA3()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %rpg_crouch_aim_8;
    anim._id_4D88["add_aim_down"] = %rpg_crouch_aim_2;
    anim._id_4D88["add_aim_left"] = %rpg_crouch_aim_4;
    anim._id_4D88["add_aim_right"] = %rpg_crouch_aim_6;
    anim._id_4D88["straight_level"] = %rpg_crouch_aim_5;
    anim._id_4D88["fire"] = %rpg_crouch_fire;
    anim._id_4D88["single"] = [ %rpg_crouch_fire ];
    anim._id_4D88["reload"] = [ %rpg_crouch_reload ];
    anim._id_4D88["exposed_idle"] = [ %rpg_crouch_idle ];
    _id_7DD0();
    _id_7DC8();
    _id_7DC0();
    anim._id_0CCA["soldier"]["rpg_crouch"] = anim._id_4D88;
}

_id_4CA7()
{
    anim._id_4D88 = [];
    _id_7DC4();
    anim._id_4D88["fire"] = %exposed_crouch_shoot_auto_v2;
    anim._id_4D88["single"] = [ %shotgun_crouch_fire ];
    _id_7DC2();
    anim._id_4D88["reload"] = [ %shotgun_crouch_reload ];
    anim._id_4D88["exposed_idle"] = [ %exposed_crouch_idle_alert_v1, %exposed_crouch_idle_alert_v2, %exposed_crouch_idle_alert_v3 ];
    _id_7DD0();
    _id_7DC8();
    _id_7DC0();
    anim._id_0CCA["soldier"]["shotgun_crouch"] = anim._id_4D88;
}

_id_4CAA()
{
    anim._id_4D88 = [];
    _id_7DC4();
    anim._id_4D88["fire"] = %exposed_crouch_shoot_auto_v2;
    anim._id_4D88["single"] = animscripts\utility::_id_0CD8( %exposed_crouch_shoot_semi1 );
    _id_7DC2();
    anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( %exposed_crouch_reload );
    anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( %exposed_crouch_idle_alert_v1, %exposed_crouch_idle_alert_v2, %exposed_crouch_idle_alert_v3 );
    _id_7DD1();
    _id_7DC8();
    _id_7DC0();
    anim._id_0CCA["soldier"]["smg_crouch"] = anim._id_4D88;
}

_id_4C89()
{
    anim._id_4D88 = [];
    anim._id_4D88["add_aim_up"] = %prone_aim_8_add;
    anim._id_4D88["add_aim_down"] = %prone_aim_2_add;
    anim._id_4D88["add_aim_left"] = %prone_aim_4_add;
    anim._id_4D88["add_aim_right"] = %prone_aim_6_add;
    anim._id_4D88["straight_level"] = %prone_aim_5;
    anim._id_4D88["fire"] = %prone_fire_1;
    anim._id_4D88["single"] = [ %prone_fire_1 ];
    anim._id_4D88["reload"] = [ %prone_reload ];
    anim._id_4D88["burst2"] = %prone_fire_burst;
    anim._id_4D88["burst3"] = %prone_fire_burst;
    anim._id_4D88["burst4"] = %prone_fire_burst;
    anim._id_4D88["burst5"] = %prone_fire_burst;
    anim._id_4D88["burst6"] = %prone_fire_burst;
    anim._id_4D88["semi2"] = %prone_fire_burst;
    anim._id_4D88["semi3"] = %prone_fire_burst;
    anim._id_4D88["semi4"] = %prone_fire_burst;
    anim._id_4D88["semi5"] = %prone_fire_burst;
    anim._id_4D88["turn_left_45"] = %h1_prone_turn_l45;
    anim._id_4D88["turn_left_90"] = %h1_prone_turn_l90;
    anim._id_4D88["turn_left_135"] = %h1_prone_turn_l90;
    anim._id_4D88["turn_left_180"] = %h1_prone_turn_180;
    anim._id_4D88["turn_right_45"] = %h1_prone_turn_r45;
    anim._id_4D88["turn_right_90"] = %h1_prone_turn_r90;
    anim._id_4D88["turn_right_135"] = %h1_prone_turn_r90;
    anim._id_4D88["turn_right_180"] = %h1_prone_turn_180;
    anim._id_4D88["exposed_idle"] = [ %exposed_crouch_idle_alert_v1, %exposed_crouch_idle_alert_v2, %exposed_crouch_idle_alert_v3 ];
    _id_7DD0();
    anim._id_0CCA["soldier"]["default_prone"] = anim._id_4D88;
}

_id_4C7C( var_0 )
{
    self._id_20B3 = var_0;
}

_id_4C85( var_0, var_1, var_2, var_3 )
{
    anim._id_4D88 = animscripts\utility::_id_5864( "default_stand" );

    if ( isdefined( var_1 ) )
        anim._id_4D88["straight_level"] = var_1;

    if ( isdefined( var_0 ) )
    {
        anim._id_4D88["fire"] = var_0;
        anim._id_4D88["single"] = animscripts\utility::_id_0CD8( var_0 );
        _id_7DCA( var_0 );
    }

    if ( isdefined( var_2 ) )
        anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( var_2 );

    if ( isdefined( var_3 ) )
    {
        anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( var_3 );
        anim._id_4D88["reload_crouchhide"] = animscripts\utility::_id_0CD8( var_3 );
    }

    self._id_20B3 = anim._id_4D88;
}

_id_4C84( var_0, var_1, var_2 )
{
    anim._id_4D88 = animscripts\utility::_id_5864( "default_crouch" );

    if ( isdefined( var_0 ) )
    {
        anim._id_4D88["fire"] = var_0;
        anim._id_4D88["single"] = animscripts\utility::_id_0CD8( var_0 );
        _id_7DC9( var_0 );
    }

    if ( isdefined( var_1 ) )
        anim._id_4D88["exposed_idle"] = animscripts\utility::_id_0CD8( var_1 );

    if ( isdefined( var_2 ) )
        anim._id_4D88["reload"] = animscripts\utility::_id_0CD8( var_2 );

    self._id_20A9 = anim._id_4D88;
}

_id_4C7B( var_0 )
{
    self._id_20A9 = var_0;
}

_id_1EA8()
{
    self._id_2563 = undefined;
    self._id_255D = undefined;
    self._id_20B3 = undefined;
    self._id_20A9 = undefined;
}

_id_7DD6( var_0 )
{
    anim._id_4D88["turn_left_45"] = %pistol_stand_turn45l;
    anim._id_4D88["turn_left_90"] = %pistol_stand_turn90l;
    anim._id_4D88["turn_left_135"] = %pistol_stand_turn90l;
    anim._id_4D88["turn_left_180"] = %pistol_stand_turn180l;
    anim._id_4D88["turn_right_45"] = %pistol_stand_turn45r;
    anim._id_4D88["turn_right_90"] = %pistol_stand_turn90r;
    anim._id_4D88["turn_right_135"] = %pistol_stand_turn90r;
    anim._id_4D88["turn_right_180"] = %pistol_stand_turn180l;
}

_id_7DD5()
{
    anim._id_4D88["turn_left_45"] = %exposed_tracking_turn45l;
    anim._id_4D88["turn_left_90"] = %exposed_tracking_turn90l;
    anim._id_4D88["turn_left_135"] = %exposed_tracking_turn135l;
    anim._id_4D88["turn_left_180"] = %exposed_tracking_turn180l;
    anim._id_4D88["turn_right_45"] = %exposed_tracking_turn45r;
    anim._id_4D88["turn_right_90"] = %exposed_tracking_turn90r;
    anim._id_4D88["turn_right_135"] = %exposed_tracking_turn135r;
    anim._id_4D88["turn_right_180"] = %exposed_tracking_turn180r;
}

_id_7DCF()
{
    anim._id_4D88["turn_left_45"] = %smg_exposed_tracking_turn45l;
    anim._id_4D88["turn_left_90"] = %smg_exposed_tracking_turn90l;
    anim._id_4D88["turn_left_135"] = %smg_exposed_tracking_turn135l;
    anim._id_4D88["turn_left_180"] = %smg_exposed_tracking_turn180l;
    anim._id_4D88["turn_right_45"] = %smg_exposed_tracking_turn45r;
    anim._id_4D88["turn_right_90"] = %smg_exposed_tracking_turn90r;
    anim._id_4D88["turn_right_135"] = %smg_exposed_tracking_turn135r;
    anim._id_4D88["turn_right_180"] = %smg_exposed_tracking_turn180r;
}

_id_7DC8()
{
    anim._id_4D88["turn_left_45"] = %exposed_crouch_turn_90_left;
    anim._id_4D88["turn_left_90"] = %exposed_crouch_turn_90_left;
    anim._id_4D88["turn_left_135"] = %exposed_crouch_turn_180_left;
    anim._id_4D88["turn_left_180"] = %exposed_crouch_turn_180_left;
    anim._id_4D88["turn_right_45"] = %exposed_crouch_turn_90_right;
    anim._id_4D88["turn_right_90"] = %exposed_crouch_turn_90_right;
    anim._id_4D88["turn_right_135"] = %exposed_crouch_turn_180_right;
    anim._id_4D88["turn_right_180"] = %exposed_crouch_turn_180_right;
}

_id_7DD0()
{
    anim._id_4D88["crouch_2_stand"] = %exposed_crouch_2_stand;
    anim._id_4D88["crouch_2_prone"] = %crouch_2_prone;
    anim._id_4D88["stand_2_crouch"] = %exposed_stand_2_crouch;
    anim._id_4D88["stand_2_prone"] = %stand_2_prone;
    anim._id_4D88["prone_2_crouch"] = %prone_2_crouch;
    anim._id_4D88["prone_2_stand"] = %prone_2_stand;
}

_id_7DD1()
{
    anim._id_4D88["crouch_2_stand"] = %smg_exposed_crouch_2_stand;
    anim._id_4D88["crouch_2_prone"] = %crouch_2_prone;
    anim._id_4D88["stand_2_crouch"] = %smg_exposed_stand_2_crouch;
    anim._id_4D88["stand_2_prone"] = %stand_2_prone;
    anim._id_4D88["prone_2_crouch"] = %prone_2_crouch;
    anim._id_4D88["prone_2_stand"] = %prone_2_stand;
}

_id_7DC3()
{
    anim._id_4D88["burst2"] = %exposed_shoot_burst3;
    anim._id_4D88["burst3"] = %exposed_shoot_burst3;
    anim._id_4D88["burst4"] = %exposed_shoot_burst4;
    anim._id_4D88["burst5"] = %exposed_shoot_burst5;
    anim._id_4D88["burst6"] = %exposed_shoot_burst6;
    anim._id_4D88["semi2"] = %exposed_shoot_semi2;
    anim._id_4D88["semi3"] = %exposed_shoot_semi3;
    anim._id_4D88["semi4"] = %exposed_shoot_semi4;
    anim._id_4D88["semi5"] = %exposed_shoot_semi5;
}

_id_7DCA( var_0 )
{
    anim._id_4D88["burst2"] = var_0;
    anim._id_4D88["burst3"] = var_0;
    anim._id_4D88["burst4"] = var_0;
    anim._id_4D88["burst5"] = var_0;
    anim._id_4D88["burst6"] = var_0;
    anim._id_4D88["semi2"] = var_0;
    anim._id_4D88["semi3"] = var_0;
    anim._id_4D88["semi4"] = var_0;
    anim._id_4D88["semi5"] = var_0;
}

_id_7DC2()
{
    anim._id_4D88["burst2"] = %exposed_crouch_shoot_burst3;
    anim._id_4D88["burst3"] = %exposed_crouch_shoot_burst3;
    anim._id_4D88["burst4"] = %exposed_crouch_shoot_burst4;
    anim._id_4D88["burst5"] = %exposed_crouch_shoot_burst5;
    anim._id_4D88["burst6"] = %exposed_crouch_shoot_burst6;
    anim._id_4D88["semi2"] = %exposed_crouch_shoot_semi2;
    anim._id_4D88["semi3"] = %exposed_crouch_shoot_semi3;
    anim._id_4D88["semi4"] = %exposed_crouch_shoot_semi4;
    anim._id_4D88["semi5"] = %exposed_crouch_shoot_semi5;
}

_id_7DC4()
{
    anim._id_4D88["add_aim_up"] = %exposed_crouch_aim_8;
    anim._id_4D88["add_aim_down"] = %exposed_crouch_aim_2;
    anim._id_4D88["add_aim_left"] = %exposed_crouch_aim_4;
    anim._id_4D88["add_aim_right"] = %exposed_crouch_aim_6;
    anim._id_4D88["straight_level"] = %exposed_crouch_aim_5;
}

_id_7DC9( var_0 )
{
    anim._id_4D88["burst2"] = var_0;
    anim._id_4D88["burst3"] = var_0;
    anim._id_4D88["burst4"] = var_0;
    anim._id_4D88["burst5"] = var_0;
    anim._id_4D88["burst6"] = var_0;
    anim._id_4D88["semi2"] = var_0;
    anim._id_4D88["semi3"] = var_0;
    anim._id_4D88["semi4"] = var_0;
    anim._id_4D88["semi5"] = var_0;
}

_id_7DC1()
{
    anim._id_4D88["add_turn_aim_up"] = %exposed_turn_aim_8;
    anim._id_4D88["add_turn_aim_down"] = %exposed_turn_aim_2;
    anim._id_4D88["add_turn_aim_left"] = %exposed_turn_aim_4;
    anim._id_4D88["add_turn_aim_right"] = %exposed_turn_aim_6;
}

_id_7DBF()
{
    anim._id_4D88["add_turn_aim_up"] = %smg_exposed_turn_aim_8;
    anim._id_4D88["add_turn_aim_down"] = %smg_exposed_turn_aim_2;
    anim._id_4D88["add_turn_aim_left"] = %smg_exposed_turn_aim_4;
    anim._id_4D88["add_turn_aim_right"] = %smg_exposed_turn_aim_6;
}

_id_7DC0()
{
    anim._id_4D88["add_turn_aim_up"] = %exposed_crouch_turn_aim_8;
    anim._id_4D88["add_turn_aim_down"] = %exposed_crouch_turn_aim_2;
    anim._id_4D88["add_turn_aim_left"] = %exposed_crouch_turn_aim_4;
    anim._id_4D88["add_turn_aim_right"] = %exposed_crouch_turn_aim_6;
}

_id_7DD2()
{
    if ( animscripts\utility::_id_9C3A() || isdefined( self._id_0B0F ) )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "pistol_stand" );
    else if ( isdefined( self._id_20B3 ) )
        self.a._id_0CD8 = self._id_20B3;
    else if ( isdefined( self._id_4795 ) )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "heat_stand" );
    else if ( animscripts\utility::_id_9C36() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "rpg_stand" );
    else if ( animscripts\utility::_id_9C3B() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "smg_stand" );
    else if ( isdefined( self.weapon ) && animscripts\utility::_id_A2CF() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "shotgun_stand" );
    else if ( animscripts\utility::_id_50E9() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "cqb_stand" );
    else if ( animscripts\utility::_id_51DE() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "unstable_stand" );
    else
        self.a._id_0CD8 = animscripts\utility::_id_5864( "default_stand" );
}

_id_7DC5()
{
    if ( animscripts\utility::_id_9C3A() )
        animscripts\shared::_id_6869( self.primaryweapon, "right" );

    if ( isdefined( self._id_20A9 ) )
        self.a._id_0CD8 = self._id_20A9;
    else if ( animscripts\utility::_id_9C36() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "rpg_crouch" );
    else if ( animscripts\utility::_id_9C3B() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "smg_crouch" );
    else if ( isdefined( self.weapon ) && animscripts\utility::_id_A2CF() )
        self.a._id_0CD8 = animscripts\utility::_id_5864( "shotgun_crouch" );
    else
        self.a._id_0CD8 = animscripts\utility::_id_5864( "default_crouch" );
}

_id_7DCE()
{
    if ( animscripts\utility::_id_9C3A() )
        animscripts\shared::_id_6869( self.primaryweapon, "right" );

    self.a._id_0CD8 = animscripts\utility::_id_5864( "default_prone" );
}

_id_4D1C()
{
    var_0 = animscripts\utility::using_tight_turn_anims();
    anim._id_4D88 = [];

    if ( var_0 )
    {
        anim._id_4D88[0] = %run_tight_turn_180;
        anim._id_4D88[1] = %run_tight_turn_l135;
        anim._id_4D88[2] = %run_tight_turn_l90;
        anim._id_4D88[3] = %run_tight_turn_l45;
        anim._id_4D88[5] = %run_tight_turn_r45;
        anim._id_4D88[6] = %run_tight_turn_r90;
        anim._id_4D88[7] = %run_tight_turn_r135;
        anim._id_4D88[8] = %run_tight_turn_180;
    }
    else
    {
        anim._id_4D88[0] = %run_turn_180;
        anim._id_4D88[1] = %run_turn_l135;
        anim._id_4D88[2] = %run_turn_l90;
        anim._id_4D88[3] = %run_turn_l45;
        anim._id_4D88[5] = %run_turn_r45;
        anim._id_4D88[6] = %run_turn_r90;
        anim._id_4D88[7] = %run_turn_r135;
        anim._id_4D88[8] = %run_turn_180;
    }

    anim._id_0CCA["soldier"]["run_turn"] = anim._id_4D88;
    anim._id_4D88 = [];

    if ( var_0 )
    {
        anim._id_4D88[0] = %run_tight_turn_180;
        anim._id_4D88[1] = %run_tight_turn_l135;
        anim._id_4D88[2] = %run_tight_turn_l90;
        anim._id_4D88[3] = %run_tight_turn_l45;
        anim._id_4D88[5] = %run_tight_turn_r45;
        anim._id_4D88[6] = %run_tight_turn_r90;
        anim._id_4D88[7] = %run_tight_turn_r135;
        anim._id_4D88[8] = %run_tight_turn_180;
    }
    else
    {
        anim._id_4D88[0] = %smg_run_turn_180;
        anim._id_4D88[1] = %smg_run_turn_l135;
        anim._id_4D88[2] = %smg_run_turn_l90;
        anim._id_4D88[3] = %smg_run_turn_l45;
        anim._id_4D88[5] = %smg_run_turn_r45;
        anim._id_4D88[6] = %smg_run_turn_r90;
        anim._id_4D88[7] = %smg_run_turn_r135;
        anim._id_4D88[8] = %smg_run_turn_180;
    }

    anim._id_0CCA["soldier"]["smg_run_turn"] = anim._id_4D88;
    anim._id_4D88 = [];

    if ( var_0 )
    {
        anim._id_4D88[0] = %cqb_walk_tight_turn_180;
        anim._id_4D88[1] = %cqb_walk_tight_turn_l135;
        anim._id_4D88[2] = %cqb_walk_tight_turn_l90;
        anim._id_4D88[3] = %cqb_walk_tight_turn_l45;
        anim._id_4D88[5] = %cqb_walk_tight_turn_r45;
        anim._id_4D88[6] = %cqb_walk_tight_turn_r90;
        anim._id_4D88[7] = %cqb_walk_tight_turn_r135;
        anim._id_4D88[8] = %cqb_walk_tight_turn_180;
        anim._id_4D88[9] = %cqb_walk_tight_turn_l20;
        anim._id_4D88[10] = %cqb_walk_tight_turn_r20;
    }
    else
    {
        anim._id_4D88[0] = %cqb_walk_turn_2;
        anim._id_4D88[1] = %cqb_walk_turn_1;
        anim._id_4D88[2] = %cqb_walk_turn_4;
        anim._id_4D88[3] = %cqb_walk_turn_7;
        anim._id_4D88[5] = %cqb_walk_turn_9;
        anim._id_4D88[6] = %cqb_walk_turn_6;
        anim._id_4D88[7] = %cqb_walk_turn_3;
        anim._id_4D88[8] = %cqb_walk_turn_2;
    }

    anim._id_0CCA["soldier"]["cqb_turn"] = anim._id_4D88;
    anim._id_4D88 = [];

    if ( var_0 )
    {
        anim._id_4D88[0] = %cqb_walk_tight_turn_180;
        anim._id_4D88[1] = %cqb_walk_tight_turn_l135;
        anim._id_4D88[2] = %cqb_walk_tight_turn_l90;
        anim._id_4D88[3] = %cqb_walk_tight_turn_l45;
        anim._id_4D88[5] = %cqb_walk_tight_turn_r45;
        anim._id_4D88[6] = %cqb_walk_tight_turn_r90;
        anim._id_4D88[7] = %cqb_walk_tight_turn_r135;
        anim._id_4D88[8] = %cqb_walk_tight_turn_180;
        anim._id_4D88[9] = %cqb_walk_tight_turn_l20;
        anim._id_4D88[10] = %cqb_walk_tight_turn_r20;
    }
    else
    {
        anim._id_4D88[0] = %cqb_run_turn_180_iw6;
        anim._id_4D88[1] = %cqb_run_turn_l135_iw6;
        anim._id_4D88[2] = %cqb_run_turn_l90_iw6;
        anim._id_4D88[3] = %cqb_run_turn_l45_iw6;
        anim._id_4D88[5] = %cqb_run_turn_r45_iw6;
        anim._id_4D88[6] = %cqb_run_turn_r90_iw6;
        anim._id_4D88[7] = %cqb_run_turn_r135_iw6;
        anim._id_4D88[8] = %cqb_run_turn_180_iw6;
    }

    anim._id_0CCA["soldier"]["cqb_run_turn"] = anim._id_4D88;
    anim._id_4D88 = [];
    anim._id_4D88[0] = %lag_unstable_moveforward_arrive_2;
    anim._id_4D88[1] = %lag_unstable_moveforward_arrive_1;
    anim._id_4D88[2] = %lag_unstable_moveforward_arrive_4;
    anim._id_4D88[3] = %lag_unstable_moveforward_arrive_7;
    anim._id_4D88[5] = %lag_unstable_moveforward_arrive_9;
    anim._id_4D88[6] = %lag_unstable_moveforward_arrive_6;
    anim._id_4D88[7] = %lag_unstable_moveforward_arrive_3;
    anim._id_4D88[8] = %lag_unstable_moveforward_arrive_2;
    anim._id_0CCA["soldier"]["unstable_run_turn"] = anim._id_4D88;
}

_id_4CE8()
{
    anim._id_4D88 = [];
    anim._id_4D88["turn_left_45"] = %h1_exposed_stand_45_l;
    anim._id_4D88["turn_left_90"] = %h1_exposed_stand_90_l;
    anim._id_4D88["turn_left_135"] = %h1_exposed_stand_135_l;
    anim._id_4D88["turn_left_180"] = %h1_exposed_stand_180_l;
    anim._id_4D88["turn_right_45"] = %h1_exposed_stand_45_r;
    anim._id_4D88["turn_right_90"] = %h1_exposed_stand_90_r;
    anim._id_4D88["turn_right_135"] = %h1_exposed_stand_135_r;
    anim._id_4D88["turn_right_180"] = %h1_exposed_stand_180_r;
    anim._id_0CCA["soldier"]["exposed_turn"] = anim._id_4D88;
    anim._id_4D88 = [];
    anim._id_4D88["turn_left_45"] = %exposed_crouch_turn_90_left;
    anim._id_4D88["turn_left_90"] = %exposed_crouch_turn_90_left;
    anim._id_4D88["turn_left_135"] = %exposed_crouch_turn_180_left;
    anim._id_4D88["turn_left_180"] = %exposed_crouch_turn_180_left;
    anim._id_4D88["turn_right_45"] = %exposed_crouch_turn_90_right;
    anim._id_4D88["turn_right_90"] = %exposed_crouch_turn_90_right;
    anim._id_4D88["turn_right_135"] = %exposed_crouch_turn_180_right;
    anim._id_4D88["turn_right_180"] = %exposed_crouch_turn_180_right;
    anim._id_0CCA["soldier"]["exposed_turn_crouch"] = anim._id_4D88;
}

init_cqb_stationary_turn_animations()
{
    anim._id_4D88 = [];
    anim._id_4D88["turn_left_45"] = %h1_cqb_stand_45_l;
    anim._id_4D88["turn_left_90"] = %h1_cqb_stand_90_l;
    anim._id_4D88["turn_left_135"] = %h1_cqb_stand_135_l;
    anim._id_4D88["turn_left_180"] = %h1_cqb_stand_180_l;
    anim._id_4D88["turn_right_45"] = %h1_cqb_stand_45_r;
    anim._id_4D88["turn_right_90"] = %h1_cqb_stand_90_r;
    anim._id_4D88["turn_right_135"] = %h1_cqb_stand_135_r;
    anim._id_4D88["turn_right_180"] = %h1_cqb_stand_180_r;
    anim._id_0CCA["soldier"]["cqb_stationary_turn"] = anim._id_4D88;
}

init_casual_stationary_turn_animations()
{
    anim._id_4D88 = [];
    anim._id_4D88["turn_left_45"] = %h1_casual_stand_45_l;
    anim._id_4D88["turn_left_90"] = %h1_casual_stand_90_l;
    anim._id_4D88["turn_left_135"] = %h1_casual_stand_135_l;
    anim._id_4D88["turn_left_180"] = %h1_casual_stand_180_l;
    anim._id_4D88["turn_right_45"] = %h1_casual_stand_45_r;
    anim._id_4D88["turn_right_90"] = %h1_casual_stand_90_r;
    anim._id_4D88["turn_right_135"] = %h1_casual_stand_135_r;
    anim._id_4D88["turn_right_180"] = %h1_casual_stand_180_r;
    anim._id_0CCA["soldier"]["casual_stationary_turn"] = anim._id_4D88;
}

_id_4CF5()
{
    anim._id_4D88 = [];
    anim._id_4D88["cower_squat"] = %exposed_squat_down_grenade_f;
    anim._id_4D88["cower_squat_up"] = %exposed_squat_up_grenade_f;
    anim._id_4D88["cower_squat_idle"] = %exposed_squat_idle_grenade_f;
    anim._id_4D88["cower_dive_back"] = %exposed_dive_grenade_b;
    anim._id_4D88["cower_dive_front"] = %exposed_dive_grenade_f;
    anim._id_4D88["return_throw_short"] = [ %grenade_return_running_throw_forward, %grenade_return_standing_throw_forward_1 ];
    anim._id_4D88["return_throw_long"] = [ %grenade_return_running_throw_forward, %grenade_return_standing_throw_overhand_forward ];
    anim._id_4D88["return_throw_default"] = [ %grenade_return_standing_throw_overhand_forward ];
    anim._id_4D88["return_throw_short_smg"] = [ %smg_grenade_return_running_throw_forward, %smg_grenade_return_standing_throw_forward_1 ];
    anim._id_4D88["return_throw_long_smg"] = [ %smg_grenade_return_running_throw_forward, %smg_grenade_return_standing_throw_overhand_forward ];
    anim._id_4D88["return_throw_default_smg"] = [ %smg_grenade_return_standing_throw_overhand_forward ];
    anim._id_4D88["return_running_throw_short"] = [];
    anim._id_4D88["return_running_throw_short"][0] = %grenade_return_running_throw_back;
    anim._id_4D88["return_running_throw_short"][1] = %grenade_return_running_throw_left;
    anim._id_4D88["return_running_throw_short"][2] = %grenade_return_running_throw_forward;
    anim._id_4D88["return_running_throw_short"][3] = %grenade_return_running_throw_right;
    anim._id_4D88["return_running_throw_long"] = [];
    anim._id_4D88["return_running_throw_long"][0] = %grenade_return_running_throw_back;
    anim._id_4D88["return_running_throw_long"][1] = %grenade_return_running_throw_left;
    anim._id_4D88["return_running_throw_long"][2] = %grenade_return_running_throw_overhand_forward;
    anim._id_4D88["return_running_throw_long"][3] = %grenade_return_running_throw_right;
    anim._id_4D88["return_standing_throw"] = [];
    anim._id_4D88["return_standing_throw"][0] = %grenade_return_standing_throw_overhand_back;
    anim._id_4D88["return_standing_throw"][1] = %grenade_return_standing_throw_overhand_left;
    anim._id_4D88["return_standing_throw"][2] = %grenade_return_standing_throw_overhand_forward;
    anim._id_4D88["return_standing_throw"][3] = %grenade_return_standing_throw_overhand_right;
    anim._id_4D88["return_crouching_throw"] = [];
    anim._id_4D88["return_crouching_throw"][0] = %grenade_return_crouching_throw_back;
    anim._id_4D88["return_crouching_throw"][1] = %grenade_return_crouching_throw_left;
    anim._id_4D88["return_crouching_throw"][2] = %grenade_return_crouching_throw_forward;
    anim._id_4D88["return_crouching_throw"][3] = %grenade_return_crouching_throw_right;
    anim._id_4D88["return_cornercrl_1knee_throw"] = anim._id_4D88["return_crouching_throw"];
    anim._id_4D88["return_cornercrl_1knee_throw"][3] = %grenade_return_cornercrl_1knee_throw;
    anim._id_4D88["return_cornercrl_2knee_throw"] = anim._id_4D88["return_crouching_throw"];
    anim._id_4D88["return_cornercrl_2knee_throw"][3] = %grenade_return_cornercrl_2knee_throw;
    anim._id_4D88["return_cornercrr_1knee_throw"] = anim._id_4D88["return_crouching_throw"];
    anim._id_4D88["return_cornercrr_1knee_throw"][1] = %grenade_return_cornercrr_1knee_throw;
    anim._id_4D88["return_cornercrr_2knee_throw"] = anim._id_4D88["return_crouching_throw"];
    anim._id_4D88["return_cornercrr_2knee_throw"][1] = %grenade_return_cornercrr_2knee_throw;
    anim._id_4D88["return_covercrouch_throw"] = anim._id_4D88["return_crouching_throw"];
    anim._id_4D88["return_covercrouch_throw"][2] = %grenade_return_covercrouch_throw;
    anim._id_0CCA["soldier"]["grenade"] = anim._id_4D88;
}

_id_4CA6()
{
    anim._id_4D88 = [];
    anim._id_4D88["F"] = %run_n_gun_f;
    anim._id_4D88["L"] = %run_n_gun_l;
    anim._id_4D88["R"] = %run_n_gun_r;
    anim._id_4D88["LB"] = %run_n_gun_l_120;
    anim._id_4D88["RB"] = %run_n_gun_r_120;
    anim._id_4D88["stairs_up_6x8"] = %h1_run_n_gun_stairs_up_6x8;
    anim._id_4D88["stairs_up_in_6x8"] = %h1_run_n_gun_stairs_up_6x8_in;
    anim._id_4D88["stairs_up_out_6x8"] = %h1_run_n_gun_stairs_up_6x8_out;
    anim._id_4D88["stairs_down_6x8"] = %h1_run_n_gun_stairs_down_6x8;
    anim._id_4D88["stairs_down_in_6x8"] = %h1_run_n_gun_stairs_down_6x8_in;
    anim._id_4D88["stairs_down_out_6x8"] = %h1_run_n_gun_stairs_down_6x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_6x8"] = %h1_turn_90l_2_run_n_gun_stairs_up_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_6x8"] = %h1_turn_90r_2_run_n_gun_stairs_up_6x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_6x8"] = %h1_turn_90l_2_run_n_gun_stairs_down_6x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_6x8"] = %h1_turn_90r_2_run_n_gun_stairs_down_6x8_in;
    anim._id_4D88["stairs_up_8x8"] = %h1_run_n_gun_stairs_up_8x8;
    anim._id_4D88["stairs_up_in_8x8"] = %h1_run_n_gun_stairs_up_8x8_in;
    anim._id_4D88["stairs_up_out_8x8"] = %h1_run_n_gun_stairs_up_8x8_out;
    anim._id_4D88["stairs_down_8x8"] = %h1_run_n_gun_stairs_down_8x8;
    anim._id_4D88["stairs_down_in_8x8"] = %h1_run_n_gun_stairs_down_8x8_in;
    anim._id_4D88["stairs_down_out_8x8"] = %h1_run_n_gun_stairs_down_8x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_8x8"] = %h1_turn_90l_2_run_n_gun_stairs_up_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_8x8"] = %h1_turn_90r_2_run_n_gun_stairs_up_8x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_8x8"] = %h1_turn_90l_2_run_n_gun_stairs_down_8x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_8x8"] = %h1_turn_90r_2_run_n_gun_stairs_down_8x8_in;
    anim._id_4D88["stairs_up_10x8"] = %h1_run_n_gun_stairs_up_10x8;
    anim._id_4D88["stairs_up_in_10x8"] = %h1_run_n_gun_stairs_up_10x8_in;
    anim._id_4D88["stairs_up_out_10x8"] = %h1_run_n_gun_stairs_up_10x8_out;
    anim._id_4D88["stairs_down_10x8"] = %h1_run_n_gun_stairs_down_10x8;
    anim._id_4D88["stairs_down_in_10x8"] = %h1_run_n_gun_stairs_down_10x8_in;
    anim._id_4D88["stairs_down_out_10x8"] = %h1_run_n_gun_stairs_down_10x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_10x8"] = %h1_turn_90l_2_run_n_gun_stairs_up_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_10x8"] = %h1_turn_90r_2_run_n_gun_stairs_up_10x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_10x8"] = %h1_turn_90l_2_run_n_gun_stairs_down_10x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_10x8"] = %h1_turn_90r_2_run_n_gun_stairs_down_10x8_in;
    anim._id_4D88["stairs_up_12x6"] = %h1_run_n_gun_stairs_up_12x6;
    anim._id_4D88["stairs_up_in_12x6"] = %h1_run_n_gun_stairs_up_12x6_in;
    anim._id_4D88["stairs_up_out_12x6"] = %h1_run_n_gun_stairs_up_12x6_out;
    anim._id_4D88["stairs_down_12x6"] = %h1_run_n_gun_stairs_down_12x6;
    anim._id_4D88["stairs_down_in_12x6"] = %h1_run_n_gun_stairs_down_12x6_in;
    anim._id_4D88["stairs_down_out_12x6"] = %h1_run_n_gun_stairs_down_12x6_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x6"] = %h1_turn_90l_2_run_n_gun_stairs_up_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x6"] = %h1_turn_90r_2_run_n_gun_stairs_up_12x6_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x6"] = %h1_turn_90l_2_run_n_gun_stairs_down_12x6_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x6"] = %h1_turn_90r_2_run_n_gun_stairs_down_12x6_in;
    anim._id_4D88["stairs_up_12x8"] = %h1_run_n_gun_stairs_up_12x8;
    anim._id_4D88["stairs_up_in_12x8"] = %h1_run_n_gun_stairs_up_12x8_in;
    anim._id_4D88["stairs_up_out_12x8"] = %h1_run_n_gun_stairs_up_12x8_out;
    anim._id_4D88["stairs_down_12x8"] = %h1_run_n_gun_stairs_down_12x8;
    anim._id_4D88["stairs_down_in_12x8"] = %h1_run_n_gun_stairs_down_12x8_in;
    anim._id_4D88["stairs_down_out_12x8"] = %h1_run_n_gun_stairs_down_12x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_12x8"] = %h1_turn_90l_2_run_n_gun_stairs_up_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_12x8"] = %h1_turn_90r_2_run_n_gun_stairs_up_12x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_12x8"] = %h1_turn_90l_2_run_n_gun_stairs_down_12x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_12x8"] = %h1_turn_90r_2_run_n_gun_stairs_down_12x8_in;
    anim._id_4D88["stairs_up_16x8"] = %h1_run_n_gun_stairs_up_16x8;
    anim._id_4D88["stairs_up_in_16x8"] = %h1_run_n_gun_stairs_up_16x8_in;
    anim._id_4D88["stairs_up_out_16x8"] = %h1_run_n_gun_stairs_up_16x8_out;
    anim._id_4D88["stairs_down_16x8"] = %h1_run_n_gun_stairs_down_16x8;
    anim._id_4D88["stairs_down_in_16x8"] = %h1_run_n_gun_stairs_down_16x8_in;
    anim._id_4D88["stairs_down_out_16x8"] = %h1_run_n_gun_stairs_down_16x8_out;
    anim._id_4D88["turn_90l_2_stairs_up_16x8"] = %h1_turn_90l_2_run_n_gun_stairs_up_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_up_16x8"] = %h1_turn_90r_2_run_n_gun_stairs_up_16x8_in;
    anim._id_4D88["turn_90l_2_stairs_down_16x8"] = %h1_turn_90l_2_run_n_gun_stairs_down_16x8_in;
    anim._id_4D88["turn_90r_2_stairs_down_16x8"] = %h1_turn_90r_2_run_n_gun_stairs_down_16x8_in;
    anim._id_4D88["move_back"] = %combatwalk_b;
    anim._id_0CCA["soldier"]["run_n_gun"] = anim._id_4D88;
}

_id_8283()
{
    self._id_5A52 = 60;
    self._id_76D9 = 1.0;
    self._id_76D8 = 0.3;
}

_id_4C79()
{
    anim._id_4D88 = [];
    anim._id_4D88["move_l"] = %combatwalk_l;
    anim._id_4D88["move_r"] = %combatwalk_r;
    anim._id_4D88["move_b"] = %combatwalk_b;
    anim._id_0CCA["soldier"]["ambush"] = anim._id_4D88;
}

_id_4CA9()
{
    anim._id_4D88 = [];
    anim._id_4D88["move_l"] = %smg_combatwalk_l;
    anim._id_4D88["move_r"] = %smg_combatwalk_r;
    anim._id_4D88["move_b"] = %smg_combatwalk_b;
    anim._id_0CCA["soldier"]["smg_ambush"] = anim._id_4D88;
}

_id_4CAB()
{
    anim._id_4D88 = [];
    anim._id_4D88["crouch"] = %smg_crouch_fastwalk_f;
    anim._id_4D88["crouch_l"] = %smg_crouch_fastwalk_l;
    anim._id_4D88["crouch_r"] = %smg_crouch_fastwalk_r;
    anim._id_4D88["crouch_b"] = %smg_crouch_fastwalk_b;
    anim._id_0CCA["soldier"]["smg_crouch_run"] = anim._id_4D88;
}

_id_7DBA()
{
    var_0 = "ambush";

    if ( animscripts\utility::_id_9C3B() )
        var_0 = "smg_ambush";

    self.a._id_5F43["move_l"] = animscripts\utility::_id_5863( var_0, "move_l" );
    self.a._id_5F43["move_r"] = animscripts\utility::_id_5863( var_0, "move_r" );
    self.a._id_5F43["move_b"] = animscripts\utility::_id_5863( var_0, "move_b" );
}

_id_4797()
{
    if ( self.weapon != self.primaryweapon )
        return animscripts\utility::_id_0C51( "reload" );

    if ( isdefined( self.node ) )
    {
        if ( self _meth_8165() )
        {
            var_0 = undefined;

            if ( self.node.type == "Cover Left" )
                var_0 = animscripts\utility::_id_5863( "heat_reload", "reload_cover_left" );
            else if ( self.node.type == "Cover Right" )
                var_0 = animscripts\utility::_id_5863( "heat_reload", "reload_cover_right" );

            if ( isdefined( var_0 ) )
                return var_0;
        }
    }

    return animscripts\utility::_id_5863( "heat_reload", "reload_default" );
}
