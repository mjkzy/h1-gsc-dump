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
    level.door_objmodel = "com_door_breach_left_obj";
    precachemodel( level.door_objmodel );
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_start_01"] = %breach_sh_breacherl1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_start_02"] = %breach_sh_stackr1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_idle_01"][0] = %breach_sh_breacherl1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_idle_02"][0] = %breach_sh_stackr1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_breach_01"] = %h1_armada_03_shotgunhinges_soldiera;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_breach_02"] = %h1_armada_03_shotgunhinges_soldierb;
    maps\_anim::addnotetrack_customfunction( "generic", "custom_audio_fire", ::custom_audio_fire, "shotgunhinges_breach_left_stack_breach_01" );
}

custom_audio_fire( var_0 )
{
    var_0 thread maps\_utility::_id_69C4( "armada_doorbreach_scripted_gun" );
}
