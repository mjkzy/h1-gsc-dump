// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_spetsnaz_assault_demetry" );
    self attach( "head_spetsnaz_assault_demetry", "", 1 );
    self.headmodel = "head_spetsnaz_assault_demetry";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_spetsnaz_assault_demetry" );
    precachemodel( "head_spetsnaz_assault_demetry" );
}
