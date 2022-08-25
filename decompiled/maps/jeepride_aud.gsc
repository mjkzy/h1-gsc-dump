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
    _id_2110();
    _id_4D5B();
    _id_4CF4();
    _id_5625();
    _id_5618();
    thread _id_5617();
    _id_23C4();
    _id_6ECB();
    _id_72E8();
}

_id_2110()
{
    soundscripts\_audio::_id_7EC8( "shg" );
    soundscripts\_snd_filters::_id_8757( "med_occlusion" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_jeepride_global" );
    level.player disablefocus( 0 );
    soundsettimescalefactor( "music", 0 );
    soundsettimescalefactor( "foley", 0.2 );
}

_id_4D5B()
{

}

_id_4CF4()
{

}

_id_5625()
{
    thread jeepride_intro_start();
    thread start_scripted_sfx_node();
    thread monitor_end_chase_music();
    thread play_hind_first_arrival();
    thread play_hind_post_tanker_explosion();
    thread play_hind_open_tunnel_arrival();
    thread play_hind_last_tunnel_scripted_sfx();
    common_scripts\utility::array_thread( getvehiclenodearray( "presideswipe", "script_noteworthy" ), ::presideswipe );
}

_id_5618()
{

}

_id_5617()
{
    wait 0.1;
}

_id_23C4()
{

}

_id_6ECB()
{

}

_id_72E8()
{
    soundscripts\_snd::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    soundscripts\_snd::_id_874D( "snd_music_handler", ::_id_5FFD );
    soundscripts\_snd::_id_874D( "aud_start_checkpoint", ::aud_start_checkpoint );
    soundscripts\_snd::_id_874D( "aud_first_hind_checkpoint", ::aud_first_hind_checkpoint );
    soundscripts\_snd::_id_874D( "aud_against_traffic_checkpoint", ::aud_against_traffic_checkpoint );
    soundscripts\_snd::_id_874D( "aud_final_stretch_checkpoint", ::aud_final_stretch_checkpoint );
    soundscripts\_snd::_id_874D( "aud_bridge_explode_checkpoint", ::aud_bridge_explode_checkpoint );
    soundscripts\_snd::_id_874D( "aud_bridge_combat_checkpoint", ::aud_bridge_combat_checkpoint );
    soundscripts\_snd::_id_874D( "aud_bridge_zak_checkpoint", ::aud_bridge_zak_checkpoint );
    soundscripts\_snd::_id_874D( "aud_bridge_rescue_checkpoint", ::aud_bridge_rescue_checkpoint );
    soundscripts\_snd::_id_874D( "aud_nowhere_checkpoint", ::aud_nowhere_checkpoint );
    soundscripts\_snd::_id_874D( "remove_intro_mute", ::remove_intro_mute );
    soundscripts\_snd::_id_874D( "clear_whitescreen_mix", ::clear_whitescreen_mix );
    soundscripts\_snd::_id_874D( "start_bridge_collapse_mix", ::start_bridge_collapse_mix );
    soundscripts\_snd::_id_874D( "start_post_bridge_explosion", ::start_post_bridge_explosion );
    soundscripts\_snd::_id_874D( "stop_post_bridge_explosion", ::stop_post_bridge_explosion );
    soundscripts\_snd::_id_874D( "aud_start_slowmo_mix", ::aud_start_slowmo_mix );
    soundscripts\_snd::_id_874D( "start_hind_shoots_the_tanker_mix", ::start_hind_shoots_the_tanker_mix );
    soundscripts\_snd::_id_874D( "start_rescue_mix", ::start_rescue_mix );
    soundscripts\_snd::_id_874D( "start_last_whitescreen_mix", ::start_last_whitescreen_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_checkpoint( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "jeep_ride_mix" );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", undefined );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_first_hind_checkpoint( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "jeep_ride_mix" );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", undefined );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_against_traffic_checkpoint( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "jeep_ride_mix" );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", undefined );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_final_stretch_checkpoint( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF2( "jeep_ride_mix" );
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", undefined );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_bridge_explode_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", undefined );
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_bridge_combat_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_bridge_zak_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_bridge_rescue_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

aud_nowhere_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior" );
}

remove_intro_mute()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "jeepride_intro_mute" );
}

clear_whitescreen_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "whitescreen_mix" );
}

start_hind_shoots_the_tanker_mix()
{
    level.player playsound( "scn_last_hind_flyby_boom" );
    soundscripts\_audio_mix_manager::_id_5CF2( "hind_shoots_the_tanker_mix" );
}

aud_start_slowmo_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "hind_shoots_the_tanker_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "slow_motion_mix" );
    level.player thread maps\_utility::_id_69C4( "scn_player_tanker_explo_wake_up" );
}

start_rescue_mix()
{
    wait 0.5;
    soundscripts\_audio_mix_manager::_id_5CF6( "slow_motion_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "rescue_mix" );
}

start_bridge_collapse_mix()
{
    soundscripts\_audio_zone_manager::azm_set_zone_streamed_ambience( "exterior", "ambient_jeepride_ext1", 0.1 );
    soundscripts\_audio_mix_manager::_id_5CF6( "bridge_uaz_crash_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "bridge_collapsing_mix" );
    thread handle_bridge_collapse_mix();
    level.player thread maps\_utility::_id_69C4( "scn_bridge_collapse" );
}

handle_bridge_collapse_mix()
{
    var_0 = getent( "remove_bridge_collapse_mix", "targetname" );
    var_0 waittill( "trigger", var_1 );
    soundscripts\_audio_mix_manager::_id_5CF6( "bridge_collapsing_mix" );
}

start_post_bridge_explosion()
{
    soundscripts\_audio_zone_manager::azm_set_filter_bypass( 1 );
    soundscripts\_snd_filters::_id_86DB( "post_bridge_exp_filter", 0.5 );
    level.player thread common_scripts\utility::_id_6975( "flashbang_tinnitus_loop", undefined, 0.5, 2 );
}

stop_post_bridge_explosion()
{
    soundscripts\_snd_filters::_id_86DC( 4 );
    level.player common_scripts\utility::_id_8EA1( "flashbang_tinnitus_loop" );
    wait 4;
    soundscripts\_audio_zone_manager::azm_set_filter_bypass( 0 );
}

start_last_whitescreen_mix()
{
    wait 0.3;
    level.player thread maps\_utility::_id_69C4( "scn_last_whitescreen_stinger" );
    soundscripts\_audio_mix_manager::_id_5CF6( "rescue_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "last_whitescreen_mix" );
}

jeepride_intro_start()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    soundscripts\_audio_mix_manager::_id_5CF2( "jeepride_intro_mute" );
    soundscripts\_audio_mix_manager::_id_5CF2( "whitescreen_mix" );
}

start_scripted_sfx_node()
{
    var_0 = [ [ "auto1593", "scn_start_jeep_honk_crash", undefined, undefined, undefined ], [ "auto1585", "scn_start_car_honk_crash", undefined, undefined, undefined ], [ "sideswipe_bmp_accelerate_01", "scn_sideswipe_bmp_accelerate_01", undefined, "bmp_accelerate_mix", undefined ], [ "auto1721", "scn_bmp_accelerate_01", undefined, "bmp_accelerate_mix", undefined ], [ "auto1746", "scn_bmp_accelerate_02", undefined, undefined, "bmp_accelerate_mix" ], [ "auto63", undefined, undefined, "first_hind_mix", undefined ], [ "auto3651", undefined, undefined, "tanker_explode_mix", undefined ], [ "auto3740", undefined, undefined, undefined, "tanker_explode_mix" ], [ "auto72", undefined, undefined, "car_passby_mix", undefined ], [ "auto2379", undefined, undefined, undefined, "car_passby_mix" ], [ "auto2637", undefined, undefined, undefined, "first_hind_mix" ], [ "auto4115", "scn_uaz_convoy_arrival_01", undefined, undefined, undefined ], [ "auto4059", "scn_uaz_convoy_arrival_02", undefined, undefined, undefined ], [ "auto4088", "scn_uaz_convoy_arrival_03", undefined, undefined, undefined ] ];

    foreach ( var_2 in var_0 )
        thread handle_scripted_sfx_node( var_2 );
}

handle_scripted_sfx_node( var_0 )
{
    var_1 = getvehiclenode( var_0[0], "targetname" );
    var_1 waittill( "trigger", var_2 );

    if ( isdefined( var_0[1] ) )
        var_2 playsound( var_0[1] );

    if ( isdefined( var_0[2] ) )
        var_2 _meth_854D( var_0[2] );

    if ( isdefined( var_0[3] ) )
        soundscripts\_audio_mix_manager::_id_5CF2( var_0[3] );

    if ( isdefined( var_0[4] ) )
        soundscripts\_audio_mix_manager::_id_5CF6( var_0[4] );
}

presideswipe()
{
    self waittill( "trigger", var_0 );
    var_0 thread maps\_utility::_id_69C4( "scn_jeepride_presideswipe" );
}

start_player_jeep_sfx()
{
    self vehicle_turnengineoff();
    thread maps\_utility::_id_6976( "scn_jeep_player_front", "tag_hood", 1, 1 );
    thread maps\_utility::_id_6976( "scn_jeep_player_back", "tag_bumper_back", 1, 1 );
    thread maps\_utility::_id_6976( "scn_jeep_player_center", "tag_body", 1, 1 );
}

stop_unimportant_vehicle()
{
    switch ( self.classname )
    {
        case "script_vehicle_luxurysedan":
        case "script_vehicle_tanker_truck_civ":
        case "script_vehicle_bus":
        case "vehicle_80s_hatch1_silv_destructible":
        case "script_vehicle_80s_wagon1_green_destructible":
        case "script_vehicle_80s_wagon1_tan_destructible":
        case "script_vehicle_pickup_4door":
        case "script_vehicle_pickup_roobars":
        case "script_vehicle_small_hatchback_turq":
        case "script_vehicle_small_wagon_white":
        case "script_vehicle_bm21_cover_destructible":
        case "script_vehicle_bm21_mobile_bed_destructible":
            self._id_799F = 1;
            self vehicle_turnengineoff();
            break;
    }
}

passby_sfx()
{
    self endon( "death" );

    switch ( self.vehicletype )
    {
        case "hind":
        case "mi28":
        case "mi17":
        case "uaz":
            return;
    }

    while ( !vehicleisclose( self, level.playersride ) )
        wait 0.05;

    if ( _id_91D2( level.playersride, self ) )
        thread maps\_utility::_id_69C4( passby_get_aliases() );
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_3 = var_1.origin - var_0.origin;
    var_4 = vectordot( var_2, var_3 );
    return var_4 > 0;
}

vehicleisclose( var_0, var_1 )
{
    if ( !_id_91D2( var_0, var_1 ) )
        return 0;

    var_2 = distance( var_0.origin, var_1.origin );
    var_3 = 4800;

    if ( isdefined( var_0.veh_speed ) && var_0.veh_speed > 0 )
    {
        var_4 = var_0.veh_speed * 63360 / 60 / 60;
        var_5 = level.playersride.veh_speed * 63360 / 60 / 60;
        var_3 = var_4 * 2.3 + var_5 * 2.3;
    }

    return var_2 < var_3;
}

passby_get_aliases()
{
    switch ( self.vehicletype )
    {
        case "bmp":
        case "bm21_troops":
        case "van":
        case "tanker":
        case "bus":
            return "veh_van_passby";
        case "truck":
        case "80s_wagon1":
        case "small_wagon":
            return "veh_truck_passby";
        default:
            return "veh_car_passby";
    }
}

start_bridge_uaz_crash()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "jeep_ride_mix" );
    soundscripts\_audio_mix_manager::_id_5CF2( "bridge_uaz_crash_mix" );
}

monitor_end_chase_music()
{
    var_0 = getvehiclenode( "auto231", "targetname" );
    var_0 waittill( "trigger", var_1 );
    wait 2;
    common_scripts\utility::_id_383F( "music_chase_end" );
}

play_hind_first_arrival()
{
    var_0 = getent( "auto2140", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread maps\_utility::_id_69C4( "scn_hind_first_appear" );
}

play_hind_post_tanker_explosion()
{
    var_0 = getent( "auto2498", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread maps\_utility::_id_69C4( "scn_hind_post_tanker_explosion" );
}

play_hind_open_tunnel_arrival()
{
    var_0 = getvehiclenode( "auto135", "targetname" );
    var_1 = var_0._id_7B1A;
    var_0 waittill( "trigger", var_2 );
    wait 0.1;
    var_2 play_scripted_sfx_on_vehicle_spawn( "scn_hind_open_tunnel_appear", "script_vehicle_mi24p_hind_woodland", var_1, 0.8 );
}

play_hind_last_tunnel_scripted_sfx()
{
    var_0 = getvehiclenode( "auto174", "targetname" );
    var_1 = var_0._id_7B1A;
    var_0 waittill( "trigger", var_2 );
    wait 0.1;
    var_2 play_scripted_sfx_on_vehicle_spawn( "scn_hind_last_tunnel_appear", "script_vehicle_mi24p_hind_woodland", var_1 );
}

play_mi17_scripted_sequence()
{
    thread play_mi17_unload_ennemies( "auto4413", "auto4416", 1 );
    thread play_mi17_unload_ennemies( "auto5018", "auto5020", 2 );
}

play_bm21_unload_troops_sequence()
{
    var_0 = getvehiclenode( "auto4032", "targetname" );
    var_1 = getvehiclenode( "auto4038", "targetname" );
    var_0 waittill( "trigger", var_2 );
    var_2 vehicle_turnengineoff();
    var_2._id_799F = 1;
    var_2 thread maps\_utility::_id_69C6( "scn_bm21_unload_arrival_01" );
    var_1 waittill( "trigger", var_2 );
    var_2 thread common_scripts\utility::_id_6975( "bm21_idle_low", undefined, 0.5, 0.5 );
    var_2 waittill( "unloaded" );
    var_2 thread common_scripts\utility::_id_8EA1( "bm21_idle_low" );
    var_2 thread maps\_utility::_id_69C6( "scn_bm21_unload_leaving_01" );
}

play_mi17_unload_ennemies( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_1, "targetname" );
    var_3 waittill( "trigger", var_5 );
    var_5 vehicle_turnengineoff();
    var_5._id_799F = 1;
    var_5 thread maps\_utility::_id_69C6( "scn_mi17_unload_arrival_0" + var_2 );
    var_4 waittill( "trigger", var_5 );
    var_5 thread common_scripts\utility::_id_6975( "mi17_close_towards_lp", undefined, 0.5, 0.5 );
    var_5 waittill( "unloaded" );
    var_5 thread common_scripts\utility::_id_8EA1( "mi17_close_towards_lp" );
    var_5 thread maps\_utility::_id_69C6( "scn_mi17_unload_leaving_0" + var_2 );
}

play_last_hind_flyby()
{
    wait 0.1;
    play_scripted_sfx_on_vehicle_spawn( "scn_last_hind_flyby", "script_vehicle_mi24p_hind_woodland", 72 );
}

play_scripted_sfx_on_vehicle_spawn( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\_utility::_id_4153();

    foreach ( var_6 in var_4 )
    {
        if ( var_6.classname == var_1 && isdefined( var_6._id_7B1A ) && var_6._id_7B1A == var_2 )
        {
            if ( isdefined( var_3 ) )
                wait(var_3);

            var_6 thread maps\_utility::_id_69C6( var_0 );
            return;
        }
    }
}

play_zak_enemy_heli_sfx()
{
    wait 0.1;
    self._id_799F = 1;
    self vehicle_turnengineoff();
    thread maps\_utility::_id_69C6( "scn_zak_enemy_hind_arrival" );
}

play_zak_ally_heli_sfx()
{
    wait 0.1;
    thread maps\_utility::_id_69C6( "scn_zak_ally_hind_arrival" );
}

crossroad_crash( var_0 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_bmp_ravine_flipcontact", "body_animate_jnt" );
}

truck_tanker_crash( var_0 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_tanker_truck_crash", "body_animate_jnt" );
}

tanker_tanker_crash( var_0 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_tanker_tanker_crash", "body_animate_jnt" );
}

tunnel_crash_truck01( var_0 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_bmp_front_tunnel_crash", "body_animate_jnt" );
}

tunnel_crash_truck02( var_0 )
{
    soundscripts\_audio_mix_manager::_id_5CF6( "bmp_accelerate_mix" );
    var_0 thread maps\_utility::_id_69C5( "scn_bmp_first_tunnel_crash_01", "body_animate_jnt" );
    var_0 _meth_854D( "scn_sideswipe_bmp_accelerate_01" );
}

play_bridge_collapse_sfx( var_0, var_1 )
{
    var_0 thread maps\_utility::_id_69C5( "scn_bridge_collapse_" + var_1, "j_chunk_" + var_1 );
}

play_anim_vehicle_explosion_sfx( var_0, var_1 )
{
    var_0 thread maps\_utility::_id_69C5( var_1, "body_animate_jnt" );
}
