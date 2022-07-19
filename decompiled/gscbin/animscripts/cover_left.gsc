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

_id_4C7D()
{
    var_0 = [];
    var_0["alert_idle"] = %corner_standl_alert_idle;
    var_0["alert_idle_twitch"] = [ %corner_standl_alert_twitch01, %corner_standl_alert_twitch03, %corner_standl_alert_twitch04, %corner_standl_alert_twitch06, %corner_standl_alert_twitch07 ];
    var_0["alert_idle_flinch"] = [ %corner_standl_flinch ];
    var_0["alert_to_A"] = [ %corner_standl_trans_alert_2_a ];
    var_0["alert_to_B"] = [ %corner_standl_trans_alert_2_b_v2 ];
    var_0["A_to_alert"] = [ %corner_standl_trans_a_2_alert_v2 ];
    var_0["A_to_alert_reload"] = [];
    var_0["A_to_B"] = [ %corner_standl_trans_a_2_b_v2 ];
    var_0["B_to_alert"] = [ %corner_standl_trans_b_2_alert_v2 ];
    var_0["B_to_alert_reload"] = [ %corner_standl_reload_b_2_alert ];
    var_0["B_to_A"] = [ %corner_standl_trans_b_2_a_v2 ];
    var_0["lean_to_alert"] = [ %cornerstndl_lean_2_alert ];
    var_0["alert_to_lean"] = [ %cornerstndl_alert_2_lean ];
    var_0["look"] = %corner_standl_look;
    var_0["reload"] = [ %corner_standl_reload_v1 ];
    var_0["shotgun_reload"] = [ %shotgun_corner_standl_reload ];
    var_0["grenade_exposed"] = %corner_standl_grenade_a;
    var_0["grenade_safe"] = %corner_standl_grenade_b;
    var_0["blind_fire"] = [ %corner_standl_blindfire_v1, %corner_standl_blindfire_v2 ];
    var_0["alert_to_look"] = %corner_standl_alert_2_look;
    var_0["look_to_alert"] = %corner_standl_look_2_alert;
    var_0["look_to_alert_fast"] = %corner_standl_look_2_alert_fast_v1;
    var_0["look_idle"] = %corner_standl_look_idle;
    var_0["stance_change"] = %cornercrl_stand_2_alert;
    var_0["lean_aim_down"] = %cornerstndl_lean_aim_2;
    var_0["lean_aim_left"] = %cornerstndl_lean_aim_4;
    var_0["lean_aim_straight"] = %cornerstndl_lean_aim_5;
    var_0["lean_aim_right"] = %cornerstndl_lean_aim_6;
    var_0["lean_aim_up"] = %cornerstndl_lean_aim_8;
    var_0["lean_reload"] = %cornerstndl_lean_reload;
    var_0["lean_idle"] = [ %cornerstndl_lean_idle ];
    var_0["lean_single"] = %cornerstndl_lean_fire;
    var_0["lean_fire"] = %cornerstndl_lean_auto;
    var_0["exposed_2_alert"] = %h1_cornerstndl_exposedstand_2_alert;
    anim._id_0CCA["soldier"]["cover_left_stand"] = var_0;
    var_0 = [];
    var_0["alert_idle"] = %cornercrl_alert_idle;
    var_0["alert_idle_twitch"] = [];
    var_0["alert_idle_flinch"] = [];
    var_0["alert_to_A"] = [ %cornercrl_trans_alert_2_a ];
    var_0["alert_to_B"] = [ %cornercrl_trans_alert_2_b ];
    var_0["A_to_alert"] = [ %cornercrl_trans_a_2_alert ];
    var_0["AW_to_MW_alert_trans"] = %cornercrouchl_crouchidle_2_alert;
    var_0["1knee_2_2knees"] = %h1_cornercrl_trans_2_2knees;
    var_0["A_to_alert_reload"] = [];
    var_0["A_to_B"] = [ %cornercrl_trans_a_2_b ];
    var_0["B_to_alert"] = [ %cornercrl_trans_b_2_alert ];
    var_0["B_to_alert_reload"] = [];
    var_0["B_to_A"] = [ %cornercrl_trans_b_2_a ];
    var_0["lean_to_alert"] = [ %cornercrl_lean_2_alert ];
    var_0["alert_to_lean"] = [ %cornercrl_alert_2_lean ];
    var_0["look"] = %cornercrl_look_fast;
    var_0["reload"] = [ %cornercrl_reloadb ];
    var_0["shotgun_reload"] = [ %shotgun_cornercrl_reload ];
    var_0["grenade_safe"] = %cornercrl_grenadea;
    var_0["grenade_exposed"] = %cornercrl_grenadeb;
    var_0["alert_to_over"] = [ %cornercrl_alert_2_over ];
    var_0["over_to_alert"] = [ %cornercrl_over_2_alert ];
    var_0["over_to_alert_reload"] = [];
    var_0["blind_fire"] = [];
    var_0["rambo90"] = [];
    var_0["rambo45"] = [];
    var_0["stance_change"] = %cornercrl_alert_2_stand;
    var_0["lean_aim_down"] = %cornercrl_lean_aim_2;
    var_0["lean_aim_left"] = %cornercrl_lean_aim_4;
    var_0["lean_aim_straight"] = %cornercrl_lean_aim_5;
    var_0["lean_aim_right"] = %cornercrl_lean_aim_6;
    var_0["lean_aim_up"] = %cornercrl_lean_aim_8;
    var_0["lean_idle"] = [ %cornercrl_lean_idle ];
    var_0["lean_single"] = %cornercrl_lean_fire;
    var_0["lean_fire"] = %cornercrl_lean_auto;
    anim._id_0CCA["soldier"]["cover_left_crouch"] = var_0;
}

main()
{
    self._id_0C50 = [];
    self._id_0C50["hiding"]["stand"] = ::_id_7DD3;
    self._id_0C50["hiding"]["crouch"] = ::_id_7DC6;
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_left" );
    animscripts\corner::_id_2222( "left", 90 );
}

end_script()
{
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::end_script( "left" );
}

_id_7DD3()
{
    self._id_4884 = 90;
    self.a._id_0CD8 = animscripts\utility::_id_5864( "cover_left_stand" );

    if ( isdefined( anim._id_7108 ) )
    {
        self.a._id_0CD8["rambo90"] = anim._id_7108._id_22A9;
        self.a._id_0CD8["rambo45"] = anim._id_7108._id_22A8;
        self.a._id_0CD8["grenade_rambo"] = anim._id_7108._id_22AA;
    }
}

_id_7DC6()
{
    self._id_4884 = 90;
    self.a._id_0CD8 = animscripts\utility::_id_5864( "cover_left_crouch" );
}
