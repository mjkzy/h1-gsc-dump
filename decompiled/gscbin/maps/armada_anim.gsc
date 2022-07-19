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

anim_main()
{
    _id_A510::_id_0807( "generic", "fire", maps\armada::kill_during_breach, "detcord_stack_leftbreach_02" );
    anim_blackhawk();
    level._id_78AC["generic"]["jog"] = %combat_jog;
    level._id_78AC["generic"]["walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["price"]["hunted_open_barndoor"] = %h1_armada_vasquez_open_door;
    level._id_78AC["price"]["hunted_open_barndoor_stop"] = %h1_armada_vasquez_open_door_stop;
    level._id_78AC["price"]["hunted_open_barndoor_idle"][0] = %h1_armada_vasquez_open_door_idle;
    animated_model_setup();
    level._id_78AC["razorwire_guy"]["razor_setup"] = %armada_wire_setup_guy;
    level._id_78AC["barbed_wire_long"]["razor_setup"] = %armada_wire_setup_wire;
    level._id_78AC["razorwire_guy"]["razor_idle"] = %armada_wire_setup_guy_startidle;
    level._id_78AC["barbed_wire_long"]["razor_idle"] = %armada_wire_setup_wire_startidle;
    level._id_78AC["razorwire_guy"]["razor_endidle"] = %armada_wire_setup_guy;
    level._id_78AC["barbed_wire_long"]["razor_endidle"] = %armada_wire_setup_wire_endidle;
    level._id_78B1["barbed_wire_long"] = #animtree;
    level._id_78AC["griggs"]["enter"] = %armada_grigs_enter;
    _id_A510::_id_080B( "griggs", "dialog", "enter", "armada_grg_scoreone" );
    _id_A510::_id_080B( "griggs", "dialog", "enter", "armada_grg_rogerMS" );
    _id_A510::_id_080B( "griggs", "dialog", "enter", "armada_grg_yeahoorah" );
    _id_A510::_id_0806( "griggs", "attach_usbkey", "h1_me_armada_usb_device", "tag_weapon_chest", "enter" );
    _id_A510::_id_0808( "griggs", "detach_usbkey", "h1_me_armada_usb_device", "tag_weapon_chest", "enter" );
    _id_A510::_id_080F( "griggs", "Grab_USB", "trash_asad_usb", "enter" );
    _id_A510::_id_080F( "griggs", "Throw_USB", "grounded_asad_usb", "enter" );
    _id_A510::_id_0807( "griggs", "detach_usbkey", maps\armada::ending_griggs_usbkey_think, "enter" );
    level._id_78AC["final_breacher_shotgun"]["react"] = %armada_left_guy_react;
    level._id_78AC["final_breacher_right"]["react"] = %armada_right_guy_react;
    level._id_78AC["price"]["enter"] = %armada_sarge_enter;
    _id_A510::_id_080B( "price", "dialog", "enter", "armada_vsq_griggsmusic" );
    _id_A510::_id_080B( "price", "dialog", "enter", "armada_vsq_recording" );
    _id_A510::_id_080B( "price", "dialog", "enter", "armada_vsq_rogercommand" );
    _id_A510::_id_080B( "price", "dialog", "enter", "armada_vsq_rallyup" );
    _id_0BEE();
    level._id_78BA["price"]["targetbuilding"] = "armada_vsq_targetbuilding";
    level._id_78BA["price"]["throwflash"] = "armada_vsq_throwflash";
    level._id_78BA["griggs"]["watchsix"] = "armada_grg_watchsix";
    level._id_78BA["price"]["allcallsigns"] = "armada_vsq_allcallsigns";
    level._id_78BA["generic"]["negid"] = "armada_gm1_negid";
    level._id_78BA["generic"]["nosign"] = "armada_gm2_nosign";
    level._id_78BA["generic"]["oorah1"] = "armada_gm2_oorah";
    level._id_78BA["generic"]["oorah2"] = "armada_gm3_oorah";
    level._id_78BA["generic"]["armada_gm1_clear"] = "armada_gm1_clear";
    level._id_78BA["generic"]["armada_gm2_clear"] = "armada_gm2_clear";
    level._id_78BA["generic"]["armada_gm3_roomclear"] = "armada_gm3_roomclear";
    level._id_78BA["generic"]["armada_gm2_nothere"] = "armada_gm2_nothere";
    level._id_78BA["generic"]["armada_gm1_onaloop"] = "armada_gm1_onaloop";
    level._id_78BA["price"]["jacksonpoint"] = "armada_vsq_jacksonpoint";
    level._id_78BA["price"]["stand_down"] = "armada_vsq_donthavealasad";
    level._id_78BA["price"]["roger_hq"] = "armada_vsq_rogerthat";
    level._id_78BA["price"]["heads_up"] = "armada_vsq_halfclickeast";
    level._id_78BA["price"]["move_out"] = "armada_vsq_moveout";
    level._id_78BA["generic"]["tvstation"] = "armada_gm1_tvstation";
    level._id_78BA["price"]["get_into_pos"] = "armada_vsq_getintoposition";
    level._id_78BA["price"]["do_it"] = "armada_vsq_doit";
    level._id_78BA["generic"]["breaching_breaching"] = "armada_gm1_breachingbreaching";
    level._id_78BA["price"]["room_clear"] = "armada_vsq_roomclear";
    level._id_78BA["generic"]["goesourboys"] = "armada_gm1_goesourboys";
    level._id_78BA["griggs"]["hold_fire"] = "armada_grg_holdfire";
    level._id_78BA["griggs"]["no_sign"] = "armada_grg_nosign";
    level._id_78BA["price"]["fall_in"] = "armada_vsq_fallin";
    level._id_78BA["griggs"]["I_hear_him"] = "armada_grg_ihearhim";
    level._id_78BA["griggs"]["score_one"] = "armada_grg_scoreone";
    level._id_78BA["price"]["grigs_music"] = "armada_vsq_griggsmusic";
    level._id_78BA["griggs"]["roger_that"] = "armada_grg_rogerMS";
    level._id_78BA["price"]["recording"] = "armada_vsq_recording";
    level._id_78BA["griggs"]["yeahhh"] = "armada_grg_yeahoorah";
    level._id_78BA["price"]["roger_command"] = "armada_vsq_rogercommand";
    level._id_78BA["price"]["new_assign"] = "armada_vsq_rallyup";
}

guy_snipe( var_0, var_1 )
{
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    self notify( "ropeidleend" );

    if ( var_1 == 2 )
        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, %armada_blackhawk_sniper_idle );

    thread _id_A5A9::_id_449B( var_0, var_1 );
}
#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_tree_palm_tall_3"]["still"] = %palmtree_tall3_still;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["strong"] = %palmtree_tall3_sway;
    level.anim_prop_models["foliage_tree_palm_med_2"]["still"] = %palmtree_med2_still;
    level.anim_prop_models["foliage_tree_palm_med_2"]["strong"] = %palmtree_med2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["still"] = %palmtree_bushy1_still;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["strong"] = %palmtree_bushy1_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["still"] = %palmtree_bushy2_still;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["strong"] = %palmtree_bushy2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_med_1"]["still"] = %palmtree_med1_still;
    level.anim_prop_models["foliage_tree_palm_med_1"]["strong"] = %palmtree_med1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["still"] = %palmtree_tall1_still;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["strong"] = %palmtree_tall1_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["strong"] = %afr_tree_fanpalm_sway;
}
#using_animtree("vehicles");

anim_blackhawk()
{
    level._id_78B1["blackhawk"] = #animtree;
    level._id_78AC["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}

player_heli_ropeanimoverride()
{
    var_0 = "TAG_FastRope_RI";
    var_1 = "rope_test_ri";
    var_2 = %armada_blackhawk_sniper_idle_fastrope80;
    var_3 = %armada_blackhawk_sniper_idle_loop_fastrope80;
    var_4 = %armada_blackhawk_sniper_drop_fastrope80;
    var_5 = [];
    var_5["TAG_FastRope_RI"] = spawnstruct();
    self._id_0DE8 = var_5;
    var_6 = spawn( "script_model", level.playercardbackground.origin );
    var_6 setmodel( var_1 );
    var_6 linkto( self, var_0, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_6 useanimtree( #animtree );
    thread player_heli_ropeanimoverride_idle( var_6, var_0, var_3 );
    self waittill( "unloading" );
    level.playercardbackground thread _id_A5A4::_id_69C4( "scn_armada_intro_foley" );
    thread _id_A5A9::_id_0C74( var_6, var_0, var_4 );
    wait(getanimlength( var_4 ) - 1.8);
    var_6 unlink();
    wait 10;
    var_6 delete();
}

player_heli_ropeanimoverride_idle( var_0, var_1, var_2 )
{
    self endon( "unloading" );

    for (;;)
        _id_A5A9::_id_0C74( var_0, var_1, var_2 );
}
#using_animtree("animated_props");

_id_0BEE()
{
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["still"] = %h1_foliage_backlot_palm_tree_03_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["strong"] = %h1_foliage_backlot_palm_tree_03_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["heli"] = %h1_foliage_backlot_palm_tree_03_hero_heliwash;
    level._id_78B1["asad_usbkey"] = #animtree;
    level._id_78B5["asad_usbkey"] = "h1_me_armada_usb_device";
    level._id_78AC["asad_usbkey"]["enter"] = %h1_armada_grigs_enter_usbdevice;
}
