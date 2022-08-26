// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_force_b_woodland" );
    self attach( "head_force_chad", "", 1 );
    self.headmodel = "head_force_chad";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_force_b_woodland" );
    precachemodel( "head_force_chad" );
}
