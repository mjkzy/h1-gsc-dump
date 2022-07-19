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

_id_788B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = [[ var_1 ]]( var_2, var_3 );
    else
        var_4 = [[ var_1 ]]( var_2 );

    var_4 = clamp( var_4, 0, 100 );
    var_4 *= var_0;
    var_2._id_2733[var_2._id_2733.size] = var_4;
    var_2._id_93FF += 100 * var_0;
    return var_4;
}

_id_2470( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = [[ var_0 ]]( var_1, var_2 );
    else
        var_3 = [[ var_0 ]]( var_1 );

    var_3 = clamp( var_3, 0, 100 );
    var_1._id_2721[var_1._id_2721.size] = var_3;
    return var_3;
}

_id_11F5( var_0 )
{
    foreach ( var_2 in level._id_1B9C )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( distancesquared( var_0.origin, var_2.origin ) < 22500 )
            return 0;
    }

    return 100;
}

_id_11FB( var_0 )
{
    foreach ( var_2 in level._id_4407 )
    {
        if ( !isdefined( var_2 ) || !var_2 _id_5102( self ) )
            continue;

        if ( distancesquared( var_0.origin, var_2.origin ) < 122500 )
            return 0;
    }

    return 100;
}

_id_11FF( var_0 )
{
    var_1 = level._id_5C5D;

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !var_3 _id_5102( self ) )
            continue;

        if ( distancesquared( var_0.origin, var_3.origin ) < 122500 )
            return 0;
    }

    return 100;
}

_id_5102( var_0 )
{
    if ( !level.teambased || level.friendlyfire || !isdefined( var_0.team ) )
        return 1;

    if ( !isdefined( self.owner ) || !isdefined( self.owner.team ) )
        return 1;

    if ( var_0 == self.owner )
        return 1;

    var_1 = self.owner.team;
    return var_1 != var_0.team;
}

_id_11F4( var_0 )
{
    if ( !isdefined( level.artillerydangercenter ) )
        return 100;

    if ( !var_0._id_65D1 )
        return 100;

    var_1 = maps\mp\gametypes\_hardpoints::_id_3EE6( var_0.origin );

    if ( var_1 > 0 )
        return 0;

    return 100;
}

_id_11F6( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self.team );

    if ( var_0._id_222B[var_1] > 0 )
        return 0;

    return 100;
}

_id_11F9( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self.team );

    if ( var_0._id_3AE2[var_1] > 0 )
        return 0;

    return 100;
}

_id_1203( var_0 )
{
    if ( isdefined( self._id_0AB1 ) )
        return 100;

    if ( positionwouldtelefrag( var_0.origin ) )
    {
        foreach ( var_2 in var_0._id_0B03 )
        {
            if ( !positionwouldtelefrag( var_2 ) )
                break;
        }

        return 0;
    }

    return 100;
}

_id_1201( var_0 )
{
    if ( isdefined( self._id_55DD ) && self._id_55DD == var_0 )
        return 0;

    return 100;
}

_id_1200( var_0 )
{
    if ( isdefined( var_0._id_55DF ) )
    {
        var_1 = gettime() - var_0._id_55DF;

        if ( var_1 > 4000 )
            return 100;

        return var_1 / 4000 * 100;
    }

    return 100;
}

_id_11F8( var_0 )
{
    if ( isdefined( var_0._id_55DE ) && ( !level.teambased || var_0._id_55DE != self.team ) )
    {
        var_1 = var_0._id_55DF + 500;

        if ( gettime() < var_1 )
            return 0;
    }

    return 100;
}

avoidspawninzone( var_0, var_1 )
{
    var_2 = distancesquared( var_1.origin, var_0.origin );

    if ( var_2 < 692224 )
        return 0;

    return 100;
}

_id_11FE( var_0 )
{
    if ( !isdefined( self._id_5593 ) )
        return 100;

    var_1 = distancesquared( var_0.origin, self._id_5593 );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_11FD( var_0 )
{
    if ( !isdefined( self.laststand ) || !isdefined( self.laststand.origin ) )
        return 100;

    if ( !maps\mp\_utility::_id_5189( self.laststand ) )
        return 100;

    var_1 = distancesquared( var_0.origin, self.laststand.origin );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_6EEC( var_0 )
{
    if ( var_0._id_93FE[self.team] == 0 )
        return 0;

    var_1 = var_0._id_2B83[self.team] / var_0._id_93FE[self.team];
    var_1 = min( var_1, 3240000 );
    var_2 = 1 - var_1 / 3240000;
    return var_2 * 100;
}

_id_11F7( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self.team );

    if ( var_0._id_93FE[var_1] == 0 )
        return 100;

    var_2 = min( var_0._id_5C45[var_1], 3240000 );
    var_3 = var_2 / 3240000;
    return var_3 * 100;
}

avoidflagbydistance( var_0 )
{
    if ( var_0.enemyflagdist > 0 )
        var_1 = var_0.friendlyflagdist / var_0.enemyflagdist / var_0.friendlyflag.highestspawndistratio * 1.33;
    else
        var_1 = 0;

    return var_1 * 100;
}

_id_6EEE( var_0, var_1 )
{
    if ( var_1[0] && var_0.preferreddompoint == 0 )
        return 100;

    if ( var_1[1] && var_0.preferreddompoint == 1 )
        return 100;

    if ( var_1[2] && var_0.preferreddompoint == 2 )
        return 100;

    return 0;
}

_id_6EED( var_0, var_1 )
{
    if ( isdefined( var_0._id_91EA ) && var_0._id_91EA == var_1 )
        return 100;

    return 0;
}

_id_712C( var_0 )
{
    return randomintrange( 0, 99 );
}

avoidzone( var_0, var_1 )
{
    var_2 = distancesquared( var_1.origin, var_0.origin );
    var_3 = var_2 - 692224;
    var_4 = 6067776;
    var_5 = 1867776;

    if ( var_3 >= var_5 )
        return 100 * ( 1.0 - 0.25 * ( var_3 - var_5 ) / ( var_4 - var_5 ) );
    else if ( var_3 > 0 )
        return 100.0 * var_3 / var_5;
    else
        return 0;
}

_id_6EF0( var_0 )
{
    var_1 = self.team;
    var_2 = maps\mp\_utility::getotherteam( var_1 );

    if ( var_0._id_606E[var_1] == 0 )
        return 0;

    if ( var_0._id_606E[var_2] == 0 )
        return 100;

    var_3 = var_0._id_606E[var_1] - var_0._id_606E[var_2];

    if ( var_3 <= 0 )
        return 0;

    if ( var_3 == 1 )
        return 50.0;

    if ( var_3 >= 2 )
        return 75.0;

    return 0;
}
