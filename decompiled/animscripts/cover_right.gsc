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

_id_4C80()
{
    var_0 = [];
    var_0["alert_idle"] = %corner_standr_alert_idle;
    var_0["alert_idle_twitch"] = [ %corner_standr_alert_twitch01, %corner_standr_alert_twitch04, %corner_standr_alert_twitch05, %corner_standr_alert_twitch06, %corner_standr_alert_twitch07 ];
    var_0["alert_idle_flinch"] = [ %corner_standr_flinch, %corner_standr_flinchb ];
    var_0["alert_to_A"] = [ %corner_standr_trans_alert_2_a, %corner_standr_trans_alert_2_a_v2 ];
    var_0["alert_to_B"] = [ %corner_standr_trans_alert_2_b, %corner_standr_trans_alert_2_b_v2, %corner_standr_trans_alert_2_b_v3 ];
    var_0["A_to_alert"] = [ %corner_standr_trans_a_2_alert_v2 ];
    var_0["A_to_alert_reload"] = [];
    var_0["A_to_B"] = [ %corner_standr_trans_a_2_b, %corner_standr_trans_a_2_b_v2 ];
    var_0["B_to_alert"] = [ %corner_standr_trans_b_2_alert, %corner_standr_trans_b_2_alert_v2, %corner_standr_trans_b_2_alert_v3 ];
    var_0["B_to_alert_reload"] = [ %corner_standr_reload_b_2_alert ];
    var_0["B_to_A"] = [ %corner_standr_trans_b_2_a, %corner_standr_trans_b_2_a_v2 ];
    var_0["lean_to_alert"] = [ %cornerstndr_lean_2_alert ];
    var_0["alert_to_lean"] = [ %cornerstndr_alert_2_lean ];
    var_0["look"] = %corner_standr_look;
    var_0["reload"] = [ %corner_standr_reload_v1 ];
    var_0["shotgun_reload"] = [ %shotgun_corner_standr_reload ];
    var_0["grenade_exposed"] = %corner_standr_grenade_a;
    var_0["grenade_safe"] = %corner_standr_grenade_b;
    var_0["blind_fire"] = [ %corner_standr_blindfire_v1, %corner_standr_blindfire_v2 ];
    var_0["alert_to_look"] = %corner_standr_alert_2_look;
    var_0["look_to_alert"] = %corner_standr_look_2_alert;
    var_0["look_to_alert_fast"] = %corner_standr_look_2_alert_fast;
    var_0["look_idle"] = %corner_standr_look_idle;
    var_0["stance_change"] = %cornercrr_stand_2_alert;
    var_0["lean_aim_down"] = %cornerstndr_lean_aim_2;
    var_0["lean_aim_left"] = %cornerstndr_lean_aim_4;
    var_0["lean_aim_straight"] = %cornerstndr_lean_aim_5;
    var_0["lean_aim_right"] = %cornerstndr_lean_aim_6;
    var_0["lean_aim_up"] = %cornerstndr_lean_aim_8;
    var_0["lean_reload"] = %cornerstndr_lean_reload;
    var_0["lean_idle"] = [ %cornerstndr_lean_idle ];
    var_0["lean_single"] = %cornerstndr_lean_fire;
    var_0["lean_fire"] = %cornerstndr_lean_auto;
    var_0["exposed_2_alert"] = %h1_cornerstndr_exposedstand_2_alert;
    anim._id_0CCA["soldier"]["cover_right_stand"] = var_0;
    var_0 = [];
    var_0["alert_idle"] = %cornercrr_alert_idle;
    var_0["alert_idle_twitch"] = [ %cornercrr_alert_twitch_v1, %cornercrr_alert_twitch_v2, %cornercrr_alert_twitch_v3 ];
    var_0["alert_idle_flinch"] = [];
    var_0["alert_to_A"] = [ %cornercrr_trans_alert_2_a ];
    var_0["alert_to_B"] = [ %cornercrr_trans_alert_2_b ];
    var_0["A_to_alert"] = [ %cornercrr_trans_a_2_alert ];
    var_0["AW_to_MW_alert_trans"] = %cornercrouchr_crouchidle_2_alert;
    var_0["1knee_2_2knees"] = %h1_cornercrouch_trans_2_2knee;
    var_0["A_to_alert_reload"] = [];
    var_0["A_to_B"] = [ %cornercrr_trans_a_2_b ];
    var_0["B_to_alert"] = [ %cornercrr_trans_b_2_alert ];
    var_0["B_to_alert_reload"] = [];
    var_0["B_to_A"] = [ %cornercrr_trans_b_2_a ];
    var_0["lean_to_alert"] = [ %cornercrr_lean_2_alert ];
    var_0["alert_to_lean"] = [ %cornercrr_alert_2_lean ];
    var_0["reload"] = [ %cornercrr_reloada, %cornercrr_reloadb ];
    var_0["shotgun_reload"] = [ %shotgun_cornercrr_reload_2knee ];
    var_0["grenade_exposed"] = %cornercrr_grenadea;
    var_0["grenade_safe"] = %cornercrr_grenadea;
    var_0["alert_to_over"] = [ %cornercrr_alert_2_over ];
    var_0["over_to_alert"] = [ %cornercrr_over_2_alert ];
    var_0["over_to_alert_reload"] = [];
    var_0["blind_fire"] = [];
    var_0["rambo90"] = [];
    var_0["rambo45"] = [];
    var_0["alert_to_look"] = %cornercrr_alert_2_look;
    var_0["look_to_alert"] = %cornercrr_look_2_alert;
    var_0["look_to_alert_fast"] = %cornercrr_look_2_alert_fast;
    var_0["look_idle"] = %cornercrr_look_idle;
    var_0["stance_change"] = %cornercrr_alert_2_stand;
    var_0["lean_aim_down"] = %cornercrr_lean_aim_2;
    var_0["lean_aim_left"] = %cornercrr_lean_aim_4;
    var_0["lean_aim_straight"] = %cornercrr_lean_aim_5;
    var_0["lean_aim_right"] = %cornercrr_lean_aim_6;
    var_0["lean_aim_up"] = %cornercrr_lean_aim_8;
    var_0["lean_idle"] = [ %cornercrr_lean_idle ];
    var_0["lean_single"] = %cornercrr_lean_fire;
    var_0["lean_fire"] = %cornercrr_lean_auto;
    anim._id_0CCA["soldier"]["cover_right_crouch"] = var_0;
}

main()
{
    self._id_0C50 = [];
    self._id_0C50["hiding"]["stand"] = ::_id_7DD4;
    self._id_0C50["hiding"]["crouch"] = ::_id_7DC7;
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_right" );
    animscripts\corner::_id_2222( "right", -90 );
}

end_script()
{
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::end_script( "right" );
}

_id_7DD4()
{
    self._id_4884 = -90;
    self.a._id_0CD8 = animscripts\utility::_id_5864( "cover_right_stand" );

    if ( isdefined( anim._id_7108 ) )
    {
        self.a._id_0CD8["rambo90"] = anim._id_7108._id_22C0;
        self.a._id_0CD8["rambo45"] = anim._id_7108._id_22BF;
        self.a._id_0CD8["grenade_rambo"] = anim._id_7108._id_22C1;
    }
}

_id_7DC7()
{
    self._id_4884 = -90;
    self.a._id_0CD8 = animscripts\utility::_id_5864( "cover_right_crouch" );
}
