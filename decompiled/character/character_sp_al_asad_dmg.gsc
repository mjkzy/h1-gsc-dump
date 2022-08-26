// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_arab_regular_al_asad_beatup" );
    self attach( "head_khaled_alasad_beatup", "", 1 );
    self.headmodel = "head_khaled_alasad_beatup";
    self.voice = "arab";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_arab_regular_al_asad_beatup" );
    precachemodel( "head_khaled_alasad_beatup" );
}
