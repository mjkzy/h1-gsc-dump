// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_arab_regular_sadiq" );
    self attach( "head_sp_arab_regular_sadiq", "", 1 );
    self.headmodel = "head_sp_arab_regular_sadiq";
    self.hatmodel = "helmet_sp_arab_regular_sadiq";
    self attach( self.hatmodel );
    self.voice = "arab";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_arab_regular_sadiq" );
    precachemodel( "head_sp_arab_regular_sadiq" );
    precachemodel( "helmet_sp_arab_regular_sadiq" );
}
