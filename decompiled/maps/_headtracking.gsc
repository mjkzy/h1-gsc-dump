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

player_head_tracking()
{
    self endon( "head_tracking_end" );
    self endon( "death" );
    self.player_head_tracking = 1;
    self.head_track_debug = self.nearz;

    for (;;)
    {
        wait 0.2;

        if ( distance( self.origin, level.playercardbackground.origin ) <= 200 && maps\_utility::_id_6B91( self.origin ) )
        {
            self _meth_81ba( 60, 60, randomfloatrange( 0.5, 2.0 ) );
            self _meth_8202( level.playercardbackground, 1, randomint( 5 ) == 0 );
            maps\_utility::waitspread( 5, 7 );
            self _meth_8203( 1 );
            maps\_utility::waitspread( 5, 7 );
        }
    }
}

head_tracking_end( var_0, var_1 )
{
    self notify( "head_tracking_end" );
    self.player_head_tracking = 0;
    var_2 = isdefined( var_1 ) && var_1;

    if ( isdefined( var_0 ) && var_0 )
        self _meth_8202();
    else
        self _meth_8203( 1, var_2 );
}
