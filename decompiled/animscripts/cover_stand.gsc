// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "killanimscript" );
    animscripts\utility::initialize( "cover_stand" );
    animscripts\cover_wall::cover_wall_think( "stand" );
}

end_script()
{
    animscripts\cover_behavior::end_script( "stand" );
}
