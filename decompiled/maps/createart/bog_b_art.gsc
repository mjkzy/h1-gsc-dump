// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;
    level.player = getentarray( "player", "classname" )[0];

    if ( isusinghdr() )
        maps\createart\bog_b_fog_hdr::main();
    else
        maps\createart\bog_b_fog::main();
}
