// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_woodland_gaz" );
    self attach( "head_sas_woodland_gaz", "", 1 );
    self.headmodel = "head_sas_woodland_gaz";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_woodland_gaz" );
    precachemodel( "head_sas_woodland_gaz" );
}
