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

setupminimap( var_0, var_1 )
{
    level._id_5C73 = var_0;

    if ( !isdefined( level._loadstarted ) && !isdefined( var_1 ) )
    {

    }

    if ( !isdefined( var_1 ) )
        var_1 = "minimap_corner";

    var_2 = getdvarfloat( "scr_requiredMapAspectRatio", 1 );
    var_3 = getentarray( var_1, "targetname" );

    if ( var_3.size != 2 )
        return;

    var_4 = ( var_3[0].origin[0], var_3[0].origin[1], 0 );
    var_5 = ( var_3[1].origin[0], var_3[1].origin[1], 0 );
    var_6 = var_5 - var_4;
    var_7 = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
    var_8 = ( 0 - var_7[1], var_7[0], 0 );

    if ( vectordot( var_6, var_8 ) > 0 )
    {
        if ( vectordot( var_6, var_7 ) > 0 )
        {
            var_9 = var_5;
            var_10 = var_4;
        }
        else
        {
            var_11 = _id_9C6E( var_7, vectordot( var_6, var_7 ) );
            var_9 = var_5 - var_11;
            var_10 = var_4 + var_11;
        }
    }
    else if ( vectordot( var_6, var_7 ) > 0 )
    {
        var_11 = _id_9C6E( var_7, vectordot( var_6, var_7 ) );
        var_9 = var_4 + var_11;
        var_10 = var_5 - var_11;
    }
    else
    {
        var_9 = var_4;
        var_10 = var_5;
    }

    if ( var_2 > 0 )
    {
        var_12 = vectordot( var_9 - var_10, var_7 );
        var_13 = vectordot( var_9 - var_10, var_8 );
        var_14 = var_13 / var_12;

        if ( var_14 < var_2 )
        {
            var_15 = var_2 / var_14;
            var_16 = _id_9C6E( var_8, var_13 * ( var_15 - 1 ) * 0.5 );
        }
        else
        {
            var_15 = var_14 / var_2;
            var_16 = _id_9C6E( var_7, var_12 * ( var_15 - 1 ) * 0.5 );
        }

        var_9 += var_16;
        var_10 -= var_16;
    }

    level._id_5980 = [];
    level._id_5980["top"] = var_9[1];
    level._id_5980["left"] = var_10[0];
    level._id_5980["bottom"] = var_10[1];
    level._id_5980["right"] = var_9[0];
    level._id_5984 = level._id_5980["right"] - level._id_5980["left"];
    level._id_5981 = level._id_5980["top"] - level._id_5980["bottom"];
    level._id_5990 = vectordot( var_9 - var_10, var_7 );
    setminimap( var_0, var_9[0], var_9[1], var_10[0], var_10[1] );
}

_id_9C6E( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
}
