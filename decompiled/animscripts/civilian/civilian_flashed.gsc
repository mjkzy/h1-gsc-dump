// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

get_flashed_anim()
{
    return anim.civilianflashedarray[randomint( anim.civilianflashedarray.size )];
}

main()
{
    var_0 = maps\_utility::flashbanggettimeleftsec();

    if ( var_0 <= 0 )
        return;

    animscripts\flashed::flashbangedloop( get_flashed_anim(), var_0 );
}
