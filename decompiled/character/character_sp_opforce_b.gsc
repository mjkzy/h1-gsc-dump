// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_ultra_nationalist_assault_b" );
    self attach( "head_spetsnaz_assault_vlad_facemask", "", 1 );
    self.headmodel = "head_spetsnaz_assault_vlad_facemask";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_ultra_nationalist_assault_b" );
    precachemodel( "head_spetsnaz_assault_vlad_facemask" );
}
