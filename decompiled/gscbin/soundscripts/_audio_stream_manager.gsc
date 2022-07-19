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

_id_8653()
{
    level._id_055B._id_8F2F = spawnstruct();
    level._id_055B._id_8F2F._id_5FFB = spawnstruct();
    level._id_055B._id_8F2F._id_5FFB._id_24CA = _id_8698();
    level._id_055B._id_8F2F._id_5FFB._id_6F33 = _id_8698();
    level._id_055B._id_8F2F._id_0B16 = spawnstruct();
    level._id_055B._id_8F2F._id_0B16._id_24CA = _id_8698();
    level._id_055B._id_8F2F._id_0B16._id_6F33 = _id_8698();
}

_id_8656( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_6 = 1.0;

    if ( isdefined( var_1 ) )
        var_6 = max( var_1, 0 );

    var_7 = 1.0;

    if ( isdefined( var_4 ) )
        var_7 = max( var_4, 0 );

    _id_8699( level._id_055B._id_8F2F._id_0B16._id_6F33, level._id_055B._id_8F2F._id_0B16._id_24CA.nearz, level._id_055B._id_8F2F._id_0B16._id_24CA._id_9F37, level._id_055B._id_8F2F._id_0B16._id_24CA._id_35D9 );
    _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0, var_7, var_6 );
    ambientplay( var_0, var_6, var_7 );
}

_id_8655( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_6 = 1.0;

    if ( isdefined( var_1 ) )
        var_6 = max( var_1, 0 );

    var_7 = 1.0;

    if ( isdefined( var_2 ) )
        var_7 = var_2;

    var_8 = 1.0;

    if ( isdefined( var_3 ) )
        var_8 = max( var_3, 0 );

    _id_8699( level._id_055B._id_8F2F._id_5FFB._id_6F33, level._id_055B._id_8F2F._id_5FFB._id_24CA.nearz, level._id_055B._id_8F2F._id_5FFB._id_24CA._id_9F37, level._id_055B._id_8F2F._id_5FFB._id_24CA._id_35D9 );
    _id_8699( level._id_055B._id_8F2F._id_5FFB._id_24CA, var_0, var_8, var_6 );

    if ( isdefined( var_4 ) )
    {
        musicstop( var_7, var_4 );
        musicplay( var_0, var_6, var_8, 0 );
    }
    else
        musicplay( var_0, var_6, var_8 );
}

_id_8658( var_0, var_1 )
{
    if ( var_0 != "none" )
    {
        if ( !soundexists( var_0 ) )
            return;

        var_3 = 1.0;

        if ( isdefined( var_1 ) )
            var_3 = max( var_1, 0 );

        if ( level._id_055B._id_8F2F._id_0B16._id_24CA.nearz == var_0 )
        {
            level._id_055B._id_8F2F._id_0B16._id_24CA = level._id_055B._id_8F2F._id_0B16._id_6F33;
            _id_8697( level._id_055B._id_8F2F._id_0B16._id_6F33 );
        }
        else if ( level._id_055B._id_8F2F._id_0B16._id_6F33.nearz == var_0 )
            _id_8697( level._id_055B._id_8F2F._id_0B16._id_6F33 );

        ambientstop( var_3, var_0 );
    }
}

_id_865A( var_0, var_1 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_3 = 1.0;

    if ( isdefined( var_1 ) )
        var_3 = max( var_1, 0 );

    if ( level._id_055B._id_8F2F._id_5FFB._id_24CA.nearz == var_0 )
    {
        level._id_055B._id_8F2F._id_5FFB._id_24CA = level._id_055B._id_8F2F._id_5FFB._id_6F33;
        _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );
    }
    else if ( level._id_055B._id_8F2F._id_0B16._id_6F33.nearz == var_0 )
        _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );

    musicstop( var_3, var_0 );
}

_id_8657( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    ambientstop( var_1 );
}

_id_8659( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_8697( level._id_055B._id_8F2F._id_5FFB._id_24CA );
    _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );
    musicstop( var_1 );
}

_id_8654( var_0 )
{
    var_1 = 0.009;

    if ( var_0.size == 1 )
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0[0]._id_09D6, var_0[0]._id_9F37, var_0[0]._id_35D9 );
    else if ( var_0.size == 2 )
    {
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_6F33, var_0[0]._id_09D6, var_0[0]._id_9F37, var_0[0]._id_35D9 );
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0[1]._id_09D6, var_0[1]._id_9F37, var_0[1]._id_35D9 );
    }

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6]._id_09D6;
        var_8 = max( var_0[var_6]._id_9F37, 0 );
        var_9 = clamp( var_0[var_6]._id_35D9, 0, 1 );

        if ( var_7 != "none" )
        {
            if ( !soundexists( var_7 ) )
                continue;

            if ( var_8 < var_1 )
            {
                ambientstop( var_9, var_7 );
                continue;
            }

            ambientplay( var_7, var_9, var_8, 0 );
        }
    }
}

_id_8651()
{
    return level._id_055B._id_8F2F._id_0B16._id_24CA.nearz;
}

_id_8652()
{
    return level._id_055B._id_8F2F._id_5FFB._id_24CA.nearz;
}

_id_8699( var_0, var_1, var_2, var_3 )
{
    var_0.nearz = var_1;
    var_0._id_9F37 = var_2;
    var_0._id_35D9 = var_3;
}

_id_8698()
{
    var_0 = spawnstruct();
    var_0.nearz = "";
    var_0._id_9F37 = 0.0;
    var_0._id_35D9 = 0.0;
    return var_0;
}

_id_8697( var_0 )
{
    var_0.nearz = "";
    var_0._id_9F37 = 0.0;
    var_0._id_35D9 = 0.0;
}
