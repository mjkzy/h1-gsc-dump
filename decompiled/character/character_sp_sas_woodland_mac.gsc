// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_assault_b" );
    self attach( "head_sp_sas_woodland_mac", "", 1 );
    self.headmodel = "head_sp_sas_woodland_mac";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_assault_b" );
    precachemodel( "head_sp_sas_woodland_mac" );
}
