// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_arab_regular_asad" );
    self attach( "head_sp_arab_regular_ski_mask", "", 1 );
    self.headmodel = "head_sp_arab_regular_ski_mask";
    self.voice = "arab";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_arab_regular_asad" );
    precachemodel( "head_sp_arab_regular_ski_mask" );
}
