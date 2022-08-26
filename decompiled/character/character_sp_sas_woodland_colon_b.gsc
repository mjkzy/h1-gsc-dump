// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_colon" );
    self attach( "head_sas_ct_assault_neal_nomask", "", 1 );
    self.headmodel = "head_sas_ct_assault_neal_nomask";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_colon" );
    precachemodel( "head_sas_ct_assault_neal_nomask" );
}
