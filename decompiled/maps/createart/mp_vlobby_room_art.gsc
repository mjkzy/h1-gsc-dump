// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_vlobby_room_fog_hdr::main();
    else
        maps\createart\mp_vlobby_room_fog::main();

    visionsetnaked( "mp_vlobby_room", 0 );
}
