// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_loyalist_a" );
    self attach( "head_russian_loyalist_a", "", 1 );
    self.headmodel = "head_russian_loyalist_a";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_russian_loyalist_a" );
    precachemodel( "head_russian_loyalist_a" );
}
