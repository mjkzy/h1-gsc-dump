// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_ct_assault_neal" );
    self attach( "head_sas_ct_assault_neal", "", 1 );
    self.headmodel = "head_sas_ct_assault_neal";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_ct_assault_neal" );
    precachemodel( "head_sas_ct_assault_neal" );
}
