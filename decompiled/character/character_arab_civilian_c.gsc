// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "character_arab_civilian_lowres_c" );
    self attach( "character_arab_civilian_lowres_c_head", "", 1 );
    self.headmodel = "character_arab_civilian_lowres_c_head";
    self.voice = "arab";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "character_arab_civilian_lowres_c" );
    precachemodel( "character_arab_civilian_lowres_c_head" );
}
