// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_ct_assault_price" );
    self attach( "head_sas_ct_assault_price_mask_down", "", 1 );
    self.headmodel = "head_sas_ct_assault_price_mask_down";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_ct_assault_price" );
    precachemodel( "head_sas_ct_assault_price_mask_down" );
}
