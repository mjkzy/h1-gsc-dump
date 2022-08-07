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

main( var_0, var_1 )
{
    thread _id_7EE9( self, var_0, var_1 );
}

_id_8ED0( var_0, var_1, var_2 )
{
    var_1 waittill( "death" );

    if ( !isdefined( var_0 ) )
        return;

    if ( isremovedentity( var_0 ) )
        return;

    var_0 setmode( "manual" );
    var_0 cleartargetentity();
    var_0 stopfiring();
}

_id_52D8( var_0, var_1 )
{
    var_1 endon( "death" );

    for (;;)
    {
        var_2 = var_0 gettagangles( "tag_aim_pivot" );
        var_1 _meth_8193( "face angle", var_2[1] );
        wait 0.05;
    }
}

_id_7EE9( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_0 endon( "death" );
    var_0 setmode( "auto_nonai" );
    var_1 linkto( var_0, var_2._id_85AE, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread _id_8ED0( var_0, var_1, var_2 );
    thread _id_52D8( var_0, var_1 );
    var_3 = var_0 gettagorigin( var_2._id_85AE );
    var_4 = var_0 gettagangles( var_2._id_85AE );

    for (;;)
        var_0 maps\_vehicle_aianim::_id_0C74( var_1, var_2._id_85AE, var_2._id_4B63 );
}
