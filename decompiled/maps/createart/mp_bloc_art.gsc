// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_bloc_fog_hdr::setupfog();
    else
        maps\createart\mp_bloc_fog::setupfog();

    visionsetnaked( "mp_bloc", 0 );
}
