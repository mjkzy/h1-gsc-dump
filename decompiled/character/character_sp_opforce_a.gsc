// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_ultra_nationalist_assault_a" );
    self attach( "head_spetsnaz_assault_demetry", "", 1 );
    self.headmodel = "head_spetsnaz_assault_demetry";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_ultra_nationalist_assault_a" );
    precachemodel( "head_spetsnaz_assault_demetry" );
}
