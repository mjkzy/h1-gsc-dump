// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_spetsnaz_assault_vlad_jeepride" );
    self attach( "head_spetsnaz_assault_vlad_facemask_jeepride", "", 1 );
    self.headmodel = "head_spetsnaz_assault_vlad_facemask_jeepride";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_spetsnaz_assault_vlad_jeepride" );
    precachemodel( "head_spetsnaz_assault_vlad_facemask_jeepride" );
}
