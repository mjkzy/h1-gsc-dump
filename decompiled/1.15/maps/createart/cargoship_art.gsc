// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;
    level.player = getentarray( "player", "classname" )[0];

    if ( isusinghdr() )
        maps\createart\cargoship_fog_hdr::main();
    else
        maps\createart\cargoship_fog::main();
}
