// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_broadcast_fog_hdr::setupfog();

    visionsetnaked( "mp_broadcast", 0 );
}
