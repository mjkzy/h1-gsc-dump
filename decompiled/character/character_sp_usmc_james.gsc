// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_usmc_desert_assault_james" );
    self attach( "head_usmc_desert_support_james", "", 1 );
    self.headmodel = "head_usmc_desert_support_james";
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_usmc_desert_assault_james" );
    precachemodel( "head_usmc_desert_support_james" );
}
