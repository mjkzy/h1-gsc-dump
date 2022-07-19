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
    thread _id_4F77();
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_village_defend_global" );
    soundsettraceflags( "emitters", "solid", "glass" );
}

_id_4D5B()
{

}

_id_4CF4()
{
    level.override_aud_mi17_dist_treshold = 20000;
}

_id_5625()
{
    thread external_ambiance_update();
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
    _id_A5E8::_id_874D( "aud_start_southern_hill_checkpoint", ::aud_start_southern_hill_checkpoint );
    _id_A5E8::_id_874D( "aud_start_minigun_fallback_checkpoint", ::aud_start_minigun_fallback_checkpoint );
    _id_A5E8::_id_874D( "aud_start_minigun_checkpoint", ::aud_start_minigun_checkpoint );
    _id_A5E8::_id_874D( "aud_start_helidrop_checkpoint", ::aud_start_helidrop_checkpoint );
    _id_A5E8::_id_874D( "aud_start_clackers_checkpoint", ::aud_start_clackers_checkpoint );
    _id_A5E8::_id_874D( "aud_start_field_fallback_checkpoint", ::aud_start_field_fallback_checkpoint );
    _id_A5E8::_id_874D( "aud_start_javelin_checkpoint", ::aud_start_javelin_checkpoint );
    _id_A5E8::_id_874D( "aud_start_final_battle_checkpoint", ::aud_start_final_battle_checkpoint );
    _id_A5E8::_id_874D( "aud_start_seaknight_checkpoint", ::aud_start_seaknight_checkpoint );
    _id_A5E8::_id_874D( "aud_start_default_checkpoint", ::aud_start_default_checkpoint );
    _id_A5E8::_id_874D( "start_southern_hill_ambush_mix", ::start_southern_hill_ambush_mix );
    _id_A5E8::_id_874D( "start_ambush_smoke_screen_mix", ::start_ambush_smoke_screen_mix );
    _id_A5E8::_id_874D( "aud_start_mortar_mix", ::aud_start_mortar_mix );
    _id_A5E8::_id_874D( "aud_start_minigun_mix", ::aud_start_minigun_mix );
    _id_A5E8::_id_874D( "start_helidrop_mix", ::start_helidrop_mix );
    _id_A5E8::_id_874D( "start_clacker_mix", ::start_clacker_mix );
    _id_A5E8::_id_874D( "start_fall_back_to_barn_mix", ::start_fall_back_to_barn_mix );
    _id_A5E8::_id_874D( "aud_open_door_meeting", ::aud_open_door_meeting );
    _id_A5E8::_id_874D( "start_get_to_lz_mix", ::start_get_to_lz_mix );
    _id_A5E8::_id_874D( "start_inside_seaknight_mix", ::start_inside_seaknight_mix );
}

_id_A3E6( var_0, var_1 )
{
    var_2 = "";
    var_3 = "";

    if ( getsubstr( var_0, 0, 6 ) == "enter_" )
        var_2 = var_1;
    else if ( getsubstr( var_0, 0, 5 ) == "exit_" )
        var_3 = var_1;
}

_id_5FFD( var_0, var_1 )
{

}

aud_start_default_checkpoint( var_0 )
{
    start_ambience_0();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_southern_hill_checkpoint( var_0 )
{
    start_ambience_3();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_minigun_fallback_checkpoint( var_0 )
{
    start_ambush_smoke_screen_mix();
    start_ambience_4();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_minigun_checkpoint( var_0 )
{
    aud_start_minigun_mix();
    start_ambience_4();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_helidrop_checkpoint( var_0 )
{
    start_ambience_5();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_clackers_checkpoint( var_0 )
{
    start_clacker_mix();
    start_ambience_5();
    _id_A5E7::_id_123A( "interior_stone" );
}

aud_start_field_fallback_checkpoint( var_0 )
{
    start_fall_back_to_barn_mix();
    start_ambience_5();
    _id_A5E7::_id_123A( "interior_stone" );
}

aud_start_javelin_checkpoint( var_0 )
{
    start_fall_back_to_barn_mix();
    start_ambience_5();
    _id_A5E7::_id_123A( "javelin_barn" );
}

aud_start_final_battle_checkpoint( var_0 )
{
    start_fall_back_to_barn_mix();
    start_ambience_5();
    _id_A5E7::_id_123A( "javelin_barn" );
}

aud_start_seaknight_checkpoint( var_0 )
{
    start_get_to_lz_mix();
    start_ambience_5();
    _id_A5E7::_id_123A( "exterior" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "village_defend_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "village_defend_intro_mute", 1 );
}

start_ambience_0()
{
    set_all_ambiences( "ambient_village_defend_ext0", "exterior0" );
}

start_ambience_3()
{
    set_all_ambiences( "ambient_village_defend_ext3", "exterior3" );
}

start_ambience_4()
{
    set_all_ambiences( "ambient_village_defend_ext4", "exterior4" );
}

start_ambience_5()
{
    set_all_ambiences( "ambient_village_defend_ext5", "exterior5" );
}

set_all_ambiences( var_0, var_1 )
{
    _id_A5E7::_id_1239( "exterior", var_0, 0.8 );
    _id_A5E7::_id_1235( "exterior", var_1, 0.8 );
    _id_A5E7::_id_1239( "interior_wood_open", var_0, 0.8 );
    _id_A5E7::_id_1235( "interior_wood_open", var_1, 0.8 );
    _id_A5E7::_id_1239( "trainstation_attic", var_0, 0.8 );
    _id_A5E7::_id_1235( "trainstation_attic", var_1, 0.8 );
    _id_A5E7::_id_1239( "bell_tower", var_0, 0.8 );
    _id_A5E7::_id_1235( "bell_tower", var_1, 0.8 );
}

start_southern_hill_ambush_mix()
{
    _id_A5DE::_id_5CF2( "southern_hill_ambush_mix" );
}

start_ambush_smoke_screen_mix()
{
    _id_A5DE::_id_5CF6( "southern_hill_ambush_mix" );
    _id_A5DE::_id_5CF2( "ambush_smoke_screen_mix" );
}

aud_start_mortar_mix()
{
    _id_A5DE::_id_5CF6( "ambush_smoke_screen_mix" );
    _id_A5DE::_id_5CF2( "mortar_mix" );
}

aud_start_minigun_mix()
{
    _id_A5DE::_id_5CF6( "mortar_mix" );
    _id_A5DE::_id_5CF2( "minigun_mix" );
}

start_helidrop_mix()
{
    _id_A5DE::_id_5CF6( "minigun_mix" );
    _id_A5DE::_id_5CF2( "helidrop_mix" );
}

start_clacker_mix()
{
    _id_A5DE::_id_5CF6( "helidrop_mix" );
    _id_A5DE::_id_5CF2( "clacker_mix" );
}

start_fall_back_to_barn_mix()
{
    _id_A5DE::_id_5CF6( "clacker_mix" );
    _id_A5DE::_id_5CF2( "fall_back_to_barn_mix" );
}

start_inside_seaknight_mix()
{
    _id_A5DE::_id_5CF6( "get_to_lz_mix" );
    _id_A5E7::_id_123A( "inside_seaknight" );
}

start_get_to_lz_mix()
{
    _id_A5DE::_id_5CF6( "fall_back_to_barn_mix" );
    _id_A5DE::_id_5CF2( "get_to_lz_mix" );
}

aud_open_door_meeting()
{
    if ( isdefined( level._id_0E57.javelin_barn_door_open_trigger ) )
    {
        wait 1.5;
        common_scripts\utility::_id_0D13( level._id_0E57.javelin_barn_door_open_trigger, common_scripts\utility::_id_97CE );
    }

    var_0 = getent( "javelin_barn_transition_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_village_defend_ambient_transition" );
}

external_ambiance_update()
{
    level waittill( "southern_hill_action_started" );
    start_ambience_4();
    level waittill( "objective_price_orders_minigun" );
    start_ambience_5();
}

disable_azm_trigger_before_javelin_barn_door_open()
{
    level._id_0E57.javelin_barn_door_open_trigger = getentarray( "flag_before_javelin_barn_door_open", "script_noteworthy" );
    common_scripts\utility::_id_0D13( level._id_0E57.javelin_barn_door_open_trigger, common_scripts\utility::_id_97CC );
}
