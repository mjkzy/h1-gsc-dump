// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_loyalist_b" );
    self attach( "head_russian_loyalist_b", "", 1 );
    self.headmodel = "head_russian_loyalist_b";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_russian_loyalist_b" );
    precachemodel( "head_russian_loyalist_b" );
}
