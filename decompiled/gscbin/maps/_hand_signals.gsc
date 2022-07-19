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

_id_4DC4()
{
    level._id_78AC["generic"]["signal_moveout_cqb"] = %cqb_stand_signal_move_out;
    level._id_78AC["generic"]["signal_moveup_cqb"] = %cqb_stand_signal_move_up;
    level._id_78AC["generic"]["signal_stop_cqb"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["signal_onme_cqb"] = %cqb_stand_wave_on_me;
    level._id_78AC["generic"]["signal_enemy_cqb"] = %cqb_stand_signal_stop;
    level._id_78AC["generic"]["signal_moveout"] = %stand_exposed_wave_move_out;
    level._id_78AC["generic"]["signal_moveup"] = %stand_exposed_wave_move_up;
    level._id_78AC["generic"]["signal_stop"] = %stand_exposed_wave_halt;
    level._id_78AC["generic"]["signal_onme"] = %stand_exposed_wave_on_me;
    level._id_78AC["generic"]["signal_enemy"] = %stand_exposed_wave_target_spotted;
    level._id_78AC["generic"]["signal_go"] = %stand_exposed_wave_go;
    level._id_78AC["generic"]["signal_moveout_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_moveup_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_stop_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_onme_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_enemy_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_go_crouch"] = %cqb_stand_wave_go_v1;
    level._id_78AC["generic"]["signal_moveout_coverR"] = %cornerstndr_alert_signal_move_out;
    level._id_78AC["generic"]["signal_moveup_coverR"] = %cornerstndr_alert_signal_move_out;
    level._id_78AC["generic"]["signal_stop_coverR"] = %cornerstndr_alert_signal_stopstay_down;
    level._id_78AC["generic"]["signal_onme_coverR"] = %cornerstndr_alert_signal_on_me;
    level._id_78AC["generic"]["signal_enemy_coverR"] = %cornerstndr_alert_signal_enemy_spotted;
    level._id_78AC["generic"]["signal_go_coverR"] = %cornerstndr_alert_signal_move_out;
    level._id_78AC["generic"]["signal_moveout_coverL"] = %corner_standl_signal_move;
    level._id_78AC["generic"]["signal_moveup_coverL"] = %corner_standl_signal_move;
    level._id_78AC["generic"]["signal_stop_coverL"] = %corner_standl_signal_hold;
    level._id_78AC["generic"]["signal_onme_coverL"] = %corner_standl_signal_move;
    level._id_78AC["generic"]["signal_enemy_coverL"] = %corner_standl_signal_look;
    level._id_78AC["generic"]["signal_go_coverL"] = %corner_standl_signal_move;
}
