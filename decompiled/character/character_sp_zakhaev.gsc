// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_zakhaev_imran" );
    self attach( "head_zakhaev_imran", "", 1 );
    self.headmodel = "head_zakhaev_imran";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_zakhaev_imran" );
    precachemodel( "head_zakhaev_imran" );
}
