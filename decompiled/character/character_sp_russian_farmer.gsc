// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_russian_farmer" );
    self attach( "head_sp_russian_farmer", "", 1 );
    self.headmodel = "head_sp_russian_farmer";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_russian_farmer" );
    precachemodel( "head_sp_russian_farmer" );
}
