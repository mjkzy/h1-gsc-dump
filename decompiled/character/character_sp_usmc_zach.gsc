// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_usmc_desert_assault_zack" );
    self attach( "head_usmc_desert_support_zack", "", 1 );
    self.headmodel = "head_usmc_desert_support_zack";
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_usmc_desert_assault_zack" );
    precachemodel( "head_usmc_desert_support_zack" );
}
