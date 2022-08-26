// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_cargoship_fog_hdr::main();
    else
        maps\createart\mp_cargoship_fog::main();

    visionsetnaked( "mp_cargoship", 0 );
}
