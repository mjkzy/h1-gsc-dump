// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_bog_fog_hdr::setupfog();
    else
        maps\createart\mp_bog_fog::setupfog();

    visionsetnaked( "mp_bog", 0 );
}
