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
    if ( isdefined( level.global_fx_override[var_0] ) )
    {
        var_5 = level.global_fx_override[var_0];
        var_0 = var_5["targetname"];
        var_1 = var_5["fxFile"];
        var_2 = var_5["delay"];
        var_3 = var_5["fxName"];
        var_4 = var_5["soundalias"];
    }

    if ( !isdefined( level._effect ) )
        level._effect = [];

    level._id_422D[var_0] = var_3;
    var_6 = maps\_utility::_id_40FE( var_0, "targetname" );

    if ( !isdefined( var_6 ) )
        return;

    if ( !var_6.size )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    if ( !isdefined( var_2 ) )
        var_2 = randomfloatrange( -20, -15 );

    foreach ( var_8 in var_6 )
    {
        if ( !isdefined( level._effect[var_3] ) )
            level._effect[var_3] = loadfx( var_1 );

        if ( !isdefined( var_8.angles ) )
            var_8.angles = ( 0, 0, 0 );

        var_9 = common_scripts\utility::_id_242E( var_3 );
        var_9.v["origin"] = var_8.origin;
        var_9.v["angles"] = var_8.angles;
        var_9.v["fxid"] = var_3;
        var_9.v["delay"] = var_2;

        if ( isdefined( var_4 ) )
            var_9.v["soundalias"] = var_4;

        if ( !isdefined( var_8.script_parentname ) )
            continue;

        var_10 = var_8.script_parentname;

        if ( !isdefined( level._id_05C3[var_10] ) )
            level._id_05C3[var_10] = [];

        level._id_05C3[var_10][level._id_05C3[var_10].size] = var_9;
    }
}

init()
{
    if ( !isdefined( level._id_422D ) )
        level._id_422D = [];

    level._id_05C3 = [];

    if ( !isdefined( level.global_fx_override ) )
        level.global_fx_override = [];
}
