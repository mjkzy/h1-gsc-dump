// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_complete_sp_usmc_ghillie_price" );
    self attach( "head_usmc_ghillie_price", "", 1 );
    self.headmodel = "head_usmc_ghillie_price";
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_complete_sp_usmc_ghillie_price" );
    precachemodel( "head_usmc_ghillie_price" );
}
