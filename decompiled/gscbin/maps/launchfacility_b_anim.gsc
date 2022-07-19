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
    blast_door();
    _id_6A5B();
    _id_29F3();
}
#using_animtree("generic_human");

_id_0C7A()
{
    if ( getdvarint( "use_old_vent_drop" ) == 1 )
    {
        level._id_78AC["price"]["vent_drop_l"] = %launchfacility_b_vent_drop_l;
        level._id_78AC["grigsby"]["vent_drop_r"] = %launchfacility_b_vent_drop_r;
        level._id_78AC["steve"]["vent_drop_team1"] = %launchfacility_b_vent_drop_r;
    }
    else
    {
        level._id_78AC["price"]["vent_drop_l"] = %h1_launchfacility_b_vent_drop_l;
        level._id_78AC["grigsby"]["vent_drop_r"] = %h1_launchfacility_b_vent_drop_r;
        level._id_78AC["steve"]["vent_drop_team1"] = %h1_launchfacility_b_vent_drop_r;
    }

    level._id_78AC["price"]["blast_door_runto"] = %launchfacility_b_blast_door_seq_approch;
    level._id_78AC["price"]["blast_door_wave"][0] = %launchfacility_b_blast_door_seq_waveidle;
    level._id_78AC["price"]["blast_door_close"] = %launchfacility_b_blast_door_seq_close;

    if ( getdvarint( "use_old_vaultdoors" ) == 1 )
    {
        level._id_78AC["price"]["guard_vaultdoors"] = %launchfacility_b_wargame_door_price;
        level._id_78AC["grigsby"]["guard_vaultdoors"] = %launchfacility_b_wargame_door_grigs;
    }
    else
    {
        level._id_78AC["price"]["guard_vaultdoors"] = %h1_launchfacility_b_wargame_door_price;
        _id_A510::_id_080B( "price", "dialog", "guard_vaultdoors", "launchfacility_b_pri_atdoor" );
        _id_A510::_id_0807( "price", "gaz_dialog1", ::play_gaz_doors1_roger, "guard_vaultdoors" );
        _id_A510::_id_0807( "price", "gaz_dialog2", ::play_gaz_doors2_standby, "guard_vaultdoors" );
        _id_A510::_id_0807( "price", "gaz_dialog3", ::play_gaz_doors3_gotit, "guard_vaultdoors" );
        _id_A510::_id_080B( "price", "dialog", "guard_vaultdoors", "launchfacility_b_pri_faster" );
        _id_A510::_id_0807( "price", "gaz_dialog4", ::play_gaz_doors4_negative, "guard_vaultdoors" );
        level._id_78AC["grigsby"]["guard_vaultdoors"] = %h1_launchfacility_b_wargame_door_grigs;
        _id_A510::_id_080B( "grigsby", "griggs_dialog", "guard_vaultdoors", "launchfacility_b_grg_shittinme" );
    }

    level._id_78AC["grigsby"]["elevator_runin"] = %hunted_tunnel_guy1_runin;
    level._id_78AC["grigsby"]["elevator_idle"][0] = %hunted_tunnel_guy1_idle;
    level._id_78AC["price"]["elevator_runin"] = %hunted_tunnel_guy2_runin;
    level._id_78AC["price"]["elevator_idle"][0] = %hunted_tunnel_guy2_idle;
    level._id_78AC["price"]["elevator_runout"] = %hunted_tunnel_guy2_runout;
    level._id_78AC["grigsby"]["elevator_runout"] = %hunted_tunnel_guy1_runout;
    level._id_78AC["grigsby"]["h1_elevator_elevator"] = %h1_launchfacility_b_elevator_griggs_elevator;
    level._id_78AC["grigsby"]["h1_elevator_idle1"][0] = %h1_launchfacility_b_elevator_griggs_idle1;
    level._id_78AC["grigsby"]["h1_elevator_idle2"][0] = %h1_launchfacility_b_elevator_griggs_idle2;
    level._id_78AC["grigsby"]["h1_elevator_runin"] = %h1_launchfacility_b_elevator_griggs_runin;
    level._id_78AC["grigsby"]["h1_elevator_runout"] = %h1_launchfacility_b_elevator_griggs_runout;
    level._id_78AC["price"]["h1_elevator_elevator"] = %h1_launchfacility_b_elevator_price_elevator;
    level._id_78AC["price"]["h1_elevator_entering"] = %h1_launchfacility_b_elevator_price_entering;
    level._id_78AC["price"]["h1_elevator_run_to_idle1"] = %h1_launchfacility_b_elevator_price_run_to_idle1;
    level._id_78AC["price"]["h1_elevator_idle1"][0] = %h1_launchfacility_b_elevator_price_idle1;
    level._id_78AC["price"]["h1_elevator_idle2"][0] = %h1_launchfacility_b_elevator_price_idle2;
    level._id_78AC["price"]["h1_elevator_runin"] = %h1_launchfacility_b_elevator_price_runin;
    level._id_78AC["price"]["h1_elevator_runout"] = %h1_launchfacility_b_elevator_price_runout;

    if ( getdvarint( "use_old_elevator" ) != 1 )
    {
        _id_A510::_id_080B( "grigsby", "dialog", "h1_elevator_elevator", "launchfacility_b_grg_ashot" );
        _id_A510::_id_0807( "price", "gaz_dialog", ::play_gaz_elevator_radio, "h1_elevator_elevator" );
        _id_A510::_id_080B( "price", "radio_dialog", "h1_elevator_elevator", "launchfacility_b_pri_upthelift" );
        _id_A510::_id_080B( "price", "dialog", "h1_elevator_elevator", "launchfacility_b_pri_getinline" );
    }

    level.scr_deadbody[1] = character\character_dead_russian_loyalist_a::main;
    level.scr_deadbody[2] = character\character_dead_russian_loyalist_b::main;
    level.scr_deadbody[3] = character\character_dead_russian_loyalist_c::main;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

blast_door()
{
    level._id_78B1["door"] = #animtree;
    level._id_78AC["door"]["blast_door_close"] = %launchfacility_b_blast_door_seq_close_door;
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_launch_b_breach_anim"] = %h1_launch_b_breach_anim;
}
#using_animtree("player");

_id_6A5B()
{
    level._id_78B1["player"] = #animtree;
    level._id_78B5["player"] = "viewhands_player_sas_woodland";
    level._id_78AC["player"]["typing_abort_codes"] = %h1_launchfacility_b_player_typing;
}

_id_29F3()
{
    level._id_78B9["letsmove"] = "launchfacility_b_pri_letsmove";
    level._id_78B9["basesecurity"] = "launchfacility_b_gm1_basesecurity";
    level._id_78B9["invents"] = "launchfacility_b_pri_invents";
    level._id_78B9["gm1_copythat"] = "launchfacility_b_gm1_copythat";
    level._id_78B9["heavyresistance"] = "launchfacility_b_gm2_heavyresistance";
    level._id_78B9["gaincontrol"] = "launchfacility_b_pri_gaincontrol";
    level._id_78B9["regroup"] = "launchfacility_b_gm2_regroup";
    level._id_78B9["15mins"] = "launchfacility_b_hqr_15mins";
    level._id_78B9["11mins"] = "launchfacility_b_hqr_11mins";
    level._id_78B9["9mins"] = "launchfacility_b_hqr_9mins";
    level._id_78BA["price"]["pri_copythat"] = "launchfacility_b_pri_copythat";
    level._id_78B9["grg_gottamove"] = "launchfacility_b_grg_gottamove";
    level._id_78B9["grg_goinon"] = "launchfacility_b_grg_goinon";
    level._id_78B9["startedcountdown"] = "launchfacility_b_pri_startedcountdown";
    level._id_78B9["pri_movemove"] = "launchfacility_b_pri_movemove";
    level._id_78B9["pri_gogogo1"] = "launchfacility_b_pri_gogogo1";
    level._id_78B9["controlbasesec"] = "launchfacility_b_gm1_controlbasesec";
    level._id_78BA["price"]["pri_atdoor"] = "launchfacility_b_pri_atdoor";
    level._id_78B9["workinonit"] = "launchfacility_b_gm1_workinonit";
    level._id_78B9["almostthere"] = "launchfacility_b_gm1_almostthere";
    level._id_78B9["gotit"] = "launchfacility_b_gm1_gotit";
    level._id_78BA["grigsby"]["grg_shittinme"] = "launchfacility_b_grg_shittinme";
    level._id_78B9["pri_faster"] = "launchfacility_b_pri_faster";
    level._id_78B9["gm1_trypulling"] = "launchfacility_b_gm1_trypulling";
    level._id_78BA["price"]["pri_cheeky"] = "launchfacility_b_pri_cheeky";
    level._id_78BA["price"]["status"] = "launchfacility_b_pri_status";
    level._id_78B9["gm2_inposition"] = "launchfacility_b_gm2_inposition";
    level._id_78B9["prepbreach"] = "launchfacility_b_pri_prepbreach";
    level._id_78B9["grg_inposition"] = "launchfacility_b_grg_inposition";
    level._id_78BA["price"]["pri_plantexplos"] = "launchfacility_b_pri_plantexplos";
    level._id_78B9["movingin"] = "launchfacility_b_gm2_movingin";
    level._id_78B9["pri_gogogo2"] = "launchfacility_b_pri_gogogo2";
    level._id_78B9["grg_clearR"] = "launchfacility_b_grg_clearR";
    level._id_78B9["entercodes"] = "launchfacility_b_pri_entercodes";
    level._id_78B9["hqr_confirm"] = "launchfacility_b_hqr_confirm";
    level._id_78B9["hqr_standby"] = "launchfacility_b_hqr_standby";
    level._id_78B9["hqr_crashed"] = "launchfacility_b_hqr_crashed";
    level._id_78B9["hqr_confdest"] = "launchfacility_b_hqr_confdest";
    level._id_78B9["checkfeed2"] = "launchfacility_b_gm2_checkfeed2";
    level._id_78B9["extractionpoint"] = "launchfacility_b_pri_extractionpoint";
    level._id_78B9["sendcoordinates"] = "launchfacility_b_gm1_sendcoordinates";
    level._id_78BA["price"]["vehicledepot"] = "launchfacility_b_pri_vehicledepot";
    level._id_78BA["price"]["pri_outtahere"] = "launchfacility_b_pri_outtahere";
    level._id_78B9["exfilfromarea"] = "launchfacility_b_hqr_exfilfromarea";
    level._id_78BA["grigsby"]["grg_company"] = "launchfacility_b_grg_company";
    level._id_78BA["price"]["pri_movemove"] = "launchfacility_b_pri_movemove";
    level._id_78B9["pri_movemove"] = "launchfacility_b_pri_movemove";
    level._id_78B9["takinfire"] = "launchfacility_b_gm1_takinfire";
    level._id_78B9["upthelift"] = "launchfacility_b_pri_upthelift";
    level._id_78BA["grigsby"]["grg_ashot"] = "launchfacility_b_grg_ashot";
    level._id_78BA["price"]["pri_getinline"] = "launchfacility_b_pri_getinline";
    level._id_78B9["takinfire"] = "launchfacility_b_gm1_takinfire";
    level._id_78BA["price"]["letsgo"] = "launchfacility_b_pri_letsgo";
    level._id_78BA["grigsby"]["grg_move"] = "launchfacility_b_grg_move";
    level._id_78B9["grg_10"] = "launchfacility_b_grg_10";
    level._id_78B9["grg_8"] = "launchfacility_b_grg_8";
    level._id_78B9["grg_6"] = "launchfacility_b_grg_6";
    level._id_78B9["grg_5"] = "launchfacility_b_grg_5";
    level._id_78B9["grg_4"] = "launchfacility_b_grg_4";
    level._id_78B9["grg_3"] = "launchfacility_b_grg_3";
}

play_gaz_elevator_radio( var_0 )
{
    _id_A5A4::_id_70BD( "takinfire" );
}

play_gaz_doors1_roger( var_0 )
{
    _id_A5A4::_id_70BD( "workinonit" );
}

play_gaz_doors2_standby( var_0 )
{
    _id_A5A4::_id_70BD( "almostthere" );
}

play_gaz_doors3_gotit( var_0 )
{
    _id_A5A4::_id_70BD( "gotit" );
    thread maps\launchfacility_b::vault_doors_team_ready();
    wait 0.5;
    common_scripts\utility::_id_383F( "vault_doors_unlocked" );
}

play_gaz_doors4_negative_scenecompletedevent()
{
    wait 3;
    maps\launchfacility_b::vault_door_scene_completed();
}

play_gaz_doors4_negative( var_0 )
{
    thread play_gaz_doors4_negative_scenecompletedevent();
    _id_A5A4::_id_70BD( "gm1_trypulling" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "pri_cheeky" );
}
