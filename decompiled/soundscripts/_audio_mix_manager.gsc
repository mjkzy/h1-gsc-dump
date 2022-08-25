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

_id_5CFA()
{
    if ( !isdefined( level._audio ) )
        level._audio = spawnstruct();

    if ( !isdefined( level._audio._id_5CE8 ) )
        level._audio._id_5CE8 = spawnstruct();

    level._audio._id_5CE8._id_24D1 = undefined;
    level._audio._id_5CE8._id_A3F3 = [];
}

_id_5D00( var_0, var_1 )
{
    if ( !isdefined( level._audio._id_5CE8._id_24D1 ) || var_0 != level._audio._id_5CE8._id_24D1 )
    {
        clearallsubmixes( 0.0 );

        if ( isdefined( var_1 ) )
            addsoundsubmix( var_0, var_1 );
        else
            addsoundsubmix( var_0 );

        level._audio._id_5CE8._id_24D1 = var_0;
    }
}

_id_5D01( var_0 )
{
    foreach ( var_2 in level._audio._id_5CE8._id_A3F3 )
    {
        if ( var_0 != var_2 )
        {
            makesoundsubmixunsticky( var_2 );
            clearsoundsubmix( var_2, 1.0 );
            level._audio._id_5CE8._id_A3F3[var_2] = undefined;
        }
    }

    _id_5D02( var_0 );
}

_id_5CF9( var_0, var_1 )
{
    var_2 = 1.0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( !isdefined( var_0 ) )
    {
        foreach ( var_0 in level._audio._id_5CE8._id_A3F3 )
        {
            makesoundsubmixunsticky( var_0 );
            clearsoundsubmix( var_0, var_2 );
            level._audio._id_5CE8._id_A3F3[var_0] = undefined;
        }
    }
    else if ( isdefined( level._audio._id_5CE8._id_A3F3[var_0] ) )
    {
        makesoundsubmixunsticky( var_0 );
        clearsoundsubmix( var_0, var_2 );
        level._audio._id_5CE8._id_A3F3[var_0] = undefined;
    }
}

_id_5CF4( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        if ( var_1 == 0 )
            _id_5CF9( var_0, 0.0 );
        else
        {
            _id_5D02( var_0 );
            blendsoundsubmix( var_0, var_1, 0.0 );
        }
    }

    if ( isdefined( var_2 ) && var_2 != "none" )
    {
        if ( var_3 == 0 )
            _id_5CF9( var_2, 0.0 );
        else
        {
            _id_5D02( var_2 );
            blendsoundsubmix( var_2, var_3, 0.0 );
        }
    }
}

_id_5CF7( var_0 )
{
    clearallsubmixes( var_0 );
    level._audio._id_5CE8._id_24D1 = undefined;
}

_id_5CFB( var_0 )
{
    makesoundsubmixsticky( var_0 );
}

_id_5CFC( var_0 )
{
    makesoundsubmixunsticky( var_0 );
}

_id_5CF2( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        addsoundsubmix( var_0, var_1 );
    else
        addsoundsubmix( var_0 );
}

_id_5CFE( var_0, var_1, var_2 )
{
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    addsoundsubmix( var_0, var_3, var_1 );
}

_id_5CF3( var_0, var_1, var_2 )
{
    var_1 = clamp( var_1, 0, 1 );
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    blendsoundsubmix( var_0, var_1, var_3 );
}

_id_5CF6( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        clearsoundsubmix( var_0, var_1 );
    else
        clearsoundsubmix( var_0 );

    if ( isdefined( level._audio._id_5CE8._id_24D1 ) && level._audio._id_5CE8._id_24D1 == var_0 )
        level._audio._id_5CE8._id_24D1 = undefined;
}

_id_5CF1( var_0, var_1, var_2 )
{
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    addsoundsubmix( var_0, var_3, 1.0, var_1 );
}

_id_5CFD( var_0, var_1 )
{
    var_2 = [];

    if ( isstring( var_0 ) )
    {
        var_2[var_2.size] = var_0;
        var_2[var_2.size] = 0.0;
    }
    else
    {
        foreach ( var_4 in var_0 )
        {
            var_2[var_2.size] = var_4;
            var_2[var_2.size] = 0.0;
        }
    }

    _id_5CF1( "mm_mute", var_2, var_1 );
}

_id_5CF8( var_0 )
{
    if ( isdefined( var_0 ) )
        clearsoundsubmix( "mm_mute", var_0 );
    else
        clearsoundsubmix( "mm_mute" );
}

_id_5CFF( var_0, var_1 )
{
    var_2 = [];
    var_2[var_2.size] = "set_all";
    var_2[var_2.size] = 0.0;

    if ( isstring( var_0 ) )
    {
        var_2[var_2.size] = var_0;
        var_2[var_2.size] = 1.0;
    }
    else
    {
        foreach ( var_4 in var_0 )
        {
            var_2[var_2.size] = var_4;
            var_2[var_2.size] = 1.0;
        }
    }

    _id_5CF1( "mm_solo", var_2, var_1 );
}

_id_5CF5( var_0 )
{
    if ( isdefined( var_0 ) )
        clearsoundsubmix( "mm_solo", var_0 );
    else
        clearsoundsubmix( "mm_solo" );
}

_id_5D02( var_0 )
{
    if ( !isdefined( level._audio._id_5CE8._id_A3F3[var_0] ) )
    {
        addsoundsubmix( var_0 );
        makesoundsubmixsticky( var_0 );
        level._audio._id_5CE8._id_A3F3[var_0] = var_0;
    }
}
