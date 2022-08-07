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

_id_422D( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    if ( var_5.size <= 0 )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = randomfloatrange( -20, -15 );

    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( level._effect ) )
            level._effect = [];

        if ( !isdefined( level._effect[var_3] ) )
            level._effect[var_3] = loadfx( var_1 );

        if ( !isdefined( var_7.angles ) )
            var_7.angles = ( 0, 0, 0 );

        var_8 = common_scripts\utility::_id_242E( var_3 );
        var_8.v["origin"] = var_7.origin;
        var_8.v["angles"] = var_7.angles;
        var_8.v["fxid"] = var_3;
        var_8.v["delay"] = var_2;

        if ( isdefined( var_4 ) )
            var_8.v["soundalias"] = var_4;
    }
}
