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
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_icbm_global" );
}

_id_4D5B()
{

}

_id_4CF4()
{

}

_id_5625()
{

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
    soundscripts\_snd::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    soundscripts\_snd::_id_874D( "start_landed_checkpoint", ::start_landed_checkpoint );
    soundscripts\_snd::_id_874D( "start_basement_checkpoint", ::start_basement_checkpoint );
    soundscripts\_snd::_id_874D( "start_house2_checkpoint", ::start_house2_checkpoint );
    soundscripts\_snd::_id_874D( "start_rescued_checkpoint", ::start_rescued_checkpoint );
    soundscripts\_snd::_id_874D( "start_tower_checkpoint", ::start_tower_checkpoint );
    soundscripts\_snd::_id_874D( "start_fense_checkpoint", ::start_fense_checkpoint );
    soundscripts\_snd::_id_874D( "start_base_checkpoint", ::start_base_checkpoint );
    soundscripts\_snd::_id_874D( "start_base2_checkpoint", ::start_base2_checkpoint );
    soundscripts\_snd::_id_874D( "start_launch_checkpoint", ::start_launch_checkpoint );
    soundscripts\_snd::_id_874D( "aud_open_fisrt_door", ::aud_open_fisrt_door );
    soundscripts\_snd::_id_874D( "first_house_mix", ::first_house_mix );
    soundscripts\_snd::_id_874D( "start_tower_first_choppers_fly_by", ::start_tower_first_choppers_fly_by );
    soundscripts\_snd::_id_874D( "start_missile_launch_mix", ::start_missile_launch_mix );
    soundscripts\_snd::_id_874D( "aud_start_bm21_scripted_sfx", ::aud_start_bm21_scripted_sfx );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_landed_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_basement_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_house2_checkpoint( var_0 )
{
    aud_open_fisrt_door();
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_rescued_checkpoint( var_0 )
{
    aud_open_fisrt_door();
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_tower_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "field" );
}

start_fense_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "field" );
}

start_base_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood" );
}

start_base2_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "warehouse" );
}

start_launch_checkpoint( var_0 )
{
    soundscripts\_audio_zone_manager::azm_start_zone( "exterior_wood_end" );
}

aud_open_fisrt_door()
{
    if ( isdefined( level.aud.door_first_house_trigger ) )
    {
        wait 1.5;
        level.aud.door_first_house_trigger common_scripts\utility::_id_97CE();
    }

    var_0 = getent( "first_door_ambient_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_icbm_ambient_door_transition" );
    var_1 = getent( "footstep_amb_emitter_02", "targetname" );
    var_1 thread common_scripts\utility::_id_6975( "emt_overhead_footsteps" );
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_first_house_search" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_rescue_griggs" );
    common_scripts\utility::_id_3852( "breach_started", "player_shooting_interogators" );
    var_1 thread common_scripts\utility::_id_8EA1( "emt_overhead_footsteps" );
}

first_house_mix()
{
    var_0 = getent( "footstep_amb_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_overhead_footsteps" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_first_house_search" );
    common_scripts\utility::_id_3852( "house1_cleared", "_stealth_spotted" );
    var_0 thread common_scripts\utility::_id_8EA1( "emt_overhead_footsteps" );
}

start_missile_launch_mix()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_tower_destruction" );
    soundscripts\_audio_mix_manager::_id_5CF2( "missile_launch_mix" );
    common_scripts\utility::_id_384A( "launch_01" );
    soundscripts\_audio_mix_manager::_id_5CF6( "missile_launch_mix" );
}

start_tower_first_choppers_fly_by()
{
    soundscripts\_audio_mix_manager::_id_5CF6( "mix_rescue_griggs" );
    soundscripts\_audio_mix_manager::_id_5CF2( "mix_tower_destruction" );
}

start_first_truck_audio()
{
    self vehicle_turnengineoff();
    self playsound( "scn_icbm_first_jeep_scripted_sequence" );
    uaz_monitor_death();
}

handle_first_truck_stop()
{
    thread common_scripts\utility::_id_6975( "veh_uaz_idle_low", undefined, 0.5, 0.2 );
}

uaz_monitor_death()
{
    self waittill( "death" );
    self stoploopsound( "veh_uaz_idle_low" );
    self stopsounds();
}

aud_start_bm21_scripted_sfx()
{
    var_0 = getvehiclenode( "auto2648", "targetname" );
    var_1 = getvehiclenode( "auto2649", "targetname" );
    var_0 thread handle_start_vehicle( "h1_scn_icbm_bm21_01_arrival", 7.1 );
    var_1 thread handle_start_vehicle( "h1_scn_icbm_bm21_02_arrival", 11.7 );
}

handle_start_vehicle( var_0, var_1 )
{
    self waittill( "trigger", var_2 );
    var_2 endon( "death" );
    var_2 vehicle_turnengineoff();
    var_2 thread maps\_utility::_id_69C6( var_0 );
    wait(var_1);
    var_2 vehicle_turnengineon();
}

disable_azm_trigger_open_door_first_house()
{
    level.aud.door_first_house_trigger = getent( "flag_before_open_door_first_house", "script_noteworthy" );
    level.aud.door_first_house_trigger common_scripts\utility::_id_97CC();
}
