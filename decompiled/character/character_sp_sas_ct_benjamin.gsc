// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_ct_assault_benjamin" );
    self attach( "head_sas_ct_assault_benjamin", "", 1 );
    self.headmodel = "head_sas_ct_assault_benjamin";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_ct_assault_benjamin" );
    precachemodel( "head_sas_ct_assault_benjamin" );
}
