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

main()
{
    level._id_5A2E = 100;
    level._id_5C43 = 50;
    level._id_29B8 = 250;
    level.door_objmodel = "com_door_breach_left_obj";
    level._id_8F75 = 1;
    precachemodel( level.door_objmodel );
    precachemodel( "weapon_detcord" );
    level._id_78AC["generic"]["detcord_stack_left_start_01"] = %breach_stackl_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_02"] = %breach_explosive_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_01"] = %explosivebreach_v1_stackl_idle;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_02"] = %explosivebreach_v1_detcord_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_01"][0] = %explosivebreach_v1_stackl_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_02"][0] = %explosivebreach_v1_detcord_idle;
    level._id_78AC["generic"]["detcord_stack_leftbreach_01"] = %explosivebreach_v1_stackl;
    level._id_78AC["generic"]["detcord_stack_leftbreach_02"] = %explosivebreach_v1_detcord;
    level._id_78AC["generic"]["exposed_flashbang_v1"] = %exposed_flashbang_v1;
    level._id_78AC["generic"]["exposed_flashbang_v2"] = %exposed_flashbang_v2;

    if ( isdefined( level.override_breach_explosive_left_audio ) )
    {
        _id_A510::_id_0807( "generic", "audio_start_mix", ::audio_start_mix, "detcord_stack_leftbreach_01" );
        _id_A510::_id_0807( "generic", "audio_stop_mix", ::audio_stop_mix, "detcord_stack_leftbreach_01" );
        _id_A510::_id_0807( "generic", "audio_custom_fire", ::audio_custom_fire, "detcord_stack_leftbreach_01" );
        _id_A510::_id_0807( "generic", "audio_custom_fire", ::audio_custom_fire, "detcord_stack_leftbreach_02" );
    }

    if ( isdefined( level.breach_play_door_animation ) && level.breach_play_door_animation )
        setup_door_animation();
}

audio_custom_fire( var_0 )
{
    if ( isdefined( var_0._id_17B5 ) )
        return;

    var_0 thread _id_A5A4::_id_69C4( "sp_breach_explosive_left_fire_npc" );
}

audio_start_mix( var_0 )
{
    _id_A5DE::_id_5CF2( "explosive_breach_left_mix" );
}

audio_stop_mix( var_0 )
{
    _id_A5DE::_id_5CF6( "explosive_breach_left_mix" );
}
#using_animtree("door");

setup_door_animation()
{
    level._id_78B1["breach_door"] = #animtree;
    level._id_78AC["breach_door"]["explosive_breach_left_door"] = %explosivebreach_v1_door;
}
