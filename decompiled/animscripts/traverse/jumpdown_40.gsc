// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self.type == "dog" )
        animscripts\traverse\shared::dog_jump_down( 3, 1.0 );
    else
        low_wall_human();
}
#using_animtree("generic_human");

low_wall_human()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse_jumpdown_40;
    var_0["traverseHeight"] = 0.0;
    animscripts\traverse\shared::dotraverse( var_0 );
}
