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
    if ( maps\village_defend_beautiful_corner::beautiful_corner() )
        return;

    precachemodel( "projectile_cbu97_clusterbomb" );
    precachemodel( "tag_origin" );
    precachemodel( "weapon_javelin_obj" );
    precachemodel( "vehicle_av8b_harrier_jet" );
    precachemodel( "ctl_weapon_c4_detonator_animated" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precacheitem( "javelin" );
    precacheitem( "airstrike_support" );
    precacheitem( "flash_grenade" );
    precacheshader( "popmenu_bg" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precacheshader( "compass_objpoint_airstrike" );
    precacheshader( "hud_dpad" );
    precacheshader( "hud_arrow_down" );
    precacheshader( "white" );
    precacheshader( "black" );
    precacheshader( "h1_hud_temperature_border" );
    precacheshader( "h1_hud_temperature_blur" );
    precacheshader( "h1_hud_temperature_icon" );
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 600 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    precachestring( &"VILLAGE_DEFEND_HINT_SPINUP_MINIGUN" );
    precachestring( &"VILLAGE_DEFEND_HELICOPTER_EXTRACTION" );
    precachestring( &"VILLAGE_DEFEND_HELICOPTER_WARNING" );
    precachestring( &"VILLAGE_DEFEND_CASREADY" );
    precachestring( &"SCRIPT_PLATFORM_HINT_GET_DETONATOR" );
    precachestring( &"VILLAGE_DEFEND_TAKE_UP_A_DEFENSIVE_POSITION" );
    precachestring( &"VILLAGE_DEFEND_DEFEND_THE_SOUTHERN_HILL" );
    precachestring( &"VILLAGE_DEFEND_FALL_BACK_AND_DEFEND" );
    precachestring( &"VILLAGE_DEFEND_USE_THE_DETONATORS_IN" );
    precachestring( &"VILLAGE_DEFEND_FALL_BACK_TO_THE_FARM" );
    precachestring( &"VILLAGE_DEFEND_GET_THE_JAVELIN_IN_THE" );
    precachestring( &"VILLAGE_DEFEND_SURVIVE_UNTIL_THE_HELICOPTER" );
    precachestring( &"VILLAGE_DEFEND_GET_TO_THE_LZ" );
    precachestring( &"VILLAGE_DEFEND_BOARD_THE_HELICOPTER" );
    precachestring( &"VILLAGE_DEFEND_USE_THE_DETONATORS_IN1" );
    precachestring( &"VILLAGE_DEFEND_DESTROY_THE_INCOMING" );
    precachestring( &"VILLAGE_DEFEND_OBTAIN_NEW_ORDERS_FROM" );
    precachestring( &"VILLAGE_DEFEND_YOU_DIDNT_REACH_THE_HELICOPTER" );
    precachestring( &"VILLAGE_DEFEND_CLOSE_AIR_SUPPORT_STANDING" );
    precachestring( &"VILLAGE_DEFEND_CLOSE_AIR_SUPPORT_STANDING_PC" );
    precachestring( &"VILLAGE_DEFEND_DESTROY_THE_INCOMING1" );
    precachestring( &"VILLAGE_DEFEND_AIRSTRIKE_UNAVAIL" );
    precachestring( &"SCRIPT_PLATFORM_SPOOL_MINIGUN" );
    precacherumble( "minigun_rumble" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_heavy_500" );
    precacherumble( "generic_attack_heavy_1000" );
    maps\air_support_shared::air_support_precache();
    _id_A5A4::_id_7DF3();
    _id_A5A4::_id_079C( "southern_hill", ::start_southern_hill, &"STARTS_SOUTHERNHILL" );
    _id_A5A4::_id_079C( "minigun_fallback", ::start_minigun_fallback, &"STARTS_MINIGUNFALLBACK" );
    _id_A5A4::_id_079C( "minigun", ::start_minigun, &"STARTS_MINIGUN" );
    _id_A5A4::_id_079C( "helidrop", ::start_helidrop, &"STARTS_HELIDROP" );
    _id_A5A4::_id_079C( "clackers", ::start_clackers, &"STARTS_CLACKERS" );
    _id_A5A4::_id_079C( "field_fallback", ::start_field_fallback, &"STARTS_FIELDFALLBACK" );
    _id_A5A4::_id_079C( "javelin", ::start_javelin, &"STARTS_JAVELIN" );
    _id_A5A4::_id_079C( "final_battle", ::start_final_battle, &"STARTS_FINALBATTLE" );
    _id_A5A4::_id_079C( "seaknight", ::start_seaknight, &"STARTS_SEAKNIGHT1" );
    _id_A5A4::_id_278B( ::start_village_defend );
    createthreatbiasgroup( "player" );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_saw_clip";
    level.weaponclipmodels[2] = "weapon_g36_clip";
    level.weaponclipmodels[3] = "weapon_ak74u_clip";
    level.weaponclipmodels[4] = "weapon_dragunov_clip";
    level.weaponclipmodels[5] = "weapon_mp5_clip";
    level.weaponclipmodels[6] = "weapon_m16_clip";
    maps\village_defend_precache::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    _id_A550::_id_7E9E( "viewhands_player_sas_woodland" );
    maps\village_defend_fx::main();
    maps\village_defend_anim::main();
    maps\createart\village_defend_art::main();
    _id_A550::main();
    maps\_javelin::init();
    maps\village_defend_lighting::main();
    maps\village_defend_aud::main();
    maps\_c4::main();
    level.killzonebigexplosion_fx = loadfx( "fx/explosions/artilleryExp_dirt_brown_va" );
    level.killzonemudexplosion_fx = loadfx( "fx/explosions/grenadeExp_mud_1" );
    level.killzonedirtexplosion_fx = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level.killzonefuelexplosion_fx = loadfx( "fx/explosions/grenadeExp_fuel" );
    killzonefxprogram();
    _id_A51D::setupminimap( "compass_map_village_defend" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _id_A5A4::_id_5926();
    level._id_6F7C._id_0C72 = "price";
    level._id_3C61 = getent( "redshirt2", "targetname" );
    level._id_3C61 _id_A5A4::_id_5926();
    level._id_3C61._id_0C72 = "gaz";
    level.redshirt = getent( "redshirt1", "targetname" );
    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    setdvar( "village_defend_one_minute", "0" );
    common_scripts\utility::_id_383D( "intro_tank_fire_authorization" );
    common_scripts\utility::_id_383D( "church_tower_explodes" );
    common_scripts\utility::_id_383D( "stop_ambush_music" );
    common_scripts\utility::_id_383D( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383D( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383D( "objective_price_on_ridgeline" );
    common_scripts\utility::_id_383D( "objective_on_ridgeline" );
    common_scripts\utility::_id_383D( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383D( "objective_player_uses_minigun" );
    common_scripts\utility::_id_383D( "objective_player_at_vantage_point" );
    common_scripts\utility::_id_383D( "price_ordered_hill_detonation" );
    common_scripts\utility::_id_383D( "southern_hill_action_started" );
    common_scripts\utility::_id_383D( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383D( "southern_mg_openfire" );
    common_scripts\utility::_id_383D( "southern_hill_smoked" );
    common_scripts\utility::_id_383D( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383D( "enemy_breached_wire" );
    common_scripts\utility::_id_383D( "ridgeline_targeted" );
    common_scripts\utility::_id_383D( "ridgeline_unsafe" );
    common_scripts\utility::_id_383D( "disable_overheat" );
    common_scripts\utility::_id_383D( "helidrop_started" );
    common_scripts\utility::_id_383D( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383D( "divert_for_clacker" );
    common_scripts\utility::_id_383D( "stop_minigun_fallback_shouting" );
    common_scripts\utility::_id_383D( "objective_detonators" );
    common_scripts\utility::_id_383D( "detonators_activate" );
    common_scripts\utility::_id_383D( "got_the_clacker" );
    common_scripts\utility::_id_383D( "clacker_has_been_exercised" );
    common_scripts\utility::_id_383D( "crashsite_exploded" );
    common_scripts\utility::_id_383D( "cliffside_exploded" );
    common_scripts\utility::_id_383D( "nearslope_exploded" );
    common_scripts\utility::_id_383D( "farslope_exploded" );
    common_scripts\utility::_id_383D( "clacker_far_and_near_slope_done" );
    common_scripts\utility::_id_383D( "spawncull" );
    common_scripts\utility::_id_383D( "player_entered_clacker_house_top_floor" );
    common_scripts\utility::_id_383D( "storm_the_tavern" );
    common_scripts\utility::_id_383D( "player_running_to_farm" );
    common_scripts\utility::_id_383D( "fall_back_to_barn" );
    common_scripts\utility::_id_383D( "farm_reached" );
    common_scripts\utility::_id_383D( "objective_armor_arrival" );
    common_scripts\utility::_id_383D( "got_the_javelin" );
    common_scripts\utility::_id_383D( "objective_all_tanks_destroyed" );
    common_scripts\utility::_id_383D( "kill_jav_glow" );
    common_scripts\utility::_id_383D( "start_final_battle" );
    common_scripts\utility::_id_383D( "return_trip_begins" );
    common_scripts\utility::_id_383D( "airstrikes_ready" );
    common_scripts\utility::_id_383D( "falcon_one_finished_talking" );
    common_scripts\utility::_id_383D( "engage_delaying_action" );
    common_scripts\utility::_id_383D( "objective_get_to_lz" );
    common_scripts\utility::_id_383D( "rescue_chopper_ingress" );
    common_scripts\utility::_id_383D( "seaknight_can_be_boarded" );
    common_scripts\utility::_id_383D( "lz_reached" );
    common_scripts\utility::_id_383D( "no_more_grenades" );
    common_scripts\utility::_id_383D( "player_made_it" );
    common_scripts\utility::_id_383D( "player_made_it_with_rescue" );
    common_scripts\utility::_id_383D( "minigun_lesson_learned" );
    common_scripts\utility::_id_383D( "all_fake_friendlies_aboard" );
    common_scripts\utility::_id_383D( "all_real_friendlies_on_board" );
    common_scripts\utility::_id_383D( "seaknight_guards_boarding" );
    common_scripts\utility::_id_383D( "seaknight_unboardable" );
    common_scripts\utility::_id_383D( "aa_southernhill" );
    common_scripts\utility::_id_383D( "aa_minigun" );
    common_scripts\utility::_id_383D( "aa_detonators" );
    common_scripts\utility::_id_383D( "aa_fallback" );
    common_scripts\utility::_id_383D( "aa_javelin" );
    common_scripts\utility::_id_383D( "aa_returntrip" );
    common_scripts\utility::_id_383D( "airstrike_in_progress" );
    common_scripts\utility::_id_383D( "open_bay_doors" );

    if ( level._id_3BFE == 0 )
    {
        level.southernhilladvancebaglimit = 4;
        level.minigunbreachbaglimit = 4;
    }

    if ( level._id_3BFE == 1 )
    {
        level.southernhilladvancebaglimit = 6;
        level.minigunbreachbaglimit = 6;
    }

    if ( level._id_3BFE == 2 )
    {
        level.southernhilladvancebaglimit = 8;
        level.minigunbreachbaglimit = 8;
    }

    if ( level._id_3BFE == 3 )
    {
        level.southernhilladvancebaglimit = 10;
        level.minigunbreachbaglimit = 10;
    }

    if ( getdvar( "village_defend_one_minute" ) != "1" )
        level._id_8F0D = 4;
    else
        level._id_8F0D = 1;

    level.encroachminwait = 3;
    level.encroachmaxwait = 5;
    level.magicsnipertalk = 1;
    level.southern_hill_magic_sniper_min_cycletime = 5;
    level.southern_hill_magic_sniper_max_cycletime = 15;
    level.southernmortarintrotimer = 3.5;
    level.southernmortarkilltimer = 25;
    level.genericbaitcount = 0;
    level.irrelevantdist = 1000;
    level.irrelevantpoplimit = 8;
    level.divertclackerrange = 1000;
    level.encroachrate = 0.85;
    level.objectiveclackers = 0;
    level.tankpop = 4;
    level.tankid = 0;
    level thread maps\village_defend_code::minigun_const();
    common_scripts\utility::_id_76BB( "minigun", maps\village_defend_code::minigun_think );
    level.fly_swatter_kill_count = 0;
    level thread stash_counter();
    common_scripts\utility::_id_76BB( "pvt_parity_org", _id_A546::display_custom_nameplate, maps\village_defend_code::can_display_pvt_parity_name, "Pvt. Parity", "allies" );
    level.aspawners = getspawnerarray();
    level.aroutenodes = getnodearray( "flanking_route", "targetname" );
    level.airstrikecalledrecently = 0;
    level.airstriker = level.playercardbackground;
    level.maxai = 32;
    level.reqslots = 8;
    level.detectioncycletime = 45;
    level.smokebuildtime = 8;
    level.smokespawnsafedist = 640;
    level.detectionrefreshtime = 3;
    level.volumedesertiontime = 6;
    level.lowplaneflyby = 0;
    level.strikezonegraceperiod = 20;
    level.airstrikecooldown = 135;
    level.dangerclosesafedist = 1200;
    level.airstrikesupportcallsremaining = 5;
    level.sasseaknightboarded = 0;
    level.minigunsessions = 0;
    level.delayingactionenemywaves = 0;
    level.activeairstrikes = 0;

    if ( level._id_3BFE == 0 )
        level.enemywavesallowed = 1;
    else if ( level._id_3BFE == 1 )
        level.enemywavesallowed = 3;
    else if ( level._id_3BFE == 2 )
        level.enemywavesallowed = 4;
    else if ( level._id_3BFE == 3 )
        level.enemywavesallowed = 5;

    level.sniperfx = "weap_m40a3sniper_fire_village";
    level thread _id_6302();
    level thread magic_sniper();
    level thread southern_hill_ambush_mg();
    level thread southern_hill_vanguard_setup();
    level thread friendly_setup();
    level thread southern_hill_killzone_sequence();
    level thread helidrop();
    level thread clacker_init();
    level thread clacker_primary_attack();
    level thread player_interior_detect_init();
    level thread enemy_interior_flashbangs();
    level thread javelin_init();
    level thread tanks_init();
    level thread barn_helidrop();
    level thread field_fallback();
    level thread barn_fallback();
    level thread final_battle();
    level thread autosaves_return_trip();
    level thread airstrike_command();
    level thread begin_delaying_action();
    level thread begin_delaying_action_timeout();
    level thread player_detection_volume_init();
    level thread escape_fallback();
    level thread _id_5FFB();
    level thread seaknight_music();
    level thread southern_hill_shotmonitor();
    level thread return_trip_friendly_boost();
    var_0 = [];
    var_0[0] = 0.3;
    var_0[1] = 0.6;
    var_0[2] = 1;
    var_0[3] = 1.2;
    level.village_diff = var_0;
    level thread return_trip_enemy_acc_prep();
    _id_A5A4::_id_0764( "minigun_spin_left_trigger", &"SCRIPT_PLATFORM_SPOOL_MINIGUN", ::should_break_minigun_spin_hint );
    _id_A5A4::_id_0764( "minigun_spin_keyboard", &"SCRIPT_PLATFORM_SPOOL_MINIGUN_KEYBOARD", ::should_break_minigun_spin_hint );
    level.playersafetyblocker = getent( "helo_safety_blocker", "targetname" );
    level.playersafetyblocker notsolid();
    level.playerheliblocker = getent( "heli_blocker", "targetname" );
    level.playerheliblocker notsolid();
    thread village_defend_wibble_think();
}

stash_counter()
{
    var_0 = 0;
    level endon( "church_tower_explodes" );

    while ( var_0 < 8 )
    {
        level.playercardbackground waittill( "weapon_fired" );
        var_1 = level.playercardbackground getcurrentweapon();

        if ( var_1 == "rpg_player" )
            var_0++;
    }

    _id_A5A4::_id_41DD( "THE_MAN_IN_THE_HIGH_TOWER" );
}

should_break_minigun_spin_hint()
{
    var_0 = getent( "minigun", "targetname" );
    var_1 = var_0 getturretowner();

    if ( !isdefined( var_1 ) )
    {
        level.minigun_console_hint_displayed = undefined;
        return 1;
    }

    if ( !common_scripts\utility::_id_382E( "minigun_lesson_learned" ) )
        return 0;

    return self == var_1;
}

start_village_defend()
{
    _id_A5E8::_id_870C( "aud_start_default_checkpoint" );
    thread intro();
    level._id_8BE1 = 1;
    level.playercardbackground setthreatbiasgroup( "player" );
    setignoremegroup( "axis", "allies" );
    setignoremegroup( "allies", "axis" );
    setignoremegroup( "player", "axis" );
}

start_southern_hill()
{
    _id_A5E8::_id_870C( "aud_start_southern_hill_checkpoint" );
    level.playercardbackground setthreatbiasgroup( "player" );
    setignoremegroup( "axis", "allies" );
    setignoremegroup( "allies", "axis" );
    setignoremegroup( "player", "axis" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    var_0 = getnode( "player_southern_start", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    var_1 = getnode( "price_southern_start", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( var_1.origin );
    var_2 = getentarray( "introHillTrig", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] notify( "trigger" );

    thread southern_hill_defense();
}

start_minigun_fallback()
{
    _id_A5E8::_id_870C( "aud_start_minigun_fallback_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    var_0 = getnode( "player_southern_start", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    var_1 = getnode( "price_southern_start", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( var_1.origin );
    thread moveredshirts( "redshirt_southern_start1", "redshirt_southern_start2" );
    var_2 = getentarray( "introHillTrig", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] notify( "trigger" );

    thread southern_hill_smokescreens();
    thread saw_gunner_friendly();
}

start_minigun()
{
    _id_A5E8::_id_870C( "aud_start_minigun_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    var_0 = getnode( "player_start_minigun", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    var_1 = getnode( "fallback_price", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( var_1.origin );
    level._id_6F7C _meth_81a9( var_1 );
    thread moveredshirts( "fallback_redshirt1", "fallback_redshirt2" );
    thread southern_hill_mortars_killtimer();
    thread minigun_primary_attack();
    thread minigun_smokescreens();
    thread saw_gunner_friendly();
}

start_helidrop()
{
    _id_A5E8::_id_870C( "aud_start_helidrop_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
    var_0 = getnode( "player_start_minigun", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    var_1 = getnode( "fallback_price", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81c9( var_1.origin );
    level._id_6F7C _meth_81a9( var_1 );
    thread moveredshirts( "fallback_redshirt1", "fallback_redshirt2" );
    thread southern_hill_mortars_killtimer();
    thread minigun_primary_attack();
    thread minigun_smokescreens();
    thread saw_gunner_friendly();
}

start_clackers()
{
    _id_A5E8::_id_870C( "aud_start_clackers_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "detonators_activate" );
    var_0 = getnode( "player_start_clacker", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    thread southern_hill_mortars_killtimer();
    thread minigun_primary_attack();
    thread minigun_smokescreens();
    thread saw_gunner_friendly();
    wait 7;
    common_scripts\utility::_id_383F( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
}

start_field_fallback()
{
    _id_A5E8::_id_870C( "aud_start_field_fallback_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
    common_scripts\utility::_id_383F( "fall_back_to_barn" );
    common_scripts\utility::_id_383F( "barn_assault_begins" );
    common_scripts\utility::_id_383F( "objective_armor_arrival" );
    common_scripts\utility::_id_383F( "storm_the_tavern" );
    var_0 = getnode( "player_start_clacker", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    thread southern_hill_mortars_killtimer();
    thread minigun_primary_attack();
    thread minigun_smokescreens();
    thread saw_gunner_friendly();
}

start_javelin()
{
    _id_A5E8::_id_870C( "aud_start_javelin_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
    common_scripts\utility::_id_383F( "fall_back_to_barn" );
    common_scripts\utility::_id_383F( "farm_reached" );
    common_scripts\utility::_id_383F( "barn_assault_begins" );
    common_scripts\utility::_id_383F( "objective_armor_arrival" );
    common_scripts\utility::_id_383F( "storm_the_tavern" );
    level.playercardbackground setorigin( ( 1021, 7309, 1006 ) );
    thread saw_gunner_friendly();
}

start_final_battle()
{
    _id_A5E8::_id_870C( "aud_start_final_battle_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
    common_scripts\utility::_id_383F( "fall_back_to_barn" );
    common_scripts\utility::_id_383F( "barn_assault_begins" );
    common_scripts\utility::_id_383F( "objective_armor_arrival" );
    common_scripts\utility::_id_383F( "farm_reached" );
    common_scripts\utility::_id_383F( "got_the_javelin" );
    common_scripts\utility::_id_383F( "objective_all_tanks_destroyed" );
    common_scripts\utility::_id_383F( "airstrikes_ready" );
    common_scripts\utility::_id_383F( "storm_the_tavern" );
    common_scripts\utility::_id_383F( "start_final_battle" );
    level.playercardbackground setorigin( ( 1021, 7309, 1006 ) );
    thread saw_gunner_friendly();
    var_0 = getentarray( "barbed_wire_detonator", "targetname" );
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_1", var_0 );
    wait 2;
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_2", var_0 );
    wait 3;
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_3", var_0 );
}

start_seaknight()
{
    _id_A5E8::_id_870C( "aud_start_seaknight_checkpoint" );
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "objective_on_ridgeline" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
    common_scripts\utility::_id_383F( "fall_back_to_barn" );
    common_scripts\utility::_id_383F( "farm_reached" );
    common_scripts\utility::_id_383F( "barn_assault_begins" );
    common_scripts\utility::_id_383F( "objective_armor_arrival" );
    common_scripts\utility::_id_383F( "got_the_javelin" );
    common_scripts\utility::_id_383F( "objective_all_tanks_destroyed" );
    common_scripts\utility::_id_383F( "airstrikes_ready" );
    common_scripts\utility::_id_383F( "storm_the_tavern" );
    common_scripts\utility::_id_383F( "rescue_chopper_ingress" );
    level.playercardbackground setorigin( ( -64, -1904, -80 ) );
    thread saw_gunner_friendly();
    var_0 = getentarray( "barbed_wire_detonator", "targetname" );
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_1", var_0 );
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_2", var_0 );
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_3", var_0 );
    wait 0.05;
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

moveredshirts( var_0, var_1 )
{
    var_2 = getent( "redshirt1", "targetname" );
    var_3 = getent( "redshirt2", "targetname" );
    var_4 = getnode( var_0, "targetname" );
    var_5 = getnode( var_1, "targetname" );
    var_2 _meth_81c9( var_4.origin );
    var_2 _meth_81a9( var_4 );
    var_3 _meth_81c9( var_5.origin );
    var_3 _meth_81a9( var_5 );
}

intro()
{
    thread intro_loudspeaker();
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1].dontavoidplayer = 1;
        var_0[var_1]._id_1300 = 15;
    }

    var_0 = _id_A5A4::_id_735E( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] _meth_81ce( "crouch" );
        var_0[var_1]._id_2AF3 = 1;
        var_0[var_1].index = 1;
    }

    var_2 = getentarray( "introTrig", "targetname" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1] notify( "trigger" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_81ce( "stand", "crouch", "prone" );

    wait 18;
    var_3 = getnode( "price_intro_route", "targetname" );
    var_4 = getent( "redshirt1", "targetname" );
    var_5 = getent( "redshirt2", "targetname" );
    var_6 = getnode( "sas1_intro_route", "targetname" );
    var_7 = getnode( "sas2_intro_route", "targetname" );
    level._id_6F7C thread followscriptedpath( var_3, undefined, "prone" );
    var_4 thread followscriptedpath( var_6, 0.75, "prone" );
    var_5 thread followscriptedpath( var_7, 0.75, "prone" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "spreadout" );
    common_scripts\utility::_id_383F( "objective_price_orders_southern_hill" );
    thread intro_ridgeline_check( level.playercardbackground, "player_southern_start" );
    thread intro_ridgeline_check( level._id_6F7C, "price_southern_start" );
    thread intro_hillpatrol_check();
    _id_A5A4::_id_70C4( "justsaywhen" );
    thread southern_hill_defense();
}

intro_church_tower_explode()
{
    var_0 = getent( "intro_tank_tower_target", "targetname" );
    wait 2;
    var_0 playsound( "artillery_incoming" );
    wait 1;
    common_scripts\_exploder::_id_3528( 1000 );
    wait 1.1;
    common_scripts\_exploder::_id_3528( 1001 );
    var_0 playsound( "exp_bell_tower" );
    earthquake( 0.65, 1, var_0.origin, 3000 );
    common_scripts\utility::_id_383F( "church_tower_explodes" );
    var_1 = getent( "church_explosion_damage", "targetname" );

    for ( var_2 = 0; var_2 < 20; var_2++ )
    {
        if ( level.playercardbackground istouching( var_1 ) )
            level.playercardbackground kill();

        wait 0.05;
    }
}

intro_hillpatrol_check()
{
    var_0 = getent( "hill_patrol_trig", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "objective_player_on_ridgeline" );
}

intro_ridgeline_check( var_0, var_1 )
{
    var_2 = getnode( var_1, "targetname" );
    var_3 = length( level.playercardbackground.origin - var_2.origin );

    while ( var_3 > 128 )
    {
        var_3 = length( var_0.origin - var_2.origin );
        wait 0.1;
    }

    if ( var_0 == level._id_6F7C )
        common_scripts\utility::_id_383F( "objective_on_ridgeline" );

    if ( isplayer( var_0 ) )
        common_scripts\utility::_id_383F( "objective_player_at_vantage_point" );
}

intro_loudspeaker()
{
    var_0 = [];
    var_0[0] = "villagedef_rul_surrenderatonce";
    var_0[1] = "villagedef_rul_dropyourweapons";
    var_0[2] = "villagedef_rul_weknowyourehiding";
    var_1 = getentarray( "russian_loudspeaker", "targetname" );
    var_2 = var_1.size;
    var_3 = 0;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( var_3 >= var_2 )
            var_3 = 0;

        common_scripts\utility::_id_69C2( var_0[var_4], var_1[var_3].origin );
        wait(randomfloatrange( 5, 8 ));
        var_3++;
    }
}

southern_hill_defense()
{
    thread southern_hill_intro();
    thread southern_hill_intro_interrupt();
    thread southern_hill_panic_screaming();
    thread southern_hill_javelin();
    thread southern_hill_ambush();
    thread southern_hill_primary_attack();
    thread southern_hill_baglimit();
}

southern_hill_primary_attack()
{
    level endon( "southern_hill_smoked" );
    var_0 = getnode( "southern_hill_waypoint", "targetname" );
    var_1 = "southern_hill_assaulter";
    var_2 = "southern_hill_attack_stop";
    var_3 = "spawnRock";
    var_4 = "spawnRoad";
    var_5 = "spawnGas";
    level endon( var_2 );
    common_scripts\utility::_id_384A( "southern_hill_killzone_detonate" );
    wait 1;

    for (;;)
    {
        thread encroach_start( var_0, var_1, var_2, var_3, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_4, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_5, "southern_hill" );
        wait(randomfloat( 6 ));
        thread encroach_start( var_0, var_1, var_2, var_4, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_4, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_5, "southern_hill" );
        wait(randomfloat( 8 ));
        thread encroach_start( var_0, var_1, var_2, var_3, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_5, "southern_hill" );
        thread encroach_start( var_0, var_1, var_2, var_4, "southern_hill" );
        wait(randomfloat( 10 ));
    }
}

magic_sniper()
{
    common_scripts\utility::_id_384A( "southern_hill_killzone_detonate" );
    wait 2;
    var_0 = undefined;
    var_1 = 0;
    var_2 = getent( "southern_hill_magic_sniper", "targetname" );

    for (;;)
    {
        var_3 = [];
        var_4 = [];
        var_3 = getaiarray( "axis" );

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            var_6 = var_3[var_5];

            if ( !isdefined( var_6.teambalanced ) || !isdefined( var_6.script_parentname ) )
                continue;

            if ( var_6.script_parentname == "spawnGas" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnRoad" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnRock" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( isdefined( var_6.teambalanced ) && var_6.teambalanced == "vanguard" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnHillFence" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnHillChurch" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnHillGraveyard" )
            {
                common_scripts\utility::_id_07A5( var_4, var_6 );
                continue;
            }

            if ( var_6.script_parentname == "spawnHillFlank" )
                common_scripts\utility::_id_07A5( var_4, var_6 );
        }

        if ( var_4.size == 0 )
        {
            wait 1;
            continue;
        }

        var_0 = randomint( var_4.size );
        var_7 = var_4[var_0];
        var_2 playsound( level.sniperfx );
        var_7 kill( ( 0, 0, 0 ) );

        if ( level.magicsnipertalk )
        {
            if ( var_1 == 0 )
            {
                _id_A5A4::_id_70C4( "targetdown" );
                var_1++;
            }
            else if ( var_1 == 1 )
            {
                _id_A5A4::_id_70C4( "gothim" );
                var_1++;
            }
            else if ( var_1 == 2 )
            {
                _id_A5A4::_id_70C4( "targeteliminated" );
                var_1++;
            }
            else if ( var_1 == 3 )
            {
                _id_A5A4::_id_70C4( "goodbye" );
                var_1 = 0;
            }
        }

        var_3 = undefined;
        var_4 = undefined;
        var_8 = randomfloatrange( level.southern_hill_magic_sniper_min_cycletime, level.southern_hill_magic_sniper_max_cycletime );
        wait(var_8);
    }
}

southern_hill_vanguard_setup()
{
    var_0 = [];
    var_0 = getentarray( "vanguard", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].goalradius = 16;

    common_scripts\utility::_id_384A( "objective_player_on_ridgeline" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1] ) )
        {
            var_0[var_1]._id_0C72 = "axis";
            var_0[var_1] _id_A5A4::_id_7EAB( "patrolwalk_" + ( randomint( 5 ) + 1 ) );
            var_0[var_1] thread southern_hill_vanguard_nav();
            var_0[var_1] thread southern_hill_vanguard_wakeup();
            var_0[var_1] thread southern_hill_deathmonitor();
            var_0[var_1] thread southern_hill_damagemonitor();
        }

        wait 0.05;
    }
}

southern_hill_vanguard_nav()
{
    self endon( "death" );
    var_0 = undefined;

    if ( !isdefined( self.script_parentname ) )
        var_0 = getnode( "default_vanguard_dest", "targetname" );
    else
    {
        var_1 = getnodearray( "vanguard_node", "targetname" );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            if ( self.script_parentname == var_1[var_2].script_parentname )
            {
                var_0 = var_1[var_2];
                break;
            }
        }
    }

    self _meth_81a9( var_0 );
    self.goalradius = 2048;
    thread southern_hill_vanguard_aim();
}

southern_hill_vanguard_aim()
{
    self endon( "death" );
    var_0 = [];
    var_0 = getentarray( "vanguard_aimpoint", "targetname" );

    for (;;)
    {
        var_1 = randomint( var_0.size );
        _id_A5A4::_id_22CF( var_0[var_1] );
        wait(randomfloat( 1 ));
    }
}

southern_hill_vanguard_wakeup()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "southern_hill_action_started" );
    _id_A5A4::_id_1ED1();
}

southern_hill_timeout()
{
    wait 10;
    common_scripts\utility::_id_383F( "objective_player_at_vantage_point" );
}

southern_hill_intro()
{
    level endon( "intro_hill_interrupted" );
    common_scripts\utility::_id_384A( "objective_player_on_ridgeline" );
    common_scripts\utility::_id_384A( "objective_on_ridgeline" );
    var_0 = length( level.playercardbackground.origin - level._id_6F7C.origin );

    if ( var_0 < 512 )
    {
        thread southern_hill_timeout();
        common_scripts\utility::_id_384A( "objective_player_at_vantage_point" );
    }

    wait 3;

    if ( !common_scripts\utility::_id_382E( "southern_hill_action_started" ) )
    {
        common_scripts\utility::_id_383F( "price_ordered_hill_detonation" );
        _id_A5A4::_id_70C4( "doit" );
    }

    if ( getdvarint( "use_old_detonation" ) == 1 )
    {
        _id_A5A4::_id_70C4( "kaboom" );

        if ( !common_scripts\utility::_id_382E( "southern_hill_action_started" ) )
        {
            common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
            wait 0.5;
            common_scripts\utility::_id_383F( "southern_hill_action_started" );
        }
        else
            common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    }
    else
    {
        var_1 = getaiarray( "allies" );

        foreach ( var_3 in var_1 )
        {
            if ( var_3 != level._id_6F7C && var_3 != level._id_3C61 )
            {
                var_4 = spawn( "script_origin", var_3.origin );
                var_4.angles = var_3.angles;
                var_3._id_0C72 = "detonator_guy";
                var_4 _id_A510::_id_0C24( var_3, "press_detonator" );
                break;
            }
        }
    }
}

southern_hill_intro_interrupt()
{
    common_scripts\utility::_id_384A( "southern_hill_action_started" );
    level notify( "intro_hill_interrupted" );
    common_scripts\utility::_id_383F( "southern_hill_action_started" );
    _id_A5E8::_id_870C( "start_southern_hill_ambush_mix" );
    wait 0.35;

    if ( !common_scripts\utility::_id_382E( "price_ordered_hill_detonation" ) )
    {
        _id_A5A4::_id_70C4( "doit" );
        _id_A5A4::_id_70C4( "kaboom" );
    }

    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
}

southern_hill_ambush()
{
    common_scripts\utility::_id_384A( "southern_hill_action_started" );
    _id_A5E8::_id_870C( "start_southern_hill_ambush_mix" );
    common_scripts\utility::_id_383F( "southern_mg_openfire" );
    setthreatbias( "player", "axis", 0 );
    setthreatbias( "allies", "axis", 0 );
    setthreatbias( "axis", "allies", 0 );
    common_scripts\utility::_id_384A( "southern_hill_killzone_detonate" );
    wait 2;
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "openfire" );
    wait 1;
    _id_A5A4::_id_1333( "allies" );
}

southern_hill_killzone_sequence()
{
    var_0 = [];
    var_1 = [];
    var_2 = getent( "southern_hill_killzone_1", "targetname" );
    var_3 = getent( "southern_hill_killzone_2", "targetname" );

    for (;;)
    {
        var_0[var_0.size] = var_2;

        if ( isdefined( var_2._not_team ) )
            var_2 = getent( var_2._not_team, "targetname" );
        else
            break;

        wait 0.05;
    }

    for (;;)
    {
        var_1[var_1.size] = var_3;

        if ( isdefined( var_3._not_team ) )
            var_3 = getent( var_3._not_team, "targetname" );
        else
            break;

        wait 0.05;
    }

    common_scripts\utility::_id_384A( "southern_hill_killzone_detonate" );
    _id_A5A4::_id_1333( "axis" );
    thread killzone_detonation( var_0 );
    wait 1.25;
    thread killzone_detonation( var_1 );
    wait 2;
    common_scripts\utility::_id_383F( "stop_ambush_music" );
    musicstop( 1 );
}

southern_hill_panic_screaming()
{
    level endon( "stop_hill_screaming" );
    common_scripts\utility::_id_384A( "southern_hill_action_started" );
    var_0 = getentarray( "ambush_speaker", "targetname" );

    for ( var_1 = 0; var_1 < 4; var_1++ )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            var_3 = var_0[var_2];
            common_scripts\utility::_id_69C2( "RU_1_reaction_casualty_generic", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_order_move_generic", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_order_attack_infantry", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_order_action_coverme", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_inform_suppressed_generic", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_order_action_suppress", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_response_ack_covering", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "RU_1_response_ack_follow", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru4_helpmeimwounded", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru1_noicantmove", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru2_death", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru3_death", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru4_wheretheyshooting", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru1_icantseethem", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru2_underheavyfire", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru4_reinforcements", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru1_goaroundwest", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru4_imhitmedic", var_3.origin );
            wait 1;
            common_scripts\utility::_id_69C2( "villagedef_ru1_medic", var_3.origin );
            wait 1;
        }
    }
}

southern_hill_ambush_mg()
{
    var_0 = getent( "southern_house_manual_mg", "targetname" );
    var_0 setmode( "manual" );
    var_0 thread southern_hill_mg_targeting();
    common_scripts\utility::_id_384A( "southern_mg_openfire" );
    var_0 thread manual_mg_fire();
}

southern_hill_mg_targeting()
{
    level endon( "sawgunner_moving" );
    var_0 = getentarray( self._not_team, "targetname" );
    var_1 = 0;

    for (;;)
    {
        var_2 = common_scripts\utility::_id_710E( var_0 );
        self settargetentity( var_2 );
        wait(randomfloatrange( 1, 5 ));
        var_1++;

        if ( var_1 > 8 )
        {
            var_3 = [];
            var_3 = getaiarray( "axis" );

            if ( var_3.size )
            {
                var_2 = common_scripts\utility::_id_710E( var_3 );
                self settargetentity( var_2 );
                wait(randomfloatrange( 1, 2 ));
                var_1 = 0;
                var_3 = undefined;
                continue;
            }

            break;
        }
    }
}

manual_mg_fire()
{
    level endon( "sawgunner_moving" );
    self.turret_fires = 1;
    var_0 = 0;

    for (;;)
    {
        var_1 = randomfloatrange( 0.4, 0.7 ) * 20;

        if ( self.turret_fires )
        {
            for ( var_2 = 0; var_2 < var_1; var_2++ )
            {
                self shootturret();
                wait 0.05;
            }
        }

        var_0++;
        wait(randomfloat( 3.3 ));

        if ( var_0 >= 10 )
        {
            wait(randomfloat( 6.1 ));
            var_0 = 0;
        }
    }
}

southern_hill_javelin()
{
    common_scripts\utility::_id_384A( "southern_hill_action_started" );
    wait 4;
    _id_A5A4::_id_70C4( "niceshotmate" );
}

southern_hill_baglimit()
{
    var_0 = 0;
    var_1 = getentarray( "ambush_speaker", "targetname" );

    while ( var_0 < level.southernhilladvancebaglimit )
    {
        level waittill( "player_killed_southern_hill_enemy" );
        var_0++;

        if ( var_0 == level.southernhilladvancebaglimit / 2 )
        {
            var_2 = var_1[randomint( var_1.size )];
            common_scripts\utility::_id_69C2( "villagedef_ru1_mustbetwoplatoons", var_2.origin );
            wait 2;
            _id_A5A4::_id_70C4( "largerforce" );
            _id_A5A4::_id_70C4( "copy" );
        }
    }

    thread saw_gunner_friendly();
    wait 7;
    common_scripts\utility::_id_383F( "southern_hill_smoked" );
    wait 20;
    thread southern_hill_smokescreens();
}

southern_hill_deathmonitor()
{
    self waittill( "death", var_0 );
    common_scripts\utility::_id_383F( "southern_hill_action_started" );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        level notify( "player_killed_southern_hill_enemy" );
}

southern_hill_damagemonitor()
{
    self waittill( "damage", var_0 );
    common_scripts\utility::_id_383F( "southern_hill_action_started" );
}

southern_hill_shotmonitor()
{
    var_0 = getent( "hill_patrol_shotdetector", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "southern_hill_action_started" );
}

saw_gunner_friendly()
{
    var_0 = getent( "sasGunner", "targetname" );
    level.sasgunner = var_0 dospawn();

    if ( _id_A5A4::_id_88F1( level.sasgunner ) )
        return;

    var_1 = getnode( "fallback_sasGunner", "targetname" );
    level.sasgunner _meth_81a9( var_1 );
    level.sasgunner thread hero();
    level.sasgunner.index = 1;
    common_scripts\utility::_id_384A( "objective_minigun_baglimit_done" );
}

southern_hill_smokescreens()
{
    _id_A5E8::_id_870C( "start_ambush_smoke_screen_mix" );
    var_0 = getentarray( "ambush_speaker", "targetname" );
    var_1 = var_0[randomint( var_0.size )];
    common_scripts\utility::_id_69C2( "villagedef_ru2_putupsmokescreen", var_1.origin );
    var_2 = getentarray( "smokescreen_southern_hill", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        playfx( level.smokegrenade, var_2[var_3].origin );
        var_2[var_3] playsound( "village_defend_smoke_grenade_exp" );
    }

    level notify( "sawgunner_moving" );
    wait 2;
    level notify( "stop_hill_screaming" );
    level.magicsnipertalk = 0;
    wait 2;
    _id_A5A4::_id_70C4( "smokescreensmac" );
    wait 0.5;
    _id_A5A4::_id_70C4( "notmuchmovement" );
    wait 3;
    _id_A5E8::_id_870C( "aud_start_mortar_mix" );
    wait 1;
    thread southern_hill_mortars();

    while ( !common_scripts\utility::_id_382E( "objective_player_uses_minigun" ) && !common_scripts\utility::_id_382E( "ridgeline_unsafe" ) )
    {
        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            playfx( level.smokegrenade, var_2[var_3].origin );
            wait(randomfloatrange( 1.2, 2.3 ));
        }

        wait 32;
    }
}

southern_hill_mortars()
{
    var_0 = getentarray( "southern_hill_mortar_hit", "targetname" );
    var_1 = getentarray( "southern_hill_mortar_hit_real", "targetname" );
    thread minigun_fallback();
    thread southern_hill_mortars_killtimer();
    thread southern_hill_mortars_timing( "southern_hill_mortar_hit", "ridgeline_unsafe", 192 );
    common_scripts\utility::_id_383F( "southern_hill_smoke_entry" );
    thread minigun_smokescreens();
    common_scripts\utility::_id_384A( "ridgeline_unsafe" );
    thread southern_hill_mortars_timing( "southern_hill_mortar_hit_real", "enemy_breached_wire", 0 );
    wait 1.5;
    thread minigun_primary_attack();
}

minigun_smokescreens()
{
    level endon( "objective_detonators" );
    var_0 = getentarray( "smokescreen_barbed_wire", "targetname" );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "southern_hill_smoke_entry" ) )
        {
            for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            {
                playfx( level._effect["smokescreen_barbed_wire"], var_0[var_1].origin );
                var_0[var_1] playsound( "village_defend_smoke_grenade_exp" );
                wait(randomfloatrange( 1.2, 2.3 ));
            }

            wait 28;
        }

        wait 0.25;
    }
}

southern_hill_mortars_timing( var_0, var_1, var_2 )
{
    level endon( var_1 );
    var_3 = getentarray( var_0, "targetname" );

    for ( var_3 = common_scripts\utility::_id_0CF5( var_3 ); !common_scripts\utility::_id_382E( var_1 ); var_3 = common_scripts\utility::_id_0CF5( var_3 ) )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = var_3[var_4];
            var_6 = distance( level.playercardbackground.origin, var_5.origin );

            if ( var_6 > var_2 )
            {
                southern_hill_mortar_detonate( var_5 );
                wait(randomfloat( 0.7 ));
            }
        }
    }
}

southern_hill_mortars_killtimer()
{
    wait(level.southernmortarintrotimer);
    common_scripts\utility::_id_383F( "ridgeline_targeted" );
    wait(level.southernmortarkilltimer);
    common_scripts\utility::_id_383F( "ridgeline_unsafe" );
    thread southern_hill_mortars_killplayer();
}

southern_hill_mortars_killplayer()
{
    level endon( "arm_delaying_action" );
    var_0 = getent( "ridgeline_dangerarea", "targetname" );

    for (;;)
    {
        if ( level.playercardbackground istouching( var_0 ) )
        {
            wait 2;

            if ( level.playercardbackground istouching( var_0 ) )
            {
                thread southern_hill_mortar_detonate( level.playercardbackground );
                level.playercardbackground kill();
            }
        }

        wait 0.5;
    }
}

minigun_fallback()
{
    common_scripts\utility::_id_384A( "ridgeline_targeted" );
    _id_A5A4::_id_1143( "ridgeline_under_mortar_fire" );
    var_0 = getent( "redshirt1", "targetname" );
    var_1 = getent( "redshirt2", "targetname" );
    var_2 = getnode( "fallback_redshirt1", "targetname" );
    var_3 = getnode( "fallback_redshirt2", "targetname" );
    _id_A5A4::_id_70C4( "targetingour" );
    thread minigun_orders();
    wait 2;
    _id_A5A4::_id_70C4( "twofallingback" );
    var_0 _meth_81ce( "stand", "crouch", "prone" );
    var_0 _meth_81a9( var_2 );
    wait(randomfloatrange( 0.7, 1.2 ));
    _id_A5A4::_id_70C4( "threeonthemove" );
    var_1 _meth_81ce( "stand", "crouch", "prone" );
    var_1 _meth_81a9( var_3 );
    var_4 = getnode( "fallback_price", "targetname" );
    level._id_6F7C _meth_81ce( "stand", "crouch", "prone" );
    level._id_6F7C common_scripts\utility::_id_27CD( randomfloatrange( 0.5, 1.25 ), ::_meth_81a9, var_4 );
    _id_A5A4::_id_70C4( "easternroadlocked" );
    level._id_6F7C._id_1300 = 1;
    level._id_6F7C.index = 1;
    var_0._id_1300 = 1;
    var_0.index = 1;
    var_1._id_1300 = 1;
    var_1.index = 1;
    thread maps\village_defend_code::friendly_pushplayer( "off" );
    wait 5;
    thread intro_church_tower_explode();
}

minigun_orders()
{
    level endon( "objective_player_uses_minigun" );
    level endon( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "objective_price_orders_minigun" );
    _id_A5A4::_id_70C4( "minigunflank" );
    thread minigun_use();
    thread minigun_arming_check();
    var_0 = 0;
    var_1 = 30;

    for (;;)
    {
        wait(var_1);

        if ( var_0 == 0 )
            _id_A5A4::_id_70C4( "miniguncrashed" );

        if ( var_0 == 1 )
            _id_A5A4::_id_70C4( "gazminigunonline" );

        if ( var_0 == 2 )
            _id_A5A4::_id_70C4( "minigunarse" );

        if ( var_0 == 3 )
            _id_A5A4::_id_70C4( "priceminiguninheli" );

        if ( var_0 == 4 )
            level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "gazuseminigun" );

        if ( var_0 == 5 )
        {
            _id_A5A4::_id_70C4( "priceminiguninhelimove" );
            var_0 = 0;
            var_1 = 65;
            continue;
        }

        var_0++;
    }
}

minigun_fallback_shouting()
{
    level endon( "stop_minigun_fallback_shouting" );
    var_0 = getent( "minigun", "targetname" );
    var_1 = 5;
    var_2 = 10;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = 0;

    while ( !common_scripts\utility::_id_382E( "stop_minigun_fallback_shouting" ) )
    {
        var_8 = var_0 getturretowner();

        if ( isdefined( var_8 ) && !var_3 )
        {
            if ( var_5 == 2 )
            {
                var_3 = 1;
                continue;
            }

            if ( var_4 == 0 )
                _id_A5A4::_id_70C4( "detminigunfallbackremind1" );

            if ( var_4 == 1 )
            {
                _id_A5A4::_id_70C4( "detminigunfallbackremind2" );
                var_4 = 0;
                var_5++;
                wait(var_1 * 3);
                continue;
            }

            var_4++;
            wait(var_1);
            continue;
        }

        if ( var_7 == 0 )
            _id_A5A4::_id_70C4( "detfallbackremind1" );

        if ( var_7 == 1 )
            _id_A5A4::_id_70C4( "detfallbackremind2" );

        if ( var_7 == 2 )
        {
            _id_A5A4::_id_70C4( "detfallbackremind3" );
            var_7 = 0;
            continue;
        }

        var_7++;
        wait(var_2);
    }
}

minigun_fallback_shouting_cancel()
{
    var_0 = getent( "minigun_fallback_shouting", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "stop_minigun_fallback_shouting" );
    thread clacker_use_shouting();
}

clacker_use_shouting()
{
    level endon( "clacker_has_been_exercised" );
    wait 5;
    _id_A5E8::_id_870C( "start_clacker_mix" );

    while ( !common_scripts\utility::_id_382E( "clacker_has_been_exercised" ) )
    {
        _id_A5A4::_id_70C4( "detuseremind1" );
        wait 20;
        _id_A5A4::_id_70C4( "detuseremind2" );
        wait 25;
    }
}

minigun_use()
{
    common_scripts\utility::_id_384A( "objective_player_uses_minigun" );
    level notify( "southern_hill_attack_stop" );
}

minigun_primary_attack()
{
    var_0 = getentarray( "barbed_wire_detonator", "targetname" );
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_1", var_0 );
    wait 2;
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_2", var_0 );
    wait 3;
    thread minigun_barbed_wire_detonate( "southern_hill_barbed_wire_wall_3", var_0 );
    _id_A5A4::_id_1143( "southwestern_flanking_assault" );
    thread minigun_breach_baglimit();
    var_1 = getnode( "southern_hill_breach_church", "targetname" );
    var_2 = getnode( "southern_hill_breach_graveyard", "targetname" );
    var_3 = getnode( "southern_hill_breach_housegap", "targetname" );
    var_4 = getnode( "southern_hill_breach_flank", "targetname" );
    var_5 = "southern_hill_breacher";
    var_6 = "halfway_through_field";
    var_7 = "spawnHillChurch";
    var_8 = "spawnHillGraveyard";
    var_9 = "spawnHillFence";
    var_10 = "spawnHillFlank";
    var_11 = "minigun_breach";
    level endon( var_6 );

    for (;;)
    {
        thread encroach_start( var_2, var_5, var_6, var_7, var_11 );
        thread encroach_start( var_2, var_5, var_6, var_8, var_11 );
        thread encroach_start( var_3, var_5, var_6, var_9, var_11 );
        wait(randomfloatrange( 6, 8 ));
        thread encroach_start( var_1, var_5, var_6, var_7, var_11 );
        thread encroach_start( var_2, var_5, var_6, var_8, var_11 );
        thread encroach_start( var_1, var_5, var_6, var_9, var_11 );
        wait(randomfloatrange( 9, 11 ));
        thread encroach_start( var_3, var_5, var_6, var_7, var_11 );
        thread encroach_start( var_2, var_5, var_6, var_8, var_11 );
        thread encroach_start( var_2, var_5, var_6, var_9, var_11 );
        wait(randomfloatrange( 12, 14 ));
    }
}

minigun_breach_deathmonitor()
{
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        level notify( "player_killed_minigun_breach_enemy" );
}

minigun_breach_baglimit()
{
    for ( var_0 = 0; var_0 < level.minigunbreachbaglimit; var_0++ )
        level waittill( "player_killed_minigun_breach_enemy" );

    common_scripts\utility::_id_383F( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "divert_for_clacker" );
}

minigun_barbed_wire_detonate( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];

        if ( !isdefined( var_4.script_parentname ) )
            continue;

        if ( var_4.script_parentname != var_0 )
            continue;

        playfx( level.megaexplosion, var_4.origin );
        var_4 playsound( "explo_mine" );
        earthquake( 0.5, 0.5, level.playercardbackground.origin, 1250 );
        radiusdamage( var_4.origin, 256, 1000, 500 );
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] delete();

    if ( !common_scripts\utility::_id_382E( "enemy_breached_wire" ) )
        _id_A5E8::_id_870C( "aud_start_minigun_mix" );

    common_scripts\utility::_id_383F( "enemy_breached_wire" );
    level.magicsnipertalk = 1;
}

minigun_firstuse_check()
{
    while ( !common_scripts\utility::_id_382E( "minigun_lesson_learned" ) )
    {
        var_0 = getent( "minigun", "targetname" );
        var_0 waittill( "turretownerchange" );
        var_1 = var_0 getturretowner();

        if ( !isdefined( var_1 ) )
        {
            level notify( "minigun_session" );
            continue;
        }

        if ( level.playercardbackground common_scripts\utility::_id_5064() )
            level.playercardbackground thread _id_A5A4::_id_2B4A( "minigun_spin_left_trigger" );
    }
}

minigun_arming_check()
{
    var_0 = getent( "minigun", "targetname" );

    for (;;)
    {
        var_1 = var_0 getturretowner();

        if ( !isdefined( var_1 ) )
        {
            var_0 waittill( "turretownerchange" );
            var_1 = var_0 getturretowner();
        }

        wait 1;

        if ( isdefined( var_1 ) && level.playercardbackground != var_1 || !isdefined( var_1 ) )
        {
            var_2 = [];
            var_2 = getaiarray( "axis" );
        }

        if ( isdefined( var_1 ) && level.playercardbackground == var_1 )
        {
            if ( !common_scripts\utility::_id_382E( "objective_player_uses_minigun" ) )
            {
                common_scripts\utility::_id_383F( "objective_player_uses_minigun" );
                wait 2.5;
                _id_A5A4::_id_70C4( "spooledup" );
            }

            var_2 = [];
            var_2 = getaiarray( "axis" );
        }
    }
}

heli_destroyed( var_0 )
{
    var_1 = _id_A5A8::waittill_vehiclespawn( var_0 );
    var_1 waittill( "death", var_2 );

    if ( isdefined( var_2 ) && var_2 == level.playercardbackground )
    {
        level.fly_swatter_kill_count++;

        if ( level.fly_swatter_kill_count >= 8 )
            _id_A5A4::_id_41DD( "FLYSWATTER" );
    }
}

helidrop()
{
    common_scripts\utility::_id_384A( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "helidrop_started" );
    _id_A5E8::_id_870C( "start_helidrop_mix" );
    level.magicsnipertalk = 0;
    thread heli_destroyed( "helidrop_01" );
    thread heli_destroyed( "helidrop_02" );
    thread heli_destroyed( "helidrop_03" );
    thread heli_destroyed( "helidrop_04" );
    thread heli_destroyed( "helidrop_05" );
    var_0 = _id_A5A8::_id_8979( "helidrop_01" );
    _id_A5A8::_id_8979( "helidrop_02" );
    _id_A5A8::_id_8979( "helidrop_03" );
    _id_A5A8::_id_8979( "helidrop_04" );
    _id_A5A8::_id_8979( "helidrop_05" );
    thread helidrop_rider_setup( "helidrop_01" );
    thread helidrop_rider_setup( "helidrop_02" );
    thread helidrop_rider_setup( "helidrop_03" );
    thread helidrop_rider_setup( "helidrop_04" );
    thread helidrop_rider_setup( "helidrop_05" );
    wait 3;
    var_0 thread _id_A5A4::_id_69C4( "scn_vd_helidrop_far" );
    wait 17;
    _id_A5A4::_id_70C4( "headsup" );
    _id_A5A4::_id_70C4( "lotofhelis" );
    _id_A5A4::_id_70C4( "tavern" );
    common_scripts\utility::_id_383F( "objective_detonators" );
    common_scripts\utility::_id_383F( "detonators_activate" );
    _id_A5A4::_id_70C4( "nextdefensiveline" );
    var_1 = getnode( "clacker_fallback_price", "targetname" );
    level._id_6F7C _meth_81a9( var_1 );
    level._id_6F7C thread hero_scripted_travel();
    var_2 = getent( "redshirt1", "targetname" );
    var_3 = getnode( "clacker_fallback_redshirt1", "targetname" );
    var_2 _meth_81a9( var_3 );
    var_2 thread hero_scripted_travel();
    var_4 = getent( "redshirt2", "targetname" );
    var_5 = getnode( "clacker_fallback_redshirt2", "targetname" );
    var_4 _meth_81a9( var_5 );
    var_4 thread hero_scripted_travel();
    var_6 = getnode( "clacker_fallback_sasGunner", "targetname" );
    level.sasgunner _meth_81a9( var_6 );
    level.sasgunner thread hero_scripted_travel();
    thread minigun_fallback_shouting_cancel();
    thread minigun_fallback_shouting();
}

hero_scripted_travel()
{
    self._id_2AF3 = 1;
    self.goalradius = 16;
    self waittill( "goal" );
    wait 2;
    self._id_2AF3 = 0;
    self.goalradius = 2048;
}

helidrop_rider_setup( var_0 )
{
    var_1 = _id_A5A8::get_vehicle_from_targetname( var_0 );
    var_2 = var_1._id_750A;

    if ( !isdefined( var_2 ) )
        return;

    foreach ( var_4 in var_2 )
    {
        var_4 thread hunt_player( var_1 );
        var_4 thread helidrop_clacker_divert( var_1 );
    }
}

hunt_player( var_0 )
{
    self endon( "death" );
    self endon( "going_to_baitnode" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "unloaded" );

    self.goalradius = 1800;
    self.pathlookaheaddist = 1800;
    self.pathrandompercent = 1800;
    var_1 = getent( "player_in_blackhawk_detector", "targetname" );
    var_2 = getnode( "bait_crashsite", "targetname" );

    while ( self.goalradius > 640 )
    {
        if ( level.playercardbackground istouching( var_1 ) )
            self _meth_81a9( var_2 );
        else
            self _meth_81aa( level.playercardbackground.origin );

        self.goalradius *= level.encroachrate;
        self waittill( "goal" );
        wait(randomintrange( 10, 15 ));
    }
}

helidrop_clacker_divert( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "unloaded" );

    common_scripts\utility::_id_384A( "player_entered_clacker_house_top_floor" );
    self notify( "going_to_baitnode" );
    var_1 = undefined;

    if ( isdefined( self.script_parentname ) )
    {
        if ( self.script_parentname == "helidrop_bait_grassyknoll" && !common_scripts\utility::_id_382E( "farslope_exploded" ) )
            var_1 = getnode( "bait_farslope", "targetname" );
        else if ( self.script_parentname == "helidrop_bait_grassyknoll" && common_scripts\utility::_id_382E( "farslope_exploded" ) && !common_scripts\utility::_id_382E( "nearslope_exploded" ) )
            var_1 = getnode( "bait_nearslope", "targetname" );
        else if ( self.script_parentname == "helidrop_bait_grassyknoll" && common_scripts\utility::_id_382E( "farslope_exploded" ) && common_scripts\utility::_id_382E( "nearslope_exploded" ) )
        {
            if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
                common_scripts\utility::_id_384A( "storm_the_tavern" );

            thread hunt_player();
            return;
        }
        else if ( self.script_parentname == "helidrop_bait_crashsite" && !common_scripts\utility::_id_382E( "crashsite_exploded" ) )
            var_1 = getnode( "bait_crashsite", "targetname" );
        else if ( self.script_parentname == "helidrop_bait_crashsite" && common_scripts\utility::_id_382E( "crashsite_exploded" ) && !common_scripts\utility::_id_382E( "cliffside_exploded" ) )
            var_1 = getnode( "bait_crashsite", "targetname" );
        else if ( self.script_parentname == "helidrop_bait_crashsite" && common_scripts\utility::_id_382E( "crashsite_exploded" ) && common_scripts\utility::_id_382E( "cliffside_exploded" ) )
            var_1 = getnode( "bait_crashsite", "targetname" );
        else if ( self.script_parentname == "helidrop_bait_trees" && !common_scripts\utility::_id_382E( "cliffside_exploded" ) )
            var_1 = getnode( "bait_trees", "targetname" );

        if ( self.script_parentname == "helidrop_bait_trees" && common_scripts\utility::_id_382E( "cliffside_exploded" ) && !common_scripts\utility::_id_382E( "crashsite_exploded" ) )
            var_1 = getnode( "bait_crashsite", "targetname" );
        else if ( self.script_parentname == "spawnHillFlank" )
            var_1 = getnode( "bait_nearslope", "targetname" );
        else
        {
            self.goalradius = 2400;

            switch ( level.genericbaitcount )
            {
                case 0:
                    var_1 = getnode( "bait_nearslope", "targetname" );
                    level.genericbaitcount++;
                    break;
                case 1:
                    var_1 = getnode( "bait_trees", "targetname" );
                    level.genericbaitcount = 0;
                    break;
            }
        }
    }
    else
    {
        if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
            common_scripts\utility::_id_384A( "storm_the_tavern" );

        thread hunt_player();
        return;
    }

    var_2 = distance( level.playercardbackground.origin, self.origin );
    wait 0.5;
    var_3 = distance( var_1.origin, self.origin );

    if ( level.divertclackerrange < var_2 && var_3 < var_2 )
        self _meth_81a9( var_1 );

    common_scripts\utility::_id_384A( "fall_back_to_barn" );

    if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
        common_scripts\utility::_id_384A( "storm_the_tavern" );

    thread hunt_player();
}

tavern_storming_delay()
{
    var_0 = getent( "tavern_fallback_shouting", "targetname" );
    var_0 thread tavern_stop_shouting();
    thread tavern_storming_hints();
    wait 5;
    _id_A5E8::_id_870C( "start_fall_back_to_barn_mix" );

    if ( !common_scripts\utility::_id_382E( "player_running_to_farm" ) )
        common_scripts\utility::_id_3831( "can_save" );

    wait 55;
    common_scripts\utility::_id_383F( "storm_the_tavern" );
}

tavern_storming_hints()
{
    level endon( "stop_shouting_tavern" );
    common_scripts\utility::_id_384A( "objective_armor_arrival" );

    for ( var_0 = 0; var_0 < 2; var_0++ )
    {
        _id_A5A4::_id_70C4( "fallbacktofarm1" );
        wait 1;

        if ( var_0 < 1 )
            level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "fallbackgeneric" );

        wait 1;

        if ( var_0 < 1 )
            level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "fallbacktofarm3" );

        wait 12;
        _id_A5A4::_id_70C4( "fallbacktofarm2" );
        wait 12;
        _id_A5A4::_id_70C4( "tavernoverrunsoon" );
        wait 10;
    }
}

tavern_stop_shouting()
{
    self waittill( "trigger" );
    level notify( "stop_shouting_tavern" );
    common_scripts\utility::_id_383F( "player_running_to_farm" );
    common_scripts\utility::_id_383F( "can_save" );
    _id_A5A4::_id_1143( "running_to_farm" );
}

clacker_primary_attack()
{
    common_scripts\utility::_id_384A( "objective_minigun_baglimit_done" );
    common_scripts\utility::_id_383F( "spawncull" );
    thread clacker_nearfarslope_check();
    var_0 = getnode( "southern_hill_breach_flank", "targetname" );
    var_1 = "southern_hill_breacher";
    var_2 = "clacker_far_and_near_slope_done";
    var_3 = "spawnHillFlank";
    level endon( var_2 );
    var_4 = getent( "nearfarslope_activation", "targetname" );
    var_4 waittill( "trigger" );
    common_scripts\utility::_id_383F( "player_entered_clacker_house_top_floor" );
    _id_A5A4::_id_1143( "player_entered_clacker_house" );
    common_scripts\utility::_id_384A( "helidrop_started" );

    for (;;)
    {
        var_5 = undefined;
        var_5 = [];
        var_5 = getaiarray( "axis" );

        if ( var_5.size < 27 )
        {
            thread encroach_start( var_0, var_1, var_2, var_3, undefined );
            wait(randomfloatrange( 2, 3 ));
        }

        wait 0.5;
    }
}

clacker_nearfarslope_check()
{
    common_scripts\utility::_id_384A( "nearslope_exploded" );
    common_scripts\utility::_id_384A( "farslope_exploded" );
    common_scripts\utility::_id_383F( "clacker_far_and_near_slope_done" );
}

clacker_init()
{
    common_scripts\utility::_id_383D( "putting_clacker_away" );
    var_0 = getentarray( "detonator_usetrig", "targetname" );
    var_1 = [];
    var_2 = [];
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( !isdefined( var_0[var_4]._not_team ) )
            continue;

        var_2 = getentarray( var_0[var_4]._not_team, "targetname" );

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            var_3 = var_2[var_5];

            if ( !isdefined( var_3._id_7A78 ) )
                continue;

            if ( var_3._id_7A78 == "objective_clacker" )
            {
                level.objectiveclackers++;
                var_1[var_1.size] = var_3;
                var_3 hide();
            }
        }

        var_2 = [];
    }

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_6 = [];
        var_6 = var_1[var_4] clacker_marker_setup();
        var_1[var_4] thread clacker_standby( var_6 );
    }
}

clacker_marker_setup()
{
    var_0 = [];
    var_1 = getent( self._not_team, "targetname" );

    for (;;)
    {
        var_0[var_0.size] = var_1;

        if ( isdefined( var_1._not_team ) )
            var_1 = getent( var_1._not_team, "targetname" );
        else
            break;

        wait 0.05;
    }

    return var_0;
}

clacker_standby( var_0 )
{
    var_1 = getent( self.teambalanced, "target" );
    var_2 = getent( self.script_parentname, "targetname" );
    common_scripts\utility::_id_384A( "detonators_activate" );
    self show();
    var_3 = var_1._id_79D9;
    common_scripts\utility::_id_383F( var_3 );
    thread clacker_markers( var_2, var_0 );

    for (;;)
    {
        var_1 sethintstring( &"SCRIPT_PLATFORM_HINT_GET_DETONATOR" );
        var_1 waittill( "trigger" );

        while ( common_scripts\utility::_id_382E( "putting_clacker_away" ) )
            wait 0.05;

        level notify( "picked_up_new_clacker" );
        var_4 = level.playercardbackground getcurrentweapon();

        if ( var_4 != "c4" )
            level.playercardbackground.clacker_current_weapon = var_4;

        thread clacker_noc4( var_1, var_2 );
        thread clacker_enable( var_1, var_2, var_0 );
        thread clacker_notouch( var_1, var_2 );
    }
}

clacker_markers( var_0, var_1 )
{
    var_2 = undefined;

    while ( isdefined( var_0 ) )
    {
        if ( level.playercardbackground istouching( var_0 ) )
        {

        }

        while ( isdefined( var_0 ) && level.playercardbackground istouching( var_0 ) )
        {
            if ( !isdefined( var_2 ) || var_2.size <= 0 )
                var_2 = clacker_markers_init_fx( var_1 );

            wait 0.05;
        }

        if ( isdefined( var_2 ) )
        {
            var_3 = var_2.size;

            for ( var_4 = 0; var_4 < var_3; var_4++ )
                var_2[var_4] delete();

            var_2 = undefined;
            setthreatbias( "player", "axis", 1000 );
        }

        wait 0.05;
    }
}

clacker_markers_init_fx( var_0 )
{
    setthreatbias( "player", "axis", 50 );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = spawn( "script_model", ( 0, 0, 0 ) );
        var_3 setmodel( "tag_origin" );
        var_3.angles = ( -90, 0, 0 );
        var_3.origin = var_0[var_2].origin;
        var_1[var_1.size] = var_3;
        var_3 thread clacker_markers_monitor_fx();
    }

    return var_1;
}

clacker_markers_monitor_fx()
{
    self endon( "death" );
    level.playercardbackground endon( "detonate" );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        var_2 = level.playercardbackground getcurrentweapon();

        if ( var_2 != "c4" )
            level.playercardbackground.clacker_current_weapon = var_2;

        if ( common_scripts\utility::_id_382E( "putting_clacker_away" ) )
            var_2 = "putting_clacker_away";

        if ( var_2 == "c4" )
        {
            if ( !var_1 )
            {
                playfxontag( common_scripts\utility::_id_3FA8( "killzone_marker_red" ), self, "tag_origin" );
                killfxontag( common_scripts\utility::_id_3FA8( "killzone_marker" ), self, "tag_origin" );
                var_1 = 1;
                var_0 = 0;
            }
        }
        else if ( !var_0 )
        {
            playfxontag( common_scripts\utility::_id_3FA8( "killzone_marker" ), self, "tag_origin" );
            killfxontag( common_scripts\utility::_id_3FA8( "killzone_marker_red" ), self, "tag_origin" );
            var_1 = 0;
            var_0 = 1;
        }

        wait 0.05;
    }
}

clacker_enable( var_0, var_1, var_2 )
{
    if ( level.playercardbackground istouching( var_1 ) )
    {
        self hide();
        common_scripts\utility::_id_383F( "got_the_clacker" );
        level.playercardbackground enableweapons();
        level.playercardbackground maps\_c4::switch_to_detonator();
        thread clacker_drop( var_0, var_1 );
        var_3 = var_0._id_79D9;
        common_scripts\utility::_id_3831( var_3 );
        thread clacker_fire( var_0, var_1, var_2 );

        while ( level.playercardbackground getcurrentweapon() != "c4" )
            wait 0.05;

        common_scripts\utility::_id_3831( "got_the_clacker" );
    }
}

clacker_drop( var_0, var_1 )
{
    while ( isdefined( var_1 ) && level.playercardbackground istouching( var_1 ) && !common_scripts\utility::_id_382E( "got_the_clacker" ) )
    {
        var_2 = level.playercardbackground getcurrentweapon();

        if ( var_2 != "c4" )
            thread clacker_disable( var_0, var_1 );

        wait 0.05;
    }
}

clacker_notouch( var_0, var_1 )
{
    while ( isdefined( var_1 ) && level.playercardbackground istouching( var_1 ) )
        wait 0.1;

    thread clacker_disable( var_0, var_1 );
}

clacker_noc4( var_0, var_1 )
{
    while ( level.playercardbackground getcurrentweapon() != "c4" )
        wait 0.05;

    while ( isdefined( var_1 ) && level.playercardbackground istouching( var_1 ) )
    {
        if ( level.playercardbackground getcurrentweapon() != "c4" )
        {
            thread clacker_disable( var_0, var_1 );
            level.playercardbackground takeweapon( "c4" );
            break;
        }

        wait 0.05;
    }
}

clacker_disable( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        level notify( "detclacker_disarm" );
        common_scripts\utility::_id_3831( "got_the_clacker" );
        self show();
        var_2 = var_0._id_79D9;
        common_scripts\utility::_id_383F( var_2 );
        thread clacker_reset_player_weapon();
    }
}

clacker_reset_player_weapon()
{
    level endon( "picked_up_new_clacker" );

    if ( !( level.playercardbackground getcurrentweapon() == "c4" ) )
        return;

    common_scripts\utility::_id_383F( "putting_clacker_away" );
    var_0 = level.playercardbackground getweaponslistprimaries()[0];

    if ( isdefined( level.playercardbackground.clacker_current_weapon ) && level.playercardbackground hasweapon( level.playercardbackground.clacker_current_weapon ) )
    {
        var_0 = level.playercardbackground.clacker_current_weapon;
        level.playercardbackground.clacker_current_weapon = undefined;
    }

    level.playercardbackground disableweapons();
    wait 1.0;
    level.playercardbackground takeweapon( "c4" );
    common_scripts\utility::_id_3831( "putting_clacker_away" );
    wait 0.1;
    level.playercardbackground enableweapons();
    level.playercardbackground switchtoweapon( var_0 );
}

clacker_fire( var_0, var_1, var_2 )
{
    level endon( "detclacker_disarm" );
    level.playercardbackground waittill( "detonate" );
    common_scripts\utility::_id_383F( "clacker_has_been_exercised" );

    if ( !isdefined( var_0 ) )
        return;

    if ( self.script_parentname == "detonator_nearslope" )
        common_scripts\utility::_id_383F( "nearslope_exploded" );

    if ( self.script_parentname == "detonator_farslope" )
        common_scripts\utility::_id_383F( "farslope_exploded" );

    if ( self.script_parentname == "detonator_crashsite" )
        common_scripts\utility::_id_383F( "crashsite_exploded" );

    if ( self.script_parentname == "detonator_cliffside" )
        common_scripts\utility::_id_383F( "cliffside_exploded" );

    thread killzone_detonation( var_2, level.playercardbackground );
    earthquake( 0.5, 2, level.playercardbackground.origin, 1650 );
    thread clacker_reset_player_weapon();
    var_3 = undefined;
    var_4 = undefined;
    var_5 = getentarray( var_0._not_team, "targetname" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_3 = var_5[var_6];

        if ( !isdefined( var_3.script_parentname ) )
            continue;

        if ( !( var_3.script_parentname == "clacker_objective_marker" ) )
            continue;

        var_4 = var_3;
    }

    var_7 = getentarray( "clacker_objective_marker", "script_noteworthy" );

    for ( var_6 = 0; var_6 < var_7.size; var_6++ )
    {
        var_8 = var_7[var_6];

        if ( var_8 == var_4 )
            var_7 = common_scripts\utility::_id_0CF6( var_7, var_8 );
    }

    var_1 delete();
    objective_delete( 5 );
    objective_add( 5, "active", &"VILLAGE_DEFEND_USE_THE_DETONATORS_IN1" );
    objective_current( 5 );

    for ( var_6 = 0; var_6 < var_7.size; var_6++ )
    {
        var_8 = var_7[var_6];

        if ( isdefined( var_8 ) )
            objective_additionalposition( 5, var_6, var_8.origin );
    }

    var_0 delete();
    var_4 delete();
    level.objectiveclackers--;

    if ( !level.objectiveclackers )
    {
        common_scripts\utility::_id_383F( "fall_back_to_barn" );
        common_scripts\utility::_id_383F( "barn_assault_begins" );
        _id_A5A4::_id_1143( "clackers_all_used_up" );
        thread tavern_storming_delay();
    }
}

player_interior_detect_init()
{
    level endon( "farm_reached" );
    common_scripts\utility::_id_384A( "fall_back_to_barn" );
    var_0 = getentarray( "interior_detection_volume", "targetname" );
    level.playerindoors = 0;
    var_1 = 0;

    for (;;)
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( level.playercardbackground istouching( var_0[var_2] ) )
                level.playerindoors = 1;
            else
                var_1++;

            wait 0.5;
        }

        if ( var_1 == var_0.size )
            level.playerindoors = 0;

        var_1 = 0;
        wait 0.5;
    }
}

enemy_interior_flashbangs()
{
    level endon( "farm_reached" );
    var_0 = getent( "enemy_near_interior_trig", "targetname" );
    common_scripts\utility::_id_384A( "fall_back_to_barn" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 notify( "reset_loadout" );
        wait 0.1;

        if ( isdefined( var_1 ) )
        {
            var_1 thread enemy_interior_grenadeswap();
            var_1 thread enemy_loadout_reset();
        }
    }
}

enemy_interior_grenadeswap()
{
    self endon( "death" );
    self endon( "reset_loadout" );
    level endon( "farm_reached" );

    for (;;)
    {
        if ( level.playerindoors )
        {
            self.grenadeammo = 6;
            self.groundentchanged = "flash_grenade";
        }
        else
        {
            self.grenadeammo = 6;
            self.groundentchanged = "fraggrenade";
            break;
        }

        wait 0.5;
    }
}

enemy_loadout_reset()
{
    self endon( "death" );
    self endon( "reset_loadout" );
    common_scripts\utility::_id_384A( "farm_reached" );
    wait 0.5;
    self.grenadeammo = 6;
    self.groundentchanged = "fraggrenade";
}

javelin_init()
{
    common_scripts\utility::_id_384A( "fall_back_to_barn" );
    var_0 = spawn( "weapon_javelin", ( 1021.1, 7309.2, 1006 ), 1 );
    var_0.angles = ( 356.201, 346.91, -0.426635 );
    var_0 thread _id_A5A4::_id_076A( "kill_jav_glow" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "got_the_javelin" );
}

tanks_init()
{
    if ( getdvar( "start" ) != "final_battle" && getdvar( "start" ) != "seaknight" )
    {
        common_scripts\utility::_id_384A( "fall_back_to_barn" );
        _id_A5A4::_id_70C4( "enemytanksnorth" );
        _id_A5A4::_id_70C4( "gettothebarn" );
        common_scripts\utility::_id_383F( "objective_armor_arrival" );
        common_scripts\utility::_id_384A( "got_the_javelin" );

        for ( var_0 = 1; var_0 < 5; var_0++ )
            thread tanks_deploy( "tank_backyard_0" + var_0 );
    }
}

tanks_engage( var_0 )
{
    self endon( "death" );
    level.playercardbackground endon( "death" );
    var_1 = undefined;
    var_2 = undefined;

    if ( var_0 == "tank_backyard_01" )
    {
        var_1 = getvehiclenode( "tank1_fire_position", "script_noteworthy" );
        var_2 = getent( "tank_killzone_east", "targetname" );
    }
    else if ( var_0 == "tank_backyard_02" )
    {
        var_1 = getvehiclenode( "tank2_fire_position", "script_noteworthy" );
        var_2 = getent( "tank_killzone_west", "targetname" );
    }
    else if ( var_0 == "tank_backyard_03" )
    {
        var_1 = getvehiclenode( "tank3_fire_position", "script_noteworthy" );
        var_2 = getent( "tank_killzone_west", "targetname" );
    }
    else if ( var_0 == "tank_backyard_04" )
    {
        var_1 = getvehiclenode( "tank4_fire_position", "script_noteworthy" );
        var_2 = getent( "tank_killzone_east", "targetname" );
    }

    self setwaitnode( var_1 );
    self waittill( "reached_wait_node" );

    for (;;)
    {
        var_2 waittill( "trigger" );
        self _meth_825d( level.playercardbackground.origin + ( 0, 0, 72 ) );
        common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 8.0 );
        self fireweapon();
        wait 4;
    }
}

tanks_deploy( var_0 )
{
    var_1 = _id_A5A8::_id_8979( var_0 );
    var_1 thread tanks_engage( var_0 );
    var_1._id_5BD5[0].maxvisibledist = 6000;
    level.tankid++;
    var_2 = level.tankid;
    var_1 thread tank_ping( var_2 );
    var_3 = ( 0, 0, 60 );
    target_set( var_1, var_3 );
    target_setattackmode( var_1, "top" );
    target_setjavelinonly( var_1, 1 );
    var_1 waittill( "death" );
    level.tankpop--;

    if ( level.tankpop )
    {
        objective_delete( 8 );
        objective_add( 8, "active", "" );
        objective_string( 8, &"VILLAGE_DEFEND_DESTROY_THE_INCOMING", level.tankpop );
        objective_current( 8 );
        level notify( "tank_objectives_update" );
        _id_A5A4::_id_1151( "save_tank_destroyed_with_javelin", 10 );
    }
    else
    {
        common_scripts\utility::_id_383F( "objective_all_tanks_destroyed" );
        common_scripts\utility::_id_383F( "kill_jav_glow" );
    }

    if ( isdefined( var_1 ) )
        target_remove( var_1 );

    _id_A5A4::arcademode_kill( var_1.origin, "explosive", 1000 );
}

tank_ping( var_0 )
{
    self endon( "death" );

    while ( isalive( self ) )
    {
        objective_additionalentity( 8, var_0, self );
        objective_ring( 8 );
        level waittill( "tank_objectives_update" );
    }
}

barn_helidrop()
{
    if ( getdvar( "start" ) != "final_battle" && getdvar( "start" ) != "javelin" && getdvar( "start" ) != "seaknight" )
    {
        var_0 = getent( "barn_helidrop", "targetname" );
        common_scripts\utility::_id_384A( "barn_assault_begins" );
        var_0 waittill( "trigger" );
        level notify( "halfway_through_field" );
        thread heli_destroyed( "enemy_heli_reinforcement_shoulder" );
        thread heli_destroyed( "enemy_heli_reinforcement_barncenter" );
        thread heli_destroyed( "enemy_heli_reinforcement_cowfield" );
        _id_A5A8::_id_8979( "enemy_heli_reinforcement_shoulder" );
        _id_A5A8::_id_8979( "enemy_heli_reinforcement_barncenter" );
        _id_A5A8::_id_8979( "enemy_heli_reinforcement_cowfield" );
    }
}

field_fallback()
{
    var_0 = getent( "redshirt1", "targetname" );
    var_1 = getent( "redshirt2", "targetname" );
    var_2 = getnode( "field_fallback_redshirt1", "targetname" );
    var_3 = getnode( "field_fallback_redshirt2", "targetname" );
    var_4 = getnode( "field_fallback_price", "targetname" );
    var_5 = getnode( "field_fallback_sasGunner", "targetname" );
    common_scripts\utility::_id_384A( "fall_back_to_barn" );
    var_0 _meth_81a9( var_2 );
    wait 2;
    var_1 _meth_81a9( var_3 );
    wait 2;
    level._id_6F7C _meth_81a9( var_4 );
    wait 5;
    level.sasgunner _meth_81a9( var_5 );
}

barn_fallback()
{
    var_0 = getent( "redshirt1", "targetname" );
    var_1 = getnode( "barn_fallback_redshirt1", "targetname" );
    var_2 = getent( "redshirt2", "targetname" );
    var_3 = getnode( "barn_fallback_redshirt2", "targetname" );
    var_4 = getnode( "barn_fallback_price", "targetname" );
    var_5 = getnode( "barn_fallback_sasGunner", "targetname" );
    common_scripts\utility::_id_384A( "got_the_javelin" );
    var_0 _meth_81a9( var_1 );
    wait 1;
    var_2 _meth_81a9( var_3 );
    wait 2;
    level._id_6F7C _meth_81a9( var_4 );
    wait 3;
    level.sasgunner _meth_81a9( var_5 );
}

escape_fallback()
{
    var_0 = getent( "final_lz", "targetname" );
    var_1 = getent( "redshirt1", "targetname" );
    var_2 = getnode( "final_rally_gaz", "targetname" );
    var_3 = getent( "redshirt2", "targetname" );
    var_4 = getnode( "final_rally_redshirt2", "targetname" );
    var_5 = getnode( "final_rally_price", "targetname" );
    var_6 = getnode( "final_rally_redshirt1", "targetname" );
    common_scripts\utility::_id_384A( "arm_delaying_action" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "lz_reached" );
    var_3 _meth_81a9( var_4 );
    level._id_6F7C _meth_81a9( var_5 );
    level.sasgunner _meth_81a9( var_6 );
    var_1 _meth_81a9( var_2 );
}

final_battle()
{
    if ( getdvar( "start" ) != "seaknight" )
    {
        common_scripts\utility::_id_384A( "start_final_battle" );
        wait 6;
        common_scripts\utility::_id_383F( "airstrikes_ready" );
        wait 5;
        common_scripts\utility::_id_384A( "falcon_one_finished_talking" );
        _id_A5A4::_id_70C4( "etafourminutes" );
        _id_A5A4::_id_1143( "start_the_clock" );
    }

    thread objective_stopwatch();
    thread countdown_events();
    thread rescue_chopper();
    thread mandown_reverse_spawn();

    if ( getdvar( "start" ) != "seaknight" )
    {
        if ( getdvar( "village_defend_one_minute" ) != "1" )
        {
            _id_A5A4::_id_70C4( "pickingupSAMs" );
            thread escape_music();
            level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "thatsjustgreat" );
            _id_A5A4::_id_70C4( "lzbottomhill" );
            _id_A5A4::_id_70C4( "takingthepiss" );
            _id_A5A4::_id_70C4( "thenewlz" );
        }

        common_scripts\utility::_id_383F( "objective_get_to_lz" );
        common_scripts\utility::_id_383F( "return_trip_begins" );
        _id_A5E8::_id_870C( "start_get_to_lz_mix" );
        wait 15;
        _id_A5A4::_id_70C4( "lzfoxtrot" );
        _id_A5A4::_id_70C4( "headlandingzone" );
    }
}

return_trip_friendly_boost()
{
    common_scripts\utility::_id_384A( "return_trip_begins" );
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( level._id_3BFE == 0 )
            var_0[var_1]._id_1300 = 12;

        if ( level._id_3BFE == 1 )
            var_0[var_1]._id_1300 = 6;

        if ( level._id_3BFE == 2 )
            var_0[var_1]._id_1300 = 2;

        if ( level._id_3BFE == 3 )
            var_0[var_1]._id_1300 = 1.5;
    }
}

airstrike_command()
{
    common_scripts\utility::_id_384A( "airstrikes_ready" );
    thread _id_1A0B( level.playercardbackground.origin, 1, ( 0, 110, 0 ) );
    wait 1.2;
    thread _id_1A0B( level.playercardbackground.origin, 1, ( 0, 96, 0 ) );
    wait 1;
    thread _id_1A0B( level.playercardbackground.origin, 1, ( 0, 126, 0 ) );
    wait 5;
    _id_A5A4::_id_70C4( "casready" );
    thread airstrike_hint_pc();
    level.playercardbackground giveweapon( "airstrike_support" );
    level.playercardbackground setactionslot( 2, "weapon", "airstrike_support" );
    thread airstrike_support();
    wait 3;
    common_scripts\utility::_id_383F( "falcon_one_finished_talking" );
    common_scripts\utility::_id_384A( "return_trip_begins" );
    thread airstrike_frequency_check();
    level endon( "stop_airstrike_reminders" );
    level endon( "no_airstrike_ammo" );

    for (;;)
    {
        var_0 = gettime();
        wait 70;

        if ( !level.airstrikecalledrecently )
        {
            _id_A5A4::_id_70C4( "casready" );
            level.airstrikecalledrecently = 0;
        }
    }
}

airstrike_frequency_check()
{
    level endon( "stop_airstrike_reminders" );
    level endon( "no_airstrike_ammo" );

    for (;;)
    {
        level waittill( "air_support_called" );
        level.airstrikecalledrecently = 1;
    }
}

farm_javelin_nag()
{
    wait 8;

    while ( !common_scripts\utility::_id_382E( "got_the_javelin" ) )
    {
        thread _id_A5A4::_id_70C4( "javelinorder2" );
        wait 30;
    }
}

_id_6302()
{
    var_0 = getent( "minigun", "targetname" );
    var_1 = getentarray( "clacker_objective_marker", "script_noteworthy" );
    var_2 = getent( "farm_reached_trig", "targetname" );
    var_3 = getent( "extraction_point", "targetname" );

    if ( _id_A5A4::_id_5016() )
        wait 25;

    common_scripts\utility::_id_384A( "objective_price_orders_southern_hill" );
    common_scripts\utility::_id_383F( "aa_southernhill" );
    objective_add( 2, "active", &"VILLAGE_DEFEND_TAKE_UP_A_DEFENSIVE_POSITION", ( -732, -1473, 188 ) );
    objective_current( 2 );
    common_scripts\utility::_id_384A( "objective_player_on_ridgeline" );
    wait 3;
    objective_state( 2, "done" );
    objective_add( 3, "active", &"VILLAGE_DEFEND_DEFEND_THE_SOUTHERN_HILL", ( -732, -1473, 188 ) );
    objective_current( 3 );
    _id_A5A4::_id_1143( "ready_for_ambush" );
    common_scripts\utility::_id_384A( "objective_price_orders_minigun" );
    objective_state( 3, "done" );
    common_scripts\utility::_id_3831( "aa_southernhill" );
    common_scripts\utility::_id_383F( "aa_minigun" );
    objective_add( 4, "active", &"VILLAGE_DEFEND_FALL_BACK_AND_DEFEND", var_0.origin );
    objective_current( 4 );
    _id_A5A4::arcademode_checkpoint( 4, "a" );
    _id_A5A4::_id_1143( "minigun_defense" );
    common_scripts\utility::_id_384A( "objective_detonators" );
    objective_state( 4, "done" );
    common_scripts\utility::_id_3831( "aa_minigun" );
    common_scripts\utility::_id_383F( "aa_detonators" );
    objective_add( 5, "active", &"VILLAGE_DEFEND_USE_THE_DETONATORS_IN", var_1[0].origin );
    objective_current( 5 );
    _id_A5A4::arcademode_checkpoint( 5, "b" );
    _id_A5A4::_id_1143( "detonator_defense" );

    for ( var_4 = 1; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_1[var_4];
        objective_additionalposition( 5, var_4, var_5.origin );
    }

    common_scripts\utility::_id_384A( "objective_armor_arrival" );
    objective_state( 5, "done" );
    common_scripts\utility::_id_3831( "aa_detonators" );
    common_scripts\utility::_id_383F( "aa_fallback" );
    _id_A5A4::_id_1143( "detonators_all_used_up" );
    objective_add( 6, "active", &"VILLAGE_DEFEND_FALL_BACK_TO_THE_FARM", var_2.origin );
    objective_current( 6 );
    _id_A5A4::arcademode_checkpoint( 3.5, "c" );
    thread farm_javelin_nag();

    if ( getdvar( "start" ) != "final_battle" && getdvar( "start" ) != "seaknight" && getdvar( "start" ) != "javelin" )
        var_2 waittill( "trigger" );

    common_scripts\utility::_id_383F( "farm_reached" );
    objective_state( 6, "done" );
    common_scripts\utility::_id_3831( "aa_fallback" );
    common_scripts\utility::_id_383F( "aa_javelin" );
    _id_A5A4::_id_1143( "player_got_to_the_farm" );
    objective_add( 7, "active", &"VILLAGE_DEFEND_GET_THE_JAVELIN_IN_THE", ( 1021.1, 7309.2, 1006 ) );
    objective_current( 7 );
    _id_A5A4::arcademode_checkpoint( 2, "d" );
    common_scripts\utility::_id_384A( "got_the_javelin" );
    objective_state( 7, "done" );
    _id_A5A4::_id_1143( "got_javelin" );
    thread early_chopper();
    objective_add( 8, "active", "" );
    objective_string( 8, &"VILLAGE_DEFEND_DESTROY_THE_INCOMING", 4 );
    objective_current( 8 );
    _id_A5A4::arcademode_checkpoint( 4, "e" );
    common_scripts\utility::_id_384A( "objective_all_tanks_destroyed" );
    level.playersafetyblocker solid();
    level.playerheliblocker solid();
    objective_string( 8, &"VILLAGE_DEFEND_DESTROY_THE_INCOMING1" );
    objective_state( 8, "done" );
    common_scripts\utility::_id_3831( "aa_javelin" );
    common_scripts\utility::_id_383F( "aa_returntrip" );
    _id_A5A4::_id_1143( "tanks_cleared" );
    common_scripts\utility::_id_383F( "arm_delaying_action" );
    objective_add( 9, "active", &"VILLAGE_DEFEND_SURVIVE_UNTIL_THE_HELICOPTER" );
    objective_current( 9 );
    _id_A5A4::arcademode_checkpoint( 3, "f" );
    common_scripts\utility::_id_383F( "start_final_battle" );
    common_scripts\utility::_id_384A( "objective_get_to_lz" );
    objective_add( 9, "active", &"VILLAGE_DEFEND_GET_TO_THE_LZ", var_3.origin );
    objective_current( 9 );
    _id_A5A4::_id_1143( "get_to_the_choppah" );
    _id_A5A4::arcademode_checkpoint( 7, "g" );
    var_6 = length( level._id_6F7C.origin - level.playercardbackground.origin );
    var_7 = getent( "price_seaknight_doppel", "targetname" );
    var_8 = length( level._id_3C61.origin - level.playercardbackground.origin );
    var_9 = getent( "gaz_seaknight_doppel", "targetname" );
    var_10 = length( level.redshirt.origin - level.playercardbackground.origin );
    var_11 = getent( "redshirt_seaknight_doppel", "targetname" );
    var_12 = length( level.sasgunner.origin - level.playercardbackground.origin );
    var_13 = getent( "sasGunner_seaknight_doppel", "targetname" );
    var_14 = [];
    var_14[0] = level._id_6F7C;
    var_14[1] = level._id_3C61;
    var_14[2] = level.redshirt;
    var_14[3] = level.sasgunner;

    for ( var_4 = 0; var_4 < var_14.size; var_4++ )
        var_14[var_4] thread friendly_player_tracking_nav();

    common_scripts\utility::_id_384A( "lz_reached" );
    level notify( "stop_airstrike_reminders" );
    thread maps\village_defend_code::friendly_pushplayer( "on" );
    objective_state( 9, "done" );
    objective_add( 10, "active", &"VILLAGE_DEFEND_SURVIVE_UNTIL_THE_HELICOPTER" );
    objective_current( 10 );
    common_scripts\utility::_id_384A( "seaknight_can_be_boarded" );
    objective_state( 10, "done" );
    objective_add( 11, "active", &"VILLAGE_DEFEND_BOARD_THE_HELICOPTER", var_3.origin );
    objective_current( 11 );
    common_scripts\utility::_id_384A( "player_made_it" );
    _id_A5A4::arcademode_checkpoint( 1.75, "h" );
    _id_A5A4::_id_1143( "inside_choppah" );
    common_scripts\utility::_id_384A( "outtahere" );
    objective_state( 11, "done" );
    common_scripts\utility::_id_3831( "aa_returntrip" );
}

autosaves_return_trip()
{
    level endon( "outtahere" );
    common_scripts\utility::_id_384A( "return_trip_begins" );
    var_0 = getent( "first_return_save", "targetname" );
    var_1 = getent( "second_return_save", "targetname" );
    var_2 = getent( "third_return_save", "targetname" );
    var_3 = level._id_8F0D * 60 * 1000;
    var_4 = gettime();
    var_0 waittill( "trigger" );
    var_5 = ( gettime() - var_4 ) / 1000;
    var_6 = 90;
    thread autosaves_safety( var_5, var_6 );
    var_1 waittill( "trigger" );
    var_5 = ( gettime() - var_4 ) / 1000;
    var_6 = 120;
    thread autosaves_safety( var_5, var_6 );
    var_2 waittill( "trigger" );
    var_5 = ( gettime() - var_4 ) / 1000;
    var_6 = 180;
    var_7 = 1;
    thread autosaves_safety( var_5, var_6, var_7 );
}

autosaves_safety( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( var_0 <= var_1 )
    {
        _id_A5A4::_id_1151( "return_trip_section", 10 );

        if ( var_2 )
            wait 3;
        else
            wait 10;

        common_scripts\utility::_id_3831( "can_save" );
        wait 2;
        common_scripts\utility::_id_383F( "can_save" );
    }
}

objective_stopwatch()
{
    common_scripts\utility::_id_384A( "objective_get_to_lz" );
    level notify( "start stopwatch" );
    var_0 = 1200;

    if ( isdefined( level._id_8F0D ) )
        var_0 = level._id_8F0D * 60;

    level.hudelem = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, var_0 );
    level.hudelem setpulsefx( 30, 900000, 700 );
    level.hudelem._id_92B2.land = &"VILLAGE_DEFEND_HELICOPTER_EXTRACTION";
    level.hudelem settenthstimer( var_0 );
    wait(level._id_8F0D * 60);
    _id_A546::destroy_countdown_hud( level.hudelem );
    thread lz_warning_timer();
}

lz_warning_timer()
{
    level.lz_warning_time = 17;
    var_0 = level.lz_warning_time;
    level.hudelem = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, var_0 );
    level.hudelem setpulsefx( 30, level.lz_warning_time * 1000, 700 );
    level.hudelem thread warning_effect();
    level.hudelem._id_92B2.land = &"VILLAGE_DEFEND_HELICOPTER_WARNING";
    level.hudelem settenthstimer( var_0 );
    common_scripts\utility::_id_3856( "player_made_it", level.lz_warning_time );
    level.hudelem notify( "stop_LZ_warning" );
    wait 1.0;
    _id_A546::destroy_countdown_hud( level.hudelem );
}

warning_effect()
{
    self endon( "death" );
    self endon( "stop_LZ_warning" );
    init_warning_font_color();
    thread change_color_with_notify( "warning_yellow", level.warning_font_color["yellow"], level.warning_font_color["yellow glow"], "stop_LZ_warning" );
    thread change_color_with_notify( "warning_red", level.warning_font_color["red"], level.warning_font_color["red glow"], "stop_LZ_warning" );
    thread fading_pulse_effect( 0.3, 0.3, 1.0, "stop_LZ_warning" );
    var_0 = gettime();
    var_1 = 10.0;
    var_2 = 5.0;

    for (;;)
    {
        var_3 = ( gettime() - var_0 ) / 1000;
        var_4 = level.lz_warning_time - var_1;

        if ( var_3 > var_4 )
            break;

        wait 0.05;
    }

    self notify( "warning_yellow" );

    for (;;)
    {
        var_3 = ( gettime() - var_0 ) / 1000;
        var_4 = level.lz_warning_time - var_2;

        if ( var_3 > var_4 )
            break;

        wait 0.05;
    }

    self notify( "warning_red" );
}

init_warning_font_color()
{
    if ( isdefined( level.warning_font_color_inited ) )
        return;

    level.warning_font_color_inited = 1;
    level.warning_font_color = [];
    level.warning_font_color["default"] = ( 0.8, 1, 0.8 );
    level.warning_font_color["green"] = level.warning_font_color["default"];
    level.warning_font_color["yellow"] = ( 1, 1, 0.6 );
    level.warning_font_color["red"] = ( 1, 0.3, 0.3 );
    level.warning_font_color["default glow"] = ( 0.3, 0.6, 0.3 );
    level.warning_font_color["green glow"] = level.warning_font_color["default glow"];
    level.warning_font_color["yellow glow"] = ( 0.7, 0.7, 0.2 );
    level.warning_font_color["red glow"] = ( 0.7, 0.2, 0.2 );
}

change_color_with_notify( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    self waittill( var_0 );

    if ( isdefined( var_1 ) )
        self.color = var_1;

    if ( isdefined( var_2 ) )
        self.glowcolor = var_2;
}

fading_pulse_effect( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    var_4 = 0;

    for (;;)
    {
        if ( level.hudelem.alpha >= 1 )
            var_4 = var_1;
        else
            var_4 = var_2;

        level.hudelem fadeovertime( var_0 );
        level.hudelem.alpha = var_4;
        wait(var_0);
    }
}

countdown_speech( var_0 )
{
    level endon( "player_made_it" );
    _id_A5A4::_id_70C4( var_0 );
}

countdown_events()
{
    common_scripts\utility::_id_384A( "objective_get_to_lz" );
    level endon( "player_made_it" );
    var_0 = level._id_8F0D * 60;

    if ( getdvar( "village_defend_one_minute" ) != "1" )
    {
        wait 60;

        if ( !common_scripts\utility::_id_382E( "reached_evac_point" ) && !common_scripts\utility::_id_382E( "lz_reached" ) )
            thread countdown_speech( "almosttherethree" );

        if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
            thread countdown_speech( "gettolandingzone" );

        wait 60;
        thread countdown_speech( "twominutesleft" );

        if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
        {
            thread countdown_speech( "copywereonourway" );
            thread countdown_speech( "breakthroughtolz" );
            thread countdown_speech( "getdownthehill" );
        }

        wait 30;
        thread countdown_speech( "ninetysecondsleft" );
        common_scripts\utility::_id_383F( "rescue_chopper_ingress" );
        wait 30;
    }

    thread countdown_speech( "oneminutebingo" );

    if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
        thread countdown_speech( "bottomofthehill" );

    wait 30;
    thread countdown_speech( "thirtyseconds" );

    if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
        thread countdown_speech( "gettothelzgogo" );

    wait 30;

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
    {
        common_scripts\utility::_id_383F( "seaknight_guards_boarding" );
        common_scripts\utility::_id_384A( "seaknight_unboardable" );
        wait 3;

        if ( !common_scripts\utility::_id_382E( "player_made_it" ) && isalive( level.playercardbackground ) )
        {
            setdvar( "ui_deadquote", &"VILLAGE_DEFEND_YOU_DIDNT_REACH_THE_HELICOPTER" );
            _id_A5A4::_id_5CDF();
        }
    }
}

early_chopper()
{
    var_0 = getent( "early_chopper", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "rescue_chopper_ingress" );
}

escape_music()
{
    level endon( "open_bay_doors" );
    _id_A5A4::_id_6008( "h1_village_defend_get_to_lz_music" );
}

seaknight_music()
{
    common_scripts\utility::_id_384A( "open_bay_doors" );
    musicstop( 4 );
    level.playercardbackground playsound( "h1_village_defend_get_to_lz_music_end" );
    wait 5.1;
    _id_A5A4::_id_6008( "village_defend_escape" );
}

rescue_chopper()
{
    if ( getdvar( "village_defend_one_minute" ) != "1" )
        common_scripts\utility::_id_384A( "rescue_chopper_ingress" );

    thread maps\village_defend_code::seaknight();
    common_scripts\utility::_id_384A( "seaknight_can_be_boarded" );
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0.origin = level.seaknight1 gettagorigin( "tag_door_rear" );
    var_0.rank = 27.7311;

    for (;;)
    {
        wait 0.05;

        if ( distance( level.playercardbackground.origin, var_0.origin ) >= var_0.rank )
        {
            continue;
            continue;
        }

        break;
    }

    if ( !common_scripts\utility::_id_382E( "seaknight_unboardable" ) )
    {
        common_scripts\utility::_id_383F( "player_made_it" );
        _id_A5E8::_id_870C( "start_inside_seaknight_mix" );
        rescue_ride();
        thread rescue_teleport_friendlies();
        thread rescue_failsafe();

        if ( isdefined( level.hudelem ) )
            _id_A546::destroy_countdown_hud( level.hudelem );

        common_scripts\utility::_id_384A( "outtahere" );
        wait 2;
        _id_A5A4::_id_70C4( "cominhome" );
        wait 1;
        _id_A5A4::_id_60D6();
    }
    else
    {
        var_1 = getent( "intro_tank_tower_target", "targetname" );
        var_1 playsound( level.sniperfx );
        wait 0.1;
        level.playercardbackground kill();
    }
}

rescue_teleport_friendlies()
{
    wait 2;
    var_0 = length( level._id_6F7C.origin - level.playercardbackground.origin );
    var_1 = getent( "price_seaknight_doppel", "targetname" );
    var_2 = length( level._id_3C61.origin - level.playercardbackground.origin );
    var_3 = getent( "gaz_seaknight_doppel", "targetname" );
    var_4 = length( level.redshirt.origin - level.playercardbackground.origin );
    var_5 = getent( "redshirt_seaknight_doppel", "targetname" );
    var_6 = length( level.sasgunner.origin - level.playercardbackground.origin );
    var_7 = getent( "sasGunner_seaknight_doppel", "targetname" );
    var_8 = 1800;

    if ( var_0 > var_8 )
    {
        level._id_6F7C _id_A5A4::_id_8EA4();
        level._id_6F7C delete();
        var_1 thread rescue_doppel_spawn();
    }

    if ( var_2 > var_8 )
    {
        level._id_3C61 _id_A5A4::_id_8EA4();
        level._id_3C61 delete();
        var_3 thread rescue_doppel_spawn();
    }

    if ( var_4 > var_8 )
    {
        level.redshirt _id_A5A4::_id_8EA4();
        level.redshirt delete();
        var_5 thread rescue_doppel_spawn();
    }

    if ( var_6 > var_8 )
    {
        level.sasgunner _id_A5A4::_id_8EA4();
        level.sasgunner delete();
        var_7 thread rescue_doppel_spawn();
    }
}

rescue_doppel_spawn()
{
    var_0 = self stalingradspawn();

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    var_0 thread hero();
    var_0.fixednode = 0;
    var_0 thread maps\village_defend_code::seaknight_sas_load();
}

rescue_failsafe()
{
    wait 45;
    _id_A5A4::_id_60D6();
}

rescue_ride()
{
    level.playercardbackground disableweapons();
    var_0 = _id_A5A4::_id_88D1( "player_carry" );
    var_0 hide();
    level.seaknight1 _id_A510::_id_0BC7( var_0, "village_player_getin", "tag_detach" );
    var_0 linkto( level.seaknight1, "tag_detach" );
    var_0 _id_A5A4::_id_5696( "tag_player", 0.5, 0.9, 35, 35, 45, 0 );
    var_1 = [];
    var_1[var_1.size] = var_0;
    level.seaknight1 _id_A510::_id_0C18( var_1, "village_player_getin", "tag_detach" );
    level.playercardbackground enableweapons();
    level.playercardbackground playerlinktodelta( var_0, "tag_player", 1, 20, 45, 5, 25 );
}

_id_5FFB()
{
    level endon( "stop_ambush_music" );

    if ( getdvar( "start" ) != "final_battle" && getdvar( "start" ) != "seaknight" )
    {
        while ( !common_scripts\utility::_id_382E( "stop_ambush_music" ) )
        {
            _id_A5A4::_id_6008( "village_defend_vanguards" );
            wait 85.2;
            musicstop( 0.1 );
            wait 0.15;
        }
    }
}

mandown_reverse_spawn()
{
    var_0 = getent( "back_spawning_activator", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "back_spawn_stoppable" );
}

killzone_detonation( var_0, var_1 )
{
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_5 = level.killzonefxprogram[var_2];
        var_6 = level.killzonesfx[var_2];
        playfx( var_5, var_4.origin );
        var_4 playsound( var_6 );
        earthquake( 0.1, 0.5, level.playercardbackground.origin, 1250 );

        if ( !isdefined( var_1 ) )
            radiusdamage( var_4.origin, 240, 100500, 100500 );
        else
            radiusdamage( var_4.origin, 240, 100500, 100500, var_1 );

        var_7 = isdefined( var_1 ) && var_1 == level.playercardbackground;
        var_8 = distancesquared( level.playercardbackground.origin, var_4.origin ) <= 2250000;

        if ( var_7 || var_8 )
        {
            var_9 = common_scripts\utility::_id_9294( var_7, "generic_attack_light_500", "generic_attack_medium_500" );
            var_10 = common_scripts\utility::_id_9294( var_7, "generic_attack_medium_500", "generic_attack_heavy_500" );
            var_11 = common_scripts\utility::_id_9294( var_7, "generic_attack_heavy_500", "generic_attack_heavy_1000" );

            if ( var_3 == var_0.size - 1 )
                level.playercardbackground playrumbleonentity( var_11 );
            else if ( randomint( 3 ) == 0 )
                level.playercardbackground playrumbleonentity( var_9 );
            else
                level.playercardbackground playrumbleonentity( var_10 );
        }

        var_2++;

        if ( var_2 >= level.killzonefxprogram.size )
            var_2 = 0;

        wait(randomfloatrange( 0.05, 0.15 ));
    }
}

killzonefxprogram()
{
    level.killzonefxprogram = [];
    level.killzonefxprogram[0] = level.killzonebigexplosion_fx;
    level.killzonefxprogram[1] = level.killzonemudexplosion_fx;
    level.killzonefxprogram[2] = level.killzonebigexplosion_fx;
    level.killzonefxprogram[3] = level.killzonefuelexplosion_fx;
    level.killzonefxprogram[4] = level.killzonedirtexplosion_fx;
    level.killzonefxprogram[5] = level.killzonemudexplosion_fx;
    level.killzonefxprogram[6] = level.killzonebigexplosion_fx;
    level.killzonefxprogram[7] = level.killzonefuelexplosion_fx;
    level.killzonefxprogram[8] = level.killzonedirtexplosion_fx;
    level.killzonefxprogram[9] = level.killzonebigexplosion_fx;
    level.killzonesfx = [];
    level.killzonesfx[0] = "explo_mine";
    level.killzonesfx[1] = "explo_mine";
    level.killzonesfx[2] = "explo_mine";
    level.killzonesfx[3] = "explo_mine";
    level.killzonesfx[4] = "explo_mine";
    level.killzonesfx[5] = "explo_mine";
    level.killzonesfx[6] = "explo_mine";
    level.killzonesfx[7] = "explo_mine";
    level.killzonesfx[8] = "explo_mine";
    level.killzonesfx[9] = "explo_mine";
}

followscriptedpath( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    wait(var_1);
    var_3 = [];

    for (;;)
    {
        var_3[var_3.size] = var_0;

        if ( isdefined( var_0._not_team ) )
        {
            var_0 = getnode( var_0._not_team, "targetname" );
            continue;
        }

        break;
    }

    self._id_2AF3 = 1;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_0 = var_3[var_4];
        self _meth_81a9( var_0 );

        if ( isdefined( var_0.rank ) )
            self.goalradius = var_0.rank;

        if ( isdefined( var_0._id_7AD9 ) )
            self _meth_81ce( var_0._id_7AD9 );

        self waittill( "goal" );

        if ( !isdefined( var_0._not_team ) )
            self notify( "reached_last_node_in_chain" );

        if ( !isdefined( var_0.script_parentname ) )
            continue;

        wait 0.1;
    }

    self._id_2AF3 = 0;
}

friendly_setup()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] thread hero();
        var_0[var_1].grenadeammo = 0;
    }

    common_scripts\utility::_id_384A( "objective_price_orders_minigun" );
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].grenadeammo = 5;
}

hero()
{
    thread _id_A5A4::_id_58D7();
    self _meth_81a7( 1 );
    self.ikweight = 1;
    self.index = 1;
}

encroach_start( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( var_2 );
    var_5 = [];
    var_6 = [];
    var_7 = undefined;
    var_5 = getentarray( var_1, "targetname" );

    for ( var_8 = 0; var_8 < var_5.size; var_8++ )
    {
        if ( isdefined( var_5[var_8].script_parentname ) )
        {
            if ( var_5[var_8].script_parentname == var_3 )
                var_6[var_6.size] = var_5[var_8];
        }
    }

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        var_6[var_8].count = 1;
        var_7 = var_6[var_8] stalingradspawn();

        if ( _id_A5A4::_id_88F1( var_7 ) )
            return;

        if ( common_scripts\utility::_id_382E( "no_more_grenades" ) )
            self.grenadeammo = 0;

        var_7 thread encroach_nav( var_0, var_2 );
        var_9 = getent( "minigun", "targetname" );
        var_10 = var_9 getturretowner();

        if ( isdefined( var_4 ) )
        {
            if ( var_4 == "southern_hill" )
                var_7 thread southern_hill_deathmonitor();
        }

        if ( isdefined( var_4 ) )
        {
            if ( var_4 == "minigun_breach" )
                var_7 thread minigun_breach_deathmonitor();
        }
    }
}

encroach_nav( var_0, var_1 )
{
    level endon( var_1 );
    self endon( "death" );

    if ( !common_scripts\utility::_id_382E( "objective_minigun_baglimit_done" ) )
    {
        var_2 = [];
        var_3 = var_0;
        var_4 = undefined;

        for (;;)
        {
            var_2[var_2.size] = var_3;

            if ( isdefined( var_3._not_team ) )
            {
                var_5 = getnodearray( var_3._not_team, "targetname" );
                var_4 = randomint( var_5.size );
                var_3 = var_5[var_4];
                continue;
            }

            break;
        }

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            self _meth_81a9( var_2[var_6] );
            self waittill( "goal" );
            wait(randomfloatrange( level.encroachminwait, level.encroachmaxwait ));
        }

        common_scripts\utility::_id_384A( "divert_for_clacker" );
    }

    if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
        common_scripts\utility::_id_384A( "storm_the_tavern" );

    thread hunt_player();
    thread helidrop_clacker_divert();
}

southern_hill_mortar_detonate( var_0 )
{
    var_1 = level.killzonebigexplosion_fx;
    var_2 = "mortar_incoming";
    var_0 playsound( var_2 );
    wait 0.7;
    playfx( var_1, var_0.origin );
    var_0 playsound( "mortar_explosion" );
    earthquake( 0.35, 0.5, level.playercardbackground.origin, 1250 );
    radiusdamage( var_0.origin, 256, 1000, 500 );
}

begin_delaying_action()
{
    common_scripts\utility::_id_384A( "arm_delaying_action" );

    if ( level._id_3BFE == 0 )
        level.detectioncycletime = 60;

    if ( level._id_3BFE == 1 )
        level.detectioncycletime = 25;

    if ( level._id_3BFE == 2 )
        level.detectioncycletime = 22;

    if ( level._id_3BFE == 3 )
        level.detectioncycletime = 19;

    var_0 = getent( "delaying_action_trigger", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "engage_delaying_action" );
}

begin_delaying_action_timeout()
{
    common_scripts\utility::_id_384A( "arm_delaying_action" );
    wait 180;
    common_scripts\utility::_id_383F( "engage_delaying_action" );
}

player_detection_volume_init()
{
    var_0 = getentarray( "player_detection_volume", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = player_detection_collect( var_0[var_1] );
        var_3 = player_spawnproc_ents_collect( var_0[var_1] );
        thread player_detection_loop( var_0[var_1], var_2, var_3 );
    }
}

player_detection_collect( var_0 )
{
    var_1 = getentarray( var_0._not_team, "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_2 = getentarray( var_1[var_3]._not_team, "targetname" );

    return var_1;
}

player_spawnproc_ents_collect( var_0 )
{
    var_1 = getentarray( var_0._not_team, "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = getentarray( var_1[var_3]._not_team, "targetname" );
        var_2[var_2.size] = var_4;
    }

    return var_2;
}

player_detection_loop( var_0, var_1, var_2 )
{
    level endon( "engage_delaying_action" );
    common_scripts\utility::_id_384A( "fall_back_to_barn" );

    for (;;)
    {
        var_3 = getaiarray( "axis" );
        var_4 = getaiarray( "allies" );
        var_5 = var_3.size + var_4.size;
        var_6 = level.maxai - var_5;

        if ( var_6 >= level.reqslots )
        {
            if ( level.playercardbackground istouching( var_0 ) )
            {
                thread ai_spawnprocessor( var_0, var_1, var_2 );

                if ( common_scripts\utility::_id_382E( "objective_all_tanks_destroyed" ) )
                    level.delayingactionenemywaves++;

                if ( level.delayingactionenemywaves >= level.enemywavesallowed )
                    common_scripts\utility::_id_383F( "engage_delaying_action" );
            }

            wait(level.detectioncycletime);
        }

        wait 0.5;
    }
}

ai_spawnprocessor( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        thread ai_spawn_control_set_create( var_1[var_3], var_0, var_2[var_3] );
}

ai_spawn_control_set_create( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < level.aspawners.size; var_4++ )
    {
        var_5 = level.aspawners[var_4];

        if ( !isdefined( var_5.teambalanced ) )
            continue;

        if ( var_5.teambalanced == var_0._not_team )
            var_3[var_3.size] = var_5;
    }

    var_6 = undefined;
    var_7 = [];
    var_7 = var_2;

    for ( var_4 = 0; var_4 < var_7.size; var_4++ )
    {
        var_8 = var_7[var_4];

        if ( !isdefined( var_8.script_parentname ) )
            continue;

        if ( var_8.script_parentname == "smoke_generator" )
        {
            var_6 = var_8;
            break;
        }
    }

    var_9 = undefined;
    var_10 = var_0._id_7A78;

    for ( var_4 = 0; var_4 < level.aroutenodes.size; var_4++ )
    {
        var_11 = level.aroutenodes[var_4];

        if ( !isdefined( var_11.script_parentname ) )
            continue;

        if ( var_11.script_parentname == var_10 )
        {
            var_9 = var_11;
            break;
        }
    }

    thread ai_spawn_and_attack( var_3, var_6, var_9, var_1 );
}

ai_spawn_and_attack( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
    {
        playfx( level.smokegrenade, var_1.origin );
        wait(level.smokebuildtime);
        var_4 = length( level.playercardbackground.origin - var_1.origin );

        if ( var_4 < level.smokespawnsafedist )
            return;
    }

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];
        var_0[var_5].count = 1;
        var_7 = aipopcount();

        if ( var_7 < 32 )
        {
            var_8 = var_6 stalingradspawn();

            if ( _id_A5A4::_id_88F1( var_8 ) )
                continue;

            if ( common_scripts\utility::_id_382E( "no_more_grenades" ) )
                self.grenadeammo = 0;

            var_8 thread ai_flank_route( var_2 );
            var_8 thread ai_reacquire_player( var_3 );
        }
    }
}

ai_flank_route( var_0 )
{
    self endon( "death" );
    self endon( "reacquire_player" );

    for (;;)
    {
        self _meth_81a9( var_0 );

        if ( isdefined( var_0.rank ) )
            self.goalradius = var_0.rank;

        self waittill( "goal" );

        if ( isdefined( var_0._id_7A7B ) )
        {
            var_1 = var_0._id_7A7B + randomfloatrange( 0.5, 1.5 );
            wait(var_1);
        }

        if ( !isdefined( var_0._not_team ) )
        {
            if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
                common_scripts\utility::_id_384A( "storm_the_tavern" );

            thread hunt_player();
            break;
        }

        var_0 = getnode( var_0._not_team, "targetname" );
    }
}

ai_reacquire_player( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !level.playercardbackground istouching( var_0 ) )
        {
            wait(level.volumedesertiontime);

            if ( !level.playercardbackground istouching( var_0 ) )
            {
                self notify( "reacquire_player" );
                wait 0.5;

                if ( common_scripts\utility::_id_382E( "fall_back_to_barn" ) )
                    common_scripts\utility::_id_384A( "storm_the_tavern" );

                thread hunt_player();
                break;
            }
        }

        wait(level.detectionrefreshtime);
    }
}

return_trip_enemy_acc_prep()
{
    var_0 = getentarray( "flood_spawner", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1 = getentarray( var_0[var_2]._not_team, "targetname" );
        common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::return_trip_enemy_acc );
        var_1 = undefined;
        var_1 = [];
    }
}

return_trip_enemy_acc()
{
    common_scripts\utility::_id_384A( "start_final_battle" );
    self._id_1300 = level.village_diff[level._id_3BFE];
}

airstrike_hint_console()
{
    _id_A5A4::_id_48B0( &"VILLAGE_DEFEND_CLOSE_AIR_SUPPORT_STANDING" );
    level._id_4B3E = _id_A546::_id_2420( "hud_dpad", 32, 32 );
    level._id_4B3E _id_A546::_id_7FEE( "TOP", undefined, -16, 165 );
    level._id_4B3F = _id_A546::_id_2420( "compass_objpoint_airstrike", 32, 32 );
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, -15, 196 );
    level._id_4B40 = _id_A546::_id_2420( "hud_arrow_down", 24, 24 );
    level._id_4B40 _id_A546::_id_7FEE( "TOP", undefined, -15.5, 170 );
    level._id_4B40.space = 1;
    level._id_4B40.color = ( 1, 1, 0 );
    level._id_4B40.alpha = 0.7;
    wait 4;
    level._id_4B3E _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level._id_4B3F _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level._id_4B40 _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level._id_4B3E scaleovertime( 1, 20, 20 );
    level._id_4B3F scaleovertime( 1, 20, 20 );
    level._id_4B40 scaleovertime( 1, 20, 20 );
    wait 0.7;
    level._id_4B3E fadeovertime( 0.15 );
    level._id_4B3E.alpha = 0;
    level._id_4B3F fadeovertime( 0.15 );
    level._id_4B3F.alpha = 0;
    level._id_4B40 fadeovertime( 0.15 );
    level._id_4B40.alpha = 0;
    _id_A5A4::_id_48CB( 0.15 );
}

airstrike_hint_pc()
{
    _id_A5A4::_id_48B0( &"VILLAGE_DEFEND_CLOSE_AIR_SUPPORT_STANDING_PC" );
    setomnvar( "ui_display_hud_for_equipment_motion", 1 );
    level._id_4B3F = _id_A546::_id_2420( "compass_objpoint_airstrike", 32, 32 );
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, -15, 150 );
    wait 4;
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, -320, 460, 1.0 );
    level._id_4B3F scaleovertime( 1, 20, 20 );
    wait 0.7;
    level._id_4B3F fadeovertime( 0.15 );
    level._id_4B3F.alpha = 0;
    setomnvar( "ui_display_hud_for_equipment_motion", 0 );
    _id_A5A4::_id_48CB( 0.15 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );

    if ( isdefined( level._id_4B3E ) )
        level._id_4B3E _id_A546::_id_28E9();

    if ( isdefined( level._id_4B3F ) )
        level._id_4B3F _id_A546::_id_28E9();

    if ( isdefined( level._id_4B40 ) )
        level._id_4B40 _id_A546::_id_28E9();

    level notify( "clearing_hints" );
}

airstrike_support()
{
    level.playerpreviousweapon = undefined;

    for (;;)
    {
        while ( level.playercardbackground getcurrentweapon() != "airstrike_support" )
        {
            level.playerpreviousweapon = level.playercardbackground getcurrentweapon();
            wait 0.05;
        }

        var_0 = level.playercardbackground getweaponammostock( "airstrike_support" );

        if ( !isdefined( var_0 ) )
            break;
        else if ( var_0 == 0 )
            break;

        thread airstrike_support_activate();

        while ( level.playercardbackground getcurrentweapon() == "airstrike_support" )
            wait 0.05;

        level notify( "air_support_canceled" );
        thread airstrike_support_deactive();
    }
}

airstrike_support_activate()
{
    level endon( "air_support_canceled" );
    level endon( "air_support_called" );
    level notify( "air_support_activated" );
    thread airstrike_support_paint_target();
    level.airstrikeattackarrow = maps\air_support_shared::air_support_create_arrow_ent();
    level._id_6C5C = 1;
    maps\air_support_shared::air_support_update_arrow_coords( level.airstrikeattackarrow, "village_defend_debug_marker" );
}

airstrike_support_deactive()
{
    level endon( "air_support_activated" );
    wait 0.05;

    if ( isdefined( level.airstrikeattackarrow ) )
        level.airstrikeattackarrow delete();
}

airstrike_support_paint_target()
{
    level endon( "air_support_canceled" );
    level.playercardbackground waittill( "weapon_fired" );
    common_scripts\utility::_id_383F( "airstrike_in_progress" );
    _id_A536::_id_9932();
    level.activeairstrikes++;
    var_0 = level.playercardbackground getweaponammostock( "airstrike_support" );

    if ( !isdefined( var_0 ) )
        level notify( "no_airstrike_ammo" );
    else if ( var_0 == 0 )
        level notify( "no_airstrike_ammo" );

    thread airstrike_support_mark();
    var_1 = level.playercardbackground getweaponslistprimaries();

    if ( isdefined( var_1[0] ) && var_1[0] == level.playerpreviousweapon )
        level.playercardbackground switchtoweapon( var_1[0] );
    else if ( isdefined( var_1[1] ) && var_1[1] == level.playerpreviousweapon )
        level.playercardbackground switchtoweapon( var_1[1] );
    else
        level.playercardbackground switchtoweapon( var_1[0] );

    var_2 = level.airstrikeattackarrow.origin;
    thread airstrike_support_launch( var_2 );
    level notify( "air_support_called" );
    airstrike_support_deactive();
    level.airstrikesupportcallsremaining--;
    thread airstrike_support_weapon_refresh();

    if ( level.airstrikesupportcallsremaining % 2 == 0 )
        _id_A5A4::_id_70C4( "airstrikewarning" );
    else if ( level.airstrikesupportcallsremaining % 2 != 0 )
        _id_A5A4::_id_70C4( "airstrikewarning" );
    else if ( level.airstrikesupportcallsremaining <= 0 )
        _id_A5A4::_id_70C4( "airstrikewarning" );
}

airstrike_support_weapon_refresh()
{
    while ( level.playercardbackground getcurrentweapon() == "airstrike_support" )
        waittillframeend;

    var_0 = level.playercardbackground getweaponammostock( "airstrike_support" );
    var_0--;
    level.playercardbackground takeweapon( "airstrike_support" );
    level.playercardbackground giveweapon( "airstrike_support" );
    level.playercardbackground setactionslot( 2, "weapon", "airstrike_support" );
    level.playercardbackground setweaponammostock( "airstrike_support", var_0 );
}

airstrike_support_launch( var_0 )
{
    wait 5;
    thread _id_1A0B( var_0, undefined, undefined, 1 );
}

airstrike_support_mark()
{
    var_0 = level.airstrikeattackarrow.origin;
    var_1 = level.airstrikeattackarrow.angles;
    wait 0.1;
    var_2 = maps\air_support_shared::air_support_create_selection_ent( var_0, var_1 );
    level waittill( "airstrike_inbound" );
    var_2 delete();
}

_id_1A0B( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
    {
        var_4 = var_0 - level.playercardbackground.origin;
        var_5 = vectortoangles( var_4 );
        var_6 = var_5[1];
        var_7 = 75;

        for (;;)
        {
            var_2 = ( 0, randomint( 360 ), 0 );
            var_8 = animscripts\utility::_id_06C4( var_6 - var_2[1] );

            if ( var_8 < 180 - var_7 )
                break;

            if ( var_8 > 180 + var_7 )
                break;

            wait 0.05;
        }
    }

    var_9 = 24000;
    var_10 = 200;

    if ( level.lowplaneflyby < 3 )
    {
        var_11 = 850;
        level.lowplaneflyby++;
    }
    else
        var_11 = 1850;

    var_12 = 6000;
    var_13 = var_0 + _id_A5A4::vector_multiply( anglestoforward( var_2 ), -1 * var_9 );
    var_13 += ( 0, 0, var_11 );
    var_14 = var_0 + _id_A5A4::vector_multiply( anglestoforward( var_2 ), var_9 );
    var_14 += ( 0, 0, var_11 );
    var_15 = length( var_13 - var_14 );
    var_16 = var_15 / var_12;
    var_15 = abs( var_15 / 2 + var_10 );
    var_17 = var_15 / var_12;

    if ( isdefined( var_3 ) && var_3 )
        level thread _id_A5A4::_id_61FD( "airstrike_inbound", max( var_17 - 2.0, 0 ) );

    if ( isdefined( var_1 ) )
    {
        level thread doplanestrike( var_0, var_13 + ( 0, 0, randomint( 500 ) ), var_14 + ( 0, 0, randomint( 500 ) ), var_17, var_16, var_2, var_1 );
        return;
    }

    level thread doplanestrike( var_0, var_13 + ( 0, 0, randomint( 500 ) ), var_14 + ( 0, 0, randomint( 500 ) ), var_17, var_16, var_2 );
    wait(randomfloatrange( 1.5, 2.5 ));
    level thread doplanestrike( var_0, var_13 + ( 0, 0, randomint( 200 ) ), var_14 + ( 0, 0, randomint( 200 ) ), var_17, var_16, var_2 );
    wait(randomfloatrange( 0.3, 1 ));
    level thread doplanestrike( var_0, var_13 + ( 0, 0, randomint( 200 ) ), var_14 + ( 0, 0, randomint( 200 ) ), var_17, var_16, var_2 );
    wait(randomfloatrange( 1.5, 2.5 ));
    level thread doplanestrike( var_0, var_13 + ( 0, 0, randomint( 200 ) ), var_14 + ( 0, 0, randomint( 200 ) ), var_17, var_16, var_2 );
    thread airstrike_completion_check();
}

airstrike_completion_check()
{
    wait 27;
    level.activeairstrikes--;

    if ( !level.activeairstrikes )
    {
        common_scripts\utility::_id_3831( "airstrike_in_progress" );
        _id_A536::_id_992E();
    }
}

doplanestrike( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = 100;
    var_8 = 150;
    var_9 = var_1 + ( ( randomfloat( 2 ) - 1 ) * var_7, ( randomfloat( 2 ) - 1 ) * var_7, 0 );
    var_10 = var_2 + ( ( randomfloat( 2 ) - 1 ) * var_8, ( randomfloat( 2 ) - 1 ) * var_8, 0 );
    var_11 = spawn( "script_model", var_9 );
    var_11 setmodel( "vehicle_av8b_harrier_jet" );
    var_11.angles = var_5;
    var_11 thread _id_6A38();
    var_11 moveto( var_10, var_4, 0, 0 );
    thread callstrike_planesound( var_11, var_0 );
    thread callstrike_bombeffect( var_11, var_3 - 1.0, var_6 );
    wait(var_4);
    var_11 notify( "delete" );
    var_11 delete();
}

_id_6A38()
{
    self endon( "death" );

    if ( !isdefined( level.mapcenter ) )
        var_0 = ( 0, 0, 0 );
    else
        var_0 = level.mapcenter;

    while ( isdefined( self ) )
    {
        if ( distance( self.origin, var_0 ) <= 8000 )
        {
            playfxontag( level.fx_airstrike_contrail, self, "tag_right_wingtip" );
            playfxontag( level.fx_airstrike_contrail_02, self, "tag_left_wingtip" );
            return;
        }

        wait 0.05;
    }
}

callstrike_planesound( var_0, var_1 )
{
    level.playercardbackground endon( "death" );

    while ( !_id_91D1( var_0, level.playercardbackground.origin ) )
        wait 0.05;

    var_0 _id_A5A4::_id_69C4( "veh_mig29_passby" );
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) );
    var_3 = vectornormalize( common_scripts\utility::_id_38C9( var_1 ) - var_0.origin );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_91D1( var_0, var_1 )
{
    var_2 = _id_91D2( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = common_scripts\utility::_id_38C9( var_0.origin );
    var_5 = var_4 + _id_A5A4::vector_multiply( anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) ), var_3 * 100000 );
    var_6 = pointonsegmentnearesttopoint( var_4, var_5, var_1 );
    var_7 = distance( var_4, var_6 );

    if ( var_7 < 10500 )
        return 1;
    else
        return 0;
}

callstrike_bombeffect( var_0, var_1, var_2 )
{
    wait(var_1);

    if ( !isdefined( var_2 ) )
    {
        var_3 = spawnbomb( var_0.origin, var_0.angles );
        var_3 movegravity( _id_A5A4::vector_multiply( anglestoforward( var_0.angles ), 4666.67 ), 3.0 );
        wait 1.0;
        var_4 = spawn( "script_model", var_3.origin );
        var_4 setmodel( "tag_origin" );
        var_4.origin = var_3.origin;
        var_4.angles = var_3.angles;
        wait 0.05;
        var_3 delete();
        var_3 = var_4;
        var_5 = var_3.origin;
        var_6 = var_3.angles;
        playfxontag( level._id_099B, var_3, "tag_origin" );
        wait 1.6;
        var_7 = 12;
        var_8 = 5;
        var_9 = 55;
        var_10 = ( var_9 - var_8 ) / var_7;

        for ( var_11 = 0; var_11 < var_7; var_11++ )
        {
            var_12 = anglestoforward( var_6 + ( var_9 - var_10 * var_11, randomint( 10 ) - 5, 0 ) );
            var_13 = var_5 + _id_A5A4::vector_multiply( var_12, 10000 );
            var_14 = bullettrace( var_5, var_13, 0, undefined );
            var_15 = var_14["position"];
            radiusdamage( var_15 + ( 0, 0, 16 ), 512, 400, 30, level.airstriker );

            if ( var_11 % 3 == 0 )
            {
                thread _id_6DDC( "h1_ks_airstrike_exp", var_15 );
                playrumbleonposition( "artillery_rumble", var_15 );
                earthquake( 0.7, 0.75, var_15, 1000 );
            }

            wait(0.75 / var_7);
        }

        wait 1.0;
        var_3 delete();
    }
}

_id_6DDC( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0, 0, 1 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_3.origin = var_1;

    if ( isdefined( var_2 ) && var_2 )
        var_3 playsoundasmaster( var_0 );
    else
        var_3 playsound( var_0 );

    wait 10.0;
    var_3 delete();
}

spawnbomb( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "projectile_cbu97_clusterbomb" );
    return var_2;
}

friendly_player_tracking_nav()
{
    self endon( "death" );
    level endon( "lz_reached" );
    level endon( "player_made_it" );
    self.goalradius = 1400;
    self.fixednode = 0;
    self._id_9097 = 2000;
    self.coversearchinterval = 6000;
    var_0 = getent( "player_in_blackhawk_detector", "targetname" );
    var_1 = getnode( "bait_crashsite", "targetname" );

    for (;;)
    {
        wait(randomfloatrange( 3, 5 ));

        if ( level.playercardbackground istouching( var_0 ) )
        {
            self _meth_81a9( var_1 );
            continue;
        }

        self _meth_81aa( level.playercardbackground.origin );
    }
}

aipopcount()
{
    var_0 = getaiarray( "allies" );
    var_1 = getaiarray( "axis" );
    var_2 = var_0.size + var_1.size;
    return var_2;
}

say_kaboom( var_0 )
{
    _id_A5A4::_id_70BD( "kaboom" );
}

do_kaboom( var_0 )
{
    common_scripts\utility::_id_383F( "southern_hill_killzone_detonate" );
    wait 0.5;

    if ( !common_scripts\utility::_id_382E( "southern_hill_action_started" ) )
        common_scripts\utility::_id_383F( "southern_hill_action_started" );
}

toggle_detonator( var_0, var_1 )
{
    if ( var_1 )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 setmodel( "ctl_weapon_c4_detonator_animated" );
        wait 0.1;
        var_2 hide();
        var_2.origin = var_0 gettagorigin( "tag_inhand" );
        var_2.angles = var_0 gettagangles( "tag_inhand" );
        var_2 linkto( var_0, "tag_inhand" );
        var_2 show();
        var_0.detonatorobject = var_2;
    }
    else
    {
        var_0.detonatorobject hide();
        var_0.detonatorobject delete();
        var_0.detonatorobject = undefined;
    }
}

village_defend_wibble_think()
{
    thread maps\_wibble::setup_wibble_triggers( 1, "rescue_chopper_ingress", "interior", 0, 0 );
}