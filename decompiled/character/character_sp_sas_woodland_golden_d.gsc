// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_golden" );
    self attach( "head_sas_ct_assault_benjamin_nomask", "", 1 );
    self.headmodel = "head_sas_ct_assault_benjamin_nomask";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_golden" );
    precachemodel( "head_sas_ct_assault_benjamin_nomask" );
}
