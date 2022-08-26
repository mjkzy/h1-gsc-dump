// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_zakhaev_viktor" );
    self attach( "head_zakhaev_viktor", "", 1 );
    self.headmodel = "head_zakhaev_viktor";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_zakhaev_viktor" );
    precachemodel( "head_zakhaev_viktor" );
}
