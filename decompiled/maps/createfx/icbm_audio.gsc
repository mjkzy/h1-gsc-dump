// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread init_animsounds();
}

init_animsounds()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "tower", "explosion", "scn_icbm_tower_exp_sweet" );
}
