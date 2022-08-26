// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_arab_regular_al_asad" );
    self attach( "head_khaled_alasad", "", 1 );
    self.headmodel = "head_khaled_alasad";
    self.voice = "arab";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_arab_regular_al_asad" );
    precachemodel( "head_khaled_alasad" );
}
