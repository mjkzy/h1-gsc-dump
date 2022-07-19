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
    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    maps\aftermath_precache::main();
    _id_A550::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    thread maps\aftermath_anim::main();
    maps\aftermath_wobblers::main();
    level thread _id_70BB();
    setup_dead_bodies();
    common_scripts\utility::_id_383D( "fall" );
    common_scripts\utility::_id_383D( "collapse" );
    common_scripts\utility::_id_383D( "collapse_done" );
    level._id_4413 = spawn( "script_model", ( 0, 0, 0 ) );
    level.playercardbackground playersetgroundreferenceent( level._id_4413 );
    building_collapse_h1();
    player_start();
}

player_start()
{
    var_0 = ( -989, 8433, 666 );
    var_1 = ( -18, 25, 0 );
    level.playercardbackground setstance( "prone" );
    level.playercardbackground setorigin( var_0 );
    level.playercardbackground setplayerangles( var_1 );
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    level._id_8C36 = "default";
    level.weaponclipmodels = [];
    level.playerbreathalias = "h1_plr_breath_injured_low";
    thread hud_hide();
    maps\aftermath_precache::main();
    _id_A550::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    maps\aftermath_aud::main();
    thread maps\aftermath_wobblers::main();
    thread maps\aftermath_anim::main();
    setup_dead_bodies();
    precacheshellshock( "slowview" );
    precacheshellshock( "aftermath" );
    precacheshellshock( "aftermath_fall" );
    precacheshader( "overlay_hunted_black" );
    precacheshader( "overlay_hunted_white" );
    precachemodel( "com_airduct_square" );
    common_scripts\utility::_id_383D( "awake" );
    common_scripts\utility::_id_383D( "fall" );
    common_scripts\utility::_id_383D( "fall_complete" );
    common_scripts\utility::_id_383D( "collapse" );
    common_scripts\utility::_id_383D( "collapse_done" );
    _id_A5A4::_id_3847( "radiation_death", getent( "death_point", "targetname" ) );
    common_scripts\utility::_id_383D( "helicopterfall_bodysense" );
    level.allow_fall = 1;

    if ( getdvarint( "aftermath_body_sense", 1 ) != 1 )
        setup_force_fall();

    level.player_speed = 50;
    level._id_4413 = spawn( "script_model", ( 0, 0, 0 ) );
    level.playercardbackground playersetgroundreferenceent( level._id_4413 );
    level.playercardbackground thread player_speed_over_time();
    level.playercardbackground thread _id_6B4F();
    level thread countdown_to_death();
    level.playercardbackground thread radiation_death();
    level thread _id_70BB();
    level.playercardbackground allowsprint( 0 );
    level thread slowview();
    thread building_collapse_h1();

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        body_sense_init();

    player_wakeup();
    level common_scripts\utility::_id_384A( "awake" );

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        setup_force_fall();

    level.playercardbackground allowjump( 0 );
    level.playercardbackground thread limp();
    level thread playground();
    maps\_wibble::setup_wibble_triggers( 0, "awake", "interior", 0, 1 );
    maps\_wibble::set_cloth_wibble( 0.0 );
}

setup_dead_bodies()
{
    level.dead_bodies_ignore_ragdoll_settings = 1;
    level.scr_deadbody[1] = _id_A4D7::main;
    level.scr_deadbody[2] = _id_A4D8::main;
    level.scr_deadbody[3] = _id_A4DB::main;
    level.scr_deadbody[4] = character\character_sp_pilot_velinda_desert::main;
    maps\_deadbody::main();
}

playground()
{
    var_0 = getent( "playground", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_69C2( "playground_memory", var_0.origin );
}

slowview()
{
    for (;;)
    {
        level waittill( "slowview", var_0 );

        if ( isdefined( var_0 ) )
            wait(var_0);

        thread restart_slowview();
        level.playercardbackground shellshock( "slowview", 15 );
    }
}

restart_slowview()
{
    level endon( "slowview" );
    wait 10;
    level notify( "slowview" );
}

_id_70BB()
{
    thread common_scripts\utility::_id_69C2( "snc_intro_stinger", ( 0, 0, 0 ) );
    var_0 = ( -1144, 8506, 660.3 );
    wait 4;
    _id_A5DE::_id_5CF6( "mix_intro_stinger" );
    thread maps\aftermath_aud::aud_player_dying_slowly();
    thread common_scripts\utility::_id_69C2( "aftermath_mmr_romeo_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_mmr_romeo", var_0 );
    wait 3;
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_epicenter_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_epicenter", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_evacuation_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_evacuation", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_contcenters_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_contcenters", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_dosimeter_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_dosimeter", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_elevatedlevels_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_elevatedlevels", var_0 );
}

countdown_to_death()
{
    level endon( "dying" );
    var_0 = getent( "outside", "targetname" );
    var_0 _id_A5A4::_id_9FC8( 50 );
    wait 30;

    if ( !common_scripts\utility::_id_382E( "collapse_done" ) )
    {
        var_1 = getent( "raze", "targetname" );
        var_1 notify( "trigger" );
        common_scripts\utility::_id_3856( "collapse_done", 10 );
    }

    wait 15;
    common_scripts\utility::_id_383F( "radiation_death" );
}

offense_level()
{
    common_scripts\utility::_id_384A( "awake" );
    wait 4;
    var_0 = getent( "radiac_equipment", "targetname" );
    objective_add( 1, "active", &"AFTERMATH_OBJ_OFFICER", var_0.origin );
    objective_current( 1 );
    var_1 = getent( "officer", "targetname" );
    var_1 waittill( "trigger" );
    objective_state( 1, "done" );
    level.playercardbackground thread player_jump_punishment();
    wait 3;
    var_0 = getent( "overhead_cover", "targetname" );
    objective_add( 2, "active", &"AFTERMATH_OBJ_SECURE_COVER", var_0.origin );
    objective_current( 2 );
    var_1 = getent( "death_point", "targetname" );
    var_1 waittill( "trigger" );
    var_2 = cos( 30 );

    while ( !common_scripts\utility::_id_A347( level.playercardbackground.origin, level.playercardbackground getplayerangles(), var_0.origin, var_2 ) )
        wait 0.05;

    level.playercardbackground radiation_death();
}

radiation_death()
{
    common_scripts\utility::_id_384A( "radiation_death" );
    _id_A5E8::_id_870C( "aud_start_mix_player_dying" );
    level notify( "dying" );
    thread hud_hide();
    level.playercardbackground setstance( "prone" );
    setblur( 0, 0.5 );
    level.playercardbackground freezecontrols( 1 );
    level.playercardbackground thread _id_A5A4::_id_69C4( "h1_plr_fall_near_death_sfx" );
    level._id_4413 thread stumble( ( 20, 10, 30 ), 0.2, 1.5, 1 );
    wait 0.2;
    level waittill( "recovered" );
    level.playercardbackground playrumbleonentity( "grenade_rumble" );
    level.playercardbackground allowstand( 0 );
    level.playercardbackground allowcrouch( 0 );
    var_0 = level.playercardbackground getplayerangles();
    var_1 = _id_085A( ( 0, 90 - var_0[1], -25 - var_0[0] ) );
    level._id_4413 rotateto( var_1, 6, 3, 1 );
    wait 4.5;
    var_2 = getent( "collapse_extra", "targetname" );
    var_2 notify( "trigger", 1 );
    level notify( "aftermath_lighting_glow", 6 );
    wait 3;
    level notify( "stop_heart" );
    var_3 = _id_23D0( "overlay_hunted_white", 0 );
    var_3 fadeovertime( 5 );
    var_3.alpha = 1;
    wait 5;
    setsaveddvar( "hud_showStance", 0 );
    _id_A5A4::_id_60D6();
}

building_collapse_h1()
{
    level.collapse_delay_min = 2;
    level.collapse_delay_mid = 4;
    level.collapse_delay_max = 8;
    thread building_collapse_back();
    thread building_collapse_side();
    thread building_collapse_extra();
}

building_collapse_back()
{
    common_scripts\utility::_id_383D( "building_collapse_back" );
    level endon( "building_collapse_side" );
    var_0 = getent( "collapse_back", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_2" );
    building_collapse_active( "building_collapse_back" );
    building_collapse_explode( 2 );
    wait(randomintrange( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 4 );
    building_collapse_complete( "building_collapse_back" );
}

building_collapse_explode( var_0 )
{
    common_scripts\_exploder::_id_3528( var_0 );
    level notify( "building_collapse", var_0 );
}

building_collapse_side()
{
    common_scripts\utility::_id_383D( "building_collapse_side" );
    level endon( "building_collapse_back" );
    var_0 = getent( "collapse_side", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_4" );
    building_collapse_active( "building_collapse_side" );
    building_collapse_explode( 4 );
    wait(randomintrange( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 2 );
    building_collapse_complete( "building_collapse_side" );
}

building_collapse_extra()
{
    common_scripts\utility::_id_383D( "building_collapse_extra" );
    var_0 = getent( "collapse_extra", "targetname" );
    var_0 waittill( "trigger", var_1 );

    while ( common_scripts\utility::_id_382E( "building_collapse_side" ) || common_scripts\utility::_id_382E( "building_collapse_back" ) )
        wait 0.05;

    if ( !isdefined( var_1 ) && !var_1 )
        building_collapse_wait_for_ready( "collapse_center_1" );

    building_collapse_active( "building_collapse_extra" );
    building_collapse_explode( 1 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 3 );
    building_collapse_complete( "building_collapse_extra" );
}

building_collapse_active( var_0 )
{
    common_scripts\utility::_id_383F( var_0 );
    common_scripts\utility::_id_383F( "collapse" );

    if ( var_0 != "building_collapse_extra" )
        level notify( "stop_stumble" );

    thread _id_A5DE::_id_5CF2( "mix_building_collapse" );
    thread common_scripts\utility::_id_69C2( "exp_building_collapse_dist", level.playercardbackground.origin );
}

building_collapse_complete( var_0 )
{
    level notify( "building_collapse_final_wait", level.collapse_delay_min );
    wait(level.collapse_delay_min);
    common_scripts\utility::_id_3831( var_0 );
    common_scripts\utility::_id_3831( "collapse" );
    common_scripts\utility::_id_383F( "collapse_done" );
    level notify( "recovered" );
    _id_A5A4::_id_27EF( max( 0, 5 - level.collapse_delay_min ), _id_A5DE::_id_5CF6, "mix_building_collapse" );
}

building_collapse_wait_for_ready( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = cos( 45 );

    for (;;)
    {
        while ( !common_scripts\utility::_id_A347( level.playercardbackground.origin, level.playercardbackground getplayerangles(), var_1.origin, var_2 ) )
            wait 0.05;

        if ( common_scripts\utility::_id_382E( "fall" ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }
}

building_collapse_pull_view( var_0, var_1 )
{
    self endon( "helicopterfall_bodysense" );
    var_2 = getent( "collapse_center_" + var_0, "targetname" );
    var_3 = level.playercardbackground getplayerangles();
    var_4 = vectortoangles( var_2.origin - level.playercardbackground.origin );
    var_5 = spawn( "script_origin", level.playercardbackground.origin );
    var_5.angles = var_4;
    var_6 = 1.75;
    level.playercardbackground playerlinktoblend( var_5, undefined, var_6, var_6 * 0.333, var_6 * 0.333, 1 );
    level._id_4413 rotateto( ( 0, 0, 0 ), var_6, var_6 * 0.333, var_6 * 0.333 );
    wait(var_6);
    wait 1.0;
    level.playercardbackground setplayerangles( var_4 );
    level.playercardbackground unlink();
}

building_collapse_recenter_view( var_0 )
{
    level._id_4413 rotateto( ( 0, var_0, 0 ), 4, 2, 2 );
    level waittill( "building_collapse_final_wait", var_1 );
    var_2 = var_1 * 0.5;
    var_3 = var_1 * 0.25;
    wait(var_2);
    level._id_4413 rotateto( ( 0, 0, 0 ), var_2, var_3, var_3 );
}

building_collapse()
{
    getent( "raze", "targetname" ) waittill( "trigger" );
    var_0 = getent( "building_collapse", "targetname" );
    var_1 = cos( 45 );

    while ( !common_scripts\utility::_id_A347( level.playercardbackground.origin, level.playercardbackground getplayerangles(), var_0.origin + ( 0, 0, -1000 ), var_1 ) )
        wait 0.05;

    common_scripts\utility::_id_3857( "fall" );
    common_scripts\utility::_id_383F( "collapse" );
    level notify( "stop_stumble" );
    thread common_scripts\utility::_id_69C2( "exp_building_collapse_dist", level.playercardbackground.origin );
    var_2 = getentarray( var_0._not_team, "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::collapse, var_0 );
    var_0 moveto( var_0.origin + ( 0, 0, -3000 ), 7, 4, 0 );
    wait 0.5;
    common_scripts\_exploder::_id_3528( 1 );
    var_3 = _id_085A( ( 0, 0, -20 ) );
    level._id_4413 rotateto( var_3, 2, 1, 1 );
    level._id_4413 waittill( "rotatedone" );
    wait 1;
    level._id_4413 rotateto( ( 0, 0, 0 ), 3, 1.5, 1.5 );
    wait 2;
    common_scripts\utility::_id_3831( "collapse" );
    common_scripts\utility::_id_383F( "collapse_done" );
    level notify( "recovered" );
}

collapse( var_0 )
{
    var_1 = distance( var_0.origin, self.origin );

    while ( distance( var_0.origin, self.origin ) <= var_1 )
    {
        var_1 = distance( var_0.origin, self.origin );
        wait 0.05;
    }

    if ( !isdefined( self.script_lightset ) )
        self.script_lightset = 0;

    wait(randomfloat( 0.1 ) + self.script_lightset);
    var_2 = vectornormalize( common_scripts\utility::_id_38C9( var_0.origin ) - common_scripts\utility::_id_38C9( self.origin ) );
    var_3 = _id_A5A4::vector_multiply( vector_switch( vectornormalize( var_2 ) ), randomintrange( 80, 100 ) );
    var_2 = _id_711A( ( 1, 1, 0.1 ) );
    var_2 = _id_A5A4::vector_multiply( var_2, randomintrange( 100, 150 ) );
    self rotatevelocity( var_3, 2, 0.2, 0 );
    self movegravity( var_2, 2 );
    wait 2;
    self delete();
}

vector_switch( var_0 )
{
    return ( var_0[0], var_0[2], var_0[1] * -1 );
}

_id_711A( var_0 )
{
    return ( ( randomfloat( 2 ) - 1 ) * var_0[0], ( randomfloat( 2 ) - 1 ) * var_0[1], ( randomfloat( 2 ) - 1 ) * var_0[2] );
}

player_speed_over_time()
{
    for (;;)
    {
        level.playercardbackground setmovespeedscale( level.player_speed / 190 );
        wait 10;
        level.player_speed--;

        if ( level.player_speed < 30 )
            return;
    }
}

_id_6B4F()
{
    level endon( "stop_heart" );
    wait 3;

    if ( !isdefined( level.heartbeat_ent ) )
    {
        level.heartbeat_ent = spawn( "script_origin", level.playercardbackground.origin );
        level.heartbeat_ent linkto( level.playercardbackground );
    }

    level.heartbeat_ent playloopsound( "aftermath_heartbeat" );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "helicopterfall_bodysense" ) )
        {
            level.playercardbackground thread common_scripts\utility::_id_8EA1( level.playerbreathalias );
            level.heartbeat_ent stoploopsound();
            level.playercardbackground playsound( "h1_heartbeat_fall" );
            wait 3.5;
            level.heartbeat_ent playloopsound( "aftermath_heartbeat" );

            if ( level.playerbreathalias == "h1_plr_breath_injured_low" )
                level.playerbreathalias = "h1_plr_breath_injured_heavy";

            level.playercardbackground thread common_scripts\utility::_id_6975( level.playerbreathalias );
            var_0 = 1.0;

            while ( var_0 >= 0.95 )
            {
                level.heartbeat_ent scalepitch( var_0, 0.5 );
                var_0 -= 0.05;
                wait 2;
            }

            return;
        }

        wait 0.05;
    }
}

player_wakeup()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
    {
        thread player_wakeup_body_sense();
        return;
    }

    level notify( "aftermath_lighting_glow", 0 );
    level.playercardbackground setstance( "prone" );
    level.playercardbackground shellshock( "aftermath", 18 );
    level notify( "slowview" );
    level.playercardbackground disableweapons();
    level.playercardbackground freezecontrols( 1 );
    level.playercardbackground allowstand( 0 );
    level.playercardbackground allowcrouch( 0 );
    var_0 = ( -989, 8433, 666 );
    var_1 = ( -18, 25, 0 );
    level.playercardbackground setorigin( var_0 );
    level.playercardbackground setplayerangles( var_1 );
    var_2 = _id_23D0( "overlay_hunted_black", 1 );
    wait 5;
    wait 0.5;
    var_2 fadeovertime( 12 );
    var_2.alpha = 0;
    wait 1;
    level.playercardbackground freezecontrols( 0 );
    wait 7;
    wait 0.5;
    thread _id_728D();
    setsaveddvar( "cg_footsteps", 0 );
    level.playercardbackground setstance( "prone" );
    wait 2;
    level.playercardbackground allowcrouch( 1 );
    common_scripts\utility::_id_383F( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    level.playercardbackground allowstand( 1 );
    var_2 destroy();
}

player_wakeup_body_sense()
{
    level notify( "aftermath_lighting_glow", 0 );
    level.playercardbackground shellshock( "aftermath", 18 );
    level notify( "slowview" );
    level.playercardbackground disableweapons();
    level.playercardbackground freezecontrols( 1 );
    body_sense_wakeup_setup();
    var_0 = _id_23D0( "overlay_hunted_black", 1 );
    wait 5;
    thread body_sense_wakeup_start();
    wait 0.5;
    var_0 fadeovertime( 12 );
    var_0.alpha = 0;
    wait 1;
    wait 7;
    wait 0.5;
    setsaveddvar( "cg_footsteps", 0 );
    wait 2;
    common_scripts\utility::_id_383F( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    var_0 destroy();
}

body_sense_init()
{
    level.player_body_node = spawn( "script_origin", ( -702.964, 8432.29, 635.475 ) );
    level.player_body = _id_A5A4::_id_88D1( "player_body", level.playercardbackground.origin, level.playercardbackground getplayerangles() );
    level.player_body hide();
}

body_sense_wakeup_setup()
{
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowstand( 0 );
    level.playercardbackground setstance( "prone" );
    level.player_body_node _id_A510::_id_0BC7( level.player_body, "jackson_wakeup" );
    var_0 = level.player_body gettagorigin( "tag_camera" );
    var_0 -= ( 0, 0, 11 );
    level.playercardbackground setorigin( var_0 );
    var_1 = level.player_body gettagangles( "tag_camera" );
    var_1 = ( 0, var_1[1], 0 );
    level.playercardbackground setplayerangles( var_1 );
}

body_sense_wakeup_start()
{
    setsaveddvar( "bg_allowProneWhileLinked", 1 );
    level._id_4413.angles += ( 0, 0, -5.27285 );
    level.player_body show();
    level.playercardbackground playerlinktodelta( level.player_body, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player_body_node thread _id_A510::_id_0C24( level.player_body, "jackson_wakeup" );
    thread h1_aftermathwakeupseq_dof();
    var_0 = 0.333;
    wait(getanimlength( level._id_78AC["player_body"]["jackson_wakeup"] ) - var_0);
    level._id_4413 rotateto( ( 0, 0, 0 ), var_0, var_0 * 0.333, var_0 * 0.333 );
    level._id_4413 waittill( "rotatedone" );
    level.playercardbackground unlink();
    level.player_body hide();
    wait 2;
    setsaveddvar( "bg_allowProneWhileLinked", 0 );
    level.playercardbackground thread common_scripts\utility::_id_6975( level.playerbreathalias );
    level.playercardbackground allowcrouch( 1 );
    wait 10;
    level.playercardbackground allowstand( 1 );
}

h1_aftermathwakeupseq_dof()
{
    wait 1.35;
    level.playercardbackground _meth_84a7( 2.4, 140, 9.0, 9.0 );
    setsaveddvar( "r_mbEnable", 2 );
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 2.4, 21, 1.0, 1.0 );
    wait 8.5;
    level.playercardbackground _meth_84a7( 3.4, 14, 2.0, 2.0 );
    wait 2.3;
    level.playercardbackground _meth_84a7( 4.4, 11.5, 3.0, 3.0 );
    wait 1.5;
    wait 1.5;
    setsaveddvar( "r_mbEnable", 0 );
}

_id_085A( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level.playercardbackground.angles );
    var_4 = anglestoforward( level.playercardbackground.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = _id_A5A4::vector_multiply( var_5, var_1 );
    var_7 += _id_A5A4::vector_multiply( var_6, var_2 );
    return var_7 + ( 0, var_0[1], 0 );
}

limp()
{
    if ( getdvarint( "no_cinematic_fx" ) != 1 )
        level.playercardbackground thread maps\aftermath_lighting::player_random_blur();

    var_0 = 0;
    var_1 = 0;
    var_2 = 1.0;

    for (;;)
    {
        var_3 = level.playercardbackground getvelocity();
        var_4 = abs( var_3[0] ) + abs( var_3[1] );

        if ( var_4 < 4 )
        {
            wait 0.05;
            continue;
        }

        var_5 = level.playercardbackground getstance();

        if ( var_5 == "crouch" )
            var_2 = 0.1;
        else if ( var_5 == "prone" )
            var_2 = 0.6;
        else
            var_2 = 1.0;

        var_6 = var_4 / level.player_speed;
        var_7 = randomfloatrange( 3, 5 );

        if ( randomint( 100 ) < 20 )
            var_7 *= 3;

        var_8 = randomfloatrange( 3, 7 );
        var_9 = randomfloatrange( -8, -2 );
        var_10 = ( var_7, var_9, var_8 );
        var_10 *= var_2;
        var_10 = _id_A5A4::vector_multiply( var_10, var_6 );
        var_11 = randomfloatrange( 0.35, 0.45 );
        var_12 = randomfloatrange( 0.65, 0.8 );
        var_0++;

        if ( var_6 > 1.3 )
            var_0++;

        thread stumble( var_10, var_11, var_12, var_2 );
        thread maps\aftermath_aud::aud_player_walking_foley( var_5 );
        level waittill( "recovered" );
    }
}

player_jump_punishment()
{
    wait 1;

    for (;;)
    {
        wait 0.05;

        if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        {
            if ( !level.playercardbackground _meth_83b1() )
                continue;
        }
        else
        {
            if ( level.playercardbackground isonground() )
                continue;

            wait 0.2;

            if ( level.playercardbackground isonground() )
                continue;
        }

        level notify( "stop_stumble" );
        wait 0.2;
        level.playercardbackground fall();
    }
}

setup_force_fall()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        var_0 = getentarray( "force_fall_body_sense", "targetname" );
    else
        var_0 = getentarray( "force_fall", "targetname" );

    common_scripts\utility::_id_0D13( var_0, ::force_fall );
}

force_fall()
{
    self waittill( "trigger" );

    if ( self.script_parentname == "lower_fall" )
    {
        level.lower_fall_used = 1;
        return;
    }

    if ( self.script_parentname == "upper_fall" )
    {
        if ( isdefined( level.lower_fall_used ) && level.lower_fall_used == 1 )
            return;
    }

    level.playercardbackground fall();
}

fall()
{
    level endon( "stop_stumble" );

    if ( !level.allow_fall )
        return;

    common_scripts\utility::_id_383F( "fall" );
    level.playercardbackground setstance( "prone" );
    thread maps\aftermath_aud::aud_player_falls();
    level._id_4413 thread stumble( ( 20, 10, 30 ), 0.2, 1.5, 1, 1 );
    wait 0.2;
    level notify( "aftermath_lighting_pain", 0 );
    level.playercardbackground playrumbleonentity( "grenade_rumble" );
    level.playercardbackground allowstand( 0 );
    level.playercardbackground allowcrouch( 0 );

    if ( !common_scripts\utility::_id_382E( "collapse" ) )
        level.playercardbackground viewkick( 127, level.playercardbackground.origin );

    level notify( "slowview", 3.5 );
    wait 1.5;
    common_scripts\utility::_id_383F( "fall" );
    thread _id_728D();
    thread maps\aftermath_aud::aud_player_recover();
    level notify( "aftermath_lighting_default", 5 );
    common_scripts\utility::_id_3831( "fall" );
    common_scripts\utility::_id_383F( "fall_complete" );
    level.playercardbackground allowstand( 1 );
    level.playercardbackground allowcrouch( 1 );
    level notify( "recovered" );
}

stumble( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_stumble" );
    var_0 = _id_085A( var_0 );
    level._id_4413 rotateto( var_0, var_1, var_1 / 4 * 3, var_1 / 4 );
    level._id_4413 waittill( "rotatedone" );
    var_5 = ( randomfloat( 4 ) - 4, randomfloat( 5 ), 0 );
    var_5 *= var_3;
    var_5 = _id_085A( var_5 );
    level._id_4413 rotateto( var_5, var_2, 0, var_2 / 2 );
    level._id_4413 waittill( "rotatedone" );

    if ( !isdefined( var_4 ) )
        level notify( "recovered" );
}

_id_728D()
{
    level endon( "collapse" );

    if ( common_scripts\utility::_id_382E( "collapse" ) )
        return;

    var_0 = _id_085A( ( -5, -5, 0 ) );
    level._id_4413 rotateto( var_0, 0.6, 0.6, 0 );
    level._id_4413 waittill( "rotatedone" );
    var_0 = _id_085A( ( -15, -20, 0 ) );
    level._id_4413 rotateto( var_0, 2.5, 0, 2.5 );
    level._id_4413 waittill( "rotatedone" );
    var_0 = _id_085A( ( 5, 5, 0 ) );
    level._id_4413 rotateto( var_0, 2.5, 2, 0.5 );
    level._id_4413 waittill( "rotatedone" );
    level._id_4413 rotateto( ( 0, 0, 0 ), 1, 0.2, 0.8 );
}

_id_23D0( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2.xpmaxmultipliertimeplayed = 0;
    var_2._id_0538 = 0;
    var_2 setshader( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2.hostquits = "fullscreen";
    var_2.visionsetnight = "fullscreen";
    var_2.alpha = var_1;
    var_2.foreground = 1;
    return var_2;
}

hud_hide( var_0 )
{
    wait 0.1;
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
}