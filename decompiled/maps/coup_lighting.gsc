// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    init_level_lighting_flags();
    level.cheat_invert_override = "_bright";
    thread setup_dof_presets();
    thread set_level_lighting_values();
    setsaveddvar( "fx_cast_shadow", 0 );
}

init_level_lighting_flags()
{

}

setup_dof_presets()
{

}

set_level_lighting_values()
{
    if ( isusinghdr() )
    {
        maps\_utility::vision_set_fog_changes( "coup", 0 );
        level.player maps\_utility::set_light_set_player( "coup" );
        level.player _meth_848C( "clut_coup", 1.0 );
    }
}
