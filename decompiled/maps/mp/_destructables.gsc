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

init()
{
    var_0 = getentarray( "destructable", "targetname" );

    if ( getdvar( "scr_destructables" ) == "0" )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] delete();
    }
    else
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] thread _id_28F8();
    }
}

_id_28F8()
{
    var_0 = 40;
    var_1 = 0;

    if ( isdefined( self.script_accumulate ) )
        var_0 = self.script_accumulate;

    if ( isdefined( self.script_threshold ) )
        var_1 = self.script_threshold;

    if ( isdefined( self.script_destructable_area ) )
    {
        var_2 = strtok( self.script_destructable_area, " " );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            _id_14B1( var_2[var_3] );
    }

    if ( isdefined( self.script_fxid ) )
        self.fx = loadfx( self.script_fxid );

    var_4 = 0;
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6 );

        if ( var_5 >= var_1 )
        {
            var_4 += var_5;

            if ( var_4 >= var_0 )
            {
                thread _id_28F7();
                return;
            }
        }
    }
}

_id_28F7()
{
    var_0 = self;

    if ( isdefined( self.script_destructable_area ) )
    {
        var_1 = strtok( self.script_destructable_area, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            _id_99FC( var_1[var_2] );
    }

    if ( isdefined( var_0.fx ) )
        playfx( var_0.fx, var_0.origin + ( 0.0, 0.0, 6.0 ) );

    var_0 delete();
}

_id_14B1( var_0 )
{

}

_id_14B2( var_0, var_1 )
{

}

_id_99FC( var_0 )
{

}

_id_99FD( var_0, var_1 )
{

}
