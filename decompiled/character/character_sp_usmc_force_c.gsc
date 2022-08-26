// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_force_c_woodland" );
    self attach( "head_force_c", "", 1 );
    self.headmodel = "head_force_c";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_force_c_woodland" );
    precachemodel( "head_force_c" );
}
