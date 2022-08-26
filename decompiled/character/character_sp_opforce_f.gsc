// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_ultra_nationalist_assault_f" );
    self attach( "head_ultra_nationalist_gasmask", "", 1 );
    self.headmodel = "head_ultra_nationalist_gasmask";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_ultra_nationalist_assault_f" );
    precachemodel( "head_ultra_nationalist_gasmask" );
}
