// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_shipment_fog_hdr::main();
    else
        maps\createart\mp_shipment_fog::main();

    visionsetnaked( "mp_shipment", 0 );
}
