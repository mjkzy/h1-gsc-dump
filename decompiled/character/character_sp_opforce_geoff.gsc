// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_ultra_nationalist_assault_d" );
    self attach( "head_spetsnaz_assault_geoff", "", 1 );
    self.headmodel = "head_spetsnaz_assault_geoff";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_ultra_nationalist_assault_d" );
    precachemodel( "head_spetsnaz_assault_geoff" );
}
