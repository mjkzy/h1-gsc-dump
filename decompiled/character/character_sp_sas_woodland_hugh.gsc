// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_support_a" );
    self attach( "head_sp_sas_woodland_hugh", "", 1 );
    self.headmodel = "head_sp_sas_woodland_hugh";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_support_a" );
    precachemodel( "head_sp_sas_woodland_hugh" );
}
