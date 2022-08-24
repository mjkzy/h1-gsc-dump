// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

/*
    ----- WARNING: -----

    This GSC dump may contain symbols that H1-mod does not have named. Navigating to https://github.com/h1-mod/h1-mod/blob/develop/src/client/game/scripting/function_tables.cpp and
    finding the function_map, method_map, & token_map maps will help you. CTRL + F (Find) and search your desired value (ex: 'isplayer') and see if it exists.

    If H1-mod doesn't have the symbol named, then you'll need to use the '_ID' prefix.

    (Reference for below: https://github.com/mjkzy/gsc-tool/blob/97abc4f5b1814d64f06fd48d118876106e8a3a39/src/h1/xsk/resolver.cpp#L877)

    For example, if H1-mod theroetically didn't have this symbol, then you'll refer to the '0x1ad' part. This is the hexdecimal key of the value 'isplayer'.
    So, if 'isplayer' wasn't defined with a proper name in H1-mod's function/method table, you would call this function as 'game:_id_1AD(player)' or 'game:_ID1AD(player)'

    Once again, you may need to do this even though it's named in this GSC dump but not in H1-Mod. This dump just names stuff so you know what you're looking at.
    --------------------

*/

dragunov_scope_init()
{
    var_0 = [];
    var_0["bog_b"] = "bog_b_dragunov";
    var_0["armada"] = "armada_dragunov";

    if ( isdefined( var_0[level.script] ) )
        thread dragunov_scope_monitor( var_0[level.script] );
}

dragunov_scope_monitor( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        var_3 = level.player getcurrentweapon();
        var_4 = level.player playerads();
        var_5 = var_4 == 1.0 || var_4 > var_1;
        var_6 = isdefined( var_3 ) && var_3 == "dragunov" && var_5;

        if ( var_6 && !var_2 )
            level.player _meth_83bf( var_0, 0 );
        else if ( !var_6 && var_2 )
            level.player _meth_83c0( 0 );

        var_2 = var_6;
        var_1 = var_4;
        wait 0.05;
    }
}
