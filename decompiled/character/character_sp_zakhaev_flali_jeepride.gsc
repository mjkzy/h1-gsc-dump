// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_zakhaev_imran_gimp_jeepride" );
    self attach( "head_zakhaev_imran_jeepride", "", 1 );
    self.headmodel = "head_zakhaev_imran_jeepride";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_zakhaev_imran_gimp_jeepride" );
    precachemodel( "head_zakhaev_imran_jeepride" );
}
