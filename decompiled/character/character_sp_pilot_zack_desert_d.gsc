// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_cobra_pilot_desert_zack_burned" );
    self attach( "head_sp_cobra_pilot_zack_wglasses", "", 1 );
    self.headmodel = "head_sp_cobra_pilot_zack_wglasses";
    self.voice = "american";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_cobra_pilot_desert_zack_burned" );
    precachemodel( "head_sp_cobra_pilot_zack_wglasses" );
}
