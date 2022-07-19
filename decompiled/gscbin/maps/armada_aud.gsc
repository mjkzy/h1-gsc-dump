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
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_armada_global" );
    soundsettraceflags( "vehicles", "solid", "glass" );
    soundsettraceflags( "battlechatter", "solid", "glass" );
    soundsettraceflags( "voices", "solid", "glass" );
    soundsettraceflags( "emitters", "solid", "glass" );
    soundsettraceflags( "weapons", "solid", "glass" );
    soundsettraceflags( "explosions", "solid", "glass" );
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
    _id_A5E8::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    _id_A5E8::_id_874D( "snd_music_handler", ::_id_5FFD );
    _id_A5E8::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    _id_A5E8::_id_874D( "start_ride_checkpoint", ::start_ride_checkpoint );
    _id_A5E8::_id_874D( "start_landed_checkpoint", ::start_landed_checkpoint );
    _id_A5E8::_id_874D( "start_hq2tv_checkpoint", ::start_hq2tv_checkpoint );
    _id_A5E8::_id_874D( "start_intel_checkpoint", ::start_intel_checkpoint );
    _id_A5E8::_id_874D( "start_tv_checkpoint", ::start_tv_checkpoint );
    _id_A5E8::_id_874D( "start_tank_checkpoint", ::start_tank_checkpoint );
    _id_A5E8::_id_874D( "start_end_checkpoint", ::start_end_checkpoint );
    _id_A5E8::_id_874D( "stop_inside_blackhawk_mix", ::stop_inside_blackhawk_mix );
    _id_A5E8::_id_874D( "stop_intro_mix", ::stop_intro_mix );
    _id_A5E8::_id_874D( "set_ambiance_level_01", ::set_ambiance_level_01 );
    _id_A5E8::_id_874D( "set_ambiance_level_03", ::set_ambiance_level_03 );
    _id_A5E8::_id_874D( "start_last_mig29_mix", ::start_last_mig29_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "inside_blackhawk" );
    _id_A5DE::_id_5CF2( "Intro_mix" );
}

start_ride_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "inside_blackhawk" );
    _id_A5DE::_id_5CF2( "Intro_mix" );
}

start_landed_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "exterior" );
}

start_hq2tv_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "bunker" );
}

start_intel_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "bunker" );
}

start_tv_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_tank_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_end_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_before_studio" );
}

stop_intro_mix()
{
    wait 1.0;
    _id_A5DE::_id_5CF6( "Intro_mix" );
}

stop_inside_blackhawk_mix()
{
    _id_A5E7::_id_123A( "exterior" );
}

set_ambiance_level_00()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext0", 0.05 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext0", 0.05 );
    _id_A5E7::_id_1235( "exterior", "exterior", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior", 0.05 );
}

set_ambiance_level_01()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext1", 0.8 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext1", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior1", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior1", 0.05 );
}

set_ambiance_level_03()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext3", 0.8 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext3", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior3", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior3", 0.05 );
    _id_A5E7::_id_1236( "exterior", "exterior_parking", 1.2 );
}

start_last_mig29_mix()
{
    _id_A5DE::_id_5CF2( "last_mig29_mix" );
    wait 5.0;
    _id_A5DE::_id_5CF6( "last_mig29_mix" );
}

play_technical_scripted_sfx_sequence()
{
    var_0 = getentarray( "script_vehicle_pickup_technical", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_7B1A == 5 )
            var_2._id_799F = 1;
    }

    var_4 = getvehiclenode( "auto2665", "targetname" );
    var_4 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track" );
    var_5 = getvehiclenode( "auto2711", "targetname" );
    var_5 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track_02" );
    var_5 = getvehiclenode( "auto2713", "targetname" );
    var_5 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track_03" );
}

play_scripted_technical_sfx( var_0 )
{
    self waittill( "trigger", var_1 );
    var_1 playsound( var_0 );
    var_1 common_scripts\utility::_id_A087( "driver dead", "death" );
    var_1 stopsounds();
}
