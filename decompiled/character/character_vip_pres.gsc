// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_civ_vip_president" );
    self attach( "head_civ_vip_president", "", 1 );
    self.headmodel = "head_civ_vip_president";
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_civ_vip_president" );
    precachemodel( "head_civ_vip_president" );
}
