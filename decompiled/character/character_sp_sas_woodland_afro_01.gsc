// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_woodland_soldier_afro_01" );
    self attach( "head_sp_sas_woodland_soldier_afro_01", "", 1 );
    self.headmodel = "head_sp_sas_woodland_soldier_afro_01";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_woodland_soldier_afro_01" );
    precachemodel( "head_sp_sas_woodland_soldier_afro_01" );
}
