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

dead_script()
{
    common_scripts\_ca_blockout::init();
    level.jumpto = "";
    maps\cargoship_precache::main();
    maps\createfx\cargoship_fx::main();
    maps\createfx\cargoship_sound::main();
    maps\createfx\cargoship_audio::main();
    maps\_load::main();
    maps\cargoship_anim::main();
    level thread maps\cargoship_amb::main();
    maps\cargoship_lighting::main();
    fastrope_start();
}

fastrope_start()
{
    var_0 = getnode( "seat1", "targetname" );
    level.playercardbackground setorigin( var_0.origin );
    level.playercardbackground setplayerangles( var_0.angles );
}

hacks_for_e3_gameplay_video()
{
    if ( getdvarint( "e3_cargoship_gameplay_video", 0 ) == 0 )
        return;

    setsaveddvar( "g_friendlyNameDist", 0 );

    if ( level.playercardbackground _meth_8212( "subtitles" ) != 0 )
        return;
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.fogvalue["near"] = 100;
    level.fogvalue["half"] = 15000;
    level.fogvalue["r"] = 0.0;
    level.fogvalue["g"] = 0.0;
    level.fogvalue["b"] = 0.0;
    level.fogvalue["near"] = 100;
    level.fogvalue["half"] = 4000;
    maps\_utility::_id_079C( "bridge", ::misc_dummy, &"STARTS_BRIDGE" );
    maps\_utility::_id_079C( "deck", ::misc_dummy, &"STARTS_DECK" );
    maps\_utility::_id_079C( "hallways", ::misc_dummy, &"STARTS_HALLWAYS" );
    maps\_utility::_id_079C( "cargohold", ::misc_dummy, &"STARTS_CARGOHOLD" );
    maps\_utility::_id_079C( "cargohold2", ::misc_dummy, &"STARTS_CARGOHOLD2" );
    maps\_utility::_id_079C( "laststand", ::misc_dummy, &"STARTS_LASTSTAND" );
    maps\_utility::_id_079C( "package", ::misc_dummy, &"STARTS_PACKAGE" );
    maps\_utility::_id_079C( "escape", ::misc_dummy, &"STARTS_ESCAPE" );
    maps\_utility::_id_079C( "end", ::misc_dummy, &"STARTS_END" );
    setsaveddvar( "compassmaxrange", 1500 );
    level.missionfailedquote = [];
    level.missionfailedquote["slow"] = &"CARGOSHIP_YOU_WERENT_FAST_ENOUGH";
    level.missionfailedquote["wrongway"] = &"CARGOSHIP_YOU_WENT_THE_WRONG_WAY";
    level.missionfailedquote["jump1"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_FIRST";
    level.missionfailedquote["jump2"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_SECOND";
    level.missionfailedquote["jump3"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_THIRD";
    level.missionfailedquote["jump"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_JUMP";
    level.missionfailedquote["escape"] = level.missionfailedquote["slow"];

    if ( getdvar( "limited_mode" ) == "1" )
        setdvar( "ui_deadquote", "" );

    level.maskiscracked = 0;
    setdvarifuninitialized( "showGasMaskCracks", "1" );
    var_0 = getarraykeys( level.missionfailedquote );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachestring( level.missionfailedquote[var_0[var_1]] );

    precachestring( &"CARGOSHIP_INFINITY_WARD_PRESENTS" );
    level._id_8C36 = "default";
    maps\cargoship_code::jumptoinit();
    vehicle_scripts\_seaknight::main( "vehicle_ch46e_opened_door_interior_a", "seaknight", "script_vehicle_seaknight" );
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk_hero_sas_night", undefined, "script_vehicle_blackhawk" );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_ak74u_clip";
    level.maskcracksfx = undefined;
    maps\cargoship_precache::main();
    maps\cargoship_fx::main();
    maps\createfx\cargoship_audio::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    thread misc_pipe_fx_maximum();
    var_2 = getent( "sea", "targetname" );
    var_3 = getentarray( "sink_waterlevel", "targetname" );

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        var_2 hide();

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
            var_3[var_1] hide();
    }

    maps\createart\cargoship_art::main();
    maps\createfx\cargoship_fx::main();
    maps\createfx\cargoship_sound::main();
    maps\_load::main();
    initflags();
    maps\cargoship_anim::main();
    maps\cargoship_aud::main();
    maps\cargoship_lighting::main();
    maps\_compass::setupminimap( "compass_map_cargoship" );
    maps\mo_globals::main( "cargoship" );
    maps\cargoship_code::water_stuff_for_art1();
    maps\_sea::main();
    maps\mo_fastrope::main();
    level thread maps\cargoship_amb::main();
    hacks_for_e3_gameplay_video();
    thread boxes_in_the_wind();
    var_4 = getentarray( "fryingpanfall", "targetname" );
    common_scripts\utility::_id_0D13( var_4, ::frying_pan_fall );
    common_scripts\utility::_id_0D13( getentarray( "stairs", "targetname" ), maps\cargoship_code::start_blend );
    common_scripts\utility::_id_0D13( getentarray( "computer_des", "targetname" ), ::computer_destructible );
    thread maps\_wibble::setup_wibble_triggers( 0, "at_bridge", "exterior", 1, 1 );
    maps\_utility::_id_7DF3();
    misc_precacheinit();
    misc_setup();
    maps\_hud_util::_id_23CB();
    thread initial_setup();
    thread objective_main();
    thread maps\cargoship_code::jumptothink();
    thread maps\cargoship_code::deck_light_shadow_hack();
    thread desert_storm_init();
    thread maps\cargoship_code::water_stuff_for_art2( 2 );

    switch ( level.jumptosection )
    {
        case "bridge":
            bridge_main();
        case "deck":
            deck_main();
        case "hallways":
            hallways_main();
        case "cargohold":
            cargohold_main();
        case "cargohold2":
            thread cargohold2_main();
        case "laststand":
            laststand_main();
        case "package":
            package_main();
        case "escape":
            escape_main();
    }
}

cargoship_disablealliesreload()
{
    level.heroes3["alavi"]._id_615B = 1;
    level.heroes3["price"]._id_615B = 1;
    level.heroes3["grigsby"]._id_615B = 1;
}

cargoship_enablealliesreload()
{
    level.heroes3["alavi"]._id_615B = undefined;
    level.heroes3["price"]._id_615B = undefined;
    level.heroes3["grigsby"]._id_615B = undefined;
}

cargoship_heroes5_disablepain()
{
    level.heroes5["alavi"].a._id_2B20 = 1;
    level.heroes5["alavi"].allowpain = 0;
    level.heroes5["alavi"] _meth_8565( 1 );
    level.heroes5["alavi"].index = 1;
    level.heroes5["price"].a._id_2B20 = 1;
    level.heroes5["price"].allowpain = 0;
    level.heroes5["price"] _meth_8565( 1 );
    level.heroes5["price"].index = 1;
    level.heroes5["grigsby"].a._id_2B20 = 1;
    level.heroes5["grigsby"].allowpain = 0;
    level.heroes5["grigsby"] _meth_8565( 1 );
    level.heroes5["grigsby"].index = 1;
    level.heroes5["seat5"].a._id_2B20 = 1;
    level.heroes5["seat5"].allowpain = 0;
    level.heroes5["seat5"] _meth_8565( 1 );
    level.heroes5["seat5"].index = 1;
    level.heroes5["seat6"].a._id_2B20 = 1;
    level.heroes5["seat6"].allowpain = 0;
    level.heroes5["seat6"] _meth_8565( 1 );
    level.heroes5["seat6"].index = 1;
}

cargoship_heroes5_enablepain()
{
    level.heroes5["alavi"].a._id_2B20 = 0;
    level.heroes5["alavi"].allowpain = 1;
    level.heroes5["alavi"] _meth_8565( 0 );
    level.heroes5["alavi"].index = 0;
    level.heroes5["price"].a._id_2B20 = 0;
    level.heroes5["price"].allowpain = 1;
    level.heroes5["price"] _meth_8565( 0 );
    level.heroes5["price"].index = 0;
    level.heroes5["grigsby"].a._id_2B20 = 0;
    level.heroes5["grigsby"].allowpain = 1;
    level.heroes5["grigsby"] _meth_8565( 0 );
    level.heroes5["grigsby"].index = 0;
    level.heroes5["seat5"].a._id_2B20 = 0;
    level.heroes5["seat5"].allowpain = 1;
    level.heroes5["seat5"] _meth_8565( 0 );
    level.heroes5["seat5"].index = 0;
    level.heroes5["seat6"].a._id_2B20 = 0;
    level.heroes5["seat6"].allowpain = 1;
    level.heroes5["seat6"] _meth_8565( 0 );
    level.heroes5["seat6"].index = 0;
}

filterzone()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isalive( var_0 ) && isdefined( self ) && var_0 istouching( self ) )
        {
            soundscripts\_audio_zone_manager::_id_122C( 1 );
            soundscripts\_snd_filters::_id_86DB( "deck_rain_filter", 0.5 );
            soundscripts\_audio_mix_manager::_id_5CF2( "mix_deck_rain", 0.5 );
        }

        while ( isalive( var_0 ) && isdefined( self ) && var_0 istouching( self ) )
            wait 0.25;

        soundscripts\_snd_filters::_id_86DC( 2 );
        soundscripts\_audio_zone_manager::_id_122C( 0 );
        soundscripts\_audio_mix_manager::_id_5CF6( "mix_deck_rain", 0.5 );
    }
}

initflags()
{
    common_scripts\utility::_id_383D( "at_bridge" );
    common_scripts\utility::_id_383D( "bridge_landing" );
    common_scripts\utility::_id_383D( "bridgefight" );
    common_scripts\utility::_id_383D( "sweet_dreams" );
    common_scripts\utility::_id_383D( "quarters" );
    common_scripts\utility::_id_383D( "quarters_drunk_spawned" );
    common_scripts\utility::_id_383D( "quarters_drunk_ready" );
    common_scripts\utility::_id_383D( "price_at_top_of_stairs" );
    common_scripts\utility::_id_383D( "quarters_price_says_clear" );
    common_scripts\utility::_id_383D( "quarters_sleepers_dead" );
    common_scripts\utility::_id_383D( "deck_heli" );
    common_scripts\utility::_id_383D( "walk_deck" );
    common_scripts\utility::_id_383D( "deck_enemies_spawned" );
    common_scripts\utility::_id_383D( "deck_windows" );
    common_scripts\utility::_id_383D( "windows_got_company_line_before" );
    common_scripts\utility::_id_383D( "windows_got_company_line" );
    common_scripts\utility::_id_383D( "heli_shoot_deck_windows" );
    common_scripts\utility::_id_383D( "hallways" );
    common_scripts\utility::_id_383D( "hallways_lower_runners1" );
    common_scripts\utility::_id_383D( "hallways_lower_runners2" );
    common_scripts\utility::_id_383D( "hallways_lowerhall_guys" );
    common_scripts\utility::_id_383D( "hallways_moveup" );
    common_scripts\utility::_id_383D( "cargoholds_1_enter_clear" );
    common_scripts\utility::_id_383D( "pulp_fiction_guy" );
    common_scripts\utility::_id_383D( "cargoholds2" );
    common_scripts\utility::_id_383D( "cargoholds2_breach" );
    common_scripts\utility::_id_383D( "cargohold2_enemies" );
    common_scripts\utility::_id_383D( "cargohold2_enemies2" );
    common_scripts\utility::_id_383D( "cargohold2_enemies_dead" );
    common_scripts\utility::_id_383D( "laststand" );
    common_scripts\utility::_id_383D( "laststand_3left" );
    common_scripts\utility::_id_383D( "package" );
    common_scripts\utility::_id_383D( "package_enter" );
    common_scripts\utility::_id_383D( "package_report" );
    common_scripts\utility::_id_383D( "package_reading" );
    common_scripts\utility::_id_383D( "found_package" );
    common_scripts\utility::_id_383D( "package_orders" );
    common_scripts\utility::_id_383D( "package_secure" );
    common_scripts\utility::_id_383D( "package_open_doors" );
    common_scripts\utility::_id_383D( "strong_reading" );
    common_scripts\utility::_id_383D( "escape" );
    common_scripts\utility::_id_383D( "escape_cargohold2_fx" );
    common_scripts\utility::_id_383D( "start_sinking_boat" );
    common_scripts\utility::_id_383D( "escape_explosion" );
    common_scripts\utility::_id_383D( "escape_get_to_catwalks" );
    common_scripts\utility::_id_383D( "escape_get_to_catwalks_gaz_alavi" );
    common_scripts\utility::_id_383D( "escape_get_to_catwalks_price" );
    common_scripts\utility::_id_383D( "escape_death_cargohold2" );
    common_scripts\utility::_id_383D( "escape_death_cargohold1" );
    common_scripts\utility::_id_383D( "escape_death_hallways_lower" );
    common_scripts\utility::_id_383D( "escape_death_hallways_upper" );
    common_scripts\utility::_id_383D( "escape_death_deck" );
    common_scripts\utility::_id_383D( "escape_player_rescue" );
    common_scripts\utility::_id_383D( "escape_seaknight_ready" );
    common_scripts\utility::_id_383D( "cargoship_end_music" );
    common_scripts\utility::_id_383D( "end_start_player_anim" );
    common_scripts\utility::_id_383D( "end_linked_player_to_rig" );
    common_scripts\utility::_id_383D( "end_seaknight_leaving" );
    common_scripts\utility::_id_383D( "end_price_rescue_anim" );
    common_scripts\utility::_id_383D( "end_no_jump" );
    common_scripts\utility::_id_383D( "end_finished" );
    common_scripts\utility::_id_383D( "end_screen_done" );
    common_scripts\utility::_id_383D( "gotcha" );
    common_scripts\utility::_id_383D( "player_rescued" );
    common_scripts\utility::_id_383D( "nothing" );
    common_scripts\utility::_id_383D( "topside_fx" );
    common_scripts\utility::_id_383F( "topside_fx" );
    common_scripts\utility::_id_383D( "cargohold_fx" );
    common_scripts\utility::_id_383D( "heroes_ready" );
    common_scripts\utility::_id_383D( "nade_hint" );
    common_scripts\utility::_id_383D( "crouch_hint" );
    common_scripts\utility::_id_383D( "stand_hint" );
    common_scripts\utility::_id_383D( "music_tension_notime" );
    common_scripts\utility::_id_383D( "shellshock_blinking" );
    common_scripts\utility::_id_383D( "shellshock_blur" );
    common_scripts\utility::_id_383D( "heli_light_on" );
    common_scripts\utility::_id_383D( "heli_light_triggers" );
    common_scripts\utility::_id_383D( "heli_light_optimize" );
    common_scripts\utility::_id_383D( "price_package_ready" );
    common_scripts\utility::_id_383D( "radiomessage_notime" );
    common_scripts\utility::_id_383D( "escape_exterior_visionset" );
    common_scripts\utility::_id_383D( "escape_alavi_start_rescue" );
    common_scripts\utility::_id_383D( "escape_gaz_start_rescue" );
    common_scripts\utility::_id_383D( "escape_price_start_rescue" );
    common_scripts\utility::_id_383D( "escape_alavi_loading" );
    common_scripts\utility::_id_383D( "final_sun_direction" );
    common_scripts\utility::_id_383D( "deck_light_shadow" );
}
#using_animtree("generic_human");

initial_setup()
{
    soundscripts\_snd::_id_870C( "aud_start_checkpoint" );
    var_0 = getentarray( "intro_spawners", "target" );
    var_1 = var_0[0].teambalanced;
    level._id_47A3 = level.fastrope_globals.helicopters[maps\mo_fastrope::fastrope_heliname( var_1 )];
    level._id_47A3.heightsea = 150;
    level._id_47A3 initial_setup_vehicle_override();
    level._id_47A3 maps\mo_fastrope::fastrope_ropeanimload( undefined, undefined, "right", %h1_cargoship_blackhawk_opening_fastrope_80ft );
    level._id_47A3 maps\mo_fastrope::fastrope_ropeanimload( %bh_rope_idle_le, %h1_cargoship_blackhawk_drop_fastrope_80ft, "left" );

    if ( level.jumpto != "start" )
    {
        level._id_47A3 maps\mo_fastrope::fastrope_override( 1, undefined, %cs_bh_1_idle_start, %cs_bh_1_drop );
        level._id_47A3 maps\mo_fastrope::fastrope_override( 2, undefined, %cs_bh_2_idle_start, %cs_bh_2_drop );
    }
    else
    {
        level._id_47A3 maps\mo_fastrope::fastrope_override( 1, %cargoship_opening_position1 );
        level._id_47A3 maps\mo_fastrope::fastrope_override( 2, %cargoship_opening_price );
    }

    level._id_47A3 maps\mo_fastrope::fastrope_override( 4, undefined, %bh_idle_start_guy2, %bh_4_drop );
    level._id_47A3 maps\mo_fastrope::fastrope_override( 5, undefined, undefined, %bh_5_drop );
    level._id_47A3 maps\mo_fastrope::fastrope_override( 6, undefined, %bh_idle_start_guy1, %bh_6_drop );
    level._id_47A3 maps\mo_fastrope::fastrope_override( 9, undefined, %bh_crew_idle_guy1 );
    level._id_47A3 maps\mo_fastrope::fastrope_override( 10, undefined, %bh_crew_idle_guy2 );
    var_2 = getentarray( "deck_rain_filter", "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::filterzone );
    var_3 = getent( "intro_spawners", "targetname" );
    var_3 notify( "trigger" );
    wait 0.1;
    level notify( "level heli ready" );
    level._id_47A3.motiontrackerenabled maps\cargoship_code::heli_minigun_attach( "left" );
    var_4 = spawn( "script_model", level._id_47A3.motiontrackerenabled gettagorigin( "body_animate_jnt" ) );
    var_4 setmodel( "vehicle_blackhawk_hero_sas_night_interior" );
    var_4.angles = level._id_47A3.motiontrackerenabled.angles;
    var_4 linkto( level._id_47A3.motiontrackerenabled, "body_animate_jnt" );
    var_4._id_0C72 = "blackhawk";
    var_4 maps\_anim::_id_7F29();
    var_4 thread maps\_anim::_id_0BE1( var_4, "interiorwires" );
    var_5 = getaiarray( "allies" );
    level.heroes7 = [];
    level.heroes5 = [];
    level.heroes3 = [];

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        switch ( var_5[var_6].seat_pos )
        {
            case 1:
                level.heroes7["alavi"] = var_5[var_6];
                continue;
            case 2:
                level.heroes7["price"] = var_5[var_6];
                continue;
            case 4:
                level.heroes7["grigsby"] = var_5[var_6];
                continue;
            case 9:
                level.heroes7["pilot"] = var_5[var_6];
                continue;
            case 10:
                level.heroes7["copilot"] = var_5[var_6];
                continue;
            case 5:
                level.heroes7["seat5"] = var_5[var_6];
                continue;
            case 6:
                level.heroes7["seat6"] = var_5[var_6];
                continue;
        }
    }

    level.heroes7["copilot"] maps\_utility::_id_4462();
    level.heroes7["copilot"] maps\_utility::_id_2A74();
    level.heroes7["pilot"] maps\_utility::_id_4462();
    level.heroes7["pilot"] maps\_utility::_id_2A74();
    level.heroes7["pilot"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes7["copilot"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes5["alavi"] = level.heroes7["alavi"];
    level.heroes5["price"] = level.heroes7["price"];
    level.heroes5["grigsby"] = level.heroes7["grigsby"];
    level.heroes5["seat5"] = level.heroes7["seat5"];
    level.heroes5["seat6"] = level.heroes7["seat6"];
    level.heroes3["alavi"] = level.heroes5["alavi"];
    level.heroes3["price"] = level.heroes5["price"];
    level.heroes3["grigsby"] = level.heroes5["grigsby"];
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "alavi" );
    createthreatbiasgroup( "grigsby" );
    createthreatbiasgroup( "seat5" );
    createthreatbiasgroup( "seat6" );
    createthreatbiasgroup( "player" );
    level.heroes5["price"].cgo_old_accuracy = level.heroes5["price"].accuracy;
    level.heroes5["price"].cgo_old_baseaccuracy = level.heroes5["price"]._id_1300;
    level.heroes5["price"].accuracy = 1000;
    level.heroes5["price"]._id_1300 = 1000;
    level.heroes5["price"].fixednode = 0;
    level.heroes5["price"].script_parentname = "price";
    level.heroes5["price"] setthreatbiasgroup( "price" );
    level.heroes5["price"].grenadeammo = 0;
    level.heroes5["price"].index = 1;
    level.heroes5["price"] maps\_utility::_id_7F71( 1 );
    level.price_normal_headmodel = level.heroes5["price"].headmodel;
    level.heroes5["alavi"].cgo_old_accuracy = level.heroes5["alavi"].accuracy;
    level.heroes5["alavi"].cgo_old_baseaccuracy = level.heroes5["alavi"]._id_1300;
    level.heroes5["alavi"].accuracy = 1000;
    level.heroes5["alavi"]._id_1300 = 1000;
    level.heroes5["alavi"].fixednode = 0;
    level.heroes5["alavi"].script_parentname = "alavi";
    level.heroes5["alavi"] setthreatbiasgroup( "alavi" );
    level.heroes5["alavi"].grenadeammo = 0;
    level.heroes5["alavi"].index = 1;
    level.heroes5["alavi"] maps\_utility::_id_7F71( 1 );
    level.heroes5["grigsby"].cgo_old_accuracy = level.heroes5["grigsby"].accuracy;
    level.heroes5["grigsby"].cgo_old_baseaccuracy = level.heroes5["grigsby"]._id_1300;
    level.heroes5["grigsby"].accuracy = 1000;
    level.heroes5["grigsby"]._id_1300 = 1000;
    level.heroes5["grigsby"].fixednode = 0;
    level.heroes5["grigsby"].script_parentname = "grigsby";
    level.heroes5["grigsby"] setthreatbiasgroup( "grigsby" );
    level.heroes5["grigsby"].grenadeammo = 0;
    level.heroes5["grigsby"].index = 1;
    level.heroes5["grigsby"] maps\_utility::_id_7F71( 1 );
    level.heroes5["seat5"].accuracy = 1000;
    level.heroes5["seat5"]._id_1300 = 1000;
    level.heroes5["seat5"].fixednode = 0;
    level.heroes5["seat5"].script_parentname = "seat5";
    level.heroes5["seat5"] setthreatbiasgroup( "seat5" );
    level.heroes5["seat5"].grenadeammo = 0;
    level.heroes5["seat5"].index = 1;
    level.heroes5["seat5"] maps\_utility::_id_2A74();
    level.heroes5["seat5"] maps\_utility::_id_7F71( 1 );
    level.heroes5["seat5"].nearz = "Sgt. Wallcroft";
    level.heroes5["seat6"].accuracy = 1000;
    level.heroes5["seat6"]._id_1300 = 1000;
    level.heroes5["seat6"].fixednode = 0;
    level.heroes5["seat6"].script_parentname = "seat6";
    level.heroes5["seat6"] setthreatbiasgroup( "seat6" );
    level.heroes5["seat6"].grenadeammo = 0;
    level.heroes5["seat6"].index = 1;
    level.heroes5["seat6"] maps\_utility::_id_2A74();
    level.heroes5["seat6"] maps\_utility::_id_7F71( 1 );
    thread intro_movie_hack();
    level.playercardbackground.script_parentname = "player";
    level.playercardbackground setthreatbiasgroup( "player" );
    common_scripts\utility::_id_383F( "heroes_ready" );
}

intro_movie_hack()
{
    level.heroes5["seat6"].nearz = "";
    level waittill( "intro_movie_done" );
    level.heroes5["seat6"].nearz = "Pvt. Griffen";
}
#using_animtree("vehicles");

initial_setup_vehicle_override()
{
    var_0 = common_scripts\utility::_id_40FB( "intro_ride_node", "targetname" );
    maps\mo_fastrope::fastrope_override_vehicle( %bh_cargo_path, var_0 );
}

bridge_main()
{
    switch ( level.jumpto )
    {
        case "start":
            maps\_utility::_id_6008( "cargoship_intro_music" );
            thread common_scripts\utility::_id_69C2( "scn_cargoship_intro_helicopter", level.playercardbackground.origin );
            setsaveddvar( "ai_friendlyFireBlockDuration", 250 );
            thread bridge_intro();
            thread bridge_intro_thunder();
            thread bridge_heroes();
            thread bridge_heli_1();
            thread start_physical_dof();
        case "bridge":
            thread bridge_setup();
            thread bridge_heli_2();
            thread bridge_standoff();
        case "quarters":
            quarters_prepare_door_for_breach();
            common_scripts\utility::_id_384A( "quarters" );
            common_scripts\utility::_id_383F( "_sea_waves" );
            thread quarters_sleeping();
            thread quarters_dialogue();
            thread quarters_player_speed();
            quarters();
    }
}

bridge_intro_thunder()
{
    thread maps\cargoship_fx::notifyname();
    wait 5;
    thread maps\_weather::_id_5741( maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait 10;
    thread maps\_weather::_id_5741( maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait 4;
    maps\_weather::_id_5741( maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait 1;
    maps\_weather::_id_5741( maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait 0.5;
    maps\_weather::_id_5741( maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
}

bridge_intro()
{
    thread intro_heli_rain_fx();
    common_scripts\utility::_id_383F( "cargoship_ocean_scenario_start" );
    level._sea_scale = 2;
    wait 10;
    wait 12;
    level._sea_scale = 1.5;
    wait 4;
    common_scripts\utility::_id_3831( "_sea_bob" );
    wait 12;
    common_scripts\utility::_id_383F( "_sea_viewbob" );
    common_scripts\utility::_id_383F( "_sea_bob" );
}

intro_heli_rain_fx()
{
    common_scripts\utility::_id_384A( "heroes_ready" );
    var_0 = level._id_47A3.motiontrackerenabled;
    var_0 maps\mo_fastrope::fastrope_heli_playinteriorlightgreenfx( 1 );
    common_scripts\utility::_id_384A( "topside_fx" );
    wait 1;
    common_scripts\utility::_id_3831( "player_weather_enabled" );
    playfxontag( level._effect["rain_heavy_mist_heli_hack"], var_0, "tag_deathfx" );
    common_scripts\utility::_id_384A( "player_weather_enabled" );
    stopfxontag( level._effect["rain_heavy_mist_heli_hack"], var_0, "tag_deathfx" );
}

start_global_rain()
{
    wait 3.6;
    common_scripts\utility::_id_383F( "player_weather_enabled" );
}

bridge_setup()
{
    var_0 = [];
    var_0[var_0.size] = getent( "stair_bottom_save", "script_noteworthy" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "bridge_flags", "script_noteworthy" ) );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CC );
    level waittill( "level heli ready" );
    thread maps\_utility::_id_1332();
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].spawntime.nounload ) && var_1[var_2].spawntime.nounload == 1 )
            continue;

        var_3 = getnode( "seat" + var_1[var_2].seat_pos, "targetname" );
        var_1[var_2] _meth_81a9( var_3 );
        var_1[var_2].goalradius = 32;
        var_1[var_2].index = 1;
        var_1[var_2].swimmer = 0;
    }

    level._id_47A3._id_9C7E waittill( "reached_wait_node" );
    common_scripts\utility::_id_383F( "at_bridge" );
    thread maps\cargoship_fx::flash( 2, 4, 2, 3, ( -25, -160, 0 ) );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_distant" );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_strike" );
    wait 4.5;
    thread maps\cargoship_fx::flash( 3, 4, 2, 3, ( -25, -110, 0 ) );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_distant" );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_strike" );
}

bridge_heli_1()
{
    level waittill( "level heli ready" );
    var_0 = spawn( "script_model", level._id_47A3.motiontrackerenabled gettagorigin( "main_rotor_jnt" ) );
    var_0 setmodel( level._id_47A3.modelname );
    var_0.angles = level._id_47A3.motiontrackerenabled.angles;
    var_0 linkto( level._id_47A3.motiontrackerenabled );
    var_0 hide();
    var_0 setcontents( 0 );
    var_0 thread maps\mo_fastrope::fastrope_heli_playexteriorlightfx();
    var_0 maps\mo_fastrope::fastrope_heli_playinteriorlightfx();
    level waittill( "going_dark" );
    wait 0.5;
    var_0 delete();
    wait 1.5;
    level._id_47A3._id_9C7E waittill( "reached_wait_node" );
    wait 5;
}

bridge_heli_2()
{
    level waittill( "level heli ready" );

    if ( level.jumpto == "start" )
    {
        wait 29;
        level._id_47A3._id_9C7E notify( "fake_wait_node" );
        maps\_utility::_id_27EF( 7.8, soundscripts\_snd::_id_870C, "aud_stop_intro_mix" );
    }

    level._id_47A3.motiontrackerenabled thread maps\mo_fastrope::fastrope_heli_playexteriorlightfx();
    level._id_47A3.motiontrackerenabled thread maps\mo_fastrope::fastrope_heli_playinteriorlightfx2();
    thread start_global_rain();

    if ( level.jumpto == "start" )
        level._id_47A3 maps\mo_fastrope::fastrope_heli_overtake();
    else
        level waittill( "bridge_jumpto_done" );

    thread bridge_heli_3();
    common_scripts\utility::_id_383F( "cargoship_rain_on" );
    common_scripts\utility::_id_383F( "cargoship_ocean_scenario_end" );
    wait 4;
    level._id_47A3.motiontrackerenabled maps\cargoship_code::heli_searchlight_on();
    var_0 = spawn( "script_origin", ( 3184, 152, 364 ) );
    var_0.teambalanced = "bridge_fake_spottarget";
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "targetname", "bridge_fake_spottarget" );
    wait 1;
    var_0 moveto( ( 2896, -232, 364 ), 4, 1, 1 );
    thread maps\cargoship_code::heli_searchlight_bridge();
}

bridge_heli_3()
{
    level endon( "price_wait_at_stairs" );
    level._id_47A3._id_9C7E sethoverparams( 32, 10, 3 );
    level._id_47A3._id_9C7E clearlookatent();
    var_0 = common_scripts\utility::_id_40FB( "heli_bridge_node", "targetname" );
    level._id_47A3._id_9C7E vehicle_setspeed( 15, 10, 10 );
    level._id_47A3._id_9C7E setlookatent( level.heroes5["price"] );
    maps\cargoship_code::heli_flypath( var_0 );
}

grigs_clip_handoff( var_0 )
{
    self attach( "weapon_mp5_clip", "tag_inhand" );
    self waittillmatch( "single anim", "clip delete" );
    self detach( "weapon_mp5_clip", "tag_inhand" );
    var_0 attach( "weapon_mp5_clip", "tag_inhand" );
    wait 2;
    var_0 detach( "weapon_mp5_clip", "tag_inhand" );
}

bridge_heroes()
{
    common_scripts\utility::_id_384A( "heroes_ready" );
    var_0 = spawn( "script_model", level.heroes5["price"] gettagorigin( "tag_inhand" ) );
    var_0.angles = level.heroes5["price"] gettagangles( "tag_inhand" );
    var_0 linkto( level.heroes5["price"], "tag_inhand" );
    var_0 setmodel( "prop_price_cigar" );
    playfxontag( level._effect["cigar_glow"], var_0, "tag_cigarglow", level._id_47A3._id_9C7E );
    playfxontag( level._effect["cigarsmoke_wind_vf"], level._id_47A3.motiontrackerenabled, "tag_deathfx" );
    level.heroes5["price"] thread maps\cargoship_code::pricecigarpufffx( var_0 );
    level.heroes5["price"] thread maps\cargoship_code::pricecigarexhalefx( var_0 );
    thread maps\cargoship_code::cigar_embers_burst( var_0 );
    var_0 thread maps\cargoship_code::pricecigardelete();
    level.heroes5["grigsby"] thread grigs_clip_handoff( level.heroes7["seat6"] );
    wait 1;
    maps\_utility::_id_27EF( 1, maps\cargoship_code::orient_cameraviewangles_helicopterstart );
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_baseplatehammertwo" );
    maps\mo_tools::radio_msg_stack( "cargoship_hqr_copytwofour" );
    wait 5;
    level notify( "going_dark" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_thirtysecdark" );
    wait 8;
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_tensecondsradio" );
    wait 1;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp1_radiocheck" );
    wait 1;
    maps\_utility::_id_1143( "fastrope" );
    thread maps\cargoship_code::playermaskputon();
    wait 1;
    maps\_utility::_id_27EF( 1.4, maps\cargoship_lighting::apply_lighting_pass_cargoship, "cargoship_exterior_helitrans_vision", 2 );
    level.heroes5["price"] maps\_utility::_id_27EF( 1.5, ::_id_7F88, "head_sas_ct_assault_price_mask_down_nobeard" );
    maps\_utility::_id_27EF( 9.5, maps\cargoship_lighting::apply_lighting_pass_cargoship, "cargoship_exterior", 0 );
    wait 1.7;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_crewexpend" );
    level._id_47A3._id_9C7E waittill( "reached_wait_node" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp1_greenlightgoradio" );
    wait 4.5;
    soundscripts\_snd::_id_870C( "aud_get_out_blackhawk" );
}

bridge_standoff()
{
    var_0 = getent( "bridge_standoff_guys", "target" );
    var_1 = getent( "start_bridge_standoff", "targetname" );
    var_2 = getent( "bridge_damage_trig", "targetname" );
    var_2 thread bridge_standoff_damage();
    common_scripts\utility::_id_0D13( getentarray( "bridge_standoff_guys", "targetname" ), maps\_utility::_id_0798, ::bridge_standoff_behavior );
    level._id_31CA = [];
    var_0 notify( "trigger" );
    var_1 waittill( "trigger" );
    level.heroes5["price"].disableplayeradsloscheck = 1;
    level.heroes5["price"].grenadeawareness = 0;
    common_scripts\utility::_id_383F( "bridge_landing" );
    setsaveddvar( "sm_sunSampleSizeNear", ".25" );
    wait 0.1;
    thread maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.playercardbackground, "cargoship_gm1_bridgesecure" );
    var_2 maps\_utility::_id_9FC8( 0.75 );
    maps\_utility::_id_27EF( 1.25, maps\mo_tools::radio_msg_stack, "cargoship_pri_weaponsfree" );
    level._id_31CA["bridge_capt"] notify( "bridge_react" );
    wait 0.5;
    level._id_31CA["bridge_clipboard"] notify( "bridge_react" );
    wait 0.25;
    wait 0.85;
    level._id_31CA["bridge_tv"] notify( "bridge_react" );
    wait 0.45;
    level._id_31CA["bridge_stand1"] notify( "bridge_react" );
    common_scripts\utility::_id_0D13( getentarray( "bridge_standoff_paperstacks", "targetname" ), ::bridge_standoff_paperstacks_damage );
    level waittill( "ai_clear_dialog_done" );
    level.heroes5["price"].disableplayeradsloscheck = 0;
    level.heroes5["price"].grenadeawareness = 1;
    common_scripts\utility::_id_383F( "quarters" );
}

bridge_standoff_paperstacks_damage()
{
    var_0 = ( 0, 0, 15 );
    var_1 = self.origin + var_0;
    var_2 = spawnfx( level._effect["destp_office_paper_stack_cgoshp"], var_1 );
    triggerfx( var_2 );
    wait 0.1;
    self delete();
}

bridge_standoff_damage()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            break;
    }

    common_scripts\utility::_id_383F( "bridgefight" );
}
#using_animtree("chair");

bridge_standoff_chair( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "com_restaurantchair_2" );
    var_1._id_0C72 = "chair";
    var_1 useanimtree( #animtree );
    var_0 thread maps\_anim::_id_0BE1( var_1, "start", undefined, "stoploop" );
    common_scripts\utility::_id_A087( "damage", "already_dying" );
    var_0 notify( "stoploop" );
    thread bridge_standoff_mug();
    var_0 maps\_anim::_id_0C24( var_1, "fall" );
    var_0 thread maps\_anim::_id_0BE1( var_1, "end" );
}

bridge_standoff_mug()
{
    wait 0.15;

    if ( !isdefined( self ) )
        return;

    playfx( level._effect["coffee_mug"], self gettagorigin( "tag_inhand" ) );
    self detach( "cs_coffeemug01", "tag_inhand" );
}

bridge_standoff_behavior()
{
    self.ignoreweaponintracksuitmode = 1;
    var_0 = getnode( self._not_team, "targetname" );
    self._id_0C72 = self.script_parentname;
    self._id_2652 = level._id_78AC[self._id_0C72]["death"];
    level._id_31CA[self.script_parentname] = self;
    self.grenadeammo = 0;
    var_1 = undefined;

    if ( self._id_0C72 == "bridge_stand1" )
        var_0 = getent( self._not_team, "targetname" );

    var_0 thread maps\_anim::_id_0BE1( self, "idle", undefined, "stoploop" );

    if ( self._id_0C72 == "bridge_capt" )
    {
        thread bridge_standoff_chair( var_0 );
        self attach( "cs_coffeemug01", "tag_inhand", 1 );
        _id_7F88( "head_spetsnaz_assault_vlad" );
    }

    thread maps\_utility::_id_4BB0( 1 );
    maps\_utility::_id_4462();
    thread bridge_standoff_behavior_earlydeath( var_0 );
    self endon( "death_by_player" );
    self waittill( "bridge_react" );
    var_2 = getanimlength( level._id_78AC[self._id_0C72]["react"] );
    var_3 = var_2 - 0.5;

    switch ( self._id_0C72 )
    {
        case "bridge_clipboard":
            var_0 thread maps\_utility::_id_61FD( "stoploop", 0.25 );
            var_0 maps\_utility::_id_27EF( 0.25, maps\_anim::_id_0C24, self, "react" );
            break;
        default:
            var_0 notify( "stoploop" );
            var_0 thread maps\_anim::_id_0C24( self, "react" );
            break;
    }

    switch ( self._id_0C72 )
    {
        case "bridge_capt":
            maps\_utility::_id_27EF( 1.5, maps\_utility::_id_69C4, "cargoship_rus_huh2" );
            break;
    }

    wait(var_3);
    level.heroes5["alavi"] maps\_utility::_id_08EB();

    switch ( self._id_0C72 )
    {
        case "bridge_capt":
            level.heroes5["alavi"] thread maps\cargoship_code::_id_33EF( self, 0.1, 6, 1 );
            wait 0.5;
            break;
        case "bridge_tv":
            level.heroes5["alavi"] thread maps\cargoship_code::_id_33EF( self, 0, 6, 1 );
            wait 0.5;
            break;
        case "bridge_stand1":
            wait 0.25;
            level.heroes5["price"] thread maps\cargoship_code::_id_33EF( self, 0.1, 6, 1 );
            level.heroes5["alavi"] maps\_utility::_id_27EF( 0.25, maps\cargoship_code::_id_33EF, self, 0, 6, 1 );
            wait 0.25;
            break;
        case "bridge_clipboard":
            level.heroes5["price"] thread maps\cargoship_code::_id_33EF( self, 0, 6, 1 );
            wait 0.75;
            break;
    }

    self notify( "already_dying" );
    self _meth_8143();
    self kill();
    thread common_scripts\utility::_id_69C2( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

bridge_standoff_behavior_earlydeath( var_0 )
{
    self endon( "already_dying" );
    self.helmet = 10000;

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    self.allowdeath = 1;
    self notify( "death_by_player" );
    self _meth_8143();
    self kill();
    thread common_scripts\utility::_id_69C2( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

quarters_sleeping()
{
    var_0 = getentarray( "sleeping_nodes", "targetname" );
    var_1 = getentarray( "quarters_sleepers", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2[var_3] = var_1[var_3] stalingradspawn();
        maps\_utility::_id_88F1( var_2[var_3] );
        var_2[var_3]._id_0C72 = "sleeper_" + var_3;
        var_2[var_3].ignoretriggers = 1;
        var_2[var_3].grenadeammo = 0;
        var_2[var_3].helmet = 1;
        var_2[var_3].maxturnspeed = 1;
        var_2[var_3].allowdeath = 1;
        var_2[var_3].script_parentname = "sleeper";
        var_0[var_3] thread maps\_anim::_id_0BE1( var_2[var_3], "sleep", undefined, "stop_sleeping" );
        var_2[var_3] thread quarters_sleeping_death( var_0[var_3] );
        var_2[var_3] thread quarters_sleeping_player();
        var_2[var_3].ignoreweaponintracksuitmode = 1;
    }

    if ( common_scripts\utility::_id_382E( "deck_drop" ) )
        return;

    level endon( "deck_drop" );
    maps\_utility::_id_A07E( var_2 );
    common_scripts\utility::_id_383F( "quarters_sleepers_dead" );
    common_scripts\utility::_id_383F( "deck" );

    if ( randomint( 100 ) > 50 )
        maps\_utility::_id_70BD( "cargoship_sas4_sweetdreams" );
    else
        maps\_utility::_id_70BD( "cargoship_sas4_sleeptight" );

    common_scripts\utility::_id_383F( "sweet_dreams" );
}

quarters_sleeping_player()
{
    level endon( "deck" );
    self endon( "death" );

    for (;;)
    {
        if ( self _meth_81c2( level.playercardbackground ) )
            break;

        wait 0.1;
    }

    wait 1;
    common_scripts\utility::_id_383F( "deck" );
}
#using_animtree("generic_human");

quarters_sleeping_death( var_0 )
{
    maps\_utility::_id_4462();
    thread maps\_utility::_id_4BB0( 1 );
    self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
    level notify( "sleeping_guys_wake" );
    self notify( "death", var_2, var_5 );
    thread common_scripts\utility::_id_69C2( "generic_pain_russian_" + randomintrange( 1, 8 ), self.origin );

    if ( isdefined( level.cheatstates ) && isdefined( level.cheatstates["sf_use_tire_explosion"] ) && level.cheatstates["sf_use_tire_explosion"] == 1 )
        return;

    waitframe;
    var_6 = spawn( "script_model", self.origin );
    var_6.angles = self.angles;
    var_6 setmodel( self.motiontrackerenabled );
    var_7 = self getattachsize();

    for ( var_8 = 0; var_8 < var_7; var_8++ )
    {
        var_9 = self getattachmodelname( var_8 );
        var_10 = self getattachtagname( var_8 );
        var_6 attach( var_9, var_10, 1 );
    }

    var_6._id_0C72 = self._id_0C72;
    var_6 useanimtree( #animtree );
    var_0 thread maps\_anim::_id_0C24( var_6, "death" );
    waitframe;

    if ( isdefined( self ) )
        self delete();
}

quarters_dialogue()
{
    wait 1;
    maps\_utility::_id_70BD( "cargoship_pri_holdyourfire" );
    maps\_utility::_id_70BD( "cargoship_grg_rogerthat" );
    maps\_vehicle::switch_vehicle_fx( "script_vehicle_blackhawk", "fx/treadfx/heli_dust_cargoship" );
}

quarters_heli()
{
    level endon( "deck" );
    level endon( "deck_heli" );
    common_scripts\utility::_id_384A( "price_wait_at_stairs" );
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "targetname", "heli_deck_spottarget" );
    var_0 = common_scripts\utility::_id_40FB( "heli_deck_landing_node", "targetname" );
    var_1 = var_0.angles[1];
    level._id_47A3._id_9C7E vehicle_setspeed( 20, 10, 10 );
    level._id_47A3._id_9C7E sethoverparams( 32, 10, 3 );
    level._id_47A3._id_9C7E clearlookatent();
    level._id_47A3._id_9C7E cleargoalyaw();
    var_0 = common_scripts\utility::_id_40FB( "heli_quarters_node", "targetname" );
    level._id_47A3._id_9C7E setgoalpos( var_0.origin, 1 );
    level._id_47A3._id_9C7E setgoalyaw( var_1 );
    level._id_47A3._id_9C7E settargetyaw( var_1 );

    while ( isdefined( var_0 ) )
    {
        var_2 = 0;

        if ( !isdefined( var_0._not_team ) )
            var_2 = 1;

        level._id_47A3._id_9C7E setgoalpos( var_0.origin + ( 0, 0, 150 ), var_2 );
        level._id_47A3._id_9C7E neargoalnotifydist( 150 );
        level._id_47A3._id_9C7E waittill( "near_goal" );

        if ( isdefined( var_0._not_team ) )
        {
            var_0 = common_scripts\utility::_id_40FB( var_0._not_team, "targetname" );
            continue;
        }

        var_0 = undefined;
    }

    common_scripts\utility::_id_383F( "deck_heli" );
}

quarters_redlightatstairs()
{
    var_0 = spawn( "script_model", ( 2811, -346, 299 ) );
    var_0 setmodel( "tag_origin" );
    var_0 hide();
    playfxontag( level._effect["aircraft_light_cockpit_red"], var_0, "tag_origin" );
    common_scripts\utility::_id_384A( "deck" );
    var_0 delete();
}

quarters_prepare_door_for_breach()
{
    level.bridge_door_anim = getent( "bridge_door", "targetname" );
    level.bridge_door_anim._id_0C72 = "bridge_door_anim";
    level.bridge_door_anim maps\_anim::_id_7F29();
    var_0 = common_scripts\utility::_id_40FB( "PriceBridgeDoorBreach", "targetname" );
    var_0 maps\_anim::_id_0BC7( level.bridge_door_anim, "bridge_breach" );
}

quarters()
{
    level.heroes5["alavi"] maps\_utility::_id_0933( 0 );
    thread quarters_heli();
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "bridge_flags", "script_noteworthy" ) );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CE );
    level.heroes5["price"] _meth_81a7( 1 );
    level.heroes5["price"]._id_0C72 = "price";
    level.heroes5["price"]._id_5F65 = 1.0816;
    level.heroes5["alavi"] _meth_81a7( 1 );
    level.heroes5["alavi"]._id_0C72 = "alavi";
    level.heroes5["alavi"]._id_5F65 = 1.0816;
    var_1 = common_scripts\utility::_id_40FB( "PriceBridgeDoorBreach", "targetname" );
    var_2 = [];
    var_2[var_2.size] = level.heroes5["price"];
    var_2[var_2.size] = level.heroes5["alavi"];
    var_2[var_2.size] = level.bridge_door_anim;
    var_3 = getent( level.bridge_door_anim._not_team, "targetname" );
    var_3 connectpaths();
    var_3 linkto( level.bridge_door_anim, "hinge_jnt", ( 0, 0, 0 ), ( 0, 90, 0 ) );
    var_1 maps\_anim::_id_0C18( var_2, "bridge_breach" );
    level.heroes5["price"]._id_0C78 = 1.0816;
    level.heroes5["alavi"]._id_0C78 = 1.0816;
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["alavi"] thread quarters_alavi();
    level.heroes5["price"] thread quarters_price();
    common_scripts\utility::_id_384A( "quarters_killem" );
    common_scripts\utility::_id_3831( "_sea_bob" );
    getent( "quarters_drunk", "targetname" ) quarters_drunk();
}

quarters_player_speed()
{
    common_scripts\utility::_id_384A( "quarters_start" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
    common_scripts\utility::_id_384A( "deck_drop" );
    thread maps\cargoship_code::player_speed_reset( 0.5 );
}

quarters_drunk()
{
    var_0 = self stalingradspawn();
    level.quartersdrunk = var_0;
    maps\_utility::_id_88F1( var_0 );
    var_0.ignoretriggers = 1;
    var_0.grenadeammo = 0;
    level.playercardbackground.ignoretriggers = 1;
    var_0 thread maps\_utility::_id_4BB0( 1 );
    var_0 maps\_utility::_id_4462();
    var_0.ignoreweaponintracksuitmode = 1;
    common_scripts\utility::_id_383F( "quarters_drunk_spawned" );
    var_0._id_0C72 = "drunk";
    var_0._id_2652 = level._id_78AC[var_0._id_0C72]["death"];
    var_0.helmet = 1;
    var_0.maxturnspeed = 1;
    var_0.allowdeath = 1;
    var_1 = getnode( self._not_team, "targetname" );
    var_2 = spawn( "script_model", var_0 gettagorigin( "tag_inhand" ) );
    var_2.angles = var_0 gettagangles( "tag_inhand" );
    var_2 linkto( var_0, "tag_inhand" );
    var_2 setmodel( "cs_vodkabottle01" );
    var_0 thread quarters_drunk_bottle( var_2 );
    var_0 thread quarters_drunk_earlydeath( var_1 );
    var_0 endon( "death_by_player" );
    var_0 _id_7F88( "head_spetsnaz_assault_geoff" );
    var_0 playsound( "cargoship_rud_3sec" );
    var_1 thread maps\_anim::_id_0C24( var_0, "walk" );
    var_0.spinetarget = spawn( "script_origin", var_0 gettagorigin( "j_spine4" ) );
    var_0.spinetarget linkto( var_0, "j_spine4" );
    cargoship_disablealliesreload();
    level.heroes3["price"] _meth_8565( 1 );
    level.heroes3["alavi"] _meth_8565( 1 );
    level.heroes3["price"] maps\_utility::_id_22CF( var_0.spinetarget );
    level.heroes3["alavi"] maps\_utility::_id_22CF( var_0.spinetarget );
    var_3 = getanimlength( level._id_78AC[var_0._id_0C72]["walk"] );
    wait 5;
    var_0.ignoretriggers = 0;
    common_scripts\utility::_id_383F( "quarters_drunk_ready" );
    wait 1.5;
    var_0 notify( "already_dying" );
    var_0 quarters_drunk_death( var_1 );
    cargoship_enablealliesreload();
    level.heroes3["price"] _meth_8565( 0 );
    level.heroes3["alavi"] _meth_8565( 0 );
}

quarters_drunk_bottle( var_0 )
{
    common_scripts\utility::_id_383D( "vodka_falling" );
    var_0 endon( "vodka_broken" );
    var_0 setcandamage( 1 );
    thread quarter_drunk_bottle_think( var_0 );
    thread quarters_drunk_bottle_falling( var_0 );
    self waittill( "damage", var_1, var_2 );

    if ( var_2 == level.playercardbackground )
        common_scripts\utility::_id_383F( "vodka_falling" );
    else
    {
        level notify( "drunk_guy_killed_by_ai" );
        quarter_drunk_bottle_brokefx( self gettagorigin( "tag_inhand" ), var_0 );
    }
}

quarter_drunk_bottle_think( var_0 )
{
    var_0 waittill( "damage", var_1 );
    var_0 notify( "vodka_broken" );
    quarter_drunk_bottle_brokefx( self gettagorigin( "tag_inhand" ), var_0 );
}

quarter_drunk_bottle_brokefx( var_0, var_1 )
{
    var_1 delete();
    var_2 = vectornormalize( level.playercardbackground.origin - self gettagorigin( "tag_inhand" ) );
    playfx( level._effect["vodka_bottle"], var_0, var_2 );
    common_scripts\utility::_id_69C2( "cgo_glass_bottle_break", var_0 );
}

quarters_drunk_bottle_falling( var_0 )
{
    level endon( "drunk_guy_killed_by_ai" );
    var_0 endon( "vodka_broken" );
    var_1 = ( 0, 0, 0 );

    while ( !common_scripts\utility::_id_382E( "vodka_falling" ) )
    {
        var_1 = self gettagorigin( "tag_inhand" );
        wait 0.2;
    }

    var_2 = 0;
    var_3 = ( 0, 0, 1 );
    var_4 = 0.5;
    var_0 unlink();
    var_5 = vectornormalize( self gettagorigin( "tag_inhand" ) - level.playercardbackground.origin );
    var_6 = var_1 - var_0.origin;
    var_6 *= var_4;
    var_7 = common_scripts\utility::_id_2F69( var_0.origin, 0 );
    var_7 = ( 0, 0, var_7[2] );

    for (;;)
    {
        var_8 = var_0.origin + var_6 - var_2 * var_3;

        if ( var_8[2] < var_7[2] )
        {
            var_8 = ( var_8[0], var_8[1], var_7[2] );
            var_0 moveto( var_8, 0.1 );
            wait 0.1;
            break;
        }

        var_0 moveto( var_8, 0.1 );
        var_2 += 3;
        wait 0.1;
    }

    quarter_drunk_bottle_brokefx( var_0.origin, var_0 );
}

quarters_drunk_earlydeath( var_0 )
{
    self endon( "already_dying" );
    self endon( "quarters_drunk_earlydeath2" );
    thread quarters_drunk_earlydeath2( var_0 );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    self notify( "quarters_drunk_earlydeath1" );
    quarters_drunk_earlydeath_proc( var_0 );
}

quarters_drunk_earlydeath2( var_0 )
{
    self endon( "already_dying" );
    self endon( "quarters_drunk_earlydeath1" );
    self waittill( "death", var_1 );

    if ( !isplayer( var_1 ) )
        return;

    self notify( "quarters_drunk_earlydeath2" );
    quarters_drunk_earlydeath_proc( var_0 );
}

quarters_drunk_earlydeath_proc( var_0 )
{
    self notify( "death_by_player" );
    common_scripts\utility::_id_383F( "quarters_drunk_ready" );
    quarters_drunk_death( var_0, 0 );
}

quarters_drunk_death( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    self _meth_8143();

    if ( var_1 )
        self kill();

    thread common_scripts\utility::_id_69C2( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

quarters_price()
{
    maps\_utility::_id_27EF( 0.6, maps\_utility::_id_70BD, "cargoship_pri_squadonme" );
    level notify( "bridge_secured" );
    var_0 = getnode( "quarters_price_0", "targetname" );
    var_1 = getnode( "quarters_price_1", "targetname" );
    var_2 = getnode( "quarters_price_2", "targetname" );
    self.ignoretriggers = 1;
    self.index = 1;

    if ( !common_scripts\utility::_id_382E( "price_wait_at_stairs" ) )
    {
        self _meth_81a9( var_0 );
        self.goalradius = var_0.rank;
        self._id_2B0E = 1;
        common_scripts\utility::_id_384A( "price_wait_at_stairs" );
        thread maps\_utility::_id_70BD( "cargoship_pri_stairsclear" );
        wait 0.4;
    }

    thread quarters_price_safety();
    level endon( "deck_drop" );
    thread quarters_price_force_disable_approach();
    self _meth_81a9( var_1 );
    self.goalradius = var_1.rank;

    if ( lengthsquared( self.origin - var_0.origin ) < 25 )
    {
        var_3 = common_scripts\utility::_id_40FB( "PriceKillsDrunkGuy", "targetname" );
        var_3 thread maps\_anim::_id_0C24( self, "stair_cover_exit" );
    }

    common_scripts\utility::_id_384A( "quarters_drunk_spawned" );
    self._id_2B0E = 0;
    maps\_utility::_id_22CF( level.quartersdrunk );
    common_scripts\utility::_id_384A( "quarters_drunk_ready" );

    while ( isalive( level.quartersdrunk ) )
    {
        if ( lengthsquared( self.origin - var_1.origin ) < 25 )
        {
            var_4 = randomintrange( 3, 6 );
            maps\cargoship_code::_id_1935( var_4, level.quartersdrunk.spinetarget.origin );
        }

        wait 0.2;
    }

    maps\_utility::_id_22CF( undefined );
    wait 0.25;
    maps\_utility::_id_70BD( "cargoship_pri_lastcall" );
    thread maps\_utility::_id_70BD( "cargoship_pri_hallwayclear" );
    common_scripts\utility::_id_383F( "quarters_price_says_clear" );
    maps\_utility::_id_4697( "onme" );
    self _meth_81a7( 1 );
    quarters_price_restore_disable_approach();
    self _meth_81a9( var_2 );
    self.goalradius = var_2.rank;
}

quarters_price_force_disable_approach()
{
    self.olddisableapproach = self._id_2AF2;
    self._id_2AF2 = 1;
    self.disableapproachforced = 1;
    common_scripts\utility::_id_384A( "deck_drop" );
    quarters_price_restore_disable_approach();
}

quarters_price_restore_disable_approach()
{
    if ( isdefined( self.disableapproachforced ) && self.disableapproachforced )
    {
        self._id_2AF2 = self.olddisableapproach;
        self.disableapproachforced = 0;
    }
}

quarters_price_safety()
{
    level endon( "quarters_price_says_clear" );
    common_scripts\utility::_id_384A( "deck_drop" );
    thread common_scripts\utility::_id_383F( "quarters_price_says_clear" );
}

quarters_alavi_stairs()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 == level.heroes5["price"] )
            break;
    }

    common_scripts\utility::_id_383F( "price_at_top_of_stairs" );
}

quarters_alavi()
{
    maps\_utility::_id_32DD( "at_sleeper" );
    var_0 = getnode( "quarters_price_0", "targetname" );
    var_1 = getnode( "quarters_alavi_1", "targetname" );
    var_2 = getnode( "quarters_alavi_2", "targetname" );
    self.ignoretriggers = 1;
    self.index = 1;
    getent( "price_at_top_of_stairs", "targetname" ) thread quarters_alavi_stairs();

    if ( !common_scripts\utility::_id_382E( "price_at_top_of_stairs" ) )
    {
        self _meth_81a9( var_0 );
        self.goalradius = var_0.rank;
        common_scripts\utility::_id_384A( "price_at_top_of_stairs" );
    }

    self _meth_81a9( var_1 );
    self.goalradius = var_1.rank;
    common_scripts\utility::_id_384A( "quarters_drunk_spawned" );
    maps\_utility::_id_22CF( level.quartersdrunk );
    common_scripts\utility::_id_384A( "quarters_drunk_ready" );
    level endon( "deck_drop" );
    self waittill( "goal" );
    wait 0.5;

    while ( isalive( level.quartersdrunk ) )
    {
        var_3 = randomintrange( 3, 6 );
        maps\cargoship_code::_id_1935( var_3, level.quartersdrunk.spinetarget.origin );
        wait 0.2;
    }

    if ( common_scripts\utility::_id_382E( "deck_drop" ) )
        return;

    if ( !common_scripts\utility::_id_382E( "deck" ) )
    {
        common_scripts\utility::_id_384A( "quarters_price_says_clear" );
        wait 0.25;
    }

    self _meth_81a9( var_2 );
    self.goalradius = var_2.rank;
    var_4 = common_scripts\utility::_id_40FB( "PriceKillsDrunkGuy", "targetname" );
    var_4 thread maps\_anim::_id_0C24( self, "bunkbed_approach" );
    self waittill( "goal" );
    maps\_utility::_id_32DE( "at_sleeper" );
    var_5 = getaiarray( "axis" );
    maps\_utility::_id_22CF( var_5[0] );
}

computer_destructible()
{
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1 );
    self setmodel( "com_computer_monitor_d" );
    var_2 = self getorigin();
    var_3 = var_2 + ( 0, 0, 10 );
    playfx( level._effect["tv_explosion"], var_3 );
}

deck_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "deck" )
        var_0 = "deck";

    switch ( var_0 )
    {
        case "deck":
            thread deck_heli();
            common_scripts\utility::_id_384A( "deck" );
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
            common_scripts\utility::_id_383F( "deck_heli" );
            thread deck_start();
            common_scripts\utility::_id_0D13( getentarray( "aftdeck_level2_enemies", "targetname" ), maps\_utility::_id_0798, ::deck_aftdeck_enemies );
            common_scripts\utility::_id_0D13( getentarray( "aftdeck_level3_runners", "targetname" ), maps\_utility::_id_0798, ::deck_aftdeck_runners );
            common_scripts\utility::_id_0D13( getentarray( "deck2_platform", "targetname" ), maps\_utility::_id_0798, ::deck_enemies_logic );
            common_scripts\utility::_id_0D13( getentarray( "deck_flags", "script_noteworthy" ), common_scripts\utility::_id_97CE );
            deck_dialogue1();
            common_scripts\utility::_id_384A( "windows_got_company_line_before" );
            level.playercardbackground.ignoretriggers = 1;
            common_scripts\utility::_id_384A( "windows_got_company_line" );
            wait 2;
            var_1 = getent( "aftdeck_level3_runners", "target" );
            var_1 notify( "trigger" );
    }
}

deck_wave()
{
    common_scripts\utility::_id_384A( "deck_wave" );
    level._sea_org notify( "manual_override" );

    if ( level._sea_org.sway == "sway1" )
    {
        level._sea_org.sway = "sway2";
        level._sea_org notify( "sway2" );
        wait 0.05;
    }

    level._sea_org.titleunlocked = 2.5;
    level._sea_org.acctime = 0.1;
    level._sea_org.dectime = 0.5;
    level._sea_org.runto_arrived = ( 10, 0, 20 );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level._sea_org.titleunlocked = 1.5;
    level._sea_org.acctime = 0.5;
    level._sea_org.dectime = 0.25;
    level._sea_org.runto_arrived = ( -5, 0, -5 );
    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.runto_arrived, level._sea_org.titleunlocked, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.titleunlocked);
    level._sea_org thread maps\_sea::sea_bob();
}

deck_aftdeck_enemies()
{
    maps\_utility::_id_27EF( 5, common_scripts\utility::_id_383F, "crouch_hint" );
    self endon( "death" );
    self.ignoretriggers = 1;
    self.index = 1;
    self _meth_8565( 1 );
    self.allowpain = 0;

    if ( !isdefined( level.aftdeck_enemies ) )
        level.aftdeck_enemies = [];

    level.aftdeck_enemies[level.aftdeck_enemies.size] = self;
    var_0 = getentarray( "deck_window_targets1", "targetname" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "deck_window_targets2", "targetname" ) );
    var_1 = getnode( self._not_team, "targetname" );

    if ( !isdefined( var_1._not_team ) )
    {
        for (;;)
        {
            wait 0.5;
            self _meth_816b( common_scripts\utility::_id_710E( var_0 ), 0.8 );
        }
    }
}

deck_aftdeck_runners()
{
    self endon( "death" );
    self._id_0C72 = "sprinter";
    self._id_5F65 = 1.2;
    maps\_utility::_id_7EAB( "sprint" );
    self waittill( "goal" );
    self delete();
}

deck_kill_off_sleepers()
{
    if ( common_scripts\utility::_id_382E( "deck_drop" ) )
        return;

    level endon( "deck_drop" );
    cargoship_disablealliesreload();

    if ( !common_scripts\utility::_id_382E( "quarters_sleepers_dead" ) )
    {
        level.heroes5["alavi"] maps\_utility::_id_32E0( "at_sleeper" );
        var_0 = getaiarray( "axis" );
        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( var_3.script_parentname == "sleeper" )
                var_1[var_1.size] = var_3;
        }

        level.heroes5["alavi"] maps\cargoship_code::_id_33EE( var_1, 0.7, undefined, 1, 1 );
    }

    wait 0.25;
    thread deck_kill_off_sleepers_dialogue();
    cargoship_enablealliesreload();
}

deck_kill_off_sleepers_dialogue()
{
    level endon( "deck_drop" );
    common_scripts\utility::_id_384A( "sweet_dreams" );
    thread maps\_utility::_id_70BD( "cargoship_pri_crewquarters" );
}

deck_start()
{
    level.heroes5["alavi"] maps\_utility::_id_2A74();
    level.heroes5["price"] _meth_81a7( 1 );
    level.heroes5["alavi"] _meth_81a7( 0 );
    level.heroes5["price"].ignoretriggers = 0;
    level.heroes5["alavi"].ignoretriggers = 0;
    level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    if ( level.jumpto != "deck" )
        deck_kill_off_sleepers();

    level.heroes5["alavi"] maps\_utility::_id_22CF( undefined );
    var_0 = getallnodes();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( issubstr( tolower( var_0[var_2].unlockpoints ), "cover" ) || issubstr( tolower( var_0[var_2].unlockpoints ), "guard" ) )
            var_1[var_1.size] = var_0[var_2];
    }

    var_0 = getnodearray( "decknodes", "targetname" );
    var_3 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_3[var_0[var_2].script_parentname] = var_0[var_2];

    var_4 = getarraykeys( level.heroes5 );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        var_5 = var_4[var_2];

        if ( !common_scripts\utility::_id_382E( "deck_drop" ) && level.heroes5[var_5] == level.heroes5["alavi"] )
        {
            level.heroes5[var_5] thread deck_alavi_wait_for_player( var_3[var_5], var_1 );
            continue;
        }

        level.heroes5[var_5] thread deck_heroes( var_3[var_5], var_1 );
    }

    thread maps\cargoship_code::deck_heroes_holdtheline();
    cargoship_heroes5_disablepain();
    common_scripts\utility::_id_384A( "moveup_deck1a" );
    maps\_utility::_id_1143( "deck" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 2 );
    common_scripts\utility::_id_384A( "deck_windows" );
    maps\_utility::_id_1143( "aftdeck" );
    thread maps\cargoship_code::player_speed_reset( 1 );
}

deck_alavi_wait_for_player( var_0, var_1 )
{
    if ( !common_scripts\utility::_id_382E( "deck_drop" ) )
    {
        self.ignoretriggers = 0;
        self _meth_81a7( 1 );
        var_2 = getnode( "quarters_alavi_wait", "targetname" );
        self _meth_81a9( var_2 );
        self.goalradius = var_2.rank;
        common_scripts\utility::_id_384A( "deck_drop" );
    }

    thread deck_heroes( var_0, var_1 );
}

deck_dialogue1_kill()
{
    common_scripts\utility::_id_384A( "deck_enemies_spawned" );
    wait 0.1;
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_0 );
    level notify( "kill_deck_dialogue" );
}

deck_dialogue1()
{
    thread deck_dialogue1_kill();
    level endon( "kill_deck_dialogue" );
    common_scripts\utility::_id_384A( "moveup_deck1b" );
    wait 0.5;
    maps\_utility::_id_70BD( "cargoship_grg_gottwo" );
    maps\_utility::_id_70BD( "cargoship_pri_iseeem" );
    common_scripts\utility::_id_384A( "moveup_deck2a" );
    maps\_utility::_id_70BD( "cargoship_pri_weaponsfree" );
    maps\_utility::_id_70BD( "cargoship_grg_rogerthat" );
}

deck_heroes( var_0, var_1 )
{
    self.goalradius = 64;
    self.ignoretriggers = 0;
    self _meth_81a7( 1 );

    if ( self.script_parentname == "grigsby" )
    {
        self waittillmatch( "single_anim_done" );
        self _meth_81aa( self.origin );
        self.goalradius = 16;
        thread maps\mo_tools::radio_msg_stack( "cargoship_grg_readysir" );
        self._id_0C72 = "guy";
        var_2 = spawn( "script_origin", self.origin );
        var_2.angles = ( 0, 0, 0 );
        var_2 thread maps\_anim::_id_0C24( self, "grigsturn" );
        wait(getanimlength( maps\_utility::_id_3EF5( "grigsturn" ) ) - 0.2);
        self _meth_8143();
        var_2.origin = self.origin;
        var_2.angles = ( 0, 180, 0 );
        var_2 thread maps\_anim::_id_0C24( self, "grigstop" );
        common_scripts\utility::_id_383F( "_sea_bob" );
        thread maps\_utility::_id_3840( "walk_deck", 1.5 );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_fanout" );
        wait(getanimlength( maps\_utility::_id_3EF5( "grigstop" ) ) - 0.2);
        self _meth_8143();
        self _meth_81aa( self.origin );
        self.goalradius = 4;
        wait 1.5;
        var_2.origin = self.origin;
        var_2 thread maps\_anim::_id_0C24( self, "grigsgo" );
        wait(getanimlength( maps\_utility::_id_3EF5( "grigsgo" ) ) - 0.2);
        self _meth_8143();
        maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
        var_2 delete();
    }

    self _meth_81a9( var_0 );

    if ( isdefined( var_0.rank ) && var_0.rank > 0 )
        self.goalradius = var_0.rank;
    else
        self.goalradius = 80;

    var_0 = getnode( var_0._not_team, "targetname" );

    if ( self.script_parentname == "alavi" )
        wait 15.5;

    if ( self.script_parentname == "seat6" )
        level.heroes5["seat6"]._id_5F65 = 1;

    self waittill( "goal" );
    common_scripts\utility::_id_384A( "walk_deck" );
    maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();

    while ( isdefined( var_0._not_team ) )
    {
        self _meth_81a9( var_0 );

        if ( isdefined( var_0.rank ) && var_0.rank > 0 )
            self.goalradius = var_0.rank;
        else
            self.goalradius = 80;

        self waittill( "goal" );
        var_3 = common_scripts\utility::_id_40FB( var_0.teambalanced, "target" );

        if ( isdefined( var_3 ) )
        {
            var_4 = getent( var_3.teambalanced, "target" );

            if ( !common_scripts\utility::_id_382E( var_4._id_79D3 ) )
            {
                if ( isdefined( var_0.rank ) && var_0.rank > 0 )
                {
                    var_5 = common_scripts\utility::_id_3F33( var_0.origin, var_1, var_0.rank );

                    if ( isdefined( var_5 ) )
                        self _meth_81a9( var_5 );

                    self.goalradius = 16;
                }

                common_scripts\utility::_id_384A( var_4._id_79D3 );
            }
        }

        var_0 = getnode( var_0._not_team, "targetname" );

        if ( self.script_parentname == "grigsby" )
            self _meth_81a7( 1 );
    }

    common_scripts\utility::_id_383F( "deck_windows" );
    self _meth_81a9( var_0 );
    self.goalradius = 16;
    maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    if ( self.script_parentname != "price" && self.script_parentname != "grigsby" )
        self _meth_81a7( 0 );

    if ( self.script_parentname == "price" )
    {
        self waittill( "goal" );
        common_scripts\utility::_id_384A( "windows_got_company_line" );
        maps\_utility::_id_70BD( "cargoship_pri_tangos2ndfl" );
        common_scripts\utility::_id_383F( "heli_shoot_deck_windows" );
    }
    else if ( !common_scripts\utility::_id_382E( "windows_got_company_line_before" ) )
    {
        common_scripts\utility::_id_383F( "windows_got_company_line_before" );
        maps\_utility::_id_70BD( "cargoship_grg_gotcompany" );
        common_scripts\utility::_id_383F( "windows_got_company_line" );
    }
}

deck_heli()
{
    common_scripts\utility::_id_384A( "deck_heli" );
    var_0 = common_scripts\utility::_id_40FB( "heli_deck_landing_node", "targetname" );
    level._id_47A3._id_9C7E vehicle_setspeed( 40, 30, 20 );
    level._id_47A3._id_9C7E sethoverparams( 0, 0, 0 );
    level._id_47A3._id_9C7E setgoalyaw( var_0.angles[1] );
    level._id_47A3._id_9C7E settargetyaw( var_0.angles[1] );
    level._id_47A3._id_9C7E setgoalpos( var_0.origin + ( 0, 0, 146 ), 1 );
    level._id_47A3._id_9C7E neargoalnotifydist( 32 );
    level._id_47A3._id_9C7E waittill( "near_goal" );
    common_scripts\utility::_id_384A( "deck_drop" );
    thread maps\_utility::_id_70BD( "cargoship_hp1_forwarddeckradio" );
    level._id_47A3.motiontrackerenabled.spotlight_default_target = spawn( "script_origin", level._id_47A3.motiontrackerenabled gettagorigin( "tag_barrel" ) );
    level._id_47A3.motiontrackerenabled.spotlight_default_target linkto( level._id_47A3.motiontrackerenabled, "tag_turret", ( 0, 0, -256 ), ( 0, 0, 0 ) );
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_deckdrop_target();
    level._id_47A3 notify( "unload_rest" );
    wait 2;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_distant" );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_strike" );
    wait 1;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_distant" );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_strike" );
    wait 2;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.playercardbackground thread maps\_utility::_id_69C4( "elm_thunder_distant" );
    wait 3.5;
    level._id_47A3._id_9C7E vehicle_setspeed( 15, 5, 5 );
    level._id_47A3._id_9C7E sethoverparams( 32, 10, 3 );
    level._id_47A3._id_9C7E clearlookatent();
    level._id_47A3._id_9C7E cleargoalyaw();
    level._id_47A3._id_9C7E cleartargetyaw();
    level._id_47A3._id_9C7E setlookatent( level.heroes5["price"] );
    common_scripts\utility::_id_384A( "moveup_deck1a" );
    maps\_vehicle::switch_vehicle_fx( "script_vehicle_blackhawk", "fx/treadfx/heli_dust_cargoship_shooting" );
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "aiarray", "allies" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::_id_40FB( "heli_deck_landing_node", "targetname" ) );
    common_scripts\utility::_id_3831( "heli_light_on" );
    common_scripts\utility::_id_3831( "heli_light_triggers" );
    common_scripts\utility::_id_383F( "heli_light_optimize" );
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::deck_delete_destroyed_glass_pieces();
    common_scripts\utility::_id_384A( "moveup_deck1b" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::_id_40FB( "deck_helinode_1b", "targetname" ) );
    common_scripts\utility::_id_384A( "moveup_deck2b" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::_id_40FB( "deck_helinode_2b", "targetname" ) );
    common_scripts\utility::_id_384A( "heli_shoot_deck_windows" );
    level._id_47A3._id_9C7E vehicle_setspeed( 20, 10, 10 );
    level._id_47A3._id_9C7E clearlookatent();
    level._id_47A3._id_9C7E settargetyaw( 110 );
    level._id_47A3._id_9C7E setgoalyaw( 110 );
    thread maps\_utility::_id_70BD( "cargoship_hp1_copyengaging" );
    var_1 = spawn( "script_origin", ( -2324, 32, 256 ) );
    var_1.teambalanced = "aftdeck_helispot_target";
    var_2 = spawn( "script_origin", ( -2324, -416, 270 ) );
    var_2.teambalanced = "attack_target";
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "targetname", "attack_target" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::_id_40FB( "deck_helinode_win", "targetname" ) );
    thread maps\_utility::_id_3840( "heli_light_on", 2 );
    wait 1.5;
    level._id_47A3._id_9C7E vehicle_setspeed( 2, 7, 7 );
    soundscripts\_snd::_id_870C( "aud_start_mix_heli_shoot_window" );
    wait 1;
    var_3 = 3.5;
    var_2 moveto( ( -2368, 592, 270 ), var_3 );
    var_2 thread maps\cargoship_code::deck_minigun_dodamage();
    level._id_47A3.motiontrackerenabled.minigun["left"] settargetentity( var_2 );
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_minigun_fake_deck_fire();
    var_4 = spawn( "script_model", level._id_47A3.motiontrackerenabled.minigun["left"] gettagorigin( "tag_flash" ) );
    var_4 setmodel( "tag_origin" );
    var_4 linkto( level._id_47A3.motiontrackerenabled.minigun["left"], "tag_flash", ( -30, 0, 0 ), ( 0, 0, 0 ) );
    var_4 thread maps\cargoship_code::deck_heli_minigun_fx();
    thread maps\cargoship_code::deck_kill_lights();
    wait(var_3);
    level._id_47A3.motiontrackerenabled maps\cargoship_code::heli_minigun_fake_deck_stopfire();
    var_4 delete();
    level._id_47A3._id_9C7E vehicle_setspeed( 10, 7, 7 );
    soundscripts\_snd::_id_870C( "aud_stop_mix_heli_shoot_window" );
    wait 1;
    level._id_47A3.motiontrackerenabled.minigun["left"] cleartargetentity();
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "targetname", "aftdeck_helispot_target" );
    var_2 delete();
    level._id_47A3._id_9C7E setgoalyaw( 225 );
    level._id_47A3._id_9C7E cleartargetyaw();
    common_scripts\utility::_id_383F( "hallways" );
    maps\_utility::_id_70BD( "cargoship_hp1_bingofuel" );
    common_scripts\utility::_id_383F( "hallways_moveup" );
    common_scripts\utility::_id_3831( "heli_light_on" );
    level._id_47A3.motiontrackerenabled maps\cargoship_code::heli_searchlight_off();
    level._id_47A3.motiontrackerenabled thread maps\cargoship_code::heli_searchlight_target( "default" );
    level._id_47A3._id_9C7E vehicle_setspeed( 35, 10, 10 );
    maps\cargoship_code::heli_flypath( common_scripts\utility::_id_40FB( "deck_helinode_gohome", "targetname" ) );
    level._id_47A3.motiontrackerenabled.minigun["left"] delete();
    level._id_47A3 maps\mo_fastrope::fastrope_heli_cleanup();
    level.heroes7["pilot"] maps\_utility::_id_8EA4();
    level.heroes7["pilot"] delete();
    level.heroes7["copilot"] maps\_utility::_id_8EA4();
    level.heroes7["copilot"] delete();
}

deck_enemies_logic()
{
    common_scripts\utility::_id_383F( "deck_enemies_spawned" );
    self.ignoretriggers = 1;
    self.helmet = 10;
    self.maxturnspeed = 10;
    var_0 = getnode( self._not_team, "targetname" );
    self._id_2AF7 = 1;
    self.disablestairsanims = 1;
    thread maps\cargoship_code::_id_66FC();
    thread maps\cargoship_code::deck_enemies_herokill();
    thread maps\cargoship_code::deck_enemies_behavior();

    if ( !isdefined( level.deck_enemy_die ) )
    {
        level.deck_enemy_die = 1;
        thread maps\cargoship_code::enemies_death_msg( "cargoship_grg_tangodown" );
    }
    else
        thread maps\cargoship_code::enemies_death_msg( "cargoship_gm2_targetneutralized" );

    self endon( "death" );
    self waittill( "in_range" );
    self.ignoretriggers = 0;
}

hallways_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "hallways" )
        var_0 = "hallways";

    switch ( var_0 )
    {
        case "hallways":
            common_scripts\utility::_id_384A( "hallways" );
            level.playercardbackground.ignoretriggers = 0;
            var_1 = getaiarray( "axis" );

            for ( var_2 = 0; var_2 < var_1.size; var_2++ )
                var_1[var_2] kill();

            thread hallways_player_speed();
            maps\_utility::_id_1143( "hallways_breach" );
            level.heroes5["price"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"]._id_1300 = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["price"].ignoretriggers = 0;
            level.heroes5["alavi"].ignoretriggers = 0;
            level.heroes5["grigsby"].ignoretriggers = 0;
            hallways_breach();
            common_scripts\utility::_id_0D13( getentarray( "hallways_lower_runners", "targetname" ), maps\_utility::_id_0798, ::hallways_lower_runners );
            common_scripts\utility::_id_0D13( getentarray( "hallways_lower_runners2", "targetname" ), maps\_utility::_id_0798, ::hallways_lower_runners2 );
            thread hallways_lower_runners1_death();
            thread hallways_lower_runners_deathnotify();
            thread hallways_dialogue();
            var_3 = [];
            var_3["alavi"] = "cargoship_gm1_clearleft";
            var_3["grigsby"] = "cargoship_grg_clearright";
            var_3["price"] = undefined;
            maps\_utility::_id_1143( "hallways" );
            maps\cargoship_code::hallways_heroes( "hallways_enter", "hallways_corner", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_hallwayclear" );
            level.heroes3["price"] maps\_utility::_id_27EF( 1, maps\_utility::_id_4697, "go", 1 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            var_3["alavi"] = "cargoship_gm1_clearright";
            var_3["grigsby"] = undefined;
            var_3["price"] = undefined;
            wait 2;
            maps\cargoship_code::hallways_heroes( "hallways_corner", "hallways_stairs", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stairsclear" );
            common_scripts\utility::_id_384A( "hallways_bottom_stairs" );
            setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
            maps\_utility::_id_1143( "hallways_stairs" );
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            thread maps\cargoship_code::hallways_heroes( "hallways_stairs", "hallways_lowerhall_guys" );
            cargoship_enablealliesreload();
            var_4 = spawn( "script_origin", ( -2740, -20, -116 ) );
            var_5 = spawn( "script_origin", ( -2740, -20, -98 ) );
            level.heroes3["grigsby"] _meth_816b( var_5 );
            level.heroes3["price"] _meth_816b( var_4 );
            common_scripts\utility::_id_384A( "hallways_lowerhall" );
            level.heroes3["grigsby"] _meth_816c();
            level.heroes3["price"] _meth_816c();
            var_4 delete();
            var_5 delete();
            common_scripts\utility::_id_384A( "hallways_lowerhall_guys" );
            cargoship_disablealliesreload();
            thread maps\_utility::_id_1332( "axis" );
            maps\_utility::_id_27EF( 2, maps\_utility::_id_1143, "hallways_lowerhall" );
            maps\_utility::_id_27EF( 0.5, maps\mo_tools::radio_msg_stack, "cargoship_grg_tangodown" );
            maps\_utility::_id_27EF( 1, maps\mo_tools::radio_msg_stack, "cargoship_pri_hallwayclear" );
            maps\_utility::_id_27EF( 6, maps\mo_tools::radio_msg_stack, "cargoship_pri_checkcorners" );
            var_3["alavi"] = "cargoship_gm1_clearleft";
            var_3["grigsby"] = "cargoship_grg_readysir";
            var_3["price"] = undefined;
            var_6["alavi"] = "crouch2run";
            var_6["grigsby"] = undefined;
            var_6["price"] = undefined;
            maps\cargoship_code::hallways_heroes( "hallways_lowerhall", "hallways_lowerhall2", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            common_scripts\utility::_id_383F( "hallways_lowerhall2" );
            thread disable_ik_trigger();
    }
}

hallways_player_speed()
{
    common_scripts\utility::_id_384A( "hallways_enter" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
}

hallways_dialogue()
{
    var_0 = getent( "hallways_lower_runners", "target" );
    var_0 waittill( "trigger" );
    wait 1.75;
    maps\mo_tools::radio_msg_stack( "cargoship_gm1_movementright" );
    thread maps\_utility::_id_1333( "axis" );
}

hallways_lower_runners_deathnotify()
{
    common_scripts\utility::_id_384A( "hallways_lower_runners2" );
    wait 0.2;
    var_0 = getaiarray( "axis" );
    thread hallways_lower_runners_instakill( var_0 );
    maps\_utility::_id_A07E( var_0 );
    common_scripts\utility::_id_383F( "hallways_lowerhall_guys" );
    common_scripts\utility::_id_383F( "hallways_lowerhall" );
}

hallways_lower_runners_instakill( var_0 )
{
    common_scripts\utility::_id_384A( "cargoholds_1_enter" );
    var_0 = maps\_utility::_id_0CFD( var_0 );

    if ( !var_0.size )
        return;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] kill( level.playercardbackground.origin );
}

hallways_lower_runners1_death()
{
    common_scripts\utility::_id_384A( "hallways_lower_runners1" );
    wait 0.1;
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_0 );
    var_1 = getent( "hallways_lower_runners2", "target" );
    var_1 notify( "trigger" );
}

hallways_lower_runners()
{
    self endon( "death" );
    self.ignoretriggers = 1;
    self.ignoreforfixednodesafecheck = 1;
    self.goalradius = 64;
    common_scripts\utility::_id_383F( "hallways_lower_runners1" );
    thread hallways_lower_runners_common();
    self._id_0C72 = "sprinter";
    self._id_5F65 = 1;
    maps\_utility::_id_7EAB( "sprint" );
    self waittill( "goal" );
    self.ignoreforfixednodesafecheck = 0;
    maps\_utility::_id_1ED1();
}

hallways_lower_runners2()
{
    self endon( "death" );
    common_scripts\utility::_id_383F( "hallways_lower_runners2" );
    thread hallways_lower_runners_common();
}

hallways_lower_runners_common()
{
    self endon( "death" );
    self.a._id_2B18 = 1;
    self waittill( "goal" );
    self.ignoretriggers = 0;
    self.index = 1;
    waitframe;
    self.goalradius = 16;
    common_scripts\utility::_id_384A( "hallways_lower_runners2" );
    wait 0.5;
    self.goalradius = 512;
}

hallways_breach_moveout( var_0, var_1 )
{
    var_2 = "nothing_at_all";

    if ( level.jumpto != "hallways" )
        var_2 = "stop_loop";

    self notify( var_2 );
    self._id_0C72 = "guy";

    if ( var_0 != "" )
    {
        var_3 = getanimlength( maps\_utility::_id_3EF5( var_0 ) );
        thread maps\_anim::_id_0C24( self, var_0 );
        wait(var_3 - 0.2);
    }

    self _meth_81a9( var_1 );
    self.goalradius = 16;
    self _meth_8143();
    self _meth_81a7( 1 );
}

hallways_breach()
{
    level endon( "hallways_enter" );
    cargoship_disablealliesreload();
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side", 1, "force_fully_on" );
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side2", 1, "normal" );
    var_0 = getnodearray( "hallways_door_open_guard", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_0[var_2].script_parentname] = var_0[var_2];

    level.heroes3["price"]._id_5F65 = 1;
    level.heroes3["alavi"]._id_5F65 = 1;
    level.heroes3["grigsby"]._id_5F65 = 1;
    level.heroes3["price"]._id_0C78 = 1;
    level.heroes3["alavi"]._id_0C78 = 1;
    level.heroes3["grigsby"]._id_0C78 = 1;
    level.heroes5["seat5"]._id_5F65 = 0.9;
    level.heroes5["seat6"]._id_5F65 = 1;
    var_3 = getnode( "hallways_door_open", "targetname" );
    var_4 = spawn( "script_origin", var_3.origin );
    var_4.angles = var_3.angles;
    var_5 = spawn( "script_origin", var_4.origin );
    var_5.angles = var_4.angles;
    var_6 = spawn( "script_origin", var_4.origin );
    var_6.angles = var_4.angles;
    var_7 = "hallways_grigs_doorbreach";
    var_8 = "hallways_price_doorbreach";
    var_9 = "hallways_alavi_doorbreach";
    common_scripts\utility::_id_383D( var_8 );
    common_scripts\utility::_id_383D( var_7 );
    common_scripts\utility::_id_383D( var_9 );

    if ( level.jumpto != "hallways" )
    {
        wait 2;
        level.heroes5["alavi"] _meth_81a7( 1 );
        level.heroes5["alavi"].a.forceapproachfacenodeyaw = 1;
        var_6 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["alavi"], "breach2_alavi_arrival", "breach2_alavi_idle", "stop_loop", var_9 );
        common_scripts\utility::_id_384A( "hallways_moveup" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_copyhammer" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_restonme" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_grg_rogerthat" );
        level.heroes5["seat5"] thread hallways_breach_moveout( "", var_1["seat5"] );
        wait 0.8;
    }

    if ( level.jumpto != "hallways" )
    {
        level.heroes5["price"] hallways_breach_moveout( "", var_3 );
        level.heroes5["grigsby"] hallways_breach_moveout( "", var_3 );
    }

    level.heroes5["price"]._id_0C72 = "price";
    level.heroes5["grigsby"]._id_0C72 = "grigsby";
    level.heroes5["alavi"].a.forceapproachfacenodeyaw = 0;
    wait 0.5;
    var_4 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["price"], "breach2_price_arrival", "breach2_price_idle", "stop_loop", var_8 );
    level.heroes5["seat6"] thread hallways_breach_moveout( "", var_1["seat6"] );
    wait 0.8;
    var_5 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["grigsby"], "breach2_grigsby_arrival", "breach2_grigsby_idle", "stop_loop", var_7 );
    common_scripts\utility::_id_384B( var_8, var_7, var_9 );
    wait 0.1;
    common_scripts\utility::_id_384A( "hallways_ready_to_breach" );
    common_scripts\utility::_id_383F( "stand_hint" );
    maps\_utility::_id_27EF( 2, maps\_utility::_id_70BD, "cargoship_grg_closeencounters" );
    var_5 notify( "stop_loop" );
    var_6 notify( "stop_loop" );
    level.heroes5["grigsby"]._id_A154 = 1;
    var_4 thread maps\_anim::_id_0BC9( level.heroes5["alavi"], "breach2_alavi_breach" );
    var_5 maps\_anim::_id_0BC9( level.heroes5["grigsby"], "breach2_grigsby_talk" );
    thread maps\_utility::_id_70BD( "cargoship_gm1_tooright" );
    var_4 notify( "stop_loop" );
    var_5 notify( "stop_loop" );
    var_10 = getent( "hallways_door", "targetname" );
    var_11 = getent( "door_shadow_cabin_stern_side", "targetname" );
    var_11 linkto( var_10, "hinge_jnt" );
    var_12 = getent( var_10._not_team, "targetname" );
    var_12 connectpaths();
    var_10 useanimtree( #animtree );
    var_3 thread maps\_anim::_id_0BC9( var_10, "breach2_door_breach" );
    var_5 thread maps\_anim::_id_0BC9( level.heroes5["grigsby"], "breach2_grigsby_breach" );
    var_4 thread maps\_anim::_id_0BC9( level.heroes5["price"], "breach2_price_breach" );
    wait 1.8;
    thread maps\_utility::_id_70BD( "cargoship_pri_onmymark" );
    var_12 rotateyaw( -80, 1, 0, 0.3 );
    var_12 thread hallways_breach_clip();
    thread door_breach_godray();
    wait 2.2;
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side", 1, "normal" );
    maps\_utility::_id_27EF( 0.5, maps\_utility::_id_70BD, "cargoship_pri_checkcorners" );
    maps\_utility::_id_27EF( 6, maps\mo_tools::radio_msg_stack, "cargoship_pri_checkthose" );
    maps\_utility::_id_27EF( 1, soundscripts\_snd::_id_870C, "aud_stop_mix_moving_to_hallway" );
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    wait 0.2;
    level.heroes5["alavi"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    wait 0.2;
    level.heroes5["grigsby"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    level.heroes5["price"] waittillmatch( "single anim", "end" );
    level.heroes3["price"]._id_0C72 = "guy";
    maps\_utility::_id_27EF( 0.5, maps\_utility::_id_70BD, "cargoship_pri_move" );
    level.heroes3["price"] _meth_81aa( level.heroes3["price"].origin );
    level.heroes3["price"].goalradius = 16;
    level.heroes3["price"] _meth_81a7( 1 );
    level.heroes3["price"] maps\_utility::_id_4697( "onme", 1 );
    level.heroes3["price"] _meth_81a7( 1 );
    level.heroes5["price"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    cargoship_heroes5_enablepain();
}

hallways_breach_clip()
{
    self waittill( "rotatedone" );
    door_player_clip();
}

door_player_clip()
{
    if ( level.playercardbackground istouching( self ) )
        self notsolid();
    else
        return;

    while ( level.playercardbackground istouching( self ) )
        wait 0.05;

    self solid();
}

hallways_breach_alavi_hack( var_0 )
{
    maps\_anim::_id_0BC9( var_0, "standidle2aim" );
    thread maps\_anim::_id_0BCE( var_0, "standaim" );
    var_0 waittill( "exit" );
    self notify( "stop_loop" );
    thread maps\_anim::_id_0BC9( var_0, "stand2run" );
    var_1 = getanimlength( maps\_utility::_id_3EF7( "stand2run" ) );
    wait(var_1 - 0.2);
    var_0 _meth_8143();
}

door_breach_godray()
{
    for (;;)
    {
        common_scripts\_exploder::_id_3528( "701" );
        common_scripts\utility::_id_384A( "cargohold_fx" );
        common_scripts\_exploder::_id_5309( "701" );
        common_scripts\utility::_id_384A( "topside_fx" );
    }
}

cargohold_flash()
{
    if ( common_scripts\utility::_id_382E( "cargoholds_1_enter" ) || common_scripts\utility::_id_382E( "cargoholds_1_enter_clear" ) )
        return;

    level endon( "cargoholds_1_enter" );
    level endon( "cargoholds_1_enter_clear" );
    cargohold_main_alavi_reach_flash();
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_standby" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_standingby" );
    level.heroes3["price"] waittill( "goal" );
    common_scripts\utility::_id_384A( "cargohold1_flashmoment" );
    thread cargohold_flash2();
    level.heroes3["price"] thread maps\cargoship_code::caroghold_remove_flash_grenade( "cargoholds_1_enter" );
    level.heroes3["price"] maps\cargoship_code::cargohold_flashthrow( ( 155, 130, 5 ), 1 );
    level notify( "flashbang" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_go" );
}

cargohold_flash2()
{
    level endon( "cargoholds_1_enter" );
    level endon( "cargoholds_1_enter_clear" );
    wait 3;
    maps\mo_tools::radio_msg_stack( "cargoship_pri_flashbangout" );
    thread maps\_utility::_id_1333( "axis" );
}

disable_turns_until_duration_or_flag( var_0, var_1 )
{
    if ( level common_scripts\utility::_id_382E( var_1 ) )
        return;

    maps\_utility::_id_2AEA();
    level common_scripts\utility::_id_A073( var_0, var_1 );
    maps\_utility::_id_3102();
}

cargohold_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "cargohold" )
        var_0 = "cargohold";

    switch ( var_0 )
    {
        case "cargohold":
            heroes_remove_bullet_whiz();
            thread cargohold1_pulp_fiction_think();
            var_1 = getentarray( "pulp_fiction_guy", "script_noteworthy" );
            common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::cargohold1_pulp_fiction_guy );
            common_scripts\utility::_id_384A( "hallways_lowerhall2" );
            level.heroes3["grigsby"]._id_A154 = 1;
            thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
            level.heroes3["price"] _meth_81a7( 1 );
            level.heroes3["alavi"] _meth_81a7( 1 );
            level.heroes3["grigsby"] _meth_81a7( 1 );
            var_2 = [];
            var_3 = [];
            var_4 = [];
            var_2["alavi"] = undefined;

            if ( level.jumpto == "cargohold" )
                var_2["grigsby"] = undefined;
            else
                var_2["grigsby"] = "stand2run";

            var_2["price"] = undefined;
            var_1 = getentarray( "cargohold1_flashed_enemies", "targetname" );
            common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::cargohold1_flashed_enemies );
            thread cargohold1_flashed_enemies_death();
            var_3["price"] = 2.25;
            var_3["alavi"] = 0;
            var_3["grigsby"] = 1.25;
            thread maps\cargoship_code::hallways_heroes( "hallways_lowerhall2", "cargoholds_1_enter", undefined, var_3, var_2 );
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
            common_scripts\utility::_id_0D13( level.heroes3, maps\mo_tools::disable_cqbwalk_ign_demo_wrapper );
            level.heroes3["price"].a.cqbchangedontmodifyinterval = 1;
            level.heroes3["price"].invisible = 0;
            level.heroes3["price"].a._id_2B20 = 1;
            level.heroes3["alavi"].a._id_2B20 = 1;
            level.heroes3["grigsby"].a._id_2B20 = 1;
            level.heroes3["price"] _meth_8565( 1 );
            level.heroes3["alavi"] _meth_8565( 1 );
            level.heroes3["grigsby"] _meth_8565( 1 );
            level.heroes3["alavi"] thread disable_turns_until_duration_or_flag( 3, "cargoholds_1_enter" );
            cargohold_flash();
            level.heroes3["price"].a.cqbchangedontmodifyinterval = 0;
            level.heroes3["price"].invisible = 96;
            level.heroes3["grigsby"] _meth_81a7( 0 );
            level.heroes3["grigsby"].dontpushplayer = 1;
            level.heroes3["price"].ignoretriggers = 0;
            level.heroes3["alavi"].ignoretriggers = 0;
            level.heroes3["grigsby"].ignoretriggers = 0;

            if ( common_scripts\utility::_id_382E( "cargoholds_1_enter" ) )
            {
                var_2["alavi"] = undefined;
                var_2["grigsby"] = undefined;
                var_2["price"] = undefined;
                var_3["price"] = 0.1;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.5;
            }
            else
            {
                var_2["alavi"] = "cornerleft8";
                var_2["grigsby"] = undefined;
                var_2["price"] = "cornerleft8";
                var_3["price"] = 0.35;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.7;
            }

            level.heroes3["alavi"] notify( "stop_loop" );
            level.heroes3["price"] notify( "stop_loop" );
            level.heroes3["alavi"] _meth_8143();
            level.heroes3["price"] _meth_8143();
            thread maps\cargoship_code::hallways_heroes( "cargoholds_1_enter", "cargoholds_1_enter_clear", undefined, var_3, var_2 );

            if ( common_scripts\utility::_id_382E( "cargoholds_1_enter_clear" ) )
            {
                var_3["price"] = 0.35;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.7;
            }
            else
            {
                common_scripts\utility::_id_384A( "cargoholds_1_enter_clear" );
                var_3["alavi"] = 0;
                var_3["grigsby"] = 0;
                var_3["price"] = 2;
            }

            thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_moveup" );
            level.heroes3["grigsby"].dontpushplayer = undefined;
            level.heroes3["grigsby"] _meth_81a7( 1 );
            maps\cargoship_code::hallways_heroes( "cargoholds_1_enter_clear", "cargoholds_1_cross", undefined, var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_squadonme" );
            var_3["price"] = 0;
            var_3["alavi"] = 1;
            var_3["grigsby"] = 2;
            var_4["alavi"] = "cargoship_gm1_notangos";
            var_4["grigsby"] = "cargoship_grg_forwardclear";
            var_4["price"] = undefined;
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_cross", "cargoholds_1_part3", var_4, var_3 );
            level.heroes3["price"] thread maps\_utility::_id_4697( "go", 1 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            var_3["price"] = 1.75;
            var_3["alavi"] = 2.5;
            var_3["grigsby"] = 1.25;
            var_2["alavi"] = undefined;
            var_2["grigsby"] = undefined;
            var_2["price"] = "crouch2run";
            thread cargohold1_dialogue1();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_part3", "cargoholds_1_cross2", undefined, var_3 );
            var_3["price"] = 0;
            var_3["alavi"] = 2.0;
            var_3["grigsby"] = 3.5;
            var_2["alavi"] = "cornerleft6";
            var_2["grigsby"] = undefined;
            var_2["price"] = undefined;
            thread cargohold1_dialogue2();
            thread cargohold1_dialogue3();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_cross2", "cargoholds_1_part5", undefined, var_3, var_2 );
            var_3["price"] = 1;
            var_3["alavi"] = 0;
            var_3["grigsby"] = 0;
            maps\cargoship_code::hallways_heroes( "cargoholds_1_part5", "nothing", undefined, var_3 );
            common_scripts\utility::_id_383F( "cargoholds2" );
    }
}

heroes_remove_bullet_whiz()
{
    level.heroes3["price"]._id_2AF7 = 1;
    level.heroes3["alavi"]._id_2AF7 = 1;
    level.heroes3["grigsby"]._id_2AF7 = 1;
}

cargohold1_pulp_fiction_guy_add_spawn_stuff()
{
    maps\_utility::_id_0798( ::cargohold1_pulp_fiction_guy );
    self._id_79EB = 1;
}

cargohold1_dialogue1()
{
    if ( common_scripts\utility::_id_382E( "cargoholds_1_cross2" ) )
        return;

    level endon( "cargoholds_1_cross2" );
    wait 2.25;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_keepittight" );
    wait 2.75;

    if ( common_scripts\utility::_id_382E( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_zeromovement" );
}

cargohold1_dialogue2()
{
    if ( common_scripts\utility::_id_382E( "cargoholds_1_part5" ) )
        return;

    level endon( "cargoholds_1_part5" );
    wait 2.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_rightside" );
    wait 0.2;
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_onit" );
    wait 3.8;

    if ( common_scripts\utility::_id_382E( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_looksquiet" );
    wait 0.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stayfrosty" );
}

cargohold1_dialogue3()
{
    wait 10.5;

    if ( common_scripts\utility::_id_382E( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_notangos" );
}

cargohold1_pulp_fiction_think()
{
    if ( getdvar( "pulp_fiction_guy" ) == "" )
        setdvar( "pulp_fiction_guy", "" );

    if ( !isdefined( getdvar( "pulp_fiction_guy" ) ) )
        setdvar( "pulp_fiction_guy", "" );

    common_scripts\utility::_id_384A( "cargoholds_1_enter" );
    maps\_utility::_id_1145( "cargoholds_1_enter" );
    common_scripts\utility::_id_384A( "cargoholds_1_cross" );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    var_1 = getentarray( "absolute", "script_noteworthy" );
    var_0 = maps\_utility::_id_0CE7( var_0, var_1 );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CC );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    var_2 = getdvar( "pulp_fiction_guy" );
    var_3 = randomint( var_0.size );

    if ( isdefined( var_2 ) )
    {
        var_0[int( var_2 )] common_scripts\utility::_id_97CC();

        while ( int( var_2 ) == var_3 )
        {
            var_3 = randomint( var_0.size );
            wait 0.05;
        }
    }

    setdvar( "pulp_fiction_guy", var_3 );
    var_4 = var_0[var_3];
    var_4 common_scripts\utility::_id_97CE();
    common_scripts\utility::_id_384C( "cargoholds2", "pulp_fiction_guy", "laststand" );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CC );
}

cargohold1_pulp_fiction_guy()
{
    var_0 = getarraykeys( level.heroes3 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_3 = distance( self.origin, level.heroes3[var_2].origin );

        if ( var_3 < 128 )
        {
            if ( var_3 < distance( self.origin, level.playercardbackground.origin ) )
            {
                self delete();
                return;
            }
        }
    }

    common_scripts\utility::_id_383F( "pulp_fiction_guy" );
    self endon( "death" );
    self.ignoreweaponintracksuitmode = 1;
    anim._id_83F3 = animscripts\utility::_id_83F5;
    thread cargohold1_pulp_fiction_guy_ignore();
    thread cargohold1_pulp_fiction_guy_healthshield();
    thread cargohold1_pulp_fiction_guy_kill();
    animscripts\utility::_id_7F20( 1 );
    animscripts\shared::_id_0E0C( self.secondaryweapon, "chest" );
    animscripts\shared::_id_9AF6();
    self.favoriteenemy = level.playercardbackground;
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self._id_2D38 = 1;
    self.disablestairsanims = 1;
    self._id_0C72 = "pulp_fiction_guy";
    self._id_1300 = 1;
    self.accuracy = 1;
    self.helmet = 2;
    self.maxturnspeed = 2;
    self.goalradius = 90;
    self _meth_81aa( level.playercardbackground.origin );
    maps\_utility::_id_70C9();
    self playsound( "generic_meleecharge_russian_" + randomintrange( 1, 8 ) );

    while ( level.playercardbackground.helmet > 0 )
    {
        level waittill( "an_enemy_shot", var_4 );

        if ( var_4 != self )
            continue;

        for ( var_5 = 1; var_5; var_5-- )
        {
            wait 0.25;
            self _meth_81ea();
        }
    }

    self.ignoretriggers = 1;
}

cargohold1_pulp_fiction_guy_healthshield()
{
    var_0 = 1;

    while ( var_0 )
    {
        level.playercardbackground waittill( "damage", var_1, var_2 );

        if ( !isalive( self ) )
            return;

        if ( var_2 == self )
            var_0--;
    }

    if ( !isalive( self ) )
        return;

    level.playercardbackground enablehealthshield( 0 );
    self waittill( "death" );
    level.playercardbackground enablehealthshield( 1 );
}

cargohold1_pulp_fiction_guy_ignore()
{
    self endon( "death" );
    self.ignoretriggers = 1;
    wait 2;
    self.ignoretriggers = 0;
}

cargohold1_pulp_fiction_guy_kill()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "kill_pulpfictionguy" );
    self kill();
}

cargohold1_flashed_enemies_death()
{
    common_scripts\utility::_id_384A( "cargohold1_flashmoment" );
    wait 0.1;
    maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.playercardbackground, "cargoship_gm1_catwalkclear" );
    common_scripts\utility::_id_383F( "cargoholds_1_enter_clear" );
    thread maps\_utility::_id_1332( "axis" );
    level.heroes3["price"].a._id_2B20 = 0;
    level.heroes3["alavi"].a._id_2B20 = 0;
    level.heroes3["grigsby"].a._id_2B20 = 0;
    level.heroes3["price"] _meth_8565( 0 );
    level.heroes3["alavi"] _meth_8565( 0 );
    level.heroes3["grigsby"] _meth_8565( 0 );
}

cargohold1_flashed_enemies()
{
    self endon( "death" );
    self.grenadeammo = 0;
    wait 0.15;
    self.goalradius = 64;
    self.helmet = 2;
    self._id_2B18 = 1;
    var_0 = spawn( "script_origin", ( -2176, 540, -140 ) );
    level waittill( "alavi_looked" );
    self _meth_816b( var_0 );
    level waittill( "flashbang" );
    var_0 delete();
    self _meth_816c();
    cargoship_disablealliesreload();
}

cargohold_main_alavi_reach_flash()
{
    level endon( "cargoholds_1_enter" );
    wait 0.1;
    level.heroes3["alavi"].goalradius = 8;
    level.heroes3["alavi"] waittill( "hallways_heroes_ready" );
    level.heroes3["alavi"] thread cargohold_main_alavi_reach_flash2();
}

cargohold_main_alavi_reach_flash2()
{
    level endon( "cargoholds_1_enter" );
    common_scripts\utility::_id_384A( "cargohold1_flashmoment" );
    wait 0.5;
    self._id_0C72 = "guy";
    self.index = 1;
    self.oldsuppression = self.swimmer;
    self.swimmer = 0;
    maps\_anim::_id_0C24( self, "corner_l_look" );
    level notify( "alavi_looked" );
    maps\_anim::_id_0C24( self, "corner_l_quickreact" );
    thread maps\_anim::_id_0BE1( self, "corner_l_idle", undefined, "stop_loop" );
    level waittill( "flashbang" );
    self notify( "stop_loop" );
    wait 2;
    self.swimmer = self.oldsuppression;
}

cargohold1_breach2( var_0, var_1 )
{
    wait 3;
    level.heroes5["alavi"] _meth_81a7( 1 );
    var_0 maps\_anim::_id_0BF7( level.heroes5["alavi"], "door_breach", "door_breach_setup_idle", "stop_loop" );
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    common_scripts\utility::_id_383F( var_1 );
}

cargohold1_breach()
{
    var_0 = getnode( "cargohold1_door", "targetname" );
    level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
    cargoship_disablealliesreload();
    level.heroes3["price"].a._id_2B20 = 1;
    level.heroes3["alavi"].a._id_2B20 = 1;
    level.heroes3["grigsby"].a._id_2B20 = 1;
    level.heroes3["price"] _meth_8565( 1 );
    level.heroes3["alavi"] _meth_8565( 1 );
    level.heroes3["grigsby"] _meth_8565( 1 );
    level.heroes3["price"] maps\_utility::_id_7E60( 1 );
    level.heroes3["alavi"] maps\_utility::_id_7E60( 1 );
    level.heroes3["grigsby"] maps\_utility::_id_7E60( 1 );
    level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
    level.heroes5["price"]._id_0C72 = "price";
    level.heroes5["grigsby"]._id_0C72 = "grigsby";
    level.heroes5["alavi"]._id_0C72 = "alavi";
    var_1 = getnode( "cargohold1_door_open", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin + ( 15, -40, 0 ) );
    var_2.angles = var_1.angles;
    var_2.unlockpoints = "Cover Right";
    var_3 = spawn( "script_origin", var_2.origin );
    var_3.angles = var_2.angles + ( 0, -13, 0 );
    var_3.unlockpoints = "Guard";
    var_4 = "cargohold1_grigsby_doorbreach";
    var_5 = "cargohold1_price_doorbreach";
    var_6 = "cargohold1_alavi_doorbreach";
    common_scripts\utility::_id_383D( var_4 );
    common_scripts\utility::_id_383D( var_5 );
    common_scripts\utility::_id_383D( var_6 );
    var_2 thread maps\cargoship_code::cargoship_hack_animreach_price( level.heroes5["price"], "door_breach_setup", "door_breach_setup_idle", "stop_loop", var_5 );
    wait 1.5;
    thread cargohold1_breach2( var_2, var_6 );
    var_3 thread maps\cargoship_code::cargoship_hack_animreach_grigsby( level.heroes5["grigsby"], "door_breach_setup", "door_breach_setup_idle", "stop_loop", var_4 );
    common_scripts\utility::_id_384B( var_4, var_5, var_6 );
    maps\mo_tools::radio_msg_stack( "cargoship_grg_readysir" );
    maps\_utility::_id_1143( "cargohold2_breach" );
    var_2 notify( "stop_loop" );
    var_3 notify( "stop_loop" );
    var_2 thread maps\_anim::_id_0C24( level.heroes5["price"], "door_breach_setup" );
    var_3 maps\_anim::_id_0C24( level.heroes5["grigsby"], "door_breach_setup" );
    var_2 thread maps\_anim::_id_0C24( level.heroes5["price"], "door_breach" );
    var_3 thread maps\_anim::_id_0C24( level.heroes5["grigsby"], "door_breach" );
    var_2 thread maps\_anim::_id_0C24( level.heroes5["alavi"], "door_breach" );
    level.heroes5["price"] waittillmatch( "single anim", "kick" );
    maps\_utility::_id_27EF( 0.5, maps\mo_tools::radio_msg_stack, "cargoship_pri_go" );
    var_7 = getent( "cargohold1_door", "targetname" );
    var_8 = getent( var_7._not_team, "targetname" );
    var_8 connectpaths();
    var_8 linkto( var_7 );
    var_7 maps\cargoship_code::door_opens( 0.8 );
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    wait 1;
    level.heroes3["alavi"] _meth_81a7( 1 );
    level.heroes3["alavi"].ignoretriggers = 1;
    wait 0.2;
    level.heroes5["grigsby"] _meth_8143();
    level.heroes3["grigsby"] _meth_81a7( 1 );
    level.heroes3["grigsby"].ignoretriggers = 1;
    level.heroes3["grigsby"]._id_5F65 = 1.0816;
    level.heroes5["grigsby"] thread maps\cargoship_code::hallways_heroes_solo( "cargohold2_enter", "cargohold2_catwalk2", "cargoship_grg_clearleft" );
    level.heroes5["price"] waittillmatch( "single anim", "end" );
    common_scripts\utility::_id_383F( "cargoholds2_breach" );
    level.heroes3["price"]._id_0C72 = "guy";
    level.heroes3["price"] maps\_anim::_id_0C24( level.heroes3["price"], "onme_back" );
    level.heroes3["price"] maps\_anim::_id_0C24( level.heroes3["price"], "cqbstart4" );
    level.heroes3["price"] _meth_81a7( 1 );
    level.heroes3["price"].ignoretriggers = 1;
    var_3 delete();
    var_2 delete();
    cargoship_enablealliesreload();
    level.heroes3["price"].a._id_2B20 = 0;
    level.heroes3["alavi"].a._id_2B20 = 0;
    level.heroes3["grigsby"].a._id_2B20 = 0;
    level.heroes3["price"] _meth_8565( 0 );
    level.heroes3["alavi"] _meth_8565( 0 );
    level.heroes3["grigsby"] _meth_8565( 0 );
    level.heroes3["price"] maps\_utility::_id_7E60( 0 );
    level.heroes3["alavi"] maps\_utility::_id_7E60( 0 );
    level.heroes3["grigsby"] maps\_utility::_id_7E60( 0 );
}

cargohold2_main()
{
    var_0 = getentarray( "cargohold2_catwalk_enemies", "targetname" );
    var_1 = getentarray( "cargohold2_catwalk_enemies2", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::cargohold2_enemies1 );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0798, ::cargohold2_enemies2 );
    thread cargohold2_enemies1_death();
    thread cargohold2_enemies2_death();
    common_scripts\utility::_id_384A( "cargoholds2" );
    maps\_utility::_id_27EF( 1, maps\mo_tools::radio_msg_stack, "cargoship_pri_stackup" );
    thread cargohold1_breach();
    common_scripts\utility::_id_384A( "cargoholds2_breach" );
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    maps\_utility::_id_27EF( 0.25, maps\mo_tools::radio_msg_stack, "cargoship_pri_move" );
    var_2["price"] = 1.0;
    var_2["alavi"] = 0.8;
    var_2["grigsby"] = 0;
    level.heroes3["alavi"] maps\_utility::_id_27EF( 0.5, ::cargohold_catwalk_shuffle );
    level.heroes3["grigsby"] maps\_utility::_id_27EF( 0.5, ::cargohold_catwalk_shuffle );
    level.heroes3["price"] maps\_utility::_id_27EF( 0.5, ::cargohold_catwalk_shuffle );
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk", "cargohold2_catwalk2", undefined, var_2 );
    common_scripts\utility::_id_384A( "cargohold2_catwalk2a" );
    level.heroes3["grigsby"]._id_5F65 = 1;
    level.heroes3["grigsby"].ignoretriggers = 0;
    level.heroes3["alavi"].ignoretriggers = 0;
    level.heroes3["price"].ignoretriggers = 0;
    thread maps\cargoship_code::player_speed_reset( 1 );

    if ( common_scripts\utility::_id_382E( "package_enter" ) )
    {
        thread manifest_light_hack();
        return;
    }

    level endon( "package_enter" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
    var_2["price"] = 0;
    var_2["alavi"] = 0;
    var_2["grigsby"] = 0;
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk2a", "cargohold2_door", undefined, var_2 );
    common_scripts\utility::_id_384A( "cargohold2_catwalk2" );
    thread manifest_light_hack();

    if ( common_scripts\utility::_id_382E( "cargohold2_enemies_dead" ) )
    {
        cargoship_disablealliesreload();
        thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_forwardclear" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_move" );
    }

    var_2["price"] = 3;
    var_2["alavi"] = 2;
    var_2["grigsby"] = 1;
    common_scripts\utility::_id_384A( "cargohold2_enemies_dead" );
    maps\_utility::_id_1143( "cargohold2_enemies_dead" );
    var_3["alavi"] = "cargoship_gm1_clearleft";
    var_3["grigsby"] = "cargoship_grg_clearright";
    var_3["price"] = undefined;
    wait 0.1;
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk2", "cargohold2_door", var_3, var_2 );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stackup" );
    wait 1;
    level.heroes3["price"] thread maps\_utility::_id_4697( "go", 1 );
    common_scripts\utility::_id_383F( "laststand" );
}

cargohold2_enemies1_death()
{
    common_scripts\utility::_id_384A( "cargohold2_enemies" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_movementright" );
    thread maps\_utility::_id_1333( "axis" );
    wait 0.25;
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_0 );
    common_scripts\utility::_id_383F( "cargohold2_catwalk2a" );
}

cargohold2_enemies2_death()
{
    common_scripts\utility::_id_384A( "cargohold2_enemies2" );
    wait 0.25;
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_0 );
    common_scripts\utility::_id_383F( "cargohold2_catwalk2" );
    common_scripts\utility::_id_383F( "cargohold2_enemies_dead" );
}

cargohold2_enemies2()
{
    self endon( "death" );
    common_scripts\utility::_id_383F( "cargohold2_enemies2" );
    thread cargohold2_enemies_common();
    self waittill( "goal" );
    waitframe;
    self.goalradius = 275;
}

cargohold2_enemies1()
{
    self endon( "death" );
    common_scripts\utility::_id_383F( "cargohold2_enemies" );
    thread cargohold2_enemies_common();
    self waittill( "goal" );
    waitframe;
    self.goalradius = 64;
    common_scripts\utility::_id_384A( "cargohold2_catwalk2a" );
    self _meth_81a9( getnode( "cargohold2_enemynode2", "targetname" ) );
    self.goalradius = 275;
}

cargohold2_enemies_common()
{
    self endon( "death" );
    self.grenadeammo = 0;
    self.swimmer = 0;
    self._id_8FEC = 0.75;
    self._id_1300 *= 0.8;
    self.a._id_2B18 = 1;
    common_scripts\utility::_id_384A( "package_enter" );
    self _meth_81a9( getnode( "laststand_friendlynode", "targetname" ) );
    self.goalradius = 800;
}

cargohold_catwalk_shuffle_clean_up( var_0 )
{
    self.shuffling = 0;
    self.a._id_2B20 = 0;
    self _meth_8565( 0 );
    self.allowpain = 1;
    maps\_utility::_id_2A8D();

    if ( isdefined( var_0 ) && var_0 == 1 )
    {
        common_scripts\utility::_id_383F( "cargohold2_catwalk_end_grigsby" );
        common_scripts\utility::_id_383F( "cargohold2_catwalk_end_alavi" );
        common_scripts\utility::_id_383F( "cargohold2_catwalk_end_price" );
        self _meth_81a7( 0 );
    }
}

cargohold_catwalk_shuffle()
{
    self.a._id_2B20 = 1;
    self _meth_8565( 1 );
    self.allowpain = 0;
    common_scripts\utility::_id_383D( "cargohold2_catwalk_end_" + self.script_parentname );
    common_scripts\utility::_id_A06A( self, "hallways_heroes_ready", level, "cargohold2_catwalk2" );

    if ( common_scripts\utility::_id_382E( "cargohold2_catwalk2" ) )
    {
        cargohold_catwalk_shuffle_clean_up( 1 );
        return;
    }

    self._id_0C72 = "shuffle";
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = ( 0, 0, 0 );
    var_1 = getanimlength( level._id_78AC["shuffle"]["arrival"] );
    var_0 thread maps\_anim::_id_0C24( self, "arrival" );
    wait(var_1);
    self _meth_8143();
    var_0.origin = self.origin;
    var_0.angles = ( 0, 270, 0 );
    var_2 = 5;
    self.shuffling = 1;
    self.ignoretriggers = 0;
    self notify( "shuffling" );
    self _meth_8193( "face angle", var_0.angles[1] );
    var_3 = maps\_utility::_id_3EF5( "loop" );
    var_1 = getanimlength( var_3 );
    var_4 = 1.25;
    var_1 *= 1 / var_4;
    self _meth_819e( ::cargohold_catwalk_shuffle_aim );

    while ( var_2 && !common_scripts\utility::_id_382E( "cargohold2_catwalk_end_" + self.script_parentname ) )
    {
        self _meth_814d( var_3, 1, 0.2, var_4 );
        self _meth_814d( %exposed_aiming, 1 );
        wait(var_1);
        var_0.origin = self.origin;

        if ( !common_scripts\utility::_id_382E( "cargohold2_catwalk2a" ) )
            self _meth_81aa( self.origin );

        var_2--;

        if ( self.script_parentname == "grigsby" && common_scripts\utility::_id_382E( "cargohold2_catwalk2a" ) )
        {
            common_scripts\utility::_id_383F( "cargohold2_catwalk_end_" + self.script_parentname );
            common_scripts\utility::_id_383F( "cargohold2_catwalk_end_alavi" );
            continue;
        }

        if ( self.script_parentname == "alavi" && common_scripts\utility::_id_382E( "cargohold2_catwalk_end_" + self.script_parentname ) )
            common_scripts\utility::_id_383F( "cargohold2_catwalk_end_price" );
    }

    cargohold_catwalk_shuffle_clean_up();
    common_scripts\utility::_id_383F( "cargohold2_catwalk2a" );
    var_1 = getanimlength( level._id_78AC["shuffle"]["exit"] );
    var_0 thread maps\_anim::_id_0C24( self, "exit" );
    var_5 = getnotetracktimes( level._id_78AC["shuffle"]["exit"], "finish" );

    if ( var_5.size > 0 )
        var_1 *= var_5[0];

    wait(var_1);
    self _meth_8143();
    self _meth_81a7( 0 );
    var_0 delete();
}

cargohold_catwalk_shuffle_aim()
{
    self endon( "killanimscript" );
    common_scripts\utility::_id_384A( "cargohold2_enemies" );
    thread cargohold_catwalk_shuffle_shoot();

    while ( self.shuffling )
    {
        var_0 = getaiarray( "axis" );

        if ( !var_0.size )
        {
            wait 0.05;
            continue;
        }

        var_1 = common_scripts\utility::_id_710E( var_0 );
        self._id_83F6 = var_1;

        while ( self.shuffling && isalive( var_1 ) )
            animscripts\track::_id_9512();
    }
}

cargohold_catwalk_shuffle_shoot()
{
    while ( self.shuffling )
    {
        if ( self.script_parentname == "grigsby" )
        {
            wait(randomfloatrange( 0.6, 1 ));
            self _meth_81ea();
            continue;
        }

        wait(randomfloatrange( 0.3, 1 ));
        maps\cargoship_code::_id_1935( randomintrange( 6, 10 ) );
    }
}

manifest_light_hack()
{
    var_0 = getent( "manifest_light", "targetname" );
    var_0 _meth_8494( "force_off" );
    var_0 setlightfovrange( 6, 0 );
    common_scripts\utility::_id_384A( "package_open_doors" );
    var_0 _meth_8494( "force_fully_on" );
    var_0 setlightfovrange( 80, 0 );
    common_scripts\utility::_id_384A( "escape_explosion" );
    var_0 _meth_8494( "normal" );
}

laststand_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "laststand" )
        var_0 = "laststand";

    switch ( var_0 )
    {
        case "laststand":
            common_scripts\utility::_id_0D13( getentarray( "cargohold3_enemies1", "targetname" ), maps\_utility::_id_0798, ::laststand_enemies1 );
            common_scripts\utility::_id_0D13( getentarray( "cargohold3_enemies2", "targetname" ), maps\_utility::_id_0798, ::laststand_enemies2 );
            common_scripts\utility::_id_0D13( getentarray( "cargohold3_enemies3", "targetname" ), maps\_utility::_id_0798, ::laststand_enemies3 );
            thread laststand_enemyspawn( "cargohold3_enemies1", "cargohold3_enemies2", 1 );
            thread laststand_enemyspawn( "cargohold3_enemies2", "cargohold3_enemies3", 2 );
            common_scripts\utility::_id_384A( "laststand" );
            common_scripts\utility::_id_0D13( level.heroes3, ::laststand_hero_think );
            thread laststand_clear();
            laststand_breach();
            maps\_utility::_id_27EF( 15, common_scripts\utility::_id_383F, "nade_hint" );
            common_scripts\utility::_id_383F( "package_enter" );
            maps\_utility::_id_1143( "package_enter" );
            thread maps\cargoship_code::player_speed_reset( 1 );
            var_1 = getent( "laststand_red1", "targetname" );
            var_1 notify( "trigger" );
            wait 3;
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    }
}

laststand_hero_think()
{
    thread maps\_utility::_id_2A74();
    common_scripts\utility::_id_384A( "package_enter" );
    self.a._id_2B20 = 0;
    self.ignoretriggers = 0;
    self _meth_81a7( 0 );
    var_0["grigsby"] = 0;
    var_0["alavi"] = 3.5;
    var_0["price"] = 2;
    self.fixednode = 1;
    maps\_utility::_id_27EF( var_0[self.script_parentname], maps\cargoship_code::hallways_heroes_solo, "package_enter", "nothing", undefined, undefined );
    self waittill( "hallways_heroes_ready" );
    self.disablestepout = undefined;
    self.index = 0;
    cargoship_enablealliesreload();
    self _meth_8168( 0 );

    switch ( self.script_parentname )
    {
        case "price":
            wait 2;
            break;
        case "grigsby":
            wait 5;
            break;
        case "alavi":
            wait 10;
            break;
    }

    setsaveddvar( "ai_threatUpdateInterval", 1000 );
    setsaveddvar( "ai_coversearchinterval", 5000 );
    maps\_utility::_id_2A74();
    var_1 = getnode( "laststand_friendlynode", "targetname" );
    self _meth_81a9( var_1 );
    self.goalradius = var_1.rank;
    self waittill( "goal" );
    self.fixednode = 0;
    wait(randomfloatrange( 10, 15 ));
    self.goalradius = 500;

    while ( !common_scripts\utility::_id_382E( "laststand_3left" ) )
    {
        var_2 = getaiarray( "axis" );
        var_3 = common_scripts\utility::_id_3F33( self.origin, var_2 );
        var_4 = clamp( var_3.origin[1], -330, 330 );
        self _meth_81aa( ( var_3.origin[0], var_4, self.origin[2] ) );
        wait(randomfloatrange( 4, 8 ));
    }

    switch ( self.script_parentname )
    {
        case "price":
            self.goalradius = 400;

            while ( !common_scripts\utility::_id_382E( "package" ) )
            {
                var_2 = getaiarray( "axis" );

                if ( !isdefined( var_2 ) || var_2.size == 0 )
                    break;

                var_3 = common_scripts\utility::_id_3F33( self.origin, var_2 );
                self.favoriteenemy = var_3;
                var_4 = clamp( var_3.origin[1], -330, 330 );
                self _meth_81aa( ( var_3.origin[0], var_4, self.origin[2] ) );
                wait(randomfloatrange( 1, 5 ));
            }

            break;
        default:
            self.goalradius = 400;

            while ( !common_scripts\utility::_id_382E( "package" ) )
            {
                self _meth_81aa( level.heroes3["price"].origin );
                wait 1;
            }

            break;
    }

    common_scripts\utility::_id_384A( "package" );
    setsaveddvar( "ai_threatUpdateInterval", 500 );
    setsaveddvar( "ai_coversearchinterval", 2000 );
    self _meth_81aa( self.origin );
    self.goalradius = 64;
}

laststand_breach()
{
    if ( common_scripts\utility::_id_382E( "package_enter" ) )
        return;

    level endon( "package_enter" );
    level.heroes3["price"].a._id_2B20 = 1;
    level.heroes3["alavi"].a._id_2B20 = 1;
    level.heroes3["grigsby"].a._id_2B20 = 1;
    level.heroes3["price"] _meth_8168( 1 );
    level.heroes3["alavi"] _meth_8168( 1 );
    level.heroes3["grigsby"] _meth_8168( 1 );
    level.heroes3["price"].disablestepout = 1;
    var_0["price"] = 2;
    var_0["alavi"] = 1;
    var_0["grigsby"] = 0;
    level.heroes3["price"].ignoretriggers = 1;
    level.heroes3["price"].index = 1;
    level.heroes3["alavi"].ignoretriggers = 1;
    level.heroes3["alavi"].index = 1;
    level.heroes3["grigsby"].ignoretriggers = 1;
    level.heroes3["grigsby"].index = 1;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_standby" );
    level.heroes3["alavi"] thread laststand_msg( "cargoship_gm1_twoready" );
    level.heroes3["grigsby"] thread laststand_msg( "cargoship_grg_oneready" );
    maps\cargoship_code::hallways_heroes( "cargohold2_door", "nothing", undefined, var_0, undefined );
    maps\_utility::_id_1143( "cargohold2b" );
    wait 1;
    maps\_utility::_id_27EF( 3.4, maps\mo_tools::radio_msg_stack, "cargoship_pri_onmymark" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level.heroes3["price"] maps\cargoship_code::cargohold_flashthrow( ( 500, 10, 300 ), 1, 500 );
}

laststand_msg( var_0 )
{
    self waittill( "hallways_heroes_atgoal" );
    maps\mo_tools::radio_msg_stack( var_0 );
}

laststand_enemies_common()
{
    self endon( "death" );
    self.grenadeammo = 0;
    common_scripts\utility::_id_384A( "laststand_3left" );
    wait(randomfloatrange( 0.25, 1.25 ));
    self _meth_81aa( ( 2221, 230, -320 ) );
    self.goalradius = 300;
}

laststand_enemies3()
{
    thread laststand_enemies_common();
}

laststand_enemies2()
{
    thread laststand_enemies_common();
    common_scripts\utility::_id_383F( "package_enter" );
    common_scripts\utility::_id_383F( "laststand" );
}

laststand_enemies1()
{
    thread laststand_enemies_common();
    self endon( "death" );
    self.ignoretriggers = 1;
    self waittill( "goal" );
    waitframe;
    self._id_63DF = self.goalradius;
    self.goalradius = 90;
    common_scripts\utility::_id_384A( "package_enter" );
    self.goalradius = self._id_63DF;
    self.ignoretriggers = 0;
}

laststand_enemyspawn( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "target" );
    var_5 = getent( var_1, "target" );
    var_6 = getentarray( var_0, "targetname" );
    var_5 endon( "trigger" );
    var_4 waittill( "trigger" );
    wait 0.25;
    var_7 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_7, var_6.size - var_2, var_3 );
    var_5 notify( "trigger" );
}

laststand_clear()
{
    var_0 = getent( "cargohold3_enemies3", "target" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "package_enter" );
    wait 0.5;
    var_1 = getaiarray( "axis" );
    maps\_utility::_id_A07E( var_1, var_1.size - 3 );
    common_scripts\utility::_id_383F( "laststand_3left" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2].a._id_2B18 = 1;

    maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.playercardbackground, "cargoship_gm1_tangodown" );
    thread maps\_utility::_id_1332( "axis" );
    common_scripts\utility::_id_383F( "package" );
}

package_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "package" )
        var_0 = "package";

    switch ( var_0 )
    {
        case "package":
            common_scripts\utility::_id_384A( "package" );
            cargoship_disablealliesreload();
            wait 1;
            thread package_dialogue();
            thread package_music();
            common_scripts\utility::_id_384A( "package_report" );
            thread package_grigs();
            thread package_price();
            var_1 = getarraykeys( level.heroes3 );

            for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            {
                var_3 = var_1[var_2];
                level.heroes3[var_3]._id_0C72 = "escape";
            }

            level.heroes3["price"] _meth_81a7( 1 );
            level.heroes3["grigsby"] _meth_81a7( 1 );
            level.heroes3["alavi"] _meth_81a7( 1 );
            var_4 = level.heroes3["alavi"] maps\cargoship_code::hallways_heroes_get_node( "package1" );
            level.heroes3["alavi"] thread package_notify_on_position_reached( var_4 );
            level.heroes3["alavi"] maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
            level.heroes3["alavi"].grenadeawareness = 0;
            common_scripts\utility::_id_383F( "package_reading" );
            level.heroes3["price"].goalradius = 4;
            level.heroes3["price"].goalradius = 4;
            common_scripts\utility::_id_384A( "package_orders" );
            thread maps\cargoship_code::player_speed_set_cargoship( 185, 1 );
            common_scripts\utility::_id_0D13( level.heroes3, maps\_utility::_id_1ED1 );
            common_scripts\utility::_id_383F( "escape" );
            common_scripts\utility::_id_384A( "package_secure" );
            level.heroes3["alavi"].grenadeawareness = 1;
    }
}

package_notify_on_position_reached( var_0 )
{
    while ( distance2d( self.origin, var_0.origin ) > 25 )
        wait 0.75;

    self notify( "goal" );
}

package_grigs()
{
    var_0 = level.heroes3["grigsby"];
    var_0._id_0C72 = "escape";
    var_1 = getent( "package_dooranim_node", "targetname" );
    var_2 = "package_grigs";
    thread package_grigs2( var_0 );
    var_3 = var_0._id_0C78;
    var_0._id_0C78 = 1;
    var_4 = var_0 maps\cargoship_code::hallways_heroes_get_node( "package1" );
    var_0 thread package_notify_on_position_reached( var_4 );

    while ( distance2d( var_0.origin, var_4.origin ) > 25 )
    {
        var_0._id_0D27 = "cover_stand";
        var_0 maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
        wait 0.75;
    }

    var_0 thread maps\_anim::_id_0BCE( var_0, "package_idle_waitinggundown", undefined, "stop_loop_grigs_1st" );
    common_scripts\utility::_id_384A( "package_reading" );
    common_scripts\utility::_id_384A( "strong_reading" );
    var_5 = getent( "h1_player_proximity", "targetname" );
    var_5 common_scripts\utility::_id_97CE();
    var_5 waittill( "trigger" );
    common_scripts\utility::_id_384A( "price_package_ready" );
    wait 0.25;
    common_scripts\utility::_id_383F( "package_open_doors" );
    var_0 thread maps\_anim::_id_0C21( var_0, "cargoship_gaz_takealook" );
    var_0 notify( "stop_loop_grigs_1st" );
    var_1 maps\_anim::_id_0BC9( var_0, var_2 );
    var_0._id_0C78 = var_3;
    var_1 thread maps\_anim::_id_0BCE( var_0, "package_idle_grigs", undefined, "stop_loop_grigs_2nd" );
    common_scripts\utility::_id_384A( "package_secure" );
    var_1 notify( "stop_loop_grigs_2nd" );
    var_0 _meth_8143();
}

package_grigs2( var_0 )
{
    wait 1.25;
    var_0 maps\_anim::_id_0C21( var_0, "cargoship_grg_strongreading" );
    common_scripts\utility::_id_383F( "strong_reading" );
    common_scripts\utility::_id_384A( "package_open_doors" );
    wait 10.37;
    var_0 _meth_81a7( 1 );
    var_0 _meth_81aa( var_0.origin );
    var_0.goalradius = 4;
    common_scripts\utility::_id_383F( "found_package" );
}

package_price()
{
    var_0 = level.heroes3["price"];
    var_1 = getent( "package_dooranim_node", "targetname" );
    var_2 = var_0._id_0C78;
    var_0._id_0C78 = 1;
    var_3 = var_0 maps\cargoship_code::hallways_heroes_get_node( "package1" );
    var_0 thread package_notify_on_position_reached( var_3 );

    while ( distance2d( var_0.origin, var_3.origin ) > 25 )
    {
        var_0._id_0D27 = "cover_stand";
        var_0 maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
        wait 0.75;
    }

    var_0 thread maps\_anim::_id_0BCE( var_0, "package_idle_waitinggundown", undefined, "stop_loop_price_1st" );
    wait 0.25;
    common_scripts\utility::_id_383F( "price_package_ready" );
    common_scripts\utility::_id_384A( "package_open_doors" );
    var_0 notify( "stop_loop_price_1st" );
    var_0 _id_7F88( level.price_normal_headmodel );
    var_1 maps\_anim::_id_0BC9( var_0, "package_opendoor_price" );
    var_0._id_0C78 = var_2;
    var_1 thread maps\_anim::_id_0BCE( var_0, "package_idle_price", undefined, "stop_loop_price_2nd" );
    common_scripts\utility::_id_384A( "package_secure" );
    var_1 notify( "stop_loop_price_2nd" );
    var_0 _meth_8143();
    var_0 _meth_814e( %price_mask_up, 1 );
    var_0 _meth_814e( %h1_cargoship_price_mask_outloop, 1 );
}

package_open_doors( var_0 )
{
    var_1 = getent( "package_door_left", "targetname" );
    var_1 thread package_doorsetup();
    var_2 = getent( "package_door_right", "targetname" );
    var_2 thread package_doorsetup();
    wait 0.1;
    var_3 = spawn( "script_model", var_1._id_577B.origin );
    var_3.angles = ( 0, 0, 0 );
    var_3 setmodel( "cs_container_door_joint" );
    var_3 useanimtree( #animtree );
    var_1 linkto( var_3, "tag_animate" );
    var_4 = spawn( "script_model", var_2._id_577B.origin );
    var_4.angles = ( 0, 0, 0 );
    var_4 setmodel( "cs_container_door_joint" );
    var_4 useanimtree( #animtree );
    var_2 linkto( var_4, "tag_animate" );
    var_3._id_0C72 = "generic";
    var_4._id_0C72 = "generic";
    var_0 thread maps\_anim::_id_0BC7( var_3, "package_doorL" );
    var_0 thread maps\_anim::_id_0BC7( var_4, "package_doorR" );
    common_scripts\utility::_id_384A( "package_open_doors" );
    var_2 connectpaths();
    var_1 connectpaths();
    var_0 thread maps\_anim::_id_0BC9( var_3, "package_doorL" );
    var_0 maps\_anim::_id_0BC9( var_4, "package_doorR" );
    var_2 thread door_player_clip();
    var_1 thread door_player_clip();
    var_2 unlink();
    var_1 unlink();
    var_3 delete();
    var_4 delete();
    waitframe;
    var_1 notify( "sway" );
    var_2 notify( "sway" );
    common_scripts\utility::_id_383F( "aud_package_door_creaks" );
    var_0 delete();
}

package_dialogue()
{
    var_0 = level.heroes3["price"];
    var_1 = level.heroes3["grigsby"];
    thread package_radiation();
    maps\mo_tools::radio_msg_stack( "cargoship_pri_report" );
    maps\mo_tools::radio_msg_stack( "cargoship_grg_rogerthat" );
    common_scripts\utility::_id_383F( "package_report" );
    common_scripts\utility::_id_384A( "found_package" );
    common_scripts\utility::_id_384A( "radiomessage_notime" );
    common_scripts\utility::_id_383F( "music_tension_notime" );
    maps\mo_tools::radio_msg_stack( "cargoship_hqr_notime" );
}

package_music()
{
    level endon( "cargoship_escape_music" );
    common_scripts\utility::_id_384A( "music_tension_notime" );
    soundscripts\_snd::_id_870C( "aud_start_mix_npc_pre_explosion" );
    musicstop();
    wait 2;

    for (;;)
    {
        maps\_utility::_id_6008( "tension_maintheme_groove" );
        wait 47;
    }
}

package_radiation()
{
    var_0 = spawn( "script_origin", ( 2477.2, 198, -311 ) );
    var_1 = "none";

    while ( !common_scripts\utility::_id_382E( "escape_explosion" ) )
    {
        var_2 = distance( level.playercardbackground.origin, var_0.origin );

        if ( var_2 > 300 )
        {
            var_1 = "none";
            var_0 stoploopsound();
        }
        else if ( var_2 < 150 && var_1 != "item_geigercouner_level2" )
        {
            var_0 stoploopsound();
            var_1 = "item_geigercouner_level2";
            var_0 playloopsound( var_1 );
        }
        else if ( var_1 != "item_geigercouner_level1" )
        {
            var_0 stoploopsound();
            var_1 = "item_geigercouner_level1";
            var_0 playloopsound( var_1 );
        }

        wait 0.1;
    }

    var_0 stoploopsound();
    waitframe;
    var_0 delete();
}

package_doorsetup()
{
    var_0 = getentarray( self.teambalanced, "target" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] linkto( self );

    var_2 = common_scripts\utility::_id_40FB( self._not_team, "targetname" );
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3.axial = 1;
    var_4 = var_2.origin;
    var_5 = undefined;
    var_6 = anglestoup( var_2.angles );
    var_6 = maps\_utility::vector_multiply( var_6, 10 );

    if ( issubstr( self._not_team, "right" ) )
        var_5 = var_4 - var_6;
    else
        var_5 = var_4 + var_6;

    var_7 = ( 0, 360, 0 );
    var_8 = var_2.angles;
    var_3.origin = var_4;
    var_3.angles = vectortoangles( var_5 - var_4 );
    var_3.pratio = 1;
    var_3.rratio = -1;
    var_3.sway1max = 20;
    var_3.sway2max = 20;
    var_3.setscale = undefined;
    self._id_577B = var_3;
    self waittill( "sway" );
    self linkto( var_3 );
    maps\_sea::sea_objectbob_logic( level._sea_org, var_3 );
}

escape_main()
{
    common_scripts\utility::_id_384A( "escape" );
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 3.0 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 3.0 );
    level.heroes5["price"].grenadeawareness = 0;
    level.heroes5["price"] _meth_8565( 1 );
    level.heroes5["price"].a._id_2B20 = 1;
    level.heroes5["price"].allowpain = 0;
    level.heroes5["grigsby"].grenadeawareness = 0;
    level.heroes5["grigsby"] _meth_8565( 1 );
    level.heroes5["grigsby"].a._id_2B20 = 1;
    level.heroes5["grigsby"].allowpain = 0;
    level.heroes5["alavi"].grenadeawareness = 0;
    level.heroes5["alavi"] _meth_8565( 1 );
    level.heroes5["alavi"].a._id_2B20 = 1;
    level.heroes5["alavi"].allowpain = 0;
    maps\cargoship_code::water_stuff_for_art1( 1 );
    thread maps\cargoship_code::water_stuff_for_art2( 0 );
    common_scripts\utility::_id_383F( "escape_cargohold2_fx" );
    common_scripts\utility::_id_383F( "final_sun_direction" );
    maps\cargoship_code::escape_heroes_turn_setup();
    maps\cargoship_code::escape_heroes_runanim_setup();
    thread maps\cargoship_code::escape_fx_setup();
    thread maps\cargoship_code::escape_tiltboat();
    thread escape_dialogue();
    thread maps\cargoship_code::escape_catwalk();
    thread maps\cargoship_code::escape_hallways_lower_flood();
    thread escape_seaknight();
    thread maps\cargoship_code::escape_autosaves();
    thread maps\cargoship_code::escape_invisible_timer();
    common_scripts\utility::_id_0D13( getentarray( "cargohold_debri", "targetname" ), maps\cargoship_code::escape_debri );
    common_scripts\utility::_id_0D13( getentarray( "escape_event", "targetname" ), maps\cargoship_code::escape_event );
    common_scripts\utility::_id_0D13( getentarray( "light_cargohold", "targetname" ), maps\cargoship_code::misc_light_flicker, "cargo_vl_white", "cargohold_fx", "escape_explosion" );
    common_scripts\utility::_id_0D13( getentarray( "lights_cargohold_up", "targetname" ), maps\cargoship_code::misc_light_flicker, "cargo_vl_white_soft", "cargohold_fx", "escape_explosion" );
    common_scripts\utility::_id_0D13( getentarray( "lights_hallway_lower", "targetname" ), maps\cargoship_code::misc_light_flicker, undefined, "cargohold_fx", "escape_explosion" );
    common_scripts\utility::_id_384A( "package_secure" );
    level.heroes3["price"]._id_0C72 = "escape";
    level.heroes3["grigsby"]._id_0C72 = "escape";
    level.heroes3["alavi"]._id_0C72 = "escape";
    level.heroes3["price"] thread maps\mo_tools::anim_single_stack( level.heroes3["price"], "cargoship_pri_topside" );
    var_0 = [];
    var_0[var_0.size] = level.heroes3["price"];
    var_0[var_0.size] = level.heroes3["alavi"];
    var_0[var_0.size] = level.heroes3["grigsby"];
    level.heroes3["price"] maps\_utility::_id_32DD( "turning" );
    level.heroes3["grigsby"] maps\_utility::_id_32DD( "turning" );
    level.heroes3["alavi"] maps\_utility::_id_32DD( "turning" );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_0, 100, undefined, undefined, 1 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 450, var_0, 100, undefined, undefined, 1 );
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 300, var_0, 100, undefined, undefined, 1 );
    common_scripts\utility::_id_0D13( level.heroes3, maps\cargoship_code::escape_heroes );
    common_scripts\utility::_id_0D13( getentarray( "sink_waterlevel", "targetname" ), maps\cargoship_code::escape_waterlevel );
    common_scripts\utility::_id_0D13( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::_id_97CE );
    thread maps\cargoship_code::escape_explosion();
    common_scripts\utility::_id_383F( "escape_exterior_visionset" );
    var_1 = getentarray( "escape_stair_blocker", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] show();
        var_1[var_2] solid();

        if ( var_1[var_2].specialgrenade & 1 )
            var_1[var_2] disconnectpaths();
    }

    var_3 = getent( "player_end_water_clip", "targetname" );
    var_3 solid();
    common_scripts\utility::_id_384A( "escape_explosion" );
    level.heroes3["price"] maps\_utility::_id_27EF( 14, ::_id_7F88, "head_sas_ct_assault_price_mask_up_wrinkle" );
    thread end_sinking_scenario_vfx();
    level.heroes3["price"] _meth_814e( %price_mask_up, 0 );
    thread maps\cargoship_code::showgasmaskcracks();
    thread maps\cargoship_lighting::activate_emergency_lights();
    common_scripts\utility::_id_0D13( level.heroes3, maps\cargoship_code::escape_heroes2 );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks_gaz_alavi" );
    level.heroes3["alavi"] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    level.heroes3["grigsby"] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks_price" );
    level.heroes3["price"] maps\_utility::_id_27EF( 4, ::_id_7F88, level.price_normal_headmodel );
    maps\cargoship_code::player_speed_set_cargoship( 80, 0.25 );
    maps\_utility::_id_27EF( 0.5, maps\cargoship_code::player_speed_set_cargoship, 175, 3.5 );
    thread maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_escape" );
    wait 1;
    level.heroes3["price"] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 500, var_0, 200 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 400, var_0, 150 );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_0, 150 );
    var_4 = getarraykeys( level.heroes3 );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        var_5 = var_4[var_2];
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_cargohold2b" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_cargohold1" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_lower" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerb" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerc" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerd" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowere" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_upper" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_hallway_upperb" );
        level.heroes3[var_5] thread maps\_utility::_id_3AF2( maps\cargoship_code::escape_heroes_run, "escape_aftdeck" );
    }

    wait 0.55;
    level.heroes3["price"] _meth_814e( %price_mask_up, 1 );
    maps\cargoship_code::escape_sneakyslowplayer_underwaterfall();
    thread end_main();
}

_id_7F88( var_0 )
{
    if ( isdefined( self.headmodel ) )
        self detach( self.headmodel );

    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

end_main()
{
    var_0 = getent( "escape_end_anim_node", "targetname" );
    thread end_jump();
    thread end_nojump();
    thread end_anim_thread();
    thread maps\cargoship_code::end_handle_player_fall();
    common_scripts\utility::_id_384A( "escape_hallway_upper_flag" );
    var_1 = level.seaknight.motiontrackerenabled;
    var_2 = level.heroes3["price"];
    thread end_dialogue();
    common_scripts\utility::_id_384A( "escape_aftdeck_flag" );

    while ( distance( level.playercardbackground.origin, var_2.origin ) > 800 )
        wait 0.05;

    level.heroes3["alavi"] thread maps\_utility::_id_3AF2( ::escape_heroes_rescue );
    level.heroes3["grigsby"] maps\_utility::_id_27EF( 0.5, maps\_utility::_id_3AF2, ::escape_heroes_rescue );
    level.heroes3["price"] maps\_utility::_id_27EF( 1.0, maps\_utility::_id_3AF2, ::escape_heroes_rescue );
    var_3 = [];
    var_3[var_3.size] = level.heroes3["price"];
    var_3[var_3.size] = level.heroes3["alavi"];
    var_3[var_3.size] = level.heroes3["grigsby"];
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 500, var_3, 200, 1.1 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 400, var_3, 150, 1.1 );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_3, 150, 1.1, 1 );
    thread maps\cargoship_code::player_speed_set_cargoship( 165, 1 );
    level endon( "mission_failed" );
    common_scripts\utility::_id_384A( "end_start_player_anim" );
    thread seaknight_rescue_dof();
    level.heroes5["price"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes5["alavi"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes5["grigsby"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes5["seat5"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.heroes5["seat6"] common_scripts\utility::_id_4853( "end_screen_done" );
    level.playercardbackground freezecontrols( 1 );
    level.fogvalue["near"] = 500;
    level.fogvalue["half"] = 15000;
    var_4 = maps\_utility::_id_88D1( "end_hands" );
    var_4 hide();
    var_1 maps\_anim::_id_0BC7( var_4, "player_rescue", "tag_detach" );
    var_4 linkto( var_1, "tag_detach" );
    var_5 = 0.25;
    level._sea_org rotateto( ( 0, 0, 0 ), var_5 );
    thread maps\_utility::_id_3832( "_sea_viewbob", var_5 );
    var_6 = spawn( "script_origin", level.playercardbackground.origin );
    var_6.origin = level.playercardbackground maps\_utility::_id_3E24();
    var_6.angles = level.playercardbackground getgunangles();
    level.playercardbackground playerlinktoabsolute( var_6, undefined );
    var_7 = var_4 gettagorigin( "tag_player" );
    var_8 = var_4 gettagangles( "tag_player" );
    var_6 moveto( var_7, var_5 );
    var_6 rotateto( var_8, var_5 );
    wait(var_5);
    var_6 delete();
    var_4 show();
    level.playercardbackground playerlinktoabsolute( var_4, "tag_player", 1 );
    common_scripts\utility::_id_383F( "end_linked_player_to_rig" );
    maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_outro", 1 );
    end_reduce_all_dynamic_lights();
    var_0 notify( "stop_loop_heli" );
    var_0 thread maps\_anim::_id_0C24( var_1, "out" );
    var_2 linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::_id_0BC9( var_2, "help_price", "tag_detach" );
    var_1 thread maps\_anim::_id_0C24( var_4, "player_rescue", "tag_detach" );
    level.heroes3["alavi"] linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::_id_0BC9( level.heroes3["alavi"], "help_alavi", "tag_detach" );
    level.heroes3["grigsby"] linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::_id_0BC9( level.heroes3["grigsby"], "help_grigsby", "tag_detach" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    common_scripts\utility::_id_384A( "gotcha" );
    end_scene_setup();
    common_scripts\utility::_id_384A( "end_finished" );
    thread end_screen();
}

end_anim_thread()
{
    common_scripts\utility::_id_384A( "escape_seaknight_ready" );
    var_0 = level.seaknight.motiontrackerenabled;
    var_1 = level.heroes3["price"];
    var_2 = getent( "escape_end_anim_node", "targetname" );
    common_scripts\utility::_id_384A( "escape_seaknight_flag" );
    var_0 maps\_utility::_id_27EF( 1, common_scripts\utility::_id_6975, "seaknight_idle_high" );
    var_0 thread maps\cargoship_code::seaknight_playlightfx();
    var_2 maps\_anim::_id_0C24( var_0, "in" );

    if ( !common_scripts\utility::_id_382E( "end_price_rescue_anim" ) )
        var_2 thread maps\_anim::_id_0BE1( var_0, "idle", undefined, "stop_loop_heli" );

    common_scripts\utility::_id_384A( "escape_player_near_end" );
    common_scripts\utility::_id_384A( "escape_alavi_loading" );
    wait 1.6;

    if ( distance( level.playercardbackground.origin, var_1.origin ) < 512 )
        thread maps\cargoship_code::escape_player_last_quake();

    thread end_heli_drift_anim_thread( var_0, var_2 );
    var_1 _meth_814e( %price_mask_up, 0 );
    common_scripts\utility::_id_384A( "end_price_rescue_anim" );
    common_scripts\utility::_id_384A( "escape_price_start_rescue" );
    var_2 maps\_anim::_id_0BC9( var_1, "rescue_price" );
    var_1 linkto( var_0, "tag_detach" );

    if ( !common_scripts\utility::_id_382E( "end_start_player_anim" ) )
        var_0 thread maps\_anim::_id_0BCE( var_1, "rescue_price_idle", "tag_detach", "stop_loop_price" );

    common_scripts\utility::_id_3856( "end_start_player_anim", 3 );

    if ( common_scripts\utility::_id_382E( "end_start_player_anim" ) )
    {
        common_scripts\utility::_id_384A( "end_linked_player_to_rig" );
        return;
    }

    common_scripts\utility::_id_383F( "end_seaknight_leaving" );
    maps\_utility::_id_27EF( 5, maps\cargoship_code::escape_mission_failed );
    thread common_scripts\utility::_id_69C2( "elm_wave_crash_ext", ( -3392, 656, -64 ) );
    common_scripts\_exploder::_id_3528( "900" );
    level._id_4AC8["text"].alpha = 0;
    var_2 notify( "stop_loop_heli" );
    var_0 notify( "stop_loop_price" );
    var_2 thread maps\_anim::_id_0C24( var_0, "out" );
}

end_heli_drift_anim_thread( var_0, var_1 )
{
    level endon( "end_start_player_anim" );
    var_1 notify( "stop_loop_heli" );
    var_1 maps\_anim::_id_0C24( var_0, "drift" );
    var_1 thread maps\_anim::_id_0BE1( var_0, "drift_idle", undefined, "stop_loop_heli" );
}

end_scene_setup()
{
    if ( getdvar( "new_end_scene" ) == "1" )
        return;
}

seaknight_rescue_dof()
{
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 1.0, 180, 2.0, 2.0 );
    wait 0.65;
    setsaveddvar( "r_mbEnable", 2 );
    wait 0.7;
    level.playercardbackground _meth_84a7( 1.0, 180, 9.0, 9.0 );
    wait 0.76;
    level.playercardbackground _meth_84a7( 0.8, 85, 4.0, 4.0 );
    wait 0.6;
    level.playercardbackground _meth_84a7( 1.6, 36, 1.0, 1.0 );
    wait 1.1;
    level.playercardbackground _meth_84a7( 2.4, 22, 8.0, 8.0 );
    wait 0.56;
    level.playercardbackground _meth_84a7( 2.0, 17.5, 6.0, 6.0 );
    wait 0.74;
    level.playercardbackground _meth_84a7( 0.8, 35.0, 8.0, 8.0 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 24, 7.0, 0.5, 0.5 );
    wait 1.16;
    level.playercardbackground _meth_84a7( 0.7, 800, 8.0, 8.0 );
    wait 18.0;
    level.playercardbackground _meth_84a6();
    setsaveddvar( "r_mbEnable", 0 );
}

escape_heroes_rescue()
{
    thread escape_heroes_rescuing_order();
    maps\_utility::_id_1ED1();
    var_0 = getent( "escape_end_anim_node", "targetname" );
    var_1 = level.seaknight.motiontrackerenabled;
    var_2 = "rescue_" + self.script_parentname;
    var_3 = var_2 + "_idle";
    var_4 = "stop_loop" + self.script_parentname;

    if ( self.script_parentname == "price" )
    {
        var_0 maps\_anim::_id_0BD0( self, "reach_price" );
        common_scripts\utility::_id_383F( "end_price_rescue_anim" );
    }
    else
    {
        var_0 maps\_anim::_id_0BD0( self, var_2 );

        if ( self.script_parentname == "alavi" )
        {
            common_scripts\utility::_id_384A( "escape_alavi_start_rescue" );
            common_scripts\utility::_id_383F( "escape_alavi_loading" );
        }
        else if ( self.script_parentname == "grigsby" )
            common_scripts\utility::_id_384A( "escape_gaz_start_rescue" );

        var_0 maps\_anim::_id_0BC9( self, var_2 );
        self linkto( var_1, "tag_detach" );
        var_1 thread maps\_anim::_id_0BCE( self, var_3, "tag_detach", var_4 );
    }
}

escape_heroes_rescuing_order()
{
    common_scripts\utility::_id_384A( "escape_player_near_end" );
    common_scripts\utility::_id_383F( "escape_alavi_start_rescue" );
    wait 0.7;
    common_scripts\utility::_id_383F( "escape_gaz_start_rescue" );
    wait 0.1;
    common_scripts\utility::_id_383F( "escape_price_start_rescue" );
}
#using_animtree("vehicles");

escape_seaknight()
{
    common_scripts\utility::_id_384A( "escape_hallway_lower_flag" );
    var_0 = getent( "escape_end_anim_node", "targetname" );
    level.seaknight = maps\cargoship_code::seaknight_spawn( var_0 );
    var_1 = spawn( "script_model", level.seaknight.motiontrackerenabled gettagorigin( "body_animate_jnt" ) );
    var_1 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_1.angles = level.seaknight.motiontrackerenabled.angles;
    var_1 linkto( level.seaknight.motiontrackerenabled, "body_animate_jnt" );
    var_2 = spawn( "script_model", level.seaknight.motiontrackerenabled gettagorigin( "body_animate_jnt" ) );
    var_2 setmodel( "vehicle_ch46e_wires" );
    var_2.angles = level.seaknight.motiontrackerenabled.angles;
    var_2 linkto( level.seaknight.motiontrackerenabled, "body_animate_jnt" );
    var_3 = spawn( "script_model", level.seaknight.motiontrackerenabled gettagorigin( "tag_cs_alarm" ) );
    var_3 setmodel( "h1_cs_light_alarm_short" );
    var_3.angles = level.seaknight.motiontrackerenabled.angles;
    var_3 addroll( 180 );
    var_3 linkto( level.seaknight.motiontrackerenabled, "tag_cs_alarm" );
    var_4 = level.heroes5["seat5"];
    var_4._id_0C72 = var_4.script_parentname;
    var_4 linkto( level.seaknight.motiontrackerenabled, "tag_detach" );
    level.seaknight.motiontrackerenabled thread maps\_anim::_id_0BE1( var_4, "rescue", "tag_detach", "never_stop" );
    var_4 = level.heroes5["seat6"];
    var_4._id_0C72 = var_4.script_parentname;
    var_4 linkto( level.seaknight.motiontrackerenabled, "tag_detach" );
    level.seaknight.motiontrackerenabled thread maps\_anim::_id_0BE1( var_4, "rescue", "tag_detach", "never_stop" );
    level.seaknight.motiontrackerenabled useanimtree( #animtree );
    level.seaknight.motiontrackerenabled _meth_814d( %sniper_escape_ch46_rotors );
    common_scripts\utility::_id_383F( "escape_seaknight_ready" );
}

end_jump()
{
    level endon( "player_rescued" );
    level endon( "end_seaknight_leaving" );
    var_0 = getent( "escape_player_jump", "targetname" );
    notifyoncommand( "jump", "+gostand" );
    notifyoncommand( "jump", "+moveup" );
    var_0 thread end_jump_mantle();
    var_0 waittill( "trigger" );

    for (;;)
    {
        level.playercardbackground waittill( "jump" );

        if ( level.playercardbackground istouching( var_0 ) && level.playercardbackground getstance() == "stand" && end_mantle_angle() )
            break;
    }

    level._id_4AC8["text"].alpha = 0;
    common_scripts\utility::_id_383F( "end_start_player_anim" );
    soundscripts\_snd::_id_870C( "start_mix_final_jump" );
}

end_mantle_angle()
{
    var_0 = level.playercardbackground getplayerangles();
    var_1 = anglestoforward( var_0 );
    var_2 = vectornormalize( level.seaknight.motiontrackerenabled.origin - level.playercardbackground.origin );

    if ( vectordot( var_1, var_2 ) > 0.75 )
        return 1;
    else
        return 0;
}

end_jump_mantle()
{
    level endon( "end_start_player_anim" );
    level endon( "end_seaknight_leaving" );

    if ( getdvarint( "e3_cargoship_gameplay_video", 0 ) != 0 )
    {
        level._id_4AC8["text"].alpha = 0;
        return;
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( end_mantle_angle() )
        {
            level._id_4AC8["text"].font = "timer";
            level._id_4AC8["text"].fontscale = 0.5;
            level._id_4AC8["text"].alpha = 1;
        }

        while ( level.playercardbackground istouching( self ) && end_mantle_angle() )
            wait 0.05;

        level._id_4AC8["text"].alpha = 0;
    }
}

end_nojump()
{
    level endon( "player_rescued" );
    level endon( "end_seaknight_leaving" );
    var_0 = getent( "escape_player_nojump", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_383F( "end_no_jump" );
        level.playercardbackground allowjump( 0 );

        while ( level.playercardbackground istouching( var_0 ) )
            wait 0.05;

        level.playercardbackground allowjump( 1 );
    }
}

end_music()
{
    common_scripts\utility::_id_384A( "cargoship_end_music" );
    musicstop();
    soundscripts\_snd::_id_870C( "start_mix_finale_music" );
    wait 0.1;
    maps\_utility::_id_6008( "cargoship_finale_music" );
}

end_dialogue()
{
    var_0 = level.heroes3["grigsby"];
    var_1 = level.heroes3["price"];
    common_scripts\utility::_id_384A( "escape_seaknight_flag" );
    wait 1;
    var_0 maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_whereisit" );
    common_scripts\utility::_id_384A( "end_no_jump" );
    maps\mo_tools::radio_msg_stack( "cargoship_gm2_jumpforit" );
    common_scripts\utility::_id_384A( "end_linked_player_to_rig" );
    wait 3.7;
    thread end_music();
    common_scripts\utility::_id_383F( "gotcha" );
    thread end_sink_ship();
    wait 2;
    soundscripts\_snd::_id_870C( "aud_get_in_seaknight" );
    maps\mo_tools::radio_msg_stack( "cargoship_pri_allaboard" );
    common_scripts\utility::_id_383F( "player_rescued" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_outtahere" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_returntobase" );
    thread common_scripts\utility::_id_69C2( "scn_heli_jump_final_thunder_lr", ( 0, 0, 0 ) );
    maps\_utility::_id_3840( "end_finished", 2 );
}

end_sinking_scenario_vfx()
{
    var_0 = maps\_utility::_id_3FA9( "falling_drip_faucet" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "water_pipe_leak_interior_loop" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "water_pipe_leak_interior_loop_cgoshp" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "steam_pipe_leak_interior_loop_sml" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "steam_pipe_leak_interior_loop_med" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "steam_pipe_leak_interior_loop_lrg" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "steam_pipe_leak_interior_loop_cgoshp_red" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "light_mist_ceiling_cgoshp" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_door_grays_white_stairs_cgoshp" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "heavy_mist_cgoshp" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();

    wait 6.0;
    common_scripts\_exploder::_id_3528( "602" );
    wait 5.0;
    common_scripts\_exploder::_id_3528( "452" );
    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    common_scripts\_exploder::_id_3528( "451" );
    common_scripts\_exploder::_id_3528( "453" );
    wait 2.0;
    maps\_utility::_id_8E7E( "400" );
    maps\_utility::_id_8E7E( "401" );
    maps\_utility::_id_8E7E( "402" );
    maps\_utility::_id_8E7E( "602" );
    common_scripts\utility::_id_384A( "escape_hallway_lower_flood" );
    common_scripts\_exploder::_id_3528( "454" );
    common_scripts\_exploder::_id_3528( "455" );
    maps\_utility::_id_8E7E( "451" );
    maps\_utility::_id_8E7E( "452" );
    common_scripts\utility::_id_384A( "escape_hallway_upper_flag" );
    common_scripts\utility::_id_3831( "_weather_lightning_enabled" );
    maps\_utility::_id_8E7E( "453" );
    var_2 = maps\_utility::_id_3FA9( "cgoshp_drips_a" );
    var_2 = common_scripts\utility::_id_0CDD( var_2, maps\_utility::_id_3FA9( "cgoshp_drips_b" ) );
    var_2 = common_scripts\utility::_id_0CDD( var_2, maps\_utility::_id_3FA9( "water_sweeping_cgoshp" ) );
    var_2 = common_scripts\utility::_id_0CDD( var_2, maps\_utility::_id_3FA9( "water_sweeping_cgoshp_sml" ) );
    var_3 = maps\_utility::_id_3FA9( "escape_waterdrips_exterior" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1] common_scripts\utility::_id_671F();

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        var_3[var_1] maps\_utility::_id_748D();

    common_scripts\utility::_id_384A( "escape_aftdeck_flag" );
    common_scripts\_exploder::_id_3528( "456" );
    var_4 = 2.4;
    maps\_utility::_id_27EF( var_4, maps\_weather::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::_id_3528( "20" );
    common_scripts\utility::_id_384A( "escape_seaknight_flag" );
    maps\_utility::_id_8E7E( "455" );
    var_4 = 5.2;
    maps\_utility::_id_27EF( var_4, maps\_weather::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::_id_3528( "21" );
    common_scripts\utility::_id_384A( "end_start_player_anim" );
    maps\_utility::_id_8E7E( "454" );
    maps\_utility::_id_8E7E( "456" );
    common_scripts\_exploder::_id_3528( "901" );
    common_scripts\utility::_id_3831( "player_weather_enabled" );
    playfxontag( level._effect["rain_heavy_mist_heli_hack_2"], level.seaknight.motiontrackerenabled, "tag_light_cargo01" );
    wait 0.8;
    common_scripts\utility::_id_383F( "cargoship_rain_off" );
    common_scripts\utility::_id_3831( "cargoship_rain_on" );
    common_scripts\utility::_id_384A( "gotcha" );
    var_5 = 10.6;
    var_6 = 0.15;
    var_7 = 0.2;
    var_8 = 0.1;
    var_9 = 0.05;
    var_10 = 0.1;
    var_11 = 0.12;
    var_12 = maps\_utility::_id_3FA9( "cgoshp_light_tip_red" );
    var_12 = common_scripts\utility::_id_0CDD( var_12, maps\_utility::_id_3FA9( "cgoshp_light_tip_green" ) );
    var_12 = common_scripts\utility::_id_0CDD( var_12, maps\_utility::_id_3FA9( "cgoshp_light_tip_white" ) );
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "spotlights", "targetname" ), ::end_sinking_spotlight_fx, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3FA9( "cgoshp_lights_cr_fly_light" ), ::end_sinking_light_fx, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    common_scripts\utility::_id_0D13( var_12, ::end_sinking_light_fx, var_5, var_6, var_7, var_8, var_9, var_10, 0.05 );
    wait 3.0;
    common_scripts\_exploder::_id_3528( "902" );
    wait 0.3;
    common_scripts\_exploder::_id_3528( "1001" );
    earthquake( 0.25, 0.5, level.playercardbackground.origin, 80000 );
    thread common_scripts\utility::_id_69C2( "cargoship_jumpforheli_end_explo", level.playercardbackground.origin );
    wait 0.4;
    common_scripts\_exploder::_id_3528( "1002" );
    wait 0.15;
    earthquake( 0.15, 0.8, level.playercardbackground.origin, 80000 );
    var_4 = 0.65;
    maps\_utility::_id_27EF( var_4, maps\_weather::_id_5741, maps\cargoship_fx::notifyname, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::_id_3528( "25" );
    wait 0.2;
    common_scripts\_exploder::_id_3528( "24" );
    wait 1.4;
    common_scripts\_exploder::_id_3528( "1003" );
    wait 0.3;
    common_scripts\_exploder::_id_3528( "1005" );
    wait 0.15;
    earthquake( 0.1, 1, level.playercardbackground.origin, 80000 );
    wait 0.85;
    common_scripts\_exploder::_id_3528( "1004" );
    wait 4.2;
    common_scripts\_exploder::_id_3528( "903" );
}

end_sinking_spotlight_fx( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    killfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
    playfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_0);
    wait(randomfloat( var_6 ));
    playfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_high" ), self.tagent, "tag_origin" );
    wait(var_1);
    killfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_2);
    playfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_3);
    killfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_4);
    playfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_low" ), self.tagent, "tag_origin" );
    wait(var_5);
    killfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr_low" ), self.tagent, "tag_origin" );
}

end_sinking_light_fx( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    maps\_utility::_id_748D();
    wait(var_0);
    wait(randomfloat( var_6 ));
    wait(var_1);
    common_scripts\utility::_id_671F();
    wait(var_2);
    maps\_utility::_id_748D();
    wait(var_3);
    common_scripts\utility::_id_671F();
    wait(var_4);
    maps\_utility::_id_748D();
    wait(var_5);
    common_scripts\utility::_id_671F();
}

end_reduce_all_dynamic_lights()
{
    var_0 = getentarray( "light_spot", "classname" );
    var_1 = getentarray( "light_omni", "classname" );
    var_2 = common_scripts\utility::_id_0CDD( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_4 setlightintensity( 1 );
        var_4 setlightradius( 12 );
        var_4 setlightfovrange( 6, 0 );
    }
}

escape_dialogue()
{
    var_0 = level.heroes3["grigsby"];
    var_1 = level.heroes3["price"];
    common_scripts\utility::_id_384A( "escape_moveup1" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_status" );
    var_2 = spawn( "script_origin", level.playercardbackground.origin );
    var_2 linkto( level.playercardbackground );
    var_2 thread maps\_utility::_id_69C6( "cargoship_gm2_aircraftinbound2" );
    common_scripts\utility::_id_384A( "escape_explosion" );
    thread maps\_utility::_id_3840( "escape_get_to_catwalks_gaz_alavi", 20 );
    thread maps\_utility::_id_3840( "escape_get_to_catwalks_price", 22.25 );
    thread maps\_utility::_id_3840( "escape_get_to_catwalks", 22.25 );
    var_2 delete();
    wait 3;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp3_yourstatus" );
    wait 4;
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_whathappened" );
    wait 4;
    wait 3.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp3_comein" );
    var_1 maps\_utility::_id_27EF( 10, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_gettocatwalks" );
    var_0 maps\_utility::_id_27EF( 11, maps\mo_tools::anim_single_stack, var_0, "cargoship_grg_movego" );
    common_scripts\utility::_id_384A( "escape_dialogue1" );
    var_1 maps\_utility::_id_27EF( 0.5, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_backonfeet" );
    maps\_utility::_id_27EF( 5, maps\mo_tools::radio_msg_stack, "cargoship_gm1_watchyerhead" );
    common_scripts\utility::_id_384A( "escape_dialogue2" );
    var_0 thread maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_keepmoving" );
    common_scripts\utility::_id_384A( "escape_catwalk" );
    var_0 thread maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_breakinaway" );
    var_1 thread maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_comeoncomeon" );
    common_scripts\utility::_id_384A( "escape_hallway_lower_enter" );
    common_scripts\utility::_id_3831( "hallways_lowerhall2" );
    var_0 maps\_utility::_id_27EF( 1, maps\mo_tools::anim_single_stack, var_0, "cargoship_grg_watchpipes" );
    common_scripts\utility::_id_384A( "hallways_lowerhall2" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_talktome" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_almostthere" );
    common_scripts\utility::_id_384A( "escape_hallway_lower_flag" );
    maps\mo_tools::radio_msg_stack( "cargoship_gm1_whichway" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_totheright" );
    common_scripts\utility::_id_384A( "escape_hallway_upper_flag" );
    var_0 maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_outtatime" );
    var_1 maps\_utility::_id_27EF( 2, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_keepmoving" );
}

end_sink_ship()
{
    level._sea_link movez( 550, 0.5 );
    level._sea_org movez( 550, 0.5 );
    var_0 = ( -10, 0, -40 );
    level._sea_link rotateto( var_0, 0.5 );
    level._sea_org rotateto( var_0, 0.5 );
    wait 0.5;
    level._sea_link movez( 1400, 15 );
    level._sea_org movez( 1400, 15 );
    level.heroes5["price"].grenadeawareness = 1;
    level.heroes5["grigsby"].grenadeawareness = 1;
    level.heroes5["alavi"].grenadeawareness = 1;
}

end_screen()
{
    var_0 = maps\cargoship_code::_id_23D0( "black", 0 );
    var_0.space = 3;
    level.playercardbackground shellshock( "cargoship", 50 );
    var_0 maps\cargoship_code::exp_fade_overlay( 1, 4 );

    if ( getdvar( "limited_mode" ) == "1" )
        wait 0.5;
    else
    {
        level._id_4F4E = 0;
        var_1 = [];
        var_1[var_1.size] = &"CARGOSHIP_INFINITY_WARD_PRESENTS";

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = 1;
            var_4 = var_2 * var_3 + 1;
            maps\_utility::_id_27EF( var_4, maps\cargoship_code::_id_1C16, var_1[var_2], var_1.size - var_2 - 1, var_3 );
        }

        setomnvar( "ui_gasmask", 0 );
        wait 5.5;
    }

    cinematicingamesync( "Title_Logo_Slam" );
    soundscripts\_snd::_id_870C( "start_title_logo_mix" );
    wait 8;
    common_scripts\utility::_id_383F( "end_screen_done" );
}

misc_dummy()
{
    level._sea_scale = 1.5;
}

misc_setup()
{
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "spotlights", "targetname" ), ::misc_spotlight_fx );
    thread cargohold_lights_logic();
    common_scripts\utility::_id_0D13( getentarray( "falling_water_heavydoor_cgoshp", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::_id_0D13( getentarray( "falling_water_heavydoor_cgoshp_noripple", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::_id_0D13( getentarray( "falling_water_sidedoor_cgoshp", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::_id_0D13( getentarray( "falling_water_sidedoor_cgoshp_noripple", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::_id_0D13( getentarray( "fx_handler", "targetname" ), maps\cargoship_code::misc_fx_handler_trig );
    thread misc_fx_handlers();
    thread misc_hide_sea_trigger();
    thread misc_radar();
    common_scripts\utility::_id_0D13( getentarray( "tv", "targetname" ), maps\cargoship_code::misc_tv );
    common_scripts\utility::_id_0D13( getentarray( "tv", "targetname" ), maps\cargoship_code::misc_tv_stairs_on );
    common_scripts\utility::_id_0D13( getentarray( "light_flicker", "targetname" ), maps\cargoship_code::misc_light_flicker, undefined, "topside_fx" );
    common_scripts\utility::_id_0D13( getentarray( "light_cargohold", "targetname" ), maps\cargoship_code::misc_light_sway );
    common_scripts\utility::_id_0D13( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "deck_flags", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "sink_waterlevel", "targetname" ), ::misc_setup_waterlevel );
    var_0 = getentarray( "escape_stair_blocker", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] hide();
        var_0[var_1] notsolid();

        if ( var_0[var_1].specialgrenade & 1 )
            var_0[var_1] connectpaths();
    }

    var_2 = getent( "player_end_water_clip", "targetname" );
    var_2 notsolid();
    var_3 = getent( "cargohold1_utilitylight", "targetname" );
    var_4 = getent( "cargohold1_utilitylight_model", "targetname" );
    var_3 thread maps\cargoship_code::cargohold_1_light_sway( var_4 );
    var_5 = getentarray( "sink_waterlevel", "targetname" );

    for ( var_1 = 0; var_1 < var_5.size; var_1++ )
        var_5[var_1] hide();

    var_6 = getentarray( "escape_first_fallen_container", "targetname" );

    for ( var_1 = 0; var_1 < var_6.size; var_1++ )
    {
        var_6[var_1] notsolid();
        var_6[var_1] hide();

        if ( var_6[var_1].specialgrenade & 1 )
            var_6[var_1] connectpaths();
    }

    var_7 = getentarray( "escape_big_blocker", "targetname" );

    for ( var_1 = 0; var_1 < var_7.size; var_1++ )
    {
        var_7[var_1] hide();
        var_7[var_1] notsolid();

        if ( var_7[var_1].specialgrenade & 1 )
            var_7[var_1] connectpaths();
    }

    var_8 = getentarray( "cargohold_debri", "targetname" );

    for ( var_1 = 0; var_1 < var_8.size; var_1++ )
    {
        if ( !isdefined( var_8[var_1]._not_team ) )
            continue;

        var_9 = getent( var_8[var_1]._not_team, "targetname" );
        var_9 hide();
    }

    var_10 = maps\_utility::_id_3FA9( "sparks_runner" );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_waterdrips" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_waterdrips_exterior" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "sinking_stair" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_water_drip_stairs" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_water_nodrip_stairs" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_water_side_stairs" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_water_gush_stairs" ) );
    var_10 = common_scripts\utility::_id_0CDD( var_10, maps\_utility::_id_3FA9( "escape_caustics" ) );

    for ( var_1 = 0; var_1 < var_10.size; var_1++ )
        var_10[var_1] maps\_utility::_id_27EF( 0.1, common_scripts\utility::_id_671F );

    var_11 = getentarray( "escape_container", "targetname" );

    for ( var_1 = 0; var_1 < var_11.size; var_1++ )
    {
        var_12 = getent( var_11[var_1]._not_team, "targetname" );
        var_12 hide();
        var_12 notsolid();
    }

    var_13 = getent( "package_dooranim_node", "targetname" );
    var_14 = spawn( "script_origin", var_13.origin + ( 0, 0, 10 ) );
    var_14.angles = var_13.angles;
    thread package_open_doors( var_14 );
    common_scripts\utility::_id_0D13( getentarray( "no_prone", "targetname" ), maps\cargoship_code::player_noprone );
    var_15 = getent( "h1_player_proximity", "targetname" );
    var_15 common_scripts\utility::_id_97CC();
    maps\cargoship_code::hint_setup();
}

misc_setup_waterlevel()
{
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( self._not_team, "targetname" ), maps\cargoship_code::escape_waterlevel_parts, self );
    wait 1;
    maps\_utility::_id_3CAD();
}

misc_fx_handlers()
{
    wait 0.1;
    var_0 = maps\_utility::_id_3FA9( "cargo_vl_red_thin" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white_soft" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white_eql" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white_eql_flare" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white_sml" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_white_sml_a" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_vl_red_lrg" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_steam" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_steam_single" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "cargo_steam_single_strong" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "chains" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "light_mist_wall_cgoshp" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, maps\_utility::_id_3FA9( "light_mist_ceiling_cgoshp" ) );
    var_1 = maps\_utility::_id_3FA9( "cgoshp_lights_cr" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "heavy_mist_cgoshp" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "cgoshp_drips_a" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "cgoshp_drips_b" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "water_sweeping_cgoshp" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "water_sweeping_cgoshp_sml" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "cgoshp_light_tip_red" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "cgoshp_light_tip_green" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, maps\_utility::_id_3FA9( "cgoshp_light_tip_white" ) );
    var_2 = maps\_utility::_id_3FA9( "cgoshp_lights_cr_fly_light" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] common_scripts\utility::_id_671F();

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "cargohold_fx" ) )
        {
            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
                var_1[var_3] common_scripts\utility::_id_671F();

            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                var_0[var_3] maps\_utility::_id_748D();

            common_scripts\utility::_id_3831( "_sea_waves" );
            common_scripts\utility::_id_3831( "player_weather_enabled" );
            common_scripts\utility::_id_3831( "_weather_lightning_enabled" );
            thread maps\_weather::_id_7100( 1 );
            misc_hidesea();
            maps\_compass::setupminimap( "compass_map_cargoship_2" );
            thread maps\_utility::_id_7DB9( "interior" );
            setsunlight( 0.001, 0.001, 0.001 );
            common_scripts\utility::_id_384A( "topside_fx" );
        }

        if ( common_scripts\utility::_id_382E( "topside_fx" ) )
        {
            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                var_0[var_3] common_scripts\utility::_id_671F();

            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
                var_1[var_3] maps\_utility::_id_748D();

            if ( level.jumpto != "start" || common_scripts\utility::_id_382E( "quarters" ) )
                common_scripts\utility::_id_383F( "_sea_waves" );

            common_scripts\utility::_id_383F( "player_weather_enabled" );
            common_scripts\utility::_id_383F( "_weather_lightning_enabled" );
            thread maps\_weather::_id_70F9( 1 );
            misc_showsea();
            maps\_compass::setupminimap( "compass_map_cargoship" );
            thread maps\_utility::_id_7DB9( "exterior" );
            resetsunlight();
            common_scripts\utility::_id_384A( "cargohold_fx" );
        }
    }
}

misc_hidesea()
{
    level.sea_model hide();
    level.sea_black hide();
    level.sea_foam hide();
}

misc_showsea()
{
    level.sea_model show();
    level.sea_black show();
}

misc_hide_sea_trigger()
{
    var_0 = getent( "hide_sea_hack", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        misc_hidesea();
        wait 0.5;
    }
}

misc_radar()
{
    var_0 = getent( "radar", "targetname" );
    var_1 = 5000;

    for (;;)
    {
        var_0 rotatevelocity( ( 0, 120, 0 ), var_1 );
        wait(var_1);
    }
}

misc_spotlight_fx()
{
    self.tagent = common_scripts\utility::_id_8959();
    self.tagent.origin = self.origin;
    self.tagent.angles = self.angles;
    self.tagent linkto( getent( self._not_team, "targetname" ) );

    for (;;)
    {
        playfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
        common_scripts\utility::_id_384A( "cargohold_fx" );
        stopfxontag( common_scripts\utility::_id_3FA8( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
        common_scripts\utility::_id_384A( "topside_fx" );
    }
}

cargohold_lights_logic()
{
    cargohold_lights_getlights();
    common_scripts\utility::_id_0D13( level.cargohold_lights, ::cargohold_lights_movelights );
    common_scripts\utility::_id_384A( "escape_explosion" );
    wait 1;

    foreach ( var_1 in level.cargohold_lights )
        var_1.lamp_off_model show();

    maps\cargoship_lighting::cargohold_lights_flickering();
}

cargohold_lights_getlights()
{
    level.cargohold_lights = common_scripts\utility::_id_40FD( "cargohold_lightsway", "script_noteworthy" );

    foreach ( var_1 in level.cargohold_lights )
    {
        var_1.lockorientation = undefined;
        var_1.lamp_on_model = undefined;
        var_1.lamp_off_model = undefined;
        var_2 = getentarray( var_1._not_team, "targetname" );

        foreach ( var_4 in var_2 )
        {
            var_5 = var_4._id_7A99;

            if ( isdefined( var_5 ) )
            {
                if ( var_5 == "lamp_on" )
                {
                    var_1.lamp_on_model = var_4;
                    continue;
                }

                if ( var_5 == "lamp_off" )
                {
                    var_1.lamp_off_model = var_4;
                    var_1.lamp_off_model hide();
                    continue;
                }

                if ( var_5 == "light" )
                    var_1.lockorientation = var_4;
            }
        }
    }
}

cargohold_lights_movelights()
{
    var_0 = spawn( "script_origin", self.lockorientation.origin );
    var_0 linkto( self.lamp_on_model );

    for (;;)
    {
        self.lockorientation moveto( var_0.origin, 0.1 );
        wait 0.1;
    }
}

misc_cargohold_light()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = getentarray( self._not_team, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( isdefined( var_4.script_parentname ) )
        {
            if ( var_4.script_parentname == "lamp" )
            {
                var_1 = var_4;
                continue;
            }

            if ( var_4.script_parentname == "light" )
                var_0 = var_4;
        }
    }

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_5 = spawn( "script_origin", var_0.origin );
        var_5 linkto( var_1 );

        for (;;)
        {
            var_0 moveto( var_5.origin, 0.1 );
            wait 0.1;
        }
    }
    else
    {

    }
}

misc_drip_sway_fx()
{
    var_0 = common_scripts\utility::_id_8959();
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    var_1 = self.teambalanced;

    for (;;)
    {
        common_scripts\utility::_id_384A( "cargohold_fx" );
        playfxontag( common_scripts\utility::_id_3FA8( var_1 ), var_0, "tag_origin" );
        common_scripts\utility::_id_384A( "topside_fx" );
        stopfxontag( common_scripts\utility::_id_3FA8( var_1 ), var_0, "tag_origin" );
    }
}

misc_precacheinit()
{
    level._id_8F58["intro1"] = &"CARGOSHIP_TITLE";
    level._id_8F58["intro2"] = &"CARGOSHIP_DATE";
    level._id_8F58["intro3"] = &"CARGOSHIP_PLACE";
    level._id_8F58["intro4"] = &"CARGOSHIP_INFO";
    level._id_8F58["hint_laptop"] = &"CARGOSHIP_LAPTOP_HINT";
    level._id_8F58["obj_package"] = &"CARGOSHIP_OBJ_PACKAGE";
    level._id_8F58["obj_laptop"] = &"CARGOSHIP_OBJ_LAPTOP";
    level._id_8F58["obj_exit"] = &"CARGOSHIP_OBJ_EXIT";
    level._id_8F58["mantle"] = &"CARGOSHIP_MANTLE";
    var_0 = getarraykeys( level._id_8F58 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        precachestring( level._id_8F58[var_2] );
    }

    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "com_blackhawk_spotlight_off_mg_setup" );
    precacheitem( "rpg" );
    precacheitem( "rpg_straight" );
    precacheitem( "facemask" );
    precacheturret( "heli_spotlight" );
    precacheturret( "heli_minigun_noai" );
    precachemodel( "vehicle_blackhawk_hero_sas_night" );
    precachemodel( "vehicle_blackhawk_hero_sas_night_interior" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "h1_cs_light_alarm_short" );
    precachemodel( "tag_flash" );
    precachemodel( "tag_origin" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_minigun" );
    precachemodel( "prop_price_cigar" );
    precachemodel( "ch_industrial_light_02_off" );
    precachemodel( "com_lightbox" );
    precachemodel( "me_lightfluohang" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "cs_vodkabottle01" );
    precachemodel( "cs_coffeemug01" );
    precachemodel( "h1_cs_manifest_obj" );
    precachemodel( "com_restaurantchair_2" );
    precacheshellshock( "cargoship" );
    precacherumble( "tank_rumble" );
    precacherumble( "damage_heavy" );
    precachemodel( "head_sas_ct_assault_price_mask_up_wrinkle" );
    precachemodel( "head_sas_ct_assault_price_mask_down_nobeard" );
    precachemodel( "head_spetsnaz_assault_vlad" );
    precachemodel( "head_spetsnaz_assault_geoff" );
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "h1_cs_airconditioner" );
    precachemodel( "h1_cs_pan_metal_sauce_sm" );
    precachemodel( "h1_cs_container_jug_water_gallon_b" );
    precachemodel( "me_plastic_crate7" );
    precachemodel( "me_plastic_crate6" );
    precachemodel( "me_plastic_crate1" );
    precachemodel( "com_fire_extinguisher" );
    precachemodel( "com_pipe_4_coupling_ceramic" );
    precachemodel( "com_pipe_coupling_metal" );
    precachemodel( "h1_cs_pan_metalpot" );
    precachemodel( "com_soup_can" );
    precachemodel( "com_propane_tank" );
    precachemodel( "com_plastic_bucket" );
    precachemodel( "cargoship_water" );
    precachemodel( "cargoship_water_hole" );
    precachemodel( "cargoship_water_static" );
    precachemodel( "cargoship_water_black_static" );
    precacheshader( "hint_mantle" );
    precachemodel( "cs_container_door_joint" );
    precachemodel( "weapon_mp5_clip" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "popmenu_bg" );
    precachestring( &"CARGOSHIP_HINT_FRAG" );
    precachestring( &"CARGOSHIP_HINT_CROUCH_STANCE" );
    precachestring( &"CARGOSHIP_HINT_CROUCH" );
    precachestring( &"CARGOSHIP_HINT_CROUCH_TOGGLE" );
    precachestring( &"CARGOSHIP_HINT_STAND" );
    precachestring( &"CARGOSHIP_HINT_STAND_STANCE" );

    if ( !level.console )
    {
        precachestring( &"PLATFORM_HINT_HOLD_CROUCH_COVER" );
        precachestring( &"PLATFORM_HINT_CROUCH_TOGGLE_COVER_PC" );
    }

    level.misc_tv_damage_fx["tv_explode"] = loadfx( "fx/explosions/tv_explosion" );
}

misc_pipe_fx_maximum()
{
    while ( !isdefined( level.limit_pipe_fx ) )
        wait 0.1;

    level.limit_pipe_fx = 8;
}

objective_main()
{
    var_0 = 1;

    if ( level.jumpto != "start" )
    {
        objective_add( var_0, "active", level._id_8F58["obj_package"], ( 3052, 15, 407 ) );
        objective_current( var_0 );
    }

    switch ( level.jumpto )
    {
        case "start":
            common_scripts\utility::_id_384A( "at_bridge" );
        case "bridge":
            objective_add( var_0, "active", level._id_8F58["obj_package"], ( 3052, 15, 407 ) );
            objective_current( var_0 );
            level waittill( "bridge_secured" );
            objective_position( var_0, ( 2640, 624, 208 ) );
            common_scripts\utility::_id_384A( "deck" );
        case "deck":
            objective_position( var_0, ( -2116, 0, 80 ) );
            common_scripts\utility::_id_384A( "hallways_moveup" );
        case "hallways":
            objective_position( var_0, ( -2506, -496, 96 ) );
            common_scripts\utility::_id_384A( "hallways_enter" );
            objective_position( var_0, ( -2806, -122, 96 ) );
            common_scripts\utility::_id_384A( "hallways_stairs" );
            objective_position( var_0, ( -3292, -248, -65 ) );
            common_scripts\utility::_id_384A( "hallways_bottom_stairs" );
        case "cargohold":
        case "cargohold2":
        case "laststand":
        case "package":
            thread objective_laptop();
            objective_position( var_0, ( 2254, 197, -320 ) );
            common_scripts\utility::_id_383F( "package_reading" );
            objective_position( var_0, ( 2254, 197, -320 ) );
            common_scripts\utility::_id_384A( "package_orders" );
            objective_state( var_0, "done" );
            var_0++;
            var_1 = getent( "objective_package", "targetname" );
            waitframe;
            objective_add( var_0, "active", level._id_8F58["obj_laptop"], var_1 getorigin() );
            objective_current( var_0 );
            common_scripts\utility::_id_384A( "package_secure" );
        case "escape":
        case "end":
            objective_state( var_0, "done" );
            var_0++;
            objective_add( var_0, "active", level._id_8F58["obj_exit"] );
            thread objective_price( var_0 );
            objective_current( var_0 );
            common_scripts\utility::_id_384A( "player_rescued" );
            maps\_utility::_id_0CC5();
            objective_state( var_0, "done" );
            common_scripts\utility::_id_384A( "end_screen_done" );
            maps\_utility::_id_60D6();
    }
}

objective_price( var_0 )
{
    common_scripts\utility::_id_384A( "heroes_ready" );
    level endon( "player_rescued" );
    objective_onentity( var_0, level.heroes3["price"] );

    for (;;)
        wait 0.05;
}

objective_laptop_nag()
{
    level endon( "package_secure" );
    var_0 = getentarray( "escape_flags", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1]._id_79D3 ) || var_0[var_1]._id_79D3 != "escape_gotlaptop" )
            continue;

        var_0[var_1] common_scripts\utility::_id_97CE();
        break;
    }

    common_scripts\utility::_id_3856( "escape_gotlaptop", 10 );
    var_2 = 1;
    var_3 = level.heroes3["price"];

    for (;;)
    {
        switch ( var_2 )
        {
            case 1:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_macgetmanifest" );
                break;
            case 2:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_donthavetime" );
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_getmanifest" );
                break;
            case 3:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_gottamove" );
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_manifestletsgo" );
                break;
        }

        var_2++;

        if ( var_2 > 3 )
            var_2 = 1;

        wait 10;
    }
}

objective_laptop()
{
    var_0 = getent( "objective_package", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_384A( "package_orders" );
    thread objective_laptop_nag();
    var_0 common_scripts\utility::_id_97CE();
    var_0 sethintstring( level._id_8F58["hint_laptop"] );
    var_0 usetriggerrequirelookat();
    var_1 = getent( var_0._not_team, "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 setmodel( "h1_cs_manifest_obj" );
    var_0 waittill( "trigger" );
    thread common_scripts\utility::_id_69C2( "intelligence_pickup_clipboard", var_2.origin );
    var_1 delete();
    var_2 delete();
    var_0 delete();
    common_scripts\utility::_id_383F( "package_secure" );
}

objective_move( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) && level.jumpto != var_2 )
        return;

    if ( !isdefined( level.objective_position ) )
        level.objective_position = [];

    if ( isdefined( var_3 ) )
        level waittill( var_3 );

    level notify( "objective_move_" + var_1 );
    level endon( "objective_move_" + var_1 );
    var_4 = getent( "objective_move_" + var_0, "targetname" );

    while ( isdefined( var_4 ) )
    {
        objective_position( var_1, var_4.origin );
        level.objective_position[var_1] = var_4.origin;
        var_4 waittill( "trigger" );

        if ( !isdefined( var_4._not_team ) )
        {
            var_4 = undefined;
            continue;
        }

        var_4 = getent( var_4._not_team, "targetname" );
    }
}

boxes_in_the_wind()
{
    common_scripts\utility::_id_383D( "BoxesInTheWindDetect" );
    common_scripts\utility::_id_383D( "BoxesInTheWindStart" );
    common_scripts\utility::_id_383D( "BoxesInTheWindStop" );
    self endon( "BoxesInTheWindStop" );
    common_scripts\utility::_id_384A( "BoxesInTheWindDetect" );
    var_0 = getentarray( "windboxes", "targetname" );

    foreach ( var_2 in var_0 )
        thread movewindbox( var_2 );

    var_4 = gettime();

    for (;;)
    {
        wait 0.1;
        var_5 = gettime();

        if ( var_5 - var_4 > 4800 )
            common_scripts\utility::_id_383F( "BoxesInTheWindStop" );
    }
}

detect_windboxes( var_0 )
{
    self endon( "BoxesInTheWindStart" );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            wait 0.1;

            if ( sighttracepassed( level.playercardbackground geteye(), var_2.origin, 0, undefined ) )
                common_scripts\utility::_id_383F( "BoxesInTheWindStart" );
        }
    }
}

movewindbox( var_0 )
{
    self endon( "BoxesInTheWindStop" );
    var_0 physicslaunch( var_0.origin, ( 0, 0, 0 ) );
    var_1 = -2400;

    for (;;)
    {
        if ( randomintrange( 0, 100 ) > 75 && var_1 < 0 )
            applyaccelerationonentity( var_0, ( 0, -6, 0 ), ( 0, 0, randomintrange( 1200, 3600 ) ) );

        applyaccelerationonentity( var_0, ( 0, 0, 0 ), ( 0, var_1, 0 ) );
        var_1 += randomintrange( 36, 120 );

        if ( var_1 > 0 )
            var_1 = 0;

        wait 0.01;
        waitframe;
    }
}

start_physical_dof()
{
    level waittill( "level heli ready" );
    var_0 = ( 0, 0, 0 );
    var_1 = ( 0, 0, 0 );
    var_2 = set_dof_value( 2.6, 30, 2.0, 2.0 );
    var_3 = set_dof_value( 2.4, 46, 2.0, 2.0 );
    var_4 = set_dof_value( 1.2, 800, 3.0, 3.0 );
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( var_2.fstop, var_2.focusdistance, var_2.focusspeed, var_2.aperturespeed );
    var_5 = 0;
    var_6 = 26;
    var_7 = 0;
    var_8 = -33;
    var_9 = -30;
    var_10 = 25;

    for ( var_11 = 28; var_5 < var_6; var_5 += 0.1 )
    {
        var_0 = level._id_47A3.motiontrackerenabled gettagorigin( "tag_guy4" ) - level._id_47A3.motiontrackerenabled gettagorigin( "tag_guy7" );
        var_0 = vectornormalize( var_0 );
        var_1 = level.playercardbackground getplayerangles();
        var_1 = anglestoforward( var_1 );
        var_12 = atan2( var_1[1], var_1[0] ) - atan2( var_0[1], var_0[0] );

        if ( var_5 < 2.1 )
            var_12 = 0;
        else if ( var_12 < var_8 )
        {
            level.playercardbackground _meth_84a7( var_4.fstop, var_4.focusdistance, var_4.focusspeed, var_4.aperturespeed );
            var_7 = 1;
        }
        else if ( var_12 > var_9 && var_12 < var_10 )
        {
            var_13 = var_2.focusspeed;
            var_14 = var_2.aperturespeed;

            if ( var_7 == 1 )
            {
                var_13 = 9;
                var_14 = 9;
                var_7 = 0;
            }

            level.playercardbackground _meth_84a7( var_2.fstop, var_2.focusdistance, var_13, var_14 );
        }
        else if ( var_12 > var_11 )
        {
            var_13 = var_3.focusspeed;
            var_14 = var_3.aperturespeed;

            if ( var_7 == 1 )
            {
                var_13 = 11;
                var_14 = 11;
                var_7 = 0;
            }

            level.playercardbackground _meth_84a7( var_3.fstop, var_3.focusdistance, var_13, var_14 );
        }

        wait 0.1;
    }

    level.playercardbackground _meth_84a7( 3.6, var_2.focusdistance, var_2.focusspeed, var_2.aperturespeed );
    wait 6.5;
    level.playercardbackground _meth_84a7( 1.0, 720, 1.0, 1.0 );
    level.playercardbackground _meth_84a7( 2.8, 180, 4.0, 4.0 );
    wait 1.8;
    setsaveddvar( "r_mbEnable", 2 );
    wait 2.7;
    level.playercardbackground _meth_84a6();
    wait 0.5;
    setsaveddvar( "r_mbEnable", 0 );
}

set_dof_value( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.fstop = var_0;
    var_4.focusdistance = var_1;
    var_4.focusspeed = var_2;
    var_4.aperturespeed = var_3;
    return var_4;
}

items_sway_roll()
{
    var_0 = getentarray( "item_sway_roll", "targetname" );

    foreach ( var_2 in var_0 )
        thread roll_sway_item( var_2 );
}

roll_sway_item( var_0 )
{
    var_0 _meth_83c1();

    for (;;)
    {
        var_0 thread roll_item( 1 );
        level._sea_org waittill( "sway1" );
        var_0 notify( "swaystop" );
        var_0 thread roll_item( 0 );
        level._sea_org waittill( "sway2" );
        var_0 notify( "swaystop" );
        wait 0.1;
    }
}

roll_item( var_0 )
{
    self endon( "swaystop" );
    var_1 = common_scripts\utility::_id_9294( var_0, -1, 1 );
    var_2 = var_1 * 30;
    var_3 = var_1 * 30;

    for (;;)
    {
        applyaccelerationonentity( self, ( 0, 0, 0 ), ( 0, var_2, 0 ) );
        var_2 += var_3;
        wait 0.01;
        waitframe;
    }
}

roll_item_damage()
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
        {
            self delete();
            return;
        }

        wait 0.01;
    }
}

frying_pan_fall()
{
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
    {
        self unlink();
        self physicslaunch();
    }
}

desert_storm_init()
{
    maps\_utility::_id_0761( "axis", ::desert_storm_enemy_spawned );
    common_scripts\utility::_id_0D13( getaiarray( "axis" ), ::desert_storm_enemy_spawned );
}

desert_storm_enemy_spawned()
{
    level endon( "desert_storm_done" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_1 ) && var_1 == "MOD_RIFLE_BULLET" && ( isdefined( var_0 ) && var_0 == level.playercardbackground ) && ( isdefined( var_2 ) && ( var_2 == "desert" || var_2 == "deserteagle_cgoship" ) ) )
        desert_storm_achievement();
}

desert_storm_achievement()
{
    if ( !isdefined( level.playerdeserteaglekill ) )
        level.playerdeserteaglekill = 0;

    level.playerdeserteaglekill++;

    if ( level.playerdeserteaglekill >= 5 )
    {
        maps\_utility::_id_41DD( "DESERT_STORM" );
        maps\_utility::_id_735B( "axis", ::desert_storm_enemy_spawned );
        level notify( "desert_storm_done" );
    }
}

disable_ik_trigger()
{
    level.playercardbackground endon( "death" );
    var_0 = getent( "disable_ik", "targetname" );
    var_1 = getaiarray( "allies" );

    for (;;)
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 istouching( var_0 ) )
            {
                if ( !isdefined( var_3.disabledik ) )
                {
                    var_3.disabledik = 1;
                    var_3 _meth_856f();
                }

                continue;
            }

            if ( isdefined( var_3.disabledik ) )
            {
                var_3.disabledik = undefined;
                var_3 _meth_856e();
            }
        }

        wait 0.1;
    }
}
