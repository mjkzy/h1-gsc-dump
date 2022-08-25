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
    precacheshader( "objpoint_default" );
    level._id_6315 = [];
    level._id_6316 = [];

    if ( level.splitscreen )
        level._id_6318 = 15;
    else
        level._id_6318 = 8;

    level._id_6314 = 0.7;
    level._id_6317 = 1.0;
}

_id_2443( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_405E( var_0 );

    if ( isdefined( var_6 ) )
        deleteobjpoint( var_6 );

    if ( !isdefined( var_3 ) )
        var_3 = "objpoint_default";

    if ( !isdefined( var_5 ) )
        var_5 = 1.0;

    if ( var_2 == "all" )
        var_6 = newhudelem();
    else if ( var_2 == "mlg" )
        var_6 = newteamhudelem( "spectator" );
    else
        var_6 = newteamhudelem( var_2 );

    var_6.name = var_0;
    var_6.x = var_1[0];
    var_6.y = var_1[1];
    var_6.z = var_1[2];
    var_6.team = var_2;
    var_6._id_5109 = 0;
    var_6._id_51A5 = 1;
    var_6 setshader( var_3, level._id_6318, level._id_6318 );
    var_6 setwaypoint( 1, 0 );

    if ( isdefined( var_4 ) )
        var_6.alpha = var_4;
    else
        var_6.alpha = level._id_6314;

    var_6.basealpha = var_6.alpha;
    var_6.index = level._id_6315.size;
    level._id_6316[var_0] = var_6;
    level._id_6315[level._id_6315.size] = var_0;
    return var_6;
}

deleteobjpoint( var_0 )
{
    if ( level._id_6316.size == 1 )
    {
        level._id_6316 = [];
        level._id_6315 = [];
        var_0 destroy();
        return;
    }

    var_1 = var_0.index;
    var_2 = level._id_6315.size - 1;
    var_3 = _id_405D( var_2 );
    level._id_6315[var_1] = var_3.name;
    var_3.index = var_1;
    level._id_6315[var_2] = undefined;
    level._id_6316[var_0.name] = undefined;
    var_0 destroy();
}

deleteallobjpoints()
{
    if ( isdefined( level._id_6316 ) && level._id_6316.size > 0 )
    {
        foreach ( var_1 in level._id_6316 )
        {
            if ( isdefined( var_1 ) )
                var_1 destroy();
        }

        level._id_6316 = [];
        level._id_6315 = [];
    }
}

_id_9B44( var_0 )
{
    if ( self.x != var_0[0] )
        self.x = var_0[0];

    if ( self.y != var_0[1] )
        self.y = var_0[1];

    if ( self.z != var_0[2] )
        self.z = var_0[2];
}

_id_7FD4( var_0, var_1 )
{
    var_2 = _id_405E( var_0 );
    var_2 _id_9B44( var_1 );
}

_id_405E( var_0 )
{
    if ( isdefined( level._id_6316[var_0] ) )
        return level._id_6316[var_0];
    else
        return undefined;
}

_id_405D( var_0 )
{
    if ( isdefined( level._id_6315[var_0] ) )
        return level._id_6316[level._id_6315[var_0]];
    else
        return undefined;
}

_id_8D18()
{
    self endon( "stop_flashing_thread" );

    if ( self._id_5109 )
        return;

    self._id_5109 = 1;

    while ( self._id_5109 )
    {
        self fadeovertime( 0.75 );
        self.alpha = 0.35 * self.basealpha;
        wait 0.75;
        self fadeovertime( 0.75 );
        self.alpha = self.basealpha;
        wait 0.75;
    }

    self.alpha = self.basealpha;
}

_id_8EE6()
{
    if ( !self._id_5109 )
        return;

    self._id_5109 = 0;
}
